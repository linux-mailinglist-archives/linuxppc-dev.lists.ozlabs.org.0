Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBB6AD398
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:59:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxtN0BTLz3fS1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:59:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YJHhIpH1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YJHhIpH1;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxpN6F1mz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:56:12 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326MFRVq024385
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=I71MQnnWRhwsx2q14pdTwpcnS+sU+NfUc7mq0m0Ikas=;
 b=YJHhIpH1PJc75qvG1WWc2ISQeilR3XCyhVv1VrGr+/URLmKLN32f4voruwzosAKk68ti
 uwPe8ipSMs/7/6ylRq4pxpCoTJAqXV+9vncVWHMP1a/gChm3K+B8Mc4fbHKAOc7CRu0c
 JyxNjKLAHdkrmDBWO+TnzjMrY/IpIH7uvYS5Mo6oLMcLzLN7uc2lQ73I+bXgiUTwwZ5d
 /1nYF7enhRaCuAa+DNSppc8gdtnsj8oc7fwAXXaDnBF+aDcAHZP+Gn9PZ29LoN4QMy3Z
 ylrfQujHas2h8kQpTBlO+DINlDA+VkdXe8ck25j+P723Dk1pN7b7eM6seF0FT/gazrF6 Aw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p5p6xpn7k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326MDTlr011569
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3p418v2rh4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:08 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270u5PJ57541012
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64C920043
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:05 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D719320040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9E5AC60426;
	Tue,  7 Mar 2023 11:56:02 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] selftests/powerpc/dscr: Add lockstep test cases to DSCR explicit tests
Date: Tue,  7 Mar 2023 11:55:12 +1100
Message-Id: <20230307005515.174362-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307005515.174362-1-bgray@linux.ibm.com>
References: <20230307005515.174362-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RCbNFORue6hQVq4GhNj_7xKKqQk4LPLO
X-Proofpoint-ORIG-GUID: RCbNFORue6hQVq4GhNj_7xKKqQk4LPLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070003
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

Add new cases to the relevant tests that use explicitly synchronized
threads to test the behaviour across context switches with less
randomness. By locking the participants to the same CPU we guarantee a
context switch occurs each time they make progress, which is a likely
failure point if the kernel is not tracking the thread local DSCR
correctly.

The random case is left in to keep exercising potential edge cases.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dscr/Makefile |  1 +
 tools/testing/selftests/powerpc/dscr/dscr.h   | 23 +++++
 .../powerpc/dscr/dscr_default_test.c          | 87 ++++++++++++++++---
 .../powerpc/dscr/dscr_explicit_test.c         | 87 ++++++++++++++++++-
 4 files changed, 183 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/Makefile b/tools/testing/selftests/powerpc/dscr/Makefile
index 845db6273a1b..b29a8863a734 100644
--- a/tools/testing/selftests/powerpc/dscr/Makefile
+++ b/tools/testing/selftests/powerpc/dscr/Makefile
@@ -9,5 +9,6 @@ top_srcdir = ../../../../..
 include ../../lib.mk
 
 $(OUTPUT)/dscr_default_test: LDLIBS += -lpthread
+$(OUTPUT)/dscr_explicit_test: LDLIBS += -lpthread
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c
diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index 2c54998d4715..903ee0c83fac 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -11,6 +11,8 @@
 #ifndef _SELFTESTS_POWERPC_DSCR_DSCR_H
 #define _SELFTESTS_POWERPC_DSCR_DSCR_H
 
+#define _GNU_SOURCE
+
 #include <unistd.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -90,4 +92,25 @@ double uniform_deviate(int seed)
 {
 	return seed * (1.0 / (RAND_MAX + 1.0));
 }
