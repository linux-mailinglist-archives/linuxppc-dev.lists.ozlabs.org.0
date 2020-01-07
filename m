Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D107132080
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 08:32:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sPGj3WgjzDqJj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 18:32:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HyU5lIH/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sPDn4W5fzDqJT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 18:30:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 47sPDc1PwXz9v0p1;
 Tue,  7 Jan 2020 08:30:40 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HyU5lIH/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id P9fTkc6DRsU6; Tue,  7 Jan 2020 08:30:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47sPDc06yVz9v0p0;
 Tue,  7 Jan 2020 08:30:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1578382240; bh=rWR96XmFfmb+CjVNvWtMBMF2Xc9wukNsYBTVVq1xWS4=;
 h=From:Subject:To:Cc:Date:From;
 b=HyU5lIH/D3fEj43JD9T09WE+nfS52NpEUIYUvwTllhTtRVOLaj6Twrr54Cs7aQEzJ
 9yPPe0pBzjz/F4lV2LJVtf6aiJjfo7tO2rjAIWbBCemGj42OdsOuoChMXcHTnoUSh/
 6ykyfIQCbRDFkpnhC6T7sScgfhWgz58iXbv9WMuc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB8008B7BE;
 Tue,  7 Jan 2020 08:30:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UhdJ8-51NQ94; Tue,  7 Jan 2020 08:30:40 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A97EB8B797;
 Tue,  7 Jan 2020 08:30:40 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E85DD63805; Tue,  7 Jan 2020 07:30:39 +0000 (UTC)
Message-Id: <d63907761298a34d2e92fb0f1c2c77dc9716b9c7.1578382229.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/32: warn and return error on syscalls from kernel
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  7 Jan 2020 07:30:39 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit b86fb88855ea ("powerpc/32: implement fast entry for
syscalls on non BOOKE") and commit 1a4b739bbb4f ("powerpc/32:
implement fast entry for syscalls on BOOKE"), syscalls from
kernel are unexpected and can have catastrophic consequences
as it will destroy the kernel stack.

Test MSR_PR on syscall entry. In case syscall is from kernel,
emit a warning and return ENOSYS error.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S   | 26 ++++++++++++++++++++++++++
 arch/powerpc/kernel/head_32.h    |  9 ++++++---
 arch/powerpc/kernel/head_booke.h |  5 ++++-
 3 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index d60908ea37fb..4a7cd22a8aaf 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -568,6 +568,32 @@ syscall_exit_work:
 	bl	do_syscall_trace_leave
 	b	ret_from_except_full
 
+	/*
+	 * System call was called from kernel. We get here with SRR1 in r9.
+	 * Mark the exception as recoverable once we have retrieved SRR0,
+	 * trap a warning and return ENOSYS with CR[SO] set.
+	 */
+	.globl	ret_from_kernel_syscall
+ret_from_kernel_syscall:
+	mfspr	r11, SPRN_SRR0
+#if !defined(CONFIG_4xx) && !defined(CONFIG_BOOKE)
+	LOAD_REG_IMMEDIATE(r12, MSR_KERNEL & ~(MSR_IR|MSR_DR))
+	MTMSRD(r12)
+#endif
+
+0:	trap
+	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
+
+	li	r3, ENOSYS
+	crset	so
+#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
+	mtspr	SPRN_NRI, r0
+#endif
+	mtspr	SPRN_SRR1, r9
+	mtspr	SPRN_SRR0, r11
+	SYNC
+	RFI
+
 /*
  * The fork/clone functions need to copy the full register set into
  * the child process. Therefore we need to save all the nonvolatile
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 8abc7783dbe5..07524be96ca7 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -62,16 +62,18 @@
 
 .macro SYSCALL_ENTRY trapno
 	mfspr	r12,SPRN_SPRG_THREAD
+	mfspr	r9, SPRN_SRR1
 	mfcr	r10
+	andi.	r11, r9, MSR_PR
 	lwz	r11,TASK_STACK-THREAD(r12)
-	mflr	r9
+	beq-	99f
 	addi	r11,r11,THREAD_SIZE - INT_FRAME_SIZE
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	tophys(r11,r11)
 	stw	r10,_CCR(r11)		/* save registers */
+	mflr	r10
+	stw	r10, _LINK(r11)
 	mfspr	r10,SPRN_SRR0
-	stw	r9,_LINK(r11)
-	mfspr	r9,SPRN_SRR1
 	stw	r1,GPR1(r11)
 	stw	r1,0(r11)
 	tovirt(r1,r11)			/* set new kernel sp */
@@ -139,6 +141,7 @@
 	mtspr	SPRN_SRR0,r11
 	SYNC
 	RFI				/* jump to handler, enable MMU */
+99:	b	ret_from_kernel_syscall
 .endm
 
 /*
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 2ae635df9026..f2d11cb8102f 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -104,16 +104,18 @@ FTR_SECTION_ELSE
 #ifdef CONFIG_KVM_BOOKE_HV
 ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 #endif
+	mfspr	r9, SPRN_SRR1
 	BOOKE_CLEAR_BTB(r11)
+	andi.	r11, r9, MSR_PR
 	lwz	r11, TASK_STACK - THREAD(r10)
 	rlwinm	r12,r12,0,4,2	/* Clear SO bit in CR */
+	beq-	99f
 	ALLOC_STACK_FRAME(r11, THREAD_SIZE - INT_FRAME_SIZE)
 	stw	r12, _CCR(r11)		/* save various registers */
 	mflr	r12
 	stw	r12,_LINK(r11)
 	mfspr	r12,SPRN_SRR0
 	stw	r1, GPR1(r11)
-	mfspr	r9,SPRN_SRR1
 	stw	r1, 0(r11)
 	mr	r1, r11
 	stw	r12,_NIP(r11)
@@ -176,6 +178,7 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	mtspr	SPRN_SRR0,r11
 	SYNC
 	RFI				/* jump to handler, enable MMU */
+99:	b	ret_from_kernel_syscall
 .endm
 
 /* To handle the additional exception priority levels on 40x and Book-E
-- 
2.13.3

