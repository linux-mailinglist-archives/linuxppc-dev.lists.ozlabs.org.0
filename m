Return-Path: <linuxppc-dev+bounces-9183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4AAAD0D4C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Jun 2025 14:12:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bDxs45y46z2xrL;
	Sat,  7 Jun 2025 22:12:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=130.133.4.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749298360;
	cv=none; b=mT7ktjLqPVV0ttYMXM6WMwgyGa7Aaa9UBJ4MSsHny/qcP1faOLizk86PRpATnV3rV1xLWZYUoxa7zLpgvoRdsaB6g95aFuHcoKZfSIQRjgZPSyGd68k15TY1nKC3v2y40hJDPMZuPQwLtuYrkvk5ZRKhQiO3LIcLm0MHgqT62mdjgwtp+K2KrrQb8bGZG+b6RLaUn/TH/WJM3XEwgVbdH489Jq0AgV1jmrbZQb1/Daa6hIbQb3ZHTgIMiHj1lOLkms2eNQnJsEEnyCXDrFK04NWo/TKMAf4hgzprys58+H7pgrGCcRnnpmYjVUZzlU5V4Cz9t/mh6DjUnbpLAHx4FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749298360; c=relaxed/relaxed;
	bh=FwM4OXMNxwD5om0/o3Aytg0dRVg/tzG+D8QfcuPysvA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mufPIifpkTY7uNnrs2VEXDwQ7uGZ5tHo4ZvYT1SYAbwTpWRI3aYcZlbS6wCEvIyIB17kvCK/aF982oI4z/vBUkxvENVGFE7ld7DP5U+dDETrpvuTUp4/JuFXnZ+HwC4LogyC8ovsDQSaNSJGEzFr/lHzKXVj9elEoU3PnLO1C006YmgRG4YIVpCl4qjkFkBBH/KY++AzLZczpMEEzB9ulDpy+aO9gw3qaM80jQ4cvb1cxZ2f0RFfuIxzFmBqrCot8bNNewzxPvIv/dCmNTC7gMI75Qfvof7xqJwbXpv5WFv5SLcubAueu/qgroOwB4UnSQEhYuzHb/NxZE7SsBanGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=IyI936+X; dkim-atps=neutral; spf=pass (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org) smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=fu-berlin.de header.i=@fu-berlin.de header.a=rsa-sha256 header.s=fub01 header.b=IyI936+X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zedat.fu-berlin.de (client-ip=130.133.4.66; helo=outpost1.zedat.fu-berlin.de; envelope-from=glaubitz@zedat.fu-berlin.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 230 seconds by postgrey-1.37 at boromir; Sat, 07 Jun 2025 22:12:36 AEST
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bDxs04M33z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Jun 2025 22:12:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FwM4OXMNxwD5om0/o3Aytg0dRVg/tzG+D8QfcuPysvA=; t=1749298356; x=1749903156; 
	b=IyI936+Xz92bLvpYIs6fws+yZZC81a7lozzATpJ6FcCd/BT+9TlugT6pMP3/1OzSJ7Mz+b91KSo
	NS3bI7FV1PXhy32mH02+E97SNHzFwJJHBEqQmVqycSJ5PKAhIrJgZ7hO7dOIocVBk9ePcAZ2li8Fl
	qZWEohdaZyE6KVu41xpu8IMgDijVx1KQd72kp2Wr7GDJ9n/nZLQGIVwoTBMKj9cbBB+nRSuWb/elD
	swUE7Vh5m1W1H1DQV5KzeF4X9wUjHHAe+0ol/toPlN4DBAODYcsLCD1tDl2hhSj7qvjZVTSsA6+sY
	9qTVX+UKaSfWHFpJgke7lQfESY3SYtwugFcQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uNsLc-00000001cxo-1xRw; Sat, 07 Jun 2025 14:08:28 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uNsLc-00000003H4l-0SRQ; Sat, 07 Jun 2025 14:08:28 +0200
Message-ID: <6c7770dd1c216410fcff3bf0758a45d5afcb5444.camel@physik.fu-berlin.de>
Subject: Re: [PATCH 2/6] sh: remove duplicate ioread/iowrite helpers
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Arnd Bergmann <arnd@kernel.org>, linux-arch@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Thomas Bogendoerfer	 <tsbogend@alpha.franken.de>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>, 
 Madhavan Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin	 <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker	
 <dalias@libc.org>, Julian Vetter <julian@outer-limits.org>, Bjorn Helgaas	
 <bhelgaas@google.com>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Date: Sat, 07 Jun 2025 14:08:26 +0200
In-Reply-To: <20250315105907.1275012-3-arnd@kernel.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
	 <20250315105907.1275012-3-arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
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
Precedence: list
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.175.228
X-ZEDAT-Hint: PO
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arnd,

On Sat, 2025-03-15 at 11:59 +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The ioread/iowrite functions on sh only do memory mapped I/O like the
> generic verion, and never map onto non-MMIO inb/outb variants, so they
> just add complexity. In particular, the use of asm-generic/iomap.h
> ties the declaration to the x86 implementation.
>=20
> Remove the custom versions and use the architecture-independent fallback
> code instead. Some of the calling conventions on sh are different here,
> so fix that by adding 'volatile' keywords where required by the generic
> implementation and change the cpg clock driver to no longer depend on
> the interesting choice of return types for ioread8/ioread16/ioread32.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/sh/include/asm/io.h |  30 ++------
>  arch/sh/kernel/Makefile  |   3 -
>  arch/sh/kernel/iomap.c   | 162 ---------------------------------------
>  arch/sh/kernel/ioport.c  |   5 --
>  arch/sh/lib/io.c         |   4 +-
>  drivers/sh/clk/cpg.c     |  25 +++---
>  6 files changed, 21 insertions(+), 208 deletions(-)
>  delete mode 100644 arch/sh/kernel/iomap.c
>=20
> diff --git a/arch/sh/include/asm/io.h b/arch/sh/include/asm/io.h
> index cf5eab840d57..0f663ebec700 100644
> --- a/arch/sh/include/asm/io.h
> +++ b/arch/sh/include/asm/io.h
> @@ -19,7 +19,6 @@
>  #include <asm/machvec.h>
>  #include <asm/page.h>
>  #include <linux/pgtable.h>
> -#include <asm-generic/iomap.h>
> =20
>  #define __IO_PREFIX     generic
>  #include <asm/io_generic.h>
> @@ -100,7 +99,7 @@ pfx##writes##bwlq(volatile void __iomem *mem, const vo=
id *addr,		\
>  	}								\
>  }									\
>  									\
> -static inline void pfx##reads##bwlq(volatile void __iomem *mem,		\
> +static inline void pfx##reads##bwlq(const volatile void __iomem *mem,	\
>  				    void *addr, unsigned int count)	\
>  {									\
>  	volatile type *__addr =3D addr;					\
> @@ -114,37 +113,18 @@ static inline void pfx##reads##bwlq(volatile void _=
_iomem *mem,		\
>  __BUILD_MEMORY_STRING(__raw_, b, u8)
>  __BUILD_MEMORY_STRING(__raw_, w, u16)
> =20
> -void __raw_writesl(void __iomem *addr, const void *data, int longlen);
> -void __raw_readsl(const void __iomem *addr, void *data, int longlen);
> +void __raw_writesl(void volatile __iomem *addr, const void *data, int lo=
nglen);
> +void __raw_readsl(const volatile void __iomem *addr, void *data, int lon=
glen);
> =20
>  __BUILD_MEMORY_STRING(__raw_, q, u64)
> =20
>  #define ioport_map ioport_map
> -#define ioport_unmap ioport_unmap
>  #define pci_iounmap pci_iounmap
> =20
> -#define ioread8 ioread8
> -#define ioread16 ioread16
> -#define ioread16be ioread16be
> -#define ioread32 ioread32
> -#define ioread32be ioread32be
> -
> -#define iowrite8 iowrite8
> -#define iowrite16 iowrite16
> -#define iowrite16be iowrite16be
> -#define iowrite32 iowrite32
> -#define iowrite32be iowrite32be
> -
> -#define ioread8_rep ioread8_rep
> -#define ioread16_rep ioread16_rep
> -#define ioread32_rep ioread32_rep
> -
> -#define iowrite8_rep iowrite8_rep
> -#define iowrite16_rep iowrite16_rep
> -#define iowrite32_rep iowrite32_rep
> -
>  #ifdef CONFIG_HAS_IOPORT_MAP
> =20
> +extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
> +
>  /*
>   * Slowdown I/O port space accesses for antique hardware.
>   */
> diff --git a/arch/sh/kernel/Makefile b/arch/sh/kernel/Makefile
> index ba917008d63e..7b453592adaf 100644
> --- a/arch/sh/kernel/Makefile
> +++ b/arch/sh/kernel/Makefile
> @@ -21,10 +21,7 @@ obj-y	:=3D head_32.o debugtraps.o dumpstack.o				\
>  	   syscalls_32.o time.o topology.o traps.o			\
>  	   traps_32.o unwinder.o
> =20
> -ifndef CONFIG_GENERIC_IOMAP
> -obj-y				+=3D iomap.o
>  obj-$(CONFIG_HAS_IOPORT_MAP)	+=3D ioport.o
> -endif
> =20
>  obj-y				+=3D sys_sh32.o
>  obj-y				+=3D cpu/
> diff --git a/arch/sh/kernel/iomap.c b/arch/sh/kernel/iomap.c
> deleted file mode 100644
> index 0a0dff4e66de..000000000000
> --- a/arch/sh/kernel/iomap.c
> +++ /dev/null
> @@ -1,162 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * arch/sh/kernel/iomap.c
> - *
> - * Copyright (C) 2000  Niibe Yutaka
> - * Copyright (C) 2005 - 2007 Paul Mundt
> - */
> -#include <linux/module.h>
> -#include <linux/io.h>
> -
> -unsigned int ioread8(const void __iomem *addr)
> -{
> -	return readb(addr);
> -}
> -EXPORT_SYMBOL(ioread8);
> -
> -unsigned int ioread16(const void __iomem *addr)
> -{
> -	return readw(addr);
> -}
> -EXPORT_SYMBOL(ioread16);
> -
> -unsigned int ioread16be(const void __iomem *addr)
> -{
> -	return be16_to_cpu(__raw_readw(addr));
> -}
> -EXPORT_SYMBOL(ioread16be);
> -
> -unsigned int ioread32(const void __iomem *addr)
> -{
> -	return readl(addr);
> -}
> -EXPORT_SYMBOL(ioread32);
> -
> -unsigned int ioread32be(const void __iomem *addr)
> -{
> -	return be32_to_cpu(__raw_readl(addr));
> -}
> -EXPORT_SYMBOL(ioread32be);
> -
> -void iowrite8(u8 val, void __iomem *addr)
> -{
> -	writeb(val, addr);
> -}
> -EXPORT_SYMBOL(iowrite8);
> -
> -void iowrite16(u16 val, void __iomem *addr)
> -{
> -	writew(val, addr);
> -}
> -EXPORT_SYMBOL(iowrite16);
> -
> -void iowrite16be(u16 val, void __iomem *addr)
> -{
> -	__raw_writew(cpu_to_be16(val), addr);
> -}
> -EXPORT_SYMBOL(iowrite16be);
> -
> -void iowrite32(u32 val, void __iomem *addr)
> -{
> -	writel(val, addr);
> -}
> -EXPORT_SYMBOL(iowrite32);
> -
> -void iowrite32be(u32 val, void __iomem *addr)
> -{
> -	__raw_writel(cpu_to_be32(val), addr);
> -}
> -EXPORT_SYMBOL(iowrite32be);
> -
> -/*
> - * These are the "repeat MMIO read/write" functions.
> - * Note the "__raw" accesses, since we don't want to
> - * convert to CPU byte order. We write in "IO byte
> - * order" (we also don't have IO barriers).
> - */
> -static inline void mmio_insb(const void __iomem *addr, u8 *dst, int coun=
t)
> -{
> -	while (--count >=3D 0) {
> -		u8 data =3D __raw_readb(addr);
> -		*dst =3D data;
> -		dst++;
> -	}
> -}
> -
> -static inline void mmio_insw(const void __iomem *addr, u16 *dst, int cou=
nt)
> -{
> -	while (--count >=3D 0) {
> -		u16 data =3D __raw_readw(addr);
> -		*dst =3D data;
> -		dst++;
> -	}
> -}
> -
> -static inline void mmio_insl(const void __iomem *addr, u32 *dst, int cou=
nt)
> -{
> -	while (--count >=3D 0) {
> -		u32 data =3D __raw_readl(addr);
> -		*dst =3D data;
> -		dst++;
> -	}
> -}
> -
> -static inline void mmio_outsb(void __iomem *addr, const u8 *src, int cou=
nt)
> -{
> -	while (--count >=3D 0) {
> -		__raw_writeb(*src, addr);
> -		src++;
> -	}
> -}
> -
> -static inline void mmio_outsw(void __iomem *addr, const u16 *src, int co=
unt)
> -{
> -	while (--count >=3D 0) {
> -		__raw_writew(*src, addr);
> -		src++;
> -	}
> -}
> -
> -static inline void mmio_outsl(void __iomem *addr, const u32 *src, int co=
unt)
> -{
> -	while (--count >=3D 0) {
> -		__raw_writel(*src, addr);
> -		src++;
> -	}
> -}
> -
> -void ioread8_rep(const void __iomem *addr, void *dst, unsigned long coun=
t)
> -{
> -	mmio_insb(addr, dst, count);
> -}
> -EXPORT_SYMBOL(ioread8_rep);
> -
> -void ioread16_rep(const void __iomem *addr, void *dst, unsigned long cou=
nt)
> -{
> -	mmio_insw(addr, dst, count);
> -}
> -EXPORT_SYMBOL(ioread16_rep);
> -
> -void ioread32_rep(const void __iomem *addr, void *dst, unsigned long cou=
nt)
> -{
> -	mmio_insl(addr, dst, count);
> -}
> -EXPORT_SYMBOL(ioread32_rep);
> -
> -void iowrite8_rep(void __iomem *addr, const void *src, unsigned long cou=
nt)
> -{
> -	mmio_outsb(addr, src, count);
> -}
> -EXPORT_SYMBOL(iowrite8_rep);
> -
> -void iowrite16_rep(void __iomem *addr, const void *src, unsigned long co=
unt)
> -{
> -	mmio_outsw(addr, src, count);
> -}
> -EXPORT_SYMBOL(iowrite16_rep);
> -
> -void iowrite32_rep(void __iomem *addr, const void *src, unsigned long co=
unt)
> -{
> -	mmio_outsl(addr, src, count);
> -}
> -EXPORT_SYMBOL(iowrite32_rep);
> diff --git a/arch/sh/kernel/ioport.c b/arch/sh/kernel/ioport.c
> index c8aff8a20164..915a3dfd9f02 100644
> --- a/arch/sh/kernel/ioport.c
> +++ b/arch/sh/kernel/ioport.c
> @@ -23,8 +23,3 @@ void __iomem *ioport_map(unsigned long port, unsigned i=
nt nr)
>  	return (void __iomem *)(port + sh_io_port_base);
>  }
>  EXPORT_SYMBOL(ioport_map);
> -
> -void ioport_unmap(void __iomem *addr)
> -{
> -}
> -EXPORT_SYMBOL(ioport_unmap);
> diff --git a/arch/sh/lib/io.c b/arch/sh/lib/io.c
> index ebcf7c0a7335..dc6345e4c53b 100644
> --- a/arch/sh/lib/io.c
> +++ b/arch/sh/lib/io.c
> @@ -11,7 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/io.h>
> =20
> -void __raw_readsl(const void __iomem *addr, void *datap, int len)
> +void __raw_readsl(const volatile void __iomem *addr, void *datap, int le=
n)
>  {
>  	u32 *data;
> =20
> @@ -60,7 +60,7 @@ void __raw_readsl(const void __iomem *addr, void *datap=
, int len)
>  }
>  EXPORT_SYMBOL(__raw_readsl);
> =20
> -void __raw_writesl(void __iomem *addr, const void *data, int len)
> +void __raw_writesl(volatile void __iomem *addr, const void *data, int le=
n)
>  {
>  	if (likely(len !=3D 0)) {
>  		int tmp1;
> diff --git a/drivers/sh/clk/cpg.c b/drivers/sh/clk/cpg.c
> index fd72d9088bdc..64ed7d64458a 100644
> --- a/drivers/sh/clk/cpg.c
> +++ b/drivers/sh/clk/cpg.c
> @@ -26,6 +26,19 @@ static unsigned int sh_clk_read(struct clk *clk)
>  	return ioread32(clk->mapped_reg);
>  }
> =20
> +static unsigned int sh_clk_read_status(struct clk *clk)
> +{
> +	void __iomem *mapped_status =3D (phys_addr_t)clk->status_reg -
> +		(phys_addr_t)clk->enable_reg + clk->mapped_reg;
> +
> +	if (clk->flags & CLK_ENABLE_REG_8BIT)
> +		return ioread8(mapped_status);
> +	else if (clk->flags & CLK_ENABLE_REG_16BIT)
> +		return ioread16(mapped_status);
> +
> +	return ioread32(mapped_status);
> +}
> +
>  static void sh_clk_write(int value, struct clk *clk)
>  {
>  	if (clk->flags & CLK_ENABLE_REG_8BIT)
> @@ -40,20 +53,10 @@ static int sh_clk_mstp_enable(struct clk *clk)
>  {
>  	sh_clk_write(sh_clk_read(clk) & ~(1 << clk->enable_bit), clk);
>  	if (clk->status_reg) {
> -		unsigned int (*read)(const void __iomem *addr);
>  		int i;
> -		void __iomem *mapped_status =3D (phys_addr_t)clk->status_reg -
> -			(phys_addr_t)clk->enable_reg + clk->mapped_reg;
> -
> -		if (clk->flags & CLK_ENABLE_REG_8BIT)
> -			read =3D ioread8;
> -		else if (clk->flags & CLK_ENABLE_REG_16BIT)
> -			read =3D ioread16;
> -		else
> -			read =3D ioread32;
> =20
>  		for (i =3D 1000;
> -		     (read(mapped_status) & (1 << clk->enable_bit)) && i;
> +		     (sh_clk_read_status(clk) & (1 << clk->enable_bit)) && i;
>  		     i--)
>  			cpu_relax();
>  		if (!i) {

Those are quite a number of changes that I would like to test on real hardw=
are
first before merging them into the kernel.

@Geert: Could you test it on your SH-7751 LANDISK board as well?

Thanks,
Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

