Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 832762C2B41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 16:28:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgSZm68CtzDqL9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 02:28:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgSWK6NpnzDqZn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 02:25:00 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgSWC2zfnz9v0dB;
 Tue, 24 Nov 2020 16:24:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5jnjuQhZjD_K; Tue, 24 Nov 2020 16:24:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgSWC0sfsz9v0d5;
 Tue, 24 Nov 2020 16:24:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B14288B7B3;
 Tue, 24 Nov 2020 16:24:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YM0h5sBoTXhZ; Tue, 24 Nov 2020 16:24:56 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 769F68B7AF;
 Tue, 24 Nov 2020 16:24:56 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 56608668E2; Tue, 24 Nov 2020 15:24:56 +0000 (UTC)
Message-Id: <bdafd651b4ac3a851fd09249f5f3699c50da29f2.1606231483.git.christophe.leroy@csgroup.eu>
In-Reply-To: <e796c5fcb5898de827c803cf1ab8ba1d7a5d4b76.1606231483.git.christophe.leroy@csgroup.eu>
References: <e796c5fcb5898de827c803cf1ab8ba1d7a5d4b76.1606231483.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 3/6] powerpc/8xx: Simplify INVALIDATE_ADJACENT_PAGES_CPU15
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 24 Nov 2020 15:24:56 +0000 (UTC)
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

We now have r11 available as a scratch register so
INVALIDATE_ADJACENT_PAGES_CPU15() can be simplified.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 775b4f4d011e..558c8e615ef9 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -180,14 +180,13 @@ SystemCall:
  */
 
 #ifdef CONFIG_8xx_CPU15
-#define INVALIDATE_ADJACENT_PAGES_CPU15(addr)	\
-	addi	addr, addr, PAGE_SIZE;	\
-	tlbie	addr;			\
-	addi	addr, addr, -(PAGE_SIZE << 1);	\
-	tlbie	addr;			\
-	addi	addr, addr, PAGE_SIZE
+#define INVALIDATE_ADJACENT_PAGES_CPU15(addr, tmp)	\
+	addi	tmp, addr, PAGE_SIZE;	\
+	tlbie	tmp;			\
+	addi	tmp, addr, -PAGE_SIZE;	\
+	tlbie	tmp
 #else
-#define INVALIDATE_ADJACENT_PAGES_CPU15(addr)
+#define INVALIDATE_ADJACENT_PAGES_CPU15(addr, tmp)
 #endif
 
 InstructionTLBMiss:
@@ -198,7 +197,7 @@ InstructionTLBMiss:
 	 * kernel page tables.
 	 */
 	mfspr	r10, SPRN_SRR0	/* Get effective address of fault */
-	INVALIDATE_ADJACENT_PAGES_CPU15(r10)
+	INVALIDATE_ADJACENT_PAGES_CPU15(r10, r11)
 	mtspr	SPRN_MD_EPN, r10
 #ifdef CONFIG_MODULES
 	mfcr	r11
-- 
2.25.0

