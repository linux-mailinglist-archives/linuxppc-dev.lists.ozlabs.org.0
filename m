Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D546D8E65
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTL73j38z3ffq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:39:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOdsxl9Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UOdsxl9Q;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCc2m5xz3f5Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3363l646030525
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=u4wOc64BM2WUu2mj2QicgyrtHZqYJ1w1wv2gqcZ68f0=;
 b=UOdsxl9Q48flOHaIO3Mh9XALaE3n+tfjbPrKkAGjKWqh8g4S2PVFadf7iOIlMBvJRS8P
 AF8KKR9pnSlXjcFkr7uuTx/thK/PGLLqB51G7o8w64GDMNkhhnxf8PxJ6kxzx4TD8Xvj
 GJAlhVbTOo8IxZS+d1TS6iDxO4EfmGbpIV6dZ3RTyjDRHygYsjzIsSKjoqz8QXQFNQZB
 mM/z/sL86DC3XhmSSSvObsvas+vq8Q3UTowtrR5Wh7icVssZDTKAkihI5M16K0zW2/56
 0czrRXIUtt/2p0KSYWPiV04GXhG6fsU50AojGcOsAJ6KndV6CW2O2tVeBSWgy0TDTJcp jA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psayrgdn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:46 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3352kSNi031489
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ppc86tx43-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364Xf8829491464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:41 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E80B20040
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F0592004B
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2A0EE6030C;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/7] selftests/powerpc/dscr: Improve DSCR explicit random test case
Date: Thu,  6 Apr 2023 14:33:18 +1000
Message-Id: <20230406043320.125138-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DjsQToaG_n0UZQNYdxe6pmk34znTVZhE
X-Proofpoint-GUID: DjsQToaG_n0UZQNYdxe6pmk34znTVZhE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The tests currently have a single writer thread updating the system
DSCR with a 1/1000 chance looped only 100 times. So only around one in
10 runs actually do anything.

* Add multiple threads to the dscr_explicit_random_test case.
* Use a barrier to make all the threads start work as simultaneously as
  possible.
* Use a rwlock and make all threads have a reasonable chance to write to
  the DSCR on each iteration.
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP is used to prevent
  writers from starving while all the other threads keep reading.
  Logging the reads/writes shows a decent mix across the whole test.
* Allow all threads a chance to write.
* Make the chance of writing more likely.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dscr/dscr.h   |   4 -
 .../powerpc/dscr/dscr_default_test.c          | 140 ++++++++----------
 .../powerpc/dscr/dscr_explicit_test.c         |  84 +++++++----
 3 files changed, 113 insertions(+), 115 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index 2c54998d4715..b281659071e8 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -86,8 +86,4 @@ void set_default_dscr(unsigned long val)
 	}
 }
 
-double uniform_deviate(int seed)
-{
-	return seed * (1.0 / (RAND_MAX + 1.0));
-}
 #endif	/* _SELFTESTS_POWERPC_DSCR_DSCR_H */
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
index 18e533d46c9a..60ab02525b79 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
@@ -69,105 +69,85 @@ int dscr_default_lockstep_test(void)
 	return 0;
 }
 
