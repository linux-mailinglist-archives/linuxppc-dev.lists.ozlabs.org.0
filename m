Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3E65C8E5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 07:41:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dClp06f7zDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:41:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dCQk6lM0zDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 15:26:38 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x625NVKt179748
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 2 Jul 2019 01:26:36 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tfx8y5rq5-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Jul 2019 01:26:35 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Tue, 2 Jul 2019 06:26:34 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 2 Jul 2019 06:26:29 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x625QSSt44040200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Jul 2019 05:26:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0A844C04E;
 Tue,  2 Jul 2019 05:26:28 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 168344C04A;
 Tue,  2 Jul 2019 05:26:27 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.195])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  2 Jul 2019 05:26:26 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v2 2/2] Powerpc/Watchpoint: Rewrite ptrace-hwbreak.c selftest
Date: Tue,  2 Jul 2019 10:56:14 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702052614.10408-1-ravi.bangoria@linux.ibm.com>
References: <20190702052614.10408-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070205-0028-0000-0000-0000037F893D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070205-0029-0000-0000-0000243FC157
Message-Id: <20190702052614.10408-2-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-02_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907020060
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ptrace-hwbreak.c selftest is logically broken. On powerpc, when
watchpoint is created with ptrace, signals are generated before
executing the instruction and user has to manually singlestep
the instruction with watchpoint disabled, which selftest never
does and thus it keeps on getting the signal at the same
instruction. If we fix it, selftest fails because the logical
connection between tracer(parent) and tracee(child) is also
broken. Rewrite the selftest and add new tests for unaligned
access.

With patch:
  $ ./tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak
  test: ptrace-hwbreak
  tags: git_version:v5.2-rc2-33-ga247a75f90a9-dirty
  PTRACE_SET_DEBUGREG, WO, len: 1: Ok
  PTRACE_SET_DEBUGREG, WO, len: 2: Ok
  PTRACE_SET_DEBUGREG, WO, len: 4: Ok
  PTRACE_SET_DEBUGREG, WO, len: 8: Ok
  PTRACE_SET_DEBUGREG, RO, len: 1: Ok
  PTRACE_SET_DEBUGREG, RO, len: 2: Ok
  PTRACE_SET_DEBUGREG, RO, len: 4: Ok
  PTRACE_SET_DEBUGREG, RO, len: 8: Ok
  PTRACE_SET_DEBUGREG, RW, len: 1: Ok
  PTRACE_SET_DEBUGREG, RW, len: 2: Ok
  PTRACE_SET_DEBUGREG, RW, len: 4: Ok
  PTRACE_SET_DEBUGREG, RW, len: 8: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO, len: 6: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RO, len: 6: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, RW, len: 6: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, WO, len: 6: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, RO, len: 6: Ok
  PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED, RW, len: 6: Ok
  PPC_PTRACE_SETHWDEBUG, DAWR_MAX_LEN, RW, len: 512: Ok
  success: ptrace-hwbreak

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 535 +++++++++++-------
 1 file changed, 325 insertions(+), 210 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index 3066d310f32b..fb1e05d7f77c 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -22,318 +22,433 @@
 #include <sys/wait.h>
 #include "ptrace.h"
 
-/* Breakpoint access modes */
-enum {
-	BP_X = 1,
-	BP_RW = 2,
-	BP_W = 4,
-};
-
-static pid_t child_pid;
-static struct ppc_debug_info dbginfo;
-
-static void get_dbginfo(void)
-{
-	int ret;
-
-	ret = ptrace(PPC_PTRACE_GETHWDBGINFO, child_pid, NULL, &dbginfo);
-	if (ret) {
-		perror("Can't get breakpoint info\n");
-		exit(-1);
-	}
-}
-
-static bool hwbreak_present(void)
-{
-	return (dbginfo.num_data_bps != 0);
-}
+/*
+ * Use volatile on all global var so that compiler doesn't
+ * optimise their load/stores. Otherwise selftest can fail.
+ */
+static volatile __u64 glvar;
 
-static bool dawr_present(void)
-{
-	return !!(dbginfo.features & PPC_DEBUG_FEATURE_DATA_BP_DAWR);
-}
+#define DAWR_MAX_LEN 512
+static volatile __u8 big_var[DAWR_MAX_LEN] __attribute__((aligned(512)));
 
