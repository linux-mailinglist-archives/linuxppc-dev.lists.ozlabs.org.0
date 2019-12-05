Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB5D113B89
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 07:00:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47T4np44c7zDqXf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2019 17:00:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="FXpNwlYn"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47T4ll3nP0zDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2019 16:58:42 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47T4lc4vQ9z9txMQ;
 Thu,  5 Dec 2019 06:58:36 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FXpNwlYn; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BWCnXne39-kY; Thu,  5 Dec 2019 06:58:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47T4lc3f2pz9tx7Y;
 Thu,  5 Dec 2019 06:58:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575525516; bh=wp0Q6r6/7cfBvYOV63eXkcnp5bKVxzZSUp2X6uyIfdw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=FXpNwlYnx7xAadSj6x/NJiRmDNk9bUITAvGuwaSkV7Xnz6Nuw2kM0Ef+0tZ6BcSyR
 5/y6u6a8SV1fYrI8zRjFfleOrTkXGRfrCdcznv7dkdQMZKIuikqOiob45WpLIzCYg1
 TzKox1R7U+5PePemHsO7PfWL/iEpHTsL3cFFzp60=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5182D8B851;
 Thu,  5 Dec 2019 06:58:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EE4L8GD35x25; Thu,  5 Dec 2019 06:58:37 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF18A8B754;
 Thu,  5 Dec 2019 06:58:36 +0100 (CET)
Subject: Re: [RESEND PATCH v2] powerpc/kernel/sysfs: Add PMU_SYSFS config
 option to enable PMU SPRs sysfs file creation
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20191205052558.2091-1-kjain@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0e5028bc-b8bc-e2f5-855f-9df5bfb58dad@c-s.fr>
Date: Thu, 5 Dec 2019 06:58:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191205052558.2091-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: anju@linux.vnet.ibm.com, Nageswara R Sastry <nasastry@in.ibm.com>,
 maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/12/2019 à 06:25, Kajol Jain a écrit :
> Many of the performance moniroting unit (PMU) SPRs are
> exposed in the sysfs. "perf" API is the primary interface to program
> PMU and collect counter data in the system. So expose these
> PMU SPRs in the absence of CONFIG_PERF_EVENTS.
> 
> Patch adds a new CONFIG option 'CONFIG_PMU_SYSFS'. The new config
> option used in kernel/sysfs.c for PMU SPRs sysfs file creation and
> this new option is enabled only if 'CONFIG_PERF_EVENTS' option is
> disabled.

Not sure this new unselectable option is worth it. See below.
By the way I also find the subject misleading, as you may believe when 
reading it that there is something to select.

> 
> Tested this patch with enable/disable CONFIG_PERF_EVENTS option
> in powernv and pseries machines.
> Also did compilation testing for different architecture include:
> x86, mips, mips64, alpha, arm. And with book3s_32.config option.

How do you use book3s_32.config exactly ? That's a portion of config, 
not a config by itself. You should use pmac32_defconfig I guess.

> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> 
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Tested-by: Nageswara R Sastry <nasastry@in.ibm.com>
> 
> Tested using the following different scenarios:
> 1. CONFIG_PERF_EVENT - enabled, CONFIG_PMU_SYSFS - disabled,
> RESULT: not seen any sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devices/cpu?/
> 2. CONFIG_PERF_EVENT - disabled, CONFIG_PMU_SYSFS - enabled,
> RESULT: seen any sysfs files(mmrc*, pmc*) from /sys/bus/cpu/devices/cpu?/
> 3. CONFIG_PERF_EVENT -disabled, CONFIG_PMU_SYSFS - disabled,
> RESULT: not possible, any one of the config options need to be enabled.
> 4. CONFIG_PERF_EVENT -enabled, CONFIG_PMU_SYSFS - enabled,
> RESULT: not possible, any one of the config options need to be enabled.
> ---
>   arch/powerpc/kernel/sysfs.c            | 21 +++++++++++++++++++++
>   arch/powerpc/platforms/Kconfig.cputype |  8 ++++++++
>   2 files changed, 29 insertions(+)
> 
> ---
> Changelog:
> Resend v2
> 	Added 'Reviewed-by' and 'Tested-by' tag along with test scenarios.	
> 
> v1 -> v2
> - Added new config option 'PMU_SYSFS' for PMU SPR's creation
>    rather than using PERF_EVENTS config option directly and make
>    sure SPR's file creation only if 'CONFIG_PERF_EVENTS' disabled.
> ---
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 80a676da11cb..b7c01f1ef236 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -457,16 +457,21 @@ static ssize_t __used \
>   
>   #if defined(CONFIG_PPC64)
>   #define HAS_PPC_PMC_CLASSIC	1
> +#ifdef CONFIG_PMU_SYSFS
>   #define HAS_PPC_PMC_IBM		1
> +#endif
>   #define HAS_PPC_PMC_PA6T	1
>   #elif defined(CONFIG_PPC_BOOK3S_32)
>   #define HAS_PPC_PMC_CLASSIC	1
> +#ifdef CONFIG_PMU_SYSFS
>   #define HAS_PPC_PMC_IBM		1
>   #define HAS_PPC_PMC_G4		1
>   #endif
> +#endif
>   
>   
>   #ifdef HAS_PPC_PMC_CLASSIC
> +#ifdef CONFIG_PMU_SYSFS

You don't need this big forest of #ifdefs (this one and all the ones 
after). All the objets you are protecting with this are indeed static. 
So the only thing you have to do is to register them only when relevant, 
and GCC will get rid of the objects by itself when the config option is 
not enabled. See below.

And the advantage of doing that way is that you don't need to build it 
with both options to check the build. That's recommended by kernel 
codying style (Refer 
https://www.kernel.org/doc/html/latest/process/coding-style.html#conditional-compilation)

[...]

> @@ -787,8 +804,10 @@ static int register_cpu_online(unsigned int cpu)
>   			device_create_file(s, &pmc_attrs[i]);
>   
>   #ifdef CONFIG_PPC64
> +#ifdef CONFIG_PMU_SYSFS

Don't use #ifdef here, just do instead:

if (IS_ENABLED(CONFIG_PMU_SYSFS) && cpu_has_feature(CPU_FTR_MMCRA))

>   	if (cpu_has_feature(CPU_FTR_MMCRA))
>   		device_create_file(s, &dev_attr_mmcra);
> +#endif /* CONFIG_PMU_SYSFS */
>   
>   	if (cpu_has_feature(CPU_FTR_PURR)) {
>   		if (!firmware_has_feature(FW_FEATURE_LPAR))
> @@ -876,8 +895,10 @@ static int unregister_cpu_online(unsigned int cpu)
>   			device_remove_file(s, &pmc_attrs[i]);
>   
>   #ifdef CONFIG_PPC64
> +#ifdef CONFIG_PMU_SYSFS

Same, use IS_ENABLED() here as well.

>   	if (cpu_has_feature(CPU_FTR_MMCRA))
>   		device_remove_file(s, &dev_attr_mmcra);
> +#endif /* CONFIG_PMU_SYSFS */
>   
>   	if (cpu_has_feature(CPU_FTR_PURR))
>   		device_remove_file(s, &dev_attr_purr);
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
> index 12543e53fa96..f3ad579c559f 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -417,6 +417,14 @@ config PPC_MM_SLICES
>   config PPC_HAVE_PMU_SUPPORT
>          bool
>   
> +config PMU_SYSFS
> +	bool
> +	default y if !PERF_EVENTS
> +	help
> +	  This option enables PMU SPR sysfs file creation. Since PMU SPRs are
> +	  intended to be used via "perf" interface, config option is enabled
> +	  only when CONFIG_PERF_EVENTS is disabled.
> +

Not sure you need this at all. Once you have changed to just using 
IS_ENABLED() in the two places above, I think it is acceptable to use 
!IS_ENABLED(CONFIG_PERF_EVENTS) instead.

>   config PPC_PERF_CTRS
>          def_bool y
>          depends on PERF_EVENTS && PPC_HAVE_PMU_SUPPORT
> 


Christophe
