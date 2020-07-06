Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 481C9215933
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 16:14:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0ncQ5hZVzDqZR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 00:13:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0nWv4bxvzDqY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 00:10:02 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 066E1JbG097892; Mon, 6 Jul 2020 10:09:55 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 322kcxfccw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 10:09:55 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 066DuIZS024588;
 Mon, 6 Jul 2020 14:09:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 322hd7tca5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jul 2020 14:09:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 066E8UwK50725134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jul 2020 14:08:30 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E32442045;
 Mon,  6 Jul 2020 14:09:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48B4742047;
 Mon,  6 Jul 2020 14:09:50 +0000 (GMT)
Received: from [9.85.98.83] (unknown [9.85.98.83])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jul 2020 14:09:50 +0000 (GMT)
Subject: Re: [PATCH v5 13/26] powerpc/book3s64/pkeys: Enable MMU_FTR_PKEY
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-14-aneesh.kumar@linux.ibm.com>
 <878sfw6b7v.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <cddb4987-860f-f4be-43b0-f164031f9f6a@linux.ibm.com>
Date: Mon, 6 Jul 2020 19:39:49 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <878sfw6b7v.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-06_11:2020-07-06,
 2020-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=2
 spamscore=0 cotscore=-2147483648 mlxlogscore=999 mlxscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007060105
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxram@us.ibm.com, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/20 6:40 PM, Michael Ellerman wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>> Parse storage keys related device tree entry in early_init_devtree
>> and enable MMU feature MMU_FTR_PKEY if pkeys are supported.
>>
>> MMU feature is used instead of CPU feature because this enables us
>> to group MMU_FTR_KUAP and MMU_FTR_PKEY in asm feature fixup code.
> 
> Subject should probably be "Add MMU_FTR_PKEY".
> 
>> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
>> index f4ac25d4df05..72966d3d8f64 100644
>> --- a/arch/powerpc/include/asm/mmu.h
>> +++ b/arch/powerpc/include/asm/mmu.h
>> @@ -23,6 +23,7 @@
>>   
>>   /* Radix page table supported and enabled */
>>   #define MMU_FTR_TYPE_RADIX		ASM_CONST(0x00000040)
>> +#define MMU_FTR_PKEY			ASM_CONST(0x00000080)
> 
> It's not a type, so it should be with the individual feature bits below:
> 


We don't have free bit in the other group. For now i will move this to

modified   arch/powerpc/include/asm/mmu.h
@@ -23,12 +23,15 @@

  /* Radix page table supported and enabled */
  #define MMU_FTR_TYPE_RADIX		ASM_CONST(0x00000040)
-#define MMU_FTR_PKEY			ASM_CONST(0x00000080)

  /*
   * Individual features below.
   */

+/*
+ * Support for memory protection keys.
+ */
+#define MMU_FTR_PKEY			ASM_CONST(0x00001000)
  /*
   * Support for 68 bit VA space. We added that from ISA 2.05
   */



>>   /*
>>    * Individual features below.
> 
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 6a3bac357e24..6d70797352d8 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -815,6 +815,11 @@ void __init early_init_devtree(void *params)
>>   	/* Now try to figure out if we are running on LPAR and so on */
>>   	pseries_probe_fw_features();
>>   
>> +	/*
>> +	 * Initialize pkey features and default AMR/IAMR values
>> +	 */
>> +	pkey_early_init_devtree();
> 
> Not your fault, but the fact that we're having to do more and more
> initialisation this early, based on the flat device tree, makes me
> wonder if we need to rethink how we're doing the CPU/MMU feature setup.
> 
>> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
>> index 0ff59acdbb84..bbba9c601e14 100644
>> --- a/arch/powerpc/mm/book3s64/pkeys.c
>> +++ b/arch/powerpc/mm/book3s64/pkeys.c
>> @@ -38,38 +39,45 @@ static int execute_only_key = 2;
>>   #define PKEY_REG_BITS (sizeof(u64) * 8)
>>   #define pkeyshift(pkey) (PKEY_REG_BITS - ((pkey+1) * AMR_BITS_PER_PKEY))
>>   
>> +static int __init dt_scan_storage_keys(unsigned long node,
>> +				       const char *uname, int depth,
>> +				       void *data)
>> +{
>> +	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
>> +	const __be32 *prop;
>> +	int pkeys_total;
>> +
>> +	/* We are scanning "cpu" nodes only */
>> +	if (type == NULL || strcmp(type, "cpu") != 0)
>> +		return 0;
>> +
>> +	prop = of_get_flat_dt_prop(node, "ibm,processor-storage-keys", NULL);
>> +	if (!prop)
>> +		return 0;
>> +	pkeys_total = be32_to_cpu(prop[0]);
>> +	return pkeys_total;
> 
> That's not really the way the return value is meant to be used for these
> scanning functions.
> 
> The usual return values are 0 to keep scanning and !0 means we've found
> the node we're looking for and we should stop scanning.
> 
> Doing it this way means if you find 0 pkeys it will keep scanning.
> 
> Instead you should pass &pkeys_total as the data pointer and set that.
> 
>> +}
>> +


