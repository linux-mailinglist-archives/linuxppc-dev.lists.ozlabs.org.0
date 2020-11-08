Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E312AAC5E
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 17:59:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTgMW3lfxzDqX1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 03:59:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTgKj1LW5zDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 03:57:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CTgKS3v2Jz9tyqS;
 Sun,  8 Nov 2020 17:57:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id pzxtFaeNsvgG; Sun,  8 Nov 2020 17:57:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CTgKS2z3vz9tyqR;
 Sun,  8 Nov 2020 17:57:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 257688B77F;
 Sun,  8 Nov 2020 17:57:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cHCClJdZFpd2; Sun,  8 Nov 2020 17:57:36 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E50FE8B75B;
 Sun,  8 Nov 2020 17:57:35 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AB0C766855; Sun,  8 Nov 2020 16:57:35 +0000 (UTC)
Message-Id: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/3] powerpc/64s: Replace RFI by RFI_TO_KERNEL and remove
 RFI
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Sun,  8 Nov 2020 16:57:35 +0000 (UTC)
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

In head_64.S, we have two places using RFI to return to
kernel. Use RFI_TO_KERNEL instead.

They are the two only places using RFI on book3s/64, so
the RFI macro can go away.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc_asm.h | 1 -
 arch/powerpc/kernel/head_64.S      | 9 +++++++--
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
index 511786f0e40d..bedf3eb52ebc 100644
--- a/arch/powerpc/include/asm/ppc_asm.h
+++ b/arch/powerpc/include/asm/ppc_asm.h
@@ -495,7 +495,6 @@ END_FTR_SECTION_NESTED(CPU_FTR_CELL_TB_BUG, CPU_FTR_CELL_TB_BUG, 96)
 #endif
 
 #ifdef CONFIG_PPC_BOOK3S_64
-#define RFI		rfid
 #define MTMSRD(r)	mtmsrd	r
 #define MTMSR_EERI(reg)	mtmsrd	reg,1
 #else
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 1510b2a56669..ecf9a88988ff 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -41,6 +41,11 @@
 #include <asm/ppc-opcode.h>
 #include <asm/export.h>
 #include <asm/feature-fixups.h>
+#ifdef CONFIG_PPC_BOOK3S
+#include <asm/exception-64s.h>
+#else
+#include <asm/exception-64e.h>
+#endif
 
 /* The physical memory is laid out such that the secondary processor
  * spin code sits at 0x0000...0x00ff. On server, the vectors follow
@@ -829,7 +834,7 @@ __secondary_start:
 
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
-	RFI
+	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 
 /* 
@@ -966,7 +971,7 @@ start_here_multiplatform:
 	ld	r4,PACAKMSR(r13)
 	mtspr	SPRN_SRR0,r3
 	mtspr	SPRN_SRR1,r4
-	RFI
+	RFI_TO_KERNEL
 	b	.	/* prevent speculative execution */
 
 	/* This is where all platforms converge execution */
-- 
2.25.0

