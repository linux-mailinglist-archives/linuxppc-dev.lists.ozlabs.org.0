Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F63C8EA62
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 13:35:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468PX41wzSzDr3f
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 21:35:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=gromero@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4681y023S6zDqtQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 06:53:07 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EKq6fB195946; Wed, 14 Aug 2019 16:53:02 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ucr0skng6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2019 16:53:02 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7EKidQo017868;
 Wed, 14 Aug 2019 20:53:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 2u9nj64hs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Aug 2019 20:53:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7EKr0qG55378326
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 20:53:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4187C7805E;
 Wed, 14 Aug 2019 20:53:00 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37C8078066;
 Wed, 14 Aug 2019 20:52:57 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.161.5])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 14 Aug 2019 20:52:56 +0000 (GMT)
From: Gustavo Romero <gromero@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/selftests: Fix and enhance TM signal context tests
Date: Wed, 14 Aug 2019 15:52:11 -0500
Message-Id: <20190814205211.24840-1-gromero@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140189
X-Mailman-Approved-At: Thu, 15 Aug 2019 21:33:39 +1000
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
Cc: mikey@neuling.org, Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently TM signal context tests for GPR, FPR, VMX, and VSX registers
print wrong register numbers (wrongly starting from register 0 instead of
the first register in the non-volatile subset). Besides it the output when
a mismatch happens is poor giving not much information about which context
and which register mismatches, because it prints both contexts at the same
time and not a comparison between the value that mismatches and the value
expected and, moreover, it stops printing on the first mismatch, but it's
important to know if there are other mismatches happening beyond the first
one.

For instance, this is the current output when a mismatch happens:

test: tm_signal_context_chk_gpr
tags: git_version:v5.2-8249-g02e970fae465-dirty
Failed on 0 GPR 1 or 18446744073709551615
failure: tm_signal_context_chk_gpr

test: tm_signal_context_chk_fpu
tags: git_version:v5.2-8248-g09c289e3ef80
Failed on 0 FP -1 or -1
failure: tm_signal_context_chk_fpu

test: tm_signal_context_chk_vmx
tags: git_version:v5.2-8248-g09c289e3ef80
Failed on 0 vmx 0xfffffffffffffffefffffffdfffffffc vs 0xfffffffffffffffefffffffdfffffffc
failure: tm_signal_context_chk_vmx

test: tm_signal_context_chk_vsx
tags: git_version:v5.2-8248-g09c289e3ef80
Failed on 0 vsx 0xfffffffffefffffffdfffffffcffffff vs 0xfffffffffefffffffdfffffffcffffff
failure: tm_signal_context_chk_vsx

This commit fixes the register numbers printed and enhances the error
output by providing a full list of mismatching registers separated by the
context (non-speculative or speculative context), for example:

test: tm_signal_context_chk_gpr
tags: git_version:v5.2-8249-g02e970fae465-dirty
GPR14 (1st context) == 1 instead of -1 (expected)
GPR15 (1st context) == 2 instead of -2 (expected)
GPR14 (2nd context) == 0 instead of 18446744073709551615 (expected)
GPR15 (2nd context) == 0 instead of 18446744073709551614 (expected)
failure: tm_signal_context_chk_gpr

test: tm_signal_context_chk_fpu
tags: git_version:v5.2-8249-g02e970fae465-dirty
FPR14 (1st context) == -1 instead of 1 (expected)
FPR15 (1st context) == -2 instead of 2 (expected)
failure: tm_signal_context_chk_fpu

test: tm_signal_context_chk_vmx
tags: git_version:v5.2-8249-g02e970fae465-dirty
VMX20 (1st context) == 0xfffffffffffffffefffffffdfffffffc instead of 0x00000001000000020000000300000004 (expected)
VMX21 (1st context) == 0xfffffffbfffffffafffffff9fffffff8 instead of 0x00000005000000060000000700000008 (expected)
failure: tm_signal_context_chk_vmx

