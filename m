Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFFC2FCBB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 08:38:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLHSX0yYDzDqw2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 18:38:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLHMh4n3czDqpd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 18:34:04 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DLHMX29Qvz9tyTV;
 Wed, 20 Jan 2021 08:34:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1Vy_h0fi_kaO; Wed, 20 Jan 2021 08:34:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DLHMX18zJz9tyMd;
 Wed, 20 Jan 2021 08:34:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 163FD8B7DF;
 Wed, 20 Jan 2021 08:34:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hK2Wjc8GUsgg; Wed, 20 Jan 2021 08:34:00 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E2F578B7E0;
 Wed, 20 Jan 2021 08:34:00 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id DD0AB66A64; Wed, 20 Jan 2021 07:34:00 +0000 (UTC)
Message-Id: <67ab24d26837fcc85a59eca9c68db9bf27a878dd.1611128021.git.christophe.leroy@csgroup.eu>
In-Reply-To: <00e462bd8b271bed0fec62dc9b25ffd4e0ec19cf.1611128021.git.christophe.leroy@csgroup.eu>
References: <00e462bd8b271bed0fec62dc9b25ffd4e0ec19cf.1611128021.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/32s: Unroll kuep_lock and kuep_unlock macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 20 Jan 2021 07:34:00 +0000 (UTC)
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

Unroll the loops in kuep_lock and kuep_unlock.

Benchmarked on an mpc 8321 with a standard kernel having a
3M/1M user/kernel memory split, i.e. 12 segments for user.

Without KUEP, null_syscall benchmark is 220 cycles.
With KUEP, null_syscall benchmark is 439 cycles.

Once loops are unrolled, null_syscall benchmark is 366 cycles.
This is almost 17% reduction.

It is assumed that userspace covers at least 4 segments and
at most 14 segments.

The isync is removed, it saves 8 cycles. For kuep_unlock, the rfi
will do the synchronisation. For kuep_lock, we get a small window
during which exec is still possible, but is won't last more than a
few instructions.

Both macros are called two times so the size increase is in
the noise (approx 120 instructions).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 67 ++++++++++++++++++------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index a0117a9d5b06..e800b515ac02 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -7,21 +7,61 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuep_update_sr	gpr1, gpr2		/* NEVER use r0 as gpr2 due to addis */
-101:	mtsrin	\gpr1, \gpr2
-	addi	\gpr1, \gpr1, 0x111		/* next VSID */
-	rlwinm	\gpr1, \gpr1, 0, 0xf0ffffff	/* clear VSID overflow */
-	addis	\gpr2, \gpr2, 0x1000		/* address of next segment */
-	bdnz	101b
-	isync
+.macro kuep_increment gpr1, gpr2
+	addi	\gpr1, \gpr1, 0x222		/* Next second VSID */
+	addi	\gpr2, \gpr2, 0x222		/* Next second VSID */
+	rlwinm	\gpr1, \gpr1, 0, 0xf0ffffff	/* Clear VSID overflow */
+	rlwinm	\gpr2, \gpr2, 0, 0xf0ffffff	/* Clear VSID overflow */
+.endm
+
+.macro kuep_update_sr gpr1, gpr2		/* NEVER use r0 as gpr1 or gpr2 due to addi */
+	addi	\gpr2, \gpr1, 0x111		/* Next VSID */
+	rlwinm	\gpr2, \gpr2, 0, 0xf0ffffff	/* Clear VSID overflow */
+	mtsr	0, \gpr1
+	mtsr	1, \gpr2
+	kuep_increment \gpr1, \gpr2
+	mtsr	2, \gpr1
+	mtsr	3, \gpr2
+#if NUM_USER_SEGMENTS > 4
+	kuep_increment \gpr1, \gpr2
+	mtsr	4, \gpr1
+#if NUM_USER_SEGMENTS > 5
+	mtsr	5, \gpr2
+#if NUM_USER_SEGMENTS > 6
+	kuep_increment \gpr1, \gpr2
+	mtsr	6, \gpr1
+#if NUM_USER_SEGMENTS > 7
+	mtsr	7, \gpr2
+#if NUM_USER_SEGMENTS > 8
+	kuep_increment \gpr1, \gpr2
+	mtsr	8, \gpr1
+#if NUM_USER_SEGMENTS > 9
+	mtsr	9, \gpr2
+#if NUM_USER_SEGMENTS > 10
+	kuep_increment \gpr1, \gpr2
+	mtsr	10, \gpr1
+#if NUM_USER_SEGMENTS > 11
+	mtsr	11, \gpr2
+#if NUM_USER_SEGMENTS > 12
+	kuep_increment \gpr1, \gpr2
+	mtsr	12, \gpr1
+#if NUM_USER_SEGMENTS > 13
+	mtsr	13, \gpr2
+#endif
+#endif
+#endif
+#endif
+#endif
+#endif
+#endif
+#endif
+#endif
+#endif
 .endm
 
 .macro kuep_lock	gpr1, gpr2
 #ifdef CONFIG_PPC_KUEP
-	li	\gpr1, NUM_USER_SEGMENTS
-	li	\gpr2, 0
-	mtctr	\gpr1
-	mfsrin	\gpr1, \gpr2
+	mfsr	\gpr1, 0
 	oris	\gpr1, \gpr1, SR_NX@h		/* set Nx */
 	kuep_update_sr \gpr1, \gpr2
 #endif
@@ -29,10 +69,7 @@
 
 .macro kuep_unlock	gpr1, gpr2
 #ifdef CONFIG_PPC_KUEP
-	li	\gpr1, NUM_USER_SEGMENTS
-	li	\gpr2, 0
-	mtctr	\gpr1
-	mfsrin	\gpr1, \gpr2
+	mfsr	\gpr1, 0
 	rlwinm	\gpr1, \gpr1, 0, ~SR_NX		/* Clear Nx */
 	kuep_update_sr \gpr1, \gpr2
 #endif
-- 
2.25.0

