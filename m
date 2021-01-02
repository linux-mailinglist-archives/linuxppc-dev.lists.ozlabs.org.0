Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA73F2E874C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 13:38:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D7Lz2681vzDqpg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jan 2021 23:38:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jTZkJ9JG; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D7LhC3YpgzDqJ1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jan 2021 23:25:31 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id v3so12020006plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 Jan 2021 04:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYY6xaZd8L1la0RdrCxBBi8MFeudRKfJTTmLJy2/UR4=;
 b=jTZkJ9JG763oXmPFOTZ7+ieCe7HoQ3hDY0l+M4RBltzHNs6DCPJI2SoNcfq455UDf0
 1UgCz6v5Ny+Dr3vTaKP5bX3xAkdbWqHnfj2o28IW17hDu4VT+HUSOFScGtI6OKhKs+sk
 KcBjFqimeDQ1zmVsr16RXxyi6d/52mGJL2hj9cAcWeayo55wy/vnRs0EIP+Ufe0mfAPb
 hbgStD8EkcNjVvjXoXVesLPLkFW0DKiDQeTiAZbIqw357o+BXJ6QMnPlDBwxxLswQoKB
 jPzC8VZYb26d2Ru0m9zoAU32shkgnctRKoDgP10KS3JALEL/kwl0489iM0Bzd/Gs06Bm
 8aNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYY6xaZd8L1la0RdrCxBBi8MFeudRKfJTTmLJy2/UR4=;
 b=WL1ht4vojP865BPyV2zpvK48eBcu6lAtfP+MVxZ1zDm1owm9CNsINCjBIE21+oI1aL
 Gyag0dcW2VXcOFeDjDALrNrmt6KRkNNSe4zzrHjWvZ7WsQiq1qNkB9qtoDGKR/JaYOuT
 Yp118Ui2I5oHvA3cX9sFzJ4kRJCCzwgGlb1x54sXLf8Sx/tkxhyEsiouQEsyDXNUQktl
 otwOGRdocdQSPu+CSDp3Xe1DcUhHsJ3oYCQyaysDbQbO3PJPVspgoDwcwYemi92iaLIM
 rF0hWbNmqa53CO3fgPp6NwJRIZhpZ3JmDo5zyaRIF9AQDiFS4ExZ9gj9cvC0S7kSY4uX
 hXZg==
X-Gm-Message-State: AOAM532FVp/JHs5BWIRV270Up2JIk98C4thSzbqBgsngqmnro8I6Lj92
 1PYzlx4nraZIDvG399B+A3S8L4lkdwU=
X-Google-Smtp-Source: ABdhPJxwrkFH7q4xmdH6w5N9M2GGE9ktHFNsop0R/PIhWlh79z+TddvbCEaqW6AqzNY0dKgC8MvFyg==
X-Received: by 2002:a17:90a:b118:: with SMTP id
 z24mr21417261pjq.14.1609590328395; 
 Sat, 02 Jan 2021 04:25:28 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-97-30.tpgi.com.au. [193.116.97.30])
 by smtp.gmail.com with ESMTPSA id h4sm58501413pgp.8.2021.01.02.04.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jan 2021 04:25:28 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/21] powerpc: bad_page_fault,
 do_break get registers from regs
Date: Sat,  2 Jan 2021 22:24:51 +1000
Message-Id: <20210102122508.1950592-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210102122508.1950592-1-npiggin@gmail.com>
References: <20210102122508.1950592-1-npiggin@gmail.com>
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

Similar to the previous patch this makes interrupt handler function
types more regular so they can be wrapped with the next patch.

bad_page_fault and do_break are not performance critical.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/bug.h             |  4 ++--
 arch/powerpc/include/asm/debug.h           |  3 +--
 arch/powerpc/kernel/entry_32.S             |  3 +--
 arch/powerpc/kernel/exceptions-64e.S       |  3 +--
 arch/powerpc/kernel/exceptions-64s.S       |  3 +--
 arch/powerpc/kernel/head_8xx.S             |  5 ++---
 arch/powerpc/kernel/process.c              |  7 +++----
 arch/powerpc/kernel/traps.c                |  2 +-
 arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
 arch/powerpc/mm/book3s64/slb.c             |  2 +-
 arch/powerpc/mm/fault.c                    | 10 +++++-----
 arch/powerpc/platforms/8xx/machine_check.c |  2 +-
 12 files changed, 21 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index f7827e993196..4220789b9a97 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -112,8 +112,8 @@
 
 struct pt_regs;
 long do_page_fault(struct pt_regs *);
