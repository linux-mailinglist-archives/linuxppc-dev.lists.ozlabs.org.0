Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7B76D2674
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 19:09:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp6Gs36MVz3fXf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 04:09:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=<UNKNOWN>)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp6GN33Lpz3fS8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 04:09:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AB3A62AAE;
	Fri, 31 Mar 2023 17:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E1FC433D2;
	Fri, 31 Mar 2023 17:09:19 +0000 (UTC)
Date: Fri, 31 Mar 2023 18:09:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
Message-ID: <ZCcTvN5DAbjOVWUX@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-19-arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@l
 inaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 02:13:14PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The cache management operations for noncoherent DMA on ARMv6 work
> in two different ways:
> 
>  * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>    DMA buffers lead to data corruption when the prefetched data is written
>    back on top of data from the device.
> 
>  * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>    is not seen by the other core(s), leading to inconsistent contents
>    accross the system.
> 
> As a consequence, neither configuration is actually safe to use in a
> general-purpose kernel that is used on both MPCore systems and ARM1176
> with prefetching enabled.

As the author of this terrible hack (created under duress ;))

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

IIRC, RWFO is working in combination with the cache operations. Because
the cache maintenance broadcast did not happen, we forced the cache
lines to migrate to a CPU via a write (for ownership) and doing the
cache maintenance on that CPU (that was the FROM_DEVICE case). For the
TO_DEVICE case, reading on a CPU would cause dirty lines on another CPU
to be evicted (or migrated as dirty to the current CPU IIRC) then the
cache maintenance to clean them to PoC on the local CPU.

But there's always a small window between read/write for ownership and
the actual cache maintenance which can cause a cache line to migrate to
other CPUs if they do speculative prefetches. At the time ARM11MPCore
was deemed safe-ish but I haven't followed what later implementations
actually did (luckily we fixed the architecture in ARMv7).

-- 
Catalin
