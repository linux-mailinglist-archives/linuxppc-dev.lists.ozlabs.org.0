Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 409E52464A5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:38:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVrB10jTzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:38:18 +1000 (AEST)
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
 header.s=pp1 header.b=pd+Epy3P; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVX34hDNzDqRr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:24:19 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HA24pc103924; Mon, 17 Aug 2020 06:24:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ATBEDC78VuhWX8NGBzXjna2sujifxGk7wXJnhSarDBg=;
 b=pd+Epy3Pq/qY87bW0SBrVHHhNBkL+XweSlDes1vCLe0clmjEUYtYohBufSDmOhzqsXS+
 4t+56NaunI2UhvvkNcX3V4TBofz5IBOALYLExMDemyFbnz+5OpFjCmje3nVQb8WcRqKv
 QeB8llelKeuj62iBs3/3VEzURZVfM0kS8w6rdQo2KsZjofAzOLxJsCGkrFGowrp2VR+e
 IqpLh9ec8UsdIgEX3pZy4sSPGi6nuF1mUz5XE2IiLhgwgOLjD4ulcckCJ2KSak7Mm1P1
 CPizTYhIgQI0CRkXLovyBZfTtVOg9Uj1cZEc+reMzoR3xUa9YyC3oXH7DoTfFoxbm43l 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y24j2pd6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:13 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HA25t6104025;
 Mon, 17 Aug 2020 06:24:13 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y24j2pc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:24:12 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HAJpjS013944;
 Mon, 17 Aug 2020 10:24:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma02fra.de.ibm.com with ESMTP id 32x7b819pr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:24:10 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07HAMbXP62456148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:22:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BCE54C046;
 Mon, 17 Aug 2020 10:24:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 306B34C04A;
 Mon, 17 Aug 2020 10:24:04 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.37.13])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 10:24:04 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, christophe.leroy@c-s.fr
Subject: [PATCH v4 6/6] powerpc/watchpoint/selftests: Tests for kernel
 accessing user memory
Date: Mon, 17 Aug 2020 15:53:30 +0530
Message-Id: <20200817102330.777537-7-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
References: <20200817102330.777537-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170071
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, rogealve@br.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jniethe5@gmail.com,
 pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
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

Suggested-by: Pedro Miraglia Franco de Carvalho <pedromfc@br.ibm.com>
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

