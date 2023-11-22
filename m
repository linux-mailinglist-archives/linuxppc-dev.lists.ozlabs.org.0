Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 110787F41BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 10:34:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxD42Ey0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZwzr6rXMz3d95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 20:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lxD42Ey0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZwz05Hjxz3c5S
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 20:33:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE5D261CB7;
	Wed, 22 Nov 2023 09:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28F1C433C8;
	Wed, 22 Nov 2023 09:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700645591;
	bh=7v4euZsGjV3HUdXdKmvET/5mqTNGT1+ZP26RKUVDa0Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lxD42Ey0oelV4yEcf01cVKCB8NAIkVGloGX5wNS3JVAK1DLLdTVTd9VAOsP+LkItO
	 t73UweLo0gr2xCP3uhwQE9ANKhtLAyNr78aWku4amf9e4NsbiWR6+FTQHTOaUNIC/6
	 DhDX0xybKVdAFQsDcREyNcTWC0HHB5HA79C+B/KjJ5m+9kLoexrTSJtq90f3KadZI8
	 bc4UI5wqecF6Exh/hVaaaZCsZW1EeWI6bk4OfQgvxmzv+xtSnsRCvt5fTWNhmboHdw
	 zkgVy+M06tjmJ0ZuA0wPiSZO19dxYbAlSb2gh8PO5LNfTruXYQ8uIU4BzLJHNp7ysJ
	 FrTETYwwxgjSA==
Message-ID: <3fe72686-5b89-41e4-b760-d6353b426d81@kernel.org>
Date: Wed, 22 Nov 2023 15:03:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Adjust config HOTPLUG_CPU dependency
Content-Language: en-US
To: Vishal Chourasia <vishalc@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20231122092303.223719-1-vishalc@linux.ibm.com>
From: Aneesh Kumar K V <aneesh.kumar@kernel.org>
In-Reply-To: <20231122092303.223719-1-vishalc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 11/22/23 2:53 PM, Vishal Chourasia wrote:
> Changed HOTPLUG_CPU dependency to SMP and either ARCH_HIBERNATION_POSSIBLE or
> ARCH_SUSPEND_POSSIBLE, aligning with systems' suspend/hibernation capabilities.
> This update links CPU hotplugging more logically with platforms' capabilities.
> 
> Other changes include
> 
> 1. configs ARCH_HIBERNATION_POSSIBLE and ARCH_SUSPEND_POSSIBLE are now selected
>    only if required platform dependencies are met.
> 
> 2. Defaults for configs ARCH_HIBERNATION_POSSIBLE and
>    ARCH_SUSPEND_POSSIBLE has been set to 'N'
> 
> Reported-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Suggested-by: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
> 
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
>  arch/powerpc/Kconfig | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6f105ee4f3cf..6e7e9af2f0c1 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -155,6 +155,8 @@ config PPC
>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
> +	select ARCH_HIBERNATION_POSSIBLE        if (PPC_PSERIES || PPC_PMAC || PPC_POWERNV || FSL_SOC_BOOKE)
> +	select ARCH_SUSPEND_POSSIBLE            if (ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES || 44x || 40x)

We should keep that sorted as explained in comment around that. 

>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>  	select ARCH_KEEP_MEMBLOCK
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if PPC_RADIX_MMU
> @@ -380,14 +382,10 @@ config DEFAULT_UIMAGE
>  	  Used to allow a board to specify it wants a uImage built by default
>  
>  config ARCH_HIBERNATION_POSSIBLE
> -	bool
> -	default y
> +	def_bool n


We should be able to keep this 
config ARCH_HIBERNATION_POSSIBLE
    bool


That is how we have rest of the ARCH_* config. I am not sure we need to explicitly say "def_bool n" 

>  
>  config ARCH_SUSPEND_POSSIBLE
> -	def_bool y
> -	depends on ADB_PMU || PPC_EFIKA || PPC_LITE5200 || PPC_83xx || \
> -		   (PPC_85xx && !PPC_E500MC) || PPC_86xx || PPC_PSERIES \
> -		   || 44x || 40x
> +	def_bool n
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
>  	help
>  	  Say Y here to be able to disable and re-enable individual
>  	  CPUs at runtime on SMP machines.

