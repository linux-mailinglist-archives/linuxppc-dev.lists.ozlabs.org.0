Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4406A0795
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 12:42:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMrjc5Wnbz3fQt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 22:42:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=ZYx1bDuX;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dHGoWZQm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=ZYx1bDuX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=dHGoWZQm;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMrbj2gB5z3cP0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 22:37:21 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id A677C3200903;
	Thu, 23 Feb 2023 06:37:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Thu, 23 Feb 2023 06:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1677152238; x=1677238638; bh=A0
	q1CdbW0fU/g1nyE4c65Ng5Fe+F9X72Jzw/B0drPQM=; b=ZYx1bDuXXJN5VVmM/f
	zP+uVWT3qTFs9dkjpcMw9J/Xt5jXSsdwIznxjhz1EGSo+xGNBx1L6zu54zWjur75
	E1CSFjbPb4g54lDdoVkawdexiOiXHT2V4RTV2pWDD5gRFwiPTSow4+PGQnRvqlXr
	zm3RPuGsbkbNO0O7o7m5kSxaRS2sYV3CkKIJCRbEivuGWgrkTM0blPAyjJaPhrfH
	SInLwoX2Cnwu4isyaYEYWIx037fv6xeaViI7Cflw3+RTBR6Rvw8JSePSuYFpzPYt
	vV8HCuv/dTC4SXORj0Ht+OUZ9VhiQZhlKdt2BIS96Pm3bspuVa7tGysrCnPMcilL
	EcQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1677152238; x=1677238638; bh=A0q1CdbW0fU/g
	1nyE4c65Ng5Fe+F9X72Jzw/B0drPQM=; b=dHGoWZQmyS/E49j/+9C4ueX7oAIF7
	Ghphd0WvKZpK8E136jcZS2sKedaq6NIDeha4SpY/MNng7u88IV3sGkP0Hzu/iRHH
	7698Nx0XnjVb29D1QQO+ydgHtMjxtNNvJPwfD9AbZ62yfNIsX1r1LpYpZjg6gbHk
	cc64IaM5iZV/5G+5AslzQq9L4B5RwjO+Bw5OWcfWYkLNSTrbMFGS50yRHj5qZsjh
	rTdoe68GMPqxELCsw3eiRgFQTeCxBdueSQ6kdJu6Qxv/NUGmVVtHBQ48yeMvHYE4
	6/AjWlzf2WHSDH/4tMAvGBE8TSqVSJ5KZEc02LhksU05nn2ciNUVYWJ6A==
X-ME-Sender: <xms:7k_3YwPEexy-nFuh0yPCJHU7zn2pzUi9cqD_Bvfp-JqA9qKMaRAW1A>
    <xme:7k_3Y29Dh-dLp28I8avXHx75JT38Z-dn21yXzEHDw-FFtgHNcM3ii6g_MPKVtxqUi
    v8HiRyBRVCujelT8ps>
X-ME-Received: <xmr:7k_3Y3TI4X6Zfgf5hSIP_P3fWpwCtG-CYFxCfb65jU5RIABG7Q2EjXCb3KEMEwL0xuoE9sU9CQo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddgvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:7k_3Y4v9DYh5x1_0Zm8rJsiwfUD9yixn6PXPi-tLNWVsxU68IWchow>
    <xmx:7k_3Y4eaJwJqEgl0pI6TcmmrEDoyjsEUx0elQjhH1w7r3qcjfBDVNQ>
    <xmx:7k_3Y82xDIeWLH-ndXKkLAaxuPwJzruGEPw7HWhoQsQB8UsWDOpCPQ>
    <xmx:7k_3Y83RFhMM_sNn9oN5FQMHC5WkcNklbd7fPeMnZqWNgIxJcAj35g>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 06:37:16 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH v2 5/5] of: address: Always use dma_default_coherent for default coherency
Date: Thu, 23 Feb 2023 11:36:44 +0000
Message-Id: <20230223113644.23356-6-jiaxun.yang@flygoat.com>
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

As for now all arches have dma_default_coherent matched with default
DMA coherency for of devices, so there is no need to have a standalone
config option.

Note for PowerPC: CONFIG_OF_DMA_DEFUALT_COHERENT was only selected when
CONFIG_NOT_COHERENT_CACHE is false, in this case dma_default_coherent will
be true, so it still matches present behavior.

Note for RISCV: dma_default_coherent is set to true in this series.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/powerpc/Kconfig |  1 -
 arch/riscv/Kconfig   |  1 -
 drivers/of/Kconfig   |  4 ----
 drivers/of/address.c | 10 +---------
 4 files changed, 1 insertion(+), 15 deletions(-)

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
index b71ce992c0c0..a79663191228 100644
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

