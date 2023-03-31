Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E986D1C94
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 11:37:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnwDK2knlz3fVb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 20:37:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=UKbXTqzh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=UKbXTqzh;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnwCV66ysz3cTC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 20:36:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=LizQNlR5xeQ9Nx7+wKPFYUJj75jOfRmgpvd1Wr0G7No=; b=UKbXTqzhq2L4s+MyI6LAhZHXPR
	JEXjbEnQAW9YjlzhOJTLAm3faUqrzczga5/5A+k3OzAcg8y2zTvhiGLWpnnuu9Ohj85XsU4grnYcD
	yk5M61TG+xOGvvpr7BdospIoI188Iq0Jt42tRt/xOCB196NQnP2eeZJxFhk6W8d3WLrvzOeDmeDGp
	JdEZ4IItk3nxicikeyfyOXcN5BcpLJAlq5iFuQOYzNedzBy1kDsV1y5AtlHxecOF2ffvGBufXeIlS
	4QoK4UR/YHLQPaOKfszLD1j9qGgpZKpcHV1ssSQAyjuKCuBpMtpEGtTDYtwzgJ2cUFhaZW4SwHxwU
	CCfEAozA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1piBAV-0004Wr-DT; Fri, 31 Mar 2023 10:35:35 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1piBAM-00012N-TR; Fri, 31 Mar 2023 10:35:26 +0100
Date: Fri, 31 Mar 2023 10:35:26 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches
 before DMA
Message-ID: <ZCapXlrqMOpRxkSu@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-16-arnd@kernel.org>
 <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@
 monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-openrisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, linux-oxnas@groups.io, Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023 at 10:07:28AM +0100, Russell King (Oracle) wrote:
> On Mon, Mar 27, 2023 at 02:13:11PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Most ARM CPUs can have write-back caches and that require
> > cache management to be done in the dma_sync_*_for_device()
> > operation. This is typically done in both writeback and
> > writethrough mode.
> > 
> > The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
> > (arm920t, arm940t) implementations are the exception here,
> > and only do the cache management after the DMA is complete,
> > in the dma_sync_*_for_cpu() operation.
> > 
> > Change this for consistency with the other platforms. This
> > should have no user visible effect.
> 
> NAK...
> 
> The reason we do cache management _after_ is to ensure that there
> is no stale data. The kernel _has_ (at the very least in the past)
> performed DMA to data structures that are embedded within other
> data structures, resulting in cache lines being shared. If one of
> those cache lines is touched while DMA is progressing, then we
> must to cache management _after_ the DMA operation has completed.
> Doing it before is no good.

It looks like the main offender of "touching cache lines shared
with DMA" has now been resolved - that was the SCSI sense buffer,
and was fixed some time ago:

commit de25deb18016f66dcdede165d07654559bb332bc
Author: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
Date:   Wed Jan 16 13:32:17 2008 +0900

/if/ that is the one and only case, then we're probably fine, but
having been through an era where this kind of thing was the norm
and requests to fix it did not get great responses from subsystem
maintainers, I just don't trust the kernel not to want to DMA to
overlapping cache lines.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
