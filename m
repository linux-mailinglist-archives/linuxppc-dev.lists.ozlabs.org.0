Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B1C6A078B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 12:39:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMrfP0DMbz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 22:39:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=IFZl2ORB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=apbZeE9v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=IFZl2ORB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=apbZeE9v;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMrbS3FzDz3cK5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 22:37:08 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 995ED3200344;
	Thu, 23 Feb 2023 06:37:05 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 23 Feb 2023 06:37:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677152225; x=1677238625; bh=w9
	MPuL3xvzlmyepaLfzNP3Yd6NyYPIjuZVV4oO83i4c=; b=IFZl2ORBAKjtu4cjv9
	Vfl/K5vu4Oek2GhcVjflrWw0JVZ06TwgSSBi83cgXB8SlyR3RMgyYN+cFj6Xndgd
	3OTC0HUgMgF1DpcQOS+1FGgqUxBNUv8yM1nkC2f5WkVqPBqKkN9bVznVQy5O0hw3
	i5vvK2vl+IKBEnx8Wug4WWSKSscPE9tx7pMqi4nTr5gpwBbpGVEIiZ4tmqNF7F7l
	CfgxTZUPRp3/SQd6fmGa9ldl8+NNMM9GQXBnhjHTRxfQfARlMqdgHaaQ2t/7nS5/
	0cESPCq53PW1rNWy6ZDUMlklofp2FbOLo4Gz1zNehZK99ZlxYOHzxSKkc1TQw7sE
	mEAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677152225; x=1677238625; bh=w9MPuL3xvzlmy
	epaLfzNP3Yd6NyYPIjuZVV4oO83i4c=; b=apbZeE9vqPT4maFETj+CqsSLwDNY7
	lxWddqhvvVPs2dGKhJOrtwldSE/Oi4LwVBGgh4XLb57V7GEtlY77C6hw/yWkJoNS
	iST3BQcSQ8VLRaPCu5uzT00p+HSxG/7n5s0uTDSI0WzQ2HfqARRjBdqe6kx8L4j9
	wdj2d2CPQ3FgbkOLXIt5OjTuFHwkGX8xiEF0njyMOWqhBqejGAkWZvmFuBvceJTS
	vR2XjGPzK3r6oyjiLZvHCf/Rq5qxUiFBw7HGZo2Iu0HA5mwWChdqWFj+n/JHY7Nl
	6ah7WJGCGFFo8NGbEbYS/XQk4iJGNyi5PpPBcBWcKSe6rkRDMKdnSI5Ug==
X-ME-Sender: <xms:4U_3Y-v9mCNvggSK3q_UWgxIlqsYkPS8-IwZ1eGRDIjg1VCFleO8YA>
    <xme:4U_3Yzdb38KK2Qn-pIo1hA_rSP0p71AouUI2cyJHLJp0Utu50TFsqLhMQRMNXaqTj
    FadLxquMU7x2Jh4GJA>
X-ME-Received: <xmr:4U_3Y5yYIWXZGp4woK6kEOrOr8iLq8taSiRMEmvGafRD6bVJnKYt8-npMOLOZN63R9LNvtvFrz8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:4U_3Y5OOHXsMLFJx0VxB5MdWP3KoSMTrN4vunhaxFU3eSGO8jBXfEw>
    <xmx:4U_3Y--KdR_D9r63gvtkIPUmv28NYqM-JyrWV_q0V5a96hFSSttTjw>
    <xmx:4U_3YxV-GddjATpvv74n5HT9Qif0yrfPViVZa8hwoDq6xmMHPchuOQ>
    <xmx:4U_3YxVAjxDcbaygjSIEqU5Zz6amewiDTR_WdRfzLYoOWXCgi5VEQg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 06:37:01 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v2 2/5] dma-mapping: Provide a fallback dma_default_coherent
Date: Thu, 23 Feb 2023 11:36:41 +0000
Message-Id: <20230223113644.23356-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
References: <20230223113644.23356-1-jiaxun.yang@flygoat.com>
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
Cc: tsbogend@alpha.franken.de, linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, robh+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com, robin.murphy@arm.com, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, hch@lst.de, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dma_default_coherent was decleared unconditionally at kernel/dma/mapping.c
but only decleared when any of non-coherent options is enabled in dma-map-ops.h.

Guard the declaration in mapping.c with non-coherent options and provide
a fallback definition.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 include/linux/dma-map-ops.h | 1 +
 kernel/dma/mapping.c        | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 41bf4bdb117a..0a1aaf7163b3 100644
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
2.37.1 (Apple Git-137.1)

