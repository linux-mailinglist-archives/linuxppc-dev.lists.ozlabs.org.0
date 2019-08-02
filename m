Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A42727ED19
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 09:05:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460J8m1WHDzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 17:05:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460J6q4HRqzDqrq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 17:04:01 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9BBBA68B05; Fri,  2 Aug 2019 09:03:54 +0200 (CEST)
Date: Fri, 2 Aug 2019 09:03:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Takashi Iwai <tiwai@suse.de>, iommu@lists.linux-foundation.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 5/5] dma-mapping: remove ARCH_NO_COHERENT_DMA_MMAP
Message-ID: <20190802070354.GA8280@lst.de>
References: <20190725063401.29904-1-hch@lst.de>
 <20190725063401.29904-6-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725063401.29904-6-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-xtensa@linux-xtensa.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Takashi,

any comments on the sounds/ side of this?

On Thu, Jul 25, 2019 at 08:34:01AM +0200, Christoph Hellwig wrote:
> Now that we never use a default ->mmap implementation, and non-coherent
> architectures can control the presence of ->mmap support by enabling
> ARCH_HAS_DMA_COHERENT_TO_PFN for the dma direct implementation there
> is no need for a global config option to control the availability
> of dma_common_mmap.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/Kconfig            |  3 ---
>  arch/c6x/Kconfig        |  1 -
>  arch/m68k/Kconfig       |  1 -
>  arch/microblaze/Kconfig |  1 -
>  arch/parisc/Kconfig     |  1 -
>  arch/sh/Kconfig         |  1 -
>  arch/xtensa/Kconfig     |  1 -
>  kernel/dma/mapping.c    |  4 ----
>  sound/core/pcm_native.c | 10 +---------
>  9 files changed, 1 insertion(+), 22 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index a7b57dd42c26..ec2834206d08 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -790,9 +790,6 @@ config COMPAT_32BIT_TIME
>  	  This is relevant on all 32-bit architectures, and 64-bit architectures
>  	  as part of compat syscall handling.
>  
> -config ARCH_NO_COHERENT_DMA_MMAP
> -	bool
> -
>  config ARCH_NO_PREEMPT
>  	bool
>  
> diff --git a/arch/c6x/Kconfig b/arch/c6x/Kconfig
> index b4fb61c83494..e65e8d82442a 100644
> --- a/arch/c6x/Kconfig
> +++ b/arch/c6x/Kconfig
> @@ -20,7 +20,6 @@ config C6X
>  	select OF_EARLY_FLATTREE
>  	select GENERIC_CLOCKEVENTS
>  	select MODULES_USE_ELF_RELA
> -	select ARCH_NO_COHERENT_DMA_MMAP
>  	select MMU_GATHER_NO_RANGE if MMU
>  
>  config MMU
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index c518d695c376..614b355ae338 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -8,7 +8,6 @@ config M68K
>  	select ARCH_HAS_DMA_PREP_COHERENT if HAS_DMA && MMU && !COLDFIRE
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE if HAS_DMA
>  	select ARCH_MIGHT_HAVE_PC_PARPORT if ISA
> -	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
>  	select ARCH_NO_PREEMPT if !COLDFIRE
>  	select BINFMT_FLAT_ARGVP_ENVP_ON_STACK
>  	select DMA_DIRECT_REMAP if HAS_DMA && MMU && !COLDFIRE
> diff --git a/arch/microblaze/Kconfig b/arch/microblaze/Kconfig
> index d411de05b628..632c9477a0f6 100644
> --- a/arch/microblaze/Kconfig
> +++ b/arch/microblaze/Kconfig
> @@ -9,7 +9,6 @@ config MICROBLAZE
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> -	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
>  	select ARCH_WANT_IPC_PARSE_VERSION
>  	select BUILDTIME_EXTABLE_SORT
>  	select TIMER_OF
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 6d732e451071..e9dd88b7f81e 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -52,7 +52,6 @@ config PARISC
>  	select GENERIC_SCHED_CLOCK
>  	select HAVE_UNSTABLE_SCHED_CLOCK if SMP
>  	select GENERIC_CLOCKEVENTS
> -	select ARCH_NO_COHERENT_DMA_MMAP
>  	select CPU_NO_EFFICIENT_FFS
>  	select NEED_DMA_MAP_STATE
>  	select NEED_SG_DMA_LENGTH
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 6b1b5941b618..f356ee674d89 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -5,7 +5,6 @@ config SUPERH
>  	select ARCH_HAS_PTE_SPECIAL
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
> -	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
>  	select HAVE_PATA_PLATFORM
>  	select CLKDEV_LOOKUP
>  	select DMA_DECLARE_COHERENT
> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
> index ebc135bda921..70653aed3005 100644
> --- a/arch/xtensa/Kconfig
> +++ b/arch/xtensa/Kconfig
> @@ -5,7 +5,6 @@ config XTENSA
>  	select ARCH_HAS_BINFMT_FLAT if !MMU
>  	select ARCH_HAS_SYNC_DMA_FOR_CPU
>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
> -	select ARCH_NO_COHERENT_DMA_MMAP if !MMU
>  	select ARCH_USE_QUEUED_RWLOCKS
>  	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_WANT_FRAME_POINTERS
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 7dff1829c8c5..815446f76995 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -169,7 +169,6 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
>  		void *cpu_addr, dma_addr_t dma_addr, size_t size,
>  		unsigned long attrs)
>  {
> -#ifndef CONFIG_ARCH_NO_COHERENT_DMA_MMAP
>  	unsigned long user_count = vma_pages(vma);
>  	unsigned long count = PAGE_ALIGN(size) >> PAGE_SHIFT;
>  	unsigned long off = vma->vm_pgoff;
> @@ -198,9 +197,6 @@ int dma_common_mmap(struct device *dev, struct vm_area_struct *vma,
>  
>  	return remap_pfn_range(vma, vma->vm_start, pfn + vma->vm_pgoff,
>  			user_count << PAGE_SHIFT, vma->vm_page_prot);
> -#else
> -	return -ENXIO;
> -#endif /* !CONFIG_ARCH_NO_COHERENT_DMA_MMAP */
>  }
>  
>  /**
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 860543a4c840..2dadc708343a 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -218,15 +218,7 @@ int snd_pcm_info_user(struct snd_pcm_substream *substream,
>  
>  static bool hw_support_mmap(struct snd_pcm_substream *substream)
>  {
> -	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
> -		return false;
> -	/* architecture supports dma_mmap_coherent()? */
> -#if defined(CONFIG_ARCH_NO_COHERENT_DMA_MMAP) || !defined(CONFIG_HAS_DMA)
> -	if (!substream->ops->mmap &&
> -	    substream->dma_buffer.dev.type == SNDRV_DMA_TYPE_DEV)
> -		return false;
> -#endif
> -	return true;
> +	return substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP;
>  }
>  
>  static int constrain_mask_params(struct snd_pcm_substream *substream,
> -- 
> 2.20.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
---end quoted text---
