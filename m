Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8075A7EDD11
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 09:44:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYTvlUsT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWD9M2v1Sz3clc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 19:44:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XYTvlUsT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWD8V3fbHz3c8L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 19:43:37 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG8ZBfr018649
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 08:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=edH2+pCgq1yMNNGYxwScgyXXP5OsKe4/ygtHfiSJn5k=;
 b=XYTvlUsT1oR8Xje2dsKSR0nymElUc0AfU9ytMIdrQCOkKKXZiPxR8PB9SwXOqSiROdWz
 xybKtHa7eBJSJpew9qLuPhVb0LKDGAD6HCPPF5Gth76trt30G0IXqqRvnKSKj0Pz4xJR
 d2wl6hjXRwl2f2x8GpBGkeo54uaOo7LsIZy+OmscVrZfCThFlaRok+s+PqDFAXZlr1qE
 H7mTKhmTYT9kqmh4Y3JPeNyJQbV7JsRIai7BJT0r/OIiDI6Uia8n4BPXhk1GALoOgpiX
 ox/hxz07b5jy8PrC8UIjpGpw6lBq2PWFu32HsS3xIktYzAcRUiZixMHG8O2zYLt+1kEF UA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3udf9r8wg8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 08:43:32 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG8XjKF000467
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 08:43:31 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uanekwabd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 08:43:31 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AG8hUFn49611046
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Nov 2023 08:43:31 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCC9558055;
	Thu, 16 Nov 2023 08:43:30 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 066C458043;
	Thu, 16 Nov 2023 08:43:30 +0000 (GMT)
Received: from [9.204.201.194] (unknown [9.204.201.194])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Nov 2023 08:43:29 +0000 (GMT)
Message-ID: <b7600012-0e7e-4b25-8d8c-1bffcc9c1461@linux.ibm.com>
Date: Thu, 16 Nov 2023 14:13:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to supported
 configurations
Content-Language: en-US
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
 <87sf57zbcd.fsf@linux.ibm.com>
 <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
 <c3594f58-c7a4-4265-a38e-c97b08169b61@linux.ibm.com>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <c3594f58-c7a4-4265-a38e-c97b08169b61@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9m4QZrwbRGgmrz1T8PQoUix3Y1JPBJuj
X-Proofpoint-ORIG-GUID: 9m4QZrwbRGgmrz1T8PQoUix3Y1JPBJuj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_06,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=934 phishscore=0 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160069
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


On 15/11/23 5:46 pm, Aneesh Kumar K V wrote:
> On 11/15/23 5:23 PM, Vishal Chourasia wrote:
>> On 15/11/23 1:39 pm, Aneesh Kumar K.V wrote:
>>> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>>>
>>>> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure that it
>>>> correctly depends on these PowerPC configurations being enabled. As a result,
>>>> it prevents the HOTPLUG_CPU from being selected when the required dependencies
>>>> are not satisfied.
>>>>
>>>> This change aligns the dependency tree with the expected hardware support for
>>>> CPU hot-plugging under PowerPC architectures, ensuring that the kernel
>>>> configuration steps do not lead to inconsistent states.
>>>>
>>>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>>> ---
>>>> During the configuration process with 'make randconfig' followed by
>>>> 'make olddefconfig', we observed a warning indicating an unmet direct
>>>> dependency for the HOTPLUG_CPU option. The dependency in question relates to
>>>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>>>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>>>> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
>>>> This misalignment in dependencies could potentially lead to inconsistent kernel
>>>> configuration states, especially when considering the necessary hardware
>>>> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
>>>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
>>>> appropriate PowerPC configurations being active.
>>>>
>>>> steps to reproduce (before applying the patch):
>>>>
>>>> Run 'make pseries_le_defconfig'
>>>> Run 'make menuconfig'
>>>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
>>>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
>>>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
>>>> Enable SMP [ Processor support -> Symmetric multi-processing support ]
>>>> Save the config
>>>> Run 'make olddefconfig'
>>>>
>>>>  arch/powerpc/Kconfig | 5 +++--
>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index 6f105ee4f3cf..bf99ff9869f6 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>>>>  	  Used to allow a board to specify it wants a uImage built by default
>>>>  
>>>>  config ARCH_HIBERNATION_POSSIBLE
>>>> -	bool
>>>> -	default y
>>>> +	def_bool y
>>>> +	depends on PPC_PSERIES || \
>>>> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>>>>  
>>>>  config ARCH_SUSPEND_POSSIBLE
>>>>  	def_bool y
>>>>
>>> I am wondering whether it should be switched to using select from
>>> config PPC? 
>>>
>>> selecting ARCH_HIBERNATION_POSSIBLE based on value of config PPC
>>> will not guarantee config PPC_PSERIES being set
>>>
>>> PPC_PSERIES can be set to N, even when config PPC is set.
I understand what you meant before. Having ARCH_HIBERNATION_POSSIBLE under config PPC makes more sense.
>>> grep -A 5 -i "config ppc_pseries" arch/powerpc/platforms/pseries/Kconfig
>>> config PPC_PSERIES
>>>         depends on PPC64 && PPC_BOOK3S
>>>         bool "IBM pSeries & new (POWER5-based) iSeries"
>>>         select HAVE_PCSPKR_PLATFORM
>>>         select MPIC
>>>         select OF_DYNAMIC
>>>
> modified   arch/powerpc/Kconfig
> @@ -156,6 +156,7 @@ config PPC
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
> +	select ARCH_HIBERNATION_POSSIBLE	if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
>  	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>  	select ARCH_MIGHT_HAVE_PC_PARPORT

Though, even with these changes I was able to reproduce same warnings. (using steps from above)
It's because one can enable HIBERNATION manually.

As these warnings were observed through make randconfig, there is still a chance that randconfig
may result in a permutation that may produce these warnings again.

>
> -aneesh
