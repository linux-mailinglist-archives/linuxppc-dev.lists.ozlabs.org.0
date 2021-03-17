Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98F33E9B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 07:26:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0gCk3hKXz3brS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 17:26:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=fLYlcSfN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fLYlcSfN; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0gC92v6Lz3bxs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 17:25:57 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id
 x7-20020a17090a2b07b02900c0ea793940so2655082pjc.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 23:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZnEda0T3pGShx0QqEfgouMD/KA4MVCDJ6OoGinC0gE=;
 b=fLYlcSfNjjYf4im0CmwXX9uFu0R6/2elBdnUDdyYVOlkYQAe04v1WgcG7ZIGlpljT9
 SLjBuUq0fzfMpOxz7InlDaQ4plALW4GVs7HLjWHat3QIhZxnYNHZKbTvtG9NtKWzC/5E
 /MHpVEnov74/4Jb2KNQKv3r6lRMpiz4IbCFj6ozscN3pw0QWY/OlApapX32lg8ev/Geb
 idkPjx22igBJf+xnGC6bLxyblUbSdNaRC7JGRPDPnfOVbd0+5lLwOns57KjSaIMeIuI7
 UL6xeHwUjI8k8Z0g/0VRjA1ERirFFmiNfgZyWk+OUGKwFDiOhV1yCAI+/3GySAB0aDgU
 Xo8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZnEda0T3pGShx0QqEfgouMD/KA4MVCDJ6OoGinC0gE=;
 b=fveK78+ee8pE6pEONnICdPK3vWYRkmGWIqJMRqVrfM3dfPeg58q4y7IXyQ6ZN+2eBz
 8Oc/0ox1mYIeu7i7BbHeyYTJoKjE8pmQE9ysBip8XMp2KVZ9Ap7LAoXp5THUVloJktep
 fswj1kHJMTYSjAg6JQL/W6eTgwNksNl+Mk2llMVGLh4Qx5ibMvZAGK9X4Y3mr35BLN63
 ODgFMjWLYVEg9ZgTKoi54KTobYFsjoO89c7PkD1sgemVUDjkZFIPgjTn1o3Ip05eOooZ
 /36mE5gUIawL5Fg/5a7o3t5ZO41xC/tQb1Red3Zq0sm1eXzkcWRBTnrJfJDDEMXhRDCd
 wdOQ==
X-Gm-Message-State: AOAM530A4xO6ZbTRsPO0fRkLvdJ6rlAsW2AaE6Nz9egIopBWK1K1QojR
 +/a14g2Fa6dmrCzP9JXJqwk=
X-Google-Smtp-Source: ABdhPJyRI+bGimVthTrlN06P4ADDSwiZIZdfQrOqluFmWVNVhhZm6lHvDqdPI9QCbgNXHKtlH+H10g==
X-Received: by 2002:a17:902:b60d:b029:e6:7a9:7f4 with SMTP id
 b13-20020a170902b60db02900e607a907f4mr2850305pls.3.1615962355626; 
 Tue, 16 Mar 2021 23:25:55 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 s19sm17959620pfh.168.2021.03.16.23.25.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:25:55 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v13 14/14] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Wed, 17 Mar 2021 16:24:02 +1000
Message-Id: <20210317062402.533919-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210317062402.533919-1-npiggin@gmail.com>
References: <20210317062402.533919-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reduces TLB misses by nearly 30x on a `git diff` workload on a
2-node POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%, due
to vfs hashes being allocated with 2MB pages.

Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .../admin-guide/kernel-parameters.txt         |  2 ++
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/kernel/module.c                  | 22 +++++++++++++++----
 3 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 04545725f187..1f481f904895 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3243,6 +3243,8 @@
 
 	nohugeiomap	[KNL,X86,PPC,ARM64] Disable kernel huge I/O mappings.
 
+	nohugevmalloc	[PPC] Disable kernel huge vmalloc mappings.
+
 	nosmt		[KNL,S390] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..b7cade9566da 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -181,6 +181,7 @@ config PPC
 	select GENERIC_GETTIMEOFDAY
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
+	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index a211b0253cdb..cdb2d88c54e7 100644
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
@@ -87,13 +88,26 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-#ifdef MODULES_VADDR
 void *module_alloc(unsigned long size)
 {
+	unsigned long start = VMALLOC_START;
+	unsigned long end = VMALLOC_END;
+
+#ifdef MODULES_VADDR
 	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
+	start = MODULES_VADDR;
+	end = MODULES_END;
+#endif
+
+	/*
+	 * Don't do huge page allocations for modules yet until more testing
+	 * is done. STRICT_MODULE_RWX may require extra work to support this
+	 * too.
+	 */
 
-	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
+				    PAGE_KERNEL_EXEC,
+				    VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
+				    NUMA_NO_NODE,
 				    __builtin_return_address(0));
 }
-#endif
-- 
2.23.0

