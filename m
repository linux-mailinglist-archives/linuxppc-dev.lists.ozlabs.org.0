Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB6F462EB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 09:43:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3G2l2sv9z3cZc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 19:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3G2J2YXGz3bVC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 19:43:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J3G283yDSz9sSS;
 Tue, 30 Nov 2021 09:42:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dKXfUxfeFQ06; Tue, 30 Nov 2021 09:42:56 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J3G2838c1z9sSP;
 Tue, 30 Nov 2021 09:42:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3F97B8B779;
 Tue, 30 Nov 2021 09:42:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 0SG1YhGodZJM; Tue, 30 Nov 2021 09:42:56 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.93])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 079B48B763;
 Tue, 30 Nov 2021 09:42:55 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AU8gf1C063015
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 09:42:41 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AU8gdpY063014;
 Tue, 30 Nov 2021 09:42:39 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/32s: Fix shift-out-of-bounds in KASAN init
Date: Tue, 30 Nov 2021 09:42:37 +0100
Message-Id: <15cbc3439d4ad988b225e2119ec99502a5cc6ad3.1638261744.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638261756; l=1919; s=20211009;
 h=from:subject:message-id; bh=wli3SWXo3YOK/NxzckV1p2wzUokEybic7rAj14I6KLQ=;
 b=xr5oOz5wFeUxRLCvDTFfzbPeBY2sNbt9hmRecBeYOB9alAP3R1p+Txp48n1VgzCYoSw6kjTxd0vL
 IRB6+N/8CQ6SHmoOd7XelgoJouPU/0uPUR+vbXrJ/qpQWPaz1UmZ
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

================================================================================
UBSAN: shift-out-of-bounds in arch/powerpc/mm/kasan/book3s_32.c:22:23
shift exponent -1 is negative
CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.5-gentoo-PowerMacG4 #9
Call Trace:
[c214be60] [c0ba0048] dump_stack_lvl+0x80/0xb0 (unreliable)
[c214be80] [c0b99288] ubsan_epilogue+0x10/0x5c
[c214be90] [c0b98fe0] __ubsan_handle_shift_out_of_bounds+0x94/0x138
[c214bf00] [c1c0f010] kasan_init_region+0xd8/0x26c
[c214bf30] [c1c0ed84] kasan_init+0xc0/0x198
[c214bf70] [c1c08024] setup_arch+0x18/0x54c
[c214bfc0] [c1c037f0] start_kernel+0x90/0x33c
[c214bff0] [00003610] 0x3610
================================================================================

This happens when the directly mapped memory is a power of 2.

Fix it by checking the shift and set the result to 0 when shift is -1

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215169
Fixes: 7974c4732642 ("powerpc/32s: Implement dedicated kasan_init_region()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/kasan/book3s_32.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/kasan/book3s_32.c b/arch/powerpc/mm/kasan/book3s_32.c
index 202bd260a009..35b287b0a8da 100644
--- a/arch/powerpc/mm/kasan/book3s_32.c
+++ b/arch/powerpc/mm/kasan/book3s_32.c
@@ -19,7 +19,8 @@ int __init kasan_init_region(void *start, size_t size)
 	block = memblock_alloc(k_size, k_size_base);
 
 	if (block && k_size_base >= SZ_128K && k_start == ALIGN(k_start, k_size_base)) {
-		int k_size_more = 1 << (ffs(k_size - k_size_base) - 1);
+		int shift = ffs(k_size - k_size_base);
+		int k_size_more = shift ? 1 << (shift - 1) : 0;
 
 		setbat(-1, k_start, __pa(block), k_size_base, PAGE_KERNEL);
 		if (k_size_more >= SZ_128K)
-- 
2.33.1

