Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2270030E2BB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:45:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW9bR3KYMzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.27;
 helo=mta-07-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW9Yg0hw1zDwts
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 05:43:33 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 71FCA6004E
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 13:43:30 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.227])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 4261C6005B
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 18:43:30 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 02/10] powerpc/signal: Add unsafe_copy_{vsx,
 fpr}_from_user()
Date: Wed,  3 Feb 2021 12:43:15 -0600
Message-Id: <20210203184323.20792-3-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210203184323.20792-1-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reuse the "safe" implementation from signal.c except for calling
unsafe_copy_from_user() to copy into a local buffer.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 2559a681536e..7dfc536c78ef 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -53,6 +53,30 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
 				&buf[i], label);\
 } while (0)
 
+#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *__f = (u64 __user *)from;				\
+	u64 buf[ELF_NFPREG];						\
+	int i;								\
+									\
+	unsafe_copy_from_user(buf, __f, sizeof(buf), label);		\
+	for (i = 0; i < ELF_NFPREG - 1; i++)				\
+		__t->thread.TS_FPR(i) = buf[i];				\
+	__t->thread.fp_state.fpscr = buf[i];				\
+} while (0)
+
+#define unsafe_copy_vsx_from_user(task, from, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *__f = (u64 __user *)from;				\
+	u64 buf[ELF_NVSRHALFREG];					\
+	int i;								\
+									\
+	unsafe_copy_from_user(buf, __f, sizeof(buf), label);		\
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
+		__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];	\
+} while (0)
+
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 #define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
 	struct task_struct *__t = task;					\
@@ -80,6 +104,10 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
 	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
 			    ELF_NFPREG * sizeof(double), label)
 
+#define unsafe_copy_fpr_from_user(task, from, label)			\
+	unsafe_copy_from_user((task)->thread.fp_state.fpr, from,	\
+			    ELF_NFPREG * sizeof(double), label)
+
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
@@ -115,6 +143,8 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
 #else
 #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
 
+#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
+
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
-- 
2.26.1

