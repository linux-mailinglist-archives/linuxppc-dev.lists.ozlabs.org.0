Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6B76D8E62
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTJG0SjWz3fQY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:37:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r585pZQC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r585pZQC;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCZ2YDBz3f5Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:46 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33620UKs007783
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+LJSvjAjFr6raR5GuPyl8c27L7P+VHFv1dWB9WqSxUA=;
 b=r585pZQCOpHnczl+288FDYtOfC8EfMNIkL68tdJUAxi1yEj1ogvzyuEUZEc0JwhQf9Ar
 enDR8W1gfLcZWT2uWjRRDU5aAqywzKFHWCEhw3tt0JGSlfLStz4NwDLSmtQK0oWPuc9o
 05iqBdU3nDPLJIPGHU8Ozy2psIWvr3NdimGCLHCX+hIzdmhXpSAwleD9Q2C4yjK6yFno
 M0uRCE6Mf2Ol1Etio6KskoNWaRyfvKLf7nU6BQOXkQp4LZx6rl3y+yqFfBJnQ2TkehBt
 RH/Jsj87isWgvKcH8rFecBxxuiu+usu5bH0GFvEUNrn0vY2Dii9IXbfy3VrVPoEvXMuW Dw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psa3t2fbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:43 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3361goWq029932
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3ppbvfty7x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:41 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364Xccn47579414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:39 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5DF920040
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D672720043
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 264F66038E;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/7] selftests/powerpc: Allow bind_to_cpu() to automatically pick CPU
Date: Thu,  6 Apr 2023 14:33:16 +1000
Message-Id: <20230406043320.125138-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9x48mytNYoWkdEepAZcElAhLwV-FcZhm
X-Proofpoint-GUID: 9x48mytNYoWkdEepAZcElAhLwV-FcZhm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 spamscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060039
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

All current users of bind_to_cpu() don't care _which_ CPU they get, just
that they are bound to a single free one. So alter the interface to

	1. Accept a BIND_CPU_ANY value that tells it to automatically
	   pick a CPU
	2. Return the picked CPU

And convert all these users to bind_to_cpu(BIND_CPU_ANY).

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2:	* New in v2
---
 tools/testing/selftests/powerpc/include/utils.h     |  2 ++
 .../powerpc/pmu/ebb/cpu_event_pinned_vs_ebb_test.c  |  3 +--
 .../powerpc/pmu/ebb/cpu_event_vs_ebb_test.c         |  3 +--
 .../powerpc/pmu/ebb/ebb_vs_cpu_event_test.c         |  3 +--
 .../powerpc/pmu/ebb/multi_ebb_procs_test.c          |  6 ++----
 tools/testing/selftests/powerpc/pmu/lib.c           |  6 ++----
 tools/testing/selftests/powerpc/utils.c             | 13 ++++++++++++-
 7 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index d3589e16a20f..44bfd48b93d6 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -31,6 +31,8 @@ int read_auxv(char *buf, ssize_t buf_size);
 void *find_auxv_entry(int type, char *auxv);
 void *get_auxv_entry(int type);
 
+#define BIND_CPU_ANY	(-1)
+
 int pick_online_cpu(void);
 int bind_to_cpu(int cpu);
 
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_pinned_vs_ebb_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_pinned_vs_ebb_test.c
index 3cd33eb51e5e..fab7f34d7ce1 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_pinned_vs_ebb_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_pinned_vs_ebb_test.c
@@ -45,9 +45,8 @@ int cpu_event_pinned_vs_ebb(void)
 
 	SKIP_IF(!ebb_is_supported());
 
-	cpu = pick_online_cpu();
+	cpu = bind_to_cpu(BIND_CPU_ANY);
 	FAIL_IF(cpu < 0);
-	FAIL_IF(bind_to_cpu(cpu));
 
 	FAIL_IF(pipe(read_pipe.fds) == -1);
 	FAIL_IF(pipe(write_pipe.fds) == -1);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_vs_ebb_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_vs_ebb_test.c
index 8466ef9d7de8..7c54c262036e 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_vs_ebb_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cpu_event_vs_ebb_test.c
@@ -43,9 +43,8 @@ int cpu_event_vs_ebb(void)
 
 	SKIP_IF(!ebb_is_supported());
 
-	cpu = pick_online_cpu();
+	cpu = bind_to_cpu(BIND_CPU_ANY);
 	FAIL_IF(cpu < 0);
-	FAIL_IF(bind_to_cpu(cpu));
 
 	FAIL_IF(pipe(read_pipe.fds) == -1);
 	FAIL_IF(pipe(write_pipe.fds) == -1);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb_vs_cpu_event_test.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb_vs_cpu_event_test.c
index 4d822cb3589c..d7064b54c64f 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb_vs_cpu_event_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb_vs_cpu_event_test.c
@@ -43,9 +43,8 @@ int ebb_vs_cpu_event(void)
 
 	SKIP_IF(!ebb_is_supported());
 
-	cpu = pick_online_cpu();
+	cpu = bind_to_cpu(BIND_CPU_ANY);
 	FAIL_IF(cpu < 0);
-	FAIL_IF(bind_to_cpu(cpu));
 
 	FAIL_IF(pipe(read_pipe.fds) == -1);
 	FAIL_IF(pipe(write_pipe.fds) == -1);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
index 9b0f70d59702..4ac22b2e774f 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
@@ -75,13 +75,11 @@ static int cycles_child(void)
 int multi_ebb_procs(void)
 {
 	pid_t pids[NR_CHILDREN];
-	int cpu, rc, i;
+	int rc, i;
 
 	SKIP_IF(!ebb_is_supported());
 
-	cpu = pick_online_cpu();
-	FAIL_IF(cpu < 0);
-	FAIL_IF(bind_to_cpu(cpu));
+	FAIL_IF(bind_to_cpu(BIND_CPU_ANY) < 0);
 
 	for (i = 0; i < NR_CHILDREN; i++) {
 		pids[i] = fork();
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 144f90a78d69..321357987408 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -103,12 +103,10 @@ static int eat_cpu_child(union pipe read_pipe, union pipe write_pipe)
 pid_t eat_cpu(int (test_function)(void))
 {
 	union pipe read_pipe, write_pipe;
-	int cpu, rc;
+	int rc;
 	pid_t pid;
 
-	cpu = pick_online_cpu();
-	FAIL_IF(cpu < 0);
-	FAIL_IF(bind_to_cpu(cpu));
+	FAIL_IF(bind_to_cpu(BIND_CPU_ANY) < 0);
 
 	if (pipe(read_pipe.fds) == -1)
 		return -1;
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index cdb996dba703..252fb4a95e90 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -455,13 +455,24 @@ int pick_online_cpu(void)
 int bind_to_cpu(int cpu)
 {
 	cpu_set_t mask;
+	int err;
+
+	if (cpu == BIND_CPU_ANY) {
+		cpu = pick_online_cpu();
+		if (cpu < 0)
+			return cpu;
+	}
 
 	printf("Binding to cpu %d\n", cpu);
 
 	CPU_ZERO(&mask);
 	CPU_SET(cpu, &mask);
 
-	return sched_setaffinity(0, sizeof(mask), &mask);
+	err = sched_setaffinity(0, sizeof(mask), &mask);
+	if (err)
+		return err;
+
+	return cpu;
 }
 
 bool is_ppc64le(void)
-- 
2.39.2

