Return-Path: <linuxppc-dev+bounces-1444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD597C2FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ktn3qLjz2yMk;
	Thu, 19 Sep 2024 12:57:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714641;
	cv=none; b=Ax7AYKSIzKMroCjSDzG/OZIex8PDwBp59XCiGCvcdwwdZJngVTxJkHtJaEr2zGZ7JC6n8efYa/SO1esDYN7Z/peCCXMKIEPY7P2CyU81xZVgwwJNUykGN9l+pl6YfQPMtzffso6rdZ3WMahi9+dmIEsmcPU/iKOc0vCPkrr6XIbX8+ulKDfXC1VYic31u/TsvoP4Vbo2PK/QVZW+H3Zf+SH+K6gbSyV9SXSqRhgBB9egKMlCCJIu5rtUP7cf2OoeMFeQkE8un+AIjTby3jJBk3WX6nH1LxGLlWu91QU1ndG5Jxjbl5HgIk9787D540UBVeKB56d9pCj4dPI1Owe8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714641; c=relaxed/relaxed;
	bh=AV6BxL5gMqFPtklTutfX47z8PwIuU3wFqvoyRitrLCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eP56ATu25BCbdrHxncT3Rd5jIzfFUoWb4iRu/26gLhNlVUt0vkOBpyb9xfzKT3PJwC+12rYuRl8GdgzFKBLfA7O5TNSDZyB7WVp1GhfjIGIoFyOsUlLX3+zHEgPBwiCdJ3AvrAVjApgVJ7LFypjD1NgUXE72v3WND5G2DKR2HbM34AluhjOxtK+Y0/Fr2D0TbkpObCj2nYsurVOGfFnuJZcOLtROUt3WZttL5ZieFRU6u5d/NWwQ3yTLG6Cdgkyxw77TD2aFi1wxW/37RVO/IVXej9MgLivB+jDK6iMqjVlDcUcYRKGrpj2C3zC+cTkM1A6N05hEpIPg+47fdGe20g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hyV+ngHZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hyV+ngHZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ktn24QSz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:21 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2068bee21d8so4132795ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714638; x=1727319438; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AV6BxL5gMqFPtklTutfX47z8PwIuU3wFqvoyRitrLCw=;
        b=hyV+ngHZNdY8JjAWS5an6vX/RgAAs4IB+5gTcJB59M8P59YSXDmTk1IAzBprx3h6L3
         Ms09nfFH4QZy91SYHMVz35e9uuvg7oHilqnnzrEqWZenwmluleez6r2BXNcIr5kUfWdq
         GBZTpRhLXBiwo5gO1WXqbipIidyfPZdhkN9h5cOnPy/nqHvsr7rVT9kYjHFjEVkeWH0c
         arMCTNzR0+8/UeSUAuYGjS/he4HsHsq4MmyoyEB0lgDR26sNZcM9n0xmcXeg38s85YB/
         mte9Qi2dC9vqng1jo3SHbQEl+CXgP3oKee/RhHLMLxzWZdfAeav0p/tcOVlvF1Uonv1U
         QUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714638; x=1727319438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AV6BxL5gMqFPtklTutfX47z8PwIuU3wFqvoyRitrLCw=;
        b=QQ915oWT75oVUf1eXu2T44kkT6IygtU5OSYRfmRRiHm0AbBXoEfBUPGnh++1hMqJpr
         dE+aS1IUpdkEiOYlBPVczZufTHbtSOK737jwolE147lV23IWJacodVqw/gL9RpciBNFB
         UFPcBDo5xOTHi8GIahmhj3lzesVe+M0KUWJvEkUaJKGt0RgwoDaam8ktU22cDv5UD3uu
         WOUyMD/+G/4KkEpc3k+yYxGK1ID7yaEziECNtFDq/tLnttQB7rxUtfbcWKS0jSs3DBJG
         FQzplt/ZFE3clK29wXEABgC+RxdDet5i0mWltPqx4WN4RcDXrZ7xrGLmoQppkmcygGf3
         WMhA==
