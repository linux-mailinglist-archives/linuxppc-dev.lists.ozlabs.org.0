Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 462DC4EFA3C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 21:01:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVTzV4hqmz3c1g
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 06:01:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NrsVb1yh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NrsVb1yh; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVTxY1l79z30DX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 05:59:45 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231INgKC024481; 
 Fri, 1 Apr 2022 18:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tLHg4a5bWFlrwVszWHIvXh19F+3L0JvKOIIeuaiHRH4=;
 b=NrsVb1yhYshc3Y35lxPtJMkhJVLVZM3ZCYqGeDBOOI/J/G2svJc+owEFWG4KeMMmESv1
 nKo8g62cFbo1nZQV83JJ8BCzSvYMH9PKvFYSfBEBA0PyUBordpb1qTTGnFkRyy0NdQx0
 7PsM7zRUl8Xr/wKpxJC3EWZz9SPTu/7Zr0MVlxinjdQtPM5pflJATqIeXZcJ9ekyNMsB
 bpSC55/oi/GjOSWmjld3duAYc4sR/B+VKMMMNzlyCAlIwUjUoCq2I38lKJg9yyWR0NOQ
 WLd3iysJx28t0LsC5KGSo7ZJzLo+LSJ90HrXqDj7gOczm5RiHmS2wnGD3oNDg6PCkR1g TA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f66mkrjma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:36 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 231IwsFr017220;
 Fri, 1 Apr 2022 18:59:35 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3f1t3j3j2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 18:59:35 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 231IlR8e48824696
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 18:47:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C387FA4054;
 Fri,  1 Apr 2022 18:59:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07643A405F;
 Fri,  1 Apr 2022 18:59:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.128.246])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 18:59:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 2/4] tools/perf: Fix perf bench epoll to correct usage of
 affinity for machines with #CPUs > 1K
Date: Sat,  2 Apr 2022 00:28:51 +0530
Message-Id: <20220401185853.23912-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
References: <20220401185853.23912-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yGmgsxnwoFUtwfxszclCai5oa6mAHl4h
X-Proofpoint-ORIG-GUID: yGmgsxnwoFUtwfxszclCai5oa6mAHl4h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_05,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

perf bench epoll testcase fails on systems with CPU's
more than 1K.

Testcase: perf bench epoll all
Result snippet:
<<>>
Run summary [PID 106497]: 1399 threads monitoring on 64 file-descriptors for 8 secs.

perf: pthread_create: No such file or directory
<<>>

In epoll benchmarks (ctl, wait) pthread_create is invoked in do_threads
from respective bench_epoll_*  function. Though the logs shows direct
failure from pthread_create, the actual failure is from  "sched_setaffinity"
returning EINVAL (invalid argument). This happens because the default
mask size in glibc is 1024. To overcome this 1024 CPUs mask size
limitation of cpu_set_t, change the mask size using the CPU_*_S macros.

Patch addresses this by fixing all the epoll benchmarks to use
CPU_ALLOC to allocate cpumask, CPU_ALLOC_SIZE for size, and
CPU_SET_S to set the mask.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/bench/epoll-ctl.c  | 25 +++++++++++++++++++------
 tools/perf/bench/epoll-wait.c | 25 +++++++++++++++++++------
 2 files changed, 38 insertions(+), 12 deletions(-)

diff --git a/tools/perf/bench/epoll-ctl.c b/tools/perf/bench/epoll-ctl.c
index 1a17ec83d3c4..91c53f6c6d87 100644
--- a/tools/perf/bench/epoll-ctl.c
+++ b/tools/perf/bench/epoll-ctl.c
@@ -222,13 +222,20 @@ static void init_fdmaps(struct worker *w, int pct)
 static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
 {
 	pthread_attr_t thread_attr, *attrp = NULL;
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	unsigned int i, j;
 	int ret = 0;
+	int nrcpus;
+	size_t size;
 
 	if (!noaffinity)
 		pthread_attr_init(&thread_attr);
 
+	nrcpus = perf_cpu_map__nr(cpu);
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	for (i = 0; i < nthreads; i++) {
 		struct worker *w = &worker[i];
 
@@ -252,22 +259,28 @@ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
 			init_fdmaps(w, 50);
 
 		if (!noaffinity) {
-			CPU_ZERO(&cpuset);
-			CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+			CPU_ZERO_S(size, cpuset);
+			CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu,
+					size, cpuset);
 
-			ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
-			if (ret)
+			ret = pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
+			if (ret) {
+				CPU_FREE(cpuset);
 				err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+			}
 
 			attrp = &thread_attr;
 		}
 
 		ret = pthread_create(&w->thread, attrp, workerfn,
 				     (void *)(struct worker *) w);
-		if (ret)
+		if (ret) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 	}
 
+	CPU_FREE(cpuset);
 	if (!noaffinity)
 		pthread_attr_destroy(&thread_attr);
 
diff --git a/tools/perf/bench/epoll-wait.c b/tools/perf/bench/epoll-wait.c
index 0d1dd8879197..9469a53ffab9 100644
--- a/tools/perf/bench/epoll-wait.c
+++ b/tools/perf/bench/epoll-wait.c
@@ -291,9 +291,11 @@ static void print_summary(void)
 static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
 {
 	pthread_attr_t thread_attr, *attrp = NULL;
-	cpu_set_t cpuset;
+	cpu_set_t *cpuset;
 	unsigned int i, j;
 	int ret = 0, events = EPOLLIN;
+	int nrcpus;
+	size_t size;
 
 	if (oneshot)
 		events |= EPOLLONESHOT;
@@ -306,6 +308,11 @@ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
 	if (!noaffinity)
 		pthread_attr_init(&thread_attr);
 
+	nrcpus = perf_cpu_map__nr(cpu);
+	cpuset = CPU_ALLOC(nrcpus);
+	BUG_ON(!cpuset);
+	size = CPU_ALLOC_SIZE(nrcpus);
+
 	for (i = 0; i < nthreads; i++) {
 		struct worker *w = &worker[i];
 
@@ -341,22 +348,28 @@ static int do_threads(struct worker *worker, struct perf_cpu_map *cpu)
 		}
 
 		if (!noaffinity) {
-			CPU_ZERO(&cpuset);
-			CPU_SET(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu, &cpuset);
+			CPU_ZERO_S(size, cpuset);
+			CPU_SET_S(perf_cpu_map__cpu(cpu, i % perf_cpu_map__nr(cpu)).cpu,
+					size, cpuset);
 
-			ret = pthread_attr_setaffinity_np(&thread_attr, sizeof(cpu_set_t), &cpuset);
-			if (ret)
+			ret = pthread_attr_setaffinity_np(&thread_attr, size, cpuset);
+			if (ret) {
+				CPU_FREE(cpuset);
 				err(EXIT_FAILURE, "pthread_attr_setaffinity_np");
+			}
 
 			attrp = &thread_attr;
 		}
 
 		ret = pthread_create(&w->thread, attrp, workerfn,
 				     (void *)(struct worker *) w);
-		if (ret)
+		if (ret) {
+			CPU_FREE(cpuset);
 			err(EXIT_FAILURE, "pthread_create");
+		}
 	}
 
+	CPU_FREE(cpuset);
 	if (!noaffinity)
 		pthread_attr_destroy(&thread_attr);
 
-- 
2.35.1

