SELECT VMNAME,
		MAX(CASE WHEN FNAME='VM Role' THEN FIELDVALUE END) AS VM_ROLE,
		MAX(CASE WHEN FNAME='Contact' THEN FIELDVALUE END) AS CONTACT,
		MAX(CASE WHEN FNAME='PM Contact' THEN FIELDVALUE END) AS PM_CONTACT,
		MAX(CASE WHEN FNAME='Software' THEN FIELDVALUE END) AS SOFTWARE, 
		MAX(CASE WHEN FNAME='Project' THEN FIELDVALUE END) AS PROJECT  
FROM ( 	
	SELECT v.[NAME] as [VMNAME],
			d.[NAME] as [FNAME],
			f.[FIELDVALUE]
	FROM [vCenter1].[dbo].[VPXV_VM_FIELDS] f left join [vCenter1].[dbo].[VPXV_VMS] v on [f].[VMID] = [v].[VMID] left join [vCenter1].[dbo].[VPXV_FIELDS] d on f.[FIELDID] = d.[FIELDID]) a 
	GROUP BY VMNAME 
