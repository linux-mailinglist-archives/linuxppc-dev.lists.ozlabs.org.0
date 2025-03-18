Return-Path: <linuxppc-dev+bounces-7191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 607EEA67E15
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 21:39:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHNx31z9Mz2y3b;
	Wed, 19 Mar 2025 07:39:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742330359;
	cv=none; b=Xy9P7cbPlAAyXoVDFd4uL9FEHPlpfSlBUXjUCQTqu7mJYBWITBRY6ldry5LIJizBJujfTnUK1TSfNvVMBUeTnhTC/M3JK6Hwsuxuj4amYDB1IUKYtEf7rucweMgTgdjNknU+H0ZE77/9xkEd4dTtyh/FSPPp5s0AHtKvr+ONsRIrkskcQh/wiBJrvuX1XVKsp5DRMIwjJvRHioua9C30Cgwo3lLX7Je4aPji7E1xYeg4S2pvv7VtRyVITFJtbkFhXfXhfAGirykGD/e1Th0+Cz8gdlm3h8e05TWXslDN+eIUi9l6buVWlLOhzoeQPkOPSQNpjGiS7Taz8i3DzAw18A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742330359; c=relaxed/relaxed;
	bh=9FjVFDMFlCvMHMBiG46M5ScSJzzjD47KwtLXXYAEPMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYykHdPvj3TSs9NxYwxVy0v8gtB4D8ydc8A8qN/YLbm1zsjmqr3QCaFpqDU1XPkXqscW2V0Avbv0ZwSHN2MKbSn47DliohzUhzE+vvWEqV/Rzk3UQX6LqEhpjqlt2yqhFb51KYJxoK6JhxPYBF2DBT6LzO6+XpRwC0Cru36kzbnYWRHZpbzBH+C3MbgIONOLjeKn8cRyIdHMUHyFR4K/DqYa9uDn50qLJRkZSQK5akfhIOLRYaNA/KRjhiXwTD9MYbmYRYMWXqMLvQ+x8yzBjsLGIGbgeICP1c5xu8KuaTa4bbCzqz1IEpXNLxYdYsbVpOxR6L7+yXl1sTRBpZ+eDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jmmQG2jQ; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jmmQG2jQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHNx21Tmhz2xqC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 07:39:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0978A48DFE;
	Tue, 18 Mar 2025 20:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B08C4CEDD;
	Tue, 18 Mar 2025 20:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742330354;
	bh=qOyqx98uYZaxnz8iL9sLUntJPSrsmCPx493u7R+Lnjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jmmQG2jQTeVh/Wo0UkAwvIfRQMT2BJv/NcHjMw9/oC0Ydce8fyHd1L+aw+8KMafl3
	 daX59WrcnM3SoKrzxsQacaGdCwHn7j0cgltFaXcG0FWxhVFtnkslrkuZDIzDoRzRx4
	 IjWJucl8viLRZjB6jNb8ziUAEg2ZashS5lFUm9KOgrzWbB46qr5FlcAk0+otns60zv
	 zhA+c7L2jF0UYcCtQPFuEa7cxrT2KfcgPaV1RSsgFeoXx2cdHyoL6Za5yJerW6sxM+
	 ny/JMURbcz1jhTP1rnK9+tp3IAUvGeP8ZRwA/QKlgFzadPDgO1TfdclmN0zu740gQG
	 fWnpzczIdmTNw==
Date: Tue, 18 Mar 2025 13:39:06 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Julian Vetter <julian@outer-limits.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 5/6] mips: drop GENERIC_IOMAP wrapper
Message-ID: <20250318203906.GA4089579@ax162>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-6-arnd@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315105907.1275012-6-arnd@kernel.org>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnd,