-static void set_breakpoint_addr(void *addr)
-{
-	int ret;
+#define A_LEN 6
+#define B_LEN 6
+struct gstruct {
+	__u8 a[A_LEN]; /* double word aligned */
+	__u8 b[B_LEN]; /* double word unaligned */
+};
+static volatile struct gstruct gstruct __attribute__((aligned(512)));
 
-	ret = ptrace(PTRACE_SET_DEBUGREG, child_pid, 0, addr);
-	if (ret) {
-		perror("Can't set breakpoint addr\n");
-		exit(-1);
-	}
-}
 
-static int set_hwbreakpoint_addr(void *addr, int range)
+static void get_dbginfo(pid_t child_pid, struct ppc_debug_info *dbginfo)
 {
-	int ret;
-
-	struct ppc_hw_breakpoint info;
-
-	info.version = 1;
-	info.trigger_type = PPC_BREAKPOINT_TRIGGER_RW;
-	info.addr_mode = PPC_BREAKPOINT_MODE_EXACT;
-	if (range > 0)
-		info.addr_mode = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
-	info.condition_mode = PPC_BREAKPOINT_CONDITION_NONE;
-	info.addr = (__u64)addr;
-	info.addr2 = (__u64)addr + range;
-	info.condition_value = 0;
-
-	ret = ptrace(PPC_PTRACE_SETHWDEBUG, child_pid, 0, &info);
-	if (ret < 0) {
-		perror("Can't set breakpoint\n");
+	if (ptrace(PPC_PTRACE_GETHWDBGINFO, child_pid, NULL, dbginfo)) {
+		perror("Can't get breakpoint info");
 		exit(-1);
 	}
-	return ret;
 }
 
-static int del_hwbreakpoint_addr(int watchpoint_handle)
+static bool dawr_present(struct ppc_debug_info *dbginfo)
 {
-	int ret;
-
-	ret = ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, watchpoint_handle);
-	if (ret < 0) {
-		perror("Can't delete hw breakpoint\n");
-		exit(-1);
-	}
-	return ret;
+	return !!(dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_DAWR);
 }
 
-#define DAWR_LENGTH_MAX 512
-
-/* Dummy variables to test read/write accesses */
-static unsigned long long
-	dummy_array[DAWR_LENGTH_MAX / sizeof(unsigned long long)]
-	__attribute__((aligned(512)));
-static unsigned long long *dummy_var = dummy_array;
-
 static void write_var(int len)
 {
-	long long *plval;
-	char *pcval;
-	short *psval;
-	int *pival;
+	__u8 *pcvar;
+	__u16 *psvar;
+	__u32 *pivar;
+	__u64 *plvar;
 
 	switch (len) {
 	case 1:
-		pcval = (char *)dummy_var;
-		*pcval = 0xff;
+		pcvar = (__u8 *)&glvar;
+		*pcvar = 0xff;
 		break;
 	case 2:
-		psval = (short *)dummy_var;
-		*psval = 0xffff;
+		psvar = (__u16 *)&glvar;
+		*psvar = 0xffff;
 		break;
 	case 4:
-		pival = (int *)dummy_var;
-		*pival = 0xffffffff;
+		pivar = (__u32 *)&glvar;
+		*pivar = 0xffffffff;
 		break;
 	case 8:
-		plval = (long long *)dummy_var;
-		*plval = 0xffffffffffffffffLL;
+		plvar = (__u64 *)&glvar;
+		*plvar = 0xffffffffffffffffLL;
 		break;
 	}
 }
 
 static void read_var(int len)
 {
-	char cval __attribute__((unused));
-	short sval __attribute__((unused));
-	int ival __attribute__((unused));
-	long long lval __attribute__((unused));
+	__u8 cvar __attribute__((unused));
+	__u16 svar __attribute__((unused));
+	__u32 ivar __attribute__((unused));
+	__u64 lvar __attribute__((unused));
 
 	switch (len) {
 	case 1:
-		cval = *(char *)dummy_var;
+		cvar = (__u8)glvar;
 		break;
 	case 2:
-		sval = *(short *)dummy_var;
+		svar = (__u16)glvar;
 		break;
 	case 4:
-		ival = *(int *)dummy_var;
+		ivar = (__u32)glvar;
 		break;
 	case 8:
-		lval = *(long long *)dummy_var;
+		lvar = (__u64)glvar;
 		break;
 	}
 }
 
