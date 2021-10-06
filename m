Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3A6423E37
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 14:53:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPZBW34dHz3cPQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 23:53:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPZ5T6wPLz3bXj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Oct 2021 23:49:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HPZ4Z2LSkz9sWQ;
 Wed,  6 Oct 2021 14:48:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id setPSWLfFZc9; Wed,  6 Oct 2021 14:48:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HPZ4M4vcjz9sWC;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 901908B77D;
 Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id E5TWhw1HXxTe; Wed,  6 Oct 2021 14:48:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.229])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A42FA8B78C;
 Wed,  6 Oct 2021 14:48:02 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 196Clpps579416
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Wed, 6 Oct 2021 14:47:52 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 196ChscP579288;
 Wed, 6 Oct 2021 14:43:54 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 08/15] powerpc/config: Add CONFIG_BOOKE_OR_40x
Date: Wed,  6 Oct 2021 14:43:41 +0200
Message-Id: <0aaa53ec80e036aa6505ce967c6a50ef476b5d23.1633523837.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633523837.git.christophe.leroy@csgroup.eu>
References: <cover.1633523837.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have many functionnalities common to 40x and BOOKE, it leads to
many places with #if defined(CONFIG_BOOKE) || defined(CONFIG_40x).

We are going to add a few more with KUAP for booke/40x, so create
a new symbol which is defined when either BOOKE or 40x is defined.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h      | 8 ++++----
 arch/powerpc/include/asm/irq.h         | 2 +-
 arch/powerpc/include/asm/ptrace.h      | 2 +-
 arch/powerpc/include/asm/reg.h         | 4 ++--
 arch/powerpc/kernel/asm-offsets.c      | 2 +-
 arch/powerpc/kernel/entry_32.S         | 2 +-
 arch/powerpc/kernel/irq.c              | 2 +-
 arch/powerpc/kernel/kgdb.c             | 4 ++--
 arch/powerpc/kernel/setup.h            | 2 +-
 arch/powerpc/kernel/setup_32.c         | 2 +-
 arch/powerpc/kernel/time.c             | 2 +-
 arch/powerpc/platforms/Kconfig.cputype | 5 +++++
 12 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 21cc571ea9c2..276e9dd7348b 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -61,7 +61,7 @@
 
 static inline void __hard_irq_enable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
+	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
 		wrtee(MSR_EE);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		wrtspr(SPRN_EIE);
@@ -73,7 +73,7 @@ static inline void __hard_irq_enable(void)
 
 static inline void __hard_irq_disable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
+	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
 		wrtee(0);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		wrtspr(SPRN_EID);
@@ -85,7 +85,7 @@ static inline void __hard_irq_disable(void)
 
 static inline void __hard_EE_RI_disable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
+	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
 		wrtee(0);
 	else if (IS_ENABLED(CONFIG_PPC_8xx))
 		wrtspr(SPRN_NRI);
@@ -97,7 +97,7 @@ static inline void __hard_EE_RI_disable(void)
 
 static inline void __hard_RI_enable(void)
 {
-	if (IS_ENABLED(CONFIG_BOOKE) || IS_ENABLED(CONFIG_40x))
+	if (IS_ENABLED(CONFIG_BOOKE_OR_40x))
 		return;
 
 	if (IS_ENABLED(CONFIG_PPC_8xx))
diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
index 2b3278534bc1..13f0409dd617 100644
--- a/arch/powerpc/include/asm/irq.h
+++ b/arch/powerpc/include/asm/irq.h
@@ -36,7 +36,7 @@ extern int distribute_irqs;
 
 struct pt_regs;
 
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 /*
  * Per-cpu stacks for handling critical, debug and machine check
  * level interrupts.
diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 6e560f035614..42f89e2d8f04 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -291,7 +291,7 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 
 static inline bool cpu_has_msr_ri(void)
 {
-	return !IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x);
+	return !IS_ENABLED(CONFIG_BOOKE_OR_40x);
 }
 
 static inline bool regs_is_unrecoverable(struct pt_regs *regs)
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index e9d27265253b..50478738c8f1 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -18,9 +18,9 @@
 #include <asm/feature-fixups.h>
 
 /* Pickup Book E specific registers. */
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 #include <asm/reg_booke.h>
-#endif /* CONFIG_BOOKE || CONFIG_40x */
+#endif
 
 #ifdef CONFIG_FSL_EMB_PERFMON
 #include <asm/reg_fsl_emb.h>
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index e563d3222d69..cf4a94891bd0 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -56,7 +56,7 @@
 #endif
 
 #ifdef CONFIG_PPC32
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 #include "head_booke.h"
 #endif
 #endif
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 9d31ba2af901..df01da3ca3fa 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -108,7 +108,7 @@ transfer_to_syscall:
 	stw	r11, 0(r1)
 	mflr	r12
 	stw	r12, _LINK(r1)
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #endif
 	lis	r12,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index 551b653228c4..2eb94427d271 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -805,7 +805,7 @@ void __init init_IRQ(void)
 		ppc_md.init_IRQ();
 }
 
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 void   *critirq_ctx[NR_CPUS] __read_mostly;
 void    *dbgirq_ctx[NR_CPUS] __read_mostly;
 void *mcheckirq_ctx[NR_CPUS] __read_mostly;
