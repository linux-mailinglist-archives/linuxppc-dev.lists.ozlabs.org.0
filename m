Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C481E2AA426
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 10:09:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CSrzZ563DzDrQr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 20:09:14 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CSrxz0dvRzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 20:07:45 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CSrxm2xC5z9v6vC;
 Sat,  7 Nov 2020 10:07:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SBU23wXPkMUB; Sat,  7 Nov 2020 10:07:40 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CSrxm1HNrz9v6vB;
 Sat,  7 Nov 2020 10:07:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A6128B776;
 Sat,  7 Nov 2020 10:07:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id k0GTKzkPiJkJ; Sat,  7 Nov 2020 10:07:41 +0100 (CET)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDE1D8B75B;
 Sat,  7 Nov 2020 10:07:40 +0100 (CET)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id AFC2B66868; Sat,  7 Nov 2020 09:07:40 +0000 (UTC)
Message-Id: <9e225a856a8b22e0e77587ee22ab7a2f5bca8753.1604740029.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/32s: Use relocation offset when setting early hash
 table
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 erhard_f@mailbox.org, schwab@linux-m68k.org
Date: Sat,  7 Nov 2020 09:07:40 +0000 (UTC)
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

When calling early_hash_table(), the kernel hasn't been yet
relocated to its linking address, so data must be addressed
with relocation offset.

Add relocation offset to write into Hash in early_hash_table().

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Reported-by: Andreas Schwab <schwab@linux-m68k.org>
Fixes: 69a1593abdbc ("powerpc/32s: Setup the early hash table at all time.")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_book3s_32.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 5eb9eedac920..8aa7eb11754e 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -156,6 +156,7 @@ __after_mmu_off:
 	bl	initial_bats
 	bl	load_segment_registers
 BEGIN_MMU_FTR_SECTION
+	bl	reloc_offset
 	bl	early_hash_table
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 #if defined(CONFIG_BOOTX_TEXT)
@@ -932,7 +933,7 @@ early_hash_table:
 	ori	r6, r6, 3	/* 256kB table */
 	mtspr	SPRN_SDR1, r6
 	lis	r6, early_hash@h
-	lis	r3, Hash@ha
+	addis	r3, r3, Hash@ha
 	stw	r6, Hash@l(r3)
 	blr
 
-- 
2.25.0

