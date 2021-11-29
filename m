Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F5460D09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:11:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vkf6GvKz3ccb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:11:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CT//p1gR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535;
 helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=CT//p1gR; dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfc1mcHz3c63
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:24 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id q16so14483558pgq.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLw/6vsXwicoG7Mu0SnQ35hN93YcOzCfaVyabJIki0I=;
 b=CT//p1gRmikA7FJwfi40LMQGGh2Du5Pw9ZANEOeTIYgGvZYXiAabeCiTequ5OyujW0
 BC2PEzFF5lwLhUfp89w8Um2V8hrsKZBIDAZ08LroMNhFWxaZ7NT7/vYuH6iI1rfU9JJp
 2NgFXlZK+5cIXWV1K1C3m151CzhJIYOHNqu4LUXB+zeqzEqlJWdsClLk4qllGtP+ihAB
 eOLbpT4zazlNd8ClmHQO+o6XjPTEkLWUTw8l8eWW567KwNMhWMm/sGp3bT284LNvJ06Z
 Y9sbClMpZHeANMkyeoaXj5iuWO40ZAw2yZz/e6pIFzbvXzuZ7sQHpHh0KX/uwJ76CMg5
 N1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLw/6vsXwicoG7Mu0SnQ35hN93YcOzCfaVyabJIki0I=;
 b=vwYAY1DdKxYHdDgQpbrCGkH37pXu7c5HgKI+haRC//ZCgFu706VkuHPm1X3QqNJUql
 0Yf3FoXasOH66SqLYsPCExh148fVXawoDpaqVeS9yPNDP2VTZ6zGjdieIP9FEM0q5t7n
 CA4DMn7Jc3MiBzSHO27RBGzeVGu4LArEFaZj7kEBv+jY0v5GA+RZiEj9xJ1MdsMsCmD5
 EgHnLUZ1QPgJMvrkF5/xKi0kLzU5lVuUs2n9JcXL5tp/JxnS8//ti9p3D5AwE6chwsKL
 ruWmqa2ybgKV2PTsIifpxbkv4fPW33NQSe0+6YhWejEzkphc583gfQTI/lFZmiRsxRGm
 90Hg==
X-Gm-Message-State: AOAM5334EXBjq0maC30udzGt3m6OJpEh+3dkQC4UplsfQg5o2HZEwPVI
 EwSye5t2R+e0mQ0vZeSDO4UcfByvjRs=
X-Google-Smtp-Source: ABdhPJxxF/msqrc8I10hpFH+P81+66Udi+0ShvKJJkTiQo2lqf9VK9grQWcx01/qdAXbMR3gaH4dfw==
X-Received: by 2002:a65:4785:: with SMTP id e5mr34042151pgs.405.1638155302088; 
 Sun, 28 Nov 2021 19:08:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 05/17] powerpc/pseries: move process table registration
 away from hash-specific code
Date: Mon, 29 Nov 2021 13:07:51 +1000
Message-Id: <20211129030803.1888161-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reduces ifdefs in a later change which makes hash support configurable.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 56 +++++++++++++--------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 3df6bdfea475..06d6a824c0dc 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -712,6 +712,34 @@ void vpa_init(int cpu)
 
 #ifdef CONFIG_PPC_BOOK3S_64
 
+static int pseries_lpar_register_process_table(unsigned long base,
+			unsigned long page_size, unsigned long table_size)
+{
+	long rc;
+	unsigned long flags = 0;
+
+	if (table_size)
+		flags |= PROC_TABLE_NEW;
+	if (radix_enabled()) {
+		flags |= PROC_TABLE_RADIX;
+		if (mmu_has_feature(MMU_FTR_GTSE))
+			flags |= PROC_TABLE_GTSE;
+	} else
+		flags |= PROC_TABLE_HPT_SLB;
+	for (;;) {
+		rc = plpar_hcall_norets(H_REGISTER_PROC_TBL, flags, base,
+					page_size, table_size);
+		if (!H_IS_LONG_BUSY(rc))
+			break;
+		mdelay(get_longbusy_msecs(rc));
+	}
+	if (rc != H_SUCCESS) {
+		pr_err("Failed to register process table (rc=%ld)\n", rc);
+		BUG();
+	}
+	return rc;
+}
+
 static long pSeries_lpar_hpte_insert(unsigned long hpte_group,
 				     unsigned long vpn, unsigned long pa,
 				     unsigned long rflags, unsigned long vflags,
@@ -1680,34 +1708,6 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
 	return 0;
 }
 
-static int pseries_lpar_register_process_table(unsigned long base,
-			unsigned long page_size, unsigned long table_size)
-{
-	long rc;
-	unsigned long flags = 0;
-
-	if (table_size)
-		flags |= PROC_TABLE_NEW;
-	if (radix_enabled()) {
-		flags |= PROC_TABLE_RADIX;
-		if (mmu_has_feature(MMU_FTR_GTSE))
-			flags |= PROC_TABLE_GTSE;
-	} else
-		flags |= PROC_TABLE_HPT_SLB;
-	for (;;) {
-		rc = plpar_hcall_norets(H_REGISTER_PROC_TBL, flags, base,
-					page_size, table_size);
-		if (!H_IS_LONG_BUSY(rc))
-			break;
-		mdelay(get_longbusy_msecs(rc));
-	}
-	if (rc != H_SUCCESS) {
-		pr_err("Failed to register process table (rc=%ld)\n", rc);
-		BUG();
-	}
-	return rc;
-}
-
 void __init hpte_init_pseries(void)
 {
 	mmu_hash_ops.hpte_invalidate	 = pSeries_lpar_hpte_invalidate;
-- 
2.23.0