done

modified   arch/powerpc/mm/book3s64/pkeys.c
@@ -52,7 +52,7 @@ static int __init dt_scan_storage_keys(unsigned long node,
  {
  	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
  	const __be32 *prop;
-	int pkeys_total;
+	int *pkeys_total = (int *) data;

  	/* We are scanning "cpu" nodes only */
  	if (type == NULL || strcmp(type, "cpu") != 0)
@@ -61,12 +61,13 @@ static int __init dt_scan_storage_keys(unsigned long 
node,
  	prop = of_get_flat_dt_prop(node, "ibm,processor-storage-keys", NULL);
  	if (!prop)
  		return 0;
-	pkeys_total = be32_to_cpu(prop[0]);
-	return pkeys_total;
+	*pkeys_total = be32_to_cpu(prop[0]);
+	return 1;
  }

  static int scan_pkey_feature(void)
  {
+	int ret;
  	int pkeys_total;

  	/*
@@ -75,8 +76,8 @@ static int scan_pkey_feature(void)
  	if (early_radix_enabled())
  		return 0;

-	pkeys_total = of_scan_flat_dt(dt_scan_storage_keys, NULL);
-	if (pkeys_total == 0) {
+	ret = of_scan_flat_dt(dt_scan_storage_keys, &pkeys_total);
+	if (ret == 0) {

  		/*
  		 * Let's assume 32 pkeys on P8/P9 bare metal, if its not defined by 
device
@@ -87,7 +88,6 @@ static int scan_pkey_feature(void)
  		    (early_cpu_has_feature(CPU_FTR_ARCH_207S) ||
  		     early_cpu_has_feature(CPU_FTR_ARCH_300)))
  			pkeys_total = 32;
-
  	}

  	/*


>>   static int scan_pkey_feature(void)
>>   {
>> -	u32 vals[2];
>> -	int pkeys_total = 0;
>> -	struct device_node *cpu;
>> +	int pkeys_total;
>>   
>>   	/*
>>   	 * Pkey is not supported with Radix translation.
>>   	 */
>> -	if (radix_enabled())
>> +	if (early_radix_enabled())
>>   		return 0;
>>   
>> -	cpu = of_find_node_by_type(NULL, "cpu");
>> -	if (!cpu)
>> -		return 0;
>> +	pkeys_total = of_scan_flat_dt(dt_scan_storage_keys, NULL);
>> +	if (pkeys_total == 0) {
>>   
>> -	if (of_property_read_u32_array(cpu,
>> -				       "ibm,processor-storage-keys", vals, 2) == 0) {
>> -		/*
>> -		 * Since any pkey can be used for data or execute, we will
>> -		 * just treat all keys as equal and track them as one entity.
>> -		 */
>> -		pkeys_total = vals[0];
>> -		/*  Should we check for IAMR support FIXME!! */
> 
> ???

The device tree allows us to have different count for both AMR and IAMR.
The current code skip that. I guess i added a comment in earlier patch 
to check that whether we need to handle different AMR and IAMR counts. 
The same comment get dropped here.


> 
>> -	} else {
> 
> This loses the ability to differentiate between no storage-keys property
> at all vs a property that specifies zero keys, which I don't think is a
> good change.
> 
>>   		/*
>>   		 * Let's assume 32 pkeys on P8 bare metal, if its not defined by device
>>   		 * tree. We make this exception since skiboot forgot to expose this
>>   		 * property on power8.
>>   		 */
>>   		if (!firmware_has_feature(FW_FEATURE_LPAR) &&
>> -		    cpu_has_feature(CPU_FTRS_POWER8))
>> +		    early_cpu_has_feature(CPU_FTRS_POWER8))
>>   			pkeys_total = 32;
> 
> That's not how cpu_has_feature() works, we'll need to fix that.
> 
> cheers
> 

I did a separate patch to handle that which switch the above to

		/*
		 * Let's assume 32 pkeys on P8/P9 bare metal, if its not defined by device
		 * tree. We make this exception since skiboot forgot to expose this
		 * property on power8/9.
		 */
		if (!firmware_has_feature(FW_FEATURE_LPAR) &&
		    (early_cpu_has_feature(CPU_FTR_ARCH_207S) ||
		     early_cpu_has_feature(CPU_FTR_ARCH_300)))
			pkeys_total = 32;
	
