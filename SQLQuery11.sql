SELECT TOP (1000) 
	sm.[entity_id] AS [meta_entity_id],
    s.[state_id],
    s.[entity_id],
    s.[state],
    s.[attributes],
    s.[event_id],
    s.[last_changed],
    s.[last_changed_ts],
    s.[last_reported_ts],
    s.[last_updated],
    s.[last_updated_ts],
    s.[old_state_id],
    s.[attributes_id],
    s.[context_id],
    s.[context_user_id],
    s.[context_parent_id],
    s.[origin_idx],
    s.[context_id_bin],
    s.[context_user_id_bin],
    s.[context_parent_id_bin],
    s.[metadata_id]
FROM 
    [weatherstation].[dbo].[states] s
JOIN 
    [weatherstation].[dbo].[states_meta] sm
    ON s.[metadata_id] = sm.[metadata_id]