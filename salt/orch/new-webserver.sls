# 1. set role on minion
set-new-minion-role:
  salt.function:
    - name: grains.append
    - tgt: {{ pillar['target-minion'] }}
    - arg:
      - roles
      - hwaas-web

# 2. run state.apply on minion
apply-states-on-new-minion:
  salt.state:
    - tgt: {{ pillar['target-minion'] }}
    - sls: hwaas-service
    - require:
      - salt: set-new-minion-role

# 3. run saltutil.refresh_pillar on minion
refresh-pillar-on-new-minion:
  salt.function:
    - name: saltutil.refresh_pillar
    - tgt: {{ pillar['target-minion'] }}
    - require:
      - salt: apply-states-on-new-minion

# 4. run mine.update on the minion
update-mine-data-from-new-minion:
  salt.function:
    - name: mine.update
    - tgt: {{ pillar['target-minion'] }}
    - require:
      - salt: refresh-pillar-on-new-minion

# 5. run state.apply on the load balancer
run-state-apply-on-load-balancer:
  salt.state:
    - tgt: 'roles:load-balancing'
    - tgt_type: grain
    - sls: load-balance
    - require:
      - salt: update-mine-data-from-new-minion
