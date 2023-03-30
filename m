Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E416D07AF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 16:07:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnQGk3ZJxz3fSH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 01:07:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J1/GIeaR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com; envelope-from=prabhakar.csengg@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J1/GIeaR;
	dkim-atps=neutral
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnQFr4cdzz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 01:06:39 +1100 (AEDT)
Received: by mail-io1-xd31.google.com with SMTP id d22so7297705iow.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 07:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185197; x=1682777197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/E4K44ZeZZYqRKZWo/54gNqfFdiOexAGD/vcXLfhbk=;
        b=J1/GIeaRA29zVYnImkt+EeaOnfAnGjjhfRddDv28kn32VLilbTz+WyBZWgF5XELFr1
         rCMN1DvhhBQoyRvpOwbG8FJN61vjK/sZath5piRSAGgrBJNjBHhSHTlrg8IKEBDntpV3
         IbW3iSWuZR7NQ9RxgOBf6NL/S6A6wnLQcpmsTH/FKdkqyMsQv44M2NsdgWheaMNCtlNq
         oF8mOZRu6lfTLf3gyZwAyfTplxO1xDaSgdz3ewMQmsS0Q8ZqIv6GHlK8qjB0eS8pRV9R
         Sbpw9c/kO0JtyQ5Crw7Ma68ztwEyfbrdpMe3Lq2EX7u4KuVA90JHOXsCQ6WIJMvNw0e3
         wxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185197; x=1682777197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/E4K44ZeZZYqRKZWo/54gNqfFdiOexAGD/vcXLfhbk=;
        b=4vEyDfDADZ436RsSts2ILTuY2eiVBzYx9ArMunfMNcA0a14hjanxMZS6ijmw6mGEkZ
         zzlfzHtb2cpEWdlu5xs42ZTVGV7wa1BtI2gMBYdjrBpcNj2uyOEeAHPdjhuO4OI13kgM
         FA71G+tQnAJkLINaOAnYJcwvez1/hDCeRE//HXmY/oVj41ZPcoJrsl4UspCu/cn4UTX+
         Lj9DwkfwjJqms3L4Noz7JaqbS4Bw+E5ze8jNdbmRQQZ068rlz2nds42XfLKzDbMqz5Ww
         snAZljSpUNls1ArrW1hniQeA5q2jwPGqMKboxr0eka0ZWiai5F5y74heRVDmg2bk55dJ
         vJZw==
X-Gm-Message-State: AO0yUKW0cVpZvbaBn8SdiwbCn1E4p76ZMbfx5cXAtXSyzwH0u/ocYLPk
	WDtsfQocruIVE6Hj/X8xg148Ta3N+tDooHkrWTU=
X-Google-Smtp-Source: AK7set/OUR1Lt5wIsEHMVmR/f7VtAT0a4WWdtAvjg+3tOkSu/WxdcLyTVziBmP4/UpP3f6cEpr4GXK0W1km07vkZYco=
X-Received: by 2002:a02:2208:0:b0:3ad:65e:e489 with SMTP id
 o8-20020a022208000000b003ad065ee489mr9762921jao.1.1680185196784; Thu, 30 Mar
 2023 07:06:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-22-arnd@kernel.org>
In-Reply-To: <20230327121317.4081816-22-arnd@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 30 Mar 2023 15:06:10 +0100
Message-ID: <CA+V-a8sotfmOu=Z1QP54nt_w8ZGOEEbxAROUm5dXT_wTohw9aQ@mail.gmail.com>
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic implementation
To: Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstr
 ong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 1:20=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Now that all of these have consistent behavior, replace them with