diff --git a/arch/powerpc/kernel/kgdb.c b/arch/powerpc/kernel/kgdb.c
index bdee7262c080..9f8d0fa7b718 100644
--- a/arch/powerpc/kernel/kgdb.c
+++ b/arch/powerpc/kernel/kgdb.c
@@ -48,7 +48,7 @@ static struct hard_trap_info
 	{ 0x0800, 0x08 /* SIGFPE */  },		/* fp unavailable */
 	{ 0x0900, 0x0e /* SIGALRM */ },		/* decrementer */
 	{ 0x0c00, 0x14 /* SIGCHLD */ },		/* system call */
-#if defined(CONFIG_40x) || defined(CONFIG_BOOKE)
+#ifdef CONFIG_BOOKE_OR_40x
 	{ 0x2002, 0x05 /* SIGTRAP */ },		/* debug */
 #if defined(CONFIG_FSL_BOOKE)
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* spe unavailable */
@@ -67,7 +67,7 @@ static struct hard_trap_info
 	{ 0x2010, 0x08 /* SIGFPE */  },		/* fp unavailable */
 	{ 0x2020, 0x08 /* SIGFPE */  },		/* ap unavailable */
 #endif
-#else /* ! (defined(CONFIG_40x) || defined(CONFIG_BOOKE)) */
+#else /* !CONFIG_BOOKE_OR_40x */
 	{ 0x0d00, 0x05 /* SIGTRAP */ },		/* single-step */
 #if defined(CONFIG_PPC_8xx)
 	{ 0x1000, 0x04 /* SIGILL */  },		/* software emulation */
diff --git a/arch/powerpc/kernel/setup.h b/arch/powerpc/kernel/setup.h
index 84058bbc8fe9..93f22da12abe 100644
--- a/arch/powerpc/kernel/setup.h
+++ b/arch/powerpc/kernel/setup.h
@@ -29,7 +29,7 @@ void setup_tlb_core_data(void);
 static inline void setup_tlb_core_data(void) { }
 #endif
 
-#if defined(CONFIG_PPC_BOOK3E) || defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 void exc_lvl_early_init(void);
 #else
 static inline void exc_lvl_early_init(void) { }
diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_32.c
index 7ec5c47fce0e..15e7386584f9 100644
--- a/arch/powerpc/kernel/setup_32.c
+++ b/arch/powerpc/kernel/setup_32.c
@@ -175,7 +175,7 @@ void __init emergency_stack_init(void)
 }
 #endif
 
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 void __init exc_lvl_early_init(void)
 {
 	unsigned int i, hw_cpu;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 934d8ae66cc6..f7bb2866a1c4 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -738,7 +738,7 @@ static int __init get_freq(char *name, int cells, unsigned long *val)
 
 static void start_cpu_decrementer(void)
 {
-#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_OR_40x
 	unsigned int tcr;
 
 	/* Clear any pending timer interrupts */
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..dce1cf31047b 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -278,6 +278,11 @@ config BOOKE
 	depends on E500 || 44x || PPC_BOOK3E
 	default y
 
+config BOOKE_OR_40x
+	bool
+	depends on BOOKE || 40x
+	default y
+
 config FSL_BOOKE
 	bool
 	depends on E500 && PPC32
-- 
2.31.1

