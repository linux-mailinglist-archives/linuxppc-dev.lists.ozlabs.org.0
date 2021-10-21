Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F7435999
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYc06Hmpz3dZQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:58:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jQb2v6mt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jQb2v6mt; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYWw2WGbz2ybL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:36 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id n11so17580354plf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WCoLPL0394EyEbAAqA4/lqZq2wRN2EeHKApovTkjBY0=;
 b=jQb2v6mtRSh6S0s9w7sY//7UM6XVJ2a24dILSRSkOxmPXxSMqHzuDFArLY/KrPgBRq
 kXDfsz9fE3TKL+KnmLKvSL8IyZZbk6MdWSisI1cWiU9EJ975ggVP5Ka/D6cf4QzEFhyd
 jzPX4z93NlZ7ktGWkPOY6KxOnScNV9YNXm4F1Mb4Dj9MvdaXgHYSlMBybp+BT7q396io
 0aEKEt8bV+ZQKWDPuY9aPMyHCWD50PcTK3gGnijJyiEplmegLRU8edwnjv4Kpwq9774f
 xV374e40mYioAvC0iOlkl5EuwUy2aadxem7a3HliBZ4qdrd0WN+X+ql9d90GGDJvitRd
 Hjjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCoLPL0394EyEbAAqA4/lqZq2wRN2EeHKApovTkjBY0=;
 b=vnJOFSnPDWq5Wt9+pEuUNcHIasdXNMGjUqnqOML/P1bOjLIqIM94RJBpKMU6M/RXHO
 vAIYhwkhSnKLrg2IiNvNKsz75UjrAUB+KrJsUezCkLil+CJqf9Z5jlNj0XQeSUTT8PKM
 C7puYXWs8yOxMrXqv6De5fwlJeJt/nHrUyRUZoWrSfNGMKNznmB2e5065fZz8VKyg1XV
 pUl2n5Jmd06dJ0EK1n5TydA7/8BIn2ku4mi5sEbbCQ0/rm5KLB2UwG8scnDgWICDd5OW
 FcON29aZlPQcQnvAmjfnHYjHEsBPt1jYkrjqgSy/fusRFuWblXgDWBPCR9MLHgXaHN30
 knsQ==
X-Gm-Message-State: AOAM533tvpQbqbR1EAQf3xqlnuBHEGT1aEAuYrdwjVN0bPXC6J9hIExc
 fJzvOq4ofT/t3SqdHNHj/c+jOwRRzXo=
X-Google-Smtp-Source: ABdhPJzuDyIPS+/J/OUFSJmxWbi4PGfjjmSFHcAWJ/TWEiMSwC3eNvCffIw3iFeOWMuwvHukVsntYg==
X-Received: by 2002:a17:90a:ba09:: with SMTP id
 s9mr3679431pjr.42.1634788473951; 
 Wed, 20 Oct 2021 20:54:33 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:33 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 05/16] powerpc/pseries: move
 pseries_lpar_register_process_table() out from hash specific code
Date: Thu, 21 Oct 2021 13:54:06 +1000
Message-Id: <20211021035417.2157804-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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

This reduces ifdefs in a later change making hash support configurable.

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