> a single shared implementation of arch_sync_dma_for_device() and
> arch_sync_dma_for_cpu() and three parameters to pick how they should
> operate:
>
>  - If the CPU has speculative prefetching, then the cache
>    has to be invalidated after a transfer from the device.
>    On the rarer CPUs without prefetching, this can be skipped,
>    with all cache management happening before the transfer.
>    This flag can be runtime detected, but is usually fixed
>    per architecture.
>
>  - Some architectures currently clean the caches before DMA
>    from a device, while others invalidate it. There has not
>    been a conclusion regarding whether we should change all
>    architectures to use clean instead, so this adds an
>    architecture specific flag that we can change later on.
>
>  - On 32-bit Arm, the arch_sync_dma_for_cpu() function keeps
>    track pages that are marked clean in the page cache, to
>    avoid flushing them again. The implementation for this is
>    generic enough to work on all architectures that use the
>    PG_dcache_clean page flag, but a Kconfig symbol is used
>    to only enable it on Arm to preserve the existing behavior.
>
> For the function naming, I picked 'wback' over 'clean', and 'wback_inv'
> over 'flush', to avoid any ambiguity of what the helper functions are
> supposed to do.
>
> Moving the global functions into a header file is usually a bad idea
> as it prevents the header from being included more than once, but it
> helps keep the behavior as close as possible to the previous state,
> including the possibility of inlining most of it into these functions
> where that was done before. This also helps keep the global namespace
> clean, by hiding the new arch_dma_cache{_wback,_inv,_wback_inv} from
> device drivers that might use them incorrectly.
>
> It would be possible to do this one architecture at a time, but
> as the change is the same everywhere, the combined patch helps
> explain it better once.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/mm/dma.c                 |  66 +++++-------------
>  arch/arm/Kconfig                  |   3 +
>  arch/arm/mm/dma-mapping-nommu.c   |  39 ++++++-----
>  arch/arm/mm/dma-mapping.c         |  64 +++++++-----------
>  arch/arm64/mm/dma-mapping.c       |  28 +++++---
>  arch/csky/mm/dma-mapping.c        |  44 ++++++------
>  arch/hexagon/kernel/dma.c         |  44 ++++++------
>  arch/m68k/kernel/dma.c            |  43 +++++++-----
>  arch/microblaze/kernel/dma.c      |  48 +++++++-------
>  arch/mips/mm/dma-noncoherent.c    |  60 +++++++----------
>  arch/nios2/mm/dma-mapping.c       |  57 +++++++---------
>  arch/openrisc/kernel/dma.c        |  63 +++++++++++-------
>  arch/parisc/kernel/pci-dma.c      |  46 ++++++-------
>  arch/powerpc/mm/dma-noncoherent.c |  34 ++++++----
>  arch/riscv/mm/dma-noncoherent.c   |  51 +++++++-------
>  arch/sh/kernel/dma-coherent.c     |  43 +++++++-----
>  arch/sparc/kernel/ioport.c        |  38 ++++++++---
>  arch/xtensa/kernel/pci-dma.c      |  40 ++++++-----
>  include/linux/dma-sync.h          | 107 ++++++++++++++++++++++++++++++
>  19 files changed, 527 insertions(+), 391 deletions(-)
>  create mode 100644 include/linux/dma-sync.h
>
I tested this on RZ/Five (with my v6 [0] + additional changes) so for RISC-=
V,

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

[0] https://patchwork.kernel.org/project/linux-renesas-soc/cover/2023010618=
5526.260163-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

> diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
> index ddb96786f765..61cd01646222 100644
> --- a/arch/arc/mm/dma.c
> +++ b/arch/arc/mm/dma.c
> @@ -30,63 +30,33 @@ void arch_dma_prep_coherent(struct page *page, size_t=
 size)
