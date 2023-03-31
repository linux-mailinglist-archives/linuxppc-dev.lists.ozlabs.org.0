Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D206D247E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 17:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp4ds0h9lz3fVk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 02:56:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=F86J/lOD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=F86J/lOD;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp4cy2KJ4z3cDc
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 02:55:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gUELt2K1QKph0U/mDlh4dwcj3jRy49Fgp81dawItijs=; b=F86J/lODgmEA0uwbHcY3bvQDIg
	TgPZqAN80ItsKKu+iPQcuv/pts9DIvFXJeSEZcyq0SOfARV88djehGMYXJuDHo94xmNoUdc8so8TQ
	lO3DlUKNl0JE1n5lC4OQRNQJ3a+9RGNNtr5VJSUX9rNMXskzfjoEtNIzNUj9gswxqSmuoQ2K/eCd1
	sHbsLGLpmn7B5oFOttF1NlFGM73bvkK8EdPHfxwwzdfF3QwqoSTJnWaOA3vfMNEshnYYvIU/akmQr
	wtBcESnlgj18abmkEesn3hmvJxyBrWubIThmP6qLXHE/lCCqgaePhuHTPqwc712P40mYINjGZoZVl
	F0iXSnJA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60182)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1piH5K-0005f8-U5; Fri, 31 Mar 2023 16:54:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1piH5B-0001I3-3X; Fri, 31 Mar 2023 16:54:29 +0100
Date: Fri, 31 Mar 2023 16:54:29 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean()
 helper
Message-ID: <ZCcCNXyb9TZvA8wD@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <ZCGv18wnEtoFvtfM@shell.armlinux.org.uk>
 <1be05746-9deb-49cb-b106-71b2db8318cd@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1be05746-9deb-49cb-b106-71b2db8318cd@app.fastmail.com>
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

On Fri, Mar 31, 2023 at 04:06:37PM +0200, Arnd Bergmann wrote:
> On Mon, Mar 27, 2023, at 17:01, Russell King (Oracle) wrote:
> > On Mon, Mar 27, 2023 at 02:13:16PM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> 
> >> The arm version of the arch_sync_dma_for_cpu() function annotates pages as
> >> PG_dcache_clean after a DMA, but no other architecture does this here.
> >
> > ... because this is an arm32 specific feature. Generically, it's
> > PG_arch_1, which is a page flag free for architecture use. On arm32
> > we decided to use this to mark whether we can skip dcache writebacks
> > when establishing a PTE - and thus it was decided to call it
> > PG_dcache_clean to reflect how arm32 decided to use that bit.
> >
> > This isn't just a DMA thing, there are other places that we update
> > the bit, such as flush_dcache_page() and copy_user_highpage().
> >
> > So thinking that the arm32 PG_dcache_clean is something for DMA is
> > actually wrong.
> >
> > Other architectures are free to do their own other optimisations
> > using that bit, and their implementations may be DMA-centric.
> 
> The flag is used the same way on most architectures, though some
> use the opposite polarity and call it PG_dcache_dirty. The only
> other architecture that uses it for DMA is ia64, with the difference
> being that this also marks the page as clean even for coherent
> DMA, not just when doing a flush as part of noncoherent DMA.
> 
> Based on Robin's reply it sounds that this is not a valid assumption
> on Arm, if a coherent DMA can target a dirty dcache line without
> cleaning it.

The other thing to note here is that PG_dcache_clean doesn't have
much meaning on modern CPUs with PIPT caches. For these,
cache_is_vipt_nonaliasing() will be true, and
cache_ops_need_broadcast() will be false.

Firstly, if we're using coherent DMA, then PG_dcache_clean is
intentionally not touched, because the data cache isn't cleaned
in any way by DMA operations.

flush_dcache_page() turns into a no-op apart from clearing
PG_dcache_clean if it was set.

__sync_icache_dcache() will do nothing for non-executable pages,
but will write-back a page that isn't marked PG_dcache_clean to
ensure that it is visible to the instruction stream. This is only
used to ensure that a the instructions are visible to a newly
established executable mapping when e.g. the page has been DMA'd
in. The default state of PG_dcache_clean is zero on any new
allocation, so this has the effect of causing any executable page
to be flushed such that the instruction stream can see the
instructions, but only for the first establishment of the mapping.
That means that e.g. libc text pages don't keep getting flushed on
the start of every program.

update_mmu_cache() isn't compiled, so it's use of PG_dcache_clean
is irrelevant.

v6_copy_user_highpage_aliasing() won't be called because we're not
using an aliasing cache.

So, for modern ARM systems with DMA-coherent PG_dcache_clean only
serves for the __sync_icache_dcache() optimisation.

ARMs use of this remains valid in this circumstance.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
