Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F6B1A0E37
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 15:16:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xSc148cmzDqKr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 23:16:49 +1000 (AEST)
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
 header.s=mail header.b=FXcJJZ1D; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xSXl10JFzDqHm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:13:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xSXd5Sqhz9tyFM;
 Tue,  7 Apr 2020 15:13:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FXcJJZ1D; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ET9Vdwy69DHi; Tue,  7 Apr 2020 15:13:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xSXd3h6Qz9ty2V;
 Tue,  7 Apr 2020 15:13:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586265233; bh=V7aPoE5IdTnomj/0p76hTWiPhlpLckzGiUYF82N4lCg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=FXcJJZ1DB0TRlhLb3z1ocTPCkXy2cesHMud88qrIHwpDENmow3HrLXg3PjfCcUOIS
 XrwsV/FJrrQo3a8n0C76L68wi2oKwtbH58BXXJ8tv9wS0uDxnX4GX0vX483oWLWsrH
 KSMwnZaiupf+UES5ik90NeTdf8YG8yb6tvN8Uqpg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D5A838B7B5;
 Tue,  7 Apr 2020 15:13:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VcszqTYSsoSC; Tue,  7 Apr 2020 15:13:54 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 787D28B79C;
 Tue,  7 Apr 2020 15:13:54 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4EF8E65746; Tue,  7 Apr 2020 13:13:54 +0000 (UTC)
Message-Id: <71cbd92360c582333bc9a8720a5f7926c687e899.1586265010.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586265010.git.christophe.leroy@c-s.fr>
References: <cover.1586265010.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 2/4] powerpc/vdso: Remove __kernel_datapage_offset and
 simplify __get_datapage()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 nathanl@linux.ibm.com
Date: Tue,  7 Apr 2020 13:13:54 +0000 (UTC)
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
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

In the mean time, allow users to pass a constant offset to
get_datapage macro. That offset will be integrated to the
calculation to directly get the address of the given object
inside the VDSO datapage. This avoids having to perform a
subsequent addition.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/vdso_datapage.h  | 11 ++---
 arch/powerpc/kernel/vdso.c                | 53 +++--------------------
 arch/powerpc/kernel/vdso32/cacheflush.S   |  2 +-
 arch/powerpc/kernel/vdso32/datapage.S     |  7 +--
 arch/powerpc/kernel/vdso32/gettimeofday.S |  8 ++--
 arch/powerpc/kernel/vdso32/vdso32.lds.S   |  7 +--
 arch/powerpc/kernel/vdso64/cacheflush.S   |  2 +-
 arch/powerpc/kernel/vdso64/datapage.S     |  7 +--
 arch/powerpc/kernel/vdso64/gettimeofday.S |  8 ++--
 arch/powerpc/kernel/vdso64/vdso64.lds.S   |  7 +--
 10 files changed, 31 insertions(+), 81 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index b9ef6cf50ea5..a361f07bec49 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -116,12 +116,13 @@ extern struct vdso_data *vdso_data;
 
 #else /* __ASSEMBLY__ */
 
-.macro get_datapage ptr, tmp
+.macro get_datapage ptr, offset=0
 	bcl	20, 31, .+4
-	mflr	\ptr
-	addi	\ptr, \ptr, (__kernel_datapage_offset - (.-4))@l
-	lwz	\tmp, 0(\ptr)
-	add	\ptr, \tmp, \ptr
+999:	mflr	\ptr
+#if CONFIG_PPC_PAGE_SHIFT > 14
+	addis	\ptr, \ptr, (_vdso_datapage + \offset - 999b)@ha
+#endif
+	addi	\ptr, \ptr, (_vdso_datapage + \offset - 999b)@l
 .endm
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index f38f26e844b6..d33fa22ddbed 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -190,7 +190,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
 	 */
-	current->mm->context.vdso_base = vdso_base;
+	current->mm->context.vdso_base = vdso_base + PAGE_SIZE;
 
 	/*
 	 * our vma flags don't have VM_WRITE so by default, the process isn't
@@ -482,42 +482,6 @@ static __init void vdso_setup_trampolines(struct lib32_elfinfo *v32,
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
@@ -618,9 +582,6 @@ static __init int vdso_setup(void)
 	if (vdso_do_find_sections(&v32, &v64))
 		return -1;
 
-	if (vdso_fixup_datapage(&v32, &v64))
-		return -1;
-
 	if (vdso_fixup_features(&v32, &v64))
 		return -1;
 
@@ -761,26 +722,26 @@ static int __init vdso_init(void)
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
diff --git a/arch/powerpc/kernel/vdso32/cacheflush.S b/arch/powerpc/kernel/vdso32/cacheflush.S
index 3440ddf21c8b..017843bf5382 100644
--- a/arch/powerpc/kernel/vdso32/cacheflush.S
+++ b/arch/powerpc/kernel/vdso32/cacheflush.S
@@ -27,7 +27,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
 #ifdef CONFIG_PPC64
 	mflr	r12
   .cfi_register lr,r12
-	get_datapage	r10, r0
+	get_datapage	r10
 	mtlr	r12
 #endif
 
diff --git a/arch/powerpc/kernel/vdso32/datapage.S b/arch/powerpc/kernel/vdso32/datapage.S
index 217bb630f8f9..0513a2eabec8 100644
--- a/arch/powerpc/kernel/vdso32/datapage.S
+++ b/arch/powerpc/kernel/vdso32/datapage.S
@@ -13,9 +13,6 @@
 #include <asm/vdso_datapage.h>
 
 	.text
-	.global	__kernel_datapage_offset;
-__kernel_datapage_offset:
-	.long	0
 
 /*
  * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
@@ -31,7 +28,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
 	mflr	r12
   .cfi_register lr,r12
 	mr.	r4,r3
-	get_datapage	r3, r0
+	get_datapage	r3
 	mtlr	r12
 	addi	r3,r3,CFG_SYSCALL_MAP32
 	beqlr
@@ -52,7 +49,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	get_datapage	r3, r0
+	get_datapage	r3
 	lwz	r4,(CFG_TB_TICKS_PER_SEC + 4)(r3)
 	lwz	r3,CFG_TB_TICKS_PER_SEC(r3)
 	mtlr	r12
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index a3951567118a..0bbdce0f2a9c 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -34,7 +34,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 
 	mr.	r10,r3			/* r10 saves tv */
 	mr	r11,r4			/* r11 saves tz */
