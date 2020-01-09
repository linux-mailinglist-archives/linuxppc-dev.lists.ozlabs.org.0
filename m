Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F158E135390
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 08:13:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tcls0PXMzDqBG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 18:13:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=jjaxrqgt; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tcf11CwkzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 18:08:25 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id p27so2172579pli.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 23:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Qbs6Z3rqfBFwWIlrYI64jfvYzlaBBfAFpq17iRyZdo=;
 b=jjaxrqgtuQWvcLmq+D4GEkthntJ1AB1dg7Zsaobj44hThZzcSOYsjfSAEpAsb5TYoq
 QhF1zdPTdzHfDN0QO0iIA3Uhmr3BOwatC2/Rxa1M2pAVm/ecy5AalaUnSt/QrAPIin10
 6Pi//F+hwdSgp/fMILAMaBdSCfjtUDQfY8AZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Qbs6Z3rqfBFwWIlrYI64jfvYzlaBBfAFpq17iRyZdo=;
 b=hffrL6DHuR6QitbOzOfrcFZPLmjUDA0iN4+RrRX2qA/MbWtpI7yQRm8X2K16+yMKfO
 1H92MbZ7vUJU+a+oxZ4emPfDXfn95RlhS+DOyzuV8O9fKws+T/yvy6SL37kAnVtmwLhe
 af9iXu9W6YNFZKUiL65NP5yhOkSnKqLyIFWP4L4u1sutX1CjNySeq8HUZp4B5gNzszhb
 L+i2ZO5iXW+Sa3xaYTw7IZAP1Xo4kjDJMPGejxBNg8ByQmOrvMcOk0T97/Do3cjd5tB3
 5e7PSFgLBXRpBsZeboM/IduxE7x8ss1KSrfKHez1QZe3oQ5TnWAAXZs6MO+ErNIm+sA4
 aB/A==
X-Gm-Message-State: APjAAAWyWEYYFeeQYP8PoowuCPTSXwA0Iat17pBubRBLb9K5hTZVw5UA
 A+vCKaDXlpHby39GETCsySOSVg==
X-Google-Smtp-Source: APXvYqxqBWr1/17jIQT9llZB0OhZEqZItMXn9tbTBlaWChZbzmzKMiBkRcPtEN88NsA9JRgkdWq4kA==
X-Received: by 2002:a17:90a:6587:: with SMTP id
 k7mr3432299pjj.40.1578553701900; 
 Wed, 08 Jan 2020 23:08:21 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-5cb3-ebc3-7dc6-a17b.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:5cb3:ebc3:7dc6:a17b])
 by smtp.gmail.com with ESMTPSA id 199sm6721622pfv.81.2020.01.08.23.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 23:08:20 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v5 1/4] kasan: define and use MAX_PTRS_PER_* for early shadow
 tables
Date: Thu,  9 Jan 2020 18:08:08 +1100
Message-Id: <20200109070811.31169-2-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200109070811.31169-1-dja@axtens.net>
References: <20200109070811.31169-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

powerpc has a variable number of PTRS_PER_*, set at runtime based
on the MMU that the kernel is booted under.

This means the PTRS_PER_* are no longer constants, and therefore
breaks the build.

Define default MAX_PTRS_PER_*s in the same style as MAX_PTRS_PER_P4D.
As KASAN is the only user at the moment, just define them in the kasan
header, and have them default to PTRS_PER_* unless overridden in arch
code.

Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
Suggested-by: Balbir Singh <bsingharora@gmail.com>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Reviewed-by: Balbir Singh <bsingharora@gmail.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 include/linux/kasan.h | 18 +++++++++++++++---
 mm/kasan/init.c       |  6 +++---
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index e18fe54969e9..70865810d0e7 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -14,10 +14,22 @@ struct task_struct;
 #include <asm/kasan.h>
 #include <asm/pgtable.h>
 
+#ifndef MAX_PTRS_PER_PTE
+#define MAX_PTRS_PER_PTE PTRS_PER_PTE
+#endif
+
+#ifndef MAX_PTRS_PER_PMD
+#define MAX_PTRS_PER_PMD PTRS_PER_PMD
+#endif
+
+#ifndef MAX_PTRS_PER_PUD
+#define MAX_PTRS_PER_PUD PTRS_PER_PUD
+#endif
+
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
-extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
-extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
-extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
+extern pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE];
+extern pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD];
+extern pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD];
 extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
 
 int kasan_populate_early_shadow(const void *shadow_start,
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index ce45c491ebcd..8b54a96d3b3e 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -46,7 +46,7 @@ static inline bool kasan_p4d_table(pgd_t pgd)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 3
-pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
+pud_t kasan_early_shadow_pud[MAX_PTRS_PER_PUD] __page_aligned_bss;
 static inline bool kasan_pud_table(p4d_t p4d)
 {
 	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
@@ -58,7 +58,7 @@ static inline bool kasan_pud_table(p4d_t p4d)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
-pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
+pmd_t kasan_early_shadow_pmd[MAX_PTRS_PER_PMD] __page_aligned_bss;
 static inline bool kasan_pmd_table(pud_t pud)
 {
 	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
@@ -69,7 +69,7 @@ static inline bool kasan_pmd_table(pud_t pud)
 	return false;
 }
 #endif
-pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
+pte_t kasan_early_shadow_pte[MAX_PTRS_PER_PTE] __page_aligned_bss;
 
 static inline bool kasan_pte_table(pmd_t pmd)
 {
-- 
2.20.1