-/*
- * Do the r/w accesses to trigger the breakpoints. And run
- * the usual traps.
- */
-static void trigger_tests(void)
+static void test_workload(void)
 {
-	int len, ret;
+	__u8 cvar __attribute__((unused));
+	int len = 0;
 
-	ret = ptrace(PTRACE_TRACEME, 0, NULL, 0);
-	if (ret) {
-		perror("Can't be traced?\n");
-		return;
+	if (ptrace(PTRACE_TRACEME, 0, NULL, 0)) {
+		perror("Child can't be traced?");
+		exit(-1);
 	}
 
 	/* Wake up father so that it sets up the first test */
 	kill(getpid(), SIGUSR1);
 
-	/* Test write watchpoints */
-	for (len = 1; len <= sizeof(long); len <<= 1)
+	/* PTRACE_SET_DEBUGREG. WO test */
+	for (len = 1; len <= sizeof(glvar); len <<= 1)
 		write_var(len);
 
-	/* Test read/write watchpoints (on read accesses) */
-	for (len = 1; len <= sizeof(long); len <<= 1)
+	/* PTRACE_SET_DEBUGREG. RO test */
+	for (len = 1; len <= sizeof(glvar); len <<= 1)
 		read_var(len);
 
-	/* Test when breakpoint is unset */
+	/* PTRACE_SET_DEBUGREG. RW test */
+	for (len = 1; len <= sizeof(glvar); len <<= 1) {
+		if (rand() % 2)
+			read_var(len);
+		else
+			write_var(len);
+	}
 
-	/* Test write watchpoints */
-	for (len = 1; len <= sizeof(long); len <<= 1)
-		write_var(len);
+	/* PPC_PTRACE_SETHWDEBUG. MODE_EXACT. WO test */
+	write_var(1);
 
-	/* Test read/write watchpoints (on read accesses) */
-	for (len = 1; len <= sizeof(long); len <<= 1)
-		read_var(len);
+	/* PPC_PTRACE_SETHWDEBUG. MODE_EXACT. RO test */
+	read_var(1);
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_EXACT. RW test */
+	if (rand() % 2)
+		write_var(1);
+	else
+		read_var(1);
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW ALIGNED. WO test */
+	gstruct.a[rand() % A_LEN] = 'a';
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW ALIGNED. RO test */
+	cvar = gstruct.a[rand() % A_LEN];
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW ALIGNED. RW test */
+	if (rand() % 2)
+		gstruct.a[rand() % A_LEN] = 'a';
+	else
+		cvar = gstruct.a[rand() % A_LEN];
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW UNALIGNED. WO test */
+	gstruct.b[rand() % B_LEN] = 'b';
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW UNALIGNED. RO test */
+	cvar = gstruct.b[rand() % B_LEN];
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW UNALIGNED. RW test */
+	if (rand() % 2)
+		gstruct.b[rand() % B_LEN] = 'b';
+	else
+		cvar = gstruct.b[rand() % B_LEN];
+
+	/* PPC_PTRACE_SETHWDEBUG. DAWR_MAX_LEN. RW test */
+	if (rand() % 2)
+		big_var[rand() % DAWR_MAX_LEN] = 'a';
+	else
+		cvar = big_var[rand() % DAWR_MAX_LEN];
 }
 
-static void check_success(const char *msg)
+static void
+check_success(pid_t child_pid, const char *name, const char *type, int len)
 {
-	const char *msg2;
 	int status;
 
 	/* Wait for the child to SIGTRAP */
 	wait(&status);
+	if (!WIFSTOPPED(status) || WSTOPSIG(status) != SIGTRAP) {
+		printf("%s, %s, len: %d: Fail\n", name, type, len);
+		exit(-1);
+	}
+	printf("%s, %s, len: %d: Ok\n", name, type, len);
 
-	msg2 = "Failed";
+	/*
+	 * For ptrace registered watchpoint, signal is generated
+	 * before executing load/store. Singlestep the instruction
+	 * and then continue the test.
+	 */
+	ptrace(PTRACE_SINGLESTEP, child_pid, NULL, 0);
+	wait(NULL);
+}
 
-	if (WIFSTOPPED(status) && WSTOPSIG(status) == SIGTRAP) {
-		msg2 = "Child process hit the breakpoint";
+static void ptrace_set_debugreg(pid_t child_pid, unsigned long wp_addr)
+{
+	if (ptrace(PTRACE_SET_DEBUGREG, child_pid, 0, wp_addr)) {
+		perror("PTRACE_SET_DEBUGREG failed");
+		exit(-1);
 	}
+}
+
+static int ptrace_sethwdebug(pid_t child_pid, struct ppc_hw_breakpoint *info)
+{
+	int wh = ptrace(PPC_PTRACE_SETHWDEBUG, child_pid, 0, info);
 
-	printf("%s Result: [%s]\n", msg, msg2);
+	if (wh <= 0) {
+		perror("PPC_PTRACE_SETHWDEBUG failed");
+		exit(-1);
+	}
+	return wh;
 }
 
-static void launch_watchpoints(char *buf, int mode, int len,
-			       struct ppc_debug_info *dbginfo, bool dawr)
+static void ptrace_delhwdebug(pid_t child_pid, int wh)
 {
-	const char *mode_str;
-	unsigned long data = (unsigned long)(dummy_var);
-	int wh, range;
-
-	data &= ~0x7UL;
-
-	if (mode == BP_W) {
-		data |= (1UL << 1);
-		mode_str = "write";
-	} else {
-		data |= (1UL << 0);
-		data |= (1UL << 1);
-		mode_str = "read";
+	if (ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, wh) < 0) {
+		perror("PPC_PTRACE_DELHWDEBUG failed");
+		exit(-1);
 	}
+}
 
-	/* Set DABR_TRANSLATION bit */
-	data |= (1UL << 2);
+#define DABR_READ_SHIFT		0
+#define DABR_WRITE_SHIFT	1
+#define DABR_TRANSLATION_SHIFT	2
 
-	/* use PTRACE_SET_DEBUGREG breakpoints */
-	set_breakpoint_addr((void *)data);
-	ptrace(PTRACE_CONT, child_pid, NULL, 0);
-	sprintf(buf, "Test %s watchpoint with len: %d ", mode_str, len);
-	check_success(buf);
-	/* Unregister hw brkpoint */
-	set_breakpoint_addr(NULL);
+static int test_set_debugreg(pid_t child_pid)
+{
+	unsigned long wp_addr = (unsigned long)&glvar;
+	char *name = "PTRACE_SET_DEBUGREG";
+	int len;
+
+	/* PTRACE_SET_DEBUGREG. WO test*/
+	wp_addr &= ~0x7UL;
+	wp_addr |= (1UL << DABR_WRITE_SHIFT);
+	wp_addr |= (1UL << DABR_TRANSLATION_SHIFT);
+	for (len = 1; len <= sizeof(glvar); len <<= 1) {
+		ptrace_set_debugreg(child_pid, wp_addr);
+		ptrace(PTRACE_CONT, child_pid, NULL, 0);
+		check_success(child_pid, name, "WO", len);
+	}
+
+	/* PTRACE_SET_DEBUGREG. RO test */
+	wp_addr &= ~0x7UL;
+	wp_addr |= (1UL << DABR_READ_SHIFT);
+	wp_addr |= (1UL << DABR_TRANSLATION_SHIFT);
+	for (len = 1; len <= sizeof(glvar); len <<= 1) {
+		ptrace_set_debugreg(child_pid, wp_addr);
+		ptrace(PTRACE_CONT, child_pid, NULL, 0);
+		check_success(child_pid, name, "RO", len);
+	}
 
-	data = (data & ~7); /* remove dabr control bits */
+	/* PTRACE_SET_DEBUGREG. RW test */
+	wp_addr &= ~0x7UL;
+	wp_addr |= (1Ul << DABR_READ_SHIFT);
+	wp_addr |= (1UL << DABR_WRITE_SHIFT);
+	wp_addr |= (1UL << DABR_TRANSLATION_SHIFT);
+	for (len = 1; len <= sizeof(glvar); len <<= 1) {
+		ptrace_set_debugreg(child_pid, wp_addr);
+		ptrace(PTRACE_CONT, child_pid, NULL, 0);
+		check_success(child_pid, name, "RW", len);
+	}
 
-	/* use PPC_PTRACE_SETHWDEBUG breakpoint */
-	if (!(dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_RANGE))
-		return; /* not supported */
-	wh = set_hwbreakpoint_addr((void *)data, 0);
-	ptrace(PTRACE_CONT, child_pid, NULL, 0);
-	sprintf(buf, "Test %s watchpoint with len: %d ", mode_str, len);
-	check_success(buf);
-	/* Unregister hw brkpoint */
-	del_hwbreakpoint_addr(wh);
-
-	/* try a wider range */
-	range = 8;
-	if (dawr)
-		range = 512 - ((int)data & (DAWR_LENGTH_MAX - 1));
-	wh = set_hwbreakpoint_addr((void *)data, range);
-	ptrace(PTRACE_CONT, child_pid, NULL, 0);
-	sprintf(buf, "Test %s watchpoint with len: %d ", mode_str, len);
-	check_success(buf);
-	/* Unregister hw brkpoint */
-	del_hwbreakpoint_addr(wh);
+	ptrace_set_debugreg(child_pid, 0);
+	return 0;
 }
 
-/* Set the breakpoints and check the child successfully trigger them */
-static int launch_tests(bool dawr)
+static void get_ppc_hw_breakpoint(struct ppc_hw_breakpoint *info, int type,
+				  unsigned long addr, int len)
 {
-	char buf[1024];
-	int len, i, status;
+	info->version = 1;
+	info->trigger_type = type;
+	info->condition_mode = PPC_BREAKPOINT_CONDITION_NONE;
+	info->addr = (__u64)addr;
+	info->addr2 = (__u64)addr + len;
+	info->condition_value = 0;
+	if (!len)
+		info->addr_mode = PPC_BREAKPOINT_MODE_EXACT;
+	else
+		info->addr_mode = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
+}
 
-	struct ppc_debug_info dbginfo;
+static void test_sethwdebug_exact(pid_t child_pid)
+{
+	struct ppc_hw_breakpoint info;
+	unsigned long wp_addr = (unsigned long)&glvar;
+	char *name = "PPC_PTRACE_SETHWDEBUG, MODE_EXACT";
+	int len = 1; /* hardcoded in kernel */
+	int wh;
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_EXACT. WO test */
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr, 0);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "WO", len);
+	ptrace_delhwdebug(child_pid, wh);
 
-	i = ptrace(PPC_PTRACE_GETHWDBGINFO, child_pid, NULL, &dbginfo);
-	if (i) {
-		perror("Can't set breakpoint info\n");
-		exit(-1);
-	}
-	if (!(dbginfo.features & PPC_DEBUG_FEATURE_DATA_BP_RANGE))
-		printf("WARNING: Kernel doesn't support PPC_PTRACE_SETHWDEBUG\n");
+	/* PPC_PTRACE_SETHWDEBUG. MODE_EXACT. RO test */
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_READ, wp_addr, 0);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RO", len);
+	ptrace_delhwdebug(child_pid, wh);
 
