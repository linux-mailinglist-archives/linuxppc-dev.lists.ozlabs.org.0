Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1324451E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 08:56:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSZ3q4yxgzDql0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 16:56:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSZ1s3GsmzDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 16:54:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BSZ1j1yYnz9vCyN;
 Fri, 14 Aug 2020 08:54:49 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qGKPnju1W714; Fri, 14 Aug 2020 08:54:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BSZ1j0Zcfz9vCyL;
 Fri, 14 Aug 2020 08:54:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 107E78B775;
 Fri, 14 Aug 2020 08:54:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hUoAsqHWv_6E; Fri, 14 Aug 2020 08:54:49 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C09D08B767;
 Fri, 14 Aug 2020 08:54:49 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9A99E65C93; Fri, 14 Aug 2020 06:54:49 +0000 (UTC)
Message-Id: <c2d2b8dfb8dd677026b26dffc8d31070c38a6b89.1597388079.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] powerpc: Drop _nmask_and_or_msr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 14 Aug 2020 06:54:49 +0000 (UTC)
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

_nmask_and_or_msr() is only used at two places to set MSR_IP.

The SYNC is unnecessary as the users are not PowerPC 601.

Can be easily writen in C.

Do it, and drop _nmask_and_or_msr()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Removed the prototype in asm/processor.h
---
 arch/powerpc/include/asm/processor.h              |  1 -
 arch/powerpc/kernel/misc_32.S                     | 13 -------------
 arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c |  3 ++-
 arch/powerpc/platforms/embedded6xx/storcenter.c   |  3 ++-
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..5f6b3ee84dd1 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -441,7 +441,6 @@ extern void poweroff_now(void);
 extern int fix_alignment(struct pt_regs *);
 extern void cvt_fd(float *from, double *to);
 extern void cvt_df(double *from, float *to);
-extern void _nmask_and_or_msr(unsigned long nmask, unsigned long or_val);
 
 #ifdef CONFIG_PPC64
 /*
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index b24f866fef81..8d9cb5df580e 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -215,19 +215,6 @@ _GLOBAL(low_choose_7447a_dfs)
 
 #endif /* CONFIG_CPU_FREQ_PMAC && CONFIG_PPC_BOOK3S_32 */
 
-/*
- * complement mask on the msr then "or" some values on.
- *     _nmask_and_or_msr(nmask, value_to_or)
- */
-_GLOBAL(_nmask_and_or_msr)
-	mfmsr	r0		/* Get current msr */
-	andc	r0,r0,r3	/* And off the bits set in r3 (first parm) */
-	or	r0,r0,r4	/* Or on the bits in r4 (second parm) */
-	SYNC			/* Some chip revs have problems here... */
-	mtmsr	r0		/* Update machine state */
-	isync
-	blr			/* Done */
-
 #ifdef CONFIG_40x
 
 /*
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index 15437abe1f6d..b95c3380d2b5 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -147,7 +147,8 @@ static void __noreturn mpc7448_hpc2_restart(char *cmd)
 	local_irq_disable();
 
 	/* Set exception prefix high - to the firmware */
-	_nmask_and_or_msr(0, MSR_IP);
+	mtmsr(mfmsr() | MSR_IP);
+	isync();
 
 	for (;;) ;		/* Spin until reset happens */
 }
diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/powerpc/platforms/embedded6xx/storcenter.c
index ed1914dd34bb..e346ddcef45e 100644
--- a/arch/powerpc/platforms/embedded6xx/storcenter.c
+++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
@@ -101,7 +101,8 @@ static void __noreturn storcenter_restart(char *cmd)
 	local_irq_disable();
 
 	/* Set exception prefix high - to the firmware */
-	_nmask_and_or_msr(0, MSR_IP);
+	mtmsr(mfmsr() | MSR_IP);
+	isync();
 
 	/* Wait for reset to happen */
 	for (;;) ;
-- 
2.25.0

