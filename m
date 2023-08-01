Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AE076A641
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 03:24:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU0V604C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFHSj5RgHz3cX7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 11:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OU0V604C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFHL84818z2yVW
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 11:18:24 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3711Ev0s008964
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=O+114rARfcU4nyXfvmHQO71bRg1l8D3CIdT21ZEHQjs=;
 b=OU0V604CUuK+YuXwWaUbDa2/P9HtqDAkPrG7Uu0X5jZg4Qvm/b8lt9iwaBX4j4X0pswg
 Tm/mP5kVoN0vKB0QjkN1a+3iwTFyVYSZPgZygH0rQ/wVyxTT8SqM0MyXuEt8MfIeorEJ
 Qq3+VMAMezdHcc9CJx+sTeH5SefzXENz7XP2h3JtjorAJmn4rCaZL83rlpz0KKHiBYdX
 4ZQa9PlRbUaqPV3zL7b/J1nJhbFj02uV7mj34tj5aCThXJWVjssD3F2ef8t0iv0vegC0
 6eTbkcbmRj9MFn/ckynp01uwtElxzlS2LqP0EhsIY8QlRwLFjd8IM+MtqkhRVVxVmwy2 GQ== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6r7303n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:21 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36VNDeqB019102
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5ekk7kt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Aug 2023 01:18:20 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3711IIEF58130744
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Aug 2023 01:18:18 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A967920049
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:18 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FB0C20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:18:17 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5BF5F604A8;
	Tue,  1 Aug 2023 11:18:15 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] selftests/powerpc/ptrace: Update ptrace-perf watchpoint selftest
Date: Tue,  1 Aug 2023 11:17:43 +1000
Message-ID: <20230801011744.153973-7-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230801011744.153973-1-bgray@linux.ibm.com>
References: <20230801011744.153973-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wT7KTkLIWIZSJYWVURfwyL3ml-6BJqOk
X-Proofpoint-ORIG-GUID: wT7KTkLIWIZSJYWVURfwyL3ml-6BJqOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-31_18,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010008
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that ptrace and perf are no longer exclusive, update the
test to exercise interesting interactions.

An assembly file is used for the children to allow precise instruction
choice and addresses, while avoiding any compiler quirks.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../testing/selftests/powerpc/ptrace/Makefile |    1 +
 .../powerpc/ptrace/ptrace-perf-asm.S          |   33 +
 .../powerpc/ptrace/ptrace-perf-hwbreak.c      | 1104 +++++++----------
 3 files changed, 479 insertions(+), 659 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S
 rewrite tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c (93%)

diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index cbeeaeae8837..1b39b86849da 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -36,6 +36,7 @@ $(TM_TESTS): CFLAGS += -I../tm -mhtm
 CFLAGS += $(KHDR_INCLUDES) -fno-pie
 
 $(OUTPUT)/ptrace-gpr: ptrace-gpr.S
