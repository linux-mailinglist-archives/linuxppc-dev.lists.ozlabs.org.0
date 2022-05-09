Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1DF51F402
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 07:44:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxVVD3dp8z3fv6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 15:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KxVLt0XZpz3dR5
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 15:37:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KxVKd230Zz9sW7;
 Mon,  9 May 2022 07:36:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtBHFhrxjztr; Mon,  9 May 2022 07:36:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KxVKF6VCPz9sWB;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D31A38B776;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 5TFobGZUBxXF; Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AF938B76C;
 Mon,  9 May 2022 07:36:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2495aTqU1591235
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 9 May 2022 07:36:29 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2495aTBl1591234;
 Mon, 9 May 2022 07:36:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v3 07/25] powerpc/ftrace: Use patch_instruction() return
 directly
Date: Mon,  9 May 2022 07:36:05 +0200
Message-Id: <49a8597230713e2633e7d9d7b56140787c4a7e20.1652074503.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1652074503.git.christophe.leroy@csgroup.eu>
References: <cover.1652074503.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1652074581; l=3210; s=20211009;
 h=from:subject:message-id; bh=Md4LXS00pJjwBL+ITuR9eEwWCBaAOzBbKV+lmd2htSc=;
 b=bw+q62+/aBRPBc5kH6gDGF9O/ZQowCJR4GOLPi23Xf0KjpRe1VbdFMOWF85wGURwH2sKiEjwu5zF
 m1IIEnc/By+PEXlutM8oglp+rmJnGXI3RqxDYeFA8Vaqa9fmNmcW
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

Instead of returning -EPERM when patch_instruction() fails,
just return what patch_instruction returns.

That simplifies ftrace_modify_code():

	   0:	94 21 ff c0 	stwu    r1,-64(r1)
	   4:	93 e1 00 3c 	stw     r31,60(r1)
	   8:	7c 7f 1b 79 	mr.     r31,r3
	   c:	40 80 00 30 	bge     3c <ftrace_modify_code+0x3c>
	  10:	93 c1 00 38 	stw     r30,56(r1)
	  14:	7c 9e 23 78 	mr      r30,r4
	  18:	7c a4 2b 78 	mr      r4,r5
	  1c:	80 bf 00 00 	lwz     r5,0(r31)
	  20:	7c 1e 28 40 	cmplw   r30,r5
	  24:	40 82 00 34 	bne     58 <ftrace_modify_code+0x58>
	  28:	83 c1 00 38 	lwz     r30,56(r1)
	  2c:	7f e3 fb 78 	mr      r3,r31
	  30:	83 e1 00 3c 	lwz     r31,60(r1)
	  34:	38 21 00 40 	addi    r1,r1,64
	  38:	48 00 00 00 	b       38 <ftrace_modify_code+0x38>
				38: R_PPC_REL24	patch_instruction

Before:

	   0:	94 21 ff c0 	stwu    r1,-64(r1)
	   4:	93 e1 00 3c 	stw     r31,60(r1)
	   8:	7c 7f 1b 79 	mr.     r31,r3
	   c:	40 80 00 4c 	bge     58 <ftrace_modify_code+0x58>
	  10:	93 c1 00 38 	stw     r30,56(r1)
	  14:	7c 9e 23 78 	mr      r30,r4
	  18:	7c a4 2b 78 	mr      r4,r5
	  1c:	80 bf 00 00 	lwz     r5,0(r31)
	  20:	7c 08 02 a6 	mflr    r0
	  24:	90 01 00 44 	stw     r0,68(r1)
	  28:	7c 1e 28 40 	cmplw   r30,r5
	  2c:	40 82 00 48 	bne     74 <ftrace_modify_code+0x74>
	  30:	7f e3 fb 78 	mr      r3,r31
	  34:	48 00 00 01 	bl      34 <ftrace_modify_code+0x34>
				34: R_PPC_REL24	patch_instruction
	  38:	80 01 00 44 	lwz     r0,68(r1)
	  3c:	20 63 00 00 	subfic  r3,r3,0
	  40:	83 c1 00 38 	lwz     r30,56(r1)
	  44:	7c 63 19 10 	subfe   r3,r3,r3
	  48:	7c 08 03 a6 	mtlr    r0
	  4c:	83 e1 00 3c 	lwz     r31,60(r1)
	  50:	38 21 00 40 	addi    r1,r1,64
	  54:	4e 80 00 20 	blr

It improves ftrace activation/deactivation duration by about 3%.

Modify patch_instruction() return on failure to -EPERM in order to
match with ftrace expectations. Other users of patch_instruction()
do not care about the exact error value returned.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Make patch_instruction() return -EPERM in case of failure
---
 arch/powerpc/kernel/trace/ftrace.c | 5 +----
 arch/powerpc/lib/code-patching.c   | 2 +-
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index 98e82fa4980f..1b05d33f96c6 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -78,10 +78,7 @@ ftrace_modify_code(unsigned long ip, ppc_inst_t old, ppc_inst_t new)
 	}
 
 	/* replace the text with the new text */
-	if (patch_instruction((u32 *)ip, new))
-		return -EPERM;
-
-	return 0;
+	return patch_instruction((u32 *)ip, new);
 }
 
 /*
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 7adbdb05fee7..cd25c07df23c 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -32,7 +32,7 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr
 	return 0;
 
 failed:
-	return -EFAULT;
+	return -EPERM;
 }
 
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
-- 
2.35.1

