Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F48633572
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 07:44:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGZWB6Xf7z3f69
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 17:44:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BA3AuiEg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BA3AuiEg;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGZRB4HxZz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 17:41:26 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM4wSsG018518;
	Tue, 22 Nov 2022 06:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DTUlXyfX6Bu1QorTkZgko2Jl1wQKjzEVjEZO+9+k5Vc=;
 b=BA3AuiEgUjc9vcBndjeCFWhxFUw54Kt8isUdZbkdL2LojgfR8YIOod2QjnFALu+3H3uA
 S+C9TSMLrOpMySiZdS7QR6/wc7hsKPM1bzkXJ3WUJlTyS9MsZArU4RCFtL6VRfMt6U5M
 WaqIanAcDB9YOc78Jt6aC8esRUtc7dhqH7Zqlv5vb+FT0dEpbgJRQlNpv9W6NSu+myAT
 nIA+zqIs8zoeP5lMBneygz6NJWR9kCQOegNYZVnbGwfY/a0X1FJY0Vv6kQXNdkuv2RX9
 dWzBV0VyAgWVGqLsBIk8xGa75/W3m7UG9r1XGxN9VsrMpMLOwkk7hDgIb/ZlbdYTjtO0 4g== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0qv9a1qm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:19 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM6bgU9004949;
	Tue, 22 Nov 2022 06:41:17 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04fra.de.ibm.com with ESMTP id 3kxps8tqux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM6fFOO63570200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 06:41:15 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFD9D11C050;
	Tue, 22 Nov 2022 06:41:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D494211C04A;
	Tue, 22 Nov 2022 06:41:13 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.65.119])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 06:41:13 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/3] selftests/powerpc: Bump up rlimit for perf-hwbreak test
Date: Tue, 22 Nov 2022 12:10:53 +0530
Message-Id: <187fed5843cecc1e5066677b6296ee88337d7bef.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CxDCckPF1-KDJFE6ykATtCcm-vk4ZgxA
X-Proofpoint-ORIG-GUID: CxDCckPF1-KDJFE6ykATtCcm-vk4ZgxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
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

The systemwide perf hardware breakpoint test tries to open a perf event
on each cpu. On large systems, we run out of file descriptors and fail
the test. Instead, have the test set the file descriptor limit to an
arbitraty high value.

Reported-by: Rohan Deshpande <rohan_d@linux.vnet.ibm.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 .../testing/selftests/powerpc/ptrace/perf-hwbreak.c  | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
index ea5e14ecbf309f..866e5be48ee33a 100644
--- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
@@ -26,6 +26,7 @@
 #include <sys/ioctl.h>
 #include <sys/wait.h>
 #include <sys/ptrace.h>
+#include <sys/resource.h>
 #include <sys/sysinfo.h>
 #include <asm/ptrace.h>
 #include <elf.h>
@@ -140,8 +141,19 @@ static void disable_fds(int *fd, int n)
 
 static int perf_systemwide_event_open(int *fd, __u32 type, __u64 addr, __u64 len)
 {
+	struct rlimit rlim;
 	int i = 0;
 
+	if (getrlimit(RLIMIT_NOFILE, &rlim)) {
+		perror("getrlimit");
+		return -1;
+	}
+	rlim.rlim_cur = 65536;
+	if (setrlimit(RLIMIT_NOFILE, &rlim)) {
+		perror("setrlimit");
+		return -1;
+	}
+
 	/* Assume online processors are 0 to nprocs for simplisity */
 	for (i = 0; i < nprocs; i++) {
 		fd[i] = perf_cpu_event_open(i, type, addr, len);
-- 
2.38.1

