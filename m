Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B82A8136
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 15:45:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRmXC3CbRzDqT2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 01:45:15 +1100 (AEDT)
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
 header.s=20161025 header.b=q/mM9+rM; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRmJH0yzXzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 01:34:54 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id e7so1575088pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 06:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QeZGW15jVHA1yeNiruoMdb6do8B+zTARRhfw60vKdMA=;
 b=q/mM9+rMXQztwr8JgDj/sxG0ugCHG5b5TPFCqoKqZ3Dq982T7OyUkhsPuVssdnl/Dh
 8U2lNcdbx9nbDz2fsb077OIzhcLCmAV1AtAyT4Btfotsw88ZLc6cLlahSkXa5NhZ6SV9
 MbktmlaFU2CY79Gf34bFytuY6BG19mkehyovhE7+nms6o7nNXxo/ZGSy/+wKYm9VQFPx
 y0xbvknO5vxYyNEgGNkW3k5Iemp1ZGEzqbS4HXgnyuWEIZQWsmgD6LbFEdOgf0HblpnN
 aQklR7x0qn5RSaANPUgYQFebpbVgAFyXAGgAiUGPjK2Vxtetd0bDkvbCgnRkoNE+BzKC
 0/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QeZGW15jVHA1yeNiruoMdb6do8B+zTARRhfw60vKdMA=;
 b=Fr17WpQ2TruexjJYoyXlmUeuE/9x/1gebdlUHUGkoau8M6DHLys0sSY4m6YjhoNw3H
 CabnAKjm4r1DX23o1GCAesCqO9W++REJzHJ09H3IZYyvGMr7RQBHSH3HPl9HJJ4ZEszB
 OTHttwOej8KxHW3+aIK4xu+0ha5QEc8W35rMHX2ejMka6vVI1wYIN27E1TjijHGzZ199
 mYr2qFaLNAOBXL7p7MJKf4Mqg+gP+f7Tm2C9Jcccvjt7hoHjhblTUcG+bgofpj2G5YOw
 021PaWr6Sw4/p7lpzbWWtIqCPyUm3lTQqGDgwkFetefzxp80p+5J/z8TL9XG23KFfMXi
 U3yw==
X-Gm-Message-State: AOAM531wV7A6q14BJOs+uU+jeAdDv40hLMPFZL0+Gjd1IPTjsBUytq1n
 nrKFOyvz1tm6bw0X2N1wthx7P7BWI0L8fw==
X-Google-Smtp-Source: ABdhPJygIOEEEkawlli7YwZ9KOt8+Bkfl1xAY/iV9bRV66J69/gEsaCTXh8wqYGh/4zR4Ta+oQtO5g==
X-Received: by 2002:aa7:9d81:0:b029:18b:4489:1e59 with SMTP id
 f1-20020aa79d810000b029018b44891e59mr2788576pfq.62.1604586890321; 
 Thu, 05 Nov 2020 06:34:50 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id n15sm2876771pgt.75.2020.11.05.06.34.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 06:34:49 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/18] powerpc: bad_page_fault,
 do_break get registers from regs
Date: Fri,  6 Nov 2020 00:34:16 +1000
Message-Id: <20201105143431.1874789-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201105143431.1874789-1-npiggin@gmail.com>
References: <20201105143431.1874789-1-npiggin@gmail.com>
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

This also moves the 32s DABR match to C.

Similar to the previous patch this makes interrupt handler function
types more regular so they can be wrapped with the next patch.

bad_page_fault and do_break are not performance critical.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h             |  2 +-
 arch/powerpc/include/asm/debug.h           |  3 +--
 arch/powerpc/kernel/entry_32.S             | 14 ++++----------
 arch/powerpc/kernel/exceptions-64e.S       |  3 +--
 arch/powerpc/kernel/exceptions-64s.S       |  3 +--
 arch/powerpc/kernel/head_8xx.S             |  5 ++---
 arch/powerpc/kernel/process.c              |  7 +++----
 arch/powerpc/kernel/traps.c                |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
 arch/powerpc/mm/book3s64/slb.c             |  2 +-
 arch/powerpc/mm/fault.c                    | 14 +++++++-------
 arch/powerpc/platforms/8xx/machine_check.c |  2 +-
 12 files changed, 25 insertions(+), 36 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 2fa0cf6c6011..4af6c3835eb2 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -113,7 +113,7 @@
 struct pt_regs;
 extern long do_page_fault(struct pt_regs *);
 extern long hash__do_page_fault(struct pt_regs *);
