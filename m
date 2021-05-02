Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3314370A4A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 06:57:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXv3J3QnXz30CL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 May 2021 14:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Axon7jo+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Axon7jo+; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXv2n0QsKz2yRB
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 May 2021 14:56:30 +1000 (AEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 fa21-20020a17090af0d5b0290157eb6b590fso141695pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 May 2021 21:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XH+uBcXBtcHtokhFUJRy9Eddi0HBJSPKXZ1ByFIoHhs=;
 b=Axon7jo+fnZ1XlJ/MvRRAhtr8CF0jwfCPxwY3YvftAqsmkYg9TZ3slY2stguUmE4v5
 jwYXJf3nejFOdaO+TfkiJk3rIeqxZqJyrqud3z03xDiJs4Lask7Uztzlg8ICOKbqh1tS
 Y3fQCzPbineD8VwGjSM8DMtU50+dy4fBy3DU1Tyq8UJZxZHEPuRYSlS0EJo5gJyqZ4hF
 IoL4RaLDVz3ZNge9hufyEQQrVqy+uYedNMaKtS+Z9WgAMmjw1BsriSVj0RidUkJf/GEW
 n1XETrk4HL1YwD3LasdTweVe+t+lPiV2yXFskmOv6xPKLl2LPiRfCkwUsEIc/Ys7ukAH
 Pksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XH+uBcXBtcHtokhFUJRy9Eddi0HBJSPKXZ1ByFIoHhs=;
 b=MlrFeyIxP2FxR6upHT2b+CjoQprUFwehOEN9oahMjgRQY1G0Bp6nkJSm40Gs0fAzKN
 3PPBfdHQFXQXJxmt2fs0EbrPHQtY06qrqjRU93A7xtGEGMUvkRRAWO8GYyPztgKVwf87
 s6ClBZJn5K+RhhVAH/DU6+x9vXvdlRucX6ZPGtvDXoFBppzDX7mikqqyYlxANIhLV0a4
 YfgwIwTOXb/JhTwv0r5lBh9nQkkl1sWyKXE20VPlPgyfJdIaRAmbcXOol1u1J7w/kRne
 Hp/GJIzIfnp9vLijcGyGiSbPO9QcvB4ygubD7p5+uCa5w2GBMiMS2m3F5gJ/X3+s+wkv
 65PA==
X-Gm-Message-State: AOAM531fzKNxqNw9SPvoAiSxt2aHjX3O8JDCuhm13apJar4L2uMNDJWy
 PCxyhwyit38gn4gf/5pBAwiyzRd6T1o=
X-Google-Smtp-Source: ABdhPJw6DurENjUWXz7dmNzaIcv0QA/02tbQxkl0bwRRM47OiGMMXKgsWvo5cjPY42ODu9IFZej45Q==
X-Received: by 2002:a17:902:e8ca:b029:ec:bec2:ba6b with SMTP id
 v10-20020a170902e8cab02900ecbec2ba6bmr13836032plg.42.1619931386111; 
 Sat, 01 May 2021 21:56:26 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id v123sm5602157pfb.80.2021.05.01.21.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 21:56:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s/radix: Enable huge vmalloc mappings
Date: Sun,  2 May 2021 14:56:15 +1000
Message-Id: <20210502045615.237268-1-npiggin@gmail.com>
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
This was in the -mm tree but was dropped at the last minute after
clashing with a patch in powerpc next.

Now all prerequisites are upstream, this can be merged as is. Probably
makes sense now to go via powerpc tree.

This is rebased and retested on upstream.

 Documentation/admin-guide/kernel-parameters.txt |  2 ++
 arch/powerpc/Kconfig                            |  1 +
 arch/powerpc/include/asm/pgtable.h              |  5 +++++
 arch/powerpc/kernel/module.c                    | 16 +++++++++++++---
 4 files changed, 21 insertions(+), 3 deletions(-)

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
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index c6a676714f04..1678e4b08fc3 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -39,6 +39,11 @@ struct mm_struct;
 #define __S110	PAGE_SHARED_X
 #define __S111	PAGE_SHARED_X
 
+#ifndef MODULES_VADDR
+#define MODULES_VADDR	VMALLOC_START
+#define MODULES_END	VMALLOC_END
+#endif
+
 #ifndef __ASSEMBLY__
 
 /* Keep these as a macros to avoid include dependency mess */
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index fab84024650c..77aefcbbd276 100644
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
@@ -88,17 +89,24 @@ int module_finalize(const Elf_Ehdr *hdr,
 	return 0;
 }
 
-#ifdef MODULES_VADDR
 static __always_inline void *
 __module_alloc(unsigned long size, unsigned long start, unsigned long end)
 {
+	/*
+	 * Don't do huge page allocations for modules yet until more testing
+	 * is done. STRICT_MODULE_RWX may require extra work to support this
+	 * too.
+	 */
 	return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
-				    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
+				    PAGE_KERNEL_EXEC,
+				    VM_FLUSH_RESET_PERMS | VM_NO_HUGE_VMAP,
+				    NUMA_NO_NODE,
 				    __builtin_return_address(0));
 }
 
 void *module_alloc(unsigned long size)
 {
+#ifdef CONFIG_PPC32
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 	void *ptr = NULL;
 
@@ -112,5 +120,7 @@ void *module_alloc(unsigned long size)
 		ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
 
 	return ptr;
-}
+#else
+	return __module_alloc(size, MODULES_VADDR, MODULES_END);
 #endif
+}
-- 
2.23.0

