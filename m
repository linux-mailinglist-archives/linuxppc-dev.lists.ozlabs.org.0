Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0FA7F858C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 22:43:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dpaunlgI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScT4b6jG5z3dK5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 08:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dpaunlgI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScT3h5zKHz3c18
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 08:42:40 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOLFgmU031455;
	Fri, 24 Nov 2023 21:42:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=4fKUVoqmH8tzAw6rOlAIKbHiOQlCQ31UrUgqhhVqUuY=;
 b=dpaunlgIAScKVBIOr9WLUW+AAccA9UfTJTkHp5CfdxVK1qOoz5I+6PTrBe1txn3O2I3+
 hpdiV7hSnKxiN97lU4QJtynGB3dzDvHmI+QxfP01cWSx21kJaLm/ExMhs7C/2uxkRFuZ
 aDzGLS46IKqFDyesMgLrvFTGC+Ma7wr0ettlsHr8sxBJlSPEcRjLaQ2b0DdYnNZr3cin
 K0Xo8PaFTLD7NQ8HRAYKCruDjwaxPlmWn7wq4GSFK/Wl8+wFavZhz1zhVXFkH7JALcn1
 yJ1VJWW/gC9rE3JV0xB55b+UlF1Gd4ahFtLF5Ie9DkRZBtvVoqzyFx1JzWEPjgWo9SxF dA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uk3d0gp8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 21:42:29 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOIn8lD001389;
	Fri, 24 Nov 2023 21:42:28 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ufaa2qqku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 21:42:28 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AOLgS3632768542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Nov 2023 21:42:28 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DF49E5805D;
	Fri, 24 Nov 2023 21:42:27 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E78E258054;
	Fri, 24 Nov 2023 21:42:25 +0000 (GMT)
Received: from [9.171.45.188] (unknown [9.171.45.188])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Nov 2023 21:42:25 +0000 (GMT)
Message-ID: <ed69a370-a61f-4108-82bd-44895007991a@linux.ibm.com>
Date: Sat, 25 Nov 2023 03:12:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] powerpc: Adjust config HOTPLUG_CPU dependency
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, aneesh.kumar@kernel.org
References: <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
 <20231122101040.231850-1-vishalc@linux.ibm.com> <87v89rri12.fsf@mail.lhotse>
