Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1927576
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 07:28:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458dMm3R6nzDqTw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 15:28:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="grfUhkoC"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458dCg1YKbzDqS3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:21:51 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id d30so2483590pgm.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 22:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HfBrEV1CyylZ9vuMNT9zujYn+Hw36buoRy8FUC7k2rk=;
 b=grfUhkoCBLTES1FAyTlXlhCWIpS03R6qmBCTDAYSCWB4Qrynsbj5iyHQgcoB+N8mRx
 PLjGmdYYXzDDi5kU2vJZ5ZAay8B27pyzzGHzywuhH/EvlNczJv4nWoOQwRBrzmS/xrZP
 kF19KHmn8xMzBavZISrHoBJCHoapAOEDYINuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HfBrEV1CyylZ9vuMNT9zujYn+Hw36buoRy8FUC7k2rk=;
 b=WQJhkoeFQPnvhdF0JLNUJDBi5J7ZUUJvm+aWTN6pCbYdlcbWtww4zWdsduxcKp/5Al
 cuq2SEwmvWmNmFj7PCElICITarhMqG9aMbqdV84ndAXgWcWCSDC6GUFCsdBcQ4dpiNYF
 4bZGLKuwMeBTOX0fFfGN+IoIYUW6iD6heYR2nPTdW0rDRbJ2nYT6b21NGz4LXT4qzh+1
 Po3RQ/odUU+8aVc7araMQSK9/hm8j27F+IHLaoupNt35ie1/MD7k9wUrLpUZUULezw30
 QxAR2LOC7Pfu3bSWGyFV9YLQBXC/IZ7/LuMFjSSKc51ZE/i0S8aPgfElEpg1Xkozd977
 fC0A==
X-Gm-Message-State: APjAAAXiKiRXaH4SBO4t2Siv0+kTfMS4U/53mkQl01CvWRPRkQoaFIRc
 Ks3bwYdUlOgF3XwEecHZrdAmZQ==
X-Google-Smtp-Source: APXvYqzMcE0JLxQklhcoMIP12TTO3tJOWYpYiXaROvp20JmWfWqtp35KwPj8FV1OZwvb/PnMrUZeZQ==
X-Received: by 2002:a63:2d0:: with SMTP id 199mr37549705pgc.188.1558588908836; 
 Wed, 22 May 2019 22:21:48 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id y10sm40609648pff.4.2019.05.22.22.21.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 May 2019 22:21:48 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: aneesh.kumar@linux.ibm.com, christophe.leroy@c-s.fr, bsingharora@gmail.com
Subject: [RFC PATCH 5/7] kasan: allow arches to provide their own early shadow
 setup
Date: Thu, 23 May 2019 15:21:18 +1000
Message-Id: <20190523052120.18459-6-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190523052120.18459-1-dja@axtens.net>
References: <20190523052120.18459-1-dja@axtens.net>
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
level: PTES_PER_* reference variables. This leads to complier
errors as global variables must have constant sizes.

Allow architectures to manage their own early shadow variables
so we can work around this on powerpc.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 include/linux/kasan.h |  2 ++
 mm/kasan/init.c       | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/kasan.h b/include/linux/kasan.h
index a630d53f1a36..dfee2b42d799 100644
--- a/include/linux/kasan.h
+++ b/include/linux/kasan.h
@@ -18,11 +18,13 @@ struct task_struct;
 static inline bool kasan_arch_is_ready(void)	{ return true; }
 #endif
 
+#ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
 extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
 extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
 extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
 extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
+#endif
 
 int kasan_populate_early_shadow(const void *shadow_start,
 				const void *shadow_end);
diff --git a/mm/kasan/init.c b/mm/kasan/init.c
index ce45c491ebcd..2522382bf374 100644
--- a/mm/kasan/init.c
+++ b/mm/kasan/init.c
@@ -31,10 +31,14 @@
  *   - Latter it reused it as zero shadow to cover large ranges of memory
  *     that allowed to access, but not handled by kasan (vmalloc/vmemmap ...).
  */
+#ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
+#endif
 
 #if CONFIG_PGTABLE_LEVELS > 4
+#ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
+#endif
 static inline bool kasan_p4d_table(pgd_t pgd)
 {
 	return pgd_page(pgd) == virt_to_page(lm_alias(kasan_early_shadow_p4d));
@@ -46,7 +50,9 @@ static inline bool kasan_p4d_table(pgd_t pgd)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 3
+#ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
+#endif
 static inline bool kasan_pud_table(p4d_t p4d)
 {
 	return p4d_page(p4d) == virt_to_page(lm_alias(kasan_early_shadow_pud));
@@ -58,7 +64,9 @@ static inline bool kasan_pud_table(p4d_t p4d)
 }
 #endif
 #if CONFIG_PGTABLE_LEVELS > 2
+#ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
+#endif
 static inline bool kasan_pmd_table(pud_t pud)
 {
 	return pud_page(pud) == virt_to_page(lm_alias(kasan_early_shadow_pmd));
@@ -69,7 +77,9 @@ static inline bool kasan_pmd_table(pud_t pud)
 	return false;
 }
 #endif
+#ifndef ARCH_HAS_KASAN_EARLY_SHADOW
 pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
+#endif
 
 static inline bool kasan_pte_table(pmd_t pmd)
 {
-- 
2.19.1

