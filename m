Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC9380A40
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 15:15:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhTXn6qbrz3bsW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 23:15:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhTXM6LTcz2xZh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 23:14:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FhTXG3rqlz9scF;
 Fri, 14 May 2021 15:14:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Oyp1Hn-2RozU; Fri, 14 May 2021 15:14:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FhTXG2gThz9sc8;
 Fri, 14 May 2021 15:14:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E13CC8B7FA;
 Fri, 14 May 2021 15:14:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6k6HjmO-OR8H; Fri, 14 May 2021 15:14:53 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9454C8B7F8;
 Fri, 14 May 2021 15:14:53 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6DF49641C0; Fri, 14 May 2021 13:14:53 +0000 (UTC)
Message-Id: <8ab21fd93d6e0047aa71e6509e5e312f14b2991b.1620998075.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: Don't handle ALTIVEC/SPE in ASM in _switch(). Do it
 in C.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 14 May 2021 13:14:53 +0000 (UTC)
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

_switch() saves and restores ALTIVEC and SPE status.
For altivec this is redundant with what __switch_to() does with
save_sprs() and restore_sprs() and giveup_all() before
calling _switch().

Add support for SPI in save_sprs() and restore_sprs() and
remove things from _switch().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/asm-offsets.c |  2 --
 arch/powerpc/kernel/entry_32.S    | 35 -------------------------------
 arch/powerpc/kernel/process.c     |  9 ++++++++
 3 files changed, 9 insertions(+), 37 deletions(-)

diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 28af4efb4587..5573da9a20d1 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -119,7 +119,6 @@ int main(void)
 #ifdef CONFIG_ALTIVEC
 	OFFSET(THREAD_VRSTATE, thread_struct, vr_state.vr);
 	OFFSET(THREAD_VRSAVEAREA, thread_struct, vr_save_area);
-	OFFSET(THREAD_VRSAVE, thread_struct, vrsave);
 	OFFSET(THREAD_USED_VR, thread_struct, used_vr);
 	OFFSET(VRSTATE_VSCR, thread_vr_state, vscr);
 	OFFSET(THREAD_LOAD_VEC, thread_struct, load_vec);
@@ -150,7 +149,6 @@ int main(void)
 #ifdef CONFIG_SPE
 	OFFSET(THREAD_EVR0, thread_struct, evr[0]);
 	OFFSET(THREAD_ACC, thread_struct, acc);
-	OFFSET(THREAD_SPEFSCR, thread_struct, spefscr);
 	OFFSET(THREAD_USED_SPE, thread_struct, used_spe);
 #endif /* CONFIG_SPE */
 #endif /* CONFIG_PPC64 */
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 9160285cb2f4..6c09ebb853ec 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -176,28 +176,6 @@ _GLOBAL(_switch)
 	/* r3-r12 are caller saved -- Cort */
 	SAVE_NVGPRS(r1)
 	stw	r0,_NIP(r1)	/* Return to switch caller */
-	mfmsr	r11
-	li	r0,MSR_FP	/* Disable floating-point */
-#ifdef CONFIG_ALTIVEC
-BEGIN_FTR_SECTION
-	oris	r0,r0,MSR_VEC@h	/* Disable altivec */
-	mfspr	r12,SPRN_VRSAVE	/* save vrsave register value */
-	stw	r12,THREAD+THREAD_VRSAVE(r2)
-END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
-#endif /* CONFIG_ALTIVEC */
-#ifdef CONFIG_SPE
-BEGIN_FTR_SECTION
-	oris	r0,r0,MSR_SPE@h	 /* Disable SPE */
-	mfspr	r12,SPRN_SPEFSCR /* save spefscr register value */
-	stw	r12,THREAD+THREAD_SPEFSCR(r2)
-END_FTR_SECTION_IFSET(CPU_FTR_SPE)
-#endif /* CONFIG_SPE */
-	and.	r0,r0,r11	/* FP or altivec or SPE enabled? */
-	beq+	1f
-	andc	r11,r11,r0
-	mtmsr	r11
-	isync
-1:	stw	r11,_MSR(r1)
 	mfcr	r10
 	stw	r10,_CCR(r1)
 	stw	r1,KSP(r3)	/* Set old stack pointer */
@@ -218,19 +196,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPE)
 	mr	r3,r2
 	addi	r2,r4,-THREAD	/* Update current */
 
-#ifdef CONFIG_ALTIVEC
-BEGIN_FTR_SECTION
-	lwz	r0,THREAD+THREAD_VRSAVE(r2)
-	mtspr	SPRN_VRSAVE,r0		/* if G4, restore VRSAVE reg */
-END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
-#endif /* CONFIG_ALTIVEC */
-#ifdef CONFIG_SPE
-BEGIN_FTR_SECTION
-	lwz	r0,THREAD+THREAD_SPEFSCR(r2)
-	mtspr	SPRN_SPEFSCR,r0		/* restore SPEFSCR reg */
-END_FTR_SECTION_IFSET(CPU_FTR_SPE)
-#endif /* CONFIG_SPE */
-
 	lwz	r0,_CCR(r1)
 	mtcrf	0xFF,r0
 	/* r3-r12 are destroyed -- Cort */
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 89e34aa273e2..2bd30acc843c 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1129,6 +1129,10 @@ static inline void save_sprs(struct thread_struct *t)
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		t->vrsave = mfspr(SPRN_VRSAVE);
 #endif
+#ifdef CONFIG_SPE
+	if (cpu_has_feature(CPU_FTR_SPE))
+		t->spefscr = mfspr(SPRN_SPEFSCR);
+#endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_DSCR))
 		t->dscr = mfspr(SPRN_DSCR);
@@ -1159,6 +1163,11 @@ static inline void restore_sprs(struct thread_struct *old_thread,
 	    old_thread->vrsave != new_thread->vrsave)
 		mtspr(SPRN_VRSAVE, new_thread->vrsave);
 #endif
+#ifdef CONFIG_SPE
+	if (cpu_has_feature(CPU_FTR_SPE) &&
+	    old_thread->spefscr != new_thread->spefscr)
+		mtspr(SPRN_SPEFSCR, new_thread->spefscr);
+#endif
 #ifdef CONFIG_PPC_BOOK3S_64
 	if (cpu_has_feature(CPU_FTR_DSCR)) {
 		u64 dscr = get_paca()->dscr_default;
-- 
2.25.0

