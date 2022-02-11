Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1674B27DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 15:30:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JwGH634v6z3cVy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 01:30:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwGGf2V0Hz3bZy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 01:29:44 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4JwGGY5x43z9sSB;
 Fri, 11 Feb 2022 15:29:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id USX2o3PF4ShW; Fri, 11 Feb 2022 15:29:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4JwGGX3q5dz9sS1;
 Fri, 11 Feb 2022 15:29:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E6DC8B77D;
 Fri, 11 Feb 2022 15:29:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F0JzPDXcZiPg; Fri, 11 Feb 2022 15:29:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.91])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2765F8B764;
 Fri, 11 Feb 2022 15:29:40 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21BETUUS1222886
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 15:29:30 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21BETNhO1222885;
 Fri, 11 Feb 2022 15:29:23 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/64: Rewrite loading of AMR_KUAP_BLOCKED in assembly
Date: Fri, 11 Feb 2022 15:29:20 +0100
Message-Id: <56f6eebc9c5c1196038d17c09a5ef1f245e1167c.1644588937.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644589759; l=1751; s=20211009;
 h=from:subject:message-id; bh=z/4Ca8ZC2EDmkSpiIzEao9zLZfk88V1Qa0syyqnav7w=;
 b=uVWHavhvA87L5pq1TuD7hAlwiQFGToKKzz1orO49d0Yag2cfxu7oI0CmOTFdeReIZ1Hl7YUYrXr/
 u9pcHNHADkfFwWulU9XhQqFRJFENm3n0wpyR34RALpa4ahpa4fiT
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

Constant loading of AMR_KUAP_BLOCKED takes 5 instructions:

	c000000000016a40:       4c 00 01 2c     isync
	c000000000016a44:       3d 20 fc ff     lis     r9,-769
	c000000000016a48:       61 29 ff ff     ori     r9,r9,65535
	c000000000016a4c:       79 29 07 c6     rldicr  r9,r9,32,31
	c000000000016a50:       65 29 ff ff     oris    r9,r9,65535
	c000000000016a54:       61 29 ff ff     ori     r9,r9,65535
	c000000000016a58:       7d 3d 03 a6     mtamr   r9
	c000000000016a5c:       4c 00 01 2c     isync

Until GCC is fixed, implement it in assembly using 2 instructions:

	c000000000016a50:       4c 00 01 2c     isync
	c000000000016a54:       39 20 fc ff     li      r9,-769
	c000000000016a58:       79 29 80 02     rotldi  r9,r9,48
	c000000000016a5c:       7d 3d 03 a6     mtamr   r9
	c000000000016a60:       4c 00 01 2c     isync

With this change a ppc64_defconfig build is reduced by 15 kbytes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=94395
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 54cf46808157..35c017ba29e1 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -338,6 +338,10 @@ static __always_inline void set_kuap(unsigned long value)
 	 * before and after the move to AMR. See table 6 on page 1134.
 	 */
 	isync();
+
+	if (__builtin_constant_p(value) && value == 0xfcffffffffffffff)
+		asm("li %0, %1 ; rotldi %0, %0, 48" : "=r"(value) : "i"(0xfffffffffffffcff));
+
 	mtspr(SPRN_AMR, value);
 	isync();
 }
-- 
2.34.1

