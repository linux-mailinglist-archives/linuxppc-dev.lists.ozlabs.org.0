Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FBA6C2FDA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:11:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgpnN4FS8z3f4Y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 22:11:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=YK+9dSwi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WOwhmSW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=YK+9dSwi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=WOwhmSW5;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgpkP6RzVz303h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 22:08:29 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id DBDC25C01B6;
	Tue, 21 Mar 2023 07:08:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Tue, 21 Mar 2023 07:08:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396907; x=
	1679483307; bh=34g1rJ4eKpg7Mv3jK1Pi5YCKoRtvBAJ5vAexAPGkFH0=; b=Y
	K+9dSwiWN5z6O7qjaYxoOOE1GCx05bPaiar5IBe0GjOE2Gg72p2f1IvsY/C//OWx
	p7gSbGBNOoVVoloLCrHjB4SPaKQarMqBkqpg1FkmXpAYD0a9QUllqA+t/Zo5vaI/
	laKToT9DVbZp+Aq6xcH5Dn2+4uzMuFhnBzMzTRW/uvE7iuDXF228IBsD5u9Iz+e3
	bS96ZBzP00NWoXYZYiFBMW4xzi1+TMNAxsn81ZvIpwBF73jmbDczEyDK1jCTteAm
	KMqVvasp6Ub2ZXkViwPfjvitj4I2bu6zgxR7/5uZngv9z+Yg2ynUTvo7zOglVgc6
	v4fvrc5XV5TUVhAUuYVig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396907; x=
	1679483307; bh=34g1rJ4eKpg7Mv3jK1Pi5YCKoRtvBAJ5vAexAPGkFH0=; b=W
	OwhmSW5w8OdUB4dg8PnaHDyMCfwhHm5a8sgXyqO0PVSFhO1MDiYQADBuCXpN7zk5
	pIYVpmA+kPdwRYhzhrn8dVTWB8GyioN19BZ5CxJu67Gs+EE0H0KFo7qWXHCmQ/vr
	vGGMnfuYBiOQKw2h5lSL8yQmvxH+IgJRd2JBa8bPLNI/6ucTd2xKPdK6vPai++Ex
	s7soBPUCCq5+8cZGQcgskcxjWoFOcykPujeauciWTd/oIA+gpah/wLNbT3e/BUBI
	zzhjGOmJ97oV+jghV+2ihL/1QGxZt3gex5MxlL5qMK0QXYhcmg3n+Jc82s2Dp2VR
	tK+HB0so+lUgPj9tsFPzA==
X-ME-Sender: <xms:K5AZZCCeDevojgzHlmqOuVkf0WVt3kA2sIdIMRFuR3L-rQB4PkHqZg>
    <xme:K5AZZMgvUx5G849LWNfilyZB8sYDAP2vMelYCjuzvxvrVrMQhjLzbCM8epM2kPjpK
    Cd0uiK-BnSzINKYBaY>
X-ME-Received: <xmr:K5AZZFlgGRribAerj9e29wl1EP7-_rCyXAz8VYm36-8_coo_poDgESEpHOb-1A9yu7wlIloJE48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:K5AZZAxoTS4-Enr_LRenIV52tFK6fIf_OlFHQKHSpzkW1nSPiWJZjA>
    <xmx:K5AZZHTZw9GZ5wTscsriCuRaKtYrgA4YYHdEZ21X3aLPYcZOP8gksw>
    <xmx:K5AZZLZqmNXh8ihQi4efRYoI2-OCE32nFzBH6-eU5rYU-dDQGRvD8A>
    <xmx:K5AZZPaWlkVxBcFthA1CvCe63W6mpgde3lTCQwQhvk2iCfxxleGwFg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:26 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v3 2/4] dma-mapping: Provide a fallback dma_default_coherent
Date: Tue, 21 Mar 2023 11:08:11 +0000
Message-Id: <20230321110813.26808-3-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
References: <20230321110813.26808-1-jiaxun.yang@flygoat.com>
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
2.37.1 (Apple Git-137.1)

