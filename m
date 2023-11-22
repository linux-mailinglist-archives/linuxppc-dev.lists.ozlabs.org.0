Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D85B97F42D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:52:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDcfro9n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZxNh56PWz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 20:52:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDcfro9n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZxMr0M10z3cJN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 20:51:19 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM9lhLp029080;
	Wed, 22 Nov 2023 09:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=QtNuCkWKKLiEAlGKkqXg1+0e/W6/gIROFCHbFVe8elo=;
 b=dDcfro9nyipVWxCFOOJtLBcjQm5itbrw/tXQJowFKCpJJzOjeyJrzginYRAEf4kzzl9h
 dK9kLHJ3UGS64Rn5cFKC8dHKZEj9pevDVf/iRVeEcj2WVid6UEBLuUGoB3TIE2x4IDhD
 jkBvf/ozGdTbHWZBtCYxmNKJ+R64SBJBSoICC3+d9fdCq6BK2IPt4deaFkTgAqcV/Wa4
 IC+schfGvIKgpoFvLoHDPI6jIi5hVBHvdQiM++/coKQjz3MLIrBjJ5VeG+zOBkhJ3Tf8
 ha+BnyH/bW8GVP03hK7iWeLPtCeXX+RQXs5pcujRE+gcmPOVHr3NFjCkynDSeNRUiABu PA== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uhfatg2g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:51:07 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AM9nJpG009464;
	Wed, 22 Nov 2023 09:51:07 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uf7kt7a46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 09:51:07 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AM9p6xE27984590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Nov 2023 09:51:06 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 757F058063;
	Wed, 22 Nov 2023 09:51:06 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81F255804B;
	Wed, 22 Nov 2023 09:51:04 +0000 (GMT)
Received: from [9.171.5.81] (unknown [9.171.5.81])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Nov 2023 09:51:04 +0000 (GMT)
Message-ID: <552cbbea-4c12-4dd5-85da-afbcdd5ca73e@linux.ibm.com>
Date: Wed, 22 Nov 2023 15:21:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Adjust config HOTPLUG_CPU dependency
Content-Language: en-US
To: Aneesh Kumar K V <aneesh.kumar@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20231122092303.223719-1-vishalc@linux.ibm.com>
 <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WHpzX9J5oX9AJ9URYyzVx2tMIr-oACpV
X-Proofpoint-ORIG-GUID: WHpzX9J5oX9AJ9URYyzVx2tMIr-oACpV
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_06,2023-11-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311220068
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
Cc: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 22/11/23 3:03 pm, Aneesh Kumar K V wrote:
> On 11/22/23 2:53 PM, Vishal Chourasia wrote:
>> Changed HOTPLUG_CPU dependency to SMP and either ARCH_HIBERNATION_POSSIBLE or
>> ARCH_SUSPEND_POSSIBLE, aligning with systems' suspend/hibernation capabilities.
>> This update links CPU hotplugging more logically with platforms' capabilities.
>>
>> Other changes include
>>
>> 1. configs ARCH_HIBERNATION_POSSIBLE and ARCH_SUSPEND_POSSIBLE are now selected
>>    only if required platform dependencies are met.
>>
>> 2. Defaults for configs ARCH_HIBERNATION_POSSIBLE and
>>    ARCH_SUSPEND_POSSIBLE has been set to 'N'
>>
>> Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Suggested-by: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>
>> v1: https://lore.kernel.org/all/20231114082046.6018-1-vishalc@linux.ibm.com
>> ---
>> During the configuration process with 'make randconfig' followed by
>> 'make olddefconfig', we observed a warning indicating an unmet direct
>> dependency for the HOTPLUG_CPU option. The dependency in question relates to
>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
>> This misalignment in dependencies could potentially lead to inconsistent kernel
>> configuration states, especially when considering the necessary hardware
>> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
>> appropriate PowerPC configurations being active.
>>
>> steps to reproduce (before applying the patch):
>>
>> Run 'make pseries_le_defconfig'
>> Run 'make menuconfig'
>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
>> Enable SMP [ Processor support -> Symmetric multi-processing support ]
>> Save the config
>> Run 'make olddefconfig'
>>
>>  arch/powerpc/Kconfig | 13 +++++--------
>>  1 file changed, 5 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 6f105ee4f3cf..6e7e9af2f0c1 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -155,6 +155,8 @@ config PPC
>>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>> +	select ARCH_HIBERNATION_POSSIBLE        if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
>> +	select ARCH_SUSPEND_POSSIBLE            if (ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES || 44x || 40x)
> We should keep that sorted as explained in comment around that. 
Sure. I will send out another patch
>
>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>  	select ARCH_KEEP_MEMBLOCK
>>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>> @@ -380,14 +382,10 @@ config DEFAULT_UIMAGE
>>  	  Used to allow a board to specify it wants a uImage built by default
>>  
>>  config ARCH_HIBERNATION_POSSIBLE
>> -	bool
>> -	default y
>> +	def_bool n
>
> We should be able to keep this 
> config ARCH_HIBERNATION_POSSIBLE
>     bool
>
>
> That is how we have rest of the ARCH_* config. I am not sure we need to explicitly say "def_bool n" 
I believed it improves readability, that all. I can revert it back.
>
>>  
>>  config ARCH_SUSPEND_POSSIBLE
>> -	def_bool y
>> -	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
>> -		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
>> -		   || 44x || 40x
>> +	def_bool n
>>  
>>  config ARCH_SUSPEND_NONZERO_CPU
>>  	def_bool y
>> @@ -568,8 +566,7 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>>  
>>  config HOTPLUG_CPU
>>  	bool "Support for enabling/disabling CPUs"
>> -	depends on SMP && (PPC_PSERIES || \
>> -		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
>> +	depends on SMP && (ARCH_HIBERNATION_POSSIBLE || ARCH_SUSPEND_POSSIBLE)
>>  	help
>>  	  Say Y here to be able to disable and re-enable individual
>>  	  CPUs at runtime on SMP machines.
