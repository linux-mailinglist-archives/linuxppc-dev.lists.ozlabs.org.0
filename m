Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E466625E993
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 19:52:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BkMYp4XdZzDqGb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 03:51:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X/DlNFvN; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkMNT27skzDqcn
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 03:43:52 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u128so6367510pfb.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Sep 2020 10:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8H4UHDUUuKH+N/sHrQefOiT9oYSKSbT+e691nZnldaM=;
 b=X/DlNFvNxHcswoWtafsQ9cxNF6P89KeqjBFiL+2QR9WIylWKKJPZ8IXZj4pboQjB6T
 r12R4roug31umyD2B8rSpT2PCiY/TdBndYSdQuPYc5jvYq5SAcSTdZyQgV5XuNJx3w4t
 O4XvdXb4AsCGHqgreHh6aYWw0k069fhWcOmGaZrtTTQ2N1tbH05ZQvzxA3s6yUGhYnYa
 6btMoBs/0tJvTCze5Yu9PQ/mK+/qXSQ8/hvg3K7kcP1KPTG5DlmpIv+eY3CFNMnVYT9A
 JkQb5CJYuQZoVq+jJ5ZOWaTFWDC+KQQN/HWQxtxm6mIbRCK2JHltGpcRKu9T7odv1E57
 hZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8H4UHDUUuKH+N/sHrQefOiT9oYSKSbT+e691nZnldaM=;
 b=tJf/9/uslVonbUJe+kH9Fgd+1uJ5gwhY/PzC8pLGMo2ivz03ErdANxIfuVuQrFAM5n
 67J2kKnqTtSzd+3QsBplzlCqsL5ORiAJtyxEIUPgGiwAlJCbQit+hS4QnBeoNQbhhxYw
 xwwmE5t0lrFsWpYENgOtjoMwGaAmNhQOm60L4+yfDkiUz1uGIt+8C3MIa5cRQp13JsfS
 uQivuS2ryKR7pNqnIaSF5HYGdwPsZeVEeBxMTld/Sm4ypl1BaD+vp+Ou3/ywLiZ8DBoc
 Fgyh9KE4rOIHSpG0YXLL5E1FfTzOYAYKzWPSoSDHoNkwaBX2gu7EGz5k97zS1JV7e1n8
 kYZQ==
X-Gm-Message-State: AOAM533C8ssoI/9T3Y6fJfwDupWSz1UlaKy45Z/fW73+F2DCZXi5dM+b
 P4Es9xe5KQ4mN+VugA41I0w=
X-Google-Smtp-Source: ABdhPJxUN6ypr6vep9M9jKwFjEs45qoEiI8VwdZz0AMN+mpvVFk+k0gZl5R32zq4qcrORnWXJFf2zw==
X-Received: by 2002:a63:4543:: with SMTP id u3mr10767941pgk.398.1599327829998; 
 Sat, 05 Sep 2020 10:43:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.185.249.227])
 by smtp.gmail.com with ESMTPSA id i1sm10405317pfk.21.2020.09.05.10.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 10:43:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: 
Subject: [RFC PATCH 02/12] powerpc: remove arguments from interrupt handler
 functions
Date: Sun,  6 Sep 2020 03:43:25 +1000
Message-Id: <20200905174335.3161229-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200905174335.3161229-1-npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make interrupt handlers all just take the pt_regs * argument and load
DAR/DSISR etc from that. Make those that return a value return long.

This is done to make the function signatures match more closely, which
will help with a future patch to add wrappers. Explicit arguments could
be re-added for performance in future but that would require more
complex wrapper macros.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/asm-prototypes.h |  4 ++--
 arch/powerpc/include/asm/bug.h            |  4 ++--
 arch/powerpc/kernel/exceptions-64e.S      |  2 --
 arch/powerpc/kernel/exceptions-64s.S      | 14 ++------------
 arch/powerpc/mm/book3s64/hash_utils.c     |  8 +++++---
 arch/powerpc/mm/book3s64/slb.c            | 11 +++++++----
 arch/powerpc/mm/fault.c                   | 16 +++++++++-------
 7 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index de14b1a34d56..fffac9de2922 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -81,8 +81,8 @@ void kernel_bad_stack(struct pt_regs *regs);
 void system_reset_exception(struct pt_regs *regs);
 void machine_check_exception(struct pt_regs *regs);
 void emulation_assist_interrupt(struct pt_regs *regs);
