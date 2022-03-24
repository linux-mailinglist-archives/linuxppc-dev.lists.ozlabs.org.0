Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 570724E6577
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:39:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSYJ20llz3bVD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:39:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSPH2VF4z3bfj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:32:51 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSMM1XlDz9sV2;
 Thu, 24 Mar 2022 15:31:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxycMU_PF0o0; Thu, 24 Mar 2022 15:31:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLz0XNvz9sV1;
 Thu, 24 Mar 2022 15:30:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F311D8B781;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id l4iX8fWQY25n; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E37E18B79E;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUg3V1811706
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:42 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUgo01811705;
 Thu, 24 Mar 2022 15:30:42 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 07/22] powerpc/ftrace: Use patch_instruction() return
 directly
Date: Thu, 24 Mar 2022 15:29:57 +0100
Message-Id: <b4505e936e1aee411f7132a27791cf138102f35f.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132151; l=2477; s=20211009;
 h=from:subject:message-id; bh=PJRWF5zilgXFq2l/yg0VrSmcXU+NGwvO/WufSwrFK+0=;
 b=8uNjnaYtWGp+q2mgdCMtZiuzz+gG6F1oGYN6JadbN2Xb8ADYwE/wtt2nrh4wpyUuXPiH/sSsUyWO
 oGo7nZ4+CkR/K0PFzcwJlJ3i3uF7Gzirx1EvRhKwm9W/nQqKVs5W
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/ftrace.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

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
-- 
2.35.1

