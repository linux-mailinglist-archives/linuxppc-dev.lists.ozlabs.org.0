Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD952CFA16
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 08:02:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp0rK2KJszDqfP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 18:02:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ur9V+ZCZ; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp0kx0JJKzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 17:57:44 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id r4so254761pls.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Dec 2020 22:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ls4Z+QtszsWeZpzsu5kDe+zUxHoBLiN8enIaEYCRRt8=;
 b=Ur9V+ZCZCWlA46d144Si/DYRLdEDbLIMoYCL/vTXTzSKwYvMQwD5hNBQV2h8mP2lmf
 EhTz4wAf6T3L8ytIUvJ9KIC9oe/KlDpEY+a5M2eoUEPVj8MpevxOBMatonf21SCFk7be
 SRuin3uYCV31QMdX9gKSn6HOz19yhgLn6saLWSXGmlFZMFZeJxafRx7LvGCBdwAzHCg0
 RsYSG9xUQSDSL/zLbWqwh5BOLdw98TrziZrxRVudGEDZjC8+6rkMJtQwnaXgO4nIc3Pt
 t34vGmvMjuVIFAfSAwavfNc5TitE8OnIGWpQ0YDlGclWxTifMrLiFa4XVAwQ3K6LNMae
 TFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ls4Z+QtszsWeZpzsu5kDe+zUxHoBLiN8enIaEYCRRt8=;
 b=qh/For25oAtTJ3i5OaoBodfVwlNqbPp2PLdSf0DjtVeHbega3j2+6Oew5QpL3c+tx7
 9SzTy8ZB+Vesy7XlBrT8DlF8Or2l6GY+O5aI4V5RnL1nbc3eVYHZ43g2l/LT4Tie9jVl
 RxnJauMYkFt1dVJjUbhdhxcHRyTXRY7yZ+hXMSW+xBW1DPTmNtXSoAl4yum0jGSr/cQX
 6nBX8EgOY1hXQGiqeAdCS+JjVY+AQooe3l6v/Q00FvykDleBzYVQ++UEim+CgTpqBHhu
 u5k8VS07Hc1qS2oAgVchpWl1eZpOYnL34d7lWQaJqVX99B1cr+O+L37uEAO/JC6FBY16
 9mvA==
X-Gm-Message-State: AOAM532yzEctc+uIPlwVSbZYmD6q7qgPTYvqQ7y5YtprrvxTvm38c1/o
 SJ2eESKIqQzZI9d9PFcVl2hZ9+Ct1RosZA==
X-Google-Smtp-Source: ABdhPJwUXGQ4YbyQ3wH3t7Grk2DNNqF0d4rKm63dWBD8myRXhzgMhNWR816AFkkGjQMhdUomL9+jkw==
X-Received: by 2002:a17:90a:fd08:: with SMTP id
 cv8mr7378243pjb.29.1607151461853; 
 Fri, 04 Dec 2020 22:57:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([1.129.145.238])
 by smtp.gmail.com with ESMTPSA id a14sm1110848pfl.141.2020.12.04.22.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 22:57:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v9 01/12] mm/vmalloc: fix vmalloc_to_page for huge vmap
 mappings
Date: Sat,  5 Dec 2020 16:57:14 +1000
Message-Id: <20201205065725.1286370-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201205065725.1286370-1-npiggin@gmail.com>
References: <20201205065725.1286370-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

vmalloc_to_page returns NULL for addresses mapped by larger pages[*].
Whether or not a vmap is huge depends on the architecture details,
alignments, boot options, etc., which the caller can not be expected
to know. Therefore HUGE_VMAP is a regression for vmalloc_to_page.

This change teaches vmalloc_to_page about larger pages, and returns
the struct page that corresponds to the offset within the large page.
This makes the API agnostic to mapping implementation details.

[*] As explained by commit 029c54b095995 ("mm/vmalloc.c: huge-vmap:
    fail gracefully on unexpected huge vmap mappings")

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/vmalloc.c | 41 ++++++++++++++++++++++++++---------------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 6ae491a8b210..f85124e88bdb 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -34,7 +34,7 @@
 #include <linux/bitops.h>
 #include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
-
+#include <linux/pgtable.h>
 #include <linux/uaccess.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
@@ -343,7 +343,9 @@ int is_vmalloc_or_module_addr(const void *x)
 }
 
 /*
- * Walk a vmap address to the struct page it maps.
+ * Walk a vmap address to the struct page it maps. Huge vmap mappings will
+ * return the tail page that corresponds to the base page address, which
+ * matches small vmap mappings.
  */
 struct page *vmalloc_to_page(const void *vmalloc_addr)
 {
@@ -363,25 +365,33 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
 
 	if (pgd_none(*pgd))
 		return NULL;
+	if (WARN_ON_ONCE(pgd_leaf(*pgd)))
+		return NULL; /* XXX: no allowance for huge pgd */
+	if (WARN_ON_ONCE(pgd_bad(*pgd)))
+		return NULL;
+
 	p4d = p4d_offset(pgd, addr);
 	if (p4d_none(*p4d))
 		return NULL;
-	pud = pud_offset(p4d, addr);
+	if (p4d_leaf(*p4d))
+		return p4d_page(*p4d) + ((addr & ~P4D_MASK) >> PAGE_SHIFT);
+	if (WARN_ON_ONCE(p4d_bad(*p4d)))
+		return NULL;
 
-	/*
-	 * Don't dereference bad PUD or PMD (below) entries. This will also
-	 * identify huge mappings, which we may encounter on architectures
-	 * that define CONFIG_HAVE_ARCH_HUGE_VMAP=y. Such regions will be
-	 * identified as vmalloc addresses by is_vmalloc_addr(), but are
-	 * not [unambiguously] associated with a struct page, so there is
-	 * no correct value to return for them.
-	 */
-	WARN_ON_ONCE(pud_bad(*pud));
-	if (pud_none(*pud) || pud_bad(*pud))
+	pud = pud_offset(p4d, addr);
+	if (pud_none(*pud))
+		return NULL;
+	if (pud_leaf(*pud))
+		return pud_page(*pud) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
+	if (WARN_ON_ONCE(pud_bad(*pud)))
 		return NULL;
+
 	pmd = pmd_offset(pud, addr);
-	WARN_ON_ONCE(pmd_bad(*pmd));
-	if (pmd_none(*pmd) || pmd_bad(*pmd))
+	if (pmd_none(*pmd))
+		return NULL;
+	if (pmd_leaf(*pmd))
+		return pmd_page(*pmd) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
+	if (WARN_ON_ONCE(pmd_bad(*pmd)))
 		return NULL;
 
 	ptep = pte_offset_map(pmd, addr);
@@ -389,6 +399,7 @@ struct page *vmalloc_to_page(const void *vmalloc_addr)
 	if (pte_present(pte))
 		page = pte_page(pte);
 	pte_unmap(ptep);
+
 	return page;
 }
 EXPORT_SYMBOL(vmalloc_to_page);
-- 
2.23.0

