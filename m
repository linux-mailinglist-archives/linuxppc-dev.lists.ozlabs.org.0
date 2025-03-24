Return-Path: <linuxppc-dev+bounces-7303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 143B1A6D2D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 02:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLbDb4HRgz2yHj;
	Mon, 24 Mar 2025 12:33:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742780031;
	cv=none; b=inrZsIKa+wRY0R4sZ7205RJhpAmahupUT1YMMSymSzmtOhfkf5kyaX0X1aWO/zepN+TSA+3r7PQ7Q515/5UF4puS6l3pnOXrKBrhsOdmxYXvWR+JGtge2PPzLkzwuSY4EpsVOjmlOBbJDOYQvnF0DBwuYsfqzAo6nqefOnST5Df8HigbR8OBGOaQLf0WwGOYlvN3980GV/bx7bCSwZy3xBc5ACdk5+qjSZKjDKtK9q1bNqgkZlGQd3mo1ufl35vWcv4OtqihbbFl7abJ4TcT36aVLMte16AAQ/Uxgz8LsUy+sjPVxE8hko50YJVJoFkcPrH1zYmJjf6ax6AUo3lkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742780031; c=relaxed/relaxed;
	bh=Rj5ozTJuceFyrWABOwsmQAvCsM/o50+/4A5IyDCqHPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S/e8zzozQFptqgdb5qksvvRvMbxmCXgSDzLTNUpOIqXsXLoxxhiVmVBQrPy+eiYK2ylV48hbuRenapj7MdQOsX9tcVj/LvR/3fMJWNxtw/hOSgaFn/wELQQ0sRWsvDoHf6wtg4NU4RIvStx2pj4hEKpFC2utX/B+u1o/vI5AC16OpjkwG+oubdDqersTqf6NNJ+j2bNzGINVe319j/+xlHmCSZqkmyyNGWLo4wHATe+4W/sBZWNbEY8wiuIo22cvqhhr27Z7Bkm57jDCfVNORRVTqNuTskWwXPWqY0YDYIeUwBPSW+m7CT1pzCUj8TDNDKha7+pdSHmp0hfHhrYKYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=d9jp=wl=linux-m68k.org=gerg@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=d9jp=wl=linux-m68k.org=gerg@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLbDY3sCCz2yGy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 12:33:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C30061583;
	Mon, 24 Mar 2025 01:33:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6601C4CEE2;
	Mon, 24 Mar 2025 01:33:38 +0000 (UTC)
Message-ID: <64f226e5-7931-40ba-878a-a28688da82fd@linux-m68k.org>
Date: Mon, 24 Mar 2025 11:33:35 +1000
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] m68k/nommu: stop using GENERIC_IOMAP
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Julian Vetter <julian@outer-limits.org>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-7-arnd@kernel.org>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250315105907.1275012-7-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnd,

On 15/3/25 20:59, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There is no need to go through the GENERIC_IOMAP wrapper for PIO on
> nommu platforms, since these always come from PCI I/O space that is
> itself memory mapped.
> 
> Instead, the generic ioport_map() can just return the MMIO location
> of the ports directly by applying the PCI_IO_PA offset, while
> ioread32/iowrite32 trivially turn into readl/writel as they do
> on most other architectures.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

With this applied this fails to build for me:

   UPD     include/generated/utsversion.h
   CC      init/version-timestamp.o
   LD      vmlinux
m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function `quirk_switchtec_ntb_dma_alias':
quirks.c:(.text+0x23e4): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x24fe): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function `disable_igfx_irq':
quirks.c:(.text+0x32f4): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3348): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x338a): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x33d2): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function `reset_ivb_igd':
quirks.c:(.text+0x3502): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3658): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3682): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function `reset_hinic_vf_dev':
quirks.c:(.text+0x3844): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x39fc): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3a86): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3ab4): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function `quirk_reset_lenovo_thinkpad_p50_nvgpu':
quirks.c:(.text+0x3cf6): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: drivers/pci/quirks.o: in function `nvme_disable_and_flr':
quirks.c:(.text+0x3e32): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3eac): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: quirks.c:(.text+0x3fc0): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/devres.o: in function `pcim_addr_resource_release':
devres.c:(.text+0x414): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: devres.c:(.text+0x420): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/devres.o: in function `pcim_iomap':
devres.c:(.text+0x524): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: devres.c:(.text+0x576): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/pci/devres.o: in function `pcim_iomap_range':
devres.c:(.text+0x980): undefined reference to `pci_iomap_range'
m68k-linux-uclibc-ld: drivers/pci/devres.o: in function `pcim_iomap_region':
devres.c:(.text+0xc0e): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: drivers/net/ethernet/intel/e100.o: in function `e100_remove':
e100.c:(.text+0x1fe6): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: drivers/net/ethernet/intel/e100.o: in function `e100_probe':
e100.c:(.text+0x362a): undefined reference to `pci_iomap'
m68k-linux-uclibc-ld: e100.c:(.text+0x381c): undefined reference to `pci_iounmap'
m68k-linux-uclibc-ld: e100.c:(.text+0x3928): undefined reference to `pci_iounmap'
make[2]: *** [scripts/Makefile.vmlinux:77: vmlinux] Error 1
make[1]: *** [/home/gerg/accelerated-linux.lkml/linux/Makefile:1231: vmlinux] Error 2
make: *** [Makefile:251: __sub-make] Error 2

FWIW this was a m5475evb_defconfig with CONFIG_MMU disabled.

Regards
Greg



> ---
>   arch/m68k/Kconfig             | 2 +-
>   arch/m68k/include/asm/io_no.h | 4 ----
>   2 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index b2ed0308c0ea..b50c275fa94d 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -18,7 +18,7 @@ config M68K
>   	select DMA_DIRECT_REMAP if M68K_NONCOHERENT_DMA && !COLDFIRE
>   	select GENERIC_ATOMIC64
>   	select GENERIC_CPU_DEVICES
> -	select GENERIC_IOMAP if HAS_IOPORT
> +	select GENERIC_IOMAP if HAS_IOPORT && MMU
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_LIB_ASHLDI3
>   	select GENERIC_LIB_ASHRDI3
> diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_no.h
> index 2c96e8480173..516371d5587a 100644
> --- a/arch/m68k/include/asm/io_no.h
> +++ b/arch/m68k/include/asm/io_no.h
> @@ -123,10 +123,6 @@ static inline void writel(u32 value, volatile void __iomem *addr)
>   #define PCI_IO_SIZE	0x00010000		/* 64k */
>   #define PCI_IO_MASK	(PCI_IO_SIZE - 1)
>   
> -#define HAVE_ARCH_PIO_SIZE
> -#define PIO_OFFSET	0
> -#define PIO_MASK	0xffff
> -#define PIO_RESERVED	0x10000
>   #define PCI_IOBASE	((void __iomem *) PCI_IO_PA)
>   #define PCI_SPACE_LIMIT	PCI_IO_MASK
>   #endif /* CONFIG_PCI */