test: tm_signal_context_chk_vsx
tags: git_version:v5.2-8249-g02e970fae465-dirty
VSX20 (1st context) == 0xfffffffffefffffffdfffffffcffffff instead of 0x00000001000000020000000300000004 (expected)
VSX21 (1st context) == 0xfbfffffffafffffff9fffffff8ffffff instead of 0x00000005000000060000000700000008 (expected)
failure: tm_signal_context_chk_vsx

Finally, this commit adds comments to the tests in the hope that it will
help people not so familiar with TM understand the tests.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
---
 .../powerpc/tm/tm-signal-context-chk-fpu.c    |  49 +++++--
 .../powerpc/tm/tm-signal-context-chk-gpr.c    |  59 +++++---
 .../powerpc/tm/tm-signal-context-chk-vmx.c    |  74 +++++++---
 .../powerpc/tm/tm-signal-context-chk-vsx.c    | 130 +++++++++++++-----
 4 files changed, 228 insertions(+), 84 deletions(-)

diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c
index d57c2d2ab6ec..254f912ad611 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-fpu.c
@@ -5,10 +5,11 @@
  * Test the kernel's signal frame code.
  *
  * The kernel sets up two sets of ucontexts if the signal was to be
- * delivered while the thread was in a transaction.
+ * delivered while the thread was in a transaction (referred too as
+ * first and second contexts).
  * Expected behaviour is that the checkpointed state is in the user
- * context passed to the signal handler. The speculated state can be
- * accessed with the uc_link pointer.
+ * context passed to the signal handler (first context). The speculated
+ * state can be accessed with the uc_link pointer (second context).
  *
  * The rationale for this is that if TM unaware code (which linked
  * against TM libs) installs a signal handler it will not know of the
@@ -28,17 +29,20 @@
 
 #define MAX_ATTEMPT 500000
 
-#define NV_FPU_REGS 18
+#define NV_FPU_REGS 18 /* Number of non-volatile FP registers */
+#define FPR14 14 /* First non-volatile FP register to check in f14-31 subset */
 
 long tm_signal_self_context_load(pid_t pid, long *gprs, double *fps, vector int *vms, vector int *vss);
 
-/* Be sure there are 2x as many as there are NV FPU regs (2x18) */
+/* Test only non-volatile registers, i.e. 18 fpr registers from f14 to f31 */
 static double fps[] = {
+	/* First context will be set with these values, i.e. non-speculative */
 	 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
+	/* Second context will be set with these values, i.e. speculative */
 	-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18
 };
 
-static sig_atomic_t fail;
+static sig_atomic_t fail, broken;
 
 static void signal_usr1(int signum, siginfo_t *info, void *uc)
 {
@@ -46,11 +50,24 @@ static void signal_usr1(int signum, siginfo_t *info, void *uc)
 	ucontext_t *ucp = uc;
 	ucontext_t *tm_ucp = ucp->uc_link;
 
-	for (i = 0; i < NV_FPU_REGS && !fail; i++) {
-		fail = (ucp->uc_mcontext.fp_regs[i + 14] != fps[i]);
-		fail |= (tm_ucp->uc_mcontext.fp_regs[i + 14] != fps[i + NV_FPU_REGS]);
-		if (fail)
-			printf("Failed on %d FP %g or %g\n", i, ucp->uc_mcontext.fp_regs[i + 14], tm_ucp->uc_mcontext.fp_regs[i + 14]);
+	for (i = 0; i < NV_FPU_REGS; i++) {
+		/* Check first context. Print all mismatches. */
+		fail = (ucp->uc_mcontext.fp_regs[FPR14 + i] != fps[i]);
+		if (fail) {
+			broken = 1;
+			printf("FPR%d (1st context) == %g instead of %g (expected)\n",
+				FPR14 + i, ucp->uc_mcontext.fp_regs[FPR14 + i], fps[i]);
+		}
+	}
+
+	for (i = 0; i < NV_FPU_REGS; i++) {
+		/* Check second context. Print all mismatches. */
+		fail = (tm_ucp->uc_mcontext.fp_regs[FPR14 + i] != fps[NV_FPU_REGS + i]);
+		if (fail) {
+			broken = 1;
+			printf("FPR%d (2nd context) == %g instead of %g (expected)\n",
+				FPR14 + i, tm_ucp->uc_mcontext.fp_regs[FPR14 + i], fps[NV_FPU_REGS + i]);
+		}
 	}
 }
 
@@ -72,13 +89,19 @@ static int tm_signal_context_chk_fpu()
 	}
 
 	i = 0;
