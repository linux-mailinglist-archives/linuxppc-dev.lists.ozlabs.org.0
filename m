Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B013F4693
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 10:26:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtQLd65KPz2xt1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 18:26:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtQKK2g3jz2xsy
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 18:25:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GtQK81v0fz9sXb;
 Mon, 23 Aug 2021 10:25:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPP2dR354uWs; Mon, 23 Aug 2021 10:25:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GtQJR32Q2z9sXh;
 Mon, 23 Aug 2021 10:24:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FA368B78C;
 Mon, 23 Aug 2021 10:24:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OhfLtcBfgmMl; Mon, 23 Aug 2021 10:24:23 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 112D78B780;
 Mon, 23 Aug 2021 10:24:23 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F04B06BC75; Mon, 23 Aug 2021 08:24:22 +0000 (UTC)
Message-Id: <627ead32d40c840f9e8a329b60647b649eceb2aa.1629707037.git.christophe.leroy@csgroup.eu>
In-Reply-To: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
References: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629707037.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 3/3] powerpc: Define and use MSR_RI only on non booke/40x
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Mon, 23 Aug 2021 08:24:22 +0000 (UTC)
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

40x and BOOKE don't have MSR_RI.

Define MSR_RI only for platforms where it exists. For the other ones,
defines it as BUILD_BUG for C and do not define it for ASM.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Fixes kvm_emul.S and include <linux/bug.h> in <asm/reg.h>
---
 arch/powerpc/include/asm/reg.h       |  5 +++++
 arch/powerpc/include/asm/reg_booke.h |  6 +++---
 arch/powerpc/kernel/head_32.h        |  4 ++++
 arch/powerpc/kernel/kvm_emul.S       | 13 +++++++++++++
 arch/powerpc/kernel/process.c        |  2 +-
 arch/powerpc/lib/sstep.c             |  2 +-
 6 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index be85cf156a1f..b270b570fb51 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -109,7 +109,12 @@
 #ifndef MSR_PMM
 #define MSR_PMM		__MASK(MSR_PMM_LG)	/* Performance monitor */
 #endif
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_40x)
 #define MSR_RI		__MASK(MSR_RI_LG)	/* Recoverable Exception */
+#elif !defined(__ASSEMBLY__)
+#include <linux/bug.h>
+#define MSR_RI		({BUILD_BUG(); 0; })
+#endif
 #define MSR_LE		__MASK(MSR_LE_LG)	/* Little Endian */
 
 #define MSR_TM		__MASK(MSR_TM_LG)	/* Transactional Mem Available */
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index 17b8dcd9a40d..6f40a8420ad0 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -38,15 +38,15 @@
 #if defined(CONFIG_PPC_BOOK3E_64)
 #define MSR_64BIT	MSR_CM
 
-#define MSR_		(MSR_ME | MSR_RI | MSR_CE)
+#define MSR_		(MSR_ME | MSR_CE)
 #define MSR_KERNEL	(MSR_ | MSR_64BIT)
 #define MSR_USER32	(MSR_ | MSR_PR | MSR_EE)
 #define MSR_USER64	(MSR_USER32 | MSR_64BIT)
 #elif defined (CONFIG_40x)
-#define MSR_KERNEL	(MSR_ME|MSR_RI|MSR_IR|MSR_DR|MSR_CE)
+#define MSR_KERNEL	(MSR_ME|MSR_IR|MSR_DR|MSR_CE)
 #define MSR_USER	(MSR_KERNEL|MSR_PR|MSR_EE)
 #else
-#define MSR_KERNEL	(MSR_ME|MSR_RI|MSR_CE)
+#define MSR_KERNEL	(MSR_ME|MSR_CE)
 #define MSR_USER	(MSR_KERNEL|MSR_PR|MSR_EE)
 #endif
 
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 6b1ec9e3541b..6c5f4183dc8e 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -63,7 +63,11 @@
 	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
 	.endif
 #endif
+#ifdef CONFIG_40x
+	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL) /* re-enable MMU */
+#else
 	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~MSR_RI) /* re-enable MMU */
+#endif
 	mtspr	SPRN_SRR1, r11
 	lis	r11, 1f@h
 	ori	r11, r11, 1f@l
diff --git a/arch/powerpc/kernel/kvm_emul.S b/arch/powerpc/kernel/kvm_emul.S
index 7af6f8b50c5d..6a8073c2082b 100644
--- a/arch/powerpc/kernel/kvm_emul.S
+++ b/arch/powerpc/kernel/kvm_emul.S
@@ -56,14 +56,23 @@ kvm_emulate_mtmsrd:
 
 	/* Put MSR & ~(MSR_EE|MSR_RI) in r31 */
 	LL64(r31, KVM_MAGIC_PAGE + KVM_MAGIC_MSR, 0)
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_40x)
 	lis	r30, (~(MSR_EE | MSR_RI))@h
 	ori	r30, r30, (~(MSR_EE | MSR_RI))@l
+#else
+	lis	r30, (~MSR_EE)@h
+	ori	r30, r30, (~MSR_EE)@l
+#endif
 	and	r31, r31, r30
 
 	/* OR the register's (MSR_EE|MSR_RI) on MSR */
 kvm_emulate_mtmsrd_reg:
 	ori	r30, r0, 0
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_40x)
 	andi.	r30, r30, (MSR_EE|MSR_RI)
+#else
+	andi.	r30, r30, (MSR_EE)
+#endif
 	or	r31, r31, r30
 
 	/* Put MSR back into magic page */
@@ -112,7 +121,11 @@ kvm_emulate_mtmsrd_len:
 	.long (kvm_emulate_mtmsrd_end - kvm_emulate_mtmsrd) / 4
 
 
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_40x)
 #define MSR_SAFE_BITS (MSR_EE | MSR_RI)
+#else
+#define MSR_SAFE_BITS (MSR_EE)
+#endif
 #define MSR_CRITICAL_BITS ~MSR_SAFE_BITS
 
 .global kvm_emulate_mtmsr
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 185beb290580..5ba72e31de28 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1420,7 +1420,7 @@ static struct regbit msr_bits[] = {
 	{MSR_IR,	"IR"},
 	{MSR_DR,	"DR"},
 	{MSR_PMM,	"PMM"},
-#ifndef CONFIG_BOOKE
+#if !defined(CONFIG_BOOKE) && !defined(CONFIG_40x)
 	{MSR_RI,	"RI"},
 	{MSR_LE,	"LE"},
 #endif
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index d8d5f901cee1..357cc1fb4f67 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3559,7 +3559,7 @@ int emulate_step(struct pt_regs *regs, struct ppc_inst instr)
 
 	case MTMSR:
 		val = regs->gpr[op.reg];
-		if ((val & MSR_RI) == 0)
+		if (cpu_has_msr_ri() && (val & MSR_RI) == 0)
 			/* can't step mtmsr[d] that would clear MSR_RI */
 			return -1;
 		/* here op.val is the mask of bits to change */
-- 
2.25.0