>         dma_cache_wback_inv(page_to_phys(page), size);
>  }
>
> -/*
> - * Cache operations depending on function and direction argument, inspir=
ed by
> - * https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.or=
g.uk
> - * "dma_sync_*_for_cpu and direction=3DTO_DEVICE (was Re: [PATCH 02/20]
> - * dma-mapping: provide a generic dma-noncoherent implementation)"
> - *
> - *          |   map          =3D=3D  for_device     |   unmap     =3D=3D=
  for_cpu
> - *          |-----------------------------------------------------------=
-----
> - * TO_DEV   |   writeback        writeback      |   none          none
> - * FROM_DEV |   invalidate       invalidate     |   invalidate*   invali=
date*
> - * BIDIR    |   writeback        writeback      |   invalidate    invali=
date
> - *
> - *     [*] needed for CPU speculative prefetches
> - *
> - * NOTE: we don't check the validity of direction argument as it is done=
 in
> - * upper layer functions (in include/linux/dma-mapping.h)
> - */
> -
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               dma_cache_wback(paddr, size);
> -               break;
> -
> -       case DMA_FROM_DEVICE:
> -               dma_cache_inv(paddr, size);
> -               break;
> -
> -       case DMA_BIDIRECTIONAL:
> -               dma_cache_wback(paddr, size);
> -               break;
> +       dma_cache_wback(paddr, size);
> +}
>
> -       default:
> -               break;
> -       }
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       dma_cache_inv(paddr, size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               break;
> +       dma_cache_wback_inv(paddr, size);
> +}
>
> -       /* FROM_DEVICE invalidate needed if speculative CPU prefetch only=
 */
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               dma_cache_inv(paddr, size);
> -               break;
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
>
> -       default:
> -               break;
> -       }
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
>  }
>
> +#include <linux/dma-sync.h>
> +
>  /*
>   * Plug in direct dma map ops.
>   */
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 125d58c54ab1..0de84e861027 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -212,6 +212,9 @@ config LOCKDEP_SUPPORT
>         bool
>         default y
>
> +config ARCH_DMA_MARK_DCACHE_CLEAN
> +       def_bool y
> +
>  config ARCH_HAS_ILOG2_U32
>         bool
>
> diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-no=
mmu.c
> index 12b5c6ae93fc..0817274aed15 100644
> --- a/arch/arm/mm/dma-mapping-nommu.c
> +++ b/arch/arm/mm/dma-mapping-nommu.c
> @@ -13,27 +13,36 @@
>
>  #include "dma.h"
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       if (dir =3D=3D DMA_FROM_DEVICE) {
> -               dmac_inv_range(__va(paddr), __va(paddr + size));
> -               outer_inv_range(paddr, paddr + size);
> -       } else {
> -               dmac_clean_range(__va(paddr), __va(paddr + size));
> -               outer_clean_range(paddr, paddr + size);
> -       }
> +       dmac_clean_range(__va(paddr), __va(paddr + size));
> +       outer_clean_range(paddr, paddr + size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -       if (dir !=3D DMA_TO_DEVICE) {
> -               outer_inv_range(paddr, paddr + size);
> -               dmac_inv_range(__va(paddr), __va(paddr));
> -       }
> +       dmac_inv_range(__va(paddr), __va(paddr + size));
> +       outer_inv_range(paddr, paddr + size);
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       dmac_flush_range(__va(paddr), __va(paddr + size));
> +       outer_flush_range(paddr, paddr + size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>                         const struct iommu_ops *iommu, bool coherent)
>  {
> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
> index b703cb83d27e..aa6ee820a0ab 100644
> --- a/arch/arm/mm/dma-mapping.c
> +++ b/arch/arm/mm/dma-mapping.c
> @@ -687,6 +687,30 @@ void arch_dma_mark_clean(phys_addr_t paddr, size_t s=
ize)
>         }
>  }
>
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
> +{
> +       dma_cache_maint(paddr, size, dmac_clean_range);
> +       outer_clean_range(paddr, paddr + size);
> +}
> +
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       dma_cache_maint(paddr, size, dmac_inv_range);
> +       outer_inv_range(paddr, paddr + size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       dma_cache_maint(paddr, size, dmac_flush_range);
> +       outer_flush_range(paddr, paddr + size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
>  static bool arch_sync_dma_cpu_needs_post_dma_flush(void)
>  {
>         if (IS_ENABLED(CONFIG_CPU_V6) ||
> @@ -699,45 +723,7 @@ static bool arch_sync_dma_cpu_needs_post_dma_flush(v=
oid)
>         return false;
>  }
>
> -/*
> - * Make an area consistent for devices.
> - * Note: Drivers should NOT use this function directly.
> - * Use the driver DMA support - see dma-mapping.h (dma_sync_*)
> - */
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> -{
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               dma_cache_maint(paddr, size, dmac_clean_range);
> -               outer_clean_range(paddr, paddr + size);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               dma_cache_maint(paddr, size, dmac_inv_range);
> -               outer_inv_range(paddr, paddr + size);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               if (arch_sync_dma_cpu_needs_post_dma_flush()) {
> -                       dma_cache_maint(paddr, size, dmac_clean_range);
> -                       outer_clean_range(paddr, paddr + size);
> -               } else {
> -                       dma_cache_maint(paddr, size, dmac_flush_range);
> -                       outer_flush_range(paddr, paddr + size);
> -               }
> -               break;
> -       default:
> -               break;
> -       }
> -}
> -
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> -{
> -       if (dir !=3D DMA_TO_DEVICE && arch_sync_dma_cpu_needs_post_dma_fl=
ush()) {
> -               outer_inv_range(paddr, paddr + size);
> -               dma_cache_maint(paddr, size, dmac_inv_range);
> -       }
> -}
> +#include <linux/dma-sync.h>
>
>  #ifdef CONFIG_ARM_DMA_USE_IOMMU
>
> diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
> index 5240f6acad64..bae741aa65e9 100644
> --- a/arch/arm64/mm/dma-mapping.c
> +++ b/arch/arm64/mm/dma-mapping.c
> @@ -13,25 +13,33 @@
>  #include <asm/cacheflush.h>
>  #include <asm/xen/xen-ops.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -                             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> +       dcache_clean_poc(paddr, paddr + size);
> +}
>
> -       dcache_clean_poc(start, start + size);
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       dcache_inval_poc(paddr, paddr + size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -                          enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
>  {
> -       unsigned long start =3D (unsigned long)phys_to_virt(paddr);
> +       dcache_clean_inval_poc(paddr, paddr + size);
> +}
>
> -       if (dir =3D=3D DMA_TO_DEVICE)
> -               return;
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return true;
> +}
>
> -       dcache_inval_poc(start, start + size);
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
>  }
>
> +#include <linux/dma-sync.h>
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>         unsigned long start =3D (unsigned long)page_address(page);
> diff --git a/arch/csky/mm/dma-mapping.c b/arch/csky/mm/dma-mapping.c
> index c90f912e2822..9402e101b363 100644
> --- a/arch/csky/mm/dma-mapping.c
> +++ b/arch/csky/mm/dma-mapping.c
> @@ -55,31 +55,29 @@ void arch_dma_prep_coherent(struct page *page, size_t=
 size)