-extern void bad_page_fault(struct pt_regs *, unsigned long, int);
+extern void bad_page_fault(struct pt_regs *, int);
 extern void _exception(int, struct pt_regs *, int, unsigned long);
 extern void _exception_pkey(struct pt_regs *, unsigned long, int);
 extern void die(const char *, struct pt_regs *, long);
diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
index ec57daf87f40..0550eceab3ca 100644
--- a/arch/powerpc/include/asm/debug.h
+++ b/arch/powerpc/include/asm/debug.h
@@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned long address,
 			 unsigned long error_code, int brkpt);
 #else
 
-extern void do_break(struct pt_regs *regs, unsigned long address,
-		     unsigned long error_code);
+void do_break(struct pt_regs *regs);
 #endif
 
 #endif /* _ASM_POWERPC_DEBUG_H */
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 8cdc8bcde703..eb97df234a0c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -657,10 +657,6 @@ ppc_swapcontext:
 	.globl	handle_page_fault
 handle_page_fault:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-#ifdef CONFIG_PPC_BOOK3S_32
-	andis.  r0,r5,DSISR_DABRMATCH@h
-	bne-    handle_dabr_fault
-#endif
 	bl	do_page_fault
 	cmpwi	r3,0
 	beq+	ret_from_except
@@ -668,19 +664,17 @@ handle_page_fault:
 	lwz	r0,_TRAP(r1)
 	clrrwi	r0,r0,1
 	stw	r0,_TRAP(r1)
-	mr	r5,r3
+	mr	r4,r3		/* err arg for bad_page_fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	lwz	r4,_DAR(r1)
+#ifdef CONFIG_PPC_BOOK3S_32
+	blt	handle_dabr_fault
+#endif
 	bl	bad_page_fault
 	b	ret_from_except_full
 
 #ifdef CONFIG_PPC_BOOK3S_32
 	/* We have a data breakpoint exception - handle it */
 handle_dabr_fault:
-	SAVE_NVGPRS(r1)
-	lwz	r0,_TRAP(r1)
-	clrrwi	r0,r0,1
-	stw	r0,_TRAP(r1)
 	bl      do_break
 	b	ret_from_except_full
 #endif
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 25fa7d5a643c..dc728bb1c89a 100644
--- a/arch/powerpc/kernel/exceptions-64e.S
+++ b/arch/powerpc/kernel/exceptions-64e.S
@@ -1018,9 +1018,8 @@ storage_fault_common:
 	bne-	1f
 	b	ret_from_except_lite
 1:	bl	save_nvgprs
-	mr	r5,r3
+	mr	r4,r3
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	ld	r4,_DAR(r1)
 	bl	bad_page_fault
 	b	ret_from_except
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 1f34cfd1887c..e6558c4d3f81 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2135,8 +2135,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
 	GEN_COMMON h_data_storage
 	addi    r3,r1,STACK_FRAME_OVERHEAD
 BEGIN_MMU_FTR_SECTION
-	ld	r4,_DAR(r1)
-	li	r5,SIGSEGV
+	li	r4,SIGSEGV
 	bl      bad_page_fault
 MMU_FTR_SECTION_ELSE
 	bl      unknown_exception
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 0cd95b633e2b..13eda7154695 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -408,10 +408,9 @@ do_databreakpoint:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	mfspr	r4,SPRN_BAR
 	stw	r4,_DAR(r11)
-#ifdef CONFIG_VMAP_STACK
-	lwz	r5,_DSISR(r11)
-#else
+#ifndef CONFIG_VMAP_STACK
 	mfspr	r5,SPRN_DSISR
+	stw	r5,_DSISR(r11)
 #endif
 	EXC_XFER_STD(0x1c00, do_break)
 
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index d421a2c7f822..0bdd3ed653df 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -660,11 +660,10 @@ static void do_break_handler(struct pt_regs *regs)
 	}
 }
 
-void do_break (struct pt_regs *regs, unsigned long address,
-		    unsigned long error_code)
+void do_break(struct pt_regs *regs)
 {
 	current->thread.trap_nr = TRAP_HWBKPT;
-	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, error_code,
+	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr,
 			11, SIGSEGV) == NOTIFY_STOP)
 		return;
 
@@ -682,7 +681,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
 		do_break_handler(regs);
 
 	/* Deliver the signal to userspace */
