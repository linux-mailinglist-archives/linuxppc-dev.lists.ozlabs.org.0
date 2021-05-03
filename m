Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C663712E4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 11:18:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYcpc5hZvz301x
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 19:18:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CcFCLtmk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CcFCLtmk; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYcp72T56z2xZF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 19:18:07 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id t4so1684114plc.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 May 2021 02:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8lZLIjdRv2iJ6Jk7O4RDLuQXlFIX5TSR3xcay3SvWDs=;
 b=CcFCLtmkJxNw2XwNq/IYP6Hfjz9kb/RXMvsyXqRz/EjwAh8k+T4bMlx8fMEeSC5u+K
 SSenKhlJVfQWhh/XHYgOZBOlOywOAh1Jo63ausU3n7vN6XRCc+Gp7aASCjpuaeSfKpiP
 V0+W/Gn+BwIiqyEbRwJofzeThQW/1Wx6gfHTLDuYiAlbwvleTswRvOzQhsH9sr/4fTCY
 I3mtnlQ5BOPWM9MXA15b7x1JSyEaAgWUikU+JMcebUMVQpEN5UuJ8bA9M16H+1gYXR1j
 G9oUSxja2qkmYEgZBcUXiqk2YxgixPi70ZEv+XTbAFphb9NdHck0ZQLwZveZ5sc19R2E
 szHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8lZLIjdRv2iJ6Jk7O4RDLuQXlFIX5TSR3xcay3SvWDs=;
 b=qSpijmNCO4xk6QsqxnuvlUzQgxP/R+kogvjlgIOHbF4BVOtxgSkrtPhNZtIhFxwBOR
 TgITjeVg8bb/8gjOhlLCvwYshmFoUqIIHV0JFloy6zg4j9P4X2/KevfzJ23N9At7smby
 9V5zM3h8X9GFc644xKgdTJ0sq79qmmzXWGtnTnVoPU43vtBP+oLwM7Wm55kKZQpe/ia2
 AsBmvaAYMy7hI+2ZFYfOQrdnL/ubZfCZQUMqQQwIwv5gtIlG5SwB3cL3xDSFWCgKd1Fh
 taW9Zd8+5sK4uTuBVcJg2K1v8nMHzH3vuy7QmSAR2zKpfXoBH9WjQmT8CLqaZ2wpiNy6
 XxNw==
X-Gm-Message-State: AOAM532umRu5MTNG0vtnvwRMSWTEMsVyL9HYoBJmy43NmUDT0eZYVa/U
 z3PUe7jI172vTKWtolzKrgyTnI+iuGQ=
X-Google-Smtp-Source: ABdhPJwCvT+Ks3qprOxRggCn9ZjPr5yFMGTKsHzOuNj7OGuGMRL5wyC8Xb7B75mqyRaiV2XQoj2rmA==
X-Received: by 2002:a17:90a:31ce:: with SMTP id
 j14mr19359326pjf.98.1620033482143; 
 Mon, 03 May 2021 02:18:02 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id c16sm9452541pgl.79.2021.05.03.02.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 02:18:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Mon,  3 May 2021 19:17:55 +1000
Message-Id: <20210503091755.613393-1-npiggin@gmail.com>
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
Since v2:
- Fix ppc32 compile bug.

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
index fab84024650c..3f35c8d20be7 100644
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
+#ifdef MODULES_VADDR
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

