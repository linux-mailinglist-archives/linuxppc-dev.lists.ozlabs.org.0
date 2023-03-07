Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2C36AD3A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:01:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxwP4M8Gz3fW9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 12:01:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LjAvM4Op;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LjAvM4Op;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxpQ4sQQz3bjk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:56:14 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326LYFrh028500
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Bm7nf9By4aAWDgXdqtpM+TczvnSUm9g3OU636UFJ4h0=;
 b=LjAvM4Opwo4tRnKoPacwMfvhZobz0IDOKYLD81N4zl0KT4Gg3E25lWNShyih8cMmChSW
 7ZUydqlsIzrr2NWzFugYLMuh5xwg5AcsVv1tA90GaxH+jAABq1PwXhN6ItBTFpkHrgC9
 1V2yD3RAoXJrsI7LtWFT3aj8vsIl5NUriwN/bwt0mxOrStizsw4Q6lZvllxEdqspHbxs
 aBW5GujgfRa66+Ovovm2ey8mjO3k/SVkOXyBKrV4OfmiEScwQ5mcDudM1rQjJpF10Clk
 TyrsAI3puQTdrJt7jK1RAP27lV5oZsA6FZ7ad5qMg5/+43tmg1gHfEDGJGcI8MDU2zd9 mw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p5p4wpq4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:12 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326BgURZ005927
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p418cufv7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:10 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270u5Za65995066
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:06 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D73BF2004B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7CF120043
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A066C60112;
	Tue,  7 Mar 2023 11:56:02 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/5] selftests/powerpc/dscr: Improve DSCR explicit random test case
Date: Tue,  7 Mar 2023 11:55:13 +1100
Message-Id: <20230307005515.174362-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307005515.174362-1-bgray@linux.ibm.com>
References: <20230307005515.174362-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fPUUXP80imHB5lx6doNjLE8FYD2E8pbH
X-Proofpoint-GUID: fPUUXP80imHB5lx6doNjLE8FYD2E8pbH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070003
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
 tools/testing/selftests/powerpc/dscr/dscr.h   |   5 -
 .../powerpc/dscr/dscr_default_test.c          | 132 ++++++++----------
 .../powerpc/dscr/dscr_explicit_test.c         |  94 ++++++++-----
 3 files changed, 114 insertions(+), 117 deletions(-)

diff --git a/tools/testing/selftests/powerpc/dscr/dscr.h b/tools/testing/selftests/powerpc/dscr/dscr.h
index 903ee0c83fac..9cd5488ab7c2 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr.h
+++ b/tools/testing/selftests/powerpc/dscr/dscr.h
@@ -88,11 +88,6 @@ void set_default_dscr(unsigned long val)
 	}
 }
 
-double uniform_deviate(int seed)
-{
-	return seed * (1.0 / (RAND_MAX + 1.0));
-}
-
 int restrict_to_one_cpu(void)
 {
 	cpu_set_t cpus;
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
index 8b7d0ff8a20a..758823d59daa 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_default_test.c
@@ -69,105 +69,85 @@ int dscr_default_lockstep_test(void)
 	return 0;
 }
 
-static unsigned long dscr;		/* System DSCR default */
-static unsigned long sequence;
-static unsigned long result[THREADS];
+struct random_thread_args {
+	pthread_t thread_id;
+	unsigned long *expected_system_dscr;
+	pthread_rwlock_t *rw_lock;
+	pthread_barrier_t *barrier;
+};
 