+$(OUTPUT)/ptrace-perf-hwbreak: ptrace-perf-asm.S
 $(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: LDLIBS += -pthread
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S
new file mode 100644
index 000000000000..9aa2e58f3189
--- /dev/null
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-asm.S
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <ppc-asm.h>
+
+.global same_watch_addr_load
+.global same_watch_addr_trap
+
+FUNC_START(same_watch_addr_child)
+	nop
+same_watch_addr_load:
+	ld 0,0(3)
+	nop
+same_watch_addr_trap:
+	trap
+	blr
+FUNC_END(same_watch_addr_child)
+
+
+.global perf_then_ptrace_load1
+.global perf_then_ptrace_load2
+.global perf_then_ptrace_trap
+
+FUNC_START(perf_then_ptrace_child)
+	nop
+perf_then_ptrace_load1:
+	ld 0,0(3)
+perf_then_ptrace_load2:
+	ld 0,0(4)
+	nop
+perf_then_ptrace_trap:
+	trap
+	blr
+FUNC_END(perf_then_ptrace_child)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
dissimilarity index 93%
index d8a9e95fc03d..a0a0b9bb5854 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
@@ -1,659 +1,445 @@
-// SPDX-License-Identifier: GPL-2.0+
-#include <stdio.h>
-#include <string.h>
-#include <signal.h>
-#include <stdlib.h>
-#include <unistd.h>
-#include <errno.h>
-#include <linux/hw_breakpoint.h>
-#include <linux/perf_event.h>
-#include <asm/unistd.h>
-#include <sys/ptrace.h>
-#include <sys/wait.h>
-#include "ptrace.h"
-
-char data[16];
-
-/* Overlapping address range */
-volatile __u64 *ptrace_data1 = (__u64 *)&data[0];
-volatile __u64 *perf_data1 = (__u64 *)&data[4];
-
-/* Non-overlapping address range */
-volatile __u64 *ptrace_data2 = (__u64 *)&data[0];
-volatile __u64 *perf_data2 = (__u64 *)&data[8];
-
-static unsigned long pid_max_addr(void)
-{
-	FILE *fp;
-	char *line, *c;
-	char addr[100];
-	size_t len = 0;
-
-	fp = fopen("/proc/kallsyms", "r");
-	if (!fp) {
-		printf("Failed to read /proc/kallsyms. Exiting..\n");
-		exit(EXIT_FAILURE);
-	}
-
-	while (getline(&line, &len, fp) != -1) {
-		if (!strstr(line, "pid_max") || strstr(line, "pid_max_max") ||
-		    strstr(line, "pid_max_min"))
-			continue;
-
-		strncpy(addr, line, len < 100 ? len : 100);
-		c = strchr(addr, ' ');
-		*c = '\0';
-		return strtoul(addr, &c, 16);
-	}
-	fclose(fp);
-	printf("Could not find pid_max. Exiting..\n");
-	exit(EXIT_FAILURE);
-	return -1;
-}
-
-static void perf_user_event_attr_set(struct perf_event_attr *attr, __u64 addr, __u64 len)
-{
-	memset(attr, 0, sizeof(struct perf_event_attr));
-	attr->type           = PERF_TYPE_BREAKPOINT;
-	attr->size           = sizeof(struct perf_event_attr);
-	attr->bp_type        = HW_BREAKPOINT_R;
-	attr->bp_addr        = addr;
-	attr->bp_len         = len;
-	attr->exclude_kernel = 1;
-	attr->exclude_hv     = 1;
-}
-
-static void perf_kernel_event_attr_set(struct perf_event_attr *attr)
-{
-	memset(attr, 0, sizeof(struct perf_event_attr));
-	attr->type           = PERF_TYPE_BREAKPOINT;
-	attr->size           = sizeof(struct perf_event_attr);
-	attr->bp_type        = HW_BREAKPOINT_R;
-	attr->bp_addr        = pid_max_addr();
-	attr->bp_len         = sizeof(unsigned long);
-	attr->exclude_user   = 1;
-	attr->exclude_hv     = 1;
-}
-
-static int perf_cpu_event_open(int cpu, __u64 addr, __u64 len)
-{
-	struct perf_event_attr attr;
-
-	perf_user_event_attr_set(&attr, addr, len);
-	return syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
-}
-
-static int perf_thread_event_open(pid_t child_pid, __u64 addr, __u64 len)
-{
-	struct perf_event_attr attr;
-
-	perf_user_event_attr_set(&attr, addr, len);
-	return syscall(__NR_perf_event_open, &attr, child_pid, -1, -1, 0);
-}
-
-static int perf_thread_cpu_event_open(pid_t child_pid, int cpu, __u64 addr, __u64 len)
-{
-	struct perf_event_attr attr;
-
-	perf_user_event_attr_set(&attr, addr, len);
-	return syscall(__NR_perf_event_open, &attr, child_pid, cpu, -1, 0);
-}
-
-static int perf_thread_kernel_event_open(pid_t child_pid)
-{
-	struct perf_event_attr attr;
-
-	perf_kernel_event_attr_set(&attr);
-	return syscall(__NR_perf_event_open, &attr, child_pid, -1, -1, 0);
-}
-
-static int perf_cpu_kernel_event_open(int cpu)
-{
-	struct perf_event_attr attr;
-
-	perf_kernel_event_attr_set(&attr);
-	return syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
-}
-
-static int child(void)
-{
-	int ret;
-
-	ret = ptrace(PTRACE_TRACEME, 0, NULL, 0);
-	if (ret) {
-		printf("Error: PTRACE_TRACEME failed\n");
-		return 0;
-	}
-	kill(getpid(), SIGUSR1); /* --> parent (SIGUSR1) */
-
-	return 0;
-}
-
-static void ptrace_ppc_hw_breakpoint(struct ppc_hw_breakpoint *info, int type,
-				     __u64 addr, int len)
-{
-	info->version = 1;
-	info->trigger_type = type;
-	info->condition_mode = PPC_BREAKPOINT_CONDITION_NONE;
-	info->addr = addr;
-	info->addr2 = addr + len;
-	info->condition_value = 0;
-	if (!len)
-		info->addr_mode = PPC_BREAKPOINT_MODE_EXACT;
-	else
-		info->addr_mode = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
-}
-
-static int ptrace_open(pid_t child_pid, __u64 wp_addr, int len)
-{
-	struct ppc_hw_breakpoint info;
-
-	ptrace_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_RW, wp_addr, len);
-	return ptrace(PPC_PTRACE_SETHWDEBUG, child_pid, 0, &info);
-}
-
-static int test1(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by ptrace)
-	 *	if (existing cpu event by perf)
-	 *		if (addr range overlaps)
-	 *			fail;
-	 */
-
-	perf_fd = perf_cpu_event_open(0, (__u64)perf_data1, sizeof(*perf_data1));
-	if (perf_fd < 0)
-		return -1;
-
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd > 0 || errno != ENOSPC)
-		ret = -1;
-
-	close(perf_fd);
-	return ret;
-}
-
-static int test2(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by ptrace)
-	 *	if (existing cpu event by perf)
-	 *		if (addr range does not overlaps)
-	 *			allow;
-	 */
-
-	perf_fd = perf_cpu_event_open(0, (__u64)perf_data2, sizeof(*perf_data2));
-	if (perf_fd < 0)
-		return -1;
-
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data2, sizeof(*ptrace_data2));
-	if (ptrace_fd < 0) {
-		ret = -1;
-		goto perf_close;
-	}
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-
-perf_close:
-	close(perf_fd);
-	return ret;
-}
-
-static int test3(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by ptrace)
-	 *	if (existing thread event by perf on the same thread)
-	 *		if (addr range overlaps)
-	 *			fail;
-	 */
-	perf_fd = perf_thread_event_open(child_pid, (__u64)perf_data1,
-					 sizeof(*perf_data1));
-	if (perf_fd < 0)
-		return -1;
-
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd > 0 || errno != ENOSPC)
-		ret = -1;
-
-	close(perf_fd);
-	return ret;
-}
-
-static int test4(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by ptrace)
-	 *	if (existing thread event by perf on the same thread)
-	 *		if (addr range does not overlaps)
-	 *			fail;
-	 */
-	perf_fd = perf_thread_event_open(child_pid, (__u64)perf_data2,
-					 sizeof(*perf_data2));
-	if (perf_fd < 0)
-		return -1;
-
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data2, sizeof(*ptrace_data2));
-	if (ptrace_fd < 0) {
-		ret = -1;
-		goto perf_close;
-	}
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-
-perf_close:
-	close(perf_fd);
-	return ret;
-}
-
-static int test5(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int cpid;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by ptrace)
-	 *	if (existing thread event by perf on the different thread)
-	 *		allow;
-	 */
-	cpid = fork();
-	if (!cpid) {
-		/* Temporary Child */
-		pause();
-		exit(EXIT_SUCCESS);
-	}
-
-	perf_fd = perf_thread_event_open(cpid, (__u64)perf_data1, sizeof(*perf_data1));
-	if (perf_fd < 0) {
-		ret = -1;
-		goto kill_child;
-	}
-
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0) {
-		ret = -1;
-		goto perf_close;
-	}
-
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-perf_close:
-	close(perf_fd);
-kill_child:
-	kill(cpid, SIGINT);
-	return ret;
-}
-
-static int test6(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread kernel event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		allow;
-	 * -- OR --
-	 * if (new per cpu kernel event by perf)
-	 *	if (existing thread event by ptrace)
-	 *		allow;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_thread_kernel_event_open(child_pid);
-	if (perf_fd < 0) {
-		ret = -1;
-		goto ptrace_close;
-	}
-	close(perf_fd);
-
-	perf_fd = perf_cpu_kernel_event_open(0);
-	if (perf_fd < 0) {
-		ret = -1;
-		goto ptrace_close;
-	}
-	close(perf_fd);
-
-ptrace_close:
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test7(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		if (addr range overlaps)
-	 *			fail;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_thread_event_open(child_pid, (__u64)perf_data1,
-					 sizeof(*perf_data1));
-	if (perf_fd > 0 || errno != ENOSPC)
-		ret = -1;
-
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test8(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		if (addr range does not overlaps)
-	 *			allow;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data2, sizeof(*ptrace_data2));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_thread_event_open(child_pid, (__u64)perf_data2,
-					 sizeof(*perf_data2));
-	if (perf_fd < 0) {
-		ret = -1;
-		goto ptrace_close;
-	}
-	close(perf_fd);
-
-ptrace_close:
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test9(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int cpid;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread event by perf)
-	 *	if (existing thread event by ptrace on the other thread)
-	 *		allow;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0)
-		return -1;
-
-	cpid = fork();
-	if (!cpid) {
-		/* Temporary Child */
-		pause();
-		exit(EXIT_SUCCESS);
-	}
-
-	perf_fd = perf_thread_event_open(cpid, (__u64)perf_data1, sizeof(*perf_data1));
-	if (perf_fd < 0) {
-		ret = -1;
-		goto kill_child;
-	}
-	close(perf_fd);
-
-kill_child:
-	kill(cpid, SIGINT);
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test10(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per cpu event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		if (addr range overlaps)
-	 *			fail;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_cpu_event_open(0, (__u64)perf_data1, sizeof(*perf_data1));
-	if (perf_fd > 0 || errno != ENOSPC)
-		ret = -1;
-
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test11(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per cpu event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		if (addr range does not overlap)
-	 *			allow;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data2, sizeof(*ptrace_data2));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_cpu_event_open(0, (__u64)perf_data2, sizeof(*perf_data2));
-	if (perf_fd < 0) {
-		ret = -1;
-		goto ptrace_close;
-	}
-	close(perf_fd);
-
-ptrace_close:
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test12(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread and per cpu event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		if (addr range overlaps)
-	 *			fail;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_thread_cpu_event_open(child_pid, 0, (__u64)perf_data1, sizeof(*perf_data1));
-	if (perf_fd > 0 || errno != ENOSPC)
-		ret = -1;
-
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test13(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread and per cpu event by perf)
-	 *	if (existing thread event by ptrace on the same thread)
-	 *		if (addr range does not overlap)
-	 *			allow;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data2, sizeof(*ptrace_data2));
-	if (ptrace_fd < 0)
-		return -1;
-
-	perf_fd = perf_thread_cpu_event_open(child_pid, 0, (__u64)perf_data2, sizeof(*perf_data2));
-	if (perf_fd < 0) {
-		ret = -1;
-		goto ptrace_close;
-	}
-	close(perf_fd);
-
-ptrace_close:
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int test14(pid_t child_pid)
-{
-	int perf_fd;
-	int ptrace_fd;
-	int cpid;
-	int ret = 0;
-
-	/* Test:
-	 * if (new per thread and per cpu event by perf)
-	 *	if (existing thread event by ptrace on the other thread)
-	 *		allow;
-	 */
-	ptrace_fd = ptrace_open(child_pid, (__u64)ptrace_data1, sizeof(*ptrace_data1));
-	if (ptrace_fd < 0)
-		return -1;
-
-	cpid = fork();
-	if (!cpid) {
-		/* Temporary Child */
-		pause();
-		exit(EXIT_SUCCESS);
-	}
-
-	perf_fd = perf_thread_cpu_event_open(cpid, 0, (__u64)perf_data1,
-					     sizeof(*perf_data1));
-	if (perf_fd < 0) {
-		ret = -1;
-		goto kill_child;
-	}
-	close(perf_fd);
-
-kill_child:
-	kill(cpid, SIGINT);
-	ptrace(PPC_PTRACE_DELHWDEBUG, child_pid, 0, ptrace_fd);
-	return ret;
-}
-
-static int do_test(const char *msg, int (*fun)(pid_t arg), pid_t arg)
-{
-	int ret;
-
-	ret = fun(arg);
-	if (ret)
-		printf("%s: Error\n", msg);
-	else
-		printf("%s: Ok\n", msg);
-	return ret;
-}
-
-char *desc[14] = {
-	"perf cpu event -> ptrace thread event (Overlapping)",
-	"perf cpu event -> ptrace thread event (Non-overlapping)",
-	"perf thread event -> ptrace same thread event (Overlapping)",
-	"perf thread event -> ptrace same thread event (Non-overlapping)",
-	"perf thread event -> ptrace other thread event",
-	"ptrace thread event -> perf kernel event",
-	"ptrace thread event -> perf same thread event (Overlapping)",
-	"ptrace thread event -> perf same thread event (Non-overlapping)",
-	"ptrace thread event -> perf other thread event",
-	"ptrace thread event -> perf cpu event (Overlapping)",
-	"ptrace thread event -> perf cpu event (Non-overlapping)",
-	"ptrace thread event -> perf same thread & cpu event (Overlapping)",
-	"ptrace thread event -> perf same thread & cpu event (Non-overlapping)",
-	"ptrace thread event -> perf other thread & cpu event",
-};
-
-static int test(pid_t child_pid)
-{
-	int ret = TEST_PASS;
-
-	ret |= do_test(desc[0], test1, child_pid);
-	ret |= do_test(desc[1], test2, child_pid);
-	ret |= do_test(desc[2], test3, child_pid);
-	ret |= do_test(desc[3], test4, child_pid);
-	ret |= do_test(desc[4], test5, child_pid);
-	ret |= do_test(desc[5], test6, child_pid);
-	ret |= do_test(desc[6], test7, child_pid);
-	ret |= do_test(desc[7], test8, child_pid);
-	ret |= do_test(desc[8], test9, child_pid);
-	ret |= do_test(desc[9], test10, child_pid);
-	ret |= do_test(desc[10], test11, child_pid);
-	ret |= do_test(desc[11], test12, child_pid);
-	ret |= do_test(desc[12], test13, child_pid);
-	ret |= do_test(desc[13], test14, child_pid);
-
-	return ret;
-}
-
-static void get_dbginfo(pid_t child_pid, struct ppc_debug_info *dbginfo)
-{
-	if (ptrace(PPC_PTRACE_GETHWDBGINFO, child_pid, NULL, dbginfo)) {
-		perror("Can't get breakpoint info");
-		exit(-1);
-	}
-}
-
-static int ptrace_perf_hwbreak(void)
-{
-	int ret;
-	pid_t child_pid;
-	struct ppc_debug_info dbginfo;
-
-	child_pid = fork();
-	if (!child_pid)
-		return child();
-
-	/* parent */
-	wait(NULL); /* <-- child (SIGUSR1) */
-
-	get_dbginfo(child_pid, &dbginfo);
-	SKIP_IF_MSG(dbginfo.num_data_bps <= 1, "Not enough data watchpoints (need at least 2)");
-
-	ret = perf_cpu_event_open(0, (__u64)perf_data1, sizeof(*perf_data1));
-	SKIP_IF_MSG(ret < 0, "perf_event_open syscall failed");
-	close(ret);
-
-	ret = test(child_pid);
-
-	ptrace(PTRACE_CONT, child_pid, NULL, 0);
-	return ret;
-}
-
-int main(int argc, char *argv[])
-{
-	return test_harness(ptrace_perf_hwbreak, "ptrace-perf-hwbreak");
-}
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <asm/unistd.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/ptrace.h>
+#include <memory.h>
+#include <stdlib.h>
+#include <sys/wait.h>
+
+#include "utils.h"
+
+/*
+ * Child subroutine that performs a load on the address, then traps
+ */
+void same_watch_addr_child(unsigned long *addr);
+
+/* Address of the ld instruction in same_watch_addr_child() */
+extern char same_watch_addr_load[];
+
+/* Address of the end trap instruction in same_watch_addr_child() */
+extern char same_watch_addr_trap[];
+
+/*
+ * Child subroutine that performs a load on the first address, then a load on
+ * the second address (with no instructions separating this from the first
+ * load), then traps.
+ */
+void perf_then_ptrace_child(unsigned long *first_addr, unsigned long *second_addr);
+
+/* Address of the first ld instruction in perf_then_ptrace_child() */
+extern char perf_then_ptrace_load1[];
+
+/* Address of the second ld instruction in perf_then_ptrace_child() */
+extern char perf_then_ptrace_load2[];
+
+/* Address of the end trap instruction in perf_then_ptrace_child() */
+extern char perf_then_ptrace_trap[];
+
+static inline long sys_ptrace(long request, pid_t pid, unsigned long addr, unsigned long data)
+{
+	return syscall(__NR_ptrace, request, pid, addr, data);
+}
+
+static long ptrace_traceme(void)
+{
+	return sys_ptrace(PTRACE_TRACEME, 0, 0, 0);
+}
+
+static long ptrace_getregs(pid_t pid, struct pt_regs *result)
+{
+	return sys_ptrace(PTRACE_GETREGS, pid, 0, (unsigned long)result);
+}
+
+static long ptrace_setregs(pid_t pid, struct pt_regs *result)
+{
+	return sys_ptrace(PTRACE_SETREGS, pid, 0, (unsigned long)result);
+}
+
+static long ptrace_cont(pid_t pid, long signal)
+{
+	return sys_ptrace(PTRACE_CONT, pid, 0, signal);
+}
+
+static long ptrace_singlestep(pid_t pid, long signal)
+{
+	return sys_ptrace(PTRACE_SINGLESTEP, pid, 0, signal);
+}
+
+static long ppc_ptrace_gethwdbginfo(pid_t pid, struct ppc_debug_info *dbginfo)
+{
+	return sys_ptrace(PPC_PTRACE_GETHWDBGINFO, pid, 0, (unsigned long)dbginfo);
+}
+
+static long ppc_ptrace_sethwdbg(pid_t pid, struct ppc_hw_breakpoint *bp_info)
+{
+	return sys_ptrace(PPC_PTRACE_SETHWDEBUG, pid, 0, (unsigned long)bp_info);
+}
+
+static long ppc_ptrace_delhwdbg(pid_t pid, int bp_id)
+{
+	return sys_ptrace(PPC_PTRACE_DELHWDEBUG, pid, 0L, bp_id);
+}
+
+static long ptrace_getreg_pc(pid_t pid, void **pc)
+{
+	struct pt_regs regs;
+	long err;
+
+	err = ptrace_getregs(pid, &regs);
+	if (err)
+		return err;
+
+	*pc = (void *)regs.nip;
+
+	return 0;
+}
+
+static long ptrace_setreg_pc(pid_t pid, void *pc)
+{
+	struct pt_regs regs;
+	long err;
+
+	err = ptrace_getregs(pid, &regs);
+	if (err)
+		return err;
+
+	regs.nip = (unsigned long)pc;
+
+	err = ptrace_setregs(pid, &regs);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu,
+			   int group_fd, unsigned long flags)
+{
+	return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
+}
+
+static void perf_user_event_attr_set(struct perf_event_attr *attr, void *addr, u64 len)
+{
+	memset(attr, 0, sizeof(struct perf_event_attr));
+
+	attr->type		= PERF_TYPE_BREAKPOINT;
+	attr->size		= sizeof(struct perf_event_attr);
+	attr->bp_type		= HW_BREAKPOINT_R;
+	attr->bp_addr		= (u64)addr;
+	attr->bp_len		= len;
+	attr->exclude_kernel	= 1;
+	attr->exclude_hv	= 1;
+}
+
+static int perf_watchpoint_open(pid_t child_pid, void *addr, u64 len)
+{
+	struct perf_event_attr attr;
+
+	perf_user_event_attr_set(&attr, addr, len);
+	return perf_event_open(&attr, child_pid, -1, -1, 0);
+}
+
+static int perf_read_counter(int perf_fd, u64 *count)
+{
+	/*
+	 * A perf counter is retrieved by the read() syscall. It contains
+	 * the current count as 8 bytes that are interpreted as a u64
+	 */
+	ssize_t len = read(perf_fd, count, sizeof(*count));
+
+	if (len != sizeof(*count))
+		return -1;
+
+	return 0;
+}
+
+static void ppc_ptrace_init_breakpoint(struct ppc_hw_breakpoint *info,
+				       int type, void *addr, int len)
+{
+	info->version = 1;
+	info->trigger_type = type;
+	info->condition_mode = PPC_BREAKPOINT_CONDITION_NONE;
+	info->addr = (u64)addr;
+	info->addr2 = (u64)addr + len;
+	info->condition_value = 0;
+	if (!len)
+		info->addr_mode = PPC_BREAKPOINT_MODE_EXACT;
+	else
+		info->addr_mode = PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE;
+}
+
+/*
+ * Checks if we can place at least 2 watchpoints on the child process
+ */
+static int check_watchpoints(pid_t pid)
+{
+	struct ppc_debug_info dbginfo;
+
+	FAIL_IF_MSG(ppc_ptrace_gethwdbginfo(pid, &dbginfo), "PPC_PTRACE_GETHWDBGINFO failed");
+	SKIP_IF_MSG(dbginfo.num_data_bps <= 1, "Not enough data watchpoints (need at least 2)");
+
+	return 0;
+}
+
+/*
+ * Wrapper around a plain fork() call that sets up the child for
+ * ptrace-ing. Both the parent and child return from this, though
+ * the child is stopped until ptrace_cont(pid) is run by the parent.
+ */
+static int ptrace_fork_child(pid_t *pid)
+{
+	int status;
+
+	*pid = fork();
+
+	if (*pid < 0)
+		FAIL_IF_MSG(1, "Failed to fork child");
+
+	if (!*pid) {
+		FAIL_IF_EXIT_MSG(ptrace_traceme(), "PTRACE_TRACEME failed");
+		FAIL_IF_EXIT_MSG(raise(SIGSTOP), "Child failed to raise SIGSTOP");
+	} else {
+		/* Synchronise on child SIGSTOP */
+		FAIL_IF_MSG(waitpid(*pid, &status, 0) == -1, "Failed to wait for child");
+		FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	}
+
+	return 0;
+}
+
+/*
+ * Tests the interaction between ptrace and perf watching the same data.
+ *
+ * We expect ptrace to take 'priority', as it is has before-execute
+ * semantics.
+ *
+ * The perf counter should not be incremented yet because perf has after-execute
+ * semantics. E.g., if ptrace changes the child PC, we don't even execute the
+ * instruction at all.
+ *
+ * When the child is stopped for ptrace, we test both continue and single step.
+ * Both should increment the perf counter. We also test changing the PC somewhere
+ * different and stepping, which should not increment the perf counter.
+ */
+int same_watch_addr_test(void)
+{
+	struct ppc_hw_breakpoint bp_info;	/* ptrace breakpoint info */
+	int bp_id;	/* Breakpoint handle of ptrace watchpoint */
+	int perf_fd;	/* File descriptor of perf performance counter */
+	u64 perf_count;	/* Most recently fetched perf performance counter value */
+	pid_t pid;	/* PID of child process */
+	void *pc;	/* Most recently fetched child PC value */
+	int status;	/* Stop status of child after waitpid */
+	unsigned long value;	/* Dummy value to be read/written to by child */
+	int err;
+
+	err = ptrace_fork_child(&pid);
+	if (err)
+		return err;
+
+	if (!pid) {
+		same_watch_addr_child(&value);
+		exit(1);
+	}
+
+	err = check_watchpoints(pid);
+	if (err)
+		return err;
+
+	/* Place a perf watchpoint counter on value */
+	perf_fd = perf_watchpoint_open(pid, &value, sizeof(value));
+	FAIL_IF_MSG(perf_fd < 0, "Failed to open perf performance counter");
+
+	/* Place a ptrace watchpoint on value */
+	ppc_ptrace_init_breakpoint(&bp_info, PPC_BREAKPOINT_TRIGGER_READ, &value, sizeof(value));
+	bp_id = ppc_ptrace_sethwdbg(pid, &bp_info);
+	FAIL_IF_MSG(bp_id < 0, "Failed to set ptrace watchpoint");
+
+	/* Let the child run. It should stop on the ptrace watchpoint */
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_load, "Child did not stop on load instruction");
+
+	/*
+	 * We stopped before executing the load, so perf should not have
+	 * recorded any events yet
+	 */
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 0, "perf recorded unexpected event");
+
+	/* Single stepping over the load should increment the perf counter */
+	FAIL_IF_MSG(ptrace_singlestep(pid, 0), "Failed to single step child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_load + 4, "Failed to single step load instruction");
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 1, "perf counter did not increment");
+
+	/*
+	 * Set up a ptrace watchpoint on the value again and trigger it.
+	 * The perf counter should not have incremented because we do not
+	 * execute the load yet.
+	 */
+	FAIL_IF_MSG(ppc_ptrace_delhwdbg(pid, bp_id), "Failed to remove old ptrace watchpoint");
+	bp_id = ppc_ptrace_sethwdbg(pid, &bp_info);
+	FAIL_IF_MSG(bp_id < 0, "Failed to set ptrace watchpoint");
+	FAIL_IF_MSG(ptrace_setreg_pc(pid, same_watch_addr_load), "Failed to set child PC");
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_load, "Child did not stop on load trap");
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 1, "perf counter should not have changed");
+
+	/* Continuing over the load should increment the perf counter */
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_trap, "Child did not stop on end trap");
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 2, "perf counter did not increment");
+
+	/*
+	 * If we set the child PC back to the load instruction, then continue,
+	 * we should reach the end trap (because ptrace is one-shot) and have
+	 * another perf event.
+	 */
+	FAIL_IF_MSG(ptrace_setreg_pc(pid, same_watch_addr_load), "Failed to set child PC");
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_trap, "Child did not stop on end trap");
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 3, "perf counter did not increment");
+
+	/*
+	 * If we set the child PC back to the load instruction, set a ptrace
+	 * watchpoint on the load, then continue, we should immediately get
+	 * the ptrace trap without incrementing the perf counter
+	 */
+	FAIL_IF_MSG(ppc_ptrace_delhwdbg(pid, bp_id), "Failed to remove old ptrace watchpoint");
+	bp_id = ppc_ptrace_sethwdbg(pid, &bp_info);
+	FAIL_IF_MSG(bp_id < 0, "Failed to set ptrace watchpoint");
+	FAIL_IF_MSG(ptrace_setreg_pc(pid, same_watch_addr_load), "Failed to set child PC");
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_load, "Child did not stop on load instruction");
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 3, "perf counter should not have changed");
+
+	/*
+	 * If we change the PC while stopped on the load instruction, we should
+	 * not increment the perf counter (because ptrace is before-execute,
+	 * perf is after-execute).
+	 */
+	FAIL_IF_MSG(ptrace_setreg_pc(pid, same_watch_addr_load + 4), "Failed to set child PC");
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != same_watch_addr_trap, "Child did not stop on end trap");
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 3, "perf counter should not have changed");
+
+	/* Clean up child */
+	FAIL_IF_MSG(kill(pid, SIGKILL) != 0, "Failed to kill child");
+
+	return 0;
+}
+
+/*
+ * Tests the interaction between ptrace and perf when:
+ * 1. perf watches a value
+ * 2. ptrace watches a different value
+ * 3. The perf value is read, then the ptrace value is read immediately after
+ *
+ * A breakpoint implementation may accidentally misattribute/skip one of
+ * the ptrace or perf handlers, as interrupt based work is done after perf
+ * and before ptrace.
+ *
+ * We expect the perf counter to increment before the ptrace watchpoint
+ * triggers.
+ */
+int perf_then_ptrace_test(void)
+{
+	struct ppc_hw_breakpoint bp_info;	/* ptrace breakpoint info */
+	int bp_id;	/* Breakpoint handle of ptrace watchpoint */
+	int perf_fd;	/* File descriptor of perf performance counter */
+	u64 perf_count;	/* Most recently fetched perf performance counter value */
+	pid_t pid;	/* PID of child process */
+	void *pc;	/* Most recently fetched child PC value */
+	int status;	/* Stop status of child after waitpid */
+	unsigned long perf_value;	/* Dummy value to be watched by perf */
+	unsigned long ptrace_value;	/* Dummy value to be watched by ptrace */
+	int err;
+
+	err = ptrace_fork_child(&pid);
+	if (err)
+		return err;
+
+	/*
+	 * If we are the child, run a subroutine that reads the perf value,
+	 * then reads the ptrace value with consecutive load instructions
+	 */
+	if (!pid) {
+		perf_then_ptrace_child(&perf_value, &ptrace_value);
+		exit(0);
+	}
+
+	err = check_watchpoints(pid);
+	if (err)
+		return err;
+
+	/* Place a perf watchpoint counter */
+	perf_fd = perf_watchpoint_open(pid, &perf_value, sizeof(perf_value));
+	FAIL_IF_MSG(perf_fd < 0, "Failed to open perf performance counter");
+
+	/* Place a ptrace watchpoint */
+	ppc_ptrace_init_breakpoint(&bp_info, PPC_BREAKPOINT_TRIGGER_READ,
+				   &ptrace_value, sizeof(ptrace_value));
+	bp_id = ppc_ptrace_sethwdbg(pid, &bp_info);
+	FAIL_IF_MSG(bp_id < 0, "Failed to set ptrace watchpoint");
+
+	/* Let the child run. It should stop on the ptrace watchpoint */
+	FAIL_IF_MSG(ptrace_cont(pid, 0), "Failed to continue child");
+
+	FAIL_IF_MSG(waitpid(pid, &status, 0) == -1, "Failed to wait for child");
+	FAIL_IF_MSG(!WIFSTOPPED(status), "Child is not stopped");
+	FAIL_IF_MSG(ptrace_getreg_pc(pid, &pc), "Failed to get child PC");
+	FAIL_IF_MSG(pc != perf_then_ptrace_load2, "Child did not stop on ptrace load");
+
+	/* perf should have recorded the first load */
+	FAIL_IF_MSG(perf_read_counter(perf_fd, &perf_count), "Failed to read perf counter");
+	FAIL_IF_MSG(perf_count != 1, "perf counter did not increment");
+
+	/* Clean up child */
+	FAIL_IF_MSG(kill(pid, SIGKILL) != 0, "Failed to kill child");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int err = 0;
+
+	err |= test_harness(same_watch_addr_test, "same_watch_addr");
+	err |= test_harness(perf_then_ptrace_test, "perf_then_ptrace");
+
+	return err;
+}
-- 
2.41.0

