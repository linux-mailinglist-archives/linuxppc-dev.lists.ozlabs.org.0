Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC97F69E590
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:08:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLm3D3S4Nz3cND
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:08:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=j8/j9yp/;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DJNjAvwy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=j8/j9yp/;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DJNjAvwy;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfRc6n5Tz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 23:56:12 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id AD2123200392;
	Tue, 21 Feb 2023 07:46:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Feb 2023 07:46:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676983600; x=1677070000; bh=hV
	blcbnQNQnrUYmR42maX841iYbSBNUD5mWumav+q1s=; b=j8/j9yp/wQMNo7LXlC
	8GDFZxMTHD0uB/Sy7andq8NyyTpgXSQoN/e2cjH0Nsk22VVREnsFDoTqbvQQXOGe
	U4StaiPSs1d/6l6Lwh/UsiqwtmbhweOPIhTl49bGdYDne6I+VDRbHigxAxEzhm3E
	Xh97ymVPgKnYDhLivkRDbKxug4hubPXp/XR1x1Ea5Lj2LGVHgPXhjlY8NG8xzrlj
	Z2PXzpbJV6beOoZSmcZf5hdsEIc8210yJjRLWf53rdglL+GjRPO2V5NBp4vnpWIE
	ZIfd7VaY5aGNbW1PssK1ZhA9yWAq5jBEMb4heitVMv/w+dwcyac50C7MWYCkK8M7
	DMtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676983600; x=1677070000; bh=hVblcbnQNQnrU
	YmR42maX841iYbSBNUD5mWumav+q1s=; b=DJNjAvwyDKZHlxBA/gAxauFhEP52V
	DDUmJgzGwKHB/gJz2K9Znpstt0ap92MxGDV0jM3R9/sXEs5nbgVHigHu6j0EJ1nQ
	ziLcOgHcsI9YKxbbmibzF+lOjLGsrppJ9p8ls0bRLdjOMDcmMiVJX6O5oXq/9d0+
	r66grgdF6zwYw99glYagz5HUOAyfVNY2AS5qTtd/AtqTXiTRvh0ZM1ZHBiI9ik5f
	0i8OsAde28fjYD7n7lKmgx2CITbfjNxmwXXuKPVxOPcRiqXSVPGnOgAAnh7pDGQs
	l/Ko4XguNZj3CnkzH+jH4YqKSgOOf8uIcHtytI5vZO6DBmvSsJ++2cbAQ==
X-ME-Sender: <xms:ML30Y7os6kpvz8_zFyH7sJ7n9eUw_rrB7BuhVEFBi2jJYPfvak22UQ>
    <xme:ML30Y1pDUhmNEVGK4wVrQkHBmZiQxrU8YO1ERVfJXp3uIA9fgaiBSQbAoGvRru3gG
    Evu32pRNSQPi9ufVQ0>
X-ME-Received: <xmr:ML30Y4Ph4cpyc4pnGiHvqdmi7a8TlfLWRzp421bvphdxMN_hIOLN895s3y2H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:ML30Y-4icBZ7bolZH0vXrV0jXkzGzFJ8I2xQWJWanNKFIh6T49PORg>
    <xmx:ML30Y653zCBJC1pe7Mc1h9EaACoA8ZD22sfqZ4jfa61BqqT7hByWUA>
    <xmx:ML30Y2jl42NjIyotQkRdi6NrzmNYZvYeac0P1nY-pPIE93TLTcCRwg>
    <xmx:ML30Y3xRGPjMuKTTKbePBZ93G-i-aUg2CBAoAwUHNLKszhNIL9C4qw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 07:46:38 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 6/7] riscv: Select ARCH_DMA_DEFAULT_COHERENT
Date: Tue, 21 Feb 2023 12:46:12 +0000
Message-Id: <20230221124613.2859-7-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
References: <20230221124613.2859-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Feb 2023 04:06:20 +1100
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
Cc: tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For RISCV we always assume devices are DMA coherent.
Select ARCH_DMA_DEFAULT_COHERENT to ensure dev->dma_conherent
is always initialized to true.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 8b1dbd23dbd6..c1327309e0f6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -13,6 +13,7 @@ config 32BIT
 config RISCV
 	def_bool y
 	select ARCH_CLOCKSOURCE_INIT
+	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_HAS_BINFMT_FLAT
-- 
2.37.1 (Apple Git-137.1)