-static void *do_test(void *in)
+static void *dscr_default_random_thread(void *in)
 {
-	unsigned long thread = (unsigned long)in;
-	unsigned long i;
+	struct random_thread_args *args = (struct random_thread_args *)in;
+	unsigned long *expected_dscr_p = args->expected_system_dscr;
+	pthread_rwlock_t *rw_lock = args->rw_lock;
+	int err;
 
-	for (i = 0; i < COUNT; i++) {
-		unsigned long d, cur_dscr, cur_dscr_usr;
-		unsigned long s1, s2;
+	srand(gettid());
 
-		s1 = READ_ONCE(sequence);
-		if (s1 & 1)
-			continue;
-		rmb();
+	err = pthread_barrier_wait(args->barrier);
+	FAIL_IF_EXIT(err != 0 && err != PTHREAD_BARRIER_SERIAL_THREAD);
 
-		d = dscr;
-		cur_dscr = get_dscr();
-		cur_dscr_usr = get_dscr_usr();
+	for (int i = 0; i < COUNT; i++) {
+		unsigned long expected_dscr;
+		unsigned long current_dscr;
+		unsigned long current_dscr_usr;
 
-		rmb();
-		s2 = sequence;
+		FAIL_IF_EXIT(pthread_rwlock_rdlock(rw_lock));
+		expected_dscr = *expected_dscr_p;
+		current_dscr = get_dscr();
+		current_dscr_usr = get_dscr_usr();
+		FAIL_IF_EXIT(pthread_rwlock_unlock(rw_lock));
 
-		if (s1 != s2)
-			continue;
+		FAIL_IF_EXIT(current_dscr != expected_dscr);
+		FAIL_IF_EXIT(current_dscr_usr != expected_dscr);
 
-		if (cur_dscr != d) {
-			fprintf(stderr, "thread %ld kernel DSCR should be %ld "
-				"but is %ld\n", thread, d, cur_dscr);
-			result[thread] = 1;
-			pthread_exit(&result[thread]);
-		}
+		if (rand() % 10 == 0) {
+			unsigned long next_dscr;
 
-		if (cur_dscr_usr != d) {
-			fprintf(stderr, "thread %ld user DSCR should be %ld "
-				"but is %ld\n", thread, d, cur_dscr_usr);
-			result[thread] = 1;
-			pthread_exit(&result[thread]);
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
+	set_default_dscr(expected_system_dscr);
+
+	for (int i = 0; i < THREADS; i++) {
+		threads[i].expected_system_dscr = &expected_system_dscr;
+		threads[i].rw_lock = &rw_lock;
+		threads[i].barrier = &barrier;
+
+		FAIL_IF(pthread_create(&threads[i].thread_id, NULL,
+				       dscr_default_random_thread, (void *)&threads[i]));
 	}
 
-	srand(getpid());
+	for (int i = 0; i < THREADS; i++)
+		FAIL_IF(pthread_join(threads[i].thread_id, NULL));
 
-	/* Keep changing the DSCR default */
-	for (i = 0; i < COUNT; i++) {
-		double ret = uniform_deviate(rand());
+	FAIL_IF(pthread_barrier_destroy(&barrier));
+	FAIL_IF(pthread_rwlock_destroy(&rw_lock));
 
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
-	}
-
-	/* Individual testing thread exit status */
-	for (i = 0; i < THREADS; i++) {
-		if (pthread_join(threads[i], (void **)&(status[i]))) {
-			perror("pthread_join() failed");
-			return 1;
-		}
-
-		if (*status[i]) {
-			printf("%ldth thread failed to join with %ld status\n",
-								i, *status[i]);
-			return 1;
-		}
-	}
 	return 0;
 }
 
diff --git a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
index 28b1ea23e469..9930533730ae 100644
--- a/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
+++ b/tools/testing/selftests/powerpc/dscr/dscr_explicit_test.c
@@ -86,50 +86,72 @@ int dscr_explicit_lockstep_test(void)
 	return 0;
 }
 
+struct random_thread_args {
+	pthread_t thread_id;
+	bool do_yields;
+	pthread_barrier_t *barrier;
+};
+
+void *dscr_explicit_random_thread(void *in)
+{
+	struct random_thread_args *args = (struct random_thread_args *)in;
+	unsigned long expected_dscr = 0;
+	int err;
+
+	srand(gettid());
+
+	err = pthread_barrier_wait(args->barrier);
+	FAIL_IF_EXIT(err != 0 && err != PTHREAD_BARRIER_SERIAL_THREAD);
+
+	for (int i = 0; i < COUNT; i++) {
+		expected_dscr = rand() % DSCR_MAX;
+		set_dscr(expected_dscr);
+
+		for (int j = rand() % 5; j > 0; --j) {
+			FAIL_IF_EXIT(get_dscr() != expected_dscr);
+			FAIL_IF_EXIT(get_dscr_usr() != expected_dscr);
+
+			if (args->do_yields && rand() % 2)
+				sched_yield();
+		}
+
+		expected_dscr = rand() % DSCR_MAX;
+		set_dscr_usr(expected_dscr);
+
+		for (int j = rand() % 5; j > 0; --j) {
+			FAIL_IF_EXIT(get_dscr() != expected_dscr);
+			FAIL_IF_EXIT(get_dscr_usr() != expected_dscr);
+
+			if (args->do_yields && rand() % 2)
+				sched_yield();
+		}
+	}
+
+	return NULL;
+}
+
 int dscr_explicit_random_test(void)
 {
-	unsigned long i, dscr = 0;
+	struct random_thread_args threads[THREADS];
+	pthread_barrier_t barrier;
 
 	SKIP_IF(!have_hwcap2(PPC_FEATURE2_DSCR));
 
-	srand(getpid());
-	set_dscr(dscr);
+	FAIL_IF(pthread_barrier_init(&barrier, NULL, THREADS));
 
-	for (i = 0; i < COUNT; i++) {
-		unsigned long cur_dscr, cur_dscr_usr;
-		double ret = uniform_deviate(rand());
+	for (int i = 0; i < THREADS; i++) {
+		threads[i].do_yields = i % 2 == 0;
+		threads[i].barrier = &barrier;
 
-		if (ret < 0.001) {
-			dscr++;
-			if (dscr > DSCR_MAX)
-				dscr = 0;
-
-			set_dscr(dscr);
-		}
-
-		cur_dscr = get_dscr();
-		if (cur_dscr != dscr) {
-			fprintf(stderr, "Kernel DSCR should be %ld but "
-					"is %ld\n", dscr, cur_dscr);
-			return 1;
-		}
-
-		ret = uniform_deviate(rand());
-		if (ret < 0.001) {
-			dscr++;
-			if (dscr > DSCR_MAX)
-				dscr = 0;
-
-			set_dscr_usr(dscr);
-		}
-
-		cur_dscr_usr = get_dscr_usr();
-		if (cur_dscr_usr != dscr) {
-			fprintf(stderr, "User DSCR should be %ld but "
-					"is %ld\n", dscr, cur_dscr_usr);
-			return 1;
-		}
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