-	while (i < MAX_ATTEMPT && !fail) {
+	while (i < MAX_ATTEMPT && !broken) {
+		/*
+		 * tm_signal_self_context_load will set both first and second
+		 * contexts accordingly to the values passed through non-NULL
+		 * array pointers to it, in that case 'fps', and invoke the
+		 * signal handler installed for SIGUSR1.
+		 */
 		rc = tm_signal_self_context_load(pid, NULL, fps, NULL, NULL);
 		FAIL_IF(rc != pid);
 		i++;
 	}
 
-	return fail;
+	return (broken);
 }
 
 int main(void)
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c
index 4d05f8b0254c..0cc680f61828 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-gpr.c
@@ -5,10 +5,11 @@
  * Test the kernel's signal frame code.
  *
  * The kernel sets up two sets of ucontexts if the signal was to be
- * delivered while the thread was in a transaction.
+ * delivered while the thread was in a transaction (referred too as
+ * first and second contexts).
  * Expected behaviour is that the checkpointed state is in the user
- * context passed to the signal handler. The speculated state can be
- * accessed with the uc_link pointer.
+ * context passed to the signal handler (first context). The speculated
+ * state can be accessed with the uc_link pointer (second context).
  *
  * The rationale for this is that if TM unaware code (which linked
  * against TM libs) installs a signal handler it will not know of the
@@ -28,14 +29,22 @@
 
 #define MAX_ATTEMPT 500000
 
-#define NV_GPR_REGS 18
+#define NV_GPR_REGS 18 /* Number of non-volatile GPR registers */
+#define R14 14 /* First non-volatile register to check in r14-r31 subset */
 
 long tm_signal_self_context_load(pid_t pid, long *gprs, double *fps, vector int *vms, vector int *vss);
 
-static sig_atomic_t fail;
+static sig_atomic_t fail, broken;
 
-static long gps[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
-					 -1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18};
+/* Test only non-volatile general purpose registers, i.e. r14-r31 */
+static long gprs[] = {
+	/* First context will be set with these values, i.e. non-speculative */
+	/* R14, R15, ... */
+	 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18,
+	/* Second context will be set with these values, i.e. speculative */
+	/* R14, R15, ... */
+	-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,-12,-13,-14,-15,-16,-17,-18
+};
 
 static void signal_usr1(int signum, siginfo_t *info, void *uc)
 {
@@ -43,12 +52,24 @@ static void signal_usr1(int signum, siginfo_t *info, void *uc)
 	ucontext_t *ucp = uc;
 	ucontext_t *tm_ucp = ucp->uc_link;
 
-	for (i = 0; i < NV_GPR_REGS && !fail; i++) {
-		fail = (ucp->uc_mcontext.gp_regs[i + 14] != gps[i]);
-		fail |= (tm_ucp->uc_mcontext.gp_regs[i + 14] != gps[i + NV_GPR_REGS]);
-		if (fail)
-			printf("Failed on %d GPR %lu or %lu\n", i,
-					ucp->uc_mcontext.gp_regs[i + 14], tm_ucp->uc_mcontext.gp_regs[i + 14]);
+	/* Check first context. Print all mismatches. */
+	for (i = 0; i < NV_GPR_REGS; i++) {
+		fail = (ucp->uc_mcontext.gp_regs[R14 + i] != gprs[i]);
+		if (fail) {
+			broken = 1;
+			printf("GPR%d (1st context) == %lu instead of %lu (expected)\n",
+				R14 + i, ucp->uc_mcontext.gp_regs[R14 + i], gprs[i]);
+		}
+	}
+
+	/* Check second context. Print all mismatches. */
+	for (i = 0; i < NV_GPR_REGS; i++) {
+		fail = (tm_ucp->uc_mcontext.gp_regs[R14 + i] != gprs[NV_GPR_REGS + i]);
+		if (fail) {
+			broken = 1;
+			printf("GPR%d (2nd context) == %lu instead of %lu (expected)\n",
+				R14 + i, tm_ucp->uc_mcontext.gp_regs[R14 + i], gprs[NV_GPR_REGS + i]);
+		}
 	}
 }
 
@@ -70,13 +91,19 @@ static int tm_signal_context_chk_gpr()
 	}
 
 	i = 0;
