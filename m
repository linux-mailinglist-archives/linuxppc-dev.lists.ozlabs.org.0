Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DCB43FF27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 17:11:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgm9G14b1z3c71
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 02:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hgm8r2LG9z2ynQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 02:11:06 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Hgm8h6gC7z9sSg;
 Fri, 29 Oct 2021 17:11:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfJUthNRJBNk; Fri, 29 Oct 2021 17:11:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Hgm8h5gC2z9sSX;
 Fri, 29 Oct 2021 17:11:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AEFFC8B78B;
 Fri, 29 Oct 2021 17:11:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id n1iVfyxHpdhU; Fri, 29 Oct 2021 17:11:00 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8ED118B763;
 Fri, 29 Oct 2021 17:11:00 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19TFAlHN416774
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 29 Oct 2021 17:10:47 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19TFAkqB416773;
 Fri, 29 Oct 2021 17:10:46 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/8xx: Fix Oops with STRICT_KERNEL_RWX without
 DEBUG_RODATA_TEST
Date: Fri, 29 Oct 2021 17:10:45 +0200
Message-Id: <3d5800b0bbcd7b19761b98f50421358667b45331.1635520232.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1635520242; l=2802; s=20211009;
 h=from:subject:message-id; bh=DrNIRDI3/juGgYncviA0c9l6TlqI+AeVZIuktbLAUzE=;
 b=cF38R5imtMpK7PTLeHkf4mPoxilN8KwtmZYNIWqZOH5AkjaRWPR/P3ZmXeFotR+uDCVy1+aLRhkv
 knejNNdLCCR+NF6+5GZRyuKREIVeTAE0+NO0g7Btn65pHmSZmIZG
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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

Until now, all tests involving CONFIG_STRICT_KERNEL_RWX were done with
DEBUG_RODATA_TEST to check the result. But now that
CONFIG_STRICT_KERNEL_RWX is selected by default, it came without
CONFIG_DEBUG_RODATA_TEST and led to the following Oops

[    6.830908] Freeing unused kernel image (initmem) memory: 352K
[    6.840077] BUG: Unable to handle kernel data access on write at 0xc1285200
[    6.846836] Faulting instruction address: 0xc0004b6c
[    6.851745] Oops: Kernel access of bad area, sig: 11 [#1]
[    6.857075] BE PAGE_SIZE=16K PREEMPT CMPC885
[    6.861348] SAF3000 DIE NOTIFICATION
[    6.864830] CPU: 0 PID: 1 Comm: swapper Not tainted 5.15.0-rc5-s3k-dev-02255-g2747d7b7916f #451
[    6.873429] NIP:  c0004b6c LR: c0004b60 CTR: 00000000
[    6.878419] REGS: c902be60 TRAP: 0300   Not tainted  (5.15.0-rc5-s3k-dev-02255-g2747d7b7916f)
[    6.886852] MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 53000335  XER: 8000ff40
[    6.893564] DAR: c1285200 DSISR: 82000000
[    6.893564] GPR00: 0c000000 c902bf20 c20f4000 08000000 00000001 04001f00 c1800000 00000035
[    6.893564] GPR08: ff0001ff c1280000 00000002 c0004b60 00001000 00000000 c0004b1c 00000000
[    6.893564] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    6.893564] GPR24: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 c1060000
[    6.932034] NIP [c0004b6c] kernel_init+0x50/0x138
[    6.936682] LR [c0004b60] kernel_init+0x44/0x138
[    6.941245] Call Trace:
[    6.943653] [c902bf20] [c0004b60] kernel_init+0x44/0x138 (unreliable)
[    6.950022] [c902bf30] [c001122c] ret_from_kernel_thread+0x5c/0x64
[    6.956135] Instruction dump:
[    6.959060] 48ffc521 48045469 4800d8cd 3d20c086 89295fa0 2c090000 41820058 480796c9
[    6.966890] 4800e48d 3d20c128 39400002 3fe0c106 <91495200> 3bff8000 4806fa1d 481f7d75
[    6.974902] ---[ end trace 1e397bacba4aa610 ]---

0xc1285200 corresponds to 'system_state' global var that the kernel is trying to set to
SYSTEM_RUNNING. This var is above the RO/RW limit so it shouldn't Oops.

It oopses because the dirty bit is missing.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/head_8xx.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 9bdb95f5694f..2d596881b70e 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -755,7 +755,7 @@ _GLOBAL(mmu_pin_tlb)
 	cmplw	r6, r9
 	bdnzt	lt, 2b
 
-4:	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
+4:	LOAD_REG_IMMEDIATE(r8, 0xf0 | _PAGE_DIRTY | _PAGE_SPS | _PAGE_SH | _PAGE_PRESENT)
 2:	ori	r0, r6, MD_EVALID
 	mtspr	SPRN_MD_CTR, r5
 	mtspr	SPRN_MD_EPN, r0
-- 
2.31.1

