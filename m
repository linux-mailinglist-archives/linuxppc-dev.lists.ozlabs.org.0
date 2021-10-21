Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A87436D9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:40:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2VR3vmxz3fBq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:39:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eKMzQNbg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f;
 helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eKMzQNbg; dkim-atps=neutral
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2J51WjJz3cP0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:31:01 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id u6so1425438ple.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qT7U8+oLTzpfX193aCgQYAbB/a41t4xHtseGQ6oy/68=;
 b=eKMzQNbgvjNF/3HyX7N+GcGNyIR41j+9R030PytRvUZx09PRBgrHBDsN9973GrmxGA
 OX8ECW0SkE1qnr7Q5q6RVDzevecoPVCi1nfy+Cy3zZT+ANDDOF2PUY1txRawpdYqcMFI
 +CaRzk19nAh6nrYIuvYPzaqLB73fnnRmuBv9FMEZ/Sz49YdSl1A7fVhsxFyDQWo7ajp4
 OouOgQ2qckKVI3AH51IvGkrRWNHFEyfMFdtvz0npuhCskQ62qphcNOu9t8ybKIuFFeLU
 pWfYXch+0ltAkG4TkfKWplB1Z5yngw5hOyjkAle0Dp5ddYVTgGLFHRwcGYuEZ6ZF1ifg
 7L+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qT7U8+oLTzpfX193aCgQYAbB/a41t4xHtseGQ6oy/68=;
 b=t6/PUzPai14CSAzaxPRWF9fXnGIttMcyIA5h6+rHujV4Czz8w1Bt+h4UqM9TCl5iIR
 Y6AB7kf42DjPezOE2awbGH5o9fznuowY1O47HUCzMko0nGUOu9Ki7pFpYLKTpzbXys3U
 s7mA/mQPtt5huuVl0FJ+fKwCam56neAjunGCOdJHGtW0CAPLczRtKJ8t2NbzoTyc9gNL
 r2RXyB7l2imrOLtWgvh24uKOF5lfiwyPhy3+cq/uUVoM90aGBMJsg/FltMgwCJ84X9Zk
 YCKuM/465/fBRtqlwkY1hr3EbgGppPLpxNKVWCAF9zYE4lUtHak7THE0cycb5lDyG7Y6
 tnnw==
X-Gm-Message-State: AOAM532yXAyxkby1EfaSSdApNR+G9wv8mINBhmchjzuTVgeTQA+Ldb7H
 ZmQrh5gX4/THkKAFYpAwDJqR+XweYJ4=
X-Google-Smtp-Source: ABdhPJwg+7gmWIbEQ6TThOMOf7OhDoIEYsK2cbGTHXCVET1zes40B0CutsKrSwgt3hwThR3nUagksA==
X-Received: by 2002:a17:90b:3844:: with SMTP id
 nl4mr9952971pjb.168.1634855459077; 
 Thu, 21 Oct 2021 15:30:59 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:58 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 14/18] powerpc/64s: Clear MMU_FTR_HPTE_TABLE when booting
 in radix
Date: Fri, 22 Oct 2021 08:30:09 +1000
Message-Id: <20211021223013.2641952-15-npiggin@gmail.com>
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

---
 arch/powerpc/mm/init_64.c | 1 +
 arch/powerpc/mm/pgtable.c | 9 ++++++---
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 386be136026e..23fbb2b0277c 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -453,6 +453,7 @@ void __init mmu_early_init_devtree(void)
 		early_check_vec5();
 
 	if (early_radix_enabled()) {
+		cur_cpu_spec->mmu_features &= ~MMU_FTR_HPTE_TABLE;
 		radix__early_init_devtree();
 		/*
 		 * We have finalized the translation we are going to use by now.
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index cd16b407f47e..9e67472b50be 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -81,9 +81,6 @@ static struct page *maybe_pte_to_page(pte_t pte)
 
 static pte_t set_pte_filter_hash(pte_t pte)
 {
-	if (radix_enabled())
-		return pte;
-
 	pte = __pte(pte_val(pte) & ~_PAGE_HPTEFLAGS);
 	if (pte_looks_normal(pte) && !(cpu_has_feature(CPU_FTR_COHERENT_ICACHE) ||
 				       cpu_has_feature(CPU_FTR_NOEXECUTE))) {
@@ -112,6 +109,9 @@ static inline pte_t set_pte_filter(pte_t pte)
 {
 	struct page *pg;
 
+	if (radix_enabled())
+		return pte;
+
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return set_pte_filter_hash(pte);
 
@@ -144,6 +144,9 @@ static pte_t set_access_flags_filter(pte_t pte, struct vm_area_struct *vma,
 {
 	struct page *pg;
 
+	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64))
+		return pte;
+
 	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
 		return pte;
 
-- 
2.23.0

