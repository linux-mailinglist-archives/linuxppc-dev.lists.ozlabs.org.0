Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26A63254C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 18:51:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmgMS4545z3d7d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 04:51:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmgLR5bKVz3cY9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 04:50:36 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DmgLJ0trMz9v1B3;
 Thu, 25 Feb 2021 18:50:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Y_K27AuZqyRY; Thu, 25 Feb 2021 18:50:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DmgLJ04p9z9v19y;
 Thu, 25 Feb 2021 18:50:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 823958B895;
 Thu, 25 Feb 2021 18:50:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id x4-dAar3FAUb; Thu, 25 Feb 2021 18:50:33 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1ABF08B88B;
 Thu, 25 Feb 2021 18:50:33 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EB78867442; Thu, 25 Feb 2021 17:50:32 +0000 (UTC)
Message-Id: <8732e0c78400c99ec418323ab6b0853b91752be4.1614275314.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1614275314.git.christophe.leroy@csgroup.eu>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 03/15] powerpc/uaccess: Remove __get/put_user_inatomic()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 25 Feb 2021 17:50:32 +0000 (UTC)
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

Since commit 662bbcb2747c ("mm, sched: Allow uaccess in atomic with
pagefault_disable()"), __get/put_user() can be used in atomic parts
of the code, therefore the __get/put_user_inatomic() introduced
by commit e68c825bb016 ("[POWERPC] Add inatomic versions of __get_user
and __put_user") have become useless.

powerpc is the only one having such functions. There is a real
intention not to have to provide such _inatomic() helpers, see the
comment in might_fault() in mm/memory.c introduced by
commit 3ee1afa308f2 ("x86: some lock annotations for user
copy paths, v2"):

	/*
	 * it would be nicer only to annotate paths which are not under
	 * pagefault_disable, however that requires a larger audit and
	 * providing helpers like get_user_atomic.
	 */

So remove __get_user_inatomic() and __put_user_inatomic().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h            | 37 -------------------
 arch/powerpc/kernel/align.c                   | 32 ++++++++--------
 .../kernel/hw_breakpoint_constraints.c        |  2 +-
 arch/powerpc/kernel/traps.c                   |  2 +-
 4 files changed, 18 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a08c482b1315..01aea0df4dd0 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -53,11 +53,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 #define __put_user(x, ptr) \
 	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
-#define __get_user_inatomic(x, ptr) \
-	__get_user_nosleep((x), (ptr), sizeof(*(ptr)))
-#define __put_user_inatomic(x, ptr) \
-	__put_user_nosleep((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
-
 #ifdef CONFIG_PPC64
 
 #define ___get_user_instr(gu_op, dest, ptr)				\
@@ -92,9 +87,6 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 #define __get_user_instr(x, ptr) \
 	___get_user_instr(__get_user, x, ptr)
 
-#define __get_user_instr_inatomic(x, ptr) \
-	___get_user_instr(__get_user_inatomic, x, ptr)
-
 extern long __put_user_bad(void);
 
 #define __put_user_size(x, ptr, size, retval)			\
@@ -141,20 +133,6 @@ __pu_failed:							\
 	__pu_err;							\
 })
 
-#define __put_user_nosleep(x, ptr, size)			\
-({								\
-	long __pu_err;						\
-	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
-	__typeof__(*(ptr)) __pu_val = (x);			\
-	__typeof__(size) __pu_size = (size);			\
-								\
-	__chk_user_ptr(__pu_addr);				\
-	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
-								\
-	__pu_err;						\
-})
-
-
 /*
  * We don't tell gcc that we are accessing memory, but this is OK
  * because we do not write to any memory gcc knows about, so there
@@ -320,21 +298,6 @@ do {								\
 	__gu_err;							\
 })
 
-#define __get_user_nosleep(x, ptr, size)			\
-({								\
-	long __gu_err;						\
-	__long_type(*(ptr)) __gu_val;				\
-	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
-	__typeof__(size) __gu_size = (size);			\
-								\
-	__chk_user_ptr(__gu_addr);				\
-	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
-	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
-								\
-	__gu_err;						\
-})
-
-
 /* more complex routines */
 
 extern unsigned long __copy_tofrom_user(void __user *to,
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index c7797eb958c7..83b199026a1e 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -174,18 +174,18 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 
 		switch (nb) {
 		case 8:
-			ret |= __get_user_inatomic(temp.v[0], p++);
-			ret |= __get_user_inatomic(temp.v[1], p++);
-			ret |= __get_user_inatomic(temp.v[2], p++);
-			ret |= __get_user_inatomic(temp.v[3], p++);
+			ret |= __get_user(temp.v[0], p++);
+			ret |= __get_user(temp.v[1], p++);
+			ret |= __get_user(temp.v[2], p++);
+			ret |= __get_user(temp.v[3], p++);
 			fallthrough;
 		case 4:
-			ret |= __get_user_inatomic(temp.v[4], p++);
-			ret |= __get_user_inatomic(temp.v[5], p++);
+			ret |= __get_user(temp.v[4], p++);
+			ret |= __get_user(temp.v[5], p++);
 			fallthrough;
 		case 2:
-			ret |= __get_user_inatomic(temp.v[6], p++);
-			ret |= __get_user_inatomic(temp.v[7], p++);
+			ret |= __get_user(temp.v[6], p++);
+			ret |= __get_user(temp.v[7], p++);
 			if (unlikely(ret))
 				return -EFAULT;
 		}
@@ -259,18 +259,18 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 		p = addr;
 		switch (nb) {
 		case 8:
-			ret |= __put_user_inatomic(data.v[0], p++);
-			ret |= __put_user_inatomic(data.v[1], p++);
-			ret |= __put_user_inatomic(data.v[2], p++);
-			ret |= __put_user_inatomic(data.v[3], p++);
+			ret |= __put_user(data.v[0], p++);
+			ret |= __put_user(data.v[1], p++);
+			ret |= __put_user(data.v[2], p++);
+			ret |= __put_user(data.v[3], p++);
 			fallthrough;
 		case 4:
-			ret |= __put_user_inatomic(data.v[4], p++);
-			ret |= __put_user_inatomic(data.v[5], p++);
+			ret |= __put_user(data.v[4], p++);
+			ret |= __put_user(data.v[5], p++);
 			fallthrough;
 		case 2:
-			ret |= __put_user_inatomic(data.v[6], p++);
-			ret |= __put_user_inatomic(data.v[7], p++);
+			ret |= __put_user(data.v[6], p++);
+			ret |= __put_user(data.v[7], p++);
 		}
 		if (unlikely(ret))
 			return -EFAULT;
diff --git a/arch/powerpc/kernel/hw_breakpoint_constraints.c b/arch/powerpc/kernel/hw_breakpoint_constraints.c
index 867ee4aa026a..675d1f66ab72 100644
--- a/arch/powerpc/kernel/hw_breakpoint_constraints.c
+++ b/arch/powerpc/kernel/hw_breakpoint_constraints.c
@@ -141,7 +141,7 @@ void wp_get_instr_detail(struct pt_regs *regs, struct ppc_inst *instr,
 {
 	struct instruction_op op;
 
-	if (__get_user_instr_inatomic(*instr, (void __user *)regs->nip))
+	if (__get_user_instr(*instr, (void __user *)regs->nip))
 		return;
 
 	analyse_instr(&op, regs, *instr);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 1583fd1c6010..1fa36bd08efe 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -864,7 +864,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
 	unsigned long ea, msr, msr_mask;
 	bool swap;
 
-	if (__get_user_inatomic(instr, (unsigned int __user *)regs->nip))
+	if (__get_user(instr, (unsigned int __user *)regs->nip))
 		return;
 
 	/*
-- 
2.25.0

