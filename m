Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 481511397A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 18:27:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xLBS31bRzDqNx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 04:27:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=CqmvIS6J; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xKmx6fDDzDqD3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 04:08:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47xKmn129Rz9tyXK;
 Mon, 13 Jan 2020 18:08:41 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=CqmvIS6J; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id D6isRLbwP5q0; Mon, 13 Jan 2020 18:08:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47xKmm7170z9txyq;
 Mon, 13 Jan 2020 18:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578935321; bh=EIMY8bcz3Kggh/rQrqzeXyhyN/ypWY7RKWhqCLsPPhA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=CqmvIS6JbyuqyA3GCncKQJMFbinRn3Dw3ltqtKJiosCeBimJJOVjun2205YvZdY+q
 iUvT5PAUlSF1WVWLchDDxgfxu1/Ce4onQZmprizKXjewdDsHiIO7YpPQ5+uWDSEO/O
 Q3nNcxdb2kUSvTgr0XSHOi4+QkS7qqqlh+zC2SBs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C10F8B7C9;
 Mon, 13 Jan 2020 18:08:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id frAMeUV7d6Nn; Mon, 13 Jan 2020 18:08:46 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F23D38B7BE;
 Mon, 13 Jan 2020 18:08:45 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id C372C64A1D; Mon, 13 Jan 2020 17:08:45 +0000 (UTC)
Message-Id: <0cb594bc696cc195996733004907aefc3a6e596c.1578934751.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1578934751.git.christophe.leroy@c-s.fr>
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 07/12] powerpc/vdso: simplify __get_datapage()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 arnd@arndb.de, tglx@linutronix.de, vincenzo.frascino@arm.com,
 luto@kernel.org
Date: Mon, 13 Jan 2020 17:08:45 +0000 (UTC)
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The VDSO datapage and the text pages are always located immediately
next to each other, so it can be hardcoded without an indirection
through __kernel_datapage_offset

In order to ease things, move the data page in front like other
arches, that way there is no need to know the size of the library
to locate the data page.

Before:
clock-getres-realtime-coarse:    vdso: 714 nsec/call
clock-gettime-realtime-coarse:    vdso: 792 nsec/call
clock-gettime-realtime:    vdso: 1243 nsec/call

After:
clock-getres-realtime-coarse:    vdso: 699 nsec/call
clock-gettime-realtime-coarse:    vdso: 784 nsec/call
clock-gettime-realtime:    vdso: 1231 nsec/call
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/vdso.c              | 53 +++++----------------------------
 arch/powerpc/kernel/vdso32/datapage.S   | 10 +++----
 arch/powerpc/kernel/vdso32/vdso32.lds.S |  7 ++---
 arch/powerpc/kernel/vdso64/datapage.S   | 10 +++----
 arch/powerpc/kernel/vdso64/vdso64.lds.S |  7 ++---
 5 files changed, 19 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index 16a44bffe698..c093d90a222a 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -191,7 +191,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
 	 */
