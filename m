Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA669E5A5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:11:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLm6J2Qz3z3chw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:11:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=bOjEVdwW;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TMacjdvB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=bOjEVdwW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TMacjdvB;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfRh4024z3brK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 23:56:16 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 7C94B3200932;
	Tue, 21 Feb 2023 07:46:37 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 21 Feb 2023 07:46:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676983597; x=1677069997; bh=Ed
	zOAv/xcw8C660U6AYkHbaD3axiSrIufQWq0klOwqc=; b=bOjEVdwW9KvLj+SiA0
	RhT7CIkflbcfHDLoMDtvSBSeZ7O5BpriDzw0omfF5x5+F7yUndITdAuoUSuFOcuw
	B0+FQ7sruAVljv2cFT2HT8ZDrc7ShypCl0Xc8GSpjfxImp8As0GG0TwW26ZuT2l7
	lDDJ0sPCU9oAT9caTjR8XALWhi2Xy07k8pB6wA6KrX+gqy42av3oM6HmKfzK9bZ3
	ZqBwdnJbGxYLA66GT1/ry8mkXSrCweqgrmMxUJCHuCvEcg/GQPshqxXpLW+F4Pgo
	rtdPZdzQs8HTdxIOixT2j8rNhkEr0sciVtdTo4mLSASbA4r4CjCMFPVL1bvrH9H6
	COiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676983597; x=1677069997; bh=EdzOAv/xcw8C6
	60U6AYkHbaD3axiSrIufQWq0klOwqc=; b=TMacjdvBZ7+GF8nhmMYIH/fVDN07x
	NmC94v8x/x3aIvJpHDAK+yc+KxhfeUH2UtLUpFiDtjMs089AiNq0u1HPcySUf/Ki
	2VpR1Eu1VpZdyFCyQoByz7rNwQ10ACxdcBqnjfDNv02dpvwsKbIlHsW1fg3tY3Vi
	3c3ILiwnD9LiL+uC3OAkME1bZJngB2PqBkVARAUITOR3ni3A9nAi1VVH1/dUT4Bn
	kw1Yn6EKPaEM0zJoMROnQfCZ7DSuMkYD86kjHCRe/CsJILRQrqlAbirKyzAyxXi4
	BE3zykbS4eImy/BEN9Pv/TKKay2XBEz5fCADVFKZKOQtl3kNy8UOkPYWg==
X-ME-Sender: <xms:LL30Y7MN1nrlvHI7IXBKEYLsNwoNdHu48hBIgM-B0oY7qPtKgVtewA>
    <xme:LL30Y1_DbMAr9xfr5eRjvUiogEIwSu6mQ4ZIdWzMTwDLUvBYixZGKZGUoUSlC40vV
    64CDOmYHNr2uzC6yFQ>
X-ME-Received: <xmr:LL30Y6ThyhqJp467PDXxse3xV2U5zoEytcsELm6o5CEwrAxdSm74597X9h8s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepudenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Lb30Y_vWLi-P5N3TZnMcC_NZYPy6mEtsKwg-r2JSdztCeIx39U881w>
    <xmx:Lb30YzfPvkHg9KApypLY4iMx473qjCSl8X6JZQ8UH4h7iIfW9D9vLA>
    <xmx:Lb30Y71ABKYzwTt6CpRJk2eS3HlGoN8sHMeRZuCR00DL5go2DPCfQw>
    <xmx:Lb30Y0WdY0Rn5Eh7qNYxsErrCejdAA11NGvc08IPi-0w7my4BNtEog>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 07:46:35 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 5/7] dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
Date: Tue, 21 Feb 2023 12:46:11 +0000
Message-Id: <20230221124613.2859-6-jiaxun.yang@flygoat.com>
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

Provide a kconfig option to allow arches to manipulate default
value of dma_default_coherent in Kconfig.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 kernel/dma/Kconfig   | 3 +++
 kernel/dma/mapping.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 56866aaa2ae1..968108fdf9bf 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -76,6 +76,9 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
+config ARCH_DMA_DEFAULT_COHERENT
+	bool
+
 config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index e0b005c8ffce..3d4a2ca15b5a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -20,7 +20,7 @@
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
 	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-bool dma_default_coherent;
+bool dma_default_coherent = IS_ENABLED(CONFIG_ARCH_DMA_DEFAULT_COHERENT);
 #endif
 
 /*
-- 
2.37.1 (Apple Git-137.1)