-	get_datapage	r9, r0
+	get_datapage	r9
 	beq	3f
 	LOAD_REG_IMMEDIATE(r7, 1000000)	/* load up USEC_PER_SEC */
 	bl	__do_get_tspec@local	/* get sec/usec from tb & kernel */
@@ -79,7 +79,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	mflr	r12			/* r12 saves lr */
   .cfi_register lr,r12
 	mr	r11,r4			/* r11 saves tp */
-	get_datapage	r9, r0
+	get_datapage	r9
 	LOAD_REG_IMMEDIATE(r7, NSEC_PER_SEC)	/* load up NSEC_PER_SEC */
 	beq	cr5, .Lcoarse_clocks
 .Lprecise_clocks:
@@ -206,7 +206,7 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 
 	mflr	r12
   .cfi_register lr,r12
-	get_datapage	r3, r0
+	get_datapage	r3
 	lwz	r5, CLOCK_HRTIMER_RES(r3)
 	mtlr	r12
 1:	li	r3,0
@@ -240,7 +240,7 @@ V_FUNCTION_BEGIN(__kernel_time)
   .cfi_register lr,r12
 
 	mr	r11,r3			/* r11 holds t */
-	get_datapage	r9, r0
+	get_datapage	r9
 
 	lwz	r3,STAMP_XTIME_SEC+LOPART(r9)
 
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 5206c2eb2a1d..6cf729612268 100644
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
 #ifndef CONFIG_PPC_BOOK3S_601
 		__kernel_gettimeofday;
diff --git a/arch/powerpc/kernel/vdso64/cacheflush.S b/arch/powerpc/kernel/vdso64/cacheflush.S
index cab14324242b..61985de5758f 100644
--- a/arch/powerpc/kernel/vdso64/cacheflush.S
+++ b/arch/powerpc/kernel/vdso64/cacheflush.S
@@ -25,7 +25,7 @@ V_FUNCTION_BEGIN(__kernel_sync_dicache)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	get_datapage	r10, r0
+	get_datapage	r10
 	mtlr	r12
 
 	lwz	r7,CFG_DCACHE_BLOCKSZ(r10)
diff --git a/arch/powerpc/kernel/vdso64/datapage.S b/arch/powerpc/kernel/vdso64/datapage.S
index 067247d3efb9..00760dc69d68 100644
--- a/arch/powerpc/kernel/vdso64/datapage.S
+++ b/arch/powerpc/kernel/vdso64/datapage.S
@@ -13,9 +13,6 @@
 #include <asm/vdso_datapage.h>
 
 	.text
-.global	__kernel_datapage_offset;
-__kernel_datapage_offset:
-	.long	0
 
 /*
  * void *__kernel_get_syscall_map(unsigned int *syscall_count) ;
@@ -31,7 +28,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
 	mflr	r12
   .cfi_register lr,r12
 	mr	r4,r3
-	get_datapage	r3, r0
+	get_datapage	r3
 	mtlr	r12
 	addi	r3,r3,CFG_SYSCALL_MAP64
 	cmpldi	cr0,r4,0
@@ -53,7 +50,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	get_datapage	r3, r0
+	get_datapage	r3
 	ld	r3,CFG_TB_TICKS_PER_SEC(r3)
 	mtlr	r12
 	crclr	cr0*4+so
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index e54c4ce4d356..275f031d0bf1 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -26,7 +26,7 @@ V_FUNCTION_BEGIN(__kernel_gettimeofday)
 
 	mr	r11,r3			/* r11 holds tv */
 	mr	r10,r4			/* r10 holds tz */
-	get_datapage	r3, r0
+	get_datapage	r3
 	cmpldi	r11,0			/* check if tv is NULL */
 	beq	2f
 	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
@@ -71,7 +71,7 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	mflr	r12			/* r12 saves lr */
   .cfi_register lr,r12
 	mr	r11,r4			/* r11 saves tp */
-	get_datapage	r3, r0
+	get_datapage	r3
 	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
 	ori	r7,r7,NSEC_PER_SEC@l
 	beq	cr5,70f
@@ -188,7 +188,7 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 
 	mflr	r12
   .cfi_register lr,r12
-	get_datapage	r3, r0
+	get_datapage	r3
 	lwz	r5, CLOCK_HRTIMER_RES(r3)
 	mtlr	r12
 	li	r3,0
@@ -221,7 +221,7 @@ V_FUNCTION_BEGIN(__kernel_time)
   .cfi_register lr,r12
 
 	mr	r11,r3			/* r11 holds t */
-	get_datapage	r3, r0
+	get_datapage	r3
 
 	ld	r4,STAMP_XTIME_SEC(r3)
 
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
2.25.0

