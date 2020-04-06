Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E6019FD00
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:22:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wzR11L3hzDqRR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 04:22:21 +1000 (AEST)
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
 header.s=mail header.b=fV1b8Ncx; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wzJX1qw4zDqTn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 04:16:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wzJQ6CqTz9tycx;
 Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fV1b8Ncx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9hw_B-RJ_P23; Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wzJQ55Z8z9tycr;
 Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586196998; bh=IiEpFvSoB3koiEnTOLV/VclewqL3EuqtnT4pVQ5GfOo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=fV1b8Ncxt/OpHI+AQaFxlajVcNnrOmAedKD93LtZ7Gde4PHYDiSYV76XKMTUrESIZ
 izWJHvEqHYEZtxuEqwemUj2vOI1OJMFCQDgnQrPiPw7ki089DNJFRceNMLPziJEJ2R
 MgIK+HzyK93JWDwUyi+vtJh0SkF2X9eXf4M1IE84=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C0DA8B784;
 Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a49Ox0B7GlZm; Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 472FA8B775;
 Mon,  6 Apr 2020 20:16:38 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1DDDA656E9; Mon,  6 Apr 2020 18:16:38 +0000 (UTC)
Message-Id: <302a0e88e15ce4569d9619631b36248041d5ed27.1586196948.git.christophe.leroy@c-s.fr>
In-Reply-To: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
References: <5aeaa33383e833f6eca30893fbd188b88e019eaa.1586196948.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v3 02/15] powerpc/radix: Make kuap_check_amr() and
 kuap_restore_amr() generic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon,  6 Apr 2020 18:16:38 +0000 (UTC)
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

In preparation of porting powerpc32 to C syscall entry/exit,
rename kuap_check_amr() and kuap_restore_amr() as kuap_check()
and kuap_restore(), and move the stub for when CONFIG_PPC_KUAP is
not selected in the generic asm/kup.h

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/64/kup-radix.h | 12 ++----------
 arch/powerpc/include/asm/kup.h                 |  2 ++
 arch/powerpc/kernel/syscall_64.c               | 10 +++++-----
 3 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3bcef989a35d..1f2716a0dcd8 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -60,13 +60,13 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-static inline void kuap_restore_amr(struct pt_regs *regs)
+static inline void kuap_restore(struct pt_regs *regs)
 {
 	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
 		mtspr(SPRN_AMR, regs->kuap);
 }
 
-static inline void kuap_check_amr(void)
+static inline void kuap_check(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
@@ -141,14 +141,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
-#else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs)
-{
-}
-
-static inline void kuap_check_amr(void)
-{
-}
 #endif /* CONFIG_PPC_KUAP */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 92bcd1a26d73..1100c13b6d9e 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -62,6 +62,8 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return false;
 }
+static inline void kuap_restore(struct pt_regs *regs) { }
+static inline void kuap_check(void) { }
 #endif /* CONFIG_PPC_KUAP */
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index f021db893ec2..4c46f3aefaf8 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -2,7 +2,7 @@
 
 #include <linux/err.h>
 #include <asm/asm-prototypes.h>
-#include <asm/book3s/64/kup-radix.h>
+#include <asm/kup.h>
 #include <asm/cputime.h>
 #include <asm/hw_irq.h>
 #include <asm/kprobes.h>
@@ -48,7 +48,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	}
 #endif
 
-	kuap_check_amr();
+	kuap_check();
 
 	/*
 	 * This is not required for the syscall exit path, but makes the
@@ -220,7 +220,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	local_paca->tm_scratch = regs->msr;
 #endif
 
-	kuap_check_amr();
+	kuap_check();
 
 	account_cpu_user_exit();
 
@@ -300,7 +300,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	local_paca->tm_scratch = regs->msr;
 #endif
 
-	kuap_check_amr();
+	kuap_check();
 
 	account_cpu_user_exit();
 
@@ -370,7 +370,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
 	 * The value of AMR only matters while we're in the kernel.
 	 */
-	kuap_restore_amr(regs);
+	kuap_restore(regs);
 
 	return ret;
 }
-- 
2.25.0