-	/* Write watchpoint */
-	for (len = 1; len <= sizeof(long); len <<= 1)
-		launch_watchpoints(buf, BP_W, len, &dbginfo, dawr);
+	/* PPC_PTRACE_SETHWDEBUG. MODE_EXACT. RW test */
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_RW, wp_addr, 0);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RW", len);
+	ptrace_delhwdebug(child_pid, wh);
+}
 
-	/* Read-Write watchpoint */
-	for (len = 1; len <= sizeof(long); len <<= 1)
-		launch_watchpoints(buf, BP_RW, len, &dbginfo, dawr);
+static void test_sethwdebug_range_aligned(pid_t child_pid)
+{
+	struct ppc_hw_breakpoint info;
+	unsigned long wp_addr;
+	char *name = "PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED";
+	int len;
+	int wh;
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW ALIGNED. WO test */
+	wp_addr = (unsigned long)&gstruct.a;
+	len = A_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "WO", len);
+	ptrace_delhwdebug(child_pid, wh);
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW ALIGNED. RO test */
+	wp_addr = (unsigned long)&gstruct.a;
+	len = A_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_READ, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RO", len);
+	ptrace_delhwdebug(child_pid, wh);
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW ALIGNED. RW test */
+	wp_addr = (unsigned long)&gstruct.a;
+	len = A_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_RW, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RW", len);
+	ptrace_delhwdebug(child_pid, wh);
+}
 
