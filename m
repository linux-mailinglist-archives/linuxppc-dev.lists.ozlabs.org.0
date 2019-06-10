Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 212623AE4E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 06:46:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45MgZD0WcQzDqN6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jun 2019 14:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QcKUZrLg"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45MgSP4BkgzDqD9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 14:41:09 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k187so3834298pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Jun 2019 21:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j0iK9oPhBRVSERhwHAEayZPRDfAp+ATJEAPI7I5uyj4=;
 b=QcKUZrLgQKctcgR3ilhCBa5vjFh1fCNel4R0mH2jk1Tp1iY8hD5fmbOXmGKoUrtwrX
 aooSLGAYY4vJTaJiilgcSwtsbtlReimSqPJehqwexfgMa1TSDy87tibLD1OVDBuraUgF
 1eug6DwfebsLN8WATm5Uo/buzMbsbe7cmFeeGAou4YR8gUntPh269QbxM4FU0ceR+tkZ
 yYV/k5ae9a57jsDNkdnoZv/7BNEnWzMf2bpp4UgMJtp4lhaMos2gOosWi+v2Q2ucsNo8
 u4SyyZAk+CXBmcTfhN9KeuKxn8I04ooCPtfQSfJVzUy10NVs7IEypZ1DcHHiWqHw2nfp
 FjMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0iK9oPhBRVSERhwHAEayZPRDfAp+ATJEAPI7I5uyj4=;
 b=HbOyActyUb7R4rxYdUaB+W7rwrJdZxZxVEpPlfOPV3pimC8YFrCMkvfu8GvTlPtFjT
 O14pMoRunZQzMxjI/uS1EI6G/+nJDO3bDuoGZW5yKEWcm46Ff8FW5WX3G4teyh2U0n+D
 372f2rHugm1i3WKOeepYZNmqT3lfHHEh+US7BAFpng7dz6XmZ+TweG9I1XDPPlmgzpXD
 4szQb9UxW5ThgPaNreKs0SVIHzpZ65LydOd/zxmnsJZZwU6yVhGO/IF0wPhXz2aWgwgq
 FUHuKxd9tqHmmy05oP8f7qOXf1vCLavbaBMViTi9y5GSZiM3FATNs4ny3yYYCE0+gtl2
 315w==
X-Gm-Message-State: APjAAAU5Osw+PzAZKN+VbaRN+d454sMjqm2fn/SrzYD4Foogyy8l1EtM
 S0/2qbVZFqn+jzWVy33761M=
X-Google-Smtp-Source: APXvYqw+VLnzFiNoQ//mElPmrK/yDIA214P00B8jjBcBGJdQSiCpHxlwG6iJk4iNAZq+HcvbqmTphQ==
X-Received: by 2002:a17:90a:9f8e:: with SMTP id
 o14mr18793157pjp.82.1560141667565; 
 Sun, 09 Jun 2019 21:41:07 -0700 (PDT)
Received: from bobo.local0.net (60-241-56-246.tpgi.com.au. [60.241.56.246])
 by smtp.gmail.com with ESMTPSA id l1sm9166802pgj.67.2019.06.09.21.41.04
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 21:41:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH 3/4] powerpc/64s/radix: support huge vmap vmalloc
Date: Mon, 10 Jun 2019 14:38:37 +1000
Message-Id: <20190610043838.27916-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190610043838.27916-1-npiggin@gmail.com>
References: <20190610043838.27916-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Applying huge vmap to vmalloc requires vmalloc_to_page to walk huge
pages. Define pud_large and pmd_large to support this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 24 ++++++++++++--------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5faceeefd9f9..8e02077b11fb 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -923,6 +923,11 @@ static inline int pud_present(pud_t pud)
 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PRESENT));
 }
 
+static inline int pud_large(pud_t pud)
+{
+	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
+}
+
 extern struct page *pud_page(pud_t pud);
 extern struct page *pmd_page(pmd_t pmd);
 static inline pte_t pud_pte(pud_t pud)
@@ -966,6 +971,11 @@ static inline int pgd_present(pgd_t pgd)
 	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PRESENT));
 }
 
+static inline int pgd_large(pgd_t pgd)
+{
+	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
+}
+
 static inline pte_t pgd_pte(pgd_t pgd)
 {
 	return __pte_raw(pgd_raw(pgd));
@@ -1091,6 +1101,11 @@ static inline pte_t *pmdp_ptep(pmd_t *pmd)
 #define pmd_mk_savedwrite(pmd)	pte_pmd(pte_mk_savedwrite(pmd_pte(pmd)))
 #define pmd_clear_savedwrite(pmd)	pte_pmd(pte_clear_savedwrite(pmd_pte(pmd)))
 
+static inline int pmd_large(pmd_t pmd)
+{
+	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
+}
+
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 #define pmd_soft_dirty(pmd)    pte_soft_dirty(pmd_pte(pmd))
 #define pmd_mksoft_dirty(pmd)  pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)))
@@ -1159,15 +1174,6 @@ pmd_hugepage_update(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp,
 	return hash__pmd_hugepage_update(mm, addr, pmdp, clr, set);
 }
 
-/*
- * returns true for pmd migration entries, THP, devmap, hugetlb
- * But compile time dependent on THP config
- */
-static inline int pmd_large(pmd_t pmd)
-{
-	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-}
-
 static inline pmd_t pmd_mknotpresent(pmd_t pmd)
 {
 	return __pmd(pmd_val(pmd) & ~_PAGE_PRESENT);
-- 
2.20.1

