Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7868D6CB1CA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:25:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlnTH3LMRz3fXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 09:25:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlnSh3j7cz3cfH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 09:25:23 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 31BF267373; Tue, 28 Mar 2023 00:25:15 +0200 (CEST)
Date: Tue, 28 Mar 2023 00:25:15 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic
 implementation
Message-ID: <20230327222514.GA17904@lst.de>
References: <20230327121317.4081816-1-arnd@kernel.org> <20230327121317.4081816-22-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-22-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstr
 ong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>  {
> +	dma_cache_wback(paddr, size);
> +}
>  
> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
> +{
> +	dma_cache_inv(paddr, size);
>  }

> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
>  {
> +	dma_cache_wback_inv(paddr, size);
> +}

There are the only calls for the three functions for each of the
involved functions.  So I'd rather rename the low-level symbols
(and drop the pointless exports for two of them) rather than adding
these wrapppers.

The same is probably true for many other architectures.

> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
> +{
> +	return false;
> +}
>  
> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
> +{
> +	return true;
>  }

Is there a way to cut down on this boilerplate code by just having
sane default, and Kconfig options to override them if they are not
runtime decisions?

> +#include <linux/dma-sync.h>

I can't really say I like the #include version here despite your
rationale in the commit log.  I can probably live with it if you
think it is absolutely worth it, but I'm really not in favor of it.

> +config ARCH_DMA_MARK_DCACHE_CLEAN
> +	def_bool y

What do we need this symbol for?  Unless I'm missing something it is
always enable for arm32, and only used in arm32 code.