+static void test_sethwdebug_range_unaligned(pid_t child_pid)
+{
+	struct ppc_hw_breakpoint info;
+	unsigned long wp_addr;
+	char *name = "PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW UNALIGNED";
+	int len;
+	int wh;
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW UNALIGNED. WO test */
+	wp_addr = (unsigned long)&gstruct.b;
+	len = B_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "WO", len);
+	ptrace_delhwdebug(child_pid, wh);
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW UNALIGNED. RO test */
+	wp_addr = (unsigned long)&gstruct.b;
+	len = B_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_READ, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RO", len);
+	ptrace_delhwdebug(child_pid, wh);
+
+	/* PPC_PTRACE_SETHWDEBUG. MODE_RANGE. DW UNALIGNED. RW test */
+	wp_addr = (unsigned long)&gstruct.b;
+	len = B_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_RW, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
 	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RW", len);
+	ptrace_delhwdebug(child_pid, wh);
 
-	/*
-	 * Now we have unregistered the breakpoint, access by child
-	 * should not cause SIGTRAP.
-	 */
+}
 
-	wait(&status);
+static void test_sethwdebug_dawr_max_range(pid_t child_pid)
+{
+	struct ppc_hw_breakpoint info;
+	unsigned long wp_addr;
+	char *name = "PPC_PTRACE_SETHWDEBUG, DAWR_MAX_LEN";
+	int len;
+	int wh;
+
+	/* PPC_PTRACE_SETHWDEBUG. DAWR_MAX_LEN. RW test */
+	wp_addr = (unsigned long)big_var;
+	len = DAWR_MAX_LEN;
+	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_RW, wp_addr, len);
+	wh = ptrace_sethwdebug(child_pid, &info);
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
+	check_success(child_pid, name, "RW", len);
+	ptrace_delhwdebug(child_pid, wh);
+}
 