-	current->mm->context.vdso_base = vdso_base;
+	current->mm->context.vdso_base = vdso_base + PAGE_SIZE;
 
 	/*
 	 * our vma flags don't have VM_WRITE so by default, the process isn't
@@ -488,42 +488,6 @@ static __init void vdso_setup_trampolines(struct lib32_elfinfo *v32,
 	vdso32_rt_sigtramp = find_function32(v32, "__kernel_sigtramp_rt32");
 }
 
-static __init int vdso_fixup_datapage(struct lib32_elfinfo *v32,
-				       struct lib64_elfinfo *v64)
-{
-#ifdef CONFIG_VDSO32
-	Elf32_Sym *sym32;
-#endif
-#ifdef CONFIG_PPC64
-	Elf64_Sym *sym64;
-
-       	sym64 = find_symbol64(v64, "__kernel_datapage_offset");
-	if (sym64 == NULL) {
-		printk(KERN_ERR "vDSO64: Can't find symbol "
-		       "__kernel_datapage_offset !\n");
-		return -1;
-	}
-	*((int *)(vdso64_kbase + sym64->st_value - VDSO64_LBASE)) =
-		(vdso64_pages << PAGE_SHIFT) -
-		(sym64->st_value - VDSO64_LBASE);
-#endif /* CONFIG_PPC64 */
-
-#ifdef CONFIG_VDSO32
-	sym32 = find_symbol32(v32, "__kernel_datapage_offset");
-	if (sym32 == NULL) {
-		printk(KERN_ERR "vDSO32: Can't find symbol "
-		       "__kernel_datapage_offset !\n");
-		return -1;
-	}
-	*((int *)(vdso32_kbase + (sym32->st_value - VDSO32_LBASE))) =
-		(vdso32_pages << PAGE_SHIFT) -
-		(sym32->st_value - VDSO32_LBASE);
-#endif
-
-	return 0;
-}
-
-
 static __init int vdso_fixup_features(struct lib32_elfinfo *v32,
 				      struct lib64_elfinfo *v64)
 {
@@ -624,9 +588,6 @@ static __init int vdso_setup(void)
 	if (vdso_do_find_sections(&v32, &v64))
 		return -1;
 
-	if (vdso_fixup_datapage(&v32, &v64))
-		return -1;
-
 	if (vdso_fixup_features(&v32, &v64))
 		return -1;
 
@@ -771,26 +732,26 @@ static int __init vdso_init(void)
 	vdso32_pagelist = kcalloc(vdso32_pages + 2, sizeof(struct page *),
 				  GFP_KERNEL);
 	BUG_ON(vdso32_pagelist == NULL);
+	vdso32_pagelist[0] = virt_to_page(vdso_data);
 	for (i = 0; i < vdso32_pages; i++) {
 		struct page *pg = virt_to_page(vdso32_kbase + i*PAGE_SIZE);
 		get_page(pg);
-		vdso32_pagelist[i] = pg;
+		vdso32_pagelist[i + 1] = pg;
 	}
-	vdso32_pagelist[i++] = virt_to_page(vdso_data);
-	vdso32_pagelist[i] = NULL;
+	vdso32_pagelist[i + 1] = NULL;
 #endif
 
 #ifdef CONFIG_PPC64
 	vdso64_pagelist = kcalloc(vdso64_pages + 2, sizeof(struct page *),
 				  GFP_KERNEL);
 	BUG_ON(vdso64_pagelist == NULL);
+	vdso64_pagelist[0] = virt_to_page(vdso_data);
 	for (i = 0; i < vdso64_pages; i++) {
 		struct page *pg = virt_to_page(vdso64_kbase + i*PAGE_SIZE);
 		get_page(pg);
-		vdso64_pagelist[i] = pg;
+		vdso64_pagelist[i + 1] = pg;
 	}
-	vdso64_pagelist[i++] = virt_to_page(vdso_data);
-	vdso64_pagelist[i] = NULL;
+	vdso64_pagelist[i + 1] = NULL;
 #endif /* CONFIG_PPC64 */
 
 	get_page(virt_to_page(vdso_data));
diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index 6c7401bd284e..d839aa1a4f01 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -12,9 +12,6 @@
 #include <asm/vdso.h>
 
 	.text
-	.global	__kernel_datapage_offset;
-__kernel_datapage_offset:
-	.long	0
 
 V_FUNCTION_BEGIN(__get_datapage)
   .cfi_startproc
@@ -31,10 +28,11 @@ V_FUNCTION_BEGIN(__get_datapage)
 data_page_branch:
 	mflr	r3
 	mtlr	r0
-	addi	r3, r3, __kernel_datapage_offset-data_page_branch
-	lwz	r0,0(r3)
+#if CONFIG_PPC_PAGE_SHIFT > 14
+	addis	r3, r3, (_vdso_datapage - data_page_branch)@ha
+#endif
+	addi	r3, r3, (_vdso_datapage - data_page_branch)@l
   .cfi_restore lr
-	add	r3,r0,r3
 	blr
   .cfi_endproc
 V_FUNCTION_END(__get_datapage)
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 9400b182e163..f09c2354bd21 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -4,6 +4,7 @@
  * library
  */
 #include <asm/vdso.h>
+#include <asm/page.h>
 
 #ifdef __LITTLE_ENDIAN__
 OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
@@ -15,6 +16,7 @@ ENTRY(_start)
 
 SECTIONS
 {
+	PROVIDE(_vdso_datapage = . - PAGE_SIZE);
 	. = VDSO32_LBASE + SIZEOF_HEADERS;
 
 	.hash          	: { *(.hash) }			:text
@@ -138,11 +140,6 @@ VERSION
 {
 	VDSO_VERSION_STRING {
 	global:
-		/*
-		 * Has to be there for the kernel to find
-		 */
-		__kernel_datapage_offset;
-
 		__kernel_get_syscall_map;
 #if defined(CONFIG_PPC32) && !defined(CONFIG_PPC_BOOK3S_601)
 		__kernel_gettimeofday;
diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vdso64/datapage.S
index 4808ce9eeb3d..8c41e1a93980 100644
--- a/arch/powerpc/kernel/vdso64/datapage.S
+++ b/arch/powerpc/kernel/vdso64/datapage.S
@@ -12,9 +12,6 @@
 #include <asm/vdso.h>
 
 	.text
-.global	__kernel_datapage_offset;
-__kernel_datapage_offset:
-	.long	0
 
 _GLOBAL(__get_datapage)
   .cfi_startproc
@@ -31,10 +28,11 @@ _GLOBAL(__get_datapage)
 data_page_branch:
 	mflr	r3
 	mtlr	r0
-	addi	r3, r3, __kernel_datapage_offset-data_page_branch
-	lwz	r0,0(r3)
+#if CONFIG_PPC_PAGE_SHIFT > 14
+	addis	r3, r3, (_vdso_datapage - data_page_branch)@ha
+#endif
+	addi	r3, r3, (_vdso_datapage - data_page_branch)@l
   .cfi_restore lr
-	add	r3,r0,r3
 	blr
   .cfi_endproc
 
diff --git a/arch/powerpc/kernel/vdso64/vdso64.lds.S b/arch/powerpc/kernel/vdso64/vdso64.lds.S
index 256fb9720298..f58c7e2e9cbd 100644
--- a/arch/powerpc/kernel/vdso64/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso64/vdso64.lds.S
@@ -4,6 +4,7 @@
  * library
  */
 #include <asm/vdso.h>
+#include <asm/page.h>
 
 #ifdef __LITTLE_ENDIAN__
 OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
@@ -15,6 +16,7 @@ ENTRY(_start)
 
 SECTIONS
 {
+	PROVIDE(_vdso_datapage = . - PAGE_SIZE);
 	. = VDSO64_LBASE + SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
@@ -138,11 +140,6 @@ VERSION
 {
 	VDSO_VERSION_STRING {
 	global:
-		/*
-		 * Has to be there for the kernel to find
-		 */
-		__kernel_datapage_offset;
-
 		__kernel_get_syscall_map;
 		__kernel_gettimeofday;
 		__kernel_clock_gettime;
-- 
2.13.3