-long do_slb_fault(struct pt_regs *regs, unsigned long ea);
-void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err);
+long do_slb_fault(struct pt_regs *regs);
+void do_bad_slb_fault(struct pt_regs *regs);
 
 /* signals, syscalls and interrupts */
 long sys_swapcontext(struct ucontext __user *old_ctx,
diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index d714d83bbc7c..2fa0cf6c6011 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -111,8 +111,8 @@
 #ifndef __ASSEMBLY__
 
 struct pt_regs;
-extern int do_page_fault(struct pt_regs *, unsigned long, unsigned long);
-extern int hash__do_page_fault(struct pt_regs *, unsigned long, unsigned long);
+extern long do_page_fault(struct pt_regs *);
+extern long hash__do_page_fault(struct pt_regs *);
 extern void bad_page_fault(struct pt_regs *, unsigned long, int);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index d9ed79415100..5988d61783b5 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1012,8 +1012,6 @@ storage_fault_common:
 	std	r14,_DAR(r1)
 	std	r15,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	mr	r4,r14
-	mr	r5,r15
 	ld	r14,PACA_EXGEN+EX_R14(r13)
 	ld	r15,PACA_EXGEN+EX_R15(r13)
 	bl	do_page_fault
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index f830b893fe03..1f34cfd1887c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1437,8 +1437,6 @@ EXC_VIRT_BEGIN(data_access, 0x4300, 0x80)
 EXC_VIRT_END(data_access, 0x4300, 0x80)
 EXC_COMMON_BEGIN(data_access_common)
 	GEN_COMMON data_access
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1491,10 +1489,9 @@ EXC_VIRT_BEGIN(data_access_slb, 0x4380, 0x80)
 EXC_VIRT_END(data_access_slb, 0x4380, 0x80)
 EXC_COMMON_BEGIN(data_access_slb_common)
 	GEN_COMMON data_access_slb
-	ld	r4,_DAR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
@@ -1506,8 +1503,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r4,_DAR(r1)
-	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
@@ -1542,8 +1537,6 @@ EXC_VIRT_BEGIN(instruction_access, 0x4400, 0x80)
 EXC_VIRT_END(instruction_access, 0x4400, 0x80)
 EXC_COMMON_BEGIN(instruction_access_common)
 	GEN_COMMON instruction_access
-	ld	r4,_DAR(r1)
-	ld	r5,_DSISR(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	bl	do_hash_fault
@@ -1587,10 +1580,9 @@ EXC_VIRT_BEGIN(instruction_access_slb, 0x4480, 0x80)
 EXC_VIRT_END(instruction_access_slb, 0x4480, 0x80)
 EXC_COMMON_BEGIN(instruction_access_slb_common)
 	GEN_COMMON instruction_access_slb
-	ld	r4,_DAR(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
 	/* HPT case, do SLB fault */
+	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_slb_fault
 	cmpdi	r3,0
 	bne-	1f
@@ -1602,8 +1594,6 @@ MMU_FTR_SECTION_ELSE
 ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
 	std	r3,RESULT(r1)
 	RECONCILE_IRQ_STATE(r10, r11)
-	ld	r4,_DAR(r1)
-	ld	r5,RESULT(r1)
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	do_bad_slb_fault
 	b	interrupt_return
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fd7b6bb7030d..8d36b47b3f5a 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1500,13 +1500,15 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
 }
 EXPORT_SYMBOL_GPL(hash_page);
 
-int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
+long do_hash_fault(struct pt_regs *regs)
 {
+	unsigned long ea = regs->dar;
+	unsigned long dsisr = regs->dsisr;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
 	unsigned long flags = 0;
 	struct mm_struct *mm;
 	unsigned int region_id;
-	int err;
+	long err;
 
 	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
 		goto _do_page_fault;
@@ -1570,7 +1572,7 @@ int do_hash_fault(struct pt_regs *regs, unsigned long ea, unsigned long dsisr)
 
 	} else if (err) {
 _do_page_fault:
-		err = hash__do_page_fault(regs, ea, dsisr);
+		err = hash__do_page_fault(regs);
 	}
 
 	return err;
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 156c38f89511..21832a2f15d7 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -837,8 +837,9 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
 	return slb_insert_entry(ea, context, flags, ssize, false);
 }
 
-long do_slb_fault(struct pt_regs *regs, unsigned long ea)
+long do_slb_fault(struct pt_regs *regs)
 {
+	unsigned long ea = regs->dar;
 	unsigned long id = get_region_id(ea);
 
 	/* IRQs are not reconciled here, so can't check irqs_disabled */
@@ -889,13 +890,15 @@ long do_slb_fault(struct pt_regs *regs, unsigned long ea)
 	}
 }
 
-void do_bad_slb_fault(struct pt_regs *regs, unsigned long ea, long err)
+void do_bad_slb_fault(struct pt_regs *regs)
 {
+	int err = regs->result;
+
 	if (err == -EFAULT) {
 		if (user_mode(regs))
-			_exception(SIGSEGV, regs, SEGV_BNDERR, ea);
+			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
 		else
-			bad_page_fault(regs, ea, SIGSEGV);
+			bad_page_fault(regs, regs->dar, SIGSEGV);
 	} else if (err == -EINVAL) {
 		unrecoverable_exception(regs);
 	} else {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index ce43e401e0e0..826f84311ae9 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -547,11 +547,12 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 }
 NOKPROBE_SYMBOL(__do_page_fault);
 
-int do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+long do_page_fault(struct pt_regs *regs)
 {
 	enum ctx_state prev_state = exception_enter();
-	int err;
+	unsigned long address = regs->dar;
+	unsigned long error_code = regs->dsisr;
+	long err;
 
 	err = __do_page_fault(regs, address, error_code);
 
@@ -578,11 +579,12 @@ int do_page_fault(struct pt_regs *regs, unsigned long address,
 NOKPROBE_SYMBOL(do_page_fault);
 
 #ifdef CONFIG_PPC_BOOK3S_64
-/* Same as do_page_fault but interrupt entry has already run in do_hash_fault */
-int hash__do_page_fault(struct pt_regs *regs, unsigned long address,
-		  unsigned long error_code)
+/* Same as do_page_fault but no interrupt entry */
+long hash__do_page_fault(struct pt_regs *regs)
 {
-	int err;
+	unsigned long address = regs->dar;
+	unsigned long error_code = regs->dsisr;
+	long err;
 
 	err = __do_page_fault(regs, address, error_code);
 	if (unlikely(err)) {
-- 
2.23.0

