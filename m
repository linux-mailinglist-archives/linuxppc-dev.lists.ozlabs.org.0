Return-Path: <linuxppc-dev+bounces-1720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A7798CEEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 10:39:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJSsk30d4z2yN2;
	Wed,  2 Oct 2024 18:39:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727858377;
	cv=none; b=TT72cSXD4MxD9XUg6TkI54H26iMmNe7jdtWFVHkTWU+3XKCwGJl0n1eIvPNhe69iKyELGBfhnpc9SlLEZ3GpZwiCb62pq11YUoOWvFFEeO03JRQqhjPMZ7XqNdLmbUniAScXIlaYEliRfbhNCInhs70WkPD7mz85PrW8OMpfEdcWP19i5YlaeY15mch1qCCR7Acbunmy6JnptgRCS1bdo2Qt7AjGFxM4QWRqNzG27WrVaZkL2XLhTDLOxa8NI1T/JFKYpWz0UCAtw9pdtDXPPUAoDNICo6F+Oz7g2cqjANjVobvgGQ9XOGUlV8RXlY1P440BpxcA/FQZmxQ82nwvZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727858377; c=relaxed/relaxed;
	bh=77lD46einRq62UAYc1JMNXuwDLxaxfaaIzZPunATQGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBYQTt5veUBQKgE+hXjXr2NIviVy5kxxwn8ycM48RjlvcBW9B/ioqdlCw5OcO+1QU7B8GYLnyntgKi1TyZwD1cJ07ZhL2l/iEVA9BSH0FK8bGQyIfpJhQ9iaPwX5KaFpi18fkdgfIeEWG+82uaTqCgsYnFFZZ0ovZBa/kTFjMrdc9lrvqr7uUctg5ZfSnnUXWEfR/MzrfmTjX3Y7RyCd1h09qeNmXL4/LLqYBNY+SaJtUezpdpjYdCzXRq9LG/hr3dyhOblAHYU5QHww0XWLsKpeNTP20TmeOQQu6X1FAMzX5TehupoREhKnKrJ+pJrDoIbLMAZc5bbLiRNTImDbfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJSsj1H2Lz2xZj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 18:39:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XJSsZ6wvTz9sPd;
	Wed,  2 Oct 2024 10:39:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9ZPkM7raCZc; Wed,  2 Oct 2024 10:39:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XJSsZ5g4Qz9rvV;
	Wed,  2 Oct 2024 10:39:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B01978B766;
	Wed,  2 Oct 2024 10:39:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MwNwPOZZvBb2; Wed,  2 Oct 2024 10:39:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.233.39])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 64C358B763;
	Wed,  2 Oct 2024 10:39:30 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Jason@zx2c4.com
Subject: [PATCH 1/2] powerpc/vdso: Add a page for non-time data
Date: Wed,  2 Oct 2024 10:39:28 +0200
Message-ID: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.44.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727858369; l=7984; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=2d6q09o9Jg03K1Fftd9k2eSsOwepxX3z7CwragHjdg4=; b=YjwygazVYJyYA37fR6nEx74Yzfej7/nibnrMl8wyMSLUBObqa9XjMc4W6iRSs/6OUylxDHOvL 64Gtto9HmwlAxvyvF37DtV2C+KzeSYR/rFZprsPOk9A1PsFqRbe/UD7
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The page containing VDSO time data is swapped with the one containing
TIME namespace data when a process uses a non-root time namespace.
For other data like powerpc specific data and RNG data, it means
tracking whether time namespace is the root one or not to know which
page to use.

Simplify the logic behind by moving time data out of first data page
so that the first data page which contains everything else always
remains the first page. Time data is in the second or third page
depending on selected time namespace.

While we are playing with get_datapage macro, directly take into
account the data offset inside the macro instead of adding that offset
afterwards.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/vdso_datapage.h | 24 +++++++-----------------
 arch/powerpc/kernel/vdso.c               | 16 ++++++++++------
 arch/powerpc/kernel/vdso/cacheflush.S    |  2 +-
 arch/powerpc/kernel/vdso/datapage.S      |  4 ++--
 arch/powerpc/kernel/vdso/getrandom.S     |  3 +--
 arch/powerpc/kernel/vdso/gettimeofday.S  |  5 ++---
 arch/powerpc/kernel/vdso/vdso32.lds.S    |  2 +-
 arch/powerpc/kernel/vdso/vdso64.lds.S    |  2 +-
 8 files changed, 25 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index 248dee138f7b..33069afccb3c 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -82,8 +82,9 @@ struct vdso_arch_data {
 	__u32 syscall_map[SYSCALL_MAP_SIZE];	/* Map of syscalls  */
 	__u32 compat_syscall_map[SYSCALL_MAP_SIZE];	/* Map of compat syscalls */
 
-	struct vdso_data data[CS_BASES];
 	struct vdso_rng_data rng_data;
+
+	struct vdso_data data[CS_BASES] __aligned(1 << CONFIG_PAGE_SHIFT);
 };
 
 #else /* CONFIG_PPC64 */
