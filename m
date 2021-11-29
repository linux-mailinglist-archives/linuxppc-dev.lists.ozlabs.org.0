Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E9461459
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 12:54:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2kKf0JHnz3dck
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 22:54:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2kJS4f8hz3cCG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 22:53:28 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J2kJF6QMGz9sSc;
 Mon, 29 Nov 2021 12:53:17 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gF7Ll6T2J5Dd; Mon, 29 Nov 2021 12:53:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J2kJC420zz9sSg;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 71D778B781;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id X8K55WBD11JD; Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 412F78B770;
 Mon, 29 Nov 2021 12:53:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ATBr7t2895129
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 12:53:07 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ATBr7Tp895128;
 Mon, 29 Nov 2021 12:53:07 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 5/5] powerpc/inst: Optimise copy_inst_from_kernel_nofault()
Date: Mon, 29 Nov 2021 12:53:05 +0100
Message-Id: <27cccfa77f3ff91a26dc9d298698588cf35d9815.1638186774.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
References: <97a171efd8c582e2bae82c31f2a9519823a20d3f.1638186773.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638186784; l=4590; s=20211009;
 h=from:subject:message-id; bh=5cncWdyLGDXpNOjK0yNkxRyTVcdpacNyA/eJmA5PCx4=;
 b=0DS32NkYCEPDjkbt9gm25XJmUlEclINcaMFp5MinTw52rkp9OOdy/F+tdRKGG6KIeNKsRsS7qzuq
 HLzmo5xTDj4omTzIsWHePmLk1ZRXakRsPSvPfF3Jbq0LE/yolkmx
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

copy_inst_from_kernel_nofault() uses copy_from_kernel_nofault() to
copy one or two 32bits words. This means calling an out-of-line
function which itself calls back copy_from_kernel_nofault_allowed()
then performs a generic copy with loops.

Rewrite copy_inst_from_kernel_nofault() to do everything at a
single place and use __get_kernel_nofault() directly to perform
single accesses without loops.

Allthough the generic function uses pagefault_disable(), it is not
required on powerpc because do_page_fault() bails earlier when a
kernel mode fault happens on a kernel address.

As the function has now become very small, inline it.

With this change, on an 8xx the time spent in the loop in
ftrace_replace_code() is reduced by 23% at function tracer activation
and 27% at nop tracer activation.
The overall time to activate function tracer (measured with shell
command 'time') is 570ms before the patch and 470ms after the patch.

Even vmlinux size is reduced (by 152 instruction).

Before the patch:

	00000018 <copy_inst_from_kernel_nofault>:
	  18:	94 21 ff e0 	stwu    r1,-32(r1)
	  1c:	7c 08 02 a6 	mflr    r0
	  20:	38 a0 00 04 	li      r5,4
	  24:	93 e1 00 1c 	stw     r31,28(r1)
	  28:	7c 7f 1b 78 	mr      r31,r3
	  2c:	38 61 00 08 	addi    r3,r1,8
	  30:	90 01 00 24 	stw     r0,36(r1)
	  34:	48 00 00 01 	bl      34 <copy_inst_from_kernel_nofault+0x1c>
				34: R_PPC_REL24	copy_from_kernel_nofault
	  38:	2c 03 00 00 	cmpwi   r3,0
	  3c:	40 82 00 0c 	bne     48 <copy_inst_from_kernel_nofault+0x30>
	  40:	81 21 00 08 	lwz     r9,8(r1)
	  44:	91 3f 00 00 	stw     r9,0(r31)
	  48:	80 01 00 24 	lwz     r0,36(r1)
	  4c:	83 e1 00 1c 	lwz     r31,28(r1)
	  50:	38 21 00 20 	addi    r1,r1,32
	  54:	7c 08 03 a6 	mtlr    r0
	  58:	4e 80 00 20 	blr

After the patch (before inlining):

	00000018 <copy_inst_from_kernel_nofault>:
	  18:	3d 20 b0 00 	lis     r9,-20480
	  1c:	7c 04 48 40 	cmplw   r4,r9
	  20:	7c 69 1b 78 	mr      r9,r3
	  24:	41 80 00 14 	blt     38 <copy_inst_from_kernel_nofault+0x20>
	  28:	81 44 00 00 	lwz     r10,0(r4)
	  2c:	38 60 00 00 	li      r3,0
	  30:	91 49 00 00 	stw     r10,0(r9)
	  34:	4e 80 00 20 	blr

	  38:	38 60 ff de 	li      r3,-34
	  3c:	4e 80 00 20 	blr
	  40:	38 60 ff f2 	li      r3,-14
	  44:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v4: Inline and remove pagefault_disable()

v3: New
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/inst.h | 21 ++++++++++++++++++++-
 arch/powerpc/mm/maccess.c       | 17 -----------------
 2 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 86074e83d2a5..0aa811ff44d5 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -4,6 +4,8 @@
 
 #include <asm/ppc-opcode.h>
 #include <asm/reg.h>
+#include <asm/disassemble.h>
+#include <asm/uaccess.h>
 
 #define ___get_user_instr(gu_op, dest, ptr)				\
 ({									\
@@ -148,6 +150,23 @@ static inline char *__ppc_inst_as_str(char str[PPC_INST_STR_LEN], ppc_inst_t x)
 	__str;				\
 })
 
-int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src);
+static inline int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
+{
+	unsigned int val, suffix;
+
+	if (unlikely(!is_kernel_addr((unsigned long)src)))
+		return -ERANGE;
+
+	__get_kernel_nofault(&val, src, u32, Efault);
+	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
+		__get_kernel_nofault(&suffix, src + 1, u32, Efault);
+		*inst = ppc_inst_prefix(val, suffix);
+	} else {
+		*inst = ppc_inst(val);
+	}
+	return 0;
+Efault:
+	return -EFAULT;
+}
 
 #endif /* _ASM_POWERPC_INST_H */
diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index 5abae96b2b46..ea821d0ffe16 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -11,20 +11,3 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 {
 	return is_kernel_addr((unsigned long)unsafe_src);
 }
-
-int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
-{
-	unsigned int val, suffix;
-	int err;
-
-	err = copy_from_kernel_nofault(&val, src, sizeof(val));
-	if (err)
-		return err;
-	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
-		err = copy_from_kernel_nofault(&suffix, src + 1, sizeof(suffix));
-		*inst = ppc_inst_prefix(val, suffix);
-	} else {
-		*inst = ppc_inst(val);
-	}
-	return err;
-}
-- 
2.33.1

