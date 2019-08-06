Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBDE83DEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:42:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463B5265dLzDr6L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 09:42:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="lgsrE8jK"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463B0h3kbBzDqty
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 09:38:44 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 19so42347543pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 16:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tEsxmPhUS4bT5wWGzUtfPaeJrqiErpfsRL+tuJYXGZE=;
 b=lgsrE8jKqIA9Hm61rK1C8IWk4DDTmPfRT+tvT2AnPIU4vazP6q/L6OfVufsUQ5dCf7
 ZH183HuRfOVFX+YgRI8L/UFpbA0trBSLCoaLnNLkGNHLwS9Xp7qbs/9uHfDEWJVKb8Xf
 qcT9ke/qXR4iWe9bNeGktBZlbtakNblhMSfMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tEsxmPhUS4bT5wWGzUtfPaeJrqiErpfsRL+tuJYXGZE=;
 b=qkobSDDYOybQ1VOh3KJuMvkAWAU6Xgqbx2/ZWU233Czg8MYFMXDGu/8V5mFYQOjCCQ
 Rze/m3zW7FYn2IsAr58cWCD5/jJFk8P6YC9J6Fv2NNTWx1oKJ3RBb1+mpMrKXeb/v+uH
 D44/2e/PkrO7/wM1cMMc/9VFYWR679QV5gGCyS52WG/EvK+4/cGxJGP6M2S8mW3LHbw3
 OWqeo3OPCoT7YalBEkuiO6F8cU7lmEGxoa8cFIhOjMe9i0dQZEVuU4kDDq8ABo+1InVZ
 BZ/j+Bc2PNIGd+jvB+qlvzsEZx0qeNIVaWFXdD5fufmBI5d/I4fjBg2Mlu7z1APBWDHU
 x8ew==
X-Gm-Message-State: APjAAAWRExidMHFCtwDgrXB/tJax/YorYXZMvUcH1U8MNYo6oMHYmMVP
 0z9PyV5p7nFoZXzE5kbRre06+g==
X-Google-Smtp-Source: APXvYqw94K0rHyX3jjkOmU+8JIw/u6UTyjmRhsakRcg/vq/S/LeodUKEoFoV3bjFxO/oQbk70Syj/A==
X-Received: by 2002:a17:90a:b104:: with SMTP id
 z4mr5662095pjq.102.1565134721898; 
 Tue, 06 Aug 2019 16:38:41 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id j6sm36104084pjd.19.2019.08.06.16.38.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 16:38:41 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [PATCH 1/4] kasan: allow arches to provide their own early shadow
 setup
Date: Wed,  7 Aug 2019 09:38:24 +1000
Message-Id: <20190806233827.16454-2-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806233827.16454-1-dja@axtens.net>
References: <20190806233827.16454-1-dja@axtens.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc supports several different MMUs. In particular, book3s
machines support both a hash-table based MMU and a radix MMU.
These MMUs support different numbers of entries per directory
level: the PTES_PER_* defines evaluate to variables, not constants.
This leads to complier errors as global variables must have constant
sizes.

Allow architectures to manage their own early shadow variables so we
can work around this on powerpc.

Signed-off-by: Daniel Axtens <dja@axtens.net>

---
Changes from RFC:

 - To make checkpatch happy, move ARCH_HAS_KASAN_EARLY_SHADOW from
   a random #define to a config option selected when building for
   ppc64 book3s
---
 include/linux/kasan.h |  2 ++
 lib/Kconfig.kasan     |  3 +++
 mm/kasan/init.c       | 10 ++++++++++
 3 files changed, 15 insertions(+)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index ec81113fcee4..15933da52a3e 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -14,11 +14,13 @@ struct task_struct;
 #include <asm/kasan.h>
 #include <asm/pgtable.h>
 
+#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
 extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
 extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
 extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
+#endif
 
 int kasan_populate_early_shadow(const void *shadow_start,
 				const void *shadow_end);
diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index a320dc2e9317..0621a0129c04 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -9,6 +9,9 @@ config HAVE_ARCH_KASAN_SW_TAGS
 config	HAVE_ARCH_KASAN_VMALLOC
 	bool
 
+config ARCH_HAS_KASAN_EARLY_SHADOW
+	bool
+
 config CC_HAS_KASAN_GENERIC
 	def_bool $(cc-option, -fsanitize=kernel-address)
 
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index ce45c491ebcd..7ef2b87a7988 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -31,10 +31,14 @@
  *   - Latter it reused it as zero shadow to cover large ranges of memory
  *     that allowed to access, but not handled by kasan (vmalloc/vmemmap ...).
  */
+#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
 unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
+#endif
 
 #if CONFIG_PGTABLE_LEVELS > 4
+#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
 p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
+#endif
 static inline bool kasan_p4d_table(pgd_t pgd)
 {
 	return pgd_page(pgd) == virt_to_page(lm_alias(kasan_early_shadow_p4d));
@@ -46,7 +50,9 @@ static inline bool kasan_p4d_table(pgd_t pgd)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 3
+#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
 pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
+#endif
 static inline bool kasan_pud_table(p4d_t p4d)
 {
 	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
@@ -58,7 +64,9 @@ static inline bool kasan_pud_table(p4d_t p4d)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
+#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
 pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
+#endif
 static inline bool kasan_pmd_table(pud_t pud)
 {
 	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
@@ -69,7 +77,9 @@ static inline bool kasan_pmd_table(pud_t pud)
 	return false;
 }
 #endif
+#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
 pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
+#endif
 
 static inline bool kasan_pte_table(pmd_t pmd)
 {
-- 
2.20.1

