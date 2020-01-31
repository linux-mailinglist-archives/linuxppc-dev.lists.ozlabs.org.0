Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEEB14EBCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 12:39:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488Fc50slQzDqkR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 22:39:01 +1100 (AEDT)
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
 header.s=mail header.b=clm+XzCS; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 488FWS23FlzDqcm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 22:34:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 488FWL525lz9vC1X;
 Fri, 31 Jan 2020 12:34:54 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=clm+XzCS; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jNDoE3A0nZUQ; Fri, 31 Jan 2020 12:34:54 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 488FWL3lsdz9vBmg;
 Fri, 31 Jan 2020 12:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580470494; bh=wgA/1ZcqwSEzUHK1JtMA0psJaDNeimySFc6/6RjLVLc=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=clm+XzCSi/3KYcuFK9rMoOWP/NH2C6asEeFiNaZTK8J5vQz0PUp6Z5gMOdOHOcPsv
 nXOOsrHjMEkqofNzbDR1aCg6duMEIPwCz1IiLUTKrRi0mcWpuIZleOiUn9lru30v24
 9xDny7GAX2ZuTiIS3RXil7ZbCL5B4DTnqXhyB/Vo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B99C08B89E;
 Fri, 31 Jan 2020 12:34:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gqSnyzvlypkv; Fri, 31 Jan 2020 12:34:55 +0100 (CET)
Received: from po14934vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 994FE8B890;
 Fri, 31 Jan 2020 12:34:55 +0100 (CET)
Received: by po14934vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 979D365288; Fri, 31 Jan 2020 11:34:55 +0000 (UTC)
Message-Id: <b94c3bc03bac9431fec2dadb686384c481889422.1580470483.git.christophe.leroy@c-s.fr>
In-Reply-To: <8ee3bdbbdfdfc64ca7001e90c43b2aee6f333578.1580470482.git.christophe.leroy@c-s.fr>
References: <8ee3bdbbdfdfc64ca7001e90c43b2aee6f333578.1580470482.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/2] powerpc: Don't user thread struct for saving SRR0/1 on
 syscall.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 31 Jan 2020 11:34:55 +0000 (UTC)
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

CR0 can be saved later, and CTR can also be used for saving.

Keep SRR1 in r9 and stash SRR0 in CTR, this avoids using
thread_struct in memory for that.

Saves 3 cycles (ie 1%) in null_syscall selftest on 8xx.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v3: New
---
 arch/powerpc/kernel/head_32.h | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 0e7bf28fe53a..4a1faeded069 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -114,28 +114,23 @@
 	mfspr	r9, SPRN_SRR1
 #ifdef CONFIG_VMAP_STACK
 	mfspr	r11, SPRN_SRR0
-	stw	r11, SRR0(r12)
-	stw	r9, SRR1(r12)
+	mtctr	r11
 #endif
-	mfcr	r10
 	andi.	r11, r9, MSR_PR
 	lwz	r11,TASK_STACK-THREAD(r12)
 	beq-	99f
-	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
 	addi	r11, r11, THREAD_SIZE - INT_FRAME_SIZE
 #ifdef CONFIG_VMAP_STACK
-	li	r9, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
-	mtmsr	r9
+	li	r10, MSR_KERNEL & ~(MSR_IR | MSR_RI) /* can take DTLB miss */
+	mtmsr	r10
 	isync
 #endif
 	tovirt_vmstack r12, r12
 	tophys_novmstack r11, r11
-	stw	r10,_CCR(r11)		/* save registers */
 	mflr	r10
 	stw	r10, _LINK(r11)
 #ifdef CONFIG_VMAP_STACK
-	lwz	r10, SRR0(r12)
-	lwz	r9, SRR1(r12)
+	mfctr	r10
 #else
 	mfspr	r10,SPRN_SRR0
 #endif
@@ -143,6 +138,9 @@
 	stw	r1,0(r11)
 	tovirt_novmstack r1, r11	/* set new kernel sp */
 	stw	r10,_NIP(r11)
+	mfcr	r10
+	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
+	stw	r10,_CCR(r11)		/* save registers */
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
 #else
-- 
2.25.0