>         cache_op(page_to_phys(page), size, dma_wbinv_set_zero_range);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               cache_op(paddr, size, dma_wb_range);
> -               break;
> -       default:
> -               BUG();
> -       }
> +       cache_op(paddr, size, dma_wb_range);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               return;
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               cache_op(paddr, size, dma_inv_range);
> -               break;
> -       default:
> -               BUG();
> -       }
> +       cache_op(paddr, size, dma_inv_range);
>  }
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       cache_op(paddr, size, dma_wbinv_range);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/hexagon/kernel/dma.c b/arch/hexagon/kernel/dma.c
> index 882680e81a30..e6538128a75b 100644
> --- a/arch/hexagon/kernel/dma.c
> +++ b/arch/hexagon/kernel/dma.c
> @@ -9,29 +9,33 @@
>  #include <linux/memblock.h>
>  #include <asm/page.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       void *addr =3D phys_to_virt(paddr);
> -
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               hexagon_clean_dcache_range((unsigned long) addr,
> -               (unsigned long) addr + size);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               hexagon_inv_dcache_range((unsigned long) addr,
> -               (unsigned long) addr + size);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               flush_dcache_range((unsigned long) addr,
> -               (unsigned long) addr + size);
> -               break;
> -       default:
> -               BUG();
> -       }
> +       hexagon_clean_dcache_range(paddr, paddr + size);
>  }
>
> +static inline void arch_dma_cache_inv(phys_addr_t start, size_t size)
> +{
> +       hexagon_inv_dcache_range(paddr, paddr + size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t start, size_t si=
ze)
> +{
> +       hexagon_flush_dcache_range(paddr, paddr + size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return false;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  /*
>   * Our max_low_pfn should have been backed off by 16MB in mm/init.c to c=
reate
>   * DMA coherent space.  Use that for the pool.
> diff --git a/arch/m68k/kernel/dma.c b/arch/m68k/kernel/dma.c
> index 2e192a5df949..aa9b434e6df8 100644
> --- a/arch/m68k/kernel/dma.c
> +++ b/arch/m68k/kernel/dma.c
> @@ -58,20 +58,33 @@ void arch_dma_free(struct device *dev, size_t size, v=
oid *vaddr,
>
>  #endif /* CONFIG_MMU && !CONFIG_COLDFIRE */
>
> -void arch_sync_dma_for_device(phys_addr_t handle, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_BIDIRECTIONAL:
> -       case DMA_TO_DEVICE:
> -               cache_push(handle, size);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               cache_clear(handle, size);
> -               break;
> -       default:
> -               pr_err_ratelimited("dma_sync_single_for_device: unsupport=
ed dir %u\n",
> -                                  dir);
> -               break;
> -       }
> +       /*
> +        * cache_push() always invalidates in addition to cleaning
> +        * write-back caches.
> +        */
> +       cache_push(paddr, size);
> +}
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       cache_clear(paddr, size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       cache_push(paddr, size);
>  }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return false;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/microblaze/kernel/dma.c b/arch/microblaze/kernel/dma.c
> index b4c4e45fd45e..01110d4aa5b0 100644
> --- a/arch/microblaze/kernel/dma.c
> +++ b/arch/microblaze/kernel/dma.c
> @@ -14,32 +14,30 @@
>  #include <linux/bug.h>
>  #include <asm/cacheflush.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       switch (direction) {
> -       case DMA_TO_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               flush_dcache_range(paddr, paddr + size);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               invalidate_dcache_range(paddr, paddr + size);
> -               break;
> -       default:
> -               BUG();
> -       }
> +       /* writeback plus invalidate, could be a nop on WT caches */
> +       flush_dcache_range(paddr, paddr + size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -       switch (direction) {
> -       case DMA_TO_DEVICE:
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -       case DMA_FROM_DEVICE:
> -               invalidate_dcache_range(paddr, paddr + size);
> -               break;
> -       default:
> -               BUG();
> -       }}
> +       invalidate_dcache_range(paddr, paddr + size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       flush_dcache_range(paddr, paddr + size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoheren=
t.c
> index b9d68bcc5d53..902d4b7c1f85 100644
> --- a/arch/mips/mm/dma-noncoherent.c
> +++ b/arch/mips/mm/dma-noncoherent.c
> @@ -85,50 +85,38 @@ static inline void dma_sync_phys(phys_addr_t paddr, s=
ize_t size,
>         } while (left);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               dma_sync_phys(paddr, size, _dma_cache_wback);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               dma_sync_phys(paddr, size, _dma_cache_inv);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
> -                   cpu_needs_post_dma_flush())
> -                       dma_sync_phys(paddr, size, _dma_cache_wback);
> -               else
> -                       dma_sync_phys(paddr, size, _dma_cache_wback_inv);
> -               break;
> -       default:
> -               break;
> -       }
> +       dma_sync_phys(paddr, size, _dma_cache_wback);
>  }
>
> -#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               break;
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               if (cpu_needs_post_dma_flush())
> -                       dma_sync_phys(paddr, size, _dma_cache_inv);
> -               break;
> -       default:
> -               break;
> -       }
> +       dma_sync_phys(paddr, size, _dma_cache_inv);
>  }
> -#endif
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       dma_sync_phys(paddr, size, _dma_cache_wback_inv);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
> +                    cpu_needs_post_dma_flush();
> +}
> +
> +#include <linux/dma-sync.h>
>
>  #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
>  void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
> -               const struct iommu_ops *iommu, bool coherent)
> +               const struct iommu_ops *iommu, bool coherent)
>  {
> -       dev->dma_coherent =3D coherent;
> +       dev->dma_coherent =3D coherent;
>  }
>  #endif
> diff --git a/arch/nios2/mm/dma-mapping.c b/arch/nios2/mm/dma-mapping.c
> index fd887d5f3f9a..29978970955e 100644
> --- a/arch/nios2/mm/dma-mapping.c
> +++ b/arch/nios2/mm/dma-mapping.c
> @@ -13,53 +13,46 @@
>  #include <linux/types.h>
>  #include <linux/mm.h>
>  #include <linux/string.h>
> +#include <linux/dma-map-ops.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/io.h>
>  #include <linux/cache.h>
>  #include <asm/cacheflush.h>
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> +       /*
> +        * We just need to write back the caches here, but Nios2 flush
> +        * instruction will do both writeback and invalidate.
> +        */
>         void *vaddr =3D phys_to_virt(paddr);
> +       flush_dcache_range((unsigned long)vaddr, (unsigned long)(vaddr + =
size));
> +}
>
> -       switch (dir) {
> -       case DMA_FROM_DEVICE:
> -               invalidate_dcache_range((unsigned long)vaddr,
> -                       (unsigned long)(vaddr + size));
> -               break;
> -       case DMA_TO_DEVICE:
> -               /*
> -                * We just need to flush the caches here , but Nios2 flus=
h
> -                * instruction will do both writeback and invalidate.
> -                */
> -       case DMA_BIDIRECTIONAL: /* flush and invalidate */
> -               flush_dcache_range((unsigned long)vaddr,
> -                       (unsigned long)(vaddr + size));
> -               break;
> -       default:
> -               BUG();
> -       }
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       unsigned long vaddr =3D (unsigned long)phys_to_virt(paddr);
> +       invalidate_dcache_range(vaddr, (unsigned long)(vaddr + size));
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
>  {
>         void *vaddr =3D phys_to_virt(paddr);
> +       flush_dcache_range((unsigned long)vaddr, (unsigned long)(vaddr + =
size));
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
>
> -       switch (dir) {
> -       case DMA_BIDIRECTIONAL:
> -       case DMA_FROM_DEVICE:
> -               invalidate_dcache_range((unsigned long)vaddr,
> -                       (unsigned long)(vaddr + size));
> -               break;
> -       case DMA_TO_DEVICE:
> -               break;
> -       default:
> -               BUG();
> -       }
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
>  }
>
> +#include <linux/dma-sync.h>
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>         unsigned long start =3D (unsigned long)page_address(page);
> diff --git a/arch/openrisc/kernel/dma.c b/arch/openrisc/kernel/dma.c
> index 91a00d09ffad..aba2258e62eb 100644
> --- a/arch/openrisc/kernel/dma.c
> +++ b/arch/openrisc/kernel/dma.c
> @@ -95,32 +95,47 @@ void arch_dma_clear_uncached(void *cpu_addr, size_t s=
ize)
>         mmap_write_unlock(&init_mm);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t addr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         unsigned long cl;
>         struct cpuinfo_or1k *cpuinfo =3D &cpuinfo_or1k[smp_processor_id()=
];
>
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               /* Write back the dcache for the requested range */
> -               for (cl =3D addr; cl < addr + size;
> -                    cl +=3D cpuinfo->dcache_block_size)
> -                       mtspr(SPR_DCBWR, cl);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               /* Invalidate the dcache for the requested range */
> -               for (cl =3D addr; cl < addr + size;
> -                    cl +=3D cpuinfo->dcache_block_size)
> -                       mtspr(SPR_DCBIR, cl);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               /* Flush the dcache for the requested range */
> -               for (cl =3D addr; cl < addr + size;
> -                    cl +=3D cpuinfo->dcache_block_size)
> -                       mtspr(SPR_DCBFR, cl);
> -               break;
> -       default:
> -               break;
> -       }
> +       /* Write back the dcache for the requested range */
> +       for (cl =3D paddr; cl < paddr + size;
> +            cl +=3D cpuinfo->dcache_block_size)
> +               mtspr(SPR_DCBWR, cl);
>  }
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       unsigned long cl;
> +       struct cpuinfo_or1k *cpuinfo =3D &cpuinfo_or1k[smp_processor_id()=
];
> +
> +       /* Invalidate the dcache for the requested range */
> +       for (cl =3D paddr; cl < paddr + size;
> +            cl +=3D cpuinfo->dcache_block_size)
> +               mtspr(SPR_DCBIR, cl);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       unsigned long cl;
> +       struct cpuinfo_or1k *cpuinfo =3D &cpuinfo_or1k[smp_processor_id()=
];
> +
> +       /* Flush the dcache for the requested range */
> +       for (cl =3D paddr; cl < paddr + size;
> +            cl +=3D cpuinfo->dcache_block_size)
> +               mtspr(SPR_DCBFR, cl);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return false;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/parisc/kernel/pci-dma.c b/arch/parisc/kernel/pci-dma.c
> index 6d3d3cffb316..a7955aab8ce2 100644
> --- a/arch/parisc/kernel/pci-dma.c
> +++ b/arch/parisc/kernel/pci-dma.c
> @@ -443,35 +443,35 @@ void arch_dma_free(struct device *dev, size_t size,=
 void *vaddr,
>         free_pages((unsigned long)__va(dma_handle), order);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
>
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               clean_kernel_dcache_range(virt, size);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               clean_kernel_dcache_range(virt, size);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               flush_kernel_dcache_range(virt, size);
> -               break;
> -       }
> +       clean_kernel_dcache_range(virt, size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
>         unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
>
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               break;
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               purge_kernel_dcache_range(virt, size);
> -               break;
> -       }
> +       purge_kernel_dcache_range(virt, size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       unsigned long virt =3D (unsigned long)phys_to_virt(paddr);
> +
> +       flush_kernel_dcache_range(virt, size);
>  }
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/powerpc/mm/dma-noncoherent.c b/arch/powerpc/mm/dma-nonc=
oherent.c
> index 00e59a4faa2b..268510c71156 100644
> --- a/arch/powerpc/mm/dma-noncoherent.c
> +++ b/arch/powerpc/mm/dma-noncoherent.c
> @@ -101,27 +101,33 @@ static void __dma_phys_op(phys_addr_t paddr, size_t=
 size, enum dma_cache_op op)
