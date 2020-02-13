Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A315B62B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 01:52:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HydY5pjQzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 11:52:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=gfQ7jmAP; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HyY155JfzDqDS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 11:48:05 +1100 (AEDT)
Received: by mail-pj1-x1043.google.com with SMTP id d5so1593702pjz.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0eDFn39gIg7xtZfHp4ELa6UyXk2yfoJL9wFZ1T547PE=;
 b=gfQ7jmAPlbpmhzAIID5d2fNUOceU9hDBNozIWvphDvthQUJkhkpGjdeeaYh8jy4R4x
 4HtWt4dB511vA2Zb1Jc3cFPJlscaf+e7+9qrqe6ss8ieF3GII/q2PmR4XfxPgZ8wKcBG
 X+aZYYMfZ8Gu9E7JiwEgOfnZRjGT75dizxn2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0eDFn39gIg7xtZfHp4ELa6UyXk2yfoJL9wFZ1T547PE=;
 b=TwPT1fJZiu35oh7QukpIqu74Ys65+ymtM1jqQyIcLvrziblKxj+svtDBTImSHLIh8o
 8vIkG464coopPTG4E76ee0nwHPVPzvLl8TeeyCa+7gG/2o4Rs+ICIgmNLv0P1IFkod+y
 hu4roHtBrNyGhYXwAXxgXH/IqPoCyofkDUKVLzD/lb14CVssMr72Gct0z0vnkysTnuLI
 GhV37iUqrINMh06j2O/LO9ydlv0Nzmcp7qmvdesYabwi8i5LberBzuNYUtJpv5ZTaUJl
 FsgX+D0y5qKokHabZxlbgcoqwUuJ/8mPOCoKNxf/ZGOXuvJoti9jp3nCJA2XXPqjjGbm
 ZRpA==
X-Gm-Message-State: APjAAAUnbvRNBOTLnMcePgkXYTVOBLSuCn0uVewhrzaQVgj2wl/DBrV8
 ns7sayue7FC8ybtfvJn9VLo2UQ==
X-Google-Smtp-Source: APXvYqwHvAKcYhQDHC3QmWNmwB5k9zQRIpFARpkceN2Ky58cYo5dxd7faOt/H3zC22zwPKoclLvWVA==
X-Received: by 2002:a17:902:9f98:: with SMTP id
 g24mr11134599plq.325.1581554883272; 
 Wed, 12 Feb 2020 16:48:03 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-f1ea-0ab5-027b-8841.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:f1ea:ab5:27b:8841])
 by smtp.gmail.com with ESMTPSA id l29sm297624pgb.86.2020.02.12.16.48.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2020 16:48:02 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com,
 christophe.leroy@c-s.fr, aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
Subject: [PATCH v7 1/4] kasan: define and use MAX_PTRS_PER_* for early shadow
 tables
Date: Thu, 13 Feb 2020 11:47:49 +1100
Message-Id: <20200213004752.11019-2-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200213004752.11019-1-dja@axtens.net>
References: <20200213004752.11019-1-dja@axtens.net>
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
index 5cde9e7c2664..b3a4500633f5 100644
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