-	while (i < MAX_ATTEMPT && !fail) {
-		rc = tm_signal_self_context_load(pid, gps, NULL, NULL, NULL);
+	while (i < MAX_ATTEMPT && !broken) {
+                /*
+                 * tm_signal_self_context_load will set both first and second
+                 * contexts accordingly to the values passed through non-NULL
+                 * array pointers to it, in that case 'gprs', and invoke the
+                 * signal handler installed for SIGUSR1.
+                 */
+		rc = tm_signal_self_context_load(pid, gprs, NULL, NULL, NULL);
 		FAIL_IF(rc != pid);
 		i++;
 	}
 
-	return fail;
+	return broken;
 }
 
 int main(void)
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c
index 48ad01499b1a..b6d52730a0d8 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vmx.c
@@ -5,10 +5,11 @@
  * Test the kernel's signal frame code.
  *
  * The kernel sets up two sets of ucontexts if the signal was to be
- * delivered while the thread was in a transaction.
+ * delivered while the thread was in a transaction (referred too as
+ * first and second contexts).
  * Expected behaviour is that the checkpointed state is in the user
- * context passed to the signal handler. The speculated state can be
- * accessed with the uc_link pointer.
+ * context passed to the signal handler (first context). The speculated
+ * state can be accessed with the uc_link pointer (second context).
  *
  * The rationale for this is that if TM unaware code (which linked
  * against TM libs) installs a signal handler it will not know of the
@@ -29,18 +30,24 @@
 
 #define MAX_ATTEMPT 500000
 
-#define NV_VMX_REGS 12
+#define NV_VMX_REGS 12 /* Number of non-volatile VMX registers */
+#define VMX20 20 /* First non-volatile register to check in vr20-31 subset */
 
 long tm_signal_self_context_load(pid_t pid, long *gprs, double *fps, vector int *vms, vector int *vss);
 
-static sig_atomic_t fail;
+static sig_atomic_t fail, broken;
 
