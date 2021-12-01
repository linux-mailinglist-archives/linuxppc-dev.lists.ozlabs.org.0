Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C4465050
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:46:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J422h0fKvz3cV6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:46:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vi5OaZPv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Vi5OaZPv; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yM35s2z3c5C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:19 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 133so5688976pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HLw/6vsXwicoG7Mu0SnQ35hN93YcOzCfaVyabJIki0I=;
 b=Vi5OaZPvNBUgW9MW3npdu4Qs86qVdWhMx/5Fiw5X9StOBTuhAUi1S8AaN0k2a/Fu5J
 c9riLfmb5kP2xVXTM5BxO58DDKau9UeWcqYSH97cnMP0smobK9ikgIMc9/Tf0nBWjZTc
 rWJ0rBGvAbM1dY1xXgMBJrkyOM4XNbfw0iFOvJWIYWKUWR6cK3lCLjlSr2+CIh/hRR+k
 yvor63yDiUB9dXzJ3/qJcryDSq4yIVqg08PJdGslONUREYBYOMWwL1Qpnn+2Zj8+mv1n
 vlBZkmJC/DJkzYYKNObb5+8Vvn/H+e5pWfIWLtJLHvotXU9UOcY2oQUO0RKIE20CRCID
 KOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HLw/6vsXwicoG7Mu0SnQ35hN93YcOzCfaVyabJIki0I=;
 b=1QU3vNMKIMdK4eLLF23kxn/YDKwCtfqehKD26w5H2lKlyP29FMfbQAp74NDg5sI4OP
 C7/nGbdhFjASaLtsBGlDbVIh06Dt+x3exxlBVJYSQ33SKWyDJ6Jp2/JnuODJQ0PRzYW5
 pgsYDPzYwi0eLhm1YrPP5W4T6GoLH7bQ1RHjjEl/icDkDI8k4os8N+1m9Pjnw1fsavGO
 FKfDCoSB1m+BZKiapFe7fQCAqTDk1GwmUhoOqG6Oxnyt6zbFjnzzsA/p1rMmN3PvdsfX
 m5agXk8vQUJ2Skdmbbtm9bn8t+02tK96BH0s5XUtWo80QQUfKitLoCIic+uGfI8T3YZt
 EeHg==
X-Gm-Message-State: AOAM5338dRGLJLY7wadF/oij4okHd79sEL2Idc4HU0V01vq8yoE8MeHQ
 +MHQk1Bo4O8OF94cHM8TGefMB11T3PA=
X-Google-Smtp-Source: ABdhPJxs0BayLa1F/flg1dfPN1IfAn4oeJYJjrUZ/dqOo6p2L8ZyFCkw6LDFW6dW3u44sM04+KLJuQ==
X-Received: by 2002:a05:6a00:1305:b0:4a2:75cd:883b with SMTP id
 j5-20020a056a00130500b004a275cd883bmr6794495pfu.44.1638369737474; 
 Wed, 01 Dec 2021 06:42:17 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 05/18] powerpc/pseries: move process table registration
 away from hash-specific code
Date: Thu,  2 Dec 2021 00:41:40 +1000
Message-Id: <20211201144153.2456614-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

