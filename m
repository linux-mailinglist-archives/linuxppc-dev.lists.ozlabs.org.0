Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A08341B22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:07:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21MX4WvKz3cTq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21LW4Rc6z309Z
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:06:56 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LN5yXyz9tx8v;
 Fri, 19 Mar 2021 12:06:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tnfqdHMtUISF; Fri, 19 Mar 2021 12:06:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LN4TLpz9tx8s;
 Fri, 19 Mar 2021 12:06:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A39568B972;
 Fri, 19 Mar 2021 12:06:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rblkNPUr3rg3; Fri, 19 Mar 2021 12:06:53 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0BE1B8B978;
 Fri, 19 Mar 2021 12:06:53 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BA18A675FB; Fri, 19 Mar 2021 11:06:52 +0000 (UTC)
Message-Id: <1040687aa27553d19f749f7fb48f0c07af98ee2d.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 03/10] powerpc/signal: Add unsafe_copy_ck{fpr/vsx}_from_user
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:06:52 +0000 (UTC)
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

Add unsafe_copy_ckfpr_from_user() and unsafe_copy_ckvsx_from_user()

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 1393876f3814..a5152ff3c52f 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -100,6 +100,26 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
 		unsafe_put_user(__t->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET], \
 				&buf[i], label);\
 } while (0)
+
+#define unsafe_copy_ckfpr_from_user(task, from, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *buf = (u64 __user *)from;				\
+	int i;								\
+									\
+	for (i = 0; i < ELF_NFPREG - 1 ; i++)				\
+		unsafe_get_user(__t->thread.TS_CKFPR(i), &buf[i], label);\
+	unsafe_get_user(__t->thread.ckfp_state.fpscr, &buf[i], failed);	\
+} while (0)
+
+#define unsafe_copy_ckvsx_from_user(task, from, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *buf = (u64 __user *)from;				\
+	int i;								\
+									\
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
+		unsafe_get_user(__t->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET], \
+				&buf[i], label);			\
+} while (0)
 #endif
 #elif defined(CONFIG_PPC_FPU_REGS)
 
-- 
2.25.0