X-Gm-Message-State: AOJu0YwLkfimRVho2yfxZErxjPKnwPqhU2/EsyVUJwt/GXIp5rKiuppw
	rQ56zpZDemPI8J0iqkoQ3iM4K2JULylZGjCRNYzIteSbaCgiax6XCyQGZw==
X-Google-Smtp-Source: AGHT+IEcNBq8l5FK/5juI+RUhRkCIsvdP0Nu+zueXcpdJJCPT6m3f88Yiku2lxjEo/N6lofe8UkElQ==
X-Received: by 2002:a17:902:e545:b0:205:7db3:fdd1 with SMTP id d9443c01a7336-2076e3b7821mr382291845ad.36.1726714637877;
        Wed, 18 Sep 2024 19:57:17 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:57:17 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 11/13] book3s64/radix: Refactoring common kfence related functions
Date: Thu, 19 Sep 2024 08:26:09 +0530
Message-ID: <0711340e9050001020c284154064b3a4cf781045.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both radix and hash on book3s requires to detect if kfence
early init is enabled or not. Hash needs to disable kfence
if early init is not enabled because with kfence the linear map is
mapped using PAGE_SIZE rather than 16M mapping.
We don't support multiple page sizes for slb entry used for kernel
linear map in book3s64.

This patch refactors out the common functions required to detect kfence
early init is enabled or not.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/kfence.h        |  8 ++++++--
 arch/powerpc/mm/book3s64/pgtable.c       | 13 +++++++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 12 ------------
 arch/powerpc/mm/init-common.c            |  1 +
 4 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index fab124ada1c7..1f7cab58ab2c 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -15,7 +15,7 @@
 #define ARCH_FUNC_PREFIX "."
 #endif
 
-#ifdef CONFIG_KFENCE
+extern bool kfence_early_init;
 extern bool kfence_disabled;
 
 static inline void disable_kfence(void)
@@ -27,7 +27,11 @@ static inline bool arch_kfence_init_pool(void)
 {
 	return !kfence_disabled;
 }
-#endif
+
+static inline bool kfence_early_init_enabled(void)
+{
+	return IS_ENABLED(CONFIG_KFENCE) && kfence_early_init;
+}
 
 #ifdef CONFIG_PPC64
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index f4d8d3c40e5c..1563a8c28feb 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -37,6 +37,19 @@ EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
 EXPORT_SYMBOL(__pmd_frag_size_shift);
 
+#ifdef CONFIG_KFENCE
+extern bool kfence_early_init;
+static int __init parse_kfence_early_init(char *arg)
+{
+	int val;
+
+	if (get_option(&arg, &val))
+		kfence_early_init = !!val;
+	return 0;
+}
+early_param("kfence.sample_interval", parse_kfence_early_init);
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * This is called when relaxing access to a hugepage. It's also called in the page
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index b0d927009af8..311e2112d782 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -363,18 +363,6 @@ static int __meminit create_physical_mapping(unsigned long start,
 }
 
 #ifdef CONFIG_KFENCE
-static bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
-
-static int __init parse_kfence_early_init(char *arg)
-{
-	int val;
-
-	if (get_option(&arg, &val))
-		kfence_early_init = !!val;
-	return 0;
-}
-early_param("kfence.sample_interval", parse_kfence_early_init);
-
 static inline phys_addr_t alloc_kfence_pool(void)
 {
 	phys_addr_t kfence_pool;
diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index 9b4a675eb8f8..85875820b113 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -33,6 +33,7 @@ bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 #ifdef CONFIG_KFENCE
 bool __ro_after_init kfence_disabled;
+bool __ro_after_init kfence_early_init = !!CONFIG_KFENCE_SAMPLE_INTERVAL;
 #endif
 
 static int __init parse_nosmep(char *p)
-- 
2.46.0


