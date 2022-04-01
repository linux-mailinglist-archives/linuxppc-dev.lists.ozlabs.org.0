Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB27E4EFA3B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 21:00:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVTyc4lp0z3c4Y
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 06:00:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VZd5RK5Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VZd5RK5Y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVTxR65pXz3097
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 05:59:39 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231GoCio005036; 
 Fri, 1 Apr 2022 18:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vg1/DIsGBV4dcbCjZl5JgCp/HmHtY8bdd62ahJZzAdI=;
 b=VZd5RK5YGcYwAWxOjIl7Zr7OjG5JKXWIhObAOgO+6EUXCVTTuYovcAlqPRfheeNavqEN
 emxu2a+JVTBk93GYylEPnghOOiXUMmHzat0jp8YPNyVW+ugWwoVG2RFOBBVlE0WhOrVV
 PlExIItUKsgNW2cwXkU0dPzLs3SIM2xxiQ/V8rhExRb6I0d41XSSGqi3+uodecnydD8G
 9jrXMcHiw8eR2QYfq8HfREi+HdPWLoV0ym8vXYI38ra4EOZUBjqV1g00zO6Fop9KyS/m
 nDrT/MEkiDRK3dxbmmJCM4ORUr7Z8T0imdBG1VwkDv+/aAlOsvTJUuCs/zb292ndVs7a Vg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f632kdm71-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:31 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 231Ivl34025371;
 Fri, 1 Apr 2022 18:59:29 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3f3rs3rjc8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 231IxQ2H39911916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 18:59:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10F43A4062;
 Fri,  1 Apr 2022 18:59:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D9E1A4054;
 Fri,  1 Apr 2022 18:59:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.128.246])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 18:59:06 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 1/4] tools/perf: Fix perf bench futex to correct usage of
 affinity for machines with #CPUs > 1K
Date: Sat,  2 Apr 2022 00:28:50 +0530
Message-Id: <20220401185853.23912-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pa5DqHcapkYxXJrobfAtqxIH5g48MG1Z
X-Proofpoint-ORIG-GUID: pa5DqHcapkYxXJrobfAtqxIH5g48MG1Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010088
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

perf bench futex testcase fails on systems with CPU's
more than 1K.

Testcase: perf bench futex all
Failure snippet:
<<>>Running futex/hash benchmark...

perf: pthread_create: No such file or directory
<<>>

All the futex benchmarks ( ie hash, lock-api, requeue, wake,
wake-parallel ), pthread_create is invoked in respective bench_futex_*
function. Though the logs shows direct failure from pthread_create,
strace logs showed that actual failure is from  "sched_setaffinity"
returning EINVAL (invalid argument). This happens because the default
mask size in glibc is 1024. To overcome this 1024 CPUs mask size
limitation of cpu_set_t, change the mask size using the CPU_*_S macros.

Patch addresses this by fixing all the futex benchmarks to use
CPU_ALLOC to allocate cpumask, CPU_ALLOC_SIZE for size, and
CPU_SET_S to set the mask.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/bench/futex-hash.c          | 26 +++++++++++++++++++-------
 tools/perf/bench/futex-lock-pi.c       | 21 ++++++++++++++++-----
 tools/perf/bench/futex-requeue.c       | 21 ++++++++++++++++-----
 tools/perf/bench/futex-wake-parallel.c | 21 ++++++++++++++++-----
 tools/perf/bench/futex-wake.c          | 22 ++++++++++++++++------
 5 files changed, 83 insertions(+), 28 deletions(-)

diff --git a/tools/perf/bench/futex-hash.c b/tools/perf/bench/futex-hash.c
index 9627b6ab8670..dfce64e551e2 100644
--- a/tools/perf/bench/futex-hash.c
+++ b/tools/perf/bench/futex-hash.c
@@ -122,12 +122,14 @@ static void print_summary(void)
 int bench_futex_hash(int argc, const char **argv)
 {
 	int ret = 0;
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	struct sigaction act;
 	unsigned int i;
 	pthread_attr_t thread_attr;
 	struct worker *worker = NULL;
 	struct perf_cpu_map *cpu;
+	int nrcpus;
+	size_t size;
 
 	argc = parse_options(argc, argv, options, bench_futex_hash_usage, 0);
 	if (argc) {
@@ -170,25 +172,35 @@ int bench_futex_hash(int argc, const char **argv)
 	threads_starting = params.nthreads;
 	pthread_attr_init(&thread_attr);
 	gettimeofday(&bench__start, NULL);
+
+	nrcpus = perf_cpu_map__nr(cpu);
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	for (i = 0; i < params.nthreads; i++) {
 		worker[i].tid = i;
 		worker[i].futex = calloc(params.nfutexes, sizeof(*worker[i].futex));
 		if (!worker[i].futex)
 			goto errmem;
 
-		CPU_ZERO(&cpuset);
-		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+		CPU_ZERO_S(size, cpuset);
 
-		ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
-		if (ret)
+		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
+		ret = pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
+		if (ret) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
-
+		}
 		ret = pthread_create(&worker[i].thread, &thread_attr, workerfn,
 				     (void *)(struct worker *) &worker[i]);
-		if (ret)
+		if (ret) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 
 	}
+	CPU_FREE(cpuset);
 	pthread_attr_destroy(&thread_attr);
 
 	pthread_mutex_lock(&thread_lock);
diff --git a/tools/perf/bench/futex-lock-pi.c b/tools/perf/bench/futex-lock-pi.c
index a512a320df74..61c3bb80d4cf 100644
--- a/tools/perf/bench/futex-lock-pi.c
+++ b/tools/perf/bench/futex-lock-pi.c
@@ -120,11 +120,17 @@ static void *workerfn(void *arg)
 static void create_threads(struct worker *w, pthread_attr_t thread_attr,
 			   struct perf_cpu_map *cpu)
 {
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	unsigned int i;
+	int nrcpus =  perf_cpu_map__nr(cpu);
+	size_t size;
 
 	threads_starting = params.nthreads;
 
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	for (i = 0; i < params.nthreads; i++) {
 		worker[i].tid = i;
 
@@ -135,15 +141,20 @@ static void create_threads(struct worker *w, pthread_attr_t thread_attr,
 		} else
 			worker[i].futex = &global_futex;
 
-		CPU_ZERO(&cpuset);
-		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+		CPU_ZERO_S(size, cpuset);
+		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
 
-		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
+		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+		}
 
-		if (pthread_create(&w[i].thread, &thread_attr, workerfn, &worker[i]))
+		if (pthread_create(&w[i].thread, &thread_attr, workerfn, &worker[i])) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 	}
+	CPU_FREE(cpuset);
 }
 
 int bench_futex_lock_pi(int argc, const char **argv)