@@ -95,8 +96,9 @@ struct vdso_arch_data {
 	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
 	__u32 syscall_map[SYSCALL_MAP_SIZE]; /* Map of syscalls */
 	__u32 compat_syscall_map[0];	/* No compat syscalls on PPC32 */
-	struct vdso_data data[CS_BASES];
 	struct vdso_rng_data rng_data;
+
+	struct vdso_data data[CS_BASES] __aligned(1 << CONFIG_PAGE_SHIFT);
 };
 
 #endif /* CONFIG_PPC64 */
@@ -105,29 +107,17 @@ extern struct vdso_arch_data *vdso_data;
 
 #else /* __ASSEMBLY__ */
 
-.macro get_datapage ptr
+.macro get_datapage ptr offset=0
 	bcl	20, 31, .+4
 999:
 	mflr	\ptr
-	addis	\ptr, \ptr, (_vdso_datapage - 999b)@ha
-	addi	\ptr, \ptr, (_vdso_datapage - 999b)@l
+	addis	\ptr, \ptr, (_vdso_datapage - 999b + \offset)@ha
+	addi	\ptr, \ptr, (_vdso_datapage - 999b + \offset)@l
 .endm
 
 #include <asm/asm-offsets.h>
 #include <asm/page.h>
 
-.macro get_realdatapage ptr scratch
-	get_datapage \ptr
-#ifdef CONFIG_TIME_NS
-	lwz	\scratch, VDSO_CLOCKMODE_OFFSET(\ptr)
-	xoris	\scratch, \scratch, VDSO_CLOCKMODE_TIMENS@h
-	xori	\scratch, \scratch, VDSO_CLOCKMODE_TIMENS@l
-	cntlzw	\scratch, \scratch
-	rlwinm	\scratch, \scratch, PAGE_SHIFT - 5, 1 << PAGE_SHIFT
-	add	\ptr, \ptr, \scratch
-#endif
-.endm
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index ee4b9d676cff..6166c1862c06 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -48,12 +48,13 @@ long sys_ni_syscall(void);
  */
 static union {
 	struct vdso_arch_data	data;
-	u8			page[PAGE_SIZE];
+	u8			page[2 * PAGE_SIZE];
 } vdso_data_store __page_aligned_data;
 struct vdso_arch_data *vdso_data = &vdso_data_store.data;
 
 enum vvar_pages {
-	VVAR_DATA_PAGE_OFFSET,
+	VVAR_BASE_PAGE_OFFSET,
+	VVAR_TIME_PAGE_OFFSET,
 	VVAR_TIMENS_PAGE_OFFSET,
 	VVAR_NR_PAGES,
 };
