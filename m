Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0AB588B86
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 13:48:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyVVj2yV4z3bZ2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 21:48:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyVVD1Ktyz2yK2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 21:48:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LyVV30c2yz9sjr;
	Wed,  3 Aug 2022 13:47:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id doBvf-znTPLH; Wed,  3 Aug 2022 13:47:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LyVV23kJVz9sjJ;
	Wed,  3 Aug 2022 13:47:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 6CB658B77E;
	Wed,  3 Aug 2022 13:47:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ApcK4IofWmRZ; Wed,  3 Aug 2022 13:47:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4AC5A8B76D;
	Wed,  3 Aug 2022 13:47:54 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 273BleqG2500049
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 3 Aug 2022 13:47:41 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 273Bld662500048;
	Wed, 3 Aug 2022 13:47:39 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH] powerpc/ppc-opcode: Fix PPC_RAW_TW()
Date: Wed,  3 Aug 2022 13:47:33 +0200
Message-Id: <eca9251f1e1f82c4c46ec6380ddb28356ab3fdfe.1659527244.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1659527252; l=1237; s=20211009; h=from:subject:message-id; bh=q4z8VGusFX6wV2lZ89BFKcrRPn8EYW1/BTdsXFIX+ic=; b=QrC0fGdSrkhzt9X+BoEVgsQuNiuVNKmdGGJ4AE7S5ZbvAtRttsUlWfm4elBxCgDK6qMZ1Uy2jDBW F54j4BQFA2ziw7cN6UoVf8HD/lmDAJ8b2ZkilTqvq04jqCR1I8DX
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC_RAW_TW() is erroneously defined with base code 0x7f000008
instead of 0x7c000008.

That's invisible because its only user is PPC_RAW_TRAP() which is
0x7fe00008, but fix it anyway to avoid any risk of future bug.

Reported-by: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Fixes: d00d762daf12 ("powerpc/ppc-opcode: Define and use PPC_RAW_TRAP() and PPC_RAW_TW()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index d9703c5fd713..c6d724104ed1 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -571,7 +571,7 @@
 
 #define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
 #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
-#define PPC_RAW_TW(t0, a, b)		(0x7f000008 | ___PPC_RS(t0) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_TW(t0, a, b)		(0x7c000008 | ___PPC_RS(t0) | ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_RAW_TRAP()			PPC_RAW_TW(31, 0, 0)
 #define PPC_RAW_SETB(t, bfa)		(0x7c000100 | ___PPC_RT(t) | ___PPC_RA((bfa) << 2))
 
-- 
2.36.1

