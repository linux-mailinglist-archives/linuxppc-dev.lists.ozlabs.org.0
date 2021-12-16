Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFFA476EF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 11:34:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF7lb2L7Nz3cHC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 21:34:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VZHLewhp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VZHLewhp; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF7kt0dzmz2yZx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 21:33:55 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id o14so19097363plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 02:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qO+jOkjRK48o6+1+jVibP8f+57PdsRVye8ZUPnrv1Ws=;
 b=VZHLewhprzIJcwvT0198kiPypScCjxvVndXQ3rCZkSozD03o8LhWeZ172OFOI/zjvc
 h56lRk/+08FkUDJEGbfd0vERYkvZgX3dz7pzLfMbk/1cXsDKkMl9dof0sPZSputTlZ80
 HgYFHDiaEucAZCSFKlklkEDg+9m/AsWevOBElG3BFAFuvTO85allExFmqf1mQyl1/7wM
 6a+3F+4q25ThvydXdd4Y+9GdttOf8ivr+v3oLxJbLbre5nwjwbMlE7LK6DlGfMLEtKjm
 ngOiYUVI3dz5FXIzemwkmStekryutg2EEiqfNyBDqY2zU5hBgYymhjDRzKCLfNWCv/3F
 JauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qO+jOkjRK48o6+1+jVibP8f+57PdsRVye8ZUPnrv1Ws=;
 b=GvcN3r9wAAphfSFKk4CaaOenwea5Q7hamjDKD3QICwZXtJbVIwS2ggs/WM0Sa499gp
 RcRj22LgGnDz0Gb2SIj50Asis6mcqKt5z/vY34f2UpqPqEZE+XIQVTae8e9423GxHhfN
 9FSF5+JNcPM6qgAvioWmmJzDviOpMxARxdi//urbwFDnmf4utwtWeRjcmrmZcwYcsuFf
 80s0S8j3TrPI1P/ReSdtsBK+KhM/3traKQDlp6cOyRI5q7d9oWV1iM5bGDHiHhwzlKyJ
 y8wmg+Du6RZk85aPNIMKEARsLOrneSYDNqzKGsr6WVLnH8S/Rou4e5jSxf33o4sxr89o
 ehgw==
X-Gm-Message-State: AOAM532dlL9/Cxn8jRxuvjCMoPtFWbZfqaty3cshcbpin4Yah07JkAC/
 4zDUq4aNHxKDPUkf1FRWjNnBrE5UpzU=
X-Google-Smtp-Source: ABdhPJwFRqCGA4SQNeVsSpc5zmOiW2aEHul+HDakMTrbeunderUSRkTyo1Hb/3skuwqJLRUhNFgx8w==
X-Received: by 2002:a17:90a:b013:: with SMTP id
 x19mr5223833pjq.126.1639650830324; 
 Thu, 16 Dec 2021 02:33:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id h10sm4979507pgj.64.2021.12.16.02.33.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 02:33:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s/radix: Fix huge vmap false positive
Date: Thu, 16 Dec 2021 20:33:42 +1000
Message-Id: <20211216103342.609192-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pmd_huge() is defined to false when HUGETLB_PAGE is not configured, but
the vmap code still installs huge PMDs. This leads to false bad PMD
errors when vunmapping because it is not seen as a huge PTE, and the bad
PMD check catches it. The end result may not be much more serious than
some bad pmd warning messages, because the pmd_none_or_clear_bad() does
what we wanted and clears the huge PTE anyway.

Fix this by checking pmd_is_leaf(), which checks for a PTE regardless of
config options. The whole huge/large/leaf stuff is a tangled mess but
that's kernel-wide and not something we can improve much in arch/powerpc
code.

pmd_page(), pud_page(), etc., called by vmalloc_to_page() on huge vmaps
can similarly trigger a false VM_BUG_ON when CONFIG_HUGETLB_PAGE=n, so
those checks are adjusted. The checks were added by commit d6eacedd1f0e
("powerpc/book3s: Use config independent helpers for page table walk"),
while implementing a similar fix for other page table walking functions.

Fixes: d909f9109c30 ("powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Also fix some false positive warnings spotted by Daniel.
- Rename the patch slightly to account for the new changes.

 arch/powerpc/mm/book3s64/radix_pgtable.c |  4 ++--
 arch/powerpc/mm/pgtable_64.c             | 14 +++++++++++---
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 3c4f0ebe5df8..ca23f5d1883a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1076,7 +1076,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 
 int pud_clear_huge(pud_t *pud)
 {
-	if (pud_huge(*pud)) {
+	if (pud_is_leaf(*pud)) {
 		pud_clear(pud);
 		return 1;
 	}
@@ -1123,7 +1123,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 
 int pmd_clear_huge(pmd_t *pmd)
 {
-	if (pmd_huge(*pmd)) {
+	if (pmd_is_leaf(*pmd)) {
 		pmd_clear(pmd);
 		return 1;
 	}
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 78c8cf01db5f..175aabf101e8 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -102,7 +102,8 @@ EXPORT_SYMBOL(__pte_frag_size_shift);
 struct page *p4d_page(p4d_t p4d)
 {
 	if (p4d_is_leaf(p4d)) {
-		VM_WARN_ON(!p4d_huge(p4d));
+		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+			VM_WARN_ON(!p4d_huge(p4d));
 		return pte_page(p4d_pte(p4d));
 	}
 	return virt_to_page(p4d_pgtable(p4d));
@@ -112,7 +113,8 @@ struct page *p4d_page(p4d_t p4d)
 struct page *pud_page(pud_t pud)
 {
 	if (pud_is_leaf(pud)) {
-		VM_WARN_ON(!pud_huge(pud));
+		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+			VM_WARN_ON(!pud_huge(pud));
 		return pte_page(pud_pte(pud));
 	}
 	return virt_to_page(pud_pgtable(pud));
@@ -125,7 +127,13 @@ struct page *pud_page(pud_t pud)
 struct page *pmd_page(pmd_t pmd)
 {
 	if (pmd_is_leaf(pmd)) {
-		VM_WARN_ON(!(pmd_large(pmd) || pmd_huge(pmd)));
+		/*
+		 * vmalloc_to_page may be called on any vmap address (not only
+		 * vmalloc), and it uses pmd_page() etc., when huge vmap is
+		 * enabled so these checks can't be used.
+		 */
+		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+			VM_WARN_ON(!(pmd_large(pmd) || pmd_huge(pmd)));
 		return pte_page(pmd_pte(pmd));
 	}
 	return virt_to_page(pmd_page_vaddr(pmd));
-- 
2.23.0

