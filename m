Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C833457A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:48:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwfgc11qbz3drF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwff00Hqqz30Nd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:46:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfds3zNXz9tytR;
 Wed, 10 Mar 2021 18:46:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id gFftkTX1eK-3; Wed, 10 Mar 2021 18:46:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfds1SGMz9tytQ;
 Wed, 10 Mar 2021 18:46:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E19FC8B78D;
 Wed, 10 Mar 2021 18:46:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id We2PYwZuqqpA; Wed, 10 Mar 2021 18:46:42 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A3B3D8B77E;
 Wed, 10 Mar 2021 18:46:42 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 81C8B67568; Wed, 10 Mar 2021 17:46:42 +0000 (UTC)
Message-Id: <0ad4629c2d222019e82fcdfccc70d372beb4adf9.1615398265.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 03/15] powerpc/align: Convert emulate_spe() to
 user_access_begin
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:46:42 +0000 (UTC)
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

This patch converts emulate_spe() to using user_access_being
logic.

Since commit 662bbcb2747c ("mm, sched: Allow uaccess in atomic with
pagefault_disable()"), might_fault() doesn't fire when called from
sections where pagefaults are disabled, which must be the case
when using _inatomic variants of __get_user and __put_user. So
the might_fault() in user_access_begin() is not a problem.

There was a verification of user_mode() together with the access_ok(),
but the function returns in case !user_mode() immediately after
the access_ok() verification, so removing that test has no effect.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/align.c | 61 ++++++++++++++++++++-----------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index c7797eb958c7..c4d7b445b459 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -107,7 +107,6 @@ static struct aligninfo spe_aligninfo[32] = {
 static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 		       struct ppc_inst ppc_instr)
 {
-	int ret;
 	union {
 		u64 ll;
 		u32 w[2];
@@ -127,11 +126,6 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 	nb = spe_aligninfo[instr].len;
 	flags = spe_aligninfo[instr].flags;
 
-	/* Verify the address of the operand */
-	if (unlikely(user_mode(regs) &&
-		     !access_ok(addr, nb)))
-		return -EFAULT;
-
 	/* userland only */
 	if (unlikely(!user_mode(regs)))
 		return 0;
@@ -169,26 +163,27 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 		}
 	} else {
 		temp.ll = data.ll = 0;
-		ret = 0;
 		p = addr;
 
+		if (!user_read_access_begin(addr, nb))
+			return -EFAULT;
+
 		switch (nb) {
 		case 8:
-			ret |= __get_user_inatomic(temp.v[0], p++);
-			ret |= __get_user_inatomic(temp.v[1], p++);
-			ret |= __get_user_inatomic(temp.v[2], p++);
-			ret |= __get_user_inatomic(temp.v[3], p++);
+			unsafe_get_user(temp.v[0], p++, Efault_read);
+			unsafe_get_user(temp.v[1], p++, Efault_read);
+			unsafe_get_user(temp.v[2], p++, Efault_read);
+			unsafe_get_user(temp.v[3], p++, Efault_read);
 			fallthrough;
 		case 4:
-			ret |= __get_user_inatomic(temp.v[4], p++);
-			ret |= __get_user_inatomic(temp.v[5], p++);
+			unsafe_get_user(temp.v[4], p++, Efault_read);
+			unsafe_get_user(temp.v[5], p++, Efault_read);
 			fallthrough;
 		case 2:
-			ret |= __get_user_inatomic(temp.v[6], p++);
-			ret |= __get_user_inatomic(temp.v[7], p++);
-			if (unlikely(ret))
-				return -EFAULT;
+			unsafe_get_user(temp.v[6], p++, Efault_read);
+			unsafe_get_user(temp.v[7], p++, Efault_read);
 		}
+		user_read_access_end();
 
 		switch (instr) {
 		case EVLDD:
@@ -255,31 +250,41 @@ static int emulate_spe(struct pt_regs *regs, unsigned int reg,
 
 	/* Store result to memory or update registers */
 	if (flags & ST) {
-		ret = 0;
 		p = addr;
+
+		if (!user_read_access_begin(addr, nb))
+			return -EFAULT;
+
 		switch (nb) {
 		case 8:
-			ret |= __put_user_inatomic(data.v[0], p++);
-			ret |= __put_user_inatomic(data.v[1], p++);
-			ret |= __put_user_inatomic(data.v[2], p++);
-			ret |= __put_user_inatomic(data.v[3], p++);
+			unsafe_put_user(data.v[0], p++, Efault_write);
+			unsafe_put_user(data.v[1], p++, Efault_write);
+			unsafe_put_user(data.v[2], p++, Efault_write);
+			unsafe_put_user(data.v[3], p++, Efault_write);
 			fallthrough;
 		case 4:
-			ret |= __put_user_inatomic(data.v[4], p++);
-			ret |= __put_user_inatomic(data.v[5], p++);
+			unsafe_put_user(data.v[4], p++, Efault_write);
+			unsafe_put_user(data.v[5], p++, Efault_write);
 			fallthrough;
 		case 2:
-			ret |= __put_user_inatomic(data.v[6], p++);
-			ret |= __put_user_inatomic(data.v[7], p++);
+			unsafe_put_user(data.v[6], p++, Efault_write);
+			unsafe_put_user(data.v[7], p++, Efault_write);
 		}
-		if (unlikely(ret))
-			return -EFAULT;
+		user_write_access_end();
 	} else {
 		*evr = data.w[0];
 		regs->gpr[reg] = data.w[1];
 	}
 
 	return 1;
+
+Efault_read:
+	user_read_access_end();
+	return -EFAULT;
+
+Efault_write:
+	user_write_access_end();
+	return -EFAULT;
 }
 #endif /* CONFIG_SPE */
 
-- 
2.25.0

