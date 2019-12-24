Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7CC129DFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 07:01:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hlwC6C45zDqN9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 17:01:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.25;
 helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="IbzIp6E6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="wZC2mhCu"; dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hlnx322DzDqN5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 16:56:05 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 25F6822040;
 Tue, 24 Dec 2019 00:56:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 24 Dec 2019 00:56:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=HNaf5NLW14hQr
 LdxJDMbqeAu56lYddI2fvxI/Oi2Q/k=; b=IbzIp6E6KQyiIG9rgeFnW3fsle+lZ
 JyV0i6l09BrMpOSmyF4VjAfSg2rF0BeoapfxwQ7n9Te6C4uLyHURjVFQBgq4dp2m
 N08rF7QIym+65gl4tWtM29Gj0rCM88/JFtul1SWTr7NHLvEBwRPdq85OZoRZAXUW
 6MT1G5Ah4UNFDq64O1J5IYNEmvqaYhEyAlIjFw8U2toAed4Ho5PQ2zoH5uAGV1vG
 wkBqqvU9y0BgwjJbyiBZOARyDyalRuK39jWXmQ2UEEG3uxpndETk2r6EEYOOSgHv
 kqjiVq34f2LuycC8OXGW3pacbV3vr/MCSv+qTOc05YceqC8ClbzgSKQ/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=HNaf5NLW14hQrLdxJDMbqeAu56lYddI2fvxI/Oi2Q/k=; b=wZC2mhCu
 2+60kjZBIOrFAAgxXPXmngg4oD5xhdXASIxx17e7bchkcuPrmVkFbJSYshDyM4on
 VCfiP2zO3UeZ3+mzBxqv2czUqXcv/zX7L6+71H0PchwCwvwjUVmXSm+6o3bBJagJ
 PbXt7NGQ4mK3SpABlJsqvZ5G+V5OD0RpH/1x4Yf4eixAMszrM+rosaKNUcC5AL8e
 N9JjqUHKuhdvUVkYqT4izSsthG7xC0/Gq109dar1+Ae3AAVLUaThnt1npiLjcN9g
 Hq4XfJ7fAgDI6K47DUDnQnj0GDKTAVgSOzwwx0C+RznekoYeqeYD8QNnQVkXCv7o
 iaFApKS9kyiz8Q==
X-ME-Sender: <xms:c6gBXiNHcNCWIbdMxIBN09BHUhP2ulAqipcaINESYcHv5FQTLWs0gQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvuddgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdlfedtmdenucfjughrpefhvf
 fufffkofgjfhgggfestdekredtredttdenucfhrhhomheptfhushhsvghllhcuvehurhhr
 vgihuceorhhushgtuhhrsehruhhsshgvlhhlrdgttgeqnecukfhppeduvddvrdelledrke
 dvrddutdenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhl
 rdgttgenucevlhhushhtvghrufhiiigvpedv
X-ME-Proxy: <xmx:c6gBXvsg3-G214m9zEYWPfdlLDVGscKUhTOwEWTxznb23bJuJqR0bQ>
 <xmx:c6gBXt2DhgvIojHFT7-oGd6rf60aEp_n8RV0OHSwVhOQk3yuVTVjUw>
 <xmx:c6gBXuynXM0eQ6JSF9oWj0PK0B0Nj9D1KYhUn3bo4wkIcupgosM60A>
 <xmx:c6gBXsDTzI-x_DmI0wLvxJ8F8rB_0APx1NhNRK-TNx55kHffqdfg_Q>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 289BD30607B4;
 Tue, 24 Dec 2019 00:55:59 -0500 (EST)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/5] powerpc/mm/ptdump: debugfs handler for W+X checks at
 runtime
Date: Tue, 24 Dec 2019 16:55:43 +1100
Message-Id: <20191224055545.178462-4-ruscur@russell.cc>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191224055545.178462-1-ruscur@russell.cc>
References: <20191224055545.178462-1-ruscur@russell.cc>
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
index 4e1d39847462..7c14c9728bc0 100644
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
2.24.1

