Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4094AD5AB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 07:27:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46s6WK5w6jzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 16:27:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.25; helo=wout2-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="CZcCXK1r"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="TGyP5rXI"; dkim-atps=neutral
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46s6NM3gqCzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 16:21:07 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 910CB425;
 Mon, 14 Oct 2019 01:13:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 14 Oct 2019 01:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HYGtzzTlMcF3v
 eMN2AqVXMM15POrvmVyLU/o7hZnrc4=; b=CZcCXK1ruQMsWifP+BuWFTDNOwqjK
 cUq+xsM/2hPoT/Ct58QQDMUP/iCo8BqP9wRJkgfbW1q/2w1m2Q0KRPrEUKuBnaIH
 Fann+0zA05uyeaapNBG+Jm6ijffVGkgM7EzEhZXYQDFQgvoD31UOtN7tcz8+P4ov
 NTrXa13DgtietJBIsGZqs3O3HGZ0hH6ZQivPg5nfu3w2l6F58E9Q8aFFKOevmr4Q
 Jd14hwVW8xDQN/R4V1p+bNkifRcd6tUD4tn17p0+8bdxuYS9tVteBef4sgXGvwwd
 /73CT5W/MEBjrdNydVpBZb529Nng7TB++7oEQi7Ss7LAWSMFwy5Ty7MjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HYGtzzTlMcF3veMN2AqVXMM15POrvmVyLU/o7hZnrc4=; b=TGyP5rXI
 Po4QmiZG+PLIgKoTyopCASlfEGy4ZLWCDv54z0Ycr7GkL8PCW9X8Tdgs41+8ycr1
 YPSjKLe6z76EU07qVvQmf7p9IQqPiAlFAFbCcQ9SwoOY1oeYIlGhsghAcJ2dB/+d
 aRxTUkWW0ApUAyCnT74smhE09TQiPkD950dxRhru2FUosIK3CtoLpGYlRLniDbNL
 y0nmjwGyR/PWmaTHl68sZcsQqwI5lCHUy4MpyrP7psCLkZ7gEbv9hp1/4OwNsQ1A
 IDlleblqqQQcj8kMCGHHuxswL7xuM5Iibd2P/GnQixrEEVfCbJzXhG6es7OY+pwT
 xh7EMMfvBA/Oyw==
X-ME-Sender: <xms:FASkXVHJs88H8Xol6uokigFp9MYKvYgC1QCLvH4jNKflPZiHA68xDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrjedtgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdr
 tggtnecuvehluhhsthgvrhfuihiivgepvd
X-ME-Proxy: <xmx:FASkXSCUuL3XrcCWg_LVbzthcsbonkTFSWBEvXqjR_cmRvH7IJhZfA>
 <xmx:FASkXZXh2UzElft5w8B9TctxVgywhzs0rYBmZNPapCLVAWRADKcEYQ>
 <xmx:FASkXZxvdm0gIkwC2GlfXonHzMcNxGmNpFTIcuVnyfhUYyPSptNdGw>
 <xmx:FASkXXTx8vWwfyRgrPhQtvcBEcl2fctmV-i9Ya-Kb8pYr3ZuUfgK5Q>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2434E80061;
 Mon, 14 Oct 2019 01:13:52 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 3/4] powerpc/mm/ptdump: debugfs handler for W+X checks at
 runtime
Date: Mon, 14 Oct 2019 16:13:19 +1100
Message-Id: <20191014051320.158682-4-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014051320.158682-1-ruscur@russell.cc>
References: <20191014051320.158682-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, Russell Currey <ruscur@russell.cc>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Very rudimentary, just

	echo 1 > [debugfs]/check_wx_pages

and check the kernel log.  Useful for testing strict module RWX.

Updated the Kconfig entry to reflect this.

Also fixed a typo.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/Kconfig.debug      |  6 ++++--
 arch/powerpc/mm/ptdump/ptdump.c | 21 ++++++++++++++++++++-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index c59920920ddc..dcfe83d4c211 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -370,7 +370,7 @@ config PPC_PTDUMP
 	  If you are unsure, say N.
 
 config PPC_DEBUG_WX
-	bool "Warn on W+X mappings at boot"
+	bool "Warn on W+X mappings at boot & enable manual checks at runtime"
 	depends on PPC_PTDUMP
 	help
 	  Generate a warning if any W+X mappings are found at boot.
@@ -384,7 +384,9 @@ config PPC_DEBUG_WX
 	  of other unfixed kernel bugs easier.
 
 	  There is no runtime or memory usage effect of this option
-	  once the kernel has booted up - it's a one time check.
+	  once the kernel has booted up, it only automatically checks once.
+
+	  Enables the "check_wx_pages" debugfs entry for checking at runtime.
 
 	  If in doubt, say "Y".
 
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 2f9ddc29c535..b6cba29ae4a0 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -4,7 +4,7 @@
  *
  * This traverses the kernel pagetables and dumps the
  * information about the used sections of memory to
- * /sys/kernel/debug/kernel_pagetables.
+ * /sys/kernel/debug/kernel_page_tables.
  *
  * Derived from the arm64 implementation:
  * Copyright (c) 2014, The Linux Foundation, Laura Abbott.
@@ -409,6 +409,25 @@ void ptdump_check_wx(void)
 	else
 		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
 }
+
+static int check_wx_debugfs_set(void *data, u64 val)
+{
+	if (val != 1ULL)
+		return -EINVAL;
+
+	ptdump_check_wx();
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set, "%llu\n");
+
+static int ptdump_check_wx_init(void)
+{
+	return debugfs_create_file("check_wx_pages", 0200, NULL,
+				   NULL, &check_wx_fops) ? 0 : -ENOMEM;
+}
+device_initcall(ptdump_check_wx_init);
 #endif
 
 static int ptdump_init(void)
-- 
2.23.0

