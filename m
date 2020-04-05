Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F55E19ED46
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:06:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wM6n0zqjzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 04:06:09 +1000 (AEST)
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
 header.s=mail header.b=wcWUomYD; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wLfC0Yq4zDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 03:44:51 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wLf44C2mz9ty3M;
 Sun,  5 Apr 2020 19:44:44 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wcWUomYD; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KpjL9PWw_sEu; Sun,  5 Apr 2020 19:44:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wLf43CLGz9ty2y;
 Sun,  5 Apr 2020 19:44:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586108684; bh=T0suTl0BTFRF4sRPMYUbza6cd6VMEsnPiv6JirSP2TU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=wcWUomYDP4YBUNujKfSRL3CNdHHtW+kAxTbIGTyQUeScsOPW7ib9w7RzyvnI60Qy1
 546mp/M2lLdLWI59hclvoGT95/95o4w9FWUgdeBidgn1layLgBEIZf5jG97QxvRors
 tfIDSmN3c3LCSojh6wkRBRc+S77Pl3XE2AZuCXS4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 002E08B783;
 Sun,  5 Apr 2020 19:44:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id D4F0wqvJboPq; Sun,  5 Apr 2020 19:44:47 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB95B8B774;
 Sun,  5 Apr 2020 19:44:47 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 8DBB16571C; Sun,  5 Apr 2020 17:44:47 +0000 (UTC)
Message-Id: <4ef6d617cfd34e09e9bf5a456b2e0b6d2a8a3c96.1586108649.git.christophe.leroy@c-s.fr>
In-Reply-To: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
References: <029e1064b1ad738785718221ea468c9cfc282457.1586108649.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 12/13] powerpc/kernel: Do not inconditionally save non
 volatile registers on system call
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Sun,  5 Apr 2020 17:44:47 +0000 (UTC)
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

Before : 347 cycles on null_syscall
After  : 327 cycles on null_syscall

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/entry_32.S | 15 +++++++++++++++
 arch/powerpc/kernel/head_32.h  |  3 +--
 arch/powerpc/kernel/syscall.c  |  2 +-
 3 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 103f5158bc44..b5113593e57f 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -315,13 +315,28 @@ stack_ovf:
 	RFI
 #endif
 
+save_nvgprs:
+	lwz	r11, _TRAP(r1)
+	andi.	r12, r11, 1
+	rlwinm	r11, r11, 0, ~1
+	beqlr
+	SAVE_NVGPRS(r1)
+	stw	r11, _TRAP(r1)
+	blr
+
 	.globl	transfer_to_syscall
 transfer_to_syscall:
+	lwz     r10, TI_FLAGS(r2)
 	mr	r9, r0
+	andi.   r10, r10, _TIF_SYSCALL_DOTRACE
 	addi	r10, r1, STACK_FRAME_OVERHEAD
+	bnel-	save_nvgprs
 	bl	system_call_exception
 ret_from_syscall:
+	lwz     r9, TI_FLAGS(r2)
 	addi    r4, r1, STACK_FRAME_OVERHEAD
+	andi.   r0, r9, _TIF_SYSCALL_DOTRACE | _TIF_SINGLESTEP | _TIF_USER_WORK_MASK
+	bnel-	save_nvgprs
 	bl	syscall_exit_prepare
 	lwz	r2, _CCR(r1)
 	lwz	r4, _NIP(r1)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index c301d666a3e5..1cc9a67cb42c 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -174,13 +174,12 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
-	li	r2, \trapno
+	li	r2, \trapno + 1
 	stw	r10,8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
-	SAVE_NVGPRS(r11)
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
index 630c423e089a..34fd66fd11a2 100644
--- a/arch/powerpc/kernel/syscall.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -39,7 +39,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (!IS_ENABLED(CONFIG_PPC_BOOK3E))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(IS_ENABLED(CONFIG_PPC64) && !(regs->msr & MSR_PR));
-	BUG_ON(!FULL_REGS(regs));
+	BUG_ON(IS_ENABLED(CONFIG_PPC64) && !FULL_REGS(regs));
 #ifdef CONFIG_PPC64
 	BUG_ON(regs->softe != IRQS_ENABLED);
 #endif
-- 
2.25.0

