Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF8F182E77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 12:01:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dQrD1SyszDqgD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 22:01:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dQjW4NdpzDqLq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 21:55:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kjtDKke2; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dQjL3pfwz9sPF;
 Thu, 12 Mar 2020 21:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584010558;
 bh=72/MkVf9VVMOXQXQBCEOJd5iIUWgKkmEQGqh1LToq2c=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=kjtDKke2a24ahWnaI2Uj0G4Fe2Y+Jmmv/GYwuEOLFEW9uRKLJ/Eh8hY/uIvPOkWOq
 hSpbFhZ+nkMkq9HnJFD5n60KJODzNOkbfNQ2xKBvxmtGjcLFu/cP0AF6WyLXOSMULb
 6fFjUvKvb8/nZ+iPRU20W0VkcxW1QK6SeQvdds5ZfmEH3nf/wYggGS/dPu8fp0XU/0
 5piT2dBaqMVbWuvgxSVjBFiUYMtS2zI6exgAeql41Nme4eoBMZr+hItq7bW8gr3rM3
 jCRuhb1gAjdGh5ftRaRGO6Z5fFXzHCOWGuRXdE2RxOkjZdMiy8L8pyOPyQMC+hwaj9
 VAqGftLnfpYYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson
 <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta
 <vgupta@synopsys.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, Dave Airlie <airlied@redhat.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs
 <bskeggs@redhat.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri
 Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>, "David
 S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>, Jon
 Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Andrew
 Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 virtualization@lists.linux-foundation.org, linux-arch@vger.kernel.org
Subject: Re: [RESEND PATCH v2 1/9] iomap: Constify ioreadX() iomem argument
 (as in generic implementation)
In-Reply-To: <20200219175007.13627-2-krzk@kernel.org>
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-2-krzk@kernel.org>
Date: Thu, 12 Mar 2020 21:55:44 +1100
Message-ID: <87ftedj0zz.fsf@mpe.ellerman.id.au>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Krzysztof Kozlowski <krzk@kernel.org> writes:
> diff --git a/arch/powerpc/kernel/iomap.c b/arch/powerpc/kernel/iomap.c
> index 5ac84efc6ede..9fe4fb3b08aa 100644
> --- a/arch/powerpc/kernel/iomap.c
> +++ b/arch/powerpc/kernel/iomap.c
> @@ -15,23 +15,23 @@
>   * Here comes the ppc64 implementation of the IOMAP 
>   * interfaces.
>   */
> -unsigned int ioread8(void __iomem *addr)
> +unsigned int ioread8(const void __iomem *addr)
>  {
>  	return readb(addr);
>  }
> -unsigned int ioread16(void __iomem *addr)
> +unsigned int ioread16(const void __iomem *addr)
>  {
>  	return readw(addr);
>  }
> -unsigned int ioread16be(void __iomem *addr)
> +unsigned int ioread16be(const void __iomem *addr)
>  {
>  	return readw_be(addr);
>  }
> -unsigned int ioread32(void __iomem *addr)
> +unsigned int ioread32(const void __iomem *addr)
>  {
>  	return readl(addr);
>  }
> -unsigned int ioread32be(void __iomem *addr)
> +unsigned int ioread32be(const void __iomem *addr)
>  {
>  	return readl_be(addr);
>  }
> @@ -41,27 +41,27 @@ EXPORT_SYMBOL(ioread16be);
>  EXPORT_SYMBOL(ioread32);
>  EXPORT_SYMBOL(ioread32be);
>  #ifdef __powerpc64__
> -u64 ioread64(void __iomem *addr)
> +u64 ioread64(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_lo_hi(void __iomem *addr)
> +u64 ioread64_lo_hi(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64_hi_lo(void __iomem *addr)
> +u64 ioread64_hi_lo(const void __iomem *addr)
>  {
>  	return readq(addr);
>  }
> -u64 ioread64be(void __iomem *addr)
> +u64 ioread64be(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_lo_hi(void __iomem *addr)
> +u64 ioread64be_lo_hi(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> -u64 ioread64be_hi_lo(void __iomem *addr)
> +u64 ioread64be_hi_lo(const void __iomem *addr)
>  {
>  	return readq_be(addr);
>  }
> @@ -139,15 +139,15 @@ EXPORT_SYMBOL(iowrite64be_hi_lo);
>   * FIXME! We could make these do EEH handling if we really
>   * wanted. Not clear if we do.
>   */
> -void ioread8_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread8_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsb(addr, dst, count);
>  }
> -void ioread16_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread16_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsw(addr, dst, count);
>  }
> -void ioread32_rep(void __iomem *addr, void *dst, unsigned long count)
> +void ioread32_rep(const void __iomem *addr, void *dst, unsigned long count)
>  {
>  	readsl(addr, dst, count);
>  }

This looks OK to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
