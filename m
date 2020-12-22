Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E02E0B4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:02:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dLx1VhhzDqVB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:02:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cc66KXFzDqPl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cc13FGvz9v15Z;
 Tue, 22 Dec 2020 14:28:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 34DapSEn-U10; Tue, 22 Dec 2020 14:28:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cc12Jdpz9v15c;
 Tue, 22 Dec 2020 14:28:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A66A78B812;
 Tue, 22 Dec 2020 14:28:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yMV09wg0cQWy; Tue, 22 Dec 2020 14:28:34 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 03C038B81C;
 Tue, 22 Dec 2020 14:28:34 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D6D8166969; Tue, 22 Dec 2020 13:28:33 +0000 (UTC)
Message-Id: <6c8feab156c874c549ee7bcc4a38789f8b1bec1e.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 11/15] powerpc/32: Use r1 directly instead of r11 in
 syscall prolog
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:33 +0000 (UTC)
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

In syscall prolog, we don't need to keep the stack pointer in r11 as
we do in exception prolog. So r1 can be used directly to free r11.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_6xx_8xx.h | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/head_6xx_8xx.h b/arch/powerpc/kernel/head_6xx_8xx.h
index 540092fb90a9..2536f0a660af 100644
--- a/arch/powerpc/kernel/head_6xx_8xx.h
+++ b/arch/powerpc/kernel/head_6xx_8xx.h
@@ -101,26 +101,25 @@
 	tovirt(r12, r12)
 	stw	r11,GPR1(r1)
 	stw	r11,0(r1)
-	mr	r11, r1
 	mflr	r10
-	stw	r10, _LINK(r11)
+	stw	r10, _LINK(r1)
 	mfctr	r10
-	stw	r10,_NIP(r11)
+	stw	r10,_NIP(r1)
 	mfcr	r10
 	rlwinm	r10,r10,0,4,2	/* Clear SO bit in CR */
-	stw	r10,_CCR(r11)		/* save registers */
+	stw	r10,_CCR(r1)		/* save registers */
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL & ~MSR_IR) /* can take exceptions */
 	mtmsr	r10			/* (except for mach check in rtas) */
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
-	stw	r2,GPR2(r11)
+	stw	r2,GPR2(r1)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
-	stw	r9,_MSR(r11)
+	stw	r9,_MSR(r1)
 	li	r2, \trapno + 1
-	stw	r10,8(r11)
-	stw	r2,_TRAP(r11)
-	SAVE_GPR(0, r11)
-	SAVE_4GPRS(3, r11)
-	SAVE_2GPRS(7, r11)
+	stw	r10,8(r1)
+	stw	r2,_TRAP(r1)
+	SAVE_GPR(0, r1)
+	SAVE_4GPRS(3, r1)
+	SAVE_2GPRS(7, r1)
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
-- 
2.25.0

