Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5C969E5A7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:12:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLm7L1gLfz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:12:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=qIn1qV1D;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jjWvhaLi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=qIn1qV1D;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=jjWvhaLi;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfRh40n7z3bvH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 23:56:16 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 4F8D33200920;
	Tue, 21 Feb 2023 07:46:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 21 Feb 2023 07:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676983593; x=1677069993; bh=cl
	U+1DjEJRpBNFORFKqHyIxdKEVEFhCaiGb/M7QBgCc=; b=qIn1qV1DkK0on6ZMeP
	KBnn0OvJCdAF06u3sTwb6TLhhvYwhobazwDY2EatXRU9Fvb3wWcrQwcUFLX7k6ga
	kbJLA67hp0QVQ+WE95nF9JhdDdHcPmpEoGB1W605thN9DLtXmRSHiuKgriPvjLpz
	bTSnFh+o803+DVbeRciysdZkn7MW9phSD8PXMLNR3V3HQXcPmlKfUFZlaFGRqQH6
	w6Exn7/aAezzhaLbUbrFiahSMH9DvK1KHYgrQ0CbNyVxdGOdHmoANV3FPaX8EVUG
	HFXDOH6p1EX0QLgoAaXEH9cbrsaFYnpl1XqE6eqOv12CC1mushGx5fqhsNZuYYLf
	c0zQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676983593; x=1677069993; bh=clU+1DjEJRpBN
	FORFKqHyIxdKEVEFhCaiGb/M7QBgCc=; b=jjWvhaLi+nDY4ruMzqDzgliKeRkUI
	DzpKMj+qY8IeWqgJJezwBwRyp+CgWnl8cmn29ysRqJGsHwMQXx8BE7l2mTf697hK
	IxfRZIzf/F7V05uN6wZo/4ystwnI7HyCR/OOUKJoed1wAGFbksDMrBFW86p5Q1aO
	Fy3aTLeF1bSIrFb4VqYB0Uuw3kqS6ED6qMWE8i+edFWSh8NhjC0Dq3Ry41SNhKCB
	Sb1rPzThPqjT1lYzFjdv632H1K5bbaRJGPQ68uHDH0m6AO5jhRNNd5Udx2QB34SB
	L7AdHYdI2nRZgOx/EjeW6IXC58GY4LAkGpVSqI9pxHZr4Z9E1yVF5RTdA==
X-ME-Sender: <xms:Kb30YxdkRd07hHsU7Ze8w3-mzAb88q59T77I77IQ20cy03h75bGkeg>
    <xme:Kb30Y_Njog1gr2LNVCv-NVpnXFjWU7qC2cRtipkT6aCkmphwM6WObD1_vCnd7LQYB
    51nTF2RE_ItkxwbvL0>
X-ME-Received: <xmr:Kb30Y6g4VYkatzullltWucaONLGcQnyjnH3zd_GgtCskaUroU_ZBkA3oUEE7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:Kb30Y6978zk0RwMAwG13_cGLMzj8X1vuloSGIpyFciZkDgb8XnRf5g>
    <xmx:Kb30Y9unYnEavPl76RqRLqo-HHdiWS2PCt_9X2wLy6dZLAyXDGUiHg>
    <xmx:Kb30Y5HWmhJUTy7Iior3Yx1tEEOi3DKut6f67cU4E3WsK2njr_0lOg>
    <xmx:Kb30Y-nm_k6RJNCe9lBbSBD-eK02w8i4KVGrhm8mYOofiphNUd0xWA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 07:46:32 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 4/7] dma-mapping: Always provide dma_default_coherent
Date: Tue, 21 Feb 2023 12:46:10 +0000
Message-Id: <20230221124613.2859-5-jiaxun.yang@flygoat.com>
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

dma_default_coherent can be useful for determine default coherency
even on arches without noncoherent support.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/mapping.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index d678afeb8a13..3c6cd17f87c3 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -269,6 +269,7 @@ static inline bool dev_is_dma_coherent(struct device *dev)
 	return dev->dma_coherent;
 }
 #else
+#define dma_default_coherent true
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
 	return true;
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index c026a5a5e046..e0b005c8ffce 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -17,7 +17,11 @@
 #include "debug.h"
 #include "direct.h"
 
+#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
+	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
+	defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 bool dma_default_coherent;
+#endif
 
 /*
  * Managed DMA API
-- 
2.37.1 (Apple Git-137.1)

