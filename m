Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBE74FE61A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Apr 2022 18:43:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdBNz2MQ3z3c8X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 02:43:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L9NXb33h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L9NXb33h; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdBM23qGmz3bYl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 02:41:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23CFsrUf026913; 
 Tue, 12 Apr 2022 16:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=NAoXYCS4+1WQ4QMgqXKn9JUKKomj09egDtL7VAj8gp4=;
 b=L9NXb33hk+ch5pkXi1Mnma5unC/d7GXiDXMtLuFzQ7RBKRxXozVZZQ/POEuLG+WCSqVF
 gW/Jn8fY5SoqWbUzfhnSX65A39ZRiGo32/ITE7kJpvxfN02QvK5Hhdz+c2UgEb7EQyvB
 /KyMeRQoNwpmCUDUpnY1vdXXkst+AJbRbJYLdMn497NiGqFHEU/nTSPVKzgk/oIjuHrK
 GnP9xWJ/Pnd3tP+ktmT9SQAJRTCF6pLv9zrsUufxljuR2WIeFjmWiq9baOcHpB2mj9OE
 z5QWZeWAbxJAz8OameHKJglewnGqRCs7ERa5SyL1vS3+O3wVAtByxbzyKd0Q+gKApiQc Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fdcg1s3gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23CFwNF8007929;
 Tue, 12 Apr 2022 16:41:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fdcg1s3gc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:26 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23CGW1B3016520;
 Tue, 12 Apr 2022 16:41:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3fb1s8w7en-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Apr 2022 16:41:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23CGfL8P55836996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Apr 2022 16:41:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9964BAE056;
 Tue, 12 Apr 2022 16:41:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3EB23AE045;
 Tue, 12 Apr 2022 16:41:16 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.3.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 Apr 2022 16:41:15 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH V3 2/2] perf bench: Fix numa bench to fix usage of affinity
 for machines with #CPUs > 1K
Date: Tue, 12 Apr 2022 22:10:59 +0530
Message-Id: <20220412164059.42654-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
References: <20220412164059.42654-1-atrajeev@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ca8Gi43rMD4klolUDvAgTGRByrZe3YZw
X-Proofpoint-ORIG-GUID: Y4D_8TLRE4_fwZR7GEHElWE0huDQKaCD
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-12_06,2022-04-12_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204120079
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, srikar@linux.vnet.ibm.com,
 rnsastry@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 'perf bench numa' testcase fails on systems with more than 1K CPUs.

Testcase: perf bench numa mem -p 1 -t 3 -P 512 -s 100 -zZ0qcm --thp  1

