Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C946B7EED98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 09:35:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poNwvfqK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWqw853t7z3dLS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Nov 2023 19:35:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=poNwvfqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWqvC2R6cz3cTb
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:34:15 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH8L76e001051;
	Fri, 17 Nov 2023 08:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=5eg4jOGvfviQ8d+AqXlZ71Ct25iNOYjmsrROE+AGWGA=;
 b=poNwvfqKo3SPjOjxCEV6bTw+MAucEy3kyGop641Nk07QtdtFMxZkR2rZDWNggAlLy0u7
 RtZEhP3Swmm9cdb0nc86irC+sGySxcQ80BcWnjbsDGTryjwQhpj196FTxZdbjgVlsayp
 t76VLUzkktCXmz3GNsB2rxqAiO9CVYPQwJ7R3E5TL8dumr014AMHfa8shGAaPRw/w6zX
 beySIN6WnAbc/VxBf/I0NYjYX42cFRZt9YsDIIDD2Syh2MzySKjLqE5+kTOZcbLqmCxK
 qJBc1RRbRFJw65Ct1GsZ19x7X5uG8qTKByB2bwBtnff3poYAyt128+6isF9oDBcwbm/K zw== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ue43fs8eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:34:05 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AH6HELh026321;
	Fri, 17 Nov 2023 08:34:04 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uapn242xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Nov 2023 08:34:04 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AH8Y3Hx61210934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Nov 2023 08:34:04 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE9315805E;
	Fri, 17 Nov 2023 08:34:03 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DF0358061;
	Fri, 17 Nov 2023 08:34:02 +0000 (GMT)
Received: from [9.204.201.194] (unknown [9.204.201.194])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 17 Nov 2023 08:34:02 +0000 (GMT)
Message-ID: <2847bd6b-77c3-4705-86c9-96a5bf5138be@linux.ibm.com>
Date: Fri, 17 Nov 2023 14:04:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Restrict ARCH_HIBERNATION_POSSIBLE to supported
 configurations
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
References: <20231114082046.6018-1-vishalc@linux.ibm.com>
 <87sf57zbcd.fsf@linux.ibm.com>
 <ecc9d34a-4960-4540-802e-d35ee4f5259b@linux.ibm.com>
 <c3594f58-c7a4-4265-a38e-c97b08169b61@linux.ibm.com>
 <b7600012-0e7e-4b25-8d8c-1bffcc9c1461@linux.ibm.com>
 <87jzqh706q.fsf@mail.lhotse>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <87jzqh706q.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vJTCCEV30QzSvBJuDMsOAIvVygIOuvWF
X-Proofpoint-GUID: vJTCCEV30QzSvBJuDMsOAIvVygIOuvWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-17_06,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311170062
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


On 17/11/23 4:52 am, Michael Ellerman wrote:
> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>> On 15/11/23 5:46 pm, Aneesh Kumar K V wrote:
>>> On 11/15/23 5:23 PM, Vishal Chourasia wrote:
>>>> On 15/11/23 1:39 pm, Aneesh Kumar K.V wrote:
>>>>> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>>>>>
>>>>>> This patch modifies the ARCH_HIBERNATION_POSSIBLE option to ensure that it
>>>>>> correctly depends on these PowerPC configurations being enabled. As a result,
>>>>>> it prevents the HOTPLUG_CPU from being selected when the required dependencies
>>>>>> are not satisfied.
>>>>>>
>>>>>> This change aligns the dependency tree with the expected hardware support for
>>>>>> CPU hot-plugging under PowerPC architectures, ensuring that the kernel
>>>>>> configuration steps do not lead to inconsistent states.
>>>>>>
>>>>>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>>>>> ---
>>>>>> During the configuration process with 'make randconfig' followed by
>>>>>> 'make olddefconfig', we observed a warning indicating an unmet direct
>>>>>> dependency for the HOTPLUG_CPU option. The dependency in question relates to
>>>>>> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
>>>>>> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
>>>>>> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
>>>>>> This misalignment in dependencies could potentially lead to inconsistent kernel
>>>>>> configuration states, especially when considering the necessary hardware
>>>>>> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
>>>>>> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
>>>>>> appropriate PowerPC configurations being active.
>>>>>>
>>>>>> steps to reproduce (before applying the patch):
>>>>>>
>>>>>> Run 'make pseries_le_defconfig'
>>>>>> Run 'make menuconfig'
>>>>>> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
>>>>>> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
>>>>>> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
>>>>>> Enable SMP [ Processor support -> Symmetric multi-processing support ]
>>>>>> Save the config
>>>>>> Run 'make olddefconfig'
>>>>>>
>>>>>>  arch/powerpc/Kconfig | 5 +++--
>>>>>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>>>> index 6f105ee4f3cf..bf99ff9869f6 100644
>>>>>> --- a/arch/powerpc/Kconfig
>>>>>> +++ b/arch/powerpc/Kconfig
>>>>>> @@ -380,8 +380,9 @@ config DEFAULT_UIMAGE
>>>>>>  	  Used to allow a board to specify it wants a uImage built by default
>>>>>>  
>>>>>>  config ARCH_HIBERNATION_POSSIBLE
>>>>>> -	bool
>>>>>> -	default y
>>>>>> +	def_bool y
>>>>>> +	depends on PPC_PSERIES || \
>>>>>> +		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
>>>>>>  
>>>>>>  config ARCH_SUSPEND_POSSIBLE
>>>>>>  	def_bool y
>>>>>>
>>>>> I am wondering whether it should be switched to using select from
>>>>> config PPC? 
>>>>>
>>>>> selecting ARCH_HIBERNATION_POSSIBLE based on value of config PPC
>>>>> will not guarantee config PPC_PSERIES being set
>>>>>
>>>>> PPC_PSERIES can be set to N, even when config PPC is set.
>> I understand what you meant before. Having ARCH_HIBERNATION_POSSIBLE under config PPC makes more sense.
>>>>> grep -A 5 -i "config ppc_pseries" arch/powerpc/platforms/pseries/Kconfig
>>>>> config PPC_PSERIES
>>>>>         depends on PPC64 && PPC_BOOK3S
>>>>>         bool "IBM pSeries & new (POWER5-based) iSeries"
>>>>>         select HAVE_PCSPKR_PLATFORM
>>>>>         select MPIC
>>>>>         select OF_DYNAMIC
>>>>>
>>> modified   arch/powerpc/Kconfig
>>> @@ -156,6 +156,7 @@ config PPC
>>>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>> +	select ARCH_HIBERNATION_POSSIBLE	if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
>>>  	select ARCH_KEEP_MEMBLOCK
>>>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
>>>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>> Though, even with these changes I was able to reproduce same warnings. (using steps from above)
>> It's because one can enable HIBERNATION manually.
> But how? You shouldn't be able to enable it manually, it depends on
> ARCH_HIBERNATION_POSSIBLE which shouldn't be enabled.
>
> For the above to work you also need to make it default n, eg:
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6f105ee4f3cf..dd2a9b938188 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -380,8 +380,7 @@ config DEFAULT_UIMAGE
>           Used to allow a board to specify it wants a uImage built by default
>
>  config ARCH_HIBERNATION_POSSIBLE
> -       bool
> -       default y
> +       def_bool n
>
>  config ARCH_SUSPEND_POSSIBLE
>         def_bool y
Verified.


Will send out another version.


>
> cheers
