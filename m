Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522AD6C2FE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 12:13:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pgpqb0lKZz3f3m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 22:12:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=EKCJqVU3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I8ij9zH8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=EKCJqVU3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I8ij9zH8;
	dkim-atps=neutral
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PgpkT5WYwz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 22:08:33 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id CFE785C00CD;
	Tue, 21 Mar 2023 07:08:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 21 Mar 2023 07:08:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1679396911; x=
	1679483311; bh=RMUyY24KVPUr2kuw3Jz6nElWvCSULjyC1kNh/s6lQlQ=; b=E
	KCJqVU37dGL/jAYaoCalJYg8HEzX4Tk+7YXps1J67iMBQ14ON5M7rcgrCRRjJBJA
	1KR6BQ1HP8YgrUhpw6sXR4Mzlbxskn9LcK6TUdBWOJso9DFDNM2CwsRjoWSzzVdB
	kjdvIdDLBtuucjMqJzu7+sgu5GIfxj6/61EYO67ezJWw8B/2FLV9IjsE5M/uIhYt
	lI3jnHoaE1Nfypb9WGW+uie9F46BR2SD+iGW6nBVu6HjrpGmunga9YDH6Mum5UI+
	5QVtsSKEHAjAMhObwnxJqoI01qhNHh/3ZBErOb9MJwfoEQC6ioNwMh9qXJxwJHIH
	UbruH/r2VBGMxIyo9MVzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1679396911; x=
	1679483311; bh=RMUyY24KVPUr2kuw3Jz6nElWvCSULjyC1kNh/s6lQlQ=; b=I
	8ij9zH8Vk9qa8A82aaFfxbWTmSjPHJsOeKLV3ABKaJokfgY65T/iOLHYC3VxhQmG
	KDFZh/LTNctR4BcO+ynAE4X47qXPidwM24+H/zbgcGNIF63KfLKBpzWKakoPIuQB
	65OdYabaVJagU6aM2QdCLj3MJb4d91mpfkY/xP59piH+HsrM1ZhB1A/IW3YhoC1t
	PvS3MoEflpvKe5l/dO45oHfJRFjMFzrT/qlWC/R3ilSo3vWnh8WYBgDOD3r1vPFX
	xzfkMVp5py5SGqBlP5FKELGBXJkWTr5IiAP0t4FEGOBgXSnT+9teYZloCrKXWKfM
	St8RmvzYjmvxchtbiCQow==
X-ME-Sender: <xms:L5AZZF0JTSX9CWLeGzNm34wTaNOyXmD9M64feYRDaKJwPqW9jdZ_Hw>
    <xme:L5AZZMGm6KeLLQ3CXwfdr0PIEbP0lrSWkr_YdvmozEGu5LiAXL--3le2LIQOPbc1F
    BPipS6eCWw1f0SHpPY>
X-ME-Received: <xmr:L5AZZF6-LJMfB8gaKJhhOCv4F0Kdcwbt0bWYpOIifuNsGglEAEgffOYEP-Gp__18B0a_5jgq5xU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:L5AZZC3uoCSqnFZgv1Y5WP87fRYtYCBEqRUjJ157T9Z_my_i7FKsbw>
    <xmx:L5AZZIGbQQLR_pvbKLnfln6ElnLSreM9hATAEPhe4UAkCPp7LQ-JTw>
    <xmx:L5AZZD-4d6FLIpmVdEg-y2na_DYd-ZooTmvUh_JbiXYVDBHzoYfZRQ>
    <xmx:L5AZZL9Y-EmhICS9i61ujCnyDI53kMfBXlvPb94IyO964ep1xUmkSQ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 07:08:29 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v3 4/4] of: address: Always use dma_default_coherent for default coherency
Date: Tue, 21 Mar 2023 11:08:13 +0000
Message-Id: <20230321110813.26808-5-jiaxun.yang@flygoat.com>
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

As for now all arches have dma_default_coherent reflecting default
DMA coherency for of devices, so there is no need to have a standalone
config option.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v3: Squash setting ARCH_DMA_DEFAULT_COHERENT into this patch.
---
 arch/powerpc/Kconfig |  2 +-
 arch/riscv/Kconfig   |  2 +-
 drivers/of/Kconfig   |  4 ----
 drivers/of/address.c | 10 +---------
 4 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 57f5d2f53d06..824e00a1277b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -113,6 +113,7 @@ config PPC
 	#
 	select ARCH_32BIT_OFF_T if PPC32
 	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
+	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_HAS_COPY_MC			if PPC64
@@ -273,7 +274,6 @@ config PPC
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
 	select NEED_SG_DMA_LENGTH
 	select OF
-	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
 	select OF_EARLY_FLATTREE
 	select OLD_SIGACTION			if PPC32
 	select OLD_SIGSUSPEND
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 36a5b6fed0d3..6425b5c5d6d4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,6 +12,7 @@ config 32BIT
 
 config RISCV
 	def_bool y
+	select ARCH_DMA_DEFAULT_COHERENT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
@@ -121,7 +122,6 @@ config RISCV
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
index c105d66a1fa4..23ade4919853 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1103,15 +1103,7 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 bool of_dma_is_coherent(struct device_node *np)
 {
 	struct device_node *node;
-	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
-
-	/*
-	 * DT-based MIPS doesn't use OF_DMA_DEFAULT_COHERENT, but
-	 * might override the system-wide default at runtime.
-	 */
-#if defined(CONFIG_MIPS) && defined(CONFIG_DMA_NONCOHERENT)
-	is_coherent = dma_default_coherent;
-#endif
+	bool is_coherent = dma_default_coherent;
 
 	node = of_node_get(np);
 
-- 
2.37.1 (Apple Git-137.1)

