Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C002C69E591
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:09:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLm4F4mMHz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:09:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=WYZ2r8yL;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N+2nQ+ZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=WYZ2r8yL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N+2nQ+ZS;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfRd06YNz3bvH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 23:56:12 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id D55E832008C3;
	Tue, 21 Feb 2023 07:46:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 21 Feb 2023 07:46:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676983590; x=1677069990; bh=6T
	1o68vOusF0U/JsH2f0H8DjY8CJLE2Yaxz8jLQ29x0=; b=WYZ2r8yLERG8PZz33O
	ZATtuWd5d33QLXSPx3j/jhteDUdurqIOBz891SrqqR91iQevCcqj6U+7R4Z49bGY
	d2jgibfy0ZH6LVFQz6HkZiJT6KoGcZ8ia/SBT8I1ykeDdnhrMyp9QytH5KQzVaAo
	qUuT0oFahR0oagpue7LQ6eUUPKo+SC7e89Ik454307YKxaupeC03eBJ6FYtLdbaB
	dyTMOh/zEvfmx7Y5d0IDJvAhq12jXnfqrPl/6ycEHnLCJEsF1vmliERnxjjtx7Z/
	mgalcHl9e9IY+yZpsJTFtBHdCYHKvCycMROzwTI2ynJBPEw4yjhI+6ejrkQ3D7Bb
	dIkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676983590; x=1677069990; bh=6T1o68vOusF0U
	/JsH2f0H8DjY8CJLE2Yaxz8jLQ29x0=; b=N+2nQ+ZSQuHyDtlrCA6jR15i7BiS5
	xCN/wDc5Sw88OHVQznynC9DZVncjtiiWew6jITDLnoNU43Y/MkL/f594ojwVMhZl
	fl1A3aY45+MogY/op9OydPi4vykMmOXyhtrZ55IW0RIBmGKFkcrK/rATWzQlEBAQ
	0kSRhXAvJUxVPY0z3O5Ka34CX+T7TcmHJMrrS8LAyXN0u1LxBZLC/DynuaaGYfpG
	T1E2LDg6RaUfEaJRNNp/guCkiXLmexfmJ+HEMlyUemhTjqJeajJgUEDVeCLsRWnq
	jrDJ4JMEXLp+AsjDK76pG2jvnFg9h9dM+NUZULAWCdI0s72ETVpD+xRRA==
X-ME-Sender: <xms:Jr30Yz5BIy_m-MwjK9yIweAUHesP39SlXB394vbruCA4g_hNkureNg>
    <xme:Jr30Y46Xvu-AHgunSeRBNBDRrZUPpcNFHLnjkYBf7mnuc-gNkFK3saYxpeQ5gULaA
    PlghgrNmVr7ahUeqXw>
X-ME-Received: <xmr:Jr30Y6dzmCKS3RekzxyzsxRWmgaULoh8aebGtSXOxW-T9-kx7Y1FL115wnKv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Jr30Y0K0qGc2pEb8iyhLswkwAsfll_ugv3Y_q8f6qLEb1la6DXFALA>
    <xmx:Jr30Y3LQ41mZ-Ju8vR8MOqpbavkQcst90ABJPZUKb4iylQVKfpEFVw>
    <xmx:Jr30Y9zIRHlJpuhT_5abIBBTFhzUAb8LeyZ0Io6g-V4XDGHt3nWqhw>
    <xmx:Jr30Y0Bjh17qOIDK-kzSO26_Hrfl2JWd3Jq2g41CjrprnotjfUdjdQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 07:46:28 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 3/7] MIPS: c-r4k: Always install dma flush functions
Date: Tue, 21 Feb 2023 12:46:09 +0000
Message-Id: <20230221124613.2859-4-jiaxun.yang@flygoat.com>
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

As nowadays DMA coherence is managed per device, it is possible
to have a system that is defaulted to coherent dma but still
have noncoherent device that needs to use those flush functions.

Just install them unconditionally.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/mm/c-r4k.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index a549fa98c2f4..7d447050a20b 100644
--- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1867,15 +1867,9 @@ void r4k_cache_init(void)
 	__local_flush_icache_user_range	= local_r4k_flush_icache_user_range;
 
 #ifdef CONFIG_DMA_NONCOHERENT
-	if (dma_default_coherent) {
-		_dma_cache_wback_inv	= (void *)cache_noop;
-		_dma_cache_wback	= (void *)cache_noop;
-		_dma_cache_inv		= (void *)cache_noop;
-	} else {
-		_dma_cache_wback_inv	= r4k_dma_cache_wback_inv;
-		_dma_cache_wback	= r4k_dma_cache_wback_inv;
-		_dma_cache_inv		= r4k_dma_cache_inv;
-	}
+	_dma_cache_wback_inv	= r4k_dma_cache_wback_inv;
+	_dma_cache_wback	= r4k_dma_cache_wback_inv;
+	_dma_cache_inv		= r4k_dma_cache_inv;
 #endif /* CONFIG_DMA_NONCOHERENT */
 
 	build_clear_page();
-- 
2.37.1 (Apple Git-137.1)