@@ -119,7 +120,7 @@ static struct vm_special_mapping vdso64_spec __ro_after_init = {
 #ifdef CONFIG_TIME_NS
 struct vdso_data *arch_get_vdso_data(void *vvar_page)
 {
-	return ((struct vdso_arch_data *)vvar_page)->data;
+	return vvar_page;
 }
 
 /*
@@ -153,11 +154,14 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 	unsigned long pfn;
 
 	switch (vmf->pgoff) {
-	case VVAR_DATA_PAGE_OFFSET:
+	case VVAR_BASE_PAGE_OFFSET:
+		pfn = virt_to_pfn(vdso_data);
+		break;
+	case VVAR_TIME_PAGE_OFFSET:
 		if (timens_page)
 			pfn = page_to_pfn(timens_page);
 		else
-			pfn = virt_to_pfn(vdso_data);
+			pfn = virt_to_pfn(vdso_data->data);
 		break;
 #ifdef CONFIG_TIME_NS
 	case VVAR_TIMENS_PAGE_OFFSET:
@@ -170,7 +174,7 @@ static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
 		 */
 		if (!timens_page)
 			return VM_FAULT_SIGBUS;
-		pfn = virt_to_pfn(vdso_data);
+		pfn = virt_to_pfn(vdso_data->data);
 		break;
 #endif /* CONFIG_TIME_NS */
 	default:
diff --git a/arch/powerpc/kernel/vdso/cacheflush.S b/arch/powerpc/kernel/vdso/cacheflush.S
index 3b2479bd2f9a..0085ae464dac 100644
--- a/arch/powerpc/kernel/vdso/cacheflush.S
+++ b/arch/powerpc/kernel/vdso/cacheflush.S
@@ -30,7 +30,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 #ifdef CONFIG_PPC64
 	mflr	r12
   .cfi_register lr,r12
-	get_realdatapage	r10, r11
+	get_datapage	r10
 	mtlr	r12
   .cfi_restore	lr
 #endif
diff --git a/arch/powerpc/kernel/vdso/datapage.S b/arch/powerpc/kernel/vdso/datapage.S
index 2b19b6201a33..db8e167f0166 100644
--- a/arch/powerpc/kernel/vdso/datapage.S
+++ b/arch/powerpc/kernel/vdso/datapage.S
@@ -28,7 +28,7 @@ V_FUNCTION_BEGIN(__kernel_get_syscall_map)
 	mflr	r12
   .cfi_register lr,r12
 	mr.	r4,r3
-	get_realdatapage	r3, r11
+	get_datapage	r3
 	mtlr	r12
 #ifdef __powerpc64__
 	addi	r3,r3,CFG_SYSCALL_MAP64
@@ -52,7 +52,7 @@ V_FUNCTION_BEGIN(__kernel_get_tbfreq)
   .cfi_startproc
 	mflr	r12
   .cfi_register lr,r12
-	get_realdatapage	r3, r11
+	get_datapage	r3
 #ifndef __powerpc64__
 	lwz	r4,(CFG_TB_TICKS_PER_SEC + 4)(r3)
 #endif
diff --git a/arch/powerpc/kernel/vdso/getrandom.S b/arch/powerpc/kernel/vdso/getrandom.S
index f3bbf931931c..3deddcf89f99 100644
--- a/arch/powerpc/kernel/vdso/getrandom.S
+++ b/arch/powerpc/kernel/vdso/getrandom.S
@@ -31,8 +31,7 @@
 	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
-	get_realdatapage	r8, r11
-	addi		r8, r8, VDSO_RNG_DATA_OFFSET
+	get_datapage	r8 VDSO_RNG_DATA_OFFSET
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
 #ifdef __powerpc64__
diff --git a/arch/powerpc/kernel/vdso/gettimeofday.S b/arch/powerpc/kernel/vdso/gettimeofday.S
index 5540d7021fa2..5333848322ca 100644
--- a/arch/powerpc/kernel/vdso/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso/gettimeofday.S
@@ -32,11 +32,10 @@
 	PPC_STL		r2, PPC_MIN_STKFRM + STK_GOT(r1)
   .cfi_rel_offset r2, PPC_MIN_STKFRM + STK_GOT
 #endif
-	get_datapage	r5
 	.ifeq	\call_time
-	addi		r5, r5, VDSO_DATA_OFFSET
+		get_datapage	r5 VDSO_DATA_OFFSET
 	.else
-	addi		r4, r5, VDSO_DATA_OFFSET
+		get_datapage	r4 VDSO_DATA_OFFSET
 	.endif
 	bl		CFUNC(DOTSYM(\funct))
 	PPC_LL		r0, PPC_MIN_STKFRM + PPC_LR_STKOFF(r1)
diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
index 7b41d5d256e8..1a1b0b6d681a 100644
--- a/arch/powerpc/kernel/vdso/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
@@ -16,7 +16,7 @@ OUTPUT_ARCH(powerpc:common)
 
 SECTIONS
 {
-	PROVIDE(_vdso_datapage = . - 2 * PAGE_SIZE);
+	PROVIDE(_vdso_datapage = . - 3 * PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash          	: { *(.hash) }			:text
diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
index 9481e4b892ed..e21b5506cad6 100644
--- a/arch/powerpc/kernel/vdso/vdso64.lds.S
+++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
@@ -16,7 +16,7 @@ OUTPUT_ARCH(powerpc:common64)
 
 SECTIONS
 {
-	PROVIDE(_vdso_datapage = . - 2 * PAGE_SIZE);
+	PROVIDE(_vdso_datapage = . - 3 * PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
-- 
2.44.0


