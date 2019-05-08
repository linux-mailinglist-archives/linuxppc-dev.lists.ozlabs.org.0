Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD617559
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 11:44:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zWl65fTJzDqNK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 19:44:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=john.garry@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zWjq5JKJzDqDt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 19:42:55 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E2271E1F38C9344801A4;
 Wed,  8 May 2019 17:42:49 +0800 (CST)
Received: from [127.0.0.1] (10.202.227.238) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 8 May 2019 17:42:39 +0800
Subject: Re: [PATCH v6 1/1] iommu: enhance IOMMU dma mode build options
To: Zhen Lei <thunder.leizhen@huawei.com>, Jean-Philippe Brucker
 <jean-philippe.brucker@arm.com>, Robin Murphy <robin.murphy@arm.com>, "Will
 Deacon" <will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>, Sebastian Ott
 <sebott@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "Martin Schwidefsky" <schwidefsky@de.ibm.com>, Heiko Carstens
 <heiko.carstens@de.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Tony Luck <tony.luck@intel.com>, Fenghua Yu
 <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
 <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, x86 <x86@kernel.org>,
 linux-ia64 <linux-ia64@vger.kernel.org>
References: <20190418135701.24668-1-thunder.leizhen@huawei.com>
 <20190418135701.24668-2-thunder.leizhen@huawei.com>