From: Vishal Chourasia <vishalc@linux.ibm.com>
In-Reply-To: <87v89rri12.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vJOu3XKggRnP0yDFEa8eJbWu6hs3cPSc
X-Proofpoint-GUID: vJOu3XKggRnP0yDFEa8eJbWu6hs3cPSc
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311240169
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/11/23 8:09 am, Michael Ellerman wrote:
> Hi Vishal,
> 
> I think our wires got crossed here somewhere :)
> 
> Vishal Chourasia <vishalc@linux.ibm.com> writes:
>> Changed HOTPLUG_CPU dependency to SMP and either ARCH_HIBERNATION_POSSIBLE or
>> ARCH_SUSPEND_POSSIBLE, aligning with systems' suspend/hibernation capabilities.
>> This update link CPU hotplugging more logically with platforms' capabilities.
>>
>> configs ARCH_HIBERNATION_POSSIBLE and ARCH_SUSPEND_POSSIBLE are now selected
>> only if required platform dependencies are met.
>>
>> Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
>> Suggested-by: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
>> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>>
>> v2: https://lore.kernel.org/all/20231122092303.223719-1-vishalc@linux.ibm.com
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
>>  arch/powerpc/Kconfig | 11 ++++-------
>>  1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 6f105ee4f3cf..87c8134da3da 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -166,6 +167,7 @@ config PPC
>>  	select ARCH_STACKWALK
>>  	select ARCH_SUPPORTS_ATOMIC_RMW
>>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
>> +	select ARCH_SUSPEND_POSSIBLE            if (ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES || 44x || 40x)
> 
> I know Aneesh suggested moving symbols to under PPC, but I think this is
> too big and complicated to be under PPC.
> 
>> @@ -381,13 +383,9 @@ config DEFAULT_UIMAGE
>>  
>>  config ARCH_HIBERNATION_POSSIBLE
>>  	bool
>> -	default y
>>  config ARCH_SUSPEND_POSSIBLE
>> -	def_bool y
>> -	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
>> -		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
>> -		   || 44x || 40x
>> +	bool
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
> 
> It's good to fix these warnings, but IMHO the result is that the
> dependencies are now backward.
> 
> HOTPLUG_CPU should retain its original dependency list. It's easier to
> reason directly about "what platforms support CPU hotplug?", oh it's
> pseries/powernv/powermac/85xx, because they implement cpu_disable().
> 
> If there's some dependency from suspend/hibernate on CPU hotplug, then
> those symbols (suspend/hibernate) should depend on something to do with
> CPU hotplug.
> 
> Can you try the patch below?
> 
> Though, going back to your original reproduction case, that kernel is
> configured for Book3S 64, but with no platforms enabled, which is a
> non-sensical configuration (it can't boot on any actual machines). So
> possibly the real root cause is that, and we should find some way to
> block creating a config that has no platforms enabled.
> 
> cheers
> 
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6f105ee4f3cf..9fe656a17017 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -380,11 +380,12 @@ config DEFAULT_UIMAGE
>  	  Used to allow a board to specify it wants a uImage built by default
>  
>  config ARCH_HIBERNATION_POSSIBLE
> -	bool
> -	default y
> +	def_bool y
> +	depends on !SMP || HAVE_HOTPLUG_CPU
>  
>  config ARCH_SUSPEND_POSSIBLE
>  	def_bool y
> +	depends on !SMP || HAVE_HOTPLUG_CPU
>  	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
>  		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
>  		   || 44x || 40x
> @@ -566,10 +567,14 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
>  	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
>  
> +config HAVE_HOTPLUG_CPU
> +	def_bool y
> +	depends on SMP
> +	depends on PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
> +
>  config HOTPLUG_CPU
>  	bool "Support for enabling/disabling CPUs"
> -	depends on SMP && (PPC_PSERIES || \
> -		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
> +	depends on HAVE_HOTPLUG_CPU
>  	help
>  	  Say Y here to be able to disable and re-enable individual
>  	  CPUs at runtime on SMP machines.
> 
Tried and it works. No warnings to be seen.

But, consider this scenario

 SMP [=y]
 CONFIG_PPC64 [=y]
 PPC_BOOK3S_32 [=y]
 CONFIG_CPU_BIG_ENDIAN [=y]
 PPC_MPC52xx [=y]
 PPC_EFIKA [=y]

With above config setting in place, config hotplug_cpu will be set to 'N' based
on your patch. And, If we consider current way of things, config hotplug_cpu
will be set to 'Y'

Below patch fixes the warning by making arch_hibernation_possible depend upon
all of the necessary platforms and extends the dependency of hotplug_cpu on
arch_suspend_possible


diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..13e32494bbf1 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -380,8 +380,8 @@ config DEFAULT_UIMAGE
          Used to allow a board to specify it wants a uImage built by default

 config ARCH_HIBERNATION_POSSIBLE
-       bool
-       default y
+       def_bool y
+       depends on PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE

 config ARCH_SUSPEND_POSSIBLE
        def_bool y
@@ -566,10 +566,14 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
        def_bool
$(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
$(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
        def_bool
$(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh
$(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN

+config HAVE_HOTPLUG_CPU
+       def_bool y
+       depends on SMP
+       depends on ARCH_HIBERNATION_POSSIBLE || ARCH_SUSPEND_POSSIBLE
+
 config HOTPLUG_CPU
        bool "Support for enabling/disabling CPUs"
-       depends on SMP && (PPC_PSERIES || \
-               PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
+       depends on HAVE_HOTPLUG_CPU
        help
          Say Y here to be able to disable and re-enable individual
          CPUs at runtime on SMP machines.


What is the "correct value" of config HOTPLUG_CPU (Y/N) given the config
settings (from above)? I am finding it hard to justify N over Y. Can you explain
a bit more?

Your patch produces N, where as the patch i have provided in this mail would
sets it to Y.

does cpu hotplug code path calls into suspend code logic for any
platforms upon which arch_suspend_possible config depends.. ex. PPC_EFIKA, etc.





