Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C13681F1DDF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 18:54:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gfVP6LCjzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 02:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=harish@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gfSd20qhzDq61
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 02:52:45 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058GXAaS110967; Mon, 8 Jun 2020 12:52:41 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31g7a1d54m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 12:52:40 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058Gp6QF000900;
 Mon, 8 Jun 2020 16:52:38 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 31g2s7vbq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 16:52:38 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 058GqXQ311469106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 16:52:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C1DC42041;
 Mon,  8 Jun 2020 16:52:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91A7642049;
 Mon,  8 Jun 2020 16:52:31 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.22])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon,  8 Jun 2020 16:52:31 +0000 (GMT)
From: Harish <harish@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] selftests: powerpc: Fix online CPU selection
Date: Mon,  8 Jun 2020 22:22:26 +0530
Message-Id: <20200608165226.516985-1-harish@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_14:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=3 bulkscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 spamscore=0 cotscore=-2147483648
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006080117
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
Cc: srikar@linux.vnet.ibm.com, kamalesh@linux.vnet.ibm.com, shiganta@in.ibm.com,
 sandipan@linux.ibm.com, Harish <harish@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On systems with large number of cpus, test fails trying to set
affinity by calling sched_setaffinity() with smaller size for
cpuset. This patch fixes it by making sure that the size of
allocated cpu set is dependent on the number of CPUs as reported
by get_nprocs().

Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
Signed-off-by: Harish <harish@linux.ibm.com>
Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
---
 .../powerpc/benchmarks/context_switch.c        | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/benchmarks/context_switch.c b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
index a2e8c9da7fa5..de6c49d6f88f 100644
--- a/tools/testing/selftests/powerpc/benchmarks/context_switch.c
+++ b/tools/testing/selftests/powerpc/benchmarks/context_switch.c
@@ -19,6 +19,7 @@
 #include <limits.h>
 #include <sys/time.h>
 #include <sys/syscall.h>
+#include <sys/sysinfo.h>
 #include <sys/types.h>
 #include <sys/shm.h>
 #include <linux/futex.h>
@@ -104,8 +105,9 @@ static void start_thread_on(void *(*fn)(void *), void *arg, unsigned long cpu)
 
 static void start_process_on(void *(*fn)(void *), void *arg, unsigned long cpu)
 {
-	int pid;
-	cpu_set_t cpuset;
+	int pid, ncpus;
+	cpu_set_t *cpuset;
+	size_t size;
 
 	pid = fork();
 	if (pid == -1) {
@@ -116,12 +118,16 @@ static void start_process_on(void *(*fn)(void *), void *arg, unsigned long cpu)
 	if (pid)
 		return;
 
-	CPU_ZERO(&cpuset);
-	CPU_SET(cpu, &cpuset);
+	size = CPU_ALLOC_SIZE(ncpus);
+	ncpus = get_nprocs();
+	cpuset = CPU_ALLOC(ncpus);
+	CPU_ZERO_S(size, cpuset);
+	CPU_SET_S(cpu, size, cpuset);
 
-	if (sched_setaffinity(0, sizeof(cpuset), &cpuset)) {
+	if (sched_setaffinity(0, size, cpuset)) {
 		perror("sched_setaffinity");
-		exit(1);
+		CPU_FREE(cpuset);
+		exit(-1);
 	}
 
 	fn(arg);
-- 
2.24.1

