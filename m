Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E2A7EC204
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 13:17:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6ePzITb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVhxg3xGPz3cQj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 23:17:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=S6ePzITb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVhwp3X5jz2xpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 23:16:42 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFCGJZr010266
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 12:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hDE/VhpY8s9BaFiX3hwOsVJUpd2qDPbKmWtszRR8mp0=;
 b=S6ePzITbKMx7hkbwcA9LrwOOdU4N2HOFFDTBDYsYTIRJf1zWtTxuSimqSBnMrvADRYDw
 E4lue9OP8sQzbJy4p9E3++i8s2XbjDuJiBprPMbcD9DSYpWfAhP236fuNmLBhVpae2Q2
 JmKCJlDBLN9sRWGjg6ssHPYJIFDJhYFI0ZeczWPA/gcybawalz5yaLqV91raJYH1esim
 b1lrwNf2+o6mUJlcQKc6EqmY6dKtklrLQfD274mMx1bXU8alZJZFW2Ud/PJNVl4k9u9w
 vknjps+yiX1YhP3q5LpXUOicrZeCQMT5GznLjaGdcLgafPjbRM8LglbQhLnC/ylnbZLW 9A== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ucwub00av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 12:16:37 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFAiLdg023945
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 12:16:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uamayf7aq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 12:16:37 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AFCGYZP52167026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 12:16:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0869420040;
	Wed, 15 Nov 2023 12:16:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EF5820043;
	Wed, 15 Nov 2023 12:16:33 +0000 (GMT)
Received: from [9.43.109.250] (unknown [9.43.109.250])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Nov 2023 12:16:33 +0000 (GMT)
Message-ID: <c3594f58-c7a4-4265-a38e-c97b08169b61@linux.ibm.com>
Date: Wed, 15 Nov 2023 17:46:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to supported
 configurations
Content-Language: en-US
To: Vishal Chourasia <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
 <87sf57zbcd.fsf@linux.ibm.com>
 <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SM_rwIk9odG3n5T834vRmwXLMV6QSUti
X-Proofpoint-GUID: SM_rwIk9odG3n5T834vRmwXLMV6QSUti
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_10,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=914 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150094
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/15/23 5:23 PM, Vishal Chourasia wrote:
> 
> On 15/11/23 1:39 pm, Aneesh Kumar K.V wrote:
>> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>>
>>> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure that it
>>> correctly depends on these PowerPC configurations being enabled. As a result,
>>> it prevents the HOTPLUG_CPU from being selected when the required dependencies
>>> are not satisfied.
>>>
>>> This change aligns the dependency tree with the expected hardware support for
>>> CPU hot-plugging under PowerPC architectures, ensuring that the kernel
>>> configuration steps do not lead to inconsistent states.
>>>
>>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>> ---
>>> During the configuration process with 'make randconfig' followed by
>>> 'make olddefconfig', we observed a warning indicating an unmet direct
>>> dependency for the HOTPLUG_CPU option. The dependency in question relates to
>>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>>> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
>>> This misalignment in dependencies could potentially lead to inconsistent kernel
>>> configuration states, especially when considering the necessary hardware
>>> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
>>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
>>> appropriate PowerPC configurations being active.
>>>
>>> steps to reproduce (before applying the patch):
>>>
>>> Run 'make pseries_le_defconfig'
>>> Run 'make menuconfig'
>>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
>>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
>>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
>>> Enable SMP [ Processor support -> Symmetric multi-processing support ]
>>> Save the config
>>> Run 'make olddefconfig'
>>>
>>>  arch/powerpc/Kconfig | 5 +++--
>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 6f105ee4f3cf..bf99ff9869f6 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>>>  	  Used to allow a board to specify it wants a uImage built by default
>>>  
>>>  config ARCH_HIBERNATION_POSSIBLE
>>> -	bool
>>> -	default y
>>> +	def_bool y
>>> +	depends on PPC_PSERIES || \
>>> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>>>  
>>>  config ARCH_SUSPEND_POSSIBLE
>>>  	def_bool y
>>>
>> I am wondering whether it should be switched to using select from
>> config PPC? 
> 
> selecting ARCH_HIBERNATION_POSSIBLE based on value of config PPC
> will not guarantee config PPC_PSERIES being set
> 
> PPC_PSERIES can be set to N, even when config PPC is set.
> 
> grep -A 5 -i "config ppc_pseries" arch/powerpc/platforms/pseries/Kconfig
> config PPC_PSERIES
>         depends on PPC64 && PPC_BOOK3S
>         bool "IBM pSeries & new (POWER5-based) iSeries"
>         select HAVE_PCSPKR_PLATFORM
>         select MPIC
>         select OF_DYNAMIC
> 

modified   arch/powerpc/Kconfig
@@ -156,6 +156,7 @@ config PPC
 	select ARCH_HAS_UACCESS_FLUSHCACHE
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
+	select ARCH_HIBERNATION_POSSIBLE	if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
 	select ARCH_KEEP_MEMBLOCK
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
 	select ARCH_MIGHT_HAVE_PC_PARPORT


-aneesh