>  #endif
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         __dma_phys_op(start, end, DMA_CACHE_CLEAN);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
> -       switch (direction) {
> -       case DMA_NONE:
> -               BUG();
> -       case DMA_TO_DEVICE:
> -               break;
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               __dma_phys_op(start, end, DMA_CACHE_INVAL);
> -               break;
> -       }
> +       __dma_phys_op(start, end, DMA_CACHE_INVAL);
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       __dma_phys_op(start, end, DMA_CACHE_FLUSH);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>         unsigned long kaddr =3D (unsigned long)page_address(page);
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index 69c80b2155a1..b9a9f57e02be 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -12,43 +12,40 @@
>
>  static bool noncoherent_supported;
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -                             enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         void *vaddr =3D phys_to_virt(paddr);
>
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
> -               break;
> -       default:
> -               break;
> -       }
> +       ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
>  }
>
> -void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> -                          enum dma_data_direction dir)
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>  {
>         void *vaddr =3D phys_to_virt(paddr);
>
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               break;
> -       case DMA_FROM_DEVICE:
> -       case DMA_BIDIRECTIONAL:
> -               ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
> -               break;
> -       default:
> -               break;
> -       }
> +       ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       void *vaddr =3D phys_to_virt(paddr);
> +
> +       ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return true;
> +}
> +
> +#include <linux/dma-sync.h>
> +
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>         void *flush_addr =3D page_address(page);
> diff --git a/arch/sh/kernel/dma-coherent.c b/arch/sh/kernel/dma-coherent.=
c
> index 6a44c0e7ba40..41f031ae7609 100644
> --- a/arch/sh/kernel/dma-coherent.c
> +++ b/arch/sh/kernel/dma-coherent.c
> @@ -12,22 +12,35 @@ void arch_dma_prep_coherent(struct page *page, size_t=
 size)