diff --git a/tools/perf/bench/futex-requeue.c b/tools/perf/bench/futex-requeue.c
index aca47ce8b1e7..2cb013f7ffe5 100644
--- a/tools/perf/bench/futex-requeue.c
+++ b/tools/perf/bench/futex-requeue.c
@@ -123,22 +123,33 @@ static void *workerfn(void *arg __maybe_unused)
 static void block_threads(pthread_t *w,
 			  pthread_attr_t thread_attr, struct perf_cpu_map *cpu)
 {
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	unsigned int i;
+	int nrcpus = perf_cpu_map__nr(cpu);
+	size_t size;
 
 	threads_starting = params.nthreads;
 
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	/* create and block all threads */
 	for (i = 0; i < params.nthreads; i++) {
-		CPU_ZERO(&cpuset);
-		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+		CPU_ZERO_S(size, cpuset);
+		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
 
-		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
+		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+		}
 
-		if (pthread_create(&w[i], &thread_attr, workerfn, NULL))
+		if (pthread_create(&w[i], &thread_attr, workerfn, NULL)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 	}
+	CPU_FREE(cpuset);
 }
 
 static void toggle_done(int sig __maybe_unused,
diff --git a/tools/perf/bench/futex-wake-parallel.c b/tools/perf/bench/futex-wake-parallel.c
index 888ee6037945..efa5070a5eb3 100644
--- a/tools/perf/bench/futex-wake-parallel.c
+++ b/tools/perf/bench/futex-wake-parallel.c
@@ -144,22 +144,33 @@ static void *blocked_workerfn(void *arg __maybe_unused)
 static void block_threads(pthread_t *w, pthread_attr_t thread_attr,
 			  struct perf_cpu_map *cpu)
 {
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	unsigned int i;
+	int nrcpus = perf_cpu_map__nr(cpu);
+	size_t size;
 
 	threads_starting = params.nthreads;
 
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	/* create and block all threads */
 	for (i = 0; i < params.nthreads; i++) {
-		CPU_ZERO(&cpuset);
-		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+		CPU_ZERO_S(size, cpuset);
+		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
 
-		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
+		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+		}
 
-		if (pthread_create(&w[i], &thread_attr, blocked_workerfn, NULL))
+		if (pthread_create(&w[i], &thread_attr, blocked_workerfn, NULL)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 	}
+	CPU_FREE(cpuset);
 }
 
 static void print_run(struct thread_data *waking_worker, unsigned int run_num)
diff --git a/tools/perf/bench/futex-wake.c b/tools/perf/bench/futex-wake.c
index aa82db51c0ab..3a10f54900c1 100644
--- a/tools/perf/bench/futex-wake.c
+++ b/tools/perf/bench/futex-wake.c
@@ -97,22 +97,32 @@ static void print_summary(void)
 static void block_threads(pthread_t *w,
 			  pthread_attr_t thread_attr, struct perf_cpu_map *cpu)
 {
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	unsigned int i;
-
+	size_t size;
+	int nrcpus = perf_cpu_map__nr(cpu);
 	threads_starting = params.nthreads;
 
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	/* create and block all threads */
 	for (i = 0; i < params.nthreads; i++) {
-		CPU_ZERO(&cpuset);
-		CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+		CPU_ZERO_S(size, cpuset);
+		CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, size, cpuset);
 
-		if (pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset))
+		if (pthread_attr_setaffinity_np(&thread_attr, size, cpuset)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+		}
 
-		if (pthread_create(&w[i], &thread_attr, workerfn, NULL))
+		if (pthread_create(&w[i], &thread_attr, workerfn, NULL)) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 	}
+	CPU_FREE(cpuset);
 }
 
 static void toggle_done(int sig __maybe_unused,
-- 
2.35.1

