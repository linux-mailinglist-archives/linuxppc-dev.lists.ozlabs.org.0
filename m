Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A617604C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:36:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=idOXAzhW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R904D6Lh5z3cX4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 11:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=idOXAzhW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8zFy69qmz307K
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 10:59:50 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36P0oCl3032025
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AnPqBrcj8dqQ8NDhJWjAudQKYHx2z3KBMHmiUXIrKi0=;
 b=idOXAzhWXVEDKu5bp10/ClStWot/GYaIPxI6v6WNzXsf18VFXoQNZZTDCiHC5AAlNRep
 qohJSfveg3FhTh0tg3j9hhwbFPjW1IGcJb3KzjpZhZ8PVfsYr2juoTNF8q5C/LlIXTTc
 0YkXw9Y+vksynXxg2S4iFZzBxKqXviZgD2xeGF/7WnJgHklomNRw0mTrls4qPDt7tBJF
 o4Hw/n0McAShrf58vKlA8S98X8Cr2ZpSJbAOzXtgqL0cA8/l/m30nVu/oXHkKFmcaTEY
 YreclP/mS+AZTYEQ17JD90TOh8d514Aq2ZMeEApb1ksWCLAEZySsYsjtGkSeeo1CDM+/ nQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s212k3gjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:47 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36P04C6w026217
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0serr68x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:46 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36P0xjMk28181058
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:45 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3A6120043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:44 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E25CC20065
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 00:59:43 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3321A60457;
	Tue, 25 Jul 2023 10:59:41 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 2/4] selftests/powerpc/ptrace: Explain why tests are skipped
Date: Tue, 25 Jul 2023 10:58:39 +1000
Message-ID: <20230725005841.28854-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725005841.28854-1-bgray@linux.ibm.com>
References: <20230725005841.28854-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HgvWAQYf5PX5zE3WXIXzUr0gB7u4KiCq
X-Proofpoint-ORIG-GUID: HgvWAQYf5PX5zE3WXIXzUr0gB7u4KiCq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-24_18,2023-07-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=989 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250003
X-Mailman-Approved-At: Tue, 25 Jul 2023 11:33:14 +1000
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

Many tests require specific hardware features/configurations that a
typical machine might not have. As a result, it's common to see a test
is skipped. But it is tedious to find out why a test is skipped
when all it gives is the file location of the skip macro.

Convert SKIP_IF() to SKIP_IF_MSG(), with appropriate descriptions of why
the test is being skipped. This gives a general idea of why a test is
skipped, which can be looked into further if it doesn't make sense.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/ptrace/child.h               | 4 ++--
 tools/testing/selftests/powerpc/ptrace/core-pkey.c           | 2 +-
 tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c        | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c      | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c         | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tar.c          | 2 +-
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c       | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c   | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c   | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c   | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c       | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c       | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c       | 4 ++--
 tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c          | 2 +-
 15 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/child.h b/tools/testing/selftests/powerpc/ptrace/child.h
index d7275b7b33dc..df62ff0735f7 100644
--- a/tools/testing/selftests/powerpc/ptrace/child.h
+++ b/tools/testing/selftests/powerpc/ptrace/child.h
@@ -48,12 +48,12 @@ struct child_sync {
 		}							\
 	} while (0)
 
-#define PARENT_SKIP_IF_UNSUPPORTED(x, sync)				\
+#define PARENT_SKIP_IF_UNSUPPORTED(x, sync, msg)			\
 	do {								\
 		if ((x) == -1 && (errno == ENODEV || errno == EINVAL)) { \
 			(sync)->parent_gave_up = true;			\
 			prod_child(sync);				\
-			SKIP_IF(1);					\
+			SKIP_IF_MSG(1, msg);				\
 		}							\
 	} while (0)
 
diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index f6f8596ce8e1..f6da4cb30cd6 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -266,7 +266,7 @@ static int parent(struct shared_info *info, pid_t pid)
 	 * to the child.
 	 */
 	ret = ptrace_read_regs(pid, NT_PPC_PKEY, regs, 3);
-	PARENT_SKIP_IF_UNSUPPORTED(ret, &info->child_sync);
+	PARENT_SKIP_IF_UNSUPPORTED(ret, &info->child_sync, "PKEYs not supported");
 	PARENT_FAIL_IF(ret, &info->child_sync);
 
 	info->amr = regs[0];
diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
index f75739bbad28..e374c6b7ace6 100644
--- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
@@ -884,7 +884,7 @@ static int perf_hwbreak(void)
 {
 	srand ( time(NULL) );
 
-	SKIP_IF(!perf_breakpoint_supported());
+	SKIP_IF_MSG(!perf_breakpoint_supported(), "Perf breakpoints not supported");
 
 	return runtest();
 }
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
index 1345e9b9af0f..a16239277a6f 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
@@ -603,7 +603,7 @@ static int ptrace_hwbreak(void)
 	wait(NULL);
 
 	get_dbginfo(child_pid, &dbginfo);