>         __flush_purge_region(page_address(page), size);
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
>         void *addr =3D sh_cacheop_vaddr(phys_to_virt(paddr));
>
> -       switch (dir) {
> -       case DMA_FROM_DEVICE:           /* invalidate only */
> -               __flush_invalidate_region(addr, size);
> -               break;
> -       case DMA_TO_DEVICE:             /* writeback only */
> -               __flush_wback_region(addr, size);
> -               break;
> -       case DMA_BIDIRECTIONAL:         /* writeback and invalidate */
> -               __flush_purge_region(addr, size);
> -               break;
> -       default:
> -               BUG();
> -       }
> +       __flush_wback_region(addr, size);
>  }
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       void *addr =3D sh_cacheop_vaddr(phys_to_virt(paddr));
> +
> +       __flush_invalidate_region(addr, size);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       void *addr =3D sh_cacheop_vaddr(phys_to_virt(paddr));
> +
> +       __flush_purge_region(addr, size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return false;
> +}
> +
> +#include <linux/dma-sync.h>
> diff --git a/arch/sparc/kernel/ioport.c b/arch/sparc/kernel/ioport.c
> index 4f3d26066ec2..6926ead2f208 100644
> --- a/arch/sparc/kernel/ioport.c
> +++ b/arch/sparc/kernel/ioport.c
> @@ -300,21 +300,39 @@ arch_initcall(sparc_register_ioport);
>
>  #endif /* CONFIG_SBUS */
>
> -/*
> - * IIep is write-through, not flushing on cpu to device transfer.
> - *
> - * On LEON systems without cache snooping, the entire D-CACHE must be fl=
ushed to
> - * make DMA to cacheable memory coherent.
> - */
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       if (dir !=3D DMA_TO_DEVICE &&
> -           sparc_cpu_model =3D=3D sparc_leon &&
> +       /* IIep is write-through, not flushing on cpu to device transfer.=
 */
> +}
> +
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       /*
> +        * On LEON systems without cache snooping, the entire D-CACHE mus=
t be
> +        * flushed to make DMA to cacheable memory coherent.
> +        */
> +       if (sparc_cpu_model =3D=3D sparc_leon &&
>             !sparc_leon3_snooping_enabled())
>                 leon_flush_dcache_all();
>  }
>
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       arch_dma_cache_inv(paddr, size);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return true;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return false;
> +}
> +
> +#include <linux/dma-sync.h>
> +
>  #ifdef CONFIG_PROC_FS
>
>  static int sparc_io_proc_show(struct seq_file *m, void *v)
> diff --git a/arch/xtensa/kernel/pci-dma.c b/arch/xtensa/kernel/pci-dma.c
> index ff3bf015eca4..d4ff96585545 100644
> --- a/arch/xtensa/kernel/pci-dma.c
> +++ b/arch/xtensa/kernel/pci-dma.c
> @@ -43,24 +43,34 @@ static void do_cache_op(phys_addr_t paddr, size_t siz=
e,
>                 }
>  }
>
> -void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> -               enum dma_data_direction dir)
> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> -       switch (dir) {
> -       case DMA_TO_DEVICE:
> -               do_cache_op(paddr, size, __flush_dcache_range);
> -               break;
> -       case DMA_FROM_DEVICE:
> -               do_cache_op(paddr, size, __invalidate_dcache_range);
> -               break;
> -       case DMA_BIDIRECTIONAL:
> -               do_cache_op(paddr, size, __flush_invalidate_dcache_range)=
;
> -               break;
> -       default:
> -               break;
> -       }
> +       do_cache_op(paddr, size, __flush_dcache_range);
>  }
>
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +       do_cache_op(paddr, size, __invalidate_dcache_range);
> +}
> +
> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t si=
ze)
> +{
> +       do_cache_op(paddr, size, __flush_invalidate_dcache_range);
> +}
> +
> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +       return false;
> +}
> +
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +       return false;
> +}
> +
> +#include <linux/dma-sync.h>
> +
> +
>  void arch_dma_prep_coherent(struct page *page, size_t size)
>  {
>         __invalidate_dcache_range((unsigned long)page_address(page), size=
);
> diff --git a/include/linux/dma-sync.h b/include/linux/dma-sync.h
> new file mode 100644
> index 000000000000..18e33d5e8eaf
> --- /dev/null
> +++ b/include/linux/dma-sync.h
> @@ -0,0 +1,107 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Cache operations depending on function and direction argument, inspir=
ed by
> + * https://lore.kernel.org/lkml/20180518175004.GF17671@n2100.armlinux.or=
g.uk
> + * "dma_sync_*_for_cpu and direction=3DTO_DEVICE (was Re: [PATCH 02/20]
> + * dma-mapping: provide a generic dma-noncoherent implementation)"
> + *
> + *          |   map          =3D=3D  for_device     |   unmap     =3D=3D=
  for_cpu
