Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874C28F5E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtYM4s7NzDqG6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:31:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.82;
 helo=se17-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-3.privateemail.com (se17-3.privateemail.com
 [198.54.127.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBtWW2xPLzDq8M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:29:59 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kT4iT-0007nA-PN
 for linuxppc-dev@lists.ozlabs.org; Thu, 15 Oct 2020 07:58:56 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 2F552A72
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 1C97E8004A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:58:53 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id E32DB80041
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:52 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/8] powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
Date: Thu, 15 Oct 2020 10:01:53 -0500
Message-Id: <20201015150159.28933-3-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015150159.28933-1-cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
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
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhVJy4ll3Y+rVqw
 xys0n9VUYETNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7Q1BJPjLC+linl3KdipmSn1O05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgiwgDRmu5tQENuqerHYiwxW7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipWZHuZ2luxkemtGoNxZUQqTo/wKPvFA5qTwvBasVtSz0gfFrL3927nPLXidUYhzT
 L3iFCDAL0QosIifn4ScHG4ifU642KNtk4n/u8nyV2xsjehIqUczFWeS6sE8e1b5/Uj/i4hYVfUxI
 FxiN15g3w5xXw7ICF89SRx911u2+L1VDWTXxQxalx1UzmAX+Mm3XrOW0uaLZQljcZERS9mZeEk+X
 3WtpGkwPTDHzV0f8RZra1m+Kp1KCPGoyG38yARaHof3QzxUBjDlIxq/CY6GWA8+LBDMrD7q/cJog
 wbqzsuoky0Qu9o0UsJYe8KzUZOzYBJq7nLN6wi0+LTtGPl8kCiqRsjtBYSmMAZnDo+4asne4oNPR
 aVdgWb/lZngCA+zCuXLYM3A6BXfvel8OEFDbU52Uoxy7ZVs22aLE5aXKh2Z2/SyswYYxeanpYW+O
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
2.28.0

