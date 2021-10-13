Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8595142CCDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 23:35:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV5Rj73nSz3bXC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 08:35:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FAjODSog;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FAjODSog; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV5Qz11zLz2xtM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 08:34:50 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id g14so3668018pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 14:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8vn50ZaNwnUJ0AZTX6o9w8gy9mHkBPDVSDoWz+Q/Xqg=;
 b=FAjODSogE8VMVFhJnenSBKTChRMTdCrj0kuT1+UBLBbhg4kzQHMIqRv9d8kMB9rmdI
 NHZHgqOkcs2hZEKzuWH/BK/KMiiwvG507KL2dkYQi1djfkGsHEIW+9hKFp3ky6kpsY85
 FW1EQ1tNX/+5Sa6krMlwgKXG9Gv1CvMOQa1ogc3oM8yxdvmfufbjAjCJdAaA0gGWszLq
 Vu0Ue+hjuuPAL/hweGdn3SLXx72k/iwURoRG9p9RWyCs06xSHabHgO2pM1ydcVDI+1RZ
 LidJQtwTTf6d3jLnzlgzjdD21oZ/jWcQaRl/DjYnRYnl66KM3hZ9jQ+ZVq/CCc8krubU
 nPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=8vn50ZaNwnUJ0AZTX6o9w8gy9mHkBPDVSDoWz+Q/Xqg=;
 b=eEXmfsafb4SAY7BT4Ru0dfa/OZKr4n2OFrCBKFOU7TGvf6mmuh4lSxuRFy5SGB3Z2j
 47lxjUfVx2TtBQb2rRtiROkSb/2VEo3m8HdBjv8p6Q9/huPogHRN7xwfPViChSKwKnr7
 a0KPyMBUccZYLFXdnrhnsHNnAJVtkIxzcxQn2DE1cpbhXc8T7QkLfj97Rw8qFZV5Q+PN
 X83grKowkL6VMVS2jPuBM5qoFLYa2udrs4EmEtBAFVYg6ybsslvamdZb/0FpwyR/uz7G
 jWdrOYxXkhPboSIBH8GHaX/eMCktRNNj/X/7nQ4JO20cxnqT6U0ZS/vRsjZpxO44Hnr0
 4Jww==
X-Gm-Message-State: AOAM532rN3tIjAV7+hdJt2JWqFT9OH0fptO4Ar4Xr1qurmtpjlxFE/n5
 ToqIk99WnivvEXCFfSepTI9BvExt0k8=
X-Google-Smtp-Source: ABdhPJxueQe1i4sebX2e8QtzFykBiRVS5YTk+nrNBJ5PSyLc4mptcL6JPZ7xtB4eQubXvPE4Fehsdg==
X-Received: by 2002:a63:d94b:: with SMTP id e11mr1238950pgj.295.1634160886754; 
 Wed, 13 Oct 2021 14:34:46 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.19])
 by smtp.gmail.com with ESMTPSA id o6sm399801pfp.79.2021.10.13.14.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 14:34:45 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Jordan Niethe <jniethe5@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc/s64: Clarify that radix lacks DEBUG_PAGEALLOC
Date: Thu, 14 Oct 2021 08:04:38 +1030
Message-Id: <20211013213438.675095-1-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The page_alloc.c code will call into __kernel_map_pages when
DEBUG_PAGEALLOC is configured and enabled.

As the implementation assumes hash, this should crash spectacularly if
not for a bit of luck in __kernel_map_pages. In this function
linear_map_hash_count is always zero, the for loop exits without doing
any damage.

There are no other platforms that determine if they support
debug_pagealloc at runtime. Instead of adding code to mm/page_alloc.c to
do that, this change turns the map/unmap into a noop when in radix
mode and prints a warning once.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2: Put __kernel_map_pages in pgtable.h

 arch/powerpc/include/asm/book3s/64/hash.h    |  2 ++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 11 +++++++++++
 arch/powerpc/include/asm/book3s/64/radix.h   |  3 +++
 arch/powerpc/mm/book3s64/hash_utils.c        |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  7 +++++++
 5 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index d959b0195ad9..674fe0e890dc 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -255,6 +255,8 @@ int hash__create_section_mapping(unsigned long start, unsigned long end,
 				 int nid, pgprot_t prot);
 int hash__remove_section_mapping(unsigned long start, unsigned long end);
 
+void hash__kernel_map_pages(struct page *page, int numpages, int enable);
+
 #endif /* !__ASSEMBLY__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_HASH_H */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 5d34a8646f08..265661ded238 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1101,6 +1101,17 @@ static inline void vmemmap_remove_mapping(unsigned long start,
 }
 #endif
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+static inline void __kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	if (radix_enabled()) {
+		radix__kernel_map_pages(page, numpages, enable);
+		return;
+	}
+	hash__kernel_map_pages(page, numpages, enable);
+}
+#endif
+
 static inline pte_t pmd_pte(pmd_t pmd)
 {
 	return __pte_raw(pmd_raw(pmd));
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 59cab558e2f0..d090d9612348 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -316,5 +316,8 @@ int radix__create_section_mapping(unsigned long start, unsigned long end,
 				  int nid, pgprot_t prot);
 int radix__remove_section_mapping(unsigned long start, unsigned long end);
 #endif /* CONFIG_MEMORY_HOTPLUG */
+
+void radix__kernel_map_pages(struct page *page, int numpages, int enable);
+
 #endif /* __ASSEMBLY__ */
 #endif
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index c145776d3ae5..cfd45245d009 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1988,7 +1988,7 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
-void __kernel_map_pages(struct page *page, int numpages, int enable)
+void hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ae20add7954a..83b33418ad28 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -920,6 +920,13 @@ void __meminit radix__vmemmap_remove_mapping(unsigned long start, unsigned long
 #endif
 #endif
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+void radix__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+        pr_warn_once("DEBUG_PAGEALLOC not supported in radix mode\n");
+}
+#endif
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 
 unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr,
-- 
2.33.0

