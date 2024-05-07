Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDCB8BEC9E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 21:33:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=DGHZcDwQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYpNg6sMBz3cVD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 05:33:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.a=rsa-sha256 header.s=pandora-2019 header.b=DGHZcDwQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=armlinux.org.uk (client-ip=2001:4d48:ad52:32c8:5054:ff:fe00:142; helo=pandora.armlinux.org.uk; envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 539 seconds by postgrey-1.37 at boromir; Wed, 08 May 2024 05:32:58 AEST
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYpMt6MZ9z30Wf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 05:32:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1Rlt99zmcVILKclqpbjv2utXWPqAc4TJPPlL31nMJt8=; b=DGHZcDwQt05/ofsRmHCXxB7F7p
	4+19AHlf/kB9ynBunr+XzmEvyFe6jOB5Bi4Rg6t+TMauL7eOeAIVct20JsAWJK4OCulTHdC9kwooI
	piaA8++amm65GJTBciceqX7s9AIYLi/5LAzyO1mzBOTXaqL3R65vQlUcICSp/KtxsspkpnGaEw/jv
	BFFDRAv6XEpLYVjeNMGIqqF6+U84USuu86U1FYPS/48Wb2aAdf83MBClnEzbI40mPdQEnJjsMlRxA
	jA2Mxibyz2aoHWw87X0TBKAU7uJ6LRcRJ4xY4XkjrvGCwdIf2txmwWpBcVfF0tuTv/Uq/WjjhOrdl
	Mj+cEspQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1s4QP6-0004C4-0A;
	Tue, 07 May 2024 20:23:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1s4QOw-0000ZA-Of; Tue, 07 May 2024 20:22:58 +0100
Date: Tue, 7 May 2024 20:22:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
Message-ID: <Zjp/kgBE2ddjV044@shell.armlinux.org.uk>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
 <20240507190111.16710-2-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240507190111.16710-2-apais@linux.microsoft.com>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, angelogioacchino.delregno@collabora.com, borisp@nvidia.com, cooldavid@cooldavid.org, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, netdev@vger.kernel.org, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, bryan.whitehead@microchip.com, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 07, 2024 at 07:01:11PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/ethernet/* from tasklet to BH workqueue.

I doubt you're going to get many comments on this patch, being so large
and spread across all drivers. I'm not going to bother trying to edit
this down to something more sensible, I'll just plonk my comment here.

For the mvpp2 driver, you're only updating a comment - and looking at
it, the comment no longer reflects the code. It doesn't make use of
tasklets at all. That makes the comment wrong whether or not it's
updated. So I suggest rather than doing a search and replace for
"tasklet" to "BH blahblah" (sorry, I don't remember what you replaced
it with) just get rid of that bit of the comment.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
