Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8162A76D2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:15:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRWtC0JVjzDqlw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:14:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.80;
 helo=se17-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-1.privateemail.com (se17-1.privateemail.com
 [198.54.127.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrZ5LdYzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:34 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kaXaS-000378-6U
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Nov 2020 21:13:31 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 1D27CA74
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 01E9180046
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:13:28 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id C260380041
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:27 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/8] powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
Date: Wed,  4 Nov 2020 23:16:55 -0600
Message-Id: <20201105051701.25053-3-cmr@codefail.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201105051701.25053-1-cmr@codefail.de>
References: <20201105051701.25053-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.07)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVBKpEWXRB/2yj
 5qOWfjv8W0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7zWpOHJR6QFwEFsLjZjV09VO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgiwgDRmu5tQENuqerHYiwxW7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipWZHuZ2luxkemtGoNxZUQqTo/wKPvFA5qTwvBasVtSz0gfFrL3927nPLXidUYhzT
 L3iFCDAL0QosIifn4ScHG4ifU642KNtk4n/u8nyV2xsjehIqUczFWeS6sE8e1b5/Uj/i4hYVfUxI
 FxiN15g3w5xXw7ICF89SRx911u2+L1VDtPQaFYH1+UC6ii/fq1Ezt9LxGEg2sm2tlgP2XvW3pgLq
 U7es+abtIe8TjwNfoTPy1m+Kp1KCPGoyG38yARaHof3QzxUBjDlIxq/CY6GWA8+LBDMrD7q/cJog
 wbqzsuoky0Qu9o0UsJYe8KzUZOzYBJq7nLN6wi0+LTtGPl8kCiqvQ3dW14fcwg6tXLnl97pefwnd
 cM4lFex8qnvxMplaenLYM3A6BXfvel8OEFDbU52Uoxy7ZVs22aLE5aXKh2Z2/SyswYYxeanpYW+O
 DenQmhIuIkxkuoNHoZV8ALzej/7m/TG6mPfH0STtFp8lq4mlVm2lHuINJIGiJ73RKeuKpUVINNG3
 OVUHjoaAVY6FvR05Ix7/C9VwqPH/5QpQnZ0BJh1tDfjT4hz4J/ncsYb09chmWIDGRew9XvW9QFDz
 YgSG3lyuFjEDwoOBw76gv6dU
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
unsafe_copy_from_user() to copy into a local buffer. Unlike the
unsafe_copy_{vsx,fpr}_to_user() functions the "copy from" functions
cannot use unsafe_get_user() directly to bypass the local buffer since
doing so significantly reduces signal handling performance.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal.h | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 2559a681536e..e9aaeac0da37 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -53,6 +53,33 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
 				&buf[i], label);\
 } while (0)
 
+#define unsafe_copy_fpr_from_user(task, from, label)	do {		\
+	struct task_struct *__t = task;					\
+	u64 __user *__f = (u64 __user *)from;				\
+	u64 buf[ELF_NFPREG];						\
+	int i;								\
+									\
+	unsafe_copy_from_user(buf, __f, ELF_NFPREG * sizeof(double),	\
+				label);					\
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
+	unsafe_copy_from_user(buf, __f,					\
+				ELF_NVSRHALFREG * sizeof(double),	\
+				label);					\
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)				\
+		__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];	\
+} while (0)
+
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 #define unsafe_copy_ckfpr_to_user(to, task, label)	do {		\
 	struct task_struct *__t = task;					\
@@ -80,6 +107,10 @@ unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
 	unsafe_copy_to_user(to, (task)->thread.fp_state.fpr,	\
 			    ELF_NFPREG * sizeof(double), label)
 
+#define unsafe_copy_fpr_from_user(task, from, label)		\
+	unsafe_copy_from_user((task)->thread.fp_state.fpr, from	\
+			    ELF_NFPREG * sizeof(double), label)
+
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
@@ -115,6 +146,8 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
 #else
 #define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
 
+#define unsafe_copy_fpr_from_user(task, from, label) do { } while (0)
+
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
-- 
2.29.0