-static unsigned long dscr;		/* System DSCR default */
-static unsigned long sequence;
-static unsigned long result[THREADS];
-
-static void *do_test(void *in)
+struct random_thread_args {
+	pthread_t thread_id;
+	unsigned long *expected_system_dscr;
+	pthread_rwlock_t *rw_lock;
+	pthread_barrier_t *barrier;
+};
+
+static void *dscr_default_random_thread(void *in)
 {
-	unsigned long thread = (unsigned long)in;
-	unsigned long i;
-
-	for (i = 0; i < COUNT; i++) {
-		unsigned long d, cur_dscr, cur_dscr_usr;
-		unsigned long s1, s2;
-
-		s1 = READ_ONCE(sequence);
-		if (s1 & 1)
-			continue;
-		rmb();
-
-		d = dscr;
-		cur_dscr = get_dscr();
-		cur_dscr_usr = get_dscr_usr();
-
-		rmb();
-		s2 = sequence;
+	struct random_thread_args *args = (struct random_thread_args *)in;
+	unsigned long *expected_dscr_p = args->expected_system_dscr;
+	pthread_rwlock_t *rw_lock = args->rw_lock;
+	int err;
 
-		if (s1 != s2)
-			continue;
+	srand(gettid());
 
-		if (cur_dscr != d) {
-			fprintf(stderr, "thread %ld kernel DSCR should be %ld "
-				"but is %ld\n", thread, d, cur_dscr);
-			result[thread] = 1;
-			pthread_exit(&result[thread]);
-		}
+	err = pthread_barrier_wait(args->barrier);
+	FAIL_IF_EXIT(err != 0 && err != PTHREAD_BARRIER_SERIAL_THREAD);
 
-		if (cur_dscr_usr != d) {
-			fprintf(stderr, "thread %ld user DSCR should be %ld "
-				"but is %ld\n", thread, d, cur_dscr_usr);
-			result[thread] = 1;
-			pthread_exit(&result[thread]);
+	for (int i = 0; i < COUNT; i++) {
+		unsigned long expected_dscr;
+		unsigned long current_dscr;
+		unsigned long current_dscr_usr;
+
+		FAIL_IF_EXIT(pthread_rwlock_rdlock(rw_lock));
+		expected_dscr = *expected_dscr_p;
+		current_dscr = get_dscr();
+		current_dscr_usr = get_dscr_usr();
+		FAIL_IF_EXIT(pthread_rwlock_unlock(rw_lock));
+
+		FAIL_IF_EXIT(current_dscr != expected_dscr);
+		FAIL_IF_EXIT(current_dscr_usr != expected_dscr);
+
+		if (rand() % 10 == 0) {
+			unsigned long next_dscr;
+
+			FAIL_IF_EXIT(pthread_rwlock_wrlock(rw_lock));
+			next_dscr = (*expected_dscr_p + 1) % DSCR_MAX;
+			set_default_dscr(next_dscr);
+			*expected_dscr_p = next_dscr;
+			FAIL_IF_EXIT(pthread_rwlock_unlock(rw_lock));
 		}
 	}
-	result[thread] = 0;
-	pthread_exit(&result[thread]);
+
+	pthread_exit((void *)0);
 }
 
 int dscr_default_random_test(void)
 {
-	pthread_t threads[THREADS];
-	unsigned long i, *status[THREADS];
+	struct random_thread_args threads[THREADS];
+	unsigned long expected_system_dscr = 0;
+	pthread_rwlockattr_t rwlock_attr;
+	pthread_rwlock_t rw_lock;
+	pthread_barrier_t barrier;
 
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
 
-	/* Initial DSCR default */
-	dscr = 1;
-	set_default_dscr(dscr);
+	FAIL_IF(pthread_rwlockattr_setkind_np(&rwlock_attr,
+					      PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP));
+	FAIL_IF(pthread_rwlock_init(&rw_lock, &rwlock_attr));
+	FAIL_IF(pthread_barrier_init(&barrier, NULL, THREADS));
 
-	/* Spawn all testing threads */
-	for (i = 0; i < THREADS; i++) {
-		if (pthread_create(&threads[i], NULL, do_test, (void *)i)) {
-			perror("pthread_create() failed");
-			return 1;
-		}
-	}
+	set_default_dscr(expected_system_dscr);
 
-	srand(getpid());
+	for (int i = 0; i < THREADS; i++) {
+		threads[i].expected_system_dscr = &expected_system_dscr;
+		threads[i].rw_lock = &rw_lock;
+		threads[i].barrier = &barrier;
 
-	/* Keep changing the DSCR default */
-	for (i = 0; i < COUNT; i++) {
-		double ret = uniform_deviate(rand());
-
-		if (ret < 0.0001) {
-			sequence++;
-			wmb();
-
-			dscr++;
-			if (dscr > DSCR_MAX)
-				dscr = 0;
-
-			set_default_dscr(dscr);
-
-			wmb();
-			sequence++;
-		}
+		FAIL_IF(pthread_create(&threads[i].thread_id, NULL,
+				       dscr_default_random_thread, (void *)&threads[i]));
 	}
 
-	/* Individual testing thread exit status */
-	for (i = 0; i < THREADS; i++) {
-		if (pthread_join(threads[i], (void **)&(status[i]))) {
-			perror("pthread_join() failed");
-			return 1;
-		}
+	for (int i = 0; i < THREADS; i++)
+		FAIL_IF(pthread_join(threads[i].thread_id, NULL));
+
+	FAIL_IF(pthread_barrier_destroy(&barrier));
+	FAIL_IF(pthread_rwlock_destroy(&rw_lock));
 
-		if (*status[i]) {
-			printf("%ldth thread failed to join with %ld status\n",
-								i, *status[i]);
-			return 1;
-		}
-	}
 	return 0;
 }
 
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
index 3b98b9a88207..e2268e9183a8 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
@@ -86,50 +86,72 @@ int dscr_explicit_lockstep_test(void)
 	return 0;
 }
 
-int dscr_explicit_random_test(void)
+struct random_thread_args {
+	pthread_t thread_id;
+	bool do_yields;
+	pthread_barrier_t *barrier;
+};
+
+void *dscr_explicit_random_thread(void *in)
 {
-	unsigned long i, dscr = 0;
+	struct random_thread_args *args = (struct random_thread_args *)in;
+	unsigned long expected_dscr = 0;
+	int err;
 
-	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
+	srand(gettid());
 
-	srand(getpid());
-	set_dscr(dscr);
+	err = pthread_barrier_wait(args->barrier);
+	FAIL_IF_EXIT(err != 0 && err != PTHREAD_BARRIER_SERIAL_THREAD);
 
-	for (i = 0; i < COUNT; i++) {
-		unsigned long cur_dscr, cur_dscr_usr;
-		double ret = uniform_deviate(rand());
+	for (int i = 0; i < COUNT; i++) {
+		expected_dscr = rand() % DSCR_MAX;
+		set_dscr(expected_dscr);
 
-		if (ret < 0.001) {
-			dscr++;
-			if (dscr > DSCR_MAX)
-				dscr = 0;
+		for (int j = rand() % 5; j > 0; --j) {
+			FAIL_IF_EXIT(get_dscr() != expected_dscr);
+			FAIL_IF_EXIT(get_dscr_usr() != expected_dscr);
 
-			set_dscr(dscr);
+			if (args->do_yields && rand() % 2)
+				sched_yield();
 		}
 
-		cur_dscr = get_dscr();
-		if (cur_dscr != dscr) {
-			fprintf(stderr, "Kernel DSCR should be %ld but "
-					"is %ld\n", dscr, cur_dscr);
-			return 1;
-		}
+		expected_dscr = rand() % DSCR_MAX;
+		set_dscr_usr(expected_dscr);
 
-		ret = uniform_deviate(rand());
-		if (ret < 0.001) {
-			dscr++;
-			if (dscr > DSCR_MAX)
-				dscr = 0;
+		for (int j = rand() % 5; j > 0; --j) {
+			FAIL_IF_EXIT(get_dscr() != expected_dscr);
+			FAIL_IF_EXIT(get_dscr_usr() != expected_dscr);
 
-			set_dscr_usr(dscr);
+			if (args->do_yields && rand() % 2)
+				sched_yield();
 		}
+	}
 
-		cur_dscr_usr = get_dscr_usr();
-		if (cur_dscr_usr != dscr) {
-			fprintf(stderr, "User DSCR should be %ld but "
-					"is %ld\n", dscr, cur_dscr_usr);
-			return 1;
-		}
+	return NULL;
+}
+
+int dscr_explicit_random_test(void)
+{
+	struct random_thread_args threads[THREADS];
+	pthread_barrier_t barrier;
+
+	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
+
+	FAIL_IF(pthread_barrier_init(&barrier, NULL, THREADS));
+
+	for (int i = 0; i < THREADS; i++) {
+		threads[i].do_yields = i % 2 == 0;
+		threads[i].barrier = &barrier;
+
+		FAIL_IF(pthread_create(&threads[i].thread_id, NULL,
+				       dscr_explicit_random_thread, (void *)&threads[i]));
 	}
+
+	for (int i = 0; i < THREADS; i++)
+		FAIL_IF(pthread_join(threads[i].thread_id, NULL));
+
+	FAIL_IF(pthread_barrier_destroy(&barrier));
+
 	return 0;
 }
 
-- 
2.39.2

