Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 846BD69F5D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 14:41:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMHNr2L03z3f3K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 00:41:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=CnrFptuF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VzXR1xbE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=CnrFptuF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=VzXR1xbE;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMHJk2ZNvz3c73
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 00:37:26 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 3EC025C005D;
	Wed, 22 Feb 2023 08:37:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 22 Feb 2023 08:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677073044; x=1677159444; bh=5z
	jeAJ2ng0uc67KhUvTeOlPjTfztQbBqYYqvTXy2dRg=; b=CnrFptuFsGKJRUfj22
	eCJvIHR1rJ4rKKwuCSdvEU+t9keMUDYPlDxrKcdqiW0vC5egsutD5g7hoY5HP4i7
	HMkxMbTWzCvonUHl+cEPckRAYx9ZmgvBYs2nTFAyLcI3uiAuukwtflA0h+n2BMtX
	D4c4H29o/Biee/U8QEwpNnT81CSqOzpHNXdTD4PuyxAFkqEbEnSY7rkqI4Zv/IBO
	lZQhHbZED7ZdPdCJW2zwOxN+gyQ0kfwifvdgTVupijeB/M1YFFTKGMxH8T7/XBY8
	s0ryQ9kNXOEtaL17+KH3VNxIVNIK3CaT5rB/phV5snAiLpuwPiJ7jysU0003Jk0t
	hpFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677073044; x=1677159444; bh=5zjeAJ2ng0uc6
	7KhUvTeOlPjTfztQbBqYYqvTXy2dRg=; b=VzXR1xbEz1IC9r9+uv9wPm7aP/JYm
	taOclHyTm8DhAhbYsRGnFHa5ifieabUyklQVcAaMOmmh1jOttMTuNN64yGb1pkJo
	ZN9lsKeIetM7xEYG3zU2Ko30dMLs29mKeKRZdqM1lTWf/1XFEHmBtRTEwPh1yNwO
	IFHfS6W/kMf3DxmGvR562tP06uxyuItekl0iqQQfMxtQNa+vRe+uhaE8Xv3mvxVV
	SDLkEfgUkGrH+CXQwWdFMh2tLYm3h/pl3/VehpFL/z8ibRv1fFD+mKzD+MxQZgeD
	mgHThGHB/4Z7OYCzCdRgQojveVgnaSKqfFMvRK5cQm1DKvyqOIPdeJ8xQ==
X-ME-Sender: <xms:lBr2Y_fd_y7-lyDagHUQauYYUsjMuYvbJVMQx4dyJAOktY-ztVfrAg>
    <xme:lBr2Y1OIB_44Crz0vWfrdn4wFfJxATCwx12gxJ38K-VJxVEpu6PWFu3fi5KwG6hoJ
    EbduqNJ0aX06s8cfgc>
X-ME-Received: <xmr:lBr2Y4j1k4trw4eeC3YlaU0_CUT_vM7uf538cvdTul_wh9JeDYyviQ-BoSFb>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejledgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:lBr2Yw8n2-qOCR3hBXdqQb9KZcMcGNydr7HI24bFMZk4nsLW5F6ZOQ>
    <xmx:lBr2Y7vffiT2Pmx4n1TJUvyiwviZFB1feIvDEg8oDdA8u04ZKZ5ivA>
    <xmx:lBr2Y_HgUXKLtz07fcBscvXWh8na5wCKIbEa_84pnwjT-N0TsmB1hw>
    <xmx:lBr2Y_ERVjZ8C1xQR81Q6cevq2oOO_I25aenHUeMo4usyzbGh_azpA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Feb 2023 08:37:22 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 3/3] of: address: Use dma_default_coherent to determine default coherency
Date: Wed, 22 Feb 2023 13:37:12 +0000
Message-Id: <20230222133712.8079-4-jiaxun.yang@flygoat.com>
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

As for now all arches have dma_default_coherent matched with default
DMA coherency for of devices, so there is no need to have a standalone
config option.

This also fixes a case that for some MIPS platforms, coherency information
is not carried in devicetree and kernel will override dma_default_coherent
at early boot.

Note for PowerPC: CONFIG_OF_DMA_DEFUALT_COHERENT was only selected when
CONFIG_NOT_COHERENT_CACHE is false, in this case dma_default_coherent will
be true, so it still matches present behavior.

Note for RISC-V: dma_default_coherent is set to true at init code in this
series.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/powerpc/Kconfig | 1 -
 arch/riscv/Kconfig   | 1 -
 drivers/of/Kconfig   | 4 ----
 drivers/of/address.c | 2 +-
 4 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2c9cdf1d8761..c67e5da714f7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -272,7 +272,6 @@ config PPC
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
 	select NEED_SG_DMA_LENGTH
 	select OF
-	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
 	select OF_EARLY_FLATTREE
 	select OLD_SIGACTION			if PPC32
 	select OLD_SIGSUSPEND
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1d46a268ce16..406c6816d289 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -119,7 +119,6 @@ config RISCV
 	select MODULES_USE_ELF_RELA if MODULES
 	select MODULE_SECTIONS if MODULES
 	select OF
-	select OF_DMA_DEFAULT_COHERENT
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 644386833a7b..e40f10bf2ba4 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -102,8 +102,4 @@ config OF_OVERLAY
 config OF_NUMA
 	bool
 
-config OF_DMA_DEFAULT_COHERENT
-	# arches should select this if DMA is coherent by default for OF devices
-	bool
-
 endif # OF
diff --git a/drivers/of/address.c b/drivers/of/address.c
index 4c0b169ef9bf..23ade4919853 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1103,7 +1103,7 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 bool of_dma_is_coherent(struct device_node *np)
 {
 	struct device_node *node;
-	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
+	bool is_coherent = dma_default_coherent;
 
 	node = of_node_get(np);
 
-- 
2.37.1 (Apple Git-137.1)

