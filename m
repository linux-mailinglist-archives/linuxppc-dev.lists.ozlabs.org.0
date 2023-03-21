Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E186C2FCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:09:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgplL5qylz2xdw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 22:09:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=Sd/E4Qvo;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lfx1lZo1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=Sd/E4Qvo;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=lfx1lZo1;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgpkN0Y2Bz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 22:08:27 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D503F5C0184;
	Tue, 21 Mar 2023 07:08:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Tue, 21 Mar 2023 07:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396905; x=
	1679483305; bh=SEVSeLr4YeKzVQBfQj2m8k28yjFkBt6zYOmqTsWGRHk=; b=S
	d/E4QvoCAIH/W+97abDyEMw5xpL7Hg8FuyKeiu1iHlTtZOSHAztvGF9TGawUgQ3d
	sJ2Dx4GHn4jxJfhL8uh9ueg5sTkYlIt4zdgT+Q85O+KDy9Zn7W+/ZiPWlnMAVZjK
	DRM0Ijt8tW18uUDl8wRilhFQhpVKPcLm4nr4ESUapC1tYQtr+Nw5vKbZuwFQDfT2
	7xerssL0lyG6dJM6eGnPa181OYknB4qfGyPiQv4oSyMBL4MEIzxiquCPC0y0CoI4
	QrNJpxAYoaPt21z0QaP/ozB2nxNpCrPyEu9GfnrP62t1hQhLgjYexPCPWTm3bhxM
	iNTYDpoyqNzA+EB9ZOOOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396905; x=
	1679483305; bh=SEVSeLr4YeKzVQBfQj2m8k28yjFkBt6zYOmqTsWGRHk=; b=l
	fx1lZo1fUheuiOZQAr8yusL5cCSoywJ91zmVWTNTZk+zAFI0+9IDzjaTEEGlqRHU
	aRRVH7vGa3LjLUdKyxM0EYKtZcGjyyIuYeRR/wrSsja+HCynas1IqXdgkuEKIpim
	bppUUoKcJ37KbA65KJihkPZUSPbA/rPqa8ZYH4A/PdPKqTBgtYtLYKOmKSqgjgKA
	wNeHNiXwWa4lZsomYGn2/hCcsUUQuBNAYOBvmDDZ4R4+Z0obYnkuN8Zv1dB8B0Dy
	kwk1IwNq3Bsg4ndZEnl5k0FrOBmzcoPTeEsJU2UsnZgUmS/aTiCstLFOsM4W1jkr
	b+YBtJzdE7p+j78N1msiA==
X-ME-Sender: <xms:KZAZZDqYtFFzD2b58O9RftolKWh8ed7Qcc7xb6jDa-bEYsE9VlUH6Q>
    <xme:KZAZZNoIF_SOBXFt6w40XVFInf_LFd3w8kWJRDV4BcZMSh2EWG78F2oJso92EsIKX
    7blLfGd1A5PglCooqE>
X-ME-Received: <xmr:KZAZZAP5Gsyjc1jrhnubGTbhLdyOGPCuYkCeuhXvi05LcOWxJEH7gVMzfPBy0PCUwwHwPc5a820>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:KZAZZG4k3JDP2DBFMr-bJ-cvPvs_wujoA13_X0_IQXSqg-xVai9qDg>
    <xmx:KZAZZC4bIqwlHsUlZRwQfKlE4S4Ygu6R4Lb4UcQJvgP8bZIoOA0Dtw>
    <xmx:KZAZZOiCP2JtynJ6YPV0CiP7AsviWq6JlHloSKVISyA972e0hGSA2w>
    <xmx:KZAZZKgf3AAVmTHBDWuSAwgEUfLiLeYucgsikzoXMTKonpQAJ59Q8Q>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:23 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v3 1/4] of: address: Fix default coherency for MIPS
Date: Tue, 21 Mar 2023 11:08:10 +0000
Message-Id: <20230321110813.26808-2-jiaxun.yang@flygoat.com>
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

DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
might override the system-wide default at runtime.

Use dma_default_coherent to override default coherence for
MIPS.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/of/address.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4c0b169ef9bf..c105d66a1fa4 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1105,6 +1105,14 @@ bool of_dma_is_coherent(struct device_node *np)
 	struct device_node *node;
 	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
 
+	/*
+	 * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
+	 * might override the system-wide default at runtime.
+	 */
+#if defined(CONFIG_MIPS) && defined(CONFIG_DMA_NONCOHERENT)
+	is_coherent = dma_default_coherent;
+#endif
+
 	node = of_node_get(np);
 
 	while (node) {
-- 
2.37.1 (Apple Git-137.1)

