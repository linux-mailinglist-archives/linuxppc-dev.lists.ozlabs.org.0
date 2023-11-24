Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C816E7F6ABF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 03:40:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H8OQ2a6a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbzk55FgVz3dWj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 13:40:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=H8OQ2a6a;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbzjF17qmz2yhZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 13:40:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1700793600;
	bh=WFqN7XdFHW/NhVtUbPjSXPK5v0o8fzBgXb/161VbErM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H8OQ2a6aBxRkz/RG1wM0NXFPJnvYDSXO1kf//aLmHe6Cil3PfQXbUWBJs36e0VXwQ
	 UQLyVnZQYY62EGQSwfwfGMhhBYQSRBEgjqEflGyD8J49dkiMy6i3pmDD/mJnOL7bu/
	 My9i2VjDbqPkUE7e1G4QK98XzJr/2TGljk/wbh1A8FxOyXUMcz42v6jC1ckebwPwNs
	 7NM04dXdGvuop4cHsV/yUDIj1eEc4Vtm/Eey1EQfOJj7mHmNdK3xKaLktdZort1p1T
	 4Tz6kOHG1zKfo0y7le3dv+PJaQheFMWpcZ+X/vuILb6zVJhTpowxy2qPQ1j4eb46Go
	 3TlAMWKGLPTrg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SbzjD3tc4z4wqN;
	Fri, 24 Nov 2023 13:40:00 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vishal Chourasia <vishalc@linux.ibm.com>, aneesh.kumar@kernel.org
Subject: Re: [PATCH v3] powerpc: Adjust config HOTPLUG_CPU dependency
In-Reply-To: <20231122101040.231850-1-vishalc@linux.ibm.com>
References: <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
 <20231122101040.231850-1-vishalc@linux.ibm.com>
Date: Fri, 24 Nov 2023 13:39:53 +1100
Message-ID: <87v89rri12.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: aneesh.kumar@linux.ibm.com, vishalc@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, srikar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Vishal,

I think our wires got crossed here somewhere :)

Vishal Chourasia <vishalc@linux.ibm.com> writes:
> Changed HOTPLUG_CPU dependency to SMP and either ARCH_HIBERNATION_POSSIBLE or
> ARCH_SUSPEND_POSSIBLE, aligning with systems' suspend/hibernation capabilities.
> This update link CPU hotplugging more logically with platforms' capabilities.
>
> configs ARCH_HIBERNATION_POSSIBLE and ARCH_SUSPEND_POSSIBLE are now selected
> only if required platform dependencies are met.
>
> Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Suggested-by: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>
> v2: https://lore.kernel.org/all/20231122092303.223719-1-vishalc@linux.ibm.com
> v1: https://lore.kernel.org/all/20231114082046.6018-1-vishalc@linux.ibm.com
> ---
> During the configuration process with 'make randconfig' followed by
> 'make olddefconfig', we observed a warning indicating an unmet direct
> dependency for the HOTPLUG_CPU option. The dependency in question relates to
> various PowerPC configurations (PPC_PSERIES, PPC_PMAC, PPC_POWERNV,
> FSL_SOC_BOOKE) which were not enabled, yet the HOTPLUG_CPU was being
> erroneously selected due to an implicit assumption by the PM_SLEEP_SMP option.
> This misalignment in dependencies could potentially lead to inconsistent kernel
> configuration states, especially when considering the necessary hardware
> support for CPU hot-plugging on PowerPC platforms. The patch aims to correct
> this by ensuring that ARCH_HIBERNATION_POSSIBLE is contingent upon the
> appropriate PowerPC configurations being active.
>
> steps to reproduce (before applying the patch):
>
> Run 'make pseries_le_defconfig'
> Run 'make menuconfig'
> Enable hibernation [ Kernel options -> Hibernation (aka 'suspend to disk') ] 
> Disable [ Platform support -> IBM PowerNV (Non-Virtualized) platform support ]
> Disable [ Platform support -> IBM pSeries & new (POWER5-based) iSeries ]
> Enable SMP [ Processor support -> Symmetric multi-processing support ]
> Save the config
> Run 'make olddefconfig'
>
>  arch/powerpc/Kconfig | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6f105ee4f3cf..87c8134da3da 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -166,6 +167,7 @@ config PPC
>  	select ARCH_STACKWALK
>  	select ARCH_SUPPORTS_ATOMIC_RMW
>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
> +	select ARCH_SUSPEND_POSSIBLE            if (ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES || 44x || 40x)

I know Aneesh suggested moving symbols to under PPC, but I think this is
too big and complicated to be under PPC.

> @@ -381,13 +383,9 @@ config DEFAULT_UIMAGE
>  
>  config ARCH_HIBERNATION_POSSIBLE
>  	bool
> -	default y
>  config ARCH_SUSPEND_POSSIBLE
> -	def_bool y
> -	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
> -		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
> -		   || 44x || 40x
> +	bool
>  
>  config ARCH_SUSPEND_NONZERO_CPU
>  	def_bool y
> @@ -568,8 +566,7 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>  
>  config HOTPLUG_CPU
>  	bool "Support for enabling/disabling CPUs"
> -	depends on SMP && (PPC_PSERIES || \
> -		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
> +	depends on SMP && (ARCH_HIBERNATION_POSSIBLE || ARCH_SUSPEND_POSSIBLE)

It's good to fix these warnings, but IMHO the result is that the
dependencies are now backward.

HOTPLUG_CPU should retain its original dependency list. It's easier to
reason directly about "what platforms support CPU hotplug?", oh it's
pseries/powernv/powermac/85xx, because they implement cpu_disable().

If there's some dependency from suspend/hibernate on CPU hotplug, then
those symbols (suspend/hibernate) should depend on something to do with
CPU hotplug.

Can you try the patch below?

Though, going back to your original reproduction case, that kernel is
configured for Book3S 64, but with no platforms enabled, which is a
non-sensical configuration (it can't boot on any actual machines). So
possibly the real root cause is that, and we should find some way to
block creating a config that has no platforms enabled.

cheers


diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..9fe656a17017 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -380,11 +380,12 @@ config DEFAULT_UIMAGE
 	  Used to allow a board to specify it wants a uImage built by default
 
 config ARCH_HIBERNATION_POSSIBLE
-	bool
-	default y
+	def_bool y
+	depends on !SMP || HAVE_HOTPLUG_CPU
 
 config ARCH_SUSPEND_POSSIBLE
 	def_bool y
+	depends on !SMP || HAVE_HOTPLUG_CPU
 	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
 		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
 		   || 44x || 40x
@@ -566,10 +567,14 @@ config ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mlittle-endian) if PPC64 && CPU_LITTLE_ENDIAN
 	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-fpatchable-function-entry.sh $(CC) -mbig-endian) if PPC64 && CPU_BIG_ENDIAN
 
+config HAVE_HOTPLUG_CPU
+	def_bool y
+	depends on SMP
+	depends on PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE
+
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
-	depends on SMP && (PPC_PSERIES || \
-		PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
+	depends on HAVE_HOTPLUG_CPU
 	help
 	  Say Y here to be able to disable and re-enable individual
 	  CPUs at runtime on SMP machines.

