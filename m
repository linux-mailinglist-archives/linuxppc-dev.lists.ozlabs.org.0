Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D411A69F5CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 14:39:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMHLc5M7nz3cdg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 00:39:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=Z9k/56ZN;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=t0+fpHEA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=Z9k/56ZN;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=t0+fpHEA;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMHJf0nyqz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 00:37:22 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 2EDC35C0121;
	Wed, 22 Feb 2023 08:37:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Wed, 22 Feb 2023 08:37:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677073040; x=1677159440; bh=w9
	MPuL3xvzlmyepaLfzNP3Yd6NyYPIjuZVV4oO83i4c=; b=Z9k/56ZNql9SmQjH8z
	KTyQCSI1IZ1NM2Yj9JWpAzAz3hnbjCpGdshk3Ra8L0dbAefCWwUgoJrZlvDfu5T1
	K/L+D9sZ59n7AAk/yBR0zWYCFsxF+2h6jUuu798ERAg4iafehLBk1vvv5BkKxSZR
	T0WfKFm788ARSFTH+p39Ly6DMFpnvTP0M6waFf5vedhgMtuvRQ+L/PwnSP03bX5H
	8tkfMxiTlHLBHSe3bfLkOIIYFCEsz9uCx9wkgOEnPd39wOYMRpFeqXPnfuR5S+AJ
	bU7mWQssr0Pvse4r6RXHikUPkwQzEeO3X/UYeCCYPM53JxkqwgUmtyo9lP1Dmgd+
	ZC8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677073040; x=1677159440; bh=w9MPuL3xvzlmy
	epaLfzNP3Yd6NyYPIjuZVV4oO83i4c=; b=t0+fpHEADym4UyAXwv8RABDiQxR2Q
	4gr8wHJZ/37eH4oUG/xTdRNgRlf1o62QDvSv/LE8AUm4DxFsmz28+PSxKycYCmt3
	BgYtnw9uQFmqOLw9Mrz1XGlXRWR8T9OCRktL4UUFb07DJOe1giUUnt740OEhNoEn
	1UrMK+67Ean0yYV0Nz80kffJMD7kPvijn5HeBxEdFN1nmA6tfQP8mw5PpMbgWabU
	xaqwtrhLyYKPB7p/Lpdb+i7FQ06zm9ihVR/oN5F1KHXWIgVwUjTpENj+jEBUwfa0
	4l10PZDnOlS1lDOR3ssdXABDUnXL1sxi8eFIZUlEdwv5VKIKABV7BR82w==
X-ME-Sender: <xms:kBr2Y9vF38sk8KSl4mjKN2CSZdP9mX6NDkYIg3RHIWUfqoNj4eXXoQ>
    <xme:kBr2Y2cc5HFbjGy5ApPxiYayvruX5OJ3dnEpYORb_8SSmfGWOeoty1G4bzJ-lGtx2
    RbI8DTpHKRt-4XYf9Y>
X-ME-Received: <xmr:kBr2Ywz6-Oc_V1KF6Ja29VhdN9MgjUlTtz85DSyHQGBi4qJcPe3qATqQCqtG>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledghedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:kBr2Y0OrnKXttDtdULg443FsoVFkMfvrthWFRORpU1rGbvl_XJbJsA>
    <xmx:kBr2Y9_hmn1P_0q-gWu6tjR5daETPTWMnamL6yces1lputUFA-WEiQ>
    <xmx:kBr2Y0UiW75n_mq7fWZ7wCdbjgVkgj8XbCn8GUeNAj-LXeHqA8mSbQ>
    <xmx:kBr2Y0VQQrGqFrijDkbKuBdoHlqNKzufSvpCs8jmv-uQitso-V00HA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:18 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 1/3] dma-mapping: Provide a fallback dma_default_coherent
Date: Wed, 22 Feb 2023 13:37:10 +0000
Message-Id: <20230222133712.8079-2-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
References: <20230222133712.8079-1-jiaxun.yang@flygoat.com>
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