-	if (WIFSTOPPED(status) && WSTOPSIG(status) == SIGTRAP) {
-		printf("FAIL: Child process hit the breakpoint, which is not expected\n");
-		ptrace(PTRACE_CONT, child_pid, NULL, 0);
-		return TEST_FAIL;
+/* Set the breakpoints and check the child successfully trigger them */
+static void
+run_tests(pid_t child_pid, struct ppc_debug_info *dbginfo, bool dawr)
+{
+	test_set_debugreg(child_pid);
+	if (dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_RANGE) {
+		test_sethwdebug_exact(child_pid);
+		test_sethwdebug_range_aligned(child_pid);
+		test_sethwdebug_range_unaligned(child_pid);
+
+		if (dawr)
+			test_sethwdebug_dawr_max_range(child_pid);
 	}
-
-	if (WIFEXITED(status))
-		printf("Child exited normally\n");
-
-	return TEST_PASS;
 }
 
 static int ptrace_hwbreak(void)
 {
-	pid_t pid;
-	int ret;
+	pid_t child_pid;
+	struct ppc_debug_info dbginfo;
 	bool dawr;
 
-	pid = fork();
-	if (!pid) {
-		trigger_tests();
+	child_pid = fork();
+	if (!child_pid) {
+		test_workload();
 		return 0;
 	}
 
 	wait(NULL);
 
-	child_pid = pid;
-
-	get_dbginfo();
-	SKIP_IF(!hwbreak_present());
-	dawr = dawr_present();
+	get_dbginfo(child_pid, &dbginfo);
+	SKIP_IF(dbginfo.num_data_bps == 0);
 
-	ret = launch_tests(dawr);
+	dawr = dawr_present(&dbginfo);
+	run_tests(child_pid, &dbginfo, dawr);
 
+	/* Let the child exit first. */
+	ptrace(PTRACE_CONT, child_pid, NULL, 0);
 	wait(NULL);
 
-	return ret;
+	/*
+	 * Testcases exits immediately with -1 on any failure. If
+	 * it has reached here, it means all tests were successful.
+	 */
+	return TEST_PASS;
 }
 
 int main(int argc, char **argv, char **envp)
-- 
2.20.1

