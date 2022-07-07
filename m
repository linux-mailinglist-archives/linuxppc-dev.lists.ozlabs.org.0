Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D8A56A650
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ldzxw5Rhwz3cj7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 00:56:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdzxC30Gdz3c58
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:55:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ldzx32njJz9tGf;
	Thu,  7 Jul 2022 16:55:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EFHjvXTaKIr1; Thu,  7 Jul 2022 16:55:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ldzx20SpKz9t90;
	Thu,  7 Jul 2022 16:55:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F33228B7A7;
	Thu,  7 Jul 2022 16:55:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CygF_q0_2rOD; Thu,  7 Jul 2022 16:55:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B5BFD8B79F;
	Thu,  7 Jul 2022 16:55:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 267EtOed541781
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 16:55:24 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 267EtOfZ541780;
	Thu, 7 Jul 2022 16:55:24 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] powerpc/ppc-opcode: Define and use PPC_RAW_TRAP() and PPC_RAW_TW()
Date: Thu,  7 Jul 2022 16:55:15 +0200
Message-Id: <52c7e522e56a38e3ff0363906919445920005a8f.1657205708.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <b2d762191b095530789ac8b71b167c6740bb6aed.1657205708.git.christophe.leroy@csgroup.eu>
References: <b2d762191b095530789ac8b71b167c6740bb6aed.1657205708.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657205713; l=1963; s=20211009; h=from:subject:message-id; bh=/QUbuNCRaB5mtR9HgvpdBFYMNf4JgF1mD8ce0wgA6TA=; b=22Rcqn2ubuXmhSFVyY8J56mMu5TlQRwmuhWaADoEMrmpa0GMKAcuUX20ePOpE9N+jQeUSzYmFw1k dg61v59eDHMNii27sUtAJnqmCoe3Z7M2i4fV+TqgU8qwTXAvcJuW
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add and use PPC_RAW_TRAP() instead of opencoding.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 2 ++
 arch/powerpc/include/asm/probes.h     | 3 ++-
 arch/powerpc/xmon/xmon.c              | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 89beabf5325c..5527a955fb4a 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -581,6 +581,8 @@
 
 #define PPC_RAW_BRANCH(offset)		(0x48000000 | PPC_LI(offset))
 #define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
+#define PPC_RAW_TW(t0, a, b)		(0x7f000008 | ___PPC_RS(t0) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_TRAP()			PPC_RAW_TW(31, 0, 0)
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
diff --git a/arch/powerpc/include/asm/probes.h b/arch/powerpc/include/asm/probes.h
index 00634e3145e7..e77a2ed7d938 100644
--- a/arch/powerpc/include/asm/probes.h
+++ b/arch/powerpc/include/asm/probes.h
@@ -9,8 +9,9 @@
  */
 #include <linux/types.h>
 #include <asm/disassemble.h>
+#include <asm/ppc-opcode.h>
 
-#define BREAKPOINT_INSTRUCTION	0x7fe00008	/* trap */
+#define BREAKPOINT_INSTRUCTION	PPC_RAW_TRAP()	/* trap */
 
 /* Trap definitions per ISA */
 #define IS_TW(instr)		(((instr) & 0xfc0007fe) == 0x7c000008)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index f80c714f1d49..26ef3388c24c 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -116,7 +116,7 @@ struct bpt {
 static struct bpt bpts[NBPTS];
 static struct bpt dabr[HBP_NUM_MAX];
 static struct bpt *iabr;
-static unsigned bpinstr = 0x7fe00008;	/* trap */
+static unsigned int bpinstr = PPC_RAW_TRAP();
 
 #define BP_NUM(bp)	((bp) - bpts + 1)
 
-- 
2.36.1

