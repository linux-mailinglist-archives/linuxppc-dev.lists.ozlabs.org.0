Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D86C2FDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:12:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PgppQ2Fn8z3fHL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 22:11:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=0UoPN+QG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J/xvX8RL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=0UoPN+QG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J/xvX8RL;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgpkR5ZYpz303h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 22:08:31 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id D49AA5C0100;
	Tue, 21 Mar 2023 07:08:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 07:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396909; x=
	1679483309; bh=xty1DMHWS21lQRmeSpDxl+4CCE4XjxtL7XjtmR8nqy0=; b=0
	UoPN+QG7C1bqGiTWN8M+gr2WGRS9F29y8aRdjCzMMr4yroyCFAZG+3MTqNzR0ZiD
	S5ZLJFo9KL+t+u8PKbkIVsx3ak4xpwSWvQQRg1VYt1W6NcGczki7zgIrvcimQp8p
	9s5Rkgi5hSWw3EPYLaV7Lbz8mKoLcBw0TTGbKfDmWaaEqH+TcG2FPF7YZgpjx/TH
	jrCbjUuXnd1a+a2M4ajjoiEtGQA2XslZUI0kuLIGHgwYGY8y/0FB0Gb+/FFL6R7g
	koUe24E/go/e2UMVTGupP15fJKi4vG748BlibyW678ACI/AM5SbKyxBoWH6Qr2TL
	gHAbNgdQCvsx6UBdajAog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396909; x=
	1679483309; bh=xty1DMHWS21lQRmeSpDxl+4CCE4XjxtL7XjtmR8nqy0=; b=J
	/xvX8RLujujOWnzb+wQhi5Se8NK6SvZKbknGTlOKa9Hn1evkACp/eE8IcSOasdjK
	L5w2qJZT/3HR2K2jTo5sN+M2wDJb052lIa/Fo8+3vqSr7TE4ZvLR62BAYfxBnTc4
	Q1lehIrPcgzjCk/6Jam7FveyPtiOe6jaFVKifg1TwBhhy82f4ITbBCIUG/mhFria
	nuZUqcpTGUu4Lc+0Q1NpnIETBbphoho604rRbfYAAnyE6gOCkRS+SelycvO1D+Je
	Zw0VToQ7dKx3WEIhuv2DwStbf8w8Ahvv6wEYt+jEEIRFqeJ5kRC+TuB0BEciEw3F
	GnG6lYsfURMLW3Trx+f4A==
X-ME-Sender: <xms:LZAZZLTwezUflS6T1EDsRtAHF0s12HJ1gLwdMgedmSGGMY_KSQVmPA>
    <xme:LZAZZMxQ7WXycx4HBEiGI_ZzjmDbnc4dO8L8utRhxzmWav4nbP4LuQYQdcL6WM40r
    FmTlkJ8VY_KEefFGnI>
X-ME-Received: <xmr:LZAZZA0HE_gGtxuA3DKeP235tA15-npR20iqsKfH5hhWSHUGj5FZM-RkZfCB5ALDMGuny-l6dAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:LZAZZLAaT8PtN8RNAd953nnVvjtsqrtH3MUuai3ib9h97uUmUX91Gg>
    <xmx:LZAZZEhBLLH-mrASDpc4ujeA4bbFM6e1pNj3uAJMfLtwvSUV-ANo1Q>
    <xmx:LZAZZPoXxVEcaYCL0lnMwGqofAMs0P5ZAv51vTntPoTXcZ-NXjgaoA>
    <xmx:LZAZZDodGSm9u9AHM7SdGxmJnfGoidUeMzvceHFmj0V_69UtguE0Nw>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:28 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v3 3/4] dma-mapping: Provide CONFIG_ARCH_DMA_DEFAULT_COHERENT
Date: Tue, 21 Mar 2023 11:08:12 +0000
Message-Id: <20230321110813.26808-4-jiaxun.yang@flygoat.com>
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

Provide a kconfig option to allow arches to manipulate default
value of dma_default_coherent in Kconfig.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Add comments
---
 kernel/dma/Kconfig   | 7 +++++++
 kernel/dma/mapping.c | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index 56866aaa2ae1..6677d0e64d27 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -76,6 +76,13 @@ config ARCH_HAS_DMA_PREP_COHERENT
 config ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	bool
 
+#
+# Select this option if the architecture assumes DMA devices are coherent
+# by default.
+#
+config ARCH_DMA_DEFAULT_COHERENT
+	bool
+
 config SWIOTLB
 	bool
 	select NEED_DMA_MAP_STATE
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 80f9663ffe26..9a4db5cce600 100644
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