+
+int restrict_to_one_cpu(void)
+{
+	cpu_set_t cpus;
+	int cpu;
+
+	FAIL_IF(sched_getaffinity(0, sizeof(cpu_set_t), &cpus));
+
+	for (cpu = 0; cpu < CPU_SETSIZE; cpu++)
+		if (CPU_ISSET(cpu, &cpus))
+			break;
+
+	FAIL_IF(cpu == CPU_SETSIZE);
+
+	CPU_ZERO(&cpus);
+	CPU_SET(cpu, &cpus);
+	FAIL_IF(sched_setaffinity(0, sizeof(cpu_set_t), &cpus));
+
+	return 0;
+}
+
 #endif	/* _SELFTESTS_POWERPC_DSCR_DSCR_H */
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
index e76611e608af..8b7d0ff8a20a 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
@@ -9,8 +9,66 @@
  * Copyright 2012, Anton Blanchard, IBM Corporation.
  * Copyright 2015, Anshuman Khandual, IBM Corporation.
  */
+
+#define _GNU_SOURCE
+
 #include "dscr.h"
 
+#include <pthread.h>
+#include <semaphore.h>
+#include <unistd.h>
+
+static void *dscr_default_lockstep_writer(void *arg)
+{
+	sem_t *reader_sem = (sem_t *)arg;
+	sem_t *writer_sem = (sem_t *)arg + 1;
+	unsigned long expected_dscr = 0;
+
+	for (int i = 0; i < COUNT; i++) {
+		FAIL_IF_EXIT(sem_wait(writer_sem));
+
+		set_default_dscr(expected_dscr);
+		expected_dscr = (expected_dscr + 1) % DSCR_MAX;
+
+		FAIL_IF_EXIT(sem_post(reader_sem));
+	}
+
+	return NULL;
+}
+
+int dscr_default_lockstep_test(void)
+{
+	pthread_t writer;
+	sem_t rw_semaphores[2];
+	sem_t *reader_sem = &rw_semaphores[0];
+	sem_t *writer_sem = &rw_semaphores[1];
+	unsigned long expected_dscr = 0;
+
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
+
+	FAIL_IF(sem_init(reader_sem, 0, 0));
+	FAIL_IF(sem_init(writer_sem, 0, 1));  /* writer starts first */
+	FAIL_IF(restrict_to_one_cpu());
+	FAIL_IF(pthread_create(&writer, NULL, dscr_default_lockstep_writer, (void *)rw_semaphores));
+
+	for (int i = 0; i < COUNT ; i++) {
+		FAIL_IF(sem_wait(reader_sem));
+
+		FAIL_IF(get_dscr() != expected_dscr);
+		FAIL_IF(get_dscr_usr() != expected_dscr);
+
+		expected_dscr = (expected_dscr + 1) % DSCR_MAX;
+
+		FAIL_IF(sem_post(writer_sem));
+	}
+
+	FAIL_IF(pthread_join(writer, NULL));
+	FAIL_IF(sem_destroy(reader_sem));
+	FAIL_IF(sem_destroy(writer_sem));
+
+	return 0;
+}
+
 static unsigned long dscr;		/* System DSCR default */
 static unsigned long sequence;
 static unsigned long result[THREADS];
@@ -57,16 +115,13 @@ static void *do_test(void *in)
 	pthread_exit(&result[thread]);
 }
 
-int dscr_default(void)
+int dscr_default_random_test(void)
 {
 	pthread_t threads[THREADS];
 	unsigned long i, *status[THREADS];
-	unsigned long orig_dscr_default;
 
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
 
-	orig_dscr_default = get_default_dscr();
-
 	/* Initial DSCR default */
 	dscr = 1;
 	set_default_dscr(dscr);
@@ -75,7 +130,7 @@ int dscr_default(void)
 	for (i = 0; i < THREADS; i++) {
 		if (pthread_create(&threads[i], NULL, do_test, (void *)i)) {
 			perror("pthread_create() failed");
-			goto fail;
+			return 1;
 		}
 	}
 
@@ -104,23 +159,31 @@ int dscr_default(void)
 	for (i = 0; i < THREADS; i++) {
 		if (pthread_join(threads[i], (void **)&(status[i]))) {
 			perror("pthread_join() failed");
-			goto fail;
+			return 1;
 		}
 
 		if (*status[i]) {
 			printf("%ldth thread failed to join with %ld status\n",
 								i, *status[i]);
-			goto fail;
+			return 1;
 		}
 	}
-	set_default_dscr(orig_dscr_default);
 	return 0;
-fail:
-	set_default_dscr(orig_dscr_default);
-	return 1;
 }
 
 int main(int argc, char *argv[])
 {
-	return test_harness(dscr_default, "dscr_default_test");
+	unsigned long orig_dscr_default = 0;
+	int err = 0;
+
+	if (have_hwcap2(PPC_FEATURE2_DSCR))
+		orig_dscr_default = get_default_dscr();
+
+	err |= test_harness(dscr_default_lockstep_test, "dscr_default_lockstep_test");
+	err |= test_harness(dscr_default_random_test, "dscr_default_random_test");
+
+	if (have_hwcap2(PPC_FEATURE2_DSCR))
+		set_default_dscr(orig_dscr_default);
+
+	return err;
 }
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
index 5659d98cf340..28b1ea23e469 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
@@ -15,9 +15,78 @@
  * Copyright 2012, Anton Blanchard, IBM Corporation.
  * Copyright 2015, Anshuman Khandual, IBM Corporation.
  */
