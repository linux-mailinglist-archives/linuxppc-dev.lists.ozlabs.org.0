Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 520B46CA881
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 17:03:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Plbg91mZcz3fWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 02:03:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=v1TiVcw6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=v1TiVcw6;
	dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlbfF0g1Jz3cKj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 02:02:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GEE0ldPCAv+f5hC1f+jvTvP/uCZufNK448SDtGAe4Zk=; b=v1TiVcw6SlE1jYl57XDWmMLk7R
	EWSel/m8qaxtTIpi1wpcv4wbnE7RPavO3PfN2/IvOoiwi/gCP7xcE5F2askSa5L3uzpsODKQD61x8
	StfEk4v08foXfrG7VasjwmrT+4yuDajfp3NNHvjaYyh4aLuCmqN87WdluK/CgHa4tXqQusBd9TUSf
	rgoEiiSrmdHN6nfAY4zrzY2ufcDHt1crFZ4RO0F/V9Ze42PDJKXYA8Ce8yBzBCsjOpJfgasawcEnA
	+RKV1eekKL4QKumS3WLMLcQq87DVakybcmXPiUHI+Lzv6UbDhiuLRCeqCognGPTq1tbBLbTgEZBez
	GAl3pldA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58066)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pgoM7-00040C-4u; Mon, 27 Mar 2023 16:01:55 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pgoLv-0005Vg-EZ; Mon, 27 Mar 2023 16:01:43 +0100
Date: Mon, 27 Mar 2023 16:01:43 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean()
 helper
Message-ID: <ZCGv18wnEtoFvtfM@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327121317.4081816-21-arnd@kernel.org>
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

On Mon, Mar 27, 2023 at 02:13:16PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The arm version of the arch_sync_dma_for_cpu() function annotates pages as
> PG_dcache_clean after a DMA, but no other architecture does this here.

... because this is an arm32 specific feature. Generically, it's
PG_arch_1, which is a page flag free for architecture use. On arm32
we decided to use this to mark whether we can skip dcache writebacks
when establishing a PTE - and thus it was decided to call it
PG_dcache_clean to reflect how arm32 decided to use that bit.

This isn't just a DMA thing, there are other places that we update
the bit, such as flush_dcache_page() and copy_user_highpage().

So thinking that the arm32 PG_dcache_clean is something for DMA is
actually wrong.

Other architectures are free to do their own other optimisations
using that bit, and their implementations may be DMA-centric.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
