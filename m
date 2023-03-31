Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FBC6D1EC6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 13:09:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnyHG0FmSz3fVR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 22:09:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=PPtcwauT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=PPtcwauT;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnyGR20hFz3bdm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 22:09:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FP8lga4DIdHpNC0kamUnt9iIXQ9vJ47gtBSwTDmI4Fo=; b=PPtcwauT+B3dG8oaJ+oVdcoVVI
	Axs1VUpRIhHVBk9kjzqXMf0BxMrU5nUcHd9wiJiPpSiyvB4EBHKxgx0LwGEdU3MHUbLiQvurk3Ir2
	jHUABX6iK7+/X6xdVRn0mIdNwpBVhvETlCEgtUG2TQNB9WaBH9+FoZ9lEESLeT40IgtxFK61dNkqh
	CGuhr72PZEeuC1v0GBxu1Vb+6ktcbsiZbA0C7dSMDpKGCtFWqsJdkm95qZx845fdHVPwOaRMNoKh5
	ts0jTf0R1kbKjCH8KJbtEBZ48A8fhDIK9vhNHV11ebVTkEld3z53CFg/6yoghmin0tW1vUHWWnjoW
	uxWmZ3Uw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42490)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1piCcE-0004q2-Uz; Fri, 31 Mar 2023 12:08:18 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1piCc2-00015p-1q; Fri, 31 Mar 2023 12:08:06 +0100
Date: Fri, 31 Mar 2023 12:08:06 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
Message-ID: <ZCa/FlTVT/GSl1af@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-16-arnd@kernel.org>
 <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
 <ZCapXlrqMOpRxkSu@shell.armlinux.org.uk>
 <a8a90181-a003-47a1-8257-fcbf55752249@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8a90181-a003-47a1-8257-fcbf55752249@app.fastmail.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Neil Armstrong <neil.armstrong@linaro.org>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Arnd Bergmann <ar
 nd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023 at 12:38:45PM +0200, Arnd Bergmann wrote:
> On Fri, Mar 31, 2023, at 11:35, Russell King (Oracle) wrote:
> > On Fri, Mar 31, 2023 at 10:07:28AM +0100, Russell King (Oracle) wrote:
> >> On Mon, Mar 27, 2023 at 02:13:11PM +0200, Arnd Bergmann wrote:
> >> > From: Arnd Bergmann <arnd@arndb.de>
> >> > 
> >> > Most ARM CPUs can have write-back caches and that require
> >> > cache management to be done in the dma_sync_*_for_device()
> >> > operation. This is typically done in both writeback and
> >> > writethrough mode.
> >> > 
> >> > The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
> >> > (arm920t, arm940t) implementations are the exception here,
> >> > and only do the cache management after the DMA is complete,
> >> > in the dma_sync_*_for_cpu() operation.
> >> > 
> >> > Change this for consistency with the other platforms. This
> >> > should have no user visible effect.
> >> 
> >> NAK...
> >> 
> >> The reason we do cache management _after_ is to ensure that there
> >> is no stale data. The kernel _has_ (at the very least in the past)
> >> performed DMA to data structures that are embedded within other
> >> data structures, resulting in cache lines being shared. If one of
> >> those cache lines is touched while DMA is progressing, then we
> >> must to cache management _after_ the DMA operation has completed.
> >> Doing it before is no good.
> 
> What I'm trying to address here is the inconsistency between
> implementations. If we decide that we always want to invalidate
> after FROM_DEVICE, I can do that as part of the series, but then
> I have to change most of the other arm implementations.

Why?

First thing to say is that DMA to buffers where the cache lines are
shared with data the CPU may be accessing need to be outlawed - they
are a recipe for data corruption - always have been. Sadly, some folk
don't see it that way because of a passed "x86 just works and we demand
that all architectures behave like x86!" attitude. The SCSI sense
buffer has historically been a big culpret for that.


For WT, FROM_DEVICE, invalidating after DMA is the right thing to do,
because we want to ensure that the DMA'd data is properly readable upon
completion of the DMA. If overlapping cache lines have been touched
while DMA is progressing, and we invalidate before DMA, then the cache
will contain stale data that will remain in the cache after DMA has
completed. Invalidating a WT cache does not destroy any data, so is
safe to do. So the safest approach is to invalidate after DMA has
completed in this instance.


For WB, FROM_DEVICE, we have the problem of dirty cache lines which
we have to get rid of. For the overlapping cache lines, we have to
clean those before DMA begins to ensure that data written to the
non-DMA-buffer part is preserved. All other cache lines need to be
invalidated before DMA begins to ensure that writebacks do not
corrupt data from the device. Hence why it's different.


And hence why the ARM implementation is based around buffer ownership.
And hence why they're called dma_map_area()/dma_unmap_area() rather
than the cache operations themselves. This is an intentional change,
one that was done when ARMv6 came along.

> OTOH, most machines that are actually in use today (armv6+,
> powerpc, later mips, microblaze, riscv, nios2) also have to
> deal with speculative accesses, so they end up having to
> invalidate or flush both before and after a DMA_FROM_DEVICE
> and DMA_BIDIRECTIONAL.

Again, these are implementation details of the cache, and this is
precisely why having the map/unmap interface is so much better than
having generic code explicitly call "clean" and "invalidate"
interfaces into arch code.

If we treat everything as a speculative cache, then we're doing
needless extra work for those caches that aren't speculative. So,
ARM would have to step through every cache line for every DMA
buffer at 32-byte intervals performing cache maintenance whether
the cache is speculative or not. That is expensive, and hurts
performance.

I put a lot of thought into this when I updated the ARM DMA
implementation when we started seeing these different cache types
particularly when ARMv6 came along. I really don't want that work
wrecked.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
