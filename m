Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E92DC6D8E5D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:34:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTDT6gjmz3fRc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jUQTpaXi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jUQTpaXi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCZ0kYXz3f4x
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:45 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3362C9xA012141
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iPV+0nXcJ6am43cUStO3OgxPu+mUUAy9K1fWD7PSQlQ=;
 b=jUQTpaXilp/73YOlvZPqJ4EcOO7LHiPaHQWW+fwPOq9XvmPvzMk7tRzfIY/5MPhEnDN/
 t4ki1+78ukhL7epfsnhoHgUM08nJA+96t9jpc1RLKelq7aYr6qUdW7y7n/5iZAkdEU7v
 PNfgkcogR14gDAEHKSjftuPVSuLwraV9PBqk14Cw+0bAgRDYp8G7mHPFLVsc0ou5hTBU
 eYtvSoxvECpXC3dqfQL/Ndmw5HP2KvhvGnZAmIHLfiS7wk/R6JtugJrfRb168qeerJYp
 C7qWtK3OAHSUw2+pYxOHv8LMdh//yTHdUm+73Ct3C+50i9HX59VZcl/hUfz+jRc+SAFp oQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ps8w8cde0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33629rvD015468
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:41 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ppc873x0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364XcYf14090796
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D88D120049
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:38 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D999920040
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:37 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 280B8603B6;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/7] selftests/powerpc/dscr: Add lockstep test cases to DSCR explicit tests
Date: Thu,  6 Apr 2023 14:33:17 +1000
Message-Id: <20230406043320.125138-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _TIhcZadvRNDsJXVbVyNF3NEzbczn2EC
X-Proofpoint-ORIG-GUID: _TIhcZadvRNDsJXVbVyNF3NEzbczn2EC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060039
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

v2:	* Use the bind_to_cpu() added in the previous 2 new patches
	  instead of reimplementing it
---
 tools/testing/selftests/powerpc/dscr/Makefile |  1 +
 .../powerpc/dscr/dscr_default_test.c          | 87 ++++++++++++++++---
 .../powerpc/dscr/dscr_explicit_test.c         | 85 +++++++++++++++++-
 3 files changed, 159 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/Makefile b/tools/testing/selftests/powerpc/dscr/Makefile
index 845db6273a1b..b29a8863a734 100644
--- a/tools/testing/selftests/powerpc/dscr/Makefile
+++ b/tools/testing/selftests/powerpc/dscr/Makefile
@@ -9,5 +9,6 @@ top_srcdir = ../../../../..
 include ../../lib.mk
 
 $(OUTPUT)/dscr_default_test: LDLIBS += -lpthread
+$(OUTPUT)/dscr_explicit_test: LDLIBS += -lpthread
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
index e76611e608af..18e533d46c9a 100644
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
+	FAIL_IF(bind_to_cpu(BIND_CPU_ANY) < 0);
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
index 5659d98cf340..3b98b9a88207 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
@@ -15,9 +15,78 @@
  * Copyright 2012, Anton Blanchard, IBM Corporation.
  * Copyright 2015, Anshuman Khandual, IBM Corporation.
  */
+
+#define _GNU_SOURCE
+
 #include "dscr.h"
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
+	FAIL_IF(bind_to_cpu(BIND_CPU_ANY) < 0);
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
 
-int dscr_explicit(void)
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