From: John Garry <john.garry@huawei.com>
Message-ID: <ca30a698-8047-9a86-a2f1-0b3e1c8692bf@huawei.com>
Date: Wed, 8 May 2019 10:42:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20190418135701.24668-2-thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.238]
X-CFilter-Loop: Reflected
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
Cc: Hanjun Guo <guohanjun@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18/04/2019 14:57, Zhen Lei wrote:
> First, add build option IOMMU_DEFAULT_{LAZY|STRICT}, so that we have the
> opportunity to set {lazy|strict} mode as default at build time. Then put
> the three config options in an choice, make people can only choose one of
> the three at a time.
>
> The default IOMMU dma modes on each ARCHs have no change.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  arch/ia64/kernel/pci-dma.c                |  2 +-
>  arch/powerpc/platforms/powernv/pci-ioda.c |  3 ++-
>  arch/s390/pci/pci_dma.c                   |  2 +-
>  arch/x86/kernel/pci-dma.c                 |  7 ++---
>  drivers/iommu/Kconfig                     | 44 ++++++++++++++++++++++++++-----
>  drivers/iommu/amd_iommu_init.c            |  3 ++-
>  drivers/iommu/intel-iommu.c               |  2 +-
>  drivers/iommu/iommu.c                     |  3 ++-
>  8 files changed, 48 insertions(+), 18 deletions(-)
>
> diff --git a/arch/ia64/kernel/pci-dma.c b/arch/ia64/kernel/pci-dma.c
> index fe988c49f01ce6a..655511dbf3c3b34 100644
> --- a/arch/ia64/kernel/pci-dma.c
> +++ b/arch/ia64/kernel/pci-dma.c
> @@ -22,7 +22,7 @@
>  int force_iommu __read_mostly;
>  #endif
>
> -int iommu_pass_through;
> +int iommu_pass_through = IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
>
>  static int __init pci_iommu_init(void)
>  {
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 3ead4c237ed0ec9..383e082a9bb985c 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -85,7 +85,8 @@ void pe_level_printk(const struct pnv_ioda_pe *pe, const char *level,
>  	va_end(args);
>  }
>
> -static bool pnv_iommu_bypass_disabled __read_mostly;
> +static bool pnv_iommu_bypass_disabled __read_mostly =
> +			!IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
>  static bool pci_reset_phbs __read_mostly;
>
>  static int __init iommu_setup(char *str)
> diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
> index 9e52d1527f71495..784ad1e0acecfb1 100644
> --- a/arch/s390/pci/pci_dma.c
> +++ b/arch/s390/pci/pci_dma.c
> @@ -17,7 +17,7 @@
>
>  static struct kmem_cache *dma_region_table_cache;
>  static struct kmem_cache *dma_page_table_cache;
> -static int s390_iommu_strict;
> +static int s390_iommu_strict = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
>
>  static int zpci_refresh_global(struct zpci_dev *zdev)
>  {
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index d460998ae828514..fb2bab42a0a3173 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -43,11 +43,8 @@
>   * It is also possible to disable by default in kernel config, and enable with
>   * iommu=nopt at boot time.
>   */
> -#ifdef CONFIG_IOMMU_DEFAULT_PASSTHROUGH
> -int iommu_pass_through __read_mostly = 1;
> -#else
> -int iommu_pass_through __read_mostly;
> -#endif
> +int iommu_pass_through __read_mostly =
> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_PASSTHROUGH);
>
>  extern struct iommu_table_entry __iommu_table[], __iommu_table_end[];
>
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 6f07f3b21816c64..8a1f1793cde76b4 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -74,17 +74,47 @@ config IOMMU_DEBUGFS
>  	  debug/iommu directory, and then populate a subdirectory with
>  	  entries as required.
>
> -config IOMMU_DEFAULT_PASSTHROUGH
> -	bool "IOMMU passthrough by default"
> +choice
> +	prompt "IOMMU dma mode"

/s/dma/DMA/

And how about add "default", as in "Default IOMMU DMA mode" or "IOMMU 
default DMA mode"?

>  	depends on IOMMU_API
> -        help
> -	  Enable passthrough by default, removing the need to pass in
> -	  iommu.passthrough=on or iommu=pt through command line. If this
> -	  is enabled, you can still disable with iommu.passthrough=off
> -	  or iommu=nopt depending on the architecture.
> +	default IOMMU_DEFAULT_PASSTHROUGH if (PPC_POWERNV && PCI)
> +	default IOMMU_DEFAULT_LAZY if (AMD_IOMMU || INTEL_IOMMU || S390_IOMMU)
> +	default IOMMU_DEFAULT_STRICT
> +	help
> +	  This option allows IOMMU dma mode to be chose at build time, to

again, capitalize acronyms, i.e. /s/dma/DMA/ (more of these above and below)

> +	  override the default dma mode of each ARCHs, removing the need to
> +	  pass in kernel parameters through command line. You can still use
> +	  ARCHs specific boot options to override this option again.
> +
> +config IOMMU_DEFAULT_PASSTHROUGH

I think that it may need to be indented, along with the other choices

> +	bool "passthrough"
> +	help
> +	  In this mode, the dma access through IOMMU without any addresses
> +	  transformation. That means, the wrong or illegal dma access can not

transformation, or translation?

> +	  be caught, no error information will be reported.
>
>  	  If unsure, say N here.
>
> +config IOMMU_DEFAULT_LAZY
> +	bool "lazy"
> +	help
> +	  Support lazy mode, where for every IOMMU DMA unmap operation, the
> +	  flush operation of IOTLB and the free operation of IOVA are deferred.
> +	  They are only guaranteed to be done before the related IOVA will be
> +	  reused.
> +
> +config IOMMU_DEFAULT_STRICT
> +	bool "strict"
> +	help
> +	  For every IOMMU DMA unmap operation, the flush operation of IOTLB and
> +	  the free operation of IOVA are guaranteed to be done in the unmap
> +	  function.
> +
> +	  This mode is safer than the two above, but it maybe slow in some high

slow, or slower? And passthough is not safe, so anything is implicitly 
safer.

> +	  performace scenarios.
> +
> +endchoice
> +
>  config OF_IOMMU
>         def_bool y
>         depends on OF && IOMMU_API
> diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
> index ff40ba758cf365e..16c02b08adb4cb2 100644
> --- a/drivers/iommu/amd_iommu_init.c
> +++ b/drivers/iommu/amd_iommu_init.c
> @@ -166,7 +166,8 @@ struct ivmd_header {
>  					   to handle */
>  LIST_HEAD(amd_iommu_unity_map);		/* a list of required unity mappings
>  					   we find in ACPI */
> -bool amd_iommu_unmap_flush;		/* if true, flush on every unmap */
> +bool amd_iommu_unmap_flush = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
> +					/* if true, flush on every unmap */
>
>  LIST_HEAD(amd_iommu_list);		/* list of all AMD IOMMUs in the
>  					   system */
> diff --git a/drivers/iommu/intel-iommu.c b/drivers/iommu/intel-iommu.c
> index 28cb713d728ceef..0c3cc716210f35a 100644
> --- a/drivers/iommu/intel-iommu.c
> +++ b/drivers/iommu/intel-iommu.c
> @@ -362,7 +362,7 @@ static int domain_detach_iommu(struct dmar_domain *domain,
>
>  static int dmar_map_gfx = 1;
>  static int dmar_forcedac;
> -static int intel_iommu_strict;
> +static int intel_iommu_strict = IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
>  static int intel_iommu_superpage = 1;
>  static int intel_iommu_sm;
>  static int iommu_identity_mapping;
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 109de67d5d727c2..0ec5952ac60e2a3 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -43,7 +43,8 @@
>  #else
>  static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_DMA;
>  #endif
> -static bool iommu_dma_strict __read_mostly = true;
> +static bool iommu_dma_strict __read_mostly =
> +			IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
>
>  struct iommu_callback_data {
>  	const struct iommu_ops *ops;
> --
> 1.8.3
>
>
>
> .
>


