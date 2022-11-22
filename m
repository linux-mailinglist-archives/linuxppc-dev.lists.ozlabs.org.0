Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BD9633570
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 07:44:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGZV95Gdhz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 17:44:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tzy+5a4V;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tzy+5a4V;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGZR90Gkxz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 17:41:24 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM5SKTd002678;
	Tue, 22 Nov 2022 06:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P0tx32f5JGYNibkVZ/aB6eueVPLYCjDPdtFiyD29GlQ=;
 b=Tzy+5a4Vp8sJxLU2VPGLLdW42u7ZoM7b0XIaOLTj1ISYwal5zcVGOMpkWIaOMG97EEag
 OE8Mu9RcPIANFPJ3FYESb157zBNyL77crTOwM702pUBVSLsgNO+3xFVPcgcdUPEM+Opz
 EmEu6jCEKN+ydUw+nJoDFL6UVOJ6zoTSNhXLyMx7Z/N3hpv96N/Sn3sUtb9bG0XcC/EU
 OzAwrk4N4WHxPuiU5MCiphBMiJxCM7UJdTmKO1w49EtoV0l4aOy5H0d4PA2x0vTOSy9d
 GlSN2gj/ER2nr6IVD1uquP3D9D3TyUMrtBAO+YUpHzjZs6HxI91C3eJSJjORldER65ed gQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0ra49f0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM6bWcC025189;
	Tue, 22 Nov 2022 06:41:18 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3kxps8up0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:18 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM6fvh936307248
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 06:41:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DC4C11C052;
	Tue, 22 Nov 2022 06:41:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5239D11C04A;
	Tue, 22 Nov 2022 06:41:15 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.65.119])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 06:41:15 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 3/3] selftests/powerpc: Account for offline cpus in perf-hwbreak test
Date: Tue, 22 Nov 2022 12:10:54 +0530
Message-Id: <15fd447dcefd19945a7d31f0a475349f548a3603.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RUSLVId2viFT1z5aOuoVldgqK8BbD9kY
X-Proofpoint-ORIG-GUID: RUSLVId2viFT1z5aOuoVldgqK8BbD9kY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220047
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
Cc: Rohan Deshpande <rohan_d@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For systemwide tests, use online cpu mask to only open events on online
cpus. This enables this test to work on systems in lower SMT modes.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 45 ++++++++++++++++---
 1 file changed, 39 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
index 866e5be48ee33a..f75739bbad28cd 100644
--- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
@@ -17,8 +17,11 @@
  * Copyright (C) 2018 Michael Neuling, IBM Corporation.
  */
 
+#define _GNU_SOURCE
+
 #include <unistd.h>
 #include <assert.h>
+#include <sched.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
@@ -141,8 +144,10 @@ static void disable_fds(int *fd, int n)
 
 static int perf_systemwide_event_open(int *fd, __u32 type, __u64 addr, __u64 len)
 {
+	int i, ncpus, cpu, ret = 0;
 	struct rlimit rlim;
-	int i = 0;
+	cpu_set_t *mask;
+	size_t size;
 
 	if (getrlimit(RLIMIT_NOFILE, &rlim)) {
 		perror("getrlimit");
@@ -154,16 +159,44 @@ static int perf_systemwide_event_open(int *fd, __u32 type, __u64 addr, __u64 len
 		return -1;
 	}
 
-	/* Assume online processors are 0 to nprocs for simplisity */
-	for (i = 0; i < nprocs; i++) {
-		fd[i] = perf_cpu_event_open(i, type, addr, len);
+	ncpus = get_nprocs_conf();
+	size = CPU_ALLOC_SIZE(ncpus);
+	mask = CPU_ALLOC(ncpus);
+	if (!mask) {
+		perror("malloc");
+		return -1;
+	}
+
+	CPU_ZERO_S(size, mask);
+
+	if (sched_getaffinity(0, size, mask)) {
+		perror("sched_getaffinity");
+		ret = -1;
+		goto done;
+	}
+
+	for (i = 0, cpu = 0; i < nprocs && cpu < ncpus; cpu++) {
+		if (!CPU_ISSET_S(cpu, size, mask))
+			continue;
+		fd[i] = perf_cpu_event_open(cpu, type, addr, len);
 		if (fd[i] < 0) {
 			perror("perf_systemwide_event_open");
 			close_fds(fd, i);
-			return fd[i];
+			ret = fd[i];
+			goto done;
 		}
+		i++;
 	}
-	return 0;
+
+	if (i < nprocs) {
+		printf("Error: Number of online cpus reduced since start of test: %d < %d\n", i, nprocs);
+		close_fds(fd, i);
+		ret = -1;
+	}
+
+done:
+	CPU_FREE(mask);
+	return ret;
 }
 
 static inline bool breakpoint_test(int len)
-- 
2.38.1

