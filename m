Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD2D248DB2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:09:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJpN6bn4zDqkT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:09:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhq4FxzzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhk5Dztz9vCyB;
 Tue, 18 Aug 2020 19:19:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id W54zZwfeA2Jy; Tue, 18 Aug 2020 19:19:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhk4Rrcz9vCxg;
 Tue, 18 Aug 2020 19:19:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5CD128B7EC;
 Tue, 18 Aug 2020 19:19:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 83bRhZHVIJ95; Tue, 18 Aug 2020 19:19:36 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 15D3C8B7D7;
 Tue, 18 Aug 2020 19:19:36 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EA2BB65CF4; Tue, 18 Aug 2020 17:19:35 +0000 (UTC)
Message-Id: <29f6c4b8e7a5bbc61e6a8801b78bbf493f9f819e.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 23/25] powerpc/signal: Create 'unsafe' versions of
 copy_[ck][fpr/vsx]_to_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:35 +0000 (UTC)
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

For the non VSX version, that's trivial. Just use unsafe_copy_to_user()
instead of __copy_to_user().

For the VSX version, remove the intermediate step through a buffer and
use unsafe_put_user() directly. This generates a far smaller code which
is acceptable to inline, see below:

Standard VSX version:

0000000000000000 <.copy_fpr_to_user>:
   0:	7c 08 02 a6 	mflr    r0
   4:	fb e1 ff f8 	std     r31,-8(r1)
   8:	39 00 00 20 	li      r8,32
   c:	39 24 0b 80 	addi    r9,r4,2944
  10:	7d 09 03 a6 	mtctr   r8
  14:	f8 01 00 10 	std     r0,16(r1)
  18:	f8 21 fe 71 	stdu    r1,-400(r1)
  1c:	39 41 00 68 	addi    r10,r1,104
  20:	e9 09 00 00 	ld      r8,0(r9)
  24:	39 4a 00 08 	addi    r10,r10,8
  28:	39 29 00 10 	addi    r9,r9,16
  2c:	f9 0a 00 00 	std     r8,0(r10)
  30:	42 00 ff f0 	bdnz    20 <.copy_fpr_to_user+0x20>
  34:	e9 24 0d 80 	ld      r9,3456(r4)
  38:	3d 42 00 00 	addis   r10,r2,0
			3a: R_PPC64_TOC16_HA	.toc
  3c:	eb ea 00 00 	ld      r31,0(r10)
			3e: R_PPC64_TOC16_LO_DS	.toc
  40:	f9 21 01 70 	std     r9,368(r1)
  44:	e9 3f 00 00 	ld      r9,0(r31)
  48:	81 29 00 20 	lwz     r9,32(r9)
  4c:	2f 89 00 00 	cmpwi   cr7,r9,0
  50:	40 9c 00 18 	bge     cr7,68 <.copy_fpr_to_user+0x68>
  54:	4c 00 01 2c 	isync
  58:	3d 20 40 00 	lis     r9,16384
  5c:	79 29 07 c6 	rldicr  r9,r9,32,31
  60:	7d 3d 03 a6 	mtspr   29,r9
  64:	4c 00 01 2c 	isync
  68:	38 a0 01 08 	li      r5,264
  6c:	38 81 00 70 	addi    r4,r1,112
  70:	48 00 00 01 	bl      70 <.copy_fpr_to_user+0x70>
			70: R_PPC64_REL24	.__copy_tofrom_user
  74:	60 00 00 00 	nop
  78:	e9 3f 00 00 	ld      r9,0(r31)
  7c:	81 29 00 20 	lwz     r9,32(r9)
  80:	2f 89 00 00 	cmpwi   cr7,r9,0
  84:	40 9c 00 18 	bge     cr7,9c <.copy_fpr_to_user+0x9c>
  88:	4c 00 01 2c 	isync
  8c:	39 20 ff ff 	li      r9,-1
  90:	79 29 00 44 	rldicr  r9,r9,0,1
  94:	7d 3d 03 a6 	mtspr   29,r9
  98:	4c 00 01 2c 	isync
  9c:	38 21 01 90 	addi    r1,r1,400
  a0:	e8 01 00 10 	ld      r0,16(r1)
  a4:	eb e1 ff f8 	ld      r31,-8(r1)
  a8:	7c 08 03 a6 	mtlr    r0
  ac:	4e 80 00 20 	blr

