Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B434436D82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:34:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2Mk39Gjz2y7H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:34:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gUQvizF4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gUQvizF4; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2Hd75Ywz3c5m
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:37 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so1628133pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WCoLPL0394EyEbAAqA4/lqZq2wRN2EeHKApovTkjBY0=;
 b=gUQvizF4df9QlhzfjxF4KABR5RXlKaLro+zdqPQYC2FQocU0kgmY7JwPA4Lk8uLJHp
 5F8+U8ot+SRtpYG8f8fyoc9pW1kW1TzUpUAOaOhb3wOktyxspUBr/Iq/+2avNdLSIxbD
 V9qSzozboSYuV3OrFCKIOh6SVVxyjFK2GT9caDUzvkIkoe2YbOdArMn95v4qo6yVas1z
 5ADz+ZNGeCxgJDszZQ4+f595zf1ALZJzjy6qq+035/wvwK5GFbViVF82mdFyHo8tJdyp
 QVleOV93Xu0usMztLxjzruXxu4V52X+TwX0G2UNVyIRpVUt6BHEHJNCoFMnUsn1IiQiU
 G1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WCoLPL0394EyEbAAqA4/lqZq2wRN2EeHKApovTkjBY0=;
 b=rB9WPBx5MP8OahesHoZ2YbWhGvlIsZsv1xc7MuqrZt+rRDEzS9JRxF7GuCrPXEiAlB
 sp12ZQ07Sey61FhUNzD+nNgkEjTWomEApRzpEI4SxzTe0d4ZTTcjzrY62rKpQTY8pzqb
 5BV2WscfckmBhfgv5F97O9KisLQJpoviC79IvnaWvt3RgHw7WwnUlG0RuSpXKwLKOzfz
 Jqyh7+HNHfGHtAEFyewRnIObqTupR45SR6zGxmLptvIartt6Yc/aC6CR5vcmSI3X3eay
 32rfO/hKeCAcT1PD0boJUms0SftLGtAJ8IyUsHd24cd2ldxuaxMvPwJqCC87NE2pfmzh
 r8IQ==
X-Gm-Message-State: AOAM531XIieGTMRoL7UN/AAZiamVhkW+8hICFLxLZxseZb7SqGBWSpsZ
 PC2A7cE+YHj21WkgFpLknEhShyYo1gs=
X-Google-Smtp-Source: ABdhPJzl63nVoXBwcloVw/+7dRLXDhvmeQBciSGxq5sehyRaQEpKe8eVWB3rByzWmVJQHuf6f1g6+Q==
X-Received: by 2002:a17:903:32cf:b0:13f:d59:7a4c with SMTP id
 i15-20020a17090332cf00b0013f0d597a4cmr7776527plr.78.1634855435853; 
 Thu, 21 Oct 2021 15:30:35 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/18] powerpc/pseries: move
 pseries_lpar_register_process_table() out from hash specific code
Date: Fri, 22 Oct 2021 08:30:00 +1000
Message-Id: <20211021223013.2641952-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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

