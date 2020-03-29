Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF9196C41
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 11:55:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qrYQ6KvYzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 20:55:06 +1100 (AEDT)
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
 header.s=mail header.b=jxacIkuy; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qrFQ4G36zDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 20:41:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qrFH3Dc8z9v0C7;
 Sun, 29 Mar 2020 11:41:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jxacIkuy; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id t__N2wGlMKWx; Sun, 29 Mar 2020 11:41:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qrFH2Bxfz9v0Bs;
 Sun, 29 Mar 2020 11:41:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585474867; bh=e+KzW4oOf+FK+cIVEE9+mxV954O1EsAAZMtwTb2/AiA=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=jxacIkuyms1Ak8FQPSkb7ccErhQGPuliL8+3WJUJlZ6JCTdzMuSOsM+Scusz6cwqr
 /CIF+wWSSFr1FqD8y3ChipdieUyY7ER+PNRqwh5w1yIcP2UrKYGvUfnvYUElsmbsoK
 o3QcWNv/waivv+Wz6ztrrCiNcfXi+4c6KjXoEGWM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 460738B770;
 Sun, 29 Mar 2020 11:41:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fvyO_Ustp_Me; Sun, 29 Mar 2020 11:41:10 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFC458B752;
 Sun, 29 Mar 2020 11:41:09 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9201F65653; Sun, 29 Mar 2020 09:41:09 +0000 (UTC)
Message-Id: <d9fe533be0839d775f0989b0a4825c677adeb8ca.1585474724.git.christophe.leroy@c-s.fr>
In-Reply-To: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
References: <dff05b59a161434a546010507000816750073f28.1585474724.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 09/12] powerpc/32: Blacklist functions running with MMU
 disabled for kprobe
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com
Date: Sun, 29 Mar 2020 09:41:09 +0000 (UTC)
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

kprobe does not handle events happening in real mode, all
functions running with MMU disabled have to be blacklisted.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/cpu_setup_6xx.S | 2 ++
 arch/powerpc/kernel/entry_32.S      | 3 +++
 arch/powerpc/kernel/fpu.S           | 1 +
 arch/powerpc/kernel/idle_6xx.S      | 1 +
 arch/powerpc/kernel/idle_e500.S     | 1 +
 arch/powerpc/kernel/l2cr_6xx.S      | 1 +
 arch/powerpc/kernel/misc.S          | 2 ++
 arch/powerpc/kernel/misc_32.S       | 2 ++
 arch/powerpc/kernel/swsusp_32.S     | 2 ++
 arch/powerpc/kernel/vector.S        | 1 +
 10 files changed, 16 insertions(+)

diff --git a/arch/powerpc/kernel/cpu_setup_6xx.S b/arch/powerpc/kernel/cpu_setup_6xx.S
index f6517f67265a..f8b5ff64b604 100644
--- a/arch/powerpc/kernel/cpu_setup_6xx.S
+++ b/arch/powerpc/kernel/cpu_setup_6xx.S
@@ -288,6 +288,7 @@ _GLOBAL(__init_fpu_registers)
 	mtmsr	r10
 	isync
 	blr
+_ASM_NOKPROBE_SYMBOL(__init_fpu_registers)
 
 
 /* Definitions for the table use to save CPU states */
@@ -483,4 +484,5 @@ _GLOBAL(__restore_cpu_setup)
 1:
 	mtcr	r7
 	blr
+_ASM_NOKPROBE_SYMBOL(__restore_cpu_setup)
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index e652f6506888..94f78c03cb79 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -313,6 +313,7 @@ stack_ovf:
 	mtspr	SPRN_SRR1,r10
 	SYNC
 	RFI
+_ASM_NOKPROBE_SYMBOL(stack_ovf)
 #endif
 
 #ifdef CONFIG_TRACE_IRQFLAGS
@@ -1337,6 +1338,7 @@ nonrecoverable:
 	bl	unrecoverable_exception
 	/* shouldn't return */
 	b	4b
+_ASM_NOKPROBE_SYMBOL(nonrecoverable)
 
 	.section .bss
 	.align	2
@@ -1391,4 +1393,5 @@ _GLOBAL(enter_rtas)
 	mtspr	SPRN_SRR0,r8
 	mtspr	SPRN_SRR1,r9
 	RFI			/* return to caller */
+_ASM_NOKPROBE_SYMBOL(enter_rtas)
 #endif /* CONFIG_PPC_RTAS */
diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 3235a8da6af7..1dfccf58fbb1 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -119,6 +119,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX)
 	/* restore registers and return */
 	/* we haven't used ctr or xer or lr */
 	blr
+_ASM_NOKPROBE_SYMBOL(load_up_fpu)
 
 /*
  * save_fpu(tsk)
diff --git a/arch/powerpc/kernel/idle_6xx.S b/arch/powerpc/kernel/idle_6xx.S
index 433d97bea1f3..69df840f7253 100644
--- a/arch/powerpc/kernel/idle_6xx.S
+++ b/arch/powerpc/kernel/idle_6xx.S
@@ -187,6 +187,7 @@ BEGIN_FTR_SECTION
 	mtspr	SPRN_HID1, r9
 END_FTR_SECTION_IFSET(CPU_FTR_DUAL_PLL_750FX)
 	b	transfer_to_handler_cont
+_ASM_NOKPROBE_SYMBOL(power_save_ppc32_restore)
 
 	.data
 
diff --git a/arch/powerpc/kernel/idle_e500.S b/arch/powerpc/kernel/idle_e500.S
index 308f499e146c..72c85b6f3898 100644
--- a/arch/powerpc/kernel/idle_e500.S
+++ b/arch/powerpc/kernel/idle_e500.S
@@ -90,3 +90,4 @@ _GLOBAL(power_save_ppc32_restore)
 #endif
 
 	b	transfer_to_handler_cont
+_ASM_NOKPROBE_SYMBOL(power_save_ppc32_restore)
diff --git a/arch/powerpc/kernel/l2cr_6xx.S b/arch/powerpc/kernel/l2cr_6xx.S
index 2020d255585f..5f07aa5e9851 100644
--- a/arch/powerpc/kernel/l2cr_6xx.S
+++ b/arch/powerpc/kernel/l2cr_6xx.S
@@ -455,5 +455,6 @@ _GLOBAL(__inval_enable_L1)
 	sync
 
  	blr
+_ASM_NOKPROBE_SYMBOL(__inval_enable_L1)
 
 
diff --git a/arch/powerpc/kernel/misc.S b/arch/powerpc/kernel/misc.S
index 65f9f731c229..5be96feccb55 100644
--- a/arch/powerpc/kernel/misc.S
+++ b/arch/powerpc/kernel/misc.S
@@ -36,6 +36,8 @@ _GLOBAL(add_reloc_offset)
 	add	r3,r3,r5
 	mtlr	r0
 	blr
+_ASM_NOKPROBE_SYMBOL(reloc_offset)
+_ASM_NOKPROBE_SYMBOL(add_reloc_offset)
 
 	.align	3
 2:	PPC_LONG 1b
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index d80212be8698..1edcc41e15fc 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -246,6 +246,7 @@ _GLOBAL(real_readb)
 	sync
 	isync
 	blr
+_ASM_NOKPROBE_SYMBOL(real_readb)
 
 	/*
  * Do an IO access in real mode
@@ -263,6 +264,7 @@ _GLOBAL(real_writeb)
 	sync
 	isync
 	blr
+_ASM_NOKPROBE_SYMBOL(real_writeb)
 
 #endif /* CONFIG_40x */
 
diff --git a/arch/powerpc/kernel/swsusp_32.S b/arch/powerpc/kernel/swsusp_32.S
index cbdf86228eaa..f73f4d72fea4 100644
--- a/arch/powerpc/kernel/swsusp_32.S
+++ b/arch/powerpc/kernel/swsusp_32.S
@@ -395,6 +395,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_USE_HIGH_BATS)
 
 	li	r3,0
 	blr
+_ASM_NOKPROBE_SYMBOL(swsusp_arch_resume)
 
 /* FIXME:This construct is actually not useful since we don't shut
  * down the instruction MMU, we could just flip back MSR-DR on.
@@ -406,4 +407,5 @@ turn_on_mmu:
 	sync
 	isync
 	rfi
+_ASM_NOKPROBE_SYMBOL(turn_on_mmu)
 
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 25c14a0981bf..403ab2c32dc8 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -89,6 +89,7 @@ _GLOBAL(load_up_altivec)
 	REST_32VRS(0,r4,r6)
 	/* restore registers and return */
 	blr
+_ASM_NOKPROBE_SYMBOL(load_up_altivec)
 
 /*
  * save_altivec(tsk)
-- 
2.25.0