-#include "dscr.h"
 
-int dscr_explicit(void)
+#define _GNU_SOURCE
+
+#include "dscr.h"
+#include "utils.h"
+
+#include <pthread.h>
+#include <sched.h>
+#include <semaphore.h>
+
+void *dscr_explicit_lockstep_thread(void *args)
+{
+	sem_t *prev = (sem_t *)args;
+	sem_t *next = (sem_t *)args + 1;
+	unsigned long expected_dscr = 0;
+
+	set_dscr(expected_dscr);
+	srand(gettid());
+
+	for (int i = 0; i < COUNT; i++) {
+		FAIL_IF_EXIT(sem_wait(prev));
+
+		FAIL_IF_EXIT(expected_dscr != get_dscr());
+		FAIL_IF_EXIT(expected_dscr != get_dscr_usr());
+
+		expected_dscr = (expected_dscr + 1) % DSCR_MAX;
+		set_dscr(expected_dscr);
+
+		FAIL_IF_EXIT(sem_post(next));
+	}
+
+	return NULL;
+}
+
+int dscr_explicit_lockstep_test(void)
+{
+	pthread_t thread;
+	sem_t semaphores[2];
+	sem_t *prev = &semaphores[1];  /* reversed prev/next than for the other thread */
+	sem_t *next = &semaphores[0];
+	unsigned long expected_dscr = 0;
+
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
+
+	srand(gettid());
+	set_dscr(expected_dscr);
+
+	FAIL_IF(sem_init(prev, 0, 0));
+	FAIL_IF(sem_init(next, 0, 1));  /* other thread starts first */
+	FAIL_IF(restrict_to_one_cpu());
+	FAIL_IF(pthread_create(&thread, NULL, dscr_explicit_lockstep_thread, (void *)semaphores));
+
+	for (int i = 0; i < COUNT; i++) {
+		FAIL_IF(sem_wait(prev));
+
+		FAIL_IF(expected_dscr != get_dscr());
+		FAIL_IF(expected_dscr != get_dscr_usr());
+
+		expected_dscr = (expected_dscr - 1) % DSCR_MAX;
+		set_dscr(expected_dscr);
+
+		FAIL_IF(sem_post(next));
+	}
+
+	FAIL_IF(pthread_join(thread, NULL));
+	FAIL_IF(sem_destroy(prev));
+	FAIL_IF(sem_destroy(next));
+
+	return 0;
+}
+
+int dscr_explicit_random_test(void)
 {
 	unsigned long i, dscr = 0;
 
@@ -66,5 +135,17 @@ int dscr_explicit(void)
 
 int main(int argc, char *argv[])
 {
-	return test_harness(dscr_explicit, "dscr_explicit_test");
+	unsigned long orig_dscr_default = 0;
+	int err = 0;
+
+	if (have_hwcap2(PPC_FEATURE2_DSCR))
+		orig_dscr_default = get_default_dscr();
+
+	err |= test_harness(dscr_explicit_lockstep_test, "dscr_explicit_lockstep_test");
+	err |= test_harness(dscr_explicit_random_test, "dscr_explicit_random_test");
+
+	if (have_hwcap2(PPC_FEATURE2_DSCR))
+		set_default_dscr(orig_dscr_default);
+
+	return err;
 }
-- 
2.39.2