-	SKIP_IF(dbginfo.num_data_bps == 0);
+	SKIP_IF_MSG(dbginfo.num_data_bps == 0, "No data breakpoints present");
 
 	dawr = dawr_present(&dbginfo);
 	run_tests(child_pid, &dbginfo, dawr);
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
index 3344e74a97b4..16c653600124 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-perf-hwbreak.c
@@ -641,10 +641,10 @@ static int ptrace_perf_hwbreak(void)
 	wait(NULL); /* <-- child (SIGUSR1) */
 
 	get_dbginfo(child_pid, &dbginfo);
-	SKIP_IF(dbginfo.num_data_bps <= 1);
+	SKIP_IF_MSG(dbginfo.num_data_bps <= 1, "Not enough data watchpoints (need at least 2)");
 
 	ret = perf_cpu_event_open(0, (__u64)perf_data1, sizeof(*perf_data1));
-	SKIP_IF(ret < 0);
+	SKIP_IF_MSG(ret < 0, "perf_event_open syscall failed");
 	close(ret);
 
 	ret = test(child_pid);
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index bc454f899124..d89474377f11 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -192,7 +192,7 @@ static int parent(struct shared_info *info, pid_t pid)
 	 * to the child.
 	 */
 	ret = ptrace_read_regs(pid, NT_PPC_PKEY, regs, 3);
-	PARENT_SKIP_IF_UNSUPPORTED(ret, &info->child_sync);
+	PARENT_SKIP_IF_UNSUPPORTED(ret, &info->child_sync, "PKEYs not supported");
 	PARENT_FAIL_IF(ret, &info->child_sync);
 
 	info->amr1 = info->amr2 = regs[0];
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c
index 4436ca9d3caf..14726c77a6ce 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tar.c
@@ -79,7 +79,7 @@ int ptrace_tar(void)
 	int ret, status;
 
 	// TAR was added in v2.07
-	SKIP_IF(!have_hwcap2(PPC_FEATURE2_ARCH_2_07));
+	SKIP_IF_MSG(!have_hwcap2(PPC_FEATURE2_ARCH_2_07), "TAR requires ISA 2.07 compatible hardware");
 
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
index 5dc152b162df..7c70d62587c2 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
@@ -112,8 +112,8 @@ int ptrace_tm_gpr(void)
 	pid_t pid;
 	int ret, status;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
index 458cc1a70ccf..6c17ed099969 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
@@ -118,8 +118,8 @@ int ptrace_tm_spd_gpr(void)
 	pid_t pid;
 	int ret, status;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid < 0) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
index e112a34fbe59..afd8dc2e2097 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-tar.c
@@ -128,8 +128,8 @@ int ptrace_tm_spd_tar(void)
 	pid_t pid;
 	int ret, status;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid == 0)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
index 40133d49fe39..14d2fac8f237 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-vsx.c
@@ -128,8 +128,8 @@ int ptrace_tm_spd_vsx(void)
 	pid_t pid;
 	int ret, status, i;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 3, 0777|IPC_CREAT);
 
 	for (i = 0; i < 128; i++) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c
index 880ba6a29a48..e64cdb04cecf 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spr.c
@@ -113,8 +113,8 @@ int ptrace_tm_spr(void)
 	pid_t pid;
 	int ret, status;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(struct shared), 0777|IPC_CREAT);
 	shm_id1 = shmget(IPC_PRIVATE, sizeof(int), 0777|IPC_CREAT);
 	pid = fork();
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
index d0db6df0f0ea..3963d4b0429f 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-tar.c
@@ -116,8 +116,8 @@ int ptrace_tm_tar(void)
 	pid_t pid;
 	int ret, status;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
 	if (pid == 0)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
index 4f05ce4fd282..8c925d734a72 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-vsx.c
@@ -112,8 +112,8 @@ int ptrace_tm_vsx(void)
 	pid_t pid;
 	int ret, status, i;
 
-	SKIP_IF(!have_htm());
-	SKIP_IF(htm_is_synthetic());
+	SKIP_IF_MSG(!have_htm(), "Don't have transactional memory");
+	SKIP_IF_MSG(htm_is_synthetic(), "Transactional memory is synthetic");
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 
 	for (i = 0; i < 128; i++) {
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c b/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c
index cb9875f764ca..11bc624574fe 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-vsx.c
@@ -61,7 +61,7 @@ int ptrace_vsx(void)
 	pid_t pid;
 	int ret, status, i;
 
-	SKIP_IF(!have_hwcap(PPC_FEATURE_HAS_VSX));
+	SKIP_IF_MSG(!have_hwcap(PPC_FEATURE_HAS_VSX), "Don't have VSX");
 
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 
-- 
2.41.0

