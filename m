Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE2F69E59A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 18:10:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLm5H0Kt1z3cfg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 04:10:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=gBZQ/xBK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=MZMgKI/g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=gBZQ/xBK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=MZMgKI/g;
	dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLfRd035Wz3brK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 23:56:12 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id D85E8320093F;
	Tue, 21 Feb 2023 07:46:43 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Tue, 21 Feb 2023 07:46:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1676983603; x=1677070003; bh=4P
	PQjSJNVgwU03Pj5b/L4ZJLYgKGF2yahc105X2h56E=; b=gBZQ/xBKen2MpRDqHP
	kJP4HpYQo9Y6HqiqgXj9Mkqt/E/w3PwhRLBkE2o+OsS3n2SP9Ng/mPu35D3sV0XG
	44kexJZOGcBldDe5iwaHzLuU50gl+ow/vbdFun9T8eu262Wt582T3SGMrheJZZFZ
	3jBvE2XmHjtOp42z/17cv1Rfl7ZsStyBqxCG4finf9YocP1WcjhW8Eb6pPNCvZNI
	GylOw4CO39XLkDwWQI6+alB5FVa5KxxixzE6Uiqk9noV/xrLRZVBRHCHcu5LFdYM
	UOmUoQYDMw5zb3Xh4tRcy1rKVWGuFIckozYMFJalQV2aNBBknfS4tEdcmRBiXsvl
	FxKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1676983603; x=1677070003; bh=4PPQjSJNVgwU0
	3Pj5b/L4ZJLYgKGF2yahc105X2h56E=; b=MZMgKI/gl8T1hTzUgKkJMR3mNindB
	KgWZVIUrLChZ30l55JhNCgYdW3MMIsdwb8GiRKv+NqTDp0pMCAC97JvgBi0NVo1a
	59N/OyP1GexGFx0AURQkG//75AKXweo6fJVG5qBuIej14MxNspp7fNzlW0i5f/S7
	PzcLbTb2XAl8KHgEFu4A6Obsup/5dipb6urtUkNscFOm2gK85vpRHAMfdwKyzZPC
	7iiurARaXXFvV2tzemiTAOgjW4URHiTGQ96+dDpTsoLR5tXecM11Hyd1OvRn/OPo
	7XRYI2Pb6tNtv7Q/DbqQttHVn08MlN0NuJVvQ+r4BSARy5JfmtLi5rAVQ==
X-ME-Sender: <xms:M730Yxt1TniEuAk-73JMgS0iGFIqvjkE9Uxy4xWkpnIlhTL5MvU_uQ>
    <xme:M730Y6c6eF3p3Y5zFYcM0LX2_rxqAJ87QX3aV5by0f-pYzwO-EcRY86QhPcdUtA0Q
    Li8rQpRSIn1YSBBSBo>
X-ME-Received: <xmr:M730Y0xbN6yBdz9NM4GLNuezTMlQJTv40ncFaqE5ubv2J03eLTpYBBJM4UgB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudejjedggeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghn
    ghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeeludefheegvdeuvd
    dvgeekgfdvtdettdelieeihfegtedugeekhfdvhfejfedtnecuvehluhhsthgvrhfuihii
    vgepvdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhi
    hgohgrthdrtghomh
X-ME-Proxy: <xmx:M730Y4OTi2bXoEKFq2FkGt83FufSs4MPUEDr-VEmt7Ky3bECOZ3laQ>
    <xmx:M730Yx9F_eJz7u8kYWrwbw1YZnSqGhR9EWNTXy9jfjTTt6DKvGsDyg>
    <xmx:M730Y4Xkak2MgdU6fBhUD0eDO-TRqxVduoarf2fFIChw6jXVD0dgvQ>
    <xmx:M730Yy1dSx_tc7huMS06v9vjala-OT_7jJ1zaaBM9ajmNjWM3T0nMg>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Feb 2023 07:46:41 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: linux-mips@vger.kernel.org
Subject: [PATCH 7/7] of: address: Use dma_default_coherent to determine default coherency
Date: Tue, 21 Feb 2023 12:46:13 +0000
Message-Id: <20230221124613.2859-8-jiaxun.yang@flygoat.com>
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

As for now all arches have dma_default_coherent matched with default
DMA coherency for of devices, so there is no need to have a standalone
config option.

This also fixes a case that for some MIPS platforms, coherency information
is not carried in devicetree and kernel will override dma_default_coherent
at early boot.

Note for PowerPC: CONFIG_OF_DMA_DEFUALT_COHERENT was only selected when
CONFIG_NOT_COHERENT_CACHE is false, in this case dma_default_coherent will
be ture, so we don't need to select CONFIG_ARCH_DMA_DEFAULT_COHERENT for
PowerPC.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/powerpc/Kconfig | 1 -
 arch/riscv/Kconfig   | 1 -
 drivers/of/Kconfig   | 4 ----
 drivers/of/address.c | 2 +-
 4 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a27fea39413e..2cfee7ba2e6a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -271,7 +271,6 @@ config PPC
 	select NEED_PER_CPU_PAGE_FIRST_CHUNK	if PPC64
 	select NEED_SG_DMA_LENGTH
 	select OF
-	select OF_DMA_DEFAULT_COHERENT		if !NOT_COHERENT_CACHE
 	select OF_EARLY_FLATTREE
 	select OLD_SIGACTION			if PPC32
 	select OLD_SIGSUSPEND
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c1327309e0f6..e69e69b9cfd4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -120,7 +120,6 @@ config RISCV
 	select MODULES_USE_ELF_RELA if MODULES
 	select MODULE_SECTIONS if MODULES
 	select OF
-	select OF_DMA_DEFAULT_COHERENT
 	select OF_EARLY_FLATTREE
 	select OF_IRQ
 	select PCI_DOMAINS_GENERIC if PCI
diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index 80b5fd44ab1c..e040837e5537 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -90,8 +90,4 @@ config OF_OVERLAY
 config OF_NUMA
 	bool
 
-config OF_DMA_DEFAULT_COHERENT
-	# arches should select this if DMA is coherent by default for OF devices
-	bool
-
 endif # OF
diff --git a/drivers/of/address.c b/drivers/of/address.c
index c34ac33b7338..8e17adb10f20 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1053,7 +1053,7 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 bool of_dma_is_coherent(struct device_node *np)
 {
 	struct device_node *node;
-	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
+	bool is_coherent = dma_default_coherent;
 
 	node = of_node_get(np);
 
-- 
2.37.1 (Apple Git-137.1)

