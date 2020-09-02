Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F1C25A4B7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 06:47:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhBHT5d0LzDqc7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:47:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=W3Sevns+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh9wL5g3JzDqf6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 14:30:26 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0824DSIw084335; Wed, 2 Sep 2020 00:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cXJ1hb+rxB2SKxqD4eqkp6G4YrcNWaRqf6p7TUeDxs0=;
 b=W3Sevns+gNxse1raWcKRAyjBi8BsYNgCOp0GRpz5DIK7k4iKBcfSRzf3bBuheVoa4Php
 gGdpQfvElEskZmnH4tKg0SFTiQ36P79HfgAFH6n4msP890KRGRSODhXzh+aYWE8krHv6
 m0EbbmWsEBLX7RPXBs1fc1oExdtY7clenC0tZlVCkT4vfmvyv9idszcCny0gm8ZbMHLw
 mzcunEbkaXxkWtAqFdvWgHH5/8Qao0SUx/XbAz9bcCNAWtnSFXCRy+nofPQRoVZFF002
 LTGdiKenQnOwHYya/8Mx8croN3dZYPK+YTzfl4YjFZ0HP1DKLW0e10wX0AknsbNCFM9+ qQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a462gakj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:30:20 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0824NTtt103773;
 Wed, 2 Sep 2020 00:30:20 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33a462gajp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 00:30:20 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0824RNpV008587;
 Wed, 2 Sep 2020 04:30:17 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 337en8c80m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:30:17 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0824UE1259572530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 04:30:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44AE4A4062;
 Wed,  2 Sep 2020 04:30:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5A39A405B;
 Wed,  2 Sep 2020 04:30:11 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.120])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 04:30:11 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v6 8/8] powerpc/watchpoint/selftests: Tests for kernel
 accessing user memory
Date: Wed,  2 Sep 2020 09:59:45 +0530
Message-Id: <20200902042945.129369-9-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_02:2020-09-01,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2009020037
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, jniethe5@gmail.com,
 pedromfc@linux.ibm.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 rogealve@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce tests to cover simple scenarios where user is watching
memory which can be accessed by kernel as well. We also support
_MODE_EXACT with _SETHWDEBUG interface. Move those testcases out-
side of _BP_RANGE condition. This will help to test _MODE_EXACT
scenarios when CONFIG_HAVE_HW_BREAKPOINT is not set, eg:

  $ ./ptrace-hwbreak
  ...
  PTRACE_SET_DEBUGREG, Kernel Access Userspace, len: 8: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, Kernel Access Userspace, len: 1: Ok
  success: ptrace-hwbreak

Suggested-by: Pedro Miraglia Franco de Carvalho <pedromfc@linux.ibm.com>
Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 48 ++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index fc477dfe86a2..2e0d86e0687e 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -20,6 +20,8 @@
 #include <signal.h>
 #include <sys/types.h>
 #include <sys/wait.h>
+#include <sys/syscall.h>
+#include <linux/limits.h>
 #include "ptrace.h"
 
 #define SPRN_PVR	0x11F
@@ -44,6 +46,7 @@ struct gstruct {
 };
 static volatile struct gstruct gstruct __attribute__((aligned(512)));
 
+static volatile char cwd[PATH_MAX] __attribute__((aligned(8)));
 
 static void get_dbginfo(pid_t child_pid, struct ppc_debug_info *dbginfo)
 {
@@ -138,6 +141,9 @@ static void test_workload(void)
 			write_var(len);
 	}
 
+	/* PTRACE_SET_DEBUGREG, Kernel Access Userspace test */
+	syscall(__NR_getcwd, &cwd, PATH_MAX);
+
 	/* PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO test */
 	write_var(1);
 
@@ -150,6 +156,9 @@ static void test_workload(void)
 	else
 		read_var(1);
 
+	/* PPC_PTRACE_SETHWDEBUG, MODE_EXACT, Kernel Access Userspace test */
+	syscall(__NR_getcwd, &cwd, PATH_MAX);
+
 	/* PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO test */
 	gstruct.a[rand() % A_LEN] = 'a';
 
@@ -293,6 +302,24 @@ static int test_set_debugreg(pid_t child_pid)
 	return 0;
 }
 
+static int test_set_debugreg_kernel_userspace(pid_t child_pid)
+{
+	unsigned long wp_addr = (unsigned long)cwd;
+	char *name = "PTRACE_SET_DEBUGREG";
+
+	/* PTRACE_SET_DEBUGREG, Kernel Access Userspace test */
+	wp_addr &= ~0x7UL;
+	wp_addr |= (1Ul << DABR_READ_SHIFT);
+	wp_addr |= (1UL << DABR_WRITE_SHIFT);
+	wp_addr |= (1UL << DABR_TRANSLATION_SHIFT);
+	ptrace_set_debugreg(child_pid, wp_addr);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "Kernel Access Userspace", wp_addr, 8);
+
+	ptrace_set_debugreg(child_pid, 0);
+	return 0;
+}
+
 static void get_ppc_hw_breakpoint(struct ppc_hw_breakpoint *info, int type,
 				  unsigned long addr, int len)
 {
@@ -338,6 +365,22 @@ static void test_sethwdebug_exact(pid_t child_pid)
 	ptrace_delhwdebug(child_pid, wh);
 }
 
+static void test_sethwdebug_exact_kernel_userspace(pid_t child_pid)
+{
+	struct ppc_hw_breakpoint info;
+	unsigned long wp_addr = (unsigned long)&cwd;
+	char *name = "PPC_PTRACE_SETHWDEBUG, MODE_EXACT";
+	int len = 1; /* hardcoded in kernel */
+	int wh;
+
+	/* PPC_PTRACE_SETHWDEBUG, MODE_EXACT, Kernel Access Userspace test */
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr, 0);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "Kernel Access Userspace", wp_addr, len);
+	ptrace_delhwdebug(child_pid, wh);
+}
+
 static void test_sethwdebug_range_aligned(pid_t child_pid)
 {
 	struct ppc_hw_breakpoint info;
@@ -452,9 +495,10 @@ static void
 run_tests(pid_t child_pid, struct ppc_debug_info *dbginfo, bool dawr)
 {
 	test_set_debugreg(child_pid);
+	test_set_debugreg_kernel_userspace(child_pid);
+	test_sethwdebug_exact(child_pid);
+	test_sethwdebug_exact_kernel_userspace(child_pid);
 	if (dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_RANGE) {
-		test_sethwdebug_exact(child_pid);
-
 		test_sethwdebug_range_aligned(child_pid);
 		if (dawr || is_8xx) {
 			test_sethwdebug_range_unaligned(child_pid);
-- 
2.26.2