Snippet of code:
<<>>
perf: bench/numa.c:302: bind_to_node: Assertion `!(ret)' failed.
Aborted (core dumped)
<<>>

bind_to_node function uses "sched_getaffinity" to save the original
cpumask and this call is returning EINVAL ((invalid argument).

This happens because the default mask size in glibc is 1024.  To
overcome this 1024 CPUs mask size limitation of cpu_set_t, change the
mask size using the CPU_*_S macros ie, use CPU_ALLOC to allocate
cpumask, CPU_ALLOC_SIZE for size.

Apart from fixing this for "orig_mask", apply same logic to "mask" as
well which is used to setaffinity so that mask size is large enough to
represent number of possible CPU's in the system.

sched_getaffinity is used in one more place in perf numa bench. It is in
"bind_to_cpu" function. Apply the same logic there also. Though
currently no failure is reported from there, it is ideal to change
getaffinity to work with such system configurations having CPU's more
than default mask size supported by glibc.

Also fix "sched_setaffinity" to use mask size which is large enough to
represent number of possible CPU's in the system.

Fixed all places where "bind_cpumask" which is part of "struct
thread_data" is used such that bind_cpumask works in all configuration.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog
 The first version was posted here:
 https://lore.kernel.org/all/20220406175113.87881-5-atrajeev@linux.vnet.ibm.com/
 This v3 version separates patch 3 and addressing compilation
 failure in some distro's. Change in V3 does initialization of cpu_set
 to NULL in main to fix compilation warning for uninitialized pointer.
 Also made changes in "bind_to_cpu" and "bind_to_node" to CPU_FREE
 masks properly.

 tools/perf/bench/numa.c | 128 +++++++++++++++++++++++++++++-----------
 1 file changed, 95 insertions(+), 33 deletions(-)

diff --git a/tools/perf/bench/numa.c b/tools/perf/bench/numa.c
index c838c248aa2c..ffa83744ef99 100644
--- a/tools/perf/bench/numa.c
+++ b/tools/perf/bench/numa.c
@@ -55,7 +55,7 @@
 
 struct thread_data {
 	int			curr_cpu;
-	cpu_set_t		bind_cpumask;
+	cpu_set_t		*bind_cpumask;
 	int			bind_node;
 	u8			*process_data;
 	int			process_nr;
@@ -267,71 +267,115 @@ static bool node_has_cpus(int node)
 	return ret;
 }
 
-static cpu_set_t bind_to_cpu(int target_cpu)
+static cpu_set_t *bind_to_cpu(int target_cpu)
 {
-	cpu_set_t orig_mask, mask;
-	int ret;
+	int nrcpus = numa_num_possible_cpus();
+	cpu_set_t *orig_mask, *mask;
+	size_t size;
 
-	ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
-	BUG_ON(ret);
+	orig_mask = CPU_ALLOC(nrcpus);
+	BUG_ON(!orig_mask);
+	size = CPU_ALLOC_SIZE(nrcpus);
+	CPU_ZERO_S(size, orig_mask);
+
+	if (sched_getaffinity(0, size, orig_mask))
+		goto err_out;
+
+	mask = CPU_ALLOC(nrcpus);
+	if (!mask)
+		goto err_out;
 
-	CPU_ZERO(&mask);
+	CPU_ZERO_S(size, mask);
 
 	if (target_cpu == -1) {
 		int cpu;
 
 		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
-			CPU_SET(cpu, &mask);
+			CPU_SET_S(cpu, size, mask);
 	} else {
-		BUG_ON(target_cpu < 0 || target_cpu >= g->p.nr_cpus);
-		CPU_SET(target_cpu, &mask);
+		if (target_cpu < 0 || target_cpu >= g->p.nr_cpus)
+			goto err;
+
+		CPU_SET_S(target_cpu, size, mask);
 	}
 
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
-	BUG_ON(ret);
+	if (sched_setaffinity(0, size, mask))
+		goto err;
 
 	return orig_mask;
+
+err:
+	CPU_FREE(mask);
+err_out:
+	CPU_FREE(orig_mask);
+
+	/* BUG_ON due to failure in allocation of orig_mask/mask */
+	BUG_ON(-1);
 }
 
-static cpu_set_t bind_to_node(int target_node)
+static cpu_set_t *bind_to_node(int target_node)
 {
-	cpu_set_t orig_mask, mask;
+	int nrcpus = numa_num_possible_cpus();
+	size_t size;
+	cpu_set_t *orig_mask, *mask;
 	int cpu;
-	int ret;
 
-	ret = sched_getaffinity(0, sizeof(orig_mask), &orig_mask);
-	BUG_ON(ret);
+	orig_mask = CPU_ALLOC(nrcpus);
+	BUG_ON(!orig_mask);
+	size = CPU_ALLOC_SIZE(nrcpus);
+	CPU_ZERO_S(size, orig_mask);
+
+	if (sched_getaffinity(0, size, orig_mask))
+		goto err_out;
+
+	mask = CPU_ALLOC(nrcpus);
+	if (!mask)
+		goto err_out;
 
-	CPU_ZERO(&mask);
+	CPU_ZERO_S(size, mask);
 
 	if (target_node == NUMA_NO_NODE) {
 		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
-			CPU_SET(cpu, &mask);
+			CPU_SET_S(cpu, size, mask);
 	} else {
 		struct bitmask *cpumask = numa_allocate_cpumask();
 
-		BUG_ON(!cpumask);
+		if (!cpumask)
+			goto err;
+
 		if (!numa_node_to_cpus(target_node, cpumask)) {
 			for (cpu = 0; cpu < (int)cpumask->size; cpu++) {
 				if (numa_bitmask_isbitset(cpumask, cpu))
-					CPU_SET(cpu, &mask);
+					CPU_SET_S(cpu, size, mask);
 			}
 		}
 		numa_free_cpumask(cpumask);
 	}
 
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
-	BUG_ON(ret);
+	if (sched_setaffinity(0, size, mask))
+		goto err;
 
 	return orig_mask;
+
+err:
+	CPU_FREE(mask);
+err_out:
+	CPU_FREE(orig_mask);
+
+	/* BUG_ON due to failure in allocation of orig_mask/mask */
+	BUG_ON(-1);
 }
 
-static void bind_to_cpumask(cpu_set_t mask)
+static void bind_to_cpumask(cpu_set_t *mask)
 {
 	int ret;
+	size_t size = CPU_ALLOC_SIZE(numa_num_possible_cpus());
 
-	ret = sched_setaffinity(0, sizeof(mask), &mask);
-	BUG_ON(ret);
+	ret = sched_setaffinity(0, size, mask);
+	if (ret) {
+		CPU_FREE(mask);
+		BUG_ON(ret);
+	}
 }
 
 static void mempol_restore(void)
@@ -377,7 +421,7 @@ do {							\
 static u8 *alloc_data(ssize_t bytes0, int map_flags,
 		      int init_zero, int init_cpu0, int thp, int init_random)
 {
-	cpu_set_t orig_mask;
+	cpu_set_t *orig_mask = NULL;
 	ssize_t bytes;
 	u8 *buf;
 	int ret;
@@ -435,6 +479,7 @@ static u8 *alloc_data(ssize_t bytes0, int map_flags,
 	/* Restore affinity: */
 	if (init_cpu0) {
 		bind_to_cpumask(orig_mask);
+		CPU_FREE(orig_mask);
 		mempol_restore();
 	}
 
@@ -595,6 +640,7 @@ static int parse_setup_cpu_list(void)
 		BUG_ON(bind_cpu_0 > bind_cpu_1);
 
 		for (bind_cpu = bind_cpu_0; bind_cpu <= bind_cpu_1; bind_cpu += step) {
+			size_t size = CPU_ALLOC_SIZE(g->p.nr_cpus);
 			int i;
 
 			for (i = 0; i < mul; i++) {
@@ -614,10 +660,15 @@ static int parse_setup_cpu_list(void)
 					tprintf("%2d", bind_cpu);
 				}
 
-				CPU_ZERO(&td->bind_cpumask);
+				td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
+				BUG_ON(!td->bind_cpumask);
+				CPU_ZERO_S(size, td->bind_cpumask);
 				for (cpu = bind_cpu; cpu < bind_cpu+bind_len; cpu++) {
-					BUG_ON(cpu < 0 || cpu >= g->p.nr_cpus);
-					CPU_SET(cpu, &td->bind_cpumask);
+					if (cpu < 0 || cpu >= g->p.nr_cpus) {
+						CPU_FREE(td->bind_cpumask);
+						BUG_ON(-1);
+					}
+					CPU_SET_S(cpu, size, td->bind_cpumask);
 				}
 				t++;
 			}
@@ -1245,7 +1296,7 @@ static void *worker_thread(void *__tdata)
 		 * by migrating to CPU#0:
 		 */
 		if (first_task && g->p.perturb_secs && (int)(stop.tv_sec - last_perturbance) >= g->p.perturb_secs) {
-			cpu_set_t orig_mask;
+			cpu_set_t *orig_mask;
 			int target_cpu;
 			int this_cpu;
 
@@ -1269,6 +1320,7 @@ static void *worker_thread(void *__tdata)
 				printf(" (injecting perturbalance, moved to CPU#%d)\n", target_cpu);
 
 			bind_to_cpumask(orig_mask);
+			CPU_FREE(orig_mask);
 		}
 
 		if (details >= 3) {
@@ -1402,21 +1454,31 @@ static void init_thread_data(void)
 
 	for (t = 0; t < g->p.nr_tasks; t++) {
 		struct thread_data *td = g->threads + t;
+		size_t cpuset_size = CPU_ALLOC_SIZE(g->p.nr_cpus);
 		int cpu;
 
 		/* Allow all nodes by default: */
 		td->bind_node = NUMA_NO_NODE;
 
 		/* Allow all CPUs by default: */
-		CPU_ZERO(&td->bind_cpumask);
+		td->bind_cpumask = CPU_ALLOC(g->p.nr_cpus);
+		BUG_ON(!td->bind_cpumask);
+		CPU_ZERO_S(cpuset_size, td->bind_cpumask);
 		for (cpu = 0; cpu < g->p.nr_cpus; cpu++)
-			CPU_SET(cpu, &td->bind_cpumask);
+			CPU_SET_S(cpu, cpuset_size, td->bind_cpumask);
 	}
 }
 
 static void deinit_thread_data(void)
 {
 	ssize_t size = sizeof(*g->threads)*g->p.nr_tasks;
+	int t;
+
+	/* Free the bind_cpumask allocated for thread_data */
+	for (t = 0; t < g->p.nr_tasks; t++) {
+		struct thread_data *td = g->threads + t;
+		CPU_FREE(td->bind_cpumask);
+	}
 
 	free_data(g->threads, size);
 }
-- 
2.35.1

