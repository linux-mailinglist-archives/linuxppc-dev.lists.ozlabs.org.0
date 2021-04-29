Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5772436E396
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 05:18:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FW10l50kbz3byM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 13:18:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=g+9Rq1Zx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g+9Rq1Zx; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FW0z35Gkbz3037
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 13:16:47 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id q2so13196899pfk.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 20:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nT9DZhVsmARCoo3szp7jbwMUK0R4O0W/wM0Ffp9isd0=;
 b=g+9Rq1ZxDH/83p0VLdif1ZGBE8SeVEi9Se5hSX3PR6qPUQJlyNsggkcr4HzCw5SC8t
 HJVZoVwxLrszu2c+eqFAkK7AXxB63Vv7TWwpvMW8KS/Sohp5Ebn1QsacSjYyjR5rx6eg
 wZBcIQlFYobOh223PaHndYCmgBYjzBLtCXiuR4O28/A6BHhZw+el+JIMSBkhi87oyZWp
 cGyOfd5vcug0e6Zh97mLYexM6X5bvT48DFvnx4yF1WQfNQRt9WgL4pyPnkw1M67FUQ9b
 e4WH1T1sFds9kN3k1vtX7rw/1drmfrnIs2R69ucIIJrjPTw0SCAn5ew8O/A7A+QsWWpX
 fQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nT9DZhVsmARCoo3szp7jbwMUK0R4O0W/wM0Ffp9isd0=;
 b=WJ+1kwkWIECHfU0YW6UfeBx0UAraL64Tw0TzTHocV+0v6MvJrA7moTNW/uZq2dXS6I
 41vp8XN0k3w8mhsLebphoEI8X6wN624RyRj0tG+7HcOesoNijLfO4d0y3N8B6bEpxpvv
 C4slkFOznuJiFt7ZspAvLig/S0w5bMBFQSp3SCfAo76LUvKFd6CnGP54KXI6wGKx6RXW
 k0G3o86i1PJD/dhzA/VDPBROyvYmeTAl47qNlzbtkmAhWZ9Qj5S7oH3k1c9oGL9Su+8A
 R298xVhoFXQGJWgLqqRmN+BbsFH5IcjrOlRSjidSER6DHJc391uu3oCPUW1xu6d5upuL
 dERA==
X-Gm-Message-State: AOAM530Ko3uD3LNw2Z2QE3v3L+wCJ0h2iRwWiG9zf7KHPR2TwFdtKfdy
 kjBV0raVvY62z+SZ42Kyy4iAfXBAMT0=
X-Google-Smtp-Source: ABdhPJzDyz8P2IxCbTnZNN8BlSdkeGCHaJjG8h4wwko0aD0fdSvfJGVyLU4NC+LNJQ++TE/MWv1hCA==
X-Received: by 2002:a63:4c55:: with SMTP id m21mr30814325pgl.251.1619666204809; 
 Wed, 28 Apr 2021 20:16:44 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id l16sm3650742pjl.32.2021.04.28.20.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 20:16:44 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 3/9] powerpc: Always define MODULES_{VADDR,END}
Date: Thu, 29 Apr 2021 13:15:56 +1000
Message-Id: <20210429031602.2606654-4-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429031602.2606654-1-jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
VMALLOC_END respectively. This reduces the need for special cases. For
example, powerpc's module_alloc() was previously predicated on
MODULES_VADDR being defined but now is unconditionally defined.

This will be useful reducing conditional code in other places that need
to allocate from the module region (i.e., kprobes).

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
v10: New to series
v11: - Consider more places MODULES_VADDR was being used
---
 arch/powerpc/include/asm/pgtable.h    | 11 +++++++++++
 arch/powerpc/kernel/module.c          |  5 +----
 arch/powerpc/mm/kasan/kasan_init_32.c | 10 +++++-----
 arch/powerpc/mm/ptdump/ptdump.c       |  4 ++--
 4 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index c6a676714f04..882fda779648 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -39,6 +39,17 @@ struct mm_struct;
 #define __S110	PAGE_SHARED_X
 #define __S111	PAGE_SHARED_X
 
+#ifndef MODULES_VADDR
+#define MODULES_VADDR VMALLOC_START
+#define MODULES_END VMALLOC_END
+#endif
+
+#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_STRICT_KERNEL_RWX)
+#if TASK_SIZE > MODULES_VADDR
+#error TASK_SIZE > MODULES_VADDR
+#endif
+#endif
+
 #ifndef __ASSEMBLY__
 
 /* Keep these as a macros to avoid include dependency mess */
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index fab84024650c..c60c7457ff47 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -15,6 +15,7 @@
 #include <linux/sort.h>
 #include <asm/setup.h>
 #include <asm/sections.h>
+#include <linux/mm.h>
 
 static LIST_HEAD(module_bug_list);
 
@@ -88,7 +89,6 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-#ifdef MODULES_VADDR
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
@@ -102,8 +102,6 @@ void *module_alloc(unsigned long size)
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 	void *ptr = NULL;
 
-	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
-
 	/* First try within 32M limit from _etext to avoid branch trampolines */
 	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
 		ptr = __module_alloc(size, limit, MODULES_END);
@@ -113,4 +111,3 @@ void *module_alloc(unsigned long size)
 
 	return ptr;
 }
-#endif
diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/kasan_init_32.c
index cf8770b1a692..42c057366ac7 100644
--- a/arch/powerpc/mm/kasan/kasan_init_32.c
+++ b/arch/powerpc/mm/kasan/kasan_init_32.c
@@ -116,11 +116,11 @@ static void __init kasan_unmap_early_shadow_vmalloc(void)
 
 	kasan_update_early_region(k_start, k_end, __pte(0));
 
-#ifdef MODULES_VADDR
-	k_start = (unsigned long)kasan_mem_to_shadow((void *)MODULES_VADDR);
-	k_end = (unsigned long)kasan_mem_to_shadow((void *)MODULES_END);
-	kasan_update_early_region(k_start, k_end, __pte(0));
-#endif
+	if (MODULES_VADDR != VMALLOC_START && MODULES_END != VMALLOC_END) {
+		k_start = (unsigned long)kasan_mem_to_shadow((void *)MODULES_VADDR);
+		k_end = (unsigned long)kasan_mem_to_shadow((void *)MODULES_END);
+		kasan_update_early_region(k_start, k_end, __pte(0));
+	}
 }
 
 void __init kasan_mmu_init(void)
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index aca354fb670b..0431457f668f 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -73,7 +73,7 @@ struct addr_marker {
 
 static struct addr_marker address_markers[] = {
 	{ 0,	"Start of kernel VM" },
-#ifdef MODULES_VADDR
+#if defined(CONFIG_BOOK32_32) && defined(CONFIG_STRICT_KERNEL_RWX)
 	{ 0,	"modules start" },
 	{ 0,	"modules end" },
 #endif
@@ -359,7 +359,7 @@ static void populate_markers(void)
 #else
 	address_markers[i++].start_address = TASK_SIZE;
 #endif
-#ifdef MODULES_VADDR
+#if defined(CONFIG_BOOK32_32) && defined(CONFIG_STRICT_KERNEL_RWX)
 	address_markers[i++].start_address = MODULES_VADDR;
 	address_markers[i++].start_address = MODULES_END;
 #endif
-- 
2.25.1

