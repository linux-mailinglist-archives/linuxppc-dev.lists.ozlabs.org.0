Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 959566D2F56
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 11:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PpWl63vY8z3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 20:17:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=ZYb64APE;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n2+Sns5M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=ZYb64APE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=n2+Sns5M;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PpWjF5qfSz3cJK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 20:15:44 +1100 (AEDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 3CDED5C0209;
	Sat,  1 Apr 2023 05:15:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 01 Apr 2023 05:15:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1680340542; x=
	1680426942; bh=6ZdUaz0bULSUdlfaxIi2pdkawZZOMF82ZopwMrFwfbc=; b=Z
	Yb64APEBRmQX6qnsbQ+gNGAqCe47A5ugfKPHsjoS0juWhirZbuCy5OqsbGVin0aQ
	MCprU8gXASeLV3u4fhQCB8Xmr6q9QR4w2HZJpdtlKTwu5UTiyxJEYkR+RtRyVRde
	UTwLtqN6qhUwO6xah+aI7dLJmA/yb8qsL05ZmqE47UppENL8RgKP+t5PLWHyEYgv
	sxhwSxbBQD+ye3z4TVmNgvmBGIE+aGU84qke6fbp70ckULSF34+i1MBOcxAd3u2K
	aob00h3PmgtGo76UIlwN0CqufBnhZt1E57/1uA+egkRWe6wX35P3VsqLKRW9J3oR
	P1NvJ1J8XM4zvQBVfbpog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1680340542; x=
	1680426942; bh=6ZdUaz0bULSUdlfaxIi2pdkawZZOMF82ZopwMrFwfbc=; b=n
	2+Sns5MlCMh2CS5VbD4r4+tfWPBNZW4RfSSeYLJQ1wxvtWZeI+w//zhC/SBMe2wN
	Ue5yAxnK70ImQ5HLFWx9k1/JZJ3vvGMKku6U7/6tioBsUC5cTtJekxHafJNmyZMh
	hUfkRF+AkKbFh00IiA8DUKvrLFElH8m8uZF2yJcPjkaUmm3LnOm40eWxKN6e7AKe
	6MGiQItIbp/g9gx/F0//fNfDMvpcMLTWiAdmoCfZpKcNQGBEeeNXWetaW27oUc1G
	KardIf3w6xRRk8YcR5R5mVHjbM/0sHBYN3d2fSqnbAGZkeleeQp9xCv24tHbLrut
	ukVhLPN80yCeH5PYfwmtw==
X-ME-Sender: <xms:PvYnZKt-zWPqZrgcrFY6AOOemameG7W6-C2QSx77SsyR9Z2_z-CHNw>
    <xme:PvYnZPes5nXJmw3iDxG2X_9YZsQ7N179e2hdLMPN_9u0YkfajE3BixuH1pLuq-f4_
    zZOQ9VuePXcGexJ6VI>
X-ME-Received: <xmr:PvYnZFznsQ_q-aL2pCmlfQaEv0wP31Q8WUaTzsrnlD2q5ulJuw2TW78xT4Rpt5xy_cJjP_WDaI8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeifedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:PvYnZFOWT9rX4KVETjZaH87LUHkf-7NkzbN_Qib2QMqlBWf03QhrHA>
    <xmx:PvYnZK9XuT8G4n4z6Lq2OJzsz3B2lX7isTLmDh7Lqzv4yP7p3BjP8w>
    <xmx:PvYnZNUr7L6sbtxlAO2w7uTxFHLdkyeMdR9I0B4bWla1dJma3HUUOA>
    <xmx:PvYnZMcuntpmBcB4d9JK6LDt8H-UanPzN6G1vOiuUwwUbjxBBLzSZQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 1 Apr 2023 05:15:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: iommu@lists.linux.dev
Subject: [PATCH v4 1/3] dma-mapping: Provide a fallback dma_default_coherent
Date: Sat,  1 Apr 2023 10:15:29 +0100
Message-Id: <20230401091531.47412-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
References: <20230401091531.47412-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dma_default_coherent was decleared unconditionally at kernel/dma/mapping.c
but only decleared when any of non-coherent options is enabled in
dma-map-ops.h.

Guard the declaration in mapping.c with non-coherent options and provide
a fallback definition.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Style fix
---
 include/linux/dma-map-ops.h | 2 ++
 kernel/dma/mapping.c        | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 41bf4bdb117a..31f114f486c4 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -269,6 +269,8 @@ static inline bool dev_is_dma_coherent(struct device *dev)
 	return dev->dma_coherent;
 }
 #else
+#define dma_default_coherent true
+
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
 	return true;
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 68106e3791f6..80f9663ffe26 100644
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
2.39.2 (Apple Git-143)