+/* Test only non-volatile registers, i.e. 12 vmx registers from vr20 to vr31 */
 vector int vms[] = {
-	{1, 2, 3, 4 },{5, 6, 7, 8 },{9, 10,11,12},
+	/* First context will be set with these values, i.e. non-speculative */
+	/* VMX20     ,  VMX21      , ... */
+	{ 1, 2, 3, 4},{ 5, 6, 7, 8},{ 9,10,11,12},
 	{13,14,15,16},{17,18,19,20},{21,22,23,24},
 	{25,26,27,28},{29,30,31,32},{33,34,35,36},
 	{37,38,39,40},{41,42,43,44},{45,46,47,48},
-	{-1, -2, -3, -4}, {-5, -6, -7, -8}, {-9, -10,-11,-12},
+	/* Second context will be set with these values, i.e. speculative */
+	/* VMX20        , VMX21            , ... */
+	{ -1, -2, -3, -4},{ -5, -6, -7, -8},{ -9,-10,-11,-12},
 	{-13,-14,-15,-16},{-17,-18,-19,-20},{-21,-22,-23,-24},
 	{-25,-26,-27,-28},{-29,-30,-31,-32},{-33,-34,-35,-36},
 	{-37,-38,-39,-40},{-41,-42,-43,-44},{-45,-46,-47,-48}
@@ -48,26 +55,43 @@ vector int vms[] = {
 
 static void signal_usr1(int signum, siginfo_t *info, void *uc)
 {
-	int i;
+	int i, j;
 	ucontext_t *ucp = uc;
 	ucontext_t *tm_ucp = ucp->uc_link;
 
-	for (i = 0; i < NV_VMX_REGS && !fail; i++) {
-		fail = memcmp(ucp->uc_mcontext.v_regs->vrregs[i + 20],
+	for (i = 0; i < NV_VMX_REGS; i++) {
+		/* Check first context. Print all mismatches. */
+		fail = memcmp(ucp->uc_mcontext.v_regs->vrregs[VMX20 + i],
 				&vms[i], sizeof(vector int));
-		fail |= memcmp(tm_ucp->uc_mcontext.v_regs->vrregs[i + 20],
-				&vms[i + NV_VMX_REGS], sizeof (vector int));
-
 		if (fail) {
-			int j;
+			broken = 1;
+			printf("VMX%d (1st context) == 0x", VMX20 + i);
+			/* Print actual value in first context. */
+			for (j = 0; j < 4; j++)
+				printf("%08x", ucp->uc_mcontext.v_regs->vrregs[VMX20 + i][j]);
+			printf(" instead of 0x");
+			/* Print expected value. */
+			for (j = 0; j < 4; j++)
+				printf("%08x", vms[i][j]);
+			printf(" (expected)\n");
+		}
+	}
 
-			fprintf(stderr, "Failed on %d vmx 0x", i);
+	for (i = 0; i < NV_VMX_REGS; i++)  {
+		/* Check second context. Print all mismatches. */
+		fail = memcmp(tm_ucp->uc_mcontext.v_regs->vrregs[VMX20 + i],
+				&vms[NV_VMX_REGS + i], sizeof (vector int));
+		if (fail) {
+			broken = 1;
+			printf("VMX%d (2nd context) == 0x", NV_VMX_REGS + i);
+			/* Print actual value in second context. */
+			for (j = 0; j < 4; j++)
+				printf("%08x", tm_ucp->uc_mcontext.v_regs->vrregs[VMX20 + i][j]);
+			printf(" instead of 0x");
+			/* Print expected value. */
 			for (j = 0; j < 4; j++)
-				fprintf(stderr, "%04x", ucp->uc_mcontext.v_regs->vrregs[i + 20][j]);
-			fprintf(stderr, " vs 0x");
-			for (j = 0 ; j < 4; j++)
-				fprintf(stderr, "%04x", tm_ucp->uc_mcontext.v_regs->vrregs[i + 20][j]);
-			fprintf(stderr, "\n");
+				printf("%08x", vms[NV_VMX_REGS + i][j]);
+			printf(" (expected)\n");
 		}
 	}
 }
@@ -90,13 +114,19 @@ static int tm_signal_context_chk()
 	}
 
 	i = 0;
-	while (i < MAX_ATTEMPT && !fail) {
+	while (i < MAX_ATTEMPT && !broken) {
+		/*
+		 * tm_signal_self_context_load will set both first and second
+		 * contexts accordingly to the values passed through non-NULL
+		 * array pointers to it, in that case 'vms', and invoke the
+		 * signal handler installed for SIGUSR1.
+		 */
 		rc = tm_signal_self_context_load(pid, NULL, NULL, vms, NULL);
 		FAIL_IF(rc != pid);
 		i++;
 	}
 
-	return fail;
+	return (broken);
 }
 
 int main(void)
diff --git a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c
index 8c8677a408bb..8e25e2072ecd 100644
--- a/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c
+++ b/tools/testing/selftests/powerpc/tm/tm-signal-context-chk-vsx.c
@@ -5,10 +5,11 @@
  * Test the kernel's signal frame code.
  *
  * The kernel sets up two sets of ucontexts if the signal was to be
- * delivered while the thread was in a transaction.
+ * delivered while the thread was in a transaction (referred too as
+ * first and second contexts).
  * Expected behaviour is that the checkpointed state is in the user
- * context passed to the signal handler. The speculated state can be
- * accessed with the uc_link pointer.
+ * context passed to the signal handler (first context). The speculated
+ * state can be accessed with the uc_link pointer (second context).
  *
  * The rationale for this is that if TM unaware code (which linked
  * against TM libs) installs a signal handler it will not know of the
@@ -29,17 +30,24 @@
 
 #define MAX_ATTEMPT 500000
 
-#define NV_VSX_REGS 12
+#define NV_VSX_REGS 12 /* Number of VSX registers to check. */
+#define VSX20 20 /* First VSX register to check in vsr20-vsr31 subset */
+#define FPR20 20 /* FPR20 overlaps VSX20 most significant doubleword */
 
 long tm_signal_self_context_load(pid_t pid, long *gprs, double *fps, vector int *vms, vector int *vss);
 
-static sig_atomic_t fail;
+static sig_atomic_t fail, broken;
 
-vector int vss[] = {
-	{1, 2, 3, 4 },{5, 6, 7, 8 },{9, 10,11,12},
+/* Test only 12 vsx registers from vsr20 to vsr31 */
+vector int vsxs[] = {
+	/* First context will be set with these values, i.e. non-speculative */
+	/* VSX20     ,  VSX21      , ... */
+	{ 1, 2, 3, 4},{ 5, 6, 7, 8},{ 9,10,11,12},
 	{13,14,15,16},{17,18,19,20},{21,22,23,24},
 	{25,26,27,28},{29,30,31,32},{33,34,35,36},
 	{37,38,39,40},{41,42,43,44},{45,46,47,48},
+	/* Second context will be set with these values, i.e. speculative */
+	/* VSX20         ,  VSX21          , ... */
 	{-1, -2, -3, -4 },{-5, -6, -7, -8 },{-9, -10,-11,-12},
 	{-13,-14,-15,-16},{-17,-18,-19,-20},{-21,-22,-23,-24},
 	{-25,-26,-27,-28},{-29,-30,-31,-32},{-33,-34,-35,-36},
@@ -48,41 +56,91 @@ vector int vss[] = {
 
 static void signal_usr1(int signum, siginfo_t *info, void *uc)
 {
-	int i;
-	uint8_t vsc[sizeof(vector int)];
-	uint8_t vst[sizeof(vector int)];
+	int i, j;
+	uint8_t vsx[sizeof(vector int)];
+	uint8_t vsx_tm[sizeof(vector int)];
 	ucontext_t *ucp = uc;
 	ucontext_t *tm_ucp = ucp->uc_link;
 
 	/*
-	 * The other half of the VSX regs will be after v_regs.
+	 * FP registers and VMX registers overlap the VSX registers.
+	 *
+	 * FP registers (f0-31) overlap the most significant 64 bits of VSX
+	 * registers vsr0-31, whilst VMX registers vr0-31, being 128-bit like
+	 * the VSX registers, overlap fully the other half of VSX registers,
+	 * i.e. vr0-31 overlaps fully vsr32-63.
+	 *
+	 * Due to compatibility and historical reasons (VMX/Altivec support
+	 * appeared first on the architecture), VMX registers vr0-31 (so VSX
+	 * half vsr32-63 too) are stored right after the v_regs pointer, in an
+	 * area allocated for 'vmx_reverse' array (please see
+	 * arch/powerpc/include/uapi/asm/sigcontext.h for details about the
+	 * mcontext_t structure on Power).
+	 *
+	 * The other VSX half (vsr0-31) is hence stored below vr0-31/vsr32-63
+	 * registers, but only the least significant 64 bits of vsr0-31. The
+	 * most significant 64 bits of vsr0-31 (f0-31), as it overlaps the FP
+	 * registers, is kept in fp_regs.
+	 *
+	 * v_regs is a 16 byte aligned pointer at the start of vmx_reserve
+	 * (vmx_reserve may or may not be 16 aligned) where the v_regs structure
+	 * exists, so v_regs points to where vr0-31 / vsr32-63 registers are
+	 * fully stored. Since v_regs type is elf_vrregset_t, v_regs + 1
+	 * skips all the slots used to store vr0-31 / vsr32-64 and points to
+	 * part of one VSX half, i.e. v_regs + 1 points to the least significant
+	 * 64 bits of vsr0-31. The other part of this half (the most significant
+	 * part of vsr0-31) is stored in fp_regs.
 	 *
-	 * In short, vmx_reserve array holds everything. v_regs is a 16
-	 * byte aligned pointer at the start of vmx_reserve (vmx_reserve
-	 * may or may not be 16 aligned) where the v_regs structure exists.
-	 * (half of) The VSX regsters are directly after v_regs so the
-	 * easiest way to find them below.
 	 */
+	/* Get pointer to least significant doubleword of vsr0-31 */
 	long *vsx_ptr = (long *)(ucp->uc_mcontext.v_regs + 1);
 	long *tm_vsx_ptr = (long *)(tm_ucp->uc_mcontext.v_regs + 1);
-	for (i = 0; i < NV_VSX_REGS && !fail; i++) {
-		memcpy(vsc, &ucp->uc_mcontext.fp_regs[i + 20], 8);
-		memcpy(vsc + 8, &vsx_ptr[20 + i], 8);
-		fail = memcmp(vsc, &vss[i], sizeof(vector int));
-		memcpy(vst, &tm_ucp->uc_mcontext.fp_regs[i + 20], 8);
-		memcpy(vst + 8, &tm_vsx_ptr[20 + i], 8);
-		fail |= memcmp(vst, &vss[i + NV_VSX_REGS], sizeof(vector int));
 
-		if (fail) {
-			int j;
+	/* Check first context. Print all mismatches. */
+	for (i = 0; i < NV_VSX_REGS; i++) {
+		/*
+		 * Copy VSX most significant doubleword from fp_regs and
+		 * copy VSX least significant one from 64-bit slots below
+		 * saved VMX registers.
+		 */
+		memcpy(vsx, &ucp->uc_mcontext.fp_regs[FPR20 + i], 8);
+		memcpy(vsx + 8, &vsx_ptr[VSX20 + i], 8);
+
+		fail = memcmp(vsx, &vsxs[i], sizeof(vector int));
 
-			fprintf(stderr, "Failed on %d vsx 0x", i);
+		if (fail) {
+			broken = 1;
+			printf("VSX%d (1st context) == 0x", VSX20 + i);
 			for (j = 0; j < 16; j++)
-				fprintf(stderr, "%02x", vsc[j]);
-			fprintf(stderr, " vs 0x");
+				printf("%02x", vsx[j]);
+			printf(" instead of 0x");
+			for (j = 0; j < 4; j++)
+				printf("%08x", vsxs[i][j]);
+			printf(" (expected)\n");
+		}
+	}
+
+	/* Check second context. Print all mismatches. */
+	for (i = 0; i < NV_VSX_REGS; i++) {
+		/*
+		 * Copy VSX most significant doubleword from fp_regs and
+		 * copy VSX least significant one from 64-bit slots below
+		 * saved VMX registers.
+		 */
+		memcpy(vsx_tm, &tm_ucp->uc_mcontext.fp_regs[FPR20 + i], 8);
+		memcpy(vsx_tm + 8, &tm_vsx_ptr[VSX20 + i], 8);
+
+		fail = memcmp(vsx_tm, &vsxs[NV_VSX_REGS + i], sizeof(vector int));
+
+		if (fail) {
+			broken = 1;
+			printf("VSX%d (2nd context) == 0x", VSX20 + i);
 			for (j = 0; j < 16; j++)
-				fprintf(stderr, "%02x", vst[j]);
-			fprintf(stderr, "\n");
+				printf("%02x", vsx_tm[j]);
+			printf(" instead of 0x");
+			for (j = 0; j < 4; j++)
+				printf("%08x", vsxs[NV_VSX_REGS + i][j]);
+			printf("(expected)\n");
 		}
 	}
 }
@@ -105,13 +163,19 @@ static int tm_signal_context_chk()
 	}
 
 	i = 0;
-	while (i < MAX_ATTEMPT && !fail) {
-		rc = tm_signal_self_context_load(pid, NULL, NULL, NULL, vss);
+	while (i < MAX_ATTEMPT && !broken) {
+               /*
+                * tm_signal_self_context_load will set both first and second
+                * contexts accordingly to the values passed through non-NULL
+                * array pointers to it, in that case 'vsxs', and invoke the
+                * signal handler installed for SIGUSR1.
+                */
+		rc = tm_signal_self_context_load(pid, NULL, NULL, NULL, vsxs);
 		FAIL_IF(rc != pid);
 		i++;
 	}
 
-	return fail;
+	return (broken);
 }
 
 int main(void)
-- 
2.17.1