-extern void bad_page_fault(struct pt_regs *, unsigned long, int);
-void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig);
+void bad_page_fault(struct pt_regs *, int);
+void __bad_page_fault(struct pt_regs *regs, int sig);
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
index a32157ce0551..a94127eed56b 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -673,9 +673,8 @@ handle_page_fault:
 	lwz	r0,_TRAP(r1)
 	clrrwi	r0,r0,1
 	stw	r0,_TRAP(r1)
-	mr	r5,r3
+	mr	r4,r3		/* err arg for bad_page_fault */
 	addi	r3,r1,STACK_FRAME_OVERHEAD
-	lwz	r4,_DAR(r1)
 	bl	__bad_page_fault
 	b	ret_from_except_full
 
diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
index 43e71d86dcbf..52421042a020 100644
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
 	bl	__bad_page_fault
 	b	ret_from_except
 
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index d42ee713a753..19374b7e5073 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -2136,8 +2136,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
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
index 0b2c247cfdff..7869db974185 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -364,10 +364,9 @@ do_databreakpoint:
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
index a66f435dabbf..4f0f81e9420b 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -659,11 +659,10 @@ static void do_break_handler(struct pt_regs *regs)
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
 
@@ -681,7 +680,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
 		do_break_handler(regs);
 
 	/* Deliver the signal to userspace */
-	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
+	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
 }
 #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
 
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3ec7b443fe6b..f3f6af3141ee 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1612,7 +1612,7 @@ void alignment_exception(struct pt_regs *regs)
 	if (user_mode(regs))
 		_exception(sig, regs, code, regs->dar);
 	else
-		bad_page_fault(regs, regs->dar, sig);
+		bad_page_fault(regs, sig);
 
 bail:
 	exception_exit(prev_state);
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 8d014924ee0d..77073a256cff 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1539,7 +1539,7 @@ long do_hash_fault(struct pt_regs *regs)
 	 * the access, or panic if there isn't a handler.
 	 */
 	if (unlikely(in_nmi())) {
-		bad_page_fault(regs, ea, SIGSEGV);
+		bad_page_fault(regs, SIGSEGV);
 		return 0;
 	}
 
@@ -1578,7 +1578,7 @@ long do_hash_fault(struct pt_regs *regs)
 			else
 				_exception(SIGBUS, regs, BUS_ADRERR, ea);
 		} else {
-			bad_page_fault(regs, ea, SIGBUS);
+			bad_page_fault(regs, SIGBUS);
 		}
 		err = 0;
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 985902ce0272..c581548b533f 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -874,7 +874,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
 		if (user_mode(regs))
 			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
 		else
-			bad_page_fault(regs, regs->dar, SIGSEGV);
+			bad_page_fault(regs, SIGSEGV);
 	} else if (err == -EINVAL) {
 		unrecoverable_exception(regs);
 	} else {
diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 0e7f61fa65f9..357236fd43dc 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -568,14 +568,14 @@ static long __do_page_fault(struct pt_regs *regs)
 	/* 32 and 64e handle these errors in asm */
 	if (unlikely(err)) {
 		if (err > 0) {
-			__bad_page_fault(regs, address, err);
+			__bad_page_fault(regs, err);
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
@@ -602,7 +602,7 @@ NOKPROBE_SYMBOL(do_page_fault);
  * It is called from the DSI and ISI handlers in head.S and from some
  * of the procedures in traps.c.
  */
-void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+void __bad_page_fault(struct pt_regs *regs, int sig)
 {
 	int is_write = page_fault_is_write(regs->dsisr);
 
@@ -640,7 +640,7 @@ void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 	die("Kernel access of bad area", regs, sig);
 }
 
-void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
+void bad_page_fault(struct pt_regs *regs, int sig)
 {
 	const struct exception_table_entry *entry;
 
@@ -649,5 +649,5 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
 	if (entry)
 		instruction_pointer_set(regs, extable_fixup(entry));
 	else
-		__bad_page_fault(regs, address, sig);
+		__bad_page_fault(regs, sig);
 }
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

