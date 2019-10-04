Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFCCB57D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 09:53:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46l2Dk34whzDqC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Oct 2019 17:53:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=russell.cc
 (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com;
 envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.b="cPFMyuF6"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="OXRlT0pj"; dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46l2Bb4DBJzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Oct 2019 17:51:35 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EBECD528;
 Fri,  4 Oct 2019 03:51:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 04 Oct 2019 03:51:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=g9XZdQcihsL+T
 J0g40gPwfSRXv7Xn33lm7ZkFfhvlr8=; b=cPFMyuF6x1Gt5X1r0XiOrLe1sDKXQ
 mZiDQcjAK2je2Qa8WOEpQv7HP7wZe7ancmiXBjKp0NzoHbeDvQ77pxnyW2oLvM2l
 J/ktGQkDJa1Mt+pD2ZFwBC0kXfc76iL6w8I0LVaFhxnfTDkqdXCKrbi3BnahuADB
 vb8RG+QVm4G9McgLlNYVlaOh3jj7qcS2uP3EayM3nktigmqrsHLpmm8Rj3xFG7ts
 s14ZgQswBOpZXSlJwiIACrCtZpMXY4RNxL286JGV6jhaM2roWjfeXTrxj0elLKhX
 njMbzbtHAYun/bLeTBTFyJ4EfFu6+EOj/Kwgwmn1PLeV+JMCtpKW/XiCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=g9XZdQcihsL+TJ0g40gPwfSRXv7Xn33lm7ZkFfhvlr8=; b=OXRlT0pj
 vjznrR0DQSNO5ZvEiUhM/c3A189OFEF4+XbTbePzR4Hp1dBFsEcW632wZj+xVXiA
 Hzd3VeAx67sPZruYkDy+kyH3c6tG4UKynugi0LLk4CDToQLSdXcPBbj7pQPN+jJS
 4fNzvWXXquZZiuy2ykLJA+vMmWDRXiCSpmJzVLPvDM5aFm90LhS+fFC04IkSor6I
 IWKANxtHUpK3rjmAmX1qLenoWiQ8LUAa7bkONqibpQzgGeASFKwtwp70NG998CLc
 VEWO/QHZ0Bklrk+w+4N1WCFZhDtUcYxpZgKJ1XGQq1F8+LTD0bknXg0nYdbIXQ4V
 NIN4fxZAuQaGQw==
X-ME-Sender: <xms:BPqWXUDsQd8UFrIcWj7zZZYA-rZV9Znh1HFET6vbvExdPZN2gO-fVg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrhedtgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephffvuf
 ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucfkphepuddvvddrleelrdekvd
 druddtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllhdr
 tggtnecuvehluhhsthgvrhfuihiivgepud
X-ME-Proxy: <xmx:BPqWXSkgmL8eRvslAGCIqn5EIOQOwazZMJhhUfogKVGO2VI5GMw4tQ>
 <xmx:BPqWXdhBFQvU4dkO4sNy9v255jhGrtTsjmf7YgRnzHuTzdiDh1uX5A>
 <xmx:BPqWXbsmp8o1ARcTDcuiGoWIwLQ5Kdtl-PuL7UP8NtOyxzPHoSgGcw>
 <xmx:BPqWXWeX855JYIx3QWf5NR1_4S8KBxArgKARkPBL-rtXVaHBuugS6A>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 71CB88005C;
 Fri,  4 Oct 2019 03:51:29 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] powerpc/mm/ptdump: debugfs handler for W+X checks at
 runtime
Date: Fri,  4 Oct 2019 17:50:49 +1000
Message-Id: <20191004075050.73327-4-ruscur@russell.cc>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191004075050.73327-1-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au,
 Russell Currey <ruscur@russell.cc>, rashmica.g@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Very rudimentary, just

	echo 1 > [debugfs]/check_wx_pages

and check the kernel log.  Useful for testing strict module RWX.

Also fixed a typo.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 arch/powerpc/mm/ptdump/ptdump.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 2f9ddc29c535..0547cd9f264e 100644
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
@@ -409,16 +409,35 @@ void ptdump_check_wx(void)
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
 #endif
 
 static int ptdump_init(void)
 {
-	struct dentry *debugfs_file;
-
 	populate_markers();
 	build_pgtable_complete_mask();
-	debugfs_file = debugfs_create_file("kernel_page_tables", 0400, NULL,
-			NULL, &ptdump_fops);
-	return debugfs_file ? 0 : -ENOMEM;
+
+	if (!debugfs_create_file("kernel_page_tables", 0400, NULL,
+				 NULL, &ptdump_fops))
+		return -ENOMEM;
+
+#ifdef CONFIG_PPC_DEBUG_WX
+	if (!debugfs_create_file("check_wx_pages", 0200, NULL,
+				 NULL, &check_wx_fops))
+		return -ENOMEM;
+#endif
+
+	return 0;
 }
 device_initcall(ptdump_init);
-- 
2.23.0