> + *          |-----------------------------------------------------------=
-----
> + * TO_DEV   |   writeback        writeback      |   none          none
> + * FROM_DEV |   invalidate       invalidate     |   invalidate*   invali=
date*
> + * BIDIR    |   writeback        writeback      |   invalidate    invali=
date
> + *
> + *     [*] needed for CPU speculative prefetches
> + *
> + * NOTE: we don't check the validity of direction argument as it is done=
 in
> + * upper layer functions (in include/linux/dma-mapping.h)
> + *
> + * This file can be included by arch/.../kernel/dma-noncoherent.c to pro=
vide
> + * the respective high-level operations without having to expose the
> + * cache management ops to drivers.
> + */
> +
> +void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> +               enum dma_data_direction dir)
> +{
> +       switch (dir) {
> +       case DMA_TO_DEVICE:
> +               /*
> +                * This may be an empty function on write-through caches,
> +                * and it might invalidate the cache if an architecture h=
as
> +                * a write-back cache but no way to write it back without
> +                * invalidating
> +                */
> +               arch_dma_cache_wback(paddr, size);
> +               break;
> +
> +       case DMA_FROM_DEVICE:
> +               /*
> +                * FIXME: this should be handled the same across all
> +                * architectures, see
> +                * https://lore.kernel.org/all/20220606152150.GA31568@wil=
lie-the-truck/
> +                */
> +               if (!arch_sync_dma_clean_before_fromdevice()) {
> +                       arch_dma_cache_inv(paddr, size);
> +                       break;
> +               }
> +               fallthrough;
> +
> +       case DMA_BIDIRECTIONAL:
> +               /* Skip the invalidate here if it's done later */
> +               if (IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) &&
> +                   arch_sync_dma_cpu_needs_post_dma_flush())
> +                       arch_dma_cache_wback(paddr, size);
> +               else
> +                       arch_dma_cache_wback_inv(paddr, size);
> +               break;
> +
> +       default:
> +               break;
> +       }
> +}
> +
> +#ifdef CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU
> +/*
> + * Mark the D-cache clean for these pages to avoid extra flushing.
> + */
> +static void arch_dma_mark_dcache_clean(phys_addr_t paddr, size_t size)
> +{
> +#ifdef CONFIG_ARCH_DMA_MARK_DCACHE_CLEAN
> +       unsigned long pfn =3D PFN_UP(paddr);
> +       unsigned long off =3D paddr & (PAGE_SIZE - 1);
> +       size_t left =3D size;
> +
> +       if (off)
> +               left -=3D PAGE_SIZE - off;
> +
> +       while (left >=3D PAGE_SIZE) {
> +               struct page *page =3D pfn_to_page(pfn++);
> +               set_bit(PG_dcache_clean, &page->flags);
> +               left -=3D PAGE_SIZE;
> +       }
> +#endif
> +}
> +
> +void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
> +               enum dma_data_direction dir)
> +{
> +       switch (dir) {
> +       case DMA_TO_DEVICE:
> +               break;
> +
> +       case DMA_FROM_DEVICE:
> +       case DMA_BIDIRECTIONAL:
> +               /* FROM_DEVICE invalidate needed if speculative CPU prefe=
tch only */
> +               if (arch_sync_dma_cpu_needs_post_dma_flush())
> +                       arch_dma_cache_inv(paddr, size);
> +
> +               if (size > PAGE_SIZE)
> +                       arch_dma_mark_dcache_clean(paddr, size);
> +               break;
> +
> +       default:
> +               break;
> +       }
> +}
> +#endif
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
