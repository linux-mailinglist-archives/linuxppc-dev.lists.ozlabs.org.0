Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA963356F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 07:43:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGZT75grLz3cM1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 17:43:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbYWv0ZS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AbYWv0ZS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGZR65H8lz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 17:41:22 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM5SJRg002621;
	Tue, 22 Nov 2022 06:41:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=e7EtQxlMd5gvWhPQbnK6H7O4aiSr4xiemDXV/ZPZIqw=;
 b=AbYWv0ZS3q0qtI/Rd4tvxQpN48KJgPTLaQu/ZRF1XeGZlxBnKUAKtCvXFUvem7UTvFOE
 BJiGtgho1Jh2iB3T9k0XgzAUd3pghk3sRj83jPq7GyLgGxEXiWMycS45kcyy2GqwWMST
 l5MeKpU8WhuWGmeKQHF8y9Yu7o6pxOB10yLIwc2p0o8Qt6WnUfyJ+PQAXrEcSi1UPRAx
 FVd0RXAELfqnIgasYSyrwBeg3Kf6yxG5XGsZwc+b8AfBX4h7yKRQmU/wvCG6NqN8roCO
 sWWb/47kxQwQuseOid7FZ04g0PHDn8Ginjjk68UcYiSOs6jKlISubtyfL8ALLW1LZjm1 cg== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0ra49eyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:18 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM6bl9a004421;
	Tue, 22 Nov 2022 06:41:16 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3kxps92qye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM6fDW44457030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 06:41:13 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7D36D11C04A;
	Tue, 22 Nov 2022 06:41:13 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C32411C04C;
	Tue, 22 Nov 2022 06:41:12 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.65.119])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 06:41:12 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/3] selftests/powerpc: Move perror closer to its use
Date: Tue, 22 Nov 2022 12:10:52 +0530
Message-Id: <372ac78c27899f1f612fbd6ac796604a4a9310aa.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ovicW9HnjrB64L6xI4SfXwH90Oi63gny
X-Proofpoint-ORIG-GUID: ovicW9HnjrB64L6xI4SfXwH90Oi63gny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=989 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0
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

Right now, if perf_event_open() fails for the systemwide tests, error
report is printed too late, sometimes after subsequent system calls.
Move use of perror() to the main function, just after the syscall.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 21 +++++--------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
index ecde2c199f3b18..ea5e14ecbf309f 100644
--- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
@@ -146,6 +146,7 @@ static int perf_systemwide_event_open(int *fd, __u32 type, __u64 addr, __u64 len
 	for (i = 0; i < nprocs; i++) {
 		fd[i] = perf_cpu_event_open(i, type, addr, len);
 		if (fd[i] < 0) {
+			perror("perf_systemwide_event_open");
 			close_fds(fd, i);
 			return fd[i];
 		}
@@ -543,15 +544,12 @@ static int test_syswide_multi_diff_addr(void)
 	int ret;
 
 	ret = perf_systemwide_event_open(fd1, HW_BREAKPOINT_RW, (__u64)&a, (__u64)sizeof(a));
-	if (ret) {
-		perror("perf_systemwide_event_open");
+	if (ret)
 		exit(EXIT_FAILURE);
-	}
 
 	ret = perf_systemwide_event_open(fd2, HW_BREAKPOINT_RW, (__u64)&b, (__u64)sizeof(b));
 	if (ret) {
 		close_fds(fd1, nprocs);
-		perror("perf_systemwide_event_open");
 		exit(EXIT_FAILURE);
 	}
 
@@ -590,15 +588,12 @@ static int test_syswide_multi_same_addr(void)
 	int ret;
 
 	ret = perf_systemwide_event_open(fd1, HW_BREAKPOINT_RW, (__u64)&a, (__u64)sizeof(a));
-	if (ret) {
-		perror("perf_systemwide_event_open");
+	if (ret)
 		exit(EXIT_FAILURE);
-	}
 
 	ret = perf_systemwide_event_open(fd2, HW_BREAKPOINT_RW, (__u64)&a, (__u64)sizeof(a));
 	if (ret) {
 		close_fds(fd1, nprocs);
-		perror("perf_systemwide_event_open");
 		exit(EXIT_FAILURE);
 	}
 
@@ -637,15 +632,12 @@ static int test_syswide_multi_diff_addr_ro_wo(void)
 	int ret;
 
 	ret = perf_systemwide_event_open(fd1, HW_BREAKPOINT_W, (__u64)&a, (__u64)sizeof(a));
-	if (ret) {
-		perror("perf_systemwide_event_open");
+	if (ret)
 		exit(EXIT_FAILURE);
-	}
 
 	ret = perf_systemwide_event_open(fd2, HW_BREAKPOINT_R, (__u64)&b, (__u64)sizeof(b));
 	if (ret) {
 		close_fds(fd1, nprocs);
-		perror("perf_systemwide_event_open");
 		exit(EXIT_FAILURE);
 	}
 
@@ -684,15 +676,12 @@ static int test_syswide_multi_same_addr_ro_wo(void)
 	int ret;
 
 	ret = perf_systemwide_event_open(fd1, HW_BREAKPOINT_W, (__u64)&a, (__u64)sizeof(a));
-	if (ret) {
-		perror("perf_systemwide_event_open");
+	if (ret)
 		exit(EXIT_FAILURE);
-	}
 
 	ret = perf_systemwide_event_open(fd2, HW_BREAKPOINT_R, (__u64)&a, (__u64)sizeof(a));
 	if (ret) {
 		close_fds(fd1, nprocs);
-		perror("perf_systemwide_event_open");
 		exit(EXIT_FAILURE);
 	}
 
-- 
2.38.1

