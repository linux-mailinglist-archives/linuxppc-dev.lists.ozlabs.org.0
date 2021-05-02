Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAD7370B35
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 13:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FY37q1DdGz301v
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 21:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=pGxdVS+S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pGxdVS+S; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FY37K1B0cz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 21:01:00 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id e15so2180911pfv.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 May 2021 04:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+Ziwgwi5d7sIEEYOU68YlAVGSs1OMki57WWZh2XqcU=;
 b=pGxdVS+SnIFzY9KX89W1clOe1IdCPMmiQeOSMqlpama+vLEiWVNBsUHgNGE0a2DPQh
 trumKAyJIabvDlAnwD21XiQONbAzNg2SA4JypyBN4D31XaMVxG4lbqz2rh3JtDbuIK4t
 irnikb4+a1u3y7lSYegB1B5RztlO/gj6kodS3VRicU0oD/C5y3UieRo5Je772WIJzjCS
 /Hay8Wgjbg5D/3QjWFePndJhgWRocXDUZyCDAAO5ImnAFv5YMHAY03u0DVpsbXWt0LSP
 02QzbWbHiHIKQTUMP05HKwMGuy8ZU03ucd179fzN0ZqpzJ33DIYnfHewhkmFiXdjqdJ8
 0EZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/+Ziwgwi5d7sIEEYOU68YlAVGSs1OMki57WWZh2XqcU=;
 b=mEAWF+btTF/Wfa3mqMQLztxFGGA25+/14y45JtLF4tA1R3bQ/JF3uWKejZHlMrnozN
 hV44D5dOmPbU7aOd4iyHjs6fjphz8zEA1d6iIl23mPVQQSknCIeaemcB1IBchmv6NqNA
 hVWeVyewxu1H+Dv5GXvb2yo8H60SirwU50MAElCx5IV/RLt8qdJLZHOoyo2vyUwC+9t3
 jyRJTjCik9Ba2mKsQgTOT2TZ6IyGj3IS2hOoq3qks0p9ivcIMmFQ1w8y/vl1H3/oVhtW
 3DxgPlfU7W3rzUuGbT0A5WGIA2YL99q5ARBqsIKH1EwYedSjPWZnCifpq2WAiC94pugL
 aH6A==
X-Gm-Message-State: AOAM533jTdiJ1RVCf5jcFPIYEozAxZtfeKj/ac1+Ozs41JfLI1nMvcr5
 1Yw6FAQNVdURc+yQwgKvBwU1dWWl0oQ=
X-Google-Smtp-Source: ABdhPJxeVbdrL5keba3K9RMieIIXguW8ZwMCZV93YOKxy+3tdyOAZYfLafWE0XPrBY7ZpMFhgmljYQ==
X-Received: by 2002:a63:4b5b:: with SMTP id k27mr7419634pgl.368.1619953257378; 
 Sun, 02 May 2021 04:00:57 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id js6sm11084751pjb.0.2021.05.02.04.00.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 04:00:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Sun,  2 May 2021 21:00:50 +1000
Message-Id: <20210502110050.324953-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reduces TLB misses by nearly 30x on a `git diff` workload on a
2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
to vfs hashes being allocated with 2MB pages.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Don't define MODULES_VADDR which has some other side effect (e.g.,
  ptdump).
- Fixed (hopefully) kbuild warning.
- Keep __vmalloc_node_range call on 3 lines.

 .../admin-guide/kernel-parameters.txt          |  2 ++
 arch/powerpc/Kconfig                           |  1 +
 arch/powerpc/kernel/module.c                   | 18 +++++++++++++-----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1c0a3cf6fcc9..1be38b25c485 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3250,6 +3250,8 @@
 
 	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
 
+	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
+
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1e6230bea09d..c547a9d6a2dd 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -185,6 +185,7 @@ config PPC
 	select GENERIC_VDSO_TIME_NS
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_JUMP_LABEL_RELATIVE
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index fab84024650c..ea1fa55a6897 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -8,6 +8,7 @@
 #include <linux/moduleloader.h>
 #include <linux/err.h>
 #include <linux/vmalloc.h>
+#include <linux/mm.h>
 #include <linux/bug.h>
 #include <asm/module.h>
 #include <linux/uaccess.h>
@@ -88,17 +89,22 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-#ifdef MODULES_VADDR
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
-	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
-				    __builtin_return_address(0));
+	/*
+	 * Don't do huge page allocations for modules yet until more testing
+	 * is done. STRICT_MODULE_RWX may require extra work to support this
+	 * too.
+	 */
+	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL, PAGE_KERNEL_EXEC,
+				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
+				    NUMA_NO_NODE, __builtin_return_address(0));
 }
 
 void *module_alloc(unsigned long size)
 {
+#ifdef CONFIG_PPC32
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 	void *ptr = NULL;
 
@@ -112,5 +118,7 @@ void *module_alloc(unsigned long size)
 		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
 
 	return ptr;
-}
+#else
+	return __module_alloc(size, VMALLOC_START, VMALLOC_END);
 #endif
+}
-- 
2.23.0