-	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
+	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
 }
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 5006dcbe1d9f..902fcbd1a778 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1641,7 +1641,7 @@ void alignment_exception(struct pt_regs *regs)
 	if (user_mode(regs))
 		_exception(sig, regs, code, regs->dar);
 	else
-		bad_page_fault(regs, regs->dar, sig);
+		bad_page_fault(regs, sig);
 
 bail:
 	exception_exit(prev_state);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 0f0bd4af4b2d..731518e7d56f 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1537,7 +1537,7 @@ long do_hash_fault(struct pt_regs *regs)
 	 * the access, or panic if there isn't a handler.
 	 */
 	if (unlikely(in_nmi())) {
-		bad_page_fault(regs, ea, SIGSEGV);
+		bad_page_fault(regs, SIGSEGV);
 		return 0;
 	}
 
@@ -1576,7 +1576,7 @@ long do_hash_fault(struct pt_regs *regs)
 			else
 				_exception(SIGBUS, regs, BUS_ADRERR, ea);
 		} else {
-			bad_page_fault(regs, ea, SIGBUS);
+			bad_page_fault(regs, SIGBUS);
 		}
 		err = 0;
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index cc34d50874c1..ae89ad516247 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -898,7 +898,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
 		if (user_mode(regs))
 			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
 		else
-			bad_page_fault(regs, regs->dar, SIGSEGV);
+			bad_page_fault(regs, SIGSEGV);
 	} else if (err == -EINVAL) {
 		unrecoverable_exception(regs);
 	} else {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 390a296b16a3..49fbe564ea2b 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -375,7 +375,7 @@ static void sanity_check_fault(bool is_write, bool is_user,
 #elif defined(CONFIG_PPC_BOOK3E_64)
 #define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_64S)
 #else
-#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S)
+#define page_fault_is_bad(__err)	((__err) & DSISR_BAD_FAULT_32S | DSISR_DABRMATCH)
 #endif
 #endif
 
@@ -408,7 +408,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 		return 0;
 
 	if (unlikely(page_fault_is_bad(error_code))) {
-		if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && (error_code & DSISR_DABRMATCH))
+		if (IS_ENABLED(CONFIG_PPC_BOOK3S) && (error_code & DSISR_DABRMATCH))
 			return -1;
 
 		if (is_user) {
@@ -562,14 +562,14 @@ long do_page_fault(struct pt_regs *regs)
 	/* 32 and 64e handle errors in their asm code */
 	if (unlikely(err)) {
 		if (err > 0) {
-			bad_page_fault(regs, address, err);
+			bad_page_fault(regs, err);
 			err = 0;
 		} else {
 			/*
 			 * do_break() may change NV GPRS while handling the
 			 * breakpoint. Return -ve to caller to do that.
 			 */
-			do_break(regs, address, error_code);
+			do_break(regs);
 		}
 	}
 #endif
@@ -591,14 +591,14 @@ long hash__do_page_fault(struct pt_regs *regs)
 	err = __do_page_fault(regs, address, error_code);
 	if (unlikely(err)) {
 		if (err > 0) {
-			bad_page_fault(regs, address, err);
+			bad_page_fault(regs, err);
 			err = 0;
 		} else {
 			/*
 			 * do_break() may change NV GPRS while handling the
 			 * breakpoint. Return -ve to caller to do that.
 			 */
-			do_break(regs, address, error_code);
+			do_break(regs);
 		}
 	}
 
@@ -612,7 +612,7 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
  * It is called from the DSI and ISI handlers in head.S and from some
  * of the procedures in traps.c.
  */
-void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+void bad_page_fault(struct pt_regs *regs, int sig)
 {
 	const struct exception_table_entry *entry;
 	int is_write = page_fault_is_write(regs->dsisr);
diff --git a/arch/powerpc/platforms/8xx/machine_check.c b/arch/powerpc/platforms/8xx/machine_check.c
index 88dedf38eccd..656365975895 100644
--- a/arch/powerpc/platforms/8xx/machine_check.c
+++ b/arch/powerpc/platforms/8xx/machine_check.c
@@ -26,7 +26,7 @@ int machine_check_8xx(struct pt_regs *regs)
 	 * to deal with that than having a wart in the mcheck handler.
 	 * -- BenH
 	 */
-	bad_page_fault(regs, regs->dar, SIGBUS);
+	bad_page_fault(regs, SIGBUS);
 	return 1;
 #else
 	return 0;
-- 
2.23.0

