Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91BF846014D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 20:53:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J1j3D364vz3ddG
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Nov 2021 06:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J1j276cXwz3cX7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 06:52:31 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J1j252rV2z9sS7;
 Sat, 27 Nov 2021 20:52:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78ZryGzgy2BU; Sat, 27 Nov 2021 20:52:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J1j1Z4cqRz9sTR;
 Sat, 27 Nov 2021 20:52:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 34A158B8DF;
 Sat, 27 Nov 2021 19:10:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id z0qgJtU9YqUn; Sat, 27 Nov 2021 19:10:30 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.42])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B02A78B8D7;
 Sat, 27 Nov 2021 19:10:29 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1ARIAPDQ636665
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 27 Nov 2021 19:10:25 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1ARIAPup636664;
 Sat, 27 Nov 2021 19:10:25 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 4/4] powerpc/inst: Optimise copy_inst_from_kernel_nofault()
Date: Sat, 27 Nov 2021 19:10:21 +0100
Message-Id: <cfcff31e25dd6556b6cdf85842fb4e70174fabaa.1638036607.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <1a8623dce54a72c7af172027caa7c44b1fefa8c4.1638036607.git.christophe.leroy@csgroup.eu>
References: <1a8623dce54a72c7af172027caa7c44b1fefa8c4.1638036607.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638036620; l=3300; s=20211009;
 h=from:subject:message-id; bh=IdNITOHp0ZJtwwy0pcHpo6JIookQdMzltACEhR0ayKY=;
 b=EbGkicskvU+UOqZ2UG5nVlgaFy8SoJD9754zk8P9mydwg6cpx1ncbVk3JzES0Jb0Z8xljaun1FWu
 zPM9pB2JD4wp1fqyjeJXLj9655okeeTG9bjLA+Kd+9LBOU8Coa8F
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

After the patch:

	00000018 <copy_inst_from_kernel_nofault>:
	  18:	3d 20 b0 00 	lis     r9,-20480
	  1c:	7c 04 48 40 	cmplw   r4,r9
	  20:	7c 69 1b 78 	mr      r9,r3
	  24:	41 80 00 2c 	blt     50 <copy_inst_from_kernel_nofault+0x38>
	  28:	81 42 04 d0 	lwz     r10,1232(r2)
	  2c:	39 4a 00 01 	addi    r10,r10,1
	  30:	91 42 04 d0 	stw     r10,1232(r2)
	  34:	80 e4 00 00 	lwz     r7,0(r4)
	  38:	81 42 04 d0 	lwz     r10,1232(r2)
	  3c:	38 60 00 00 	li      r3,0
	  40:	39 4a ff ff 	addi    r10,r10,-1
	  44:	91 42 04 d0 	stw     r10,1232(r2)
	  48:	90 e9 00 00 	stw     r7,0(r9)
	  4c:	4e 80 00 20 	blr

	  50:	38 60 ff de 	li      r3,-34
	  54:	4e 80 00 20 	blr
	  58:	81 22 04 d0 	lwz     r9,1232(r2)
	  5c:	38 60 ff f2 	li      r3,-14
	  60:	39 29 ff ff 	addi    r9,r9,-1
	  64:	91 22 04 d0 	stw     r9,1232(r2)
	  68:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: New
---
 arch/powerpc/mm/maccess.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/maccess.c b/arch/powerpc/mm/maccess.c
index 5abae96b2b46..90309806f5eb 100644
--- a/arch/powerpc/mm/maccess.c
+++ b/arch/powerpc/mm/maccess.c
@@ -15,16 +15,22 @@ bool copy_from_kernel_nofault_allowed(const void *unsafe_src, size_t size)
 int copy_inst_from_kernel_nofault(ppc_inst_t *inst, u32 *src)
 {
 	unsigned int val, suffix;
-	int err;
 
-	err = copy_from_kernel_nofault(&val, src, sizeof(val));
-	if (err)
-		return err;
+	if (unlikely(!is_kernel_addr((unsigned long)src)))
+		return -ERANGE;
+
+	pagefault_disable();
+	__get_kernel_nofault(&val, src, u32, Efault);
 	if (IS_ENABLED(CONFIG_PPC64) && get_op(val) == OP_PREFIX) {
-		err = copy_from_kernel_nofault(&suffix, src + 1, sizeof(suffix));
+		__get_kernel_nofault(&suffix, src + 1, u32, Efault);
+		pagefault_enable();
 		*inst = ppc_inst_prefix(val, suffix);
 	} else {
+		pagefault_enable();
 		*inst = ppc_inst(val);
 	}
-	return err;
+	return 0;
+Efault:
+	pagefault_enable();
+	return -EFAULT;
 }
-- 
2.33.1

