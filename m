Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 645DF2E0B79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:11:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0dYV0tZfzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:11:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0ccD2WRbzDqPl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:28:42 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0cc52Yqqz9v15g;
 Tue, 22 Dec 2020 14:28:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ULguZ_gMn2dh; Tue, 22 Dec 2020 14:28:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0cc51m1Tz9v15W;
 Tue, 22 Dec 2020 14:28:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EAAC8B81B;
 Tue, 22 Dec 2020 14:28:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kcSMPVTbeq48; Tue, 22 Dec 2020 14:28:38 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1BBEC8B812;
 Tue, 22 Dec 2020 14:28:38 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EE51366969; Tue, 22 Dec 2020 13:28:37 +0000 (UTC)
Message-Id: <bcafba5b80aee844feb72bb3acd02db9a2f3f3e2.1608641533.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1608641532.git.christophe.leroy@csgroup.eu>
References: <cover.1608641532.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 15/15] powerpc/32: Use r11 to store DSISR in prolog
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 22 Dec 2020 13:28:37 +0000 (UTC)
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

We now have r11 available. Use it to avoid reloading DSISR
from the stack when needed.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_6xx_8xx.h   | 4 ++--
 arch/powerpc/kernel/head_8xx.S       | 3 +--
 arch/powerpc/kernel/head_book3s_32.S | 3 +--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kernel/head_6xx_8xx.h b/arch/powerpc/kernel/head_6xx_8xx.h
index 5a90bafee536..7116162dae9d 100644
--- a/arch/powerpc/kernel/head_6xx_8xx.h
+++ b/arch/powerpc/kernel/head_6xx_8xx.h
@@ -72,9 +72,9 @@
 	tovirt(r12, r12)
 	.if	\handle_dar_dsisr
 	lwz	r10, DAR(r12)
+	lwz	r11, DSISR(r12)
 	stw	r10, _DAR(r1)
-	lwz	r10, DSISR(r12)
-	stw	r10, _DSISR(r1)
+	stw	r11, _DSISR(r1)
 	.endif
 	lwz	r9, SRR1(r12)
 	lwz	r12, SRR0(r12)
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 7a078b26d24c..7e9cbd64efd9 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -335,9 +335,8 @@ DARFixed:/* Return from dcbx instruction bug workaround */
 	mtspr	SPRN_DAR, r11	/* Tag DAR, to be used in DTLB Error */
 	EXCEPTION_PROLOG_1
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
+	andis.	r10,r11,DSISR_NOHPTE@h
 	lwz	r4, _DAR(r1)
-	lwz	r5, _DSISR(r1)
-	andis.	r10,r5,DSISR_NOHPTE@h
 	beq+	.Ldtlbie
 	tlbie	r4
 .Ldtlbie:
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 40ee63af84f2..c0db295734f5 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -653,8 +653,7 @@ alignment_exception_tramp:
 
 handle_page_fault_tramp_1:
 	EXCEPTION_PROLOG_2 handle_dar_dsisr=1
-	lwz	r5, _DSISR(r1)
-	andis.	r0, r5, DSISR_DABRMATCH@h
+	andis.	r0, r11, DSISR_DABRMATCH@h
 	bne-	1f
 	EXC_XFER_LITE(0x300, handle_page_fault)
 1:	EXC_XFER_STD(0x300, do_break)
-- 
2.25.0