On Sat, Mar 15, 2025 at 11:59:06AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All PIO on MIPS platforms is memory mapped, so there is no benefit in
> the lib/iomap.c wrappers that switch between inb/outb and readb/writeb
> style accessses.
> 
> In fact, the '#define PIO_RESERVED 0' setting completely disables
> the GENERIC_IOMAP functionality, and the '#define PIO_OFFSET
> mips_io_port_base' setting is based on a misunderstanding of what the
> offset is meant to do.
> 
> MIPS started using GENERIC_IOMAP in 2018 with commit b962aeb02205 ("MIPS:
> Use GENERIC_IOMAP") replacing a simple custom implementation of the same
> interfaces, but at the time the asm-generic/io.h version was not usable
> yet. Since the header is now always included, it's now possible to go
> back to the even simpler version.
> 
> Use the normal GENERIC_PCI_IOMAP functionality for all mips platforms
> without the hacky GENERIC_IOMAP, and provide a custom pci_iounmap()
> for the CONFIG_PCI_DRIVERS_LEGACY case to ensure the I/O port base never
> gets unmapped.
> 
> The readsl() prototype needs an extra 'const' keyword to make it
> compatible with the generic ioread32_rep() alias.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/mips/Kconfig          |  2 +-
>  arch/mips/include/asm/io.h | 21 ++++++++-------------
>  arch/mips/lib/iomap-pci.c  |  9 +++++++++
>  3 files changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index 1924f2d83932..2a2120a6d852 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -38,7 +38,6 @@ config MIPS
>  	select GENERIC_CMOS_UPDATE
>  	select GENERIC_CPU_AUTOPROBE
>  	select GENERIC_GETTIMEOFDAY
> -	select GENERIC_IOMAP
>  	select GENERIC_IRQ_PROBE
>  	select GENERIC_IRQ_SHOW
>  	select GENERIC_ISA_DMA if EISA
> @@ -47,6 +46,7 @@ config MIPS
>  	select GENERIC_LIB_CMPDI2
>  	select GENERIC_LIB_LSHRDI3
>  	select GENERIC_LIB_UCMPDI2
> +	select GENERIC_PCI_IOMAP
>  	select GENERIC_SCHED_CLOCK if !CAVIUM_OCTEON_SOC
>  	select GENERIC_SMP_IDLE_THREAD
>  	select GENERIC_IDLE_POLL_SETUP
> diff --git a/arch/mips/include/asm/io.h b/arch/mips/include/asm/io.h
> index 0bddb568af7c..1fe56d1870a6 100644
> --- a/arch/mips/include/asm/io.h
> +++ b/arch/mips/include/asm/io.h
> @@ -66,17 +66,6 @@ static inline void set_io_port_base(unsigned long base)
>  	mips_io_port_base = base;
>  }
>  
> -/*
> - * Provide the necessary definitions for generic iomap. We make use of
> - * mips_io_port_base for iomap(), but we don't reserve any low addresses for
> - * use with I/O ports.
> - */
> -
> -#define HAVE_ARCH_PIO_SIZE
> -#define PIO_OFFSET	mips_io_port_base
> -#define PIO_MASK	IO_SPACE_LIMIT
> -#define PIO_RESERVED	0x0UL
> -
>  /*
>   * Enforce in-order execution of data I/O.  In the MIPS architecture
>   * these are equivalent to corresponding platform-specific memory
> @@ -397,8 +386,8 @@ static inline void writes##bwlq(volatile void __iomem *mem,		\
>  	}								\
>  }									\
>  									\
> -static inline void reads##bwlq(volatile void __iomem *mem, void *addr,	\
> -			       unsigned int count)			\
> +static inline void reads##bwlq(const volatile void __iomem *mem,	\
> +			       void *addr, unsigned int count)		\
>  {									\
>  	volatile type *__addr = addr;					\
>  									\
> @@ -555,6 +544,12 @@ extern void (*_dma_cache_inv)(unsigned long start, unsigned long size);
>  
>  void __ioread64_copy(void *to, const void __iomem *from, size_t count);
>  
> +#ifdef CONFIG_PCI_DRIVERS_LEGACY
> +struct pci_dev;
> +void pci_iounmap(struct pci_dev *dev, void __iomem *addr);
> +#define pci_iounmap pci_iounmap
> +#endif
> +
>  #include <asm-generic/io.h>
>  
>  static inline void *isa_bus_to_virt(unsigned long address)
> diff --git a/arch/mips/lib/iomap-pci.c b/arch/mips/lib/iomap-pci.c
> index a9cb28813f0b..2f82c776c6d0 100644
> --- a/arch/mips/lib/iomap-pci.c
> +++ b/arch/mips/lib/iomap-pci.c
> @@ -43,4 +43,13 @@ void __iomem *__pci_ioport_map(struct pci_dev *dev,
>  	return (void __iomem *) (ctrl->io_map_base + port);
>  }
>  
> +void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
> +{
> +	struct pci_controller *ctrl = dev->bus->sysdata;
> +	void __iomem *base = (void __iomem *)ctrl->io_map_base;
> +
> +	if (addr < base || addr > (base + resource_size(ctrl->io_resource)))
> +		iounmap(addr);
> +}
> +
>  #endif /* CONFIG_PCI_DRIVERS_LEGACY */
> -- 
> 2.39.5
> 

This change as commit 976bf3aec388 ("mips: drop GENERIC_IOMAP wrapper") in
-next introduces new instances of -Wnull-pointer-arithmetic when building
certain mips configurations with clang.

  $ make -skj"$(nproc)" ARCH=mips LLVM=1 mrproper malta_defconfig init/main.o
  ...
  In file included from init/main.c:17:
  In file included from include/linux/module.h:17:
  In file included from include/linux/kmod.h:9:
  In file included from include/linux/umh.h:4:
  In file included from include/linux/gfp.h:7:
  In file included from include/linux/mmzone.h:22:
  In file included from include/linux/mm_types.h:5:
  In file included from include/linux/mm_types_task.h:14:
  In file included from arch/mips/include/asm/page.h:181:
  In file included from arch/mips/include/asm/io.h:553:
  include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
        |                                                   ~~~~~~~~~~ ^
  1 warning generated.

Cheers,
Nathan

