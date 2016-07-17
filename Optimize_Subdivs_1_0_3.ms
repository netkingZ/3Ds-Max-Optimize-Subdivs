try ( closeRolloutFloater RolloutFloterTemplate) catch()

rollout RolloutTemplate "Optimize Subdivs vRay Material"
	(
		global MtlArray = getclassinstances vraymtl
		global MtlCount = MtlArray.count
		
		spinner spnNbIter1 "Subdivs:" pos:[0,0] width:150 height:16 range:[1,1000000,1] type:#integer enabled:true	
		
		button subDivsButton "[Reflect] Optimize All Subdivs" width:170 height:30 pos:[0,20]
		on subDivsButton pressed do
		(
			
			if MtlCount != 0 then
				(
					for i in 1 to MtlCount do 
						(
						
							local subdivsNum = spnNbIter1.value
							MtlArray[i].reflection_subdivs = subdivsNum
						)
				)

		)	

		spinner spnNbIter2 "Subdivs:" pos:[0,55] width:150 height:16 range:[1,1000000,1] type:#integer enabled:true	
		
		button subDivsRefracButton "[Refract] Optimize All Subdivs" width:170 height:30 pos:[0,75]
		on subDivsRefracButton pressed do
		(
			
			if MtlCount != 0 then
				(
					for i in 1 to MtlCount do 
						(
						
							local subdivsNum2 = spnNbIter2.value
							MtlArray[i].refraction_subdivs = subdivsNum2
						)
				)

		)	
	)
	
rollout RolloutTemplateLast "About"
	(
		label space " "
		label title1 "Eduardo - netkingZ - B." 
		label title2 "bartali.eduardo@gmail.com"
		label space2 " "
	)
	
	RolloutFloterTemplate = newrolloutfloater "Optimize Subdivs" 175 160
	addrollout RolloutTemplate RolloutFloterTemplate
	addrollout RolloutTemplateLast RolloutFloterTemplate rolledUp:true