'unsafe' simulated VSX version (The ... are only nops) using
unsafe_copy_fpr_to_user() macro:

unsigned long copy_fpr_to_user(void __user *to,
			       struct task_struct *task)
{
	unsafe_copy_fpr_to_user(to, task, failed);
	return 0;
failed:
	return 1;
}

0000000000000000 <.copy_fpr_to_user>:
   0:	39 00 00 20 	li      r8,32
   4:	39 44 0b 80 	addi    r10,r4,2944
   8:	7d 09 03 a6 	mtctr   r8
   c:	7c 69 1b 78 	mr      r9,r3
...
  20:	e9 0a 00 00 	ld      r8,0(r10)
  24:	f9 09 00 00 	std     r8,0(r9)
  28:	39 4a 00 10 	addi    r10,r10,16
  2c:	39 29 00 08 	addi    r9,r9,8
  30:	42 00 ff f0 	bdnz    20 <.copy_fpr_to_user+0x20>
  34:	e9 24 0d 80 	ld      r9,3456(r4)
  38:	f9 23 01 00 	std     r9,256(r3)
  3c:	38 60 00 00 	li      r3,0
  40:	4e 80 00 20 	blr
...
  50:	38 60 00 01 	li      r3,1
  54:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.h | 53 ++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index f610cfafa478..2559a681536e 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -32,7 +32,54 @@ unsigned long copy_fpr_to_user(void __user *to, struct task_struct *task);
 unsigned long copy_ckfpr_to_user(void __user *to, struct task_struct *task);
 unsigned long copy_fpr_from_user(struct task_struct *task, void __user *from);
 unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
+
+#define unsafe_copy_fpr_to_user(to, task, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *buf = (u64 __user *)to;				\
+	int i;								\
+									\
+	for (i = 0; i < ELF_NFPREG - 1 ; i++)				\
+		unsafe_put_user(__t->thread.TS_FPR(i), &buf[i], label); \
+	unsafe_put_user(__t->thread.fp_state.fpscr, &buf[i], label);	\
+} while (0)
+
+#define unsafe_copy_vsx_to_user(to, task, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *buf = (u64 __user *)to;				\
+	int i;								\
+									\
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
+		unsafe_put_user(__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET], \
+				&buf[i], label);\
+} while (0)
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+#define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *buf = (u64 __user *)to;				\
+	int i;								\
+									\
+	for (i = 0; i < ELF_NFPREG - 1 ; i++)				\
+		unsafe_put_user(__t->thread.TS_CKFPR(i), &buf[i], label);\
+	unsafe_put_user(__t->thread.ckfp_state.fpscr, &buf[i], label);	\
+} while (0)
+
+#define unsafe_copy_ckvsx_to_user(to, task, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *buf = (u64 __user *)to;				\
+	int i;								\
+									\
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
+		unsafe_put_user(__t->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET], \
+				&buf[i], label);\
+} while (0)
+#endif
 #elif defined(CONFIG_PPC_FPU_REGS)
+
+#define unsafe_copy_fpr_to_user(to, task, label)		\
+	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
+			    ELF_NFPREG * sizeof(double), label)
+
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
@@ -48,6 +95,10 @@ copy_fpr_from_user(struct task_struct *task, void __user *from)
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+#define unsafe_copy_ckfpr_to_user(to, task, label)		\
+	unsafe_copy_to_user(to, (task)->thread.ckfp_state.fpr,	\
+			    ELF_NFPREG * sizeof(double), label)
+
 inline unsigned long copy_ckfpr_to_user(void __user *to, struct task_struct *task)
 {
 	return __copy_to_user(to, task->thread.ckfp_state.fpr,
@@ -62,6 +113,8 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 #else
+#define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
+
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
-- 
2.25.0

