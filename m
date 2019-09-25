Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C6ABD71C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 06:19:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46dPw45NlKzDqVl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 14:19:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dPdR3r1szDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 14:06:51 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8P41vmm049454
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 00:06:48 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v7uya109w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 00:06:48 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 25 Sep 2019 05:06:46 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 25 Sep 2019 05:06:42 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8P46foG36962778
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Sep 2019 04:06:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A213A405B;
 Wed, 25 Sep 2019 04:06:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC4F0A4059;
 Wed, 25 Sep 2019 04:06:39 +0000 (GMT)
Received: from bangoria.in.ibm.com (unknown [9.124.31.69])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Sep 2019 04:06:39 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org, christophe.leroy@c-s.fr
Subject: [PATCH v4 4/5] Powerpc/Watchpoint: Add dar outside test in
 perf-hwbreak.c selftest
Date: Wed, 25 Sep 2019 09:36:29 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925040630.6948-1-ravi.bangoria@linux.ibm.com>
References: <20190925040630.6948-1-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19092504-0020-0000-0000-000003713D55
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092504-0021-0000-0000-000021C700EC
Message-Id: <20190925040630.6948-5-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909250039
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

So far we used to ignore exception if dar points outside of user
specified range. But now we are ignoring it only if actual load/
store range does not overlap with user specified range. Include
selftests for the same:

  # ./tools/testing/selftests/powerpc/ptrace/perf-hwbreak
  ...
  TESTED: No overlap
  TESTED: Partial overlap
  TESTED: Partial overlap
  TESTED: No overlap
  TESTED: Full overlap
  success: perf_hwbreak

Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
---
 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 111 +++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
index 200337daec42..389c545675c6 100644
--- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
+++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
@@ -148,6 +148,113 @@ static int runtestsingle(int readwriteflag, int exclude_user, int arraytest)
 	return 0;
 }
 
+static int runtest_dar_outside(void)
+{
+	volatile char target[8];
+	volatile __u16 temp16;
+	volatile __u64 temp64;
+	struct perf_event_attr attr;
+	int break_fd;
+	unsigned long long breaks;
+	int fail = 0;
+	size_t res;
+
+	/* setup counters */
+	memset(&attr, 0, sizeof(attr));
+	attr.disabled = 1;
+	attr.type = PERF_TYPE_BREAKPOINT;
+	attr.exclude_kernel = 1;
+	attr.exclude_hv = 1;
+	attr.exclude_guest = 1;
+	attr.bp_type = HW_BREAKPOINT_RW;
+	/* watch middle half of target array */
+	attr.bp_addr = (__u64)(target + 2);
+	attr.bp_len = 4;
+	break_fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
+	if (break_fd < 0) {
+		perror("sys_perf_event_open");
+		exit(1);
+	}
+
+	/* Shouldn't hit. */
+	ioctl(break_fd, PERF_EVENT_IOC_RESET);
+	ioctl(break_fd, PERF_EVENT_IOC_ENABLE);
+	temp16 = *((__u16 *)target);
+	*((__u16 *)target) = temp16;
+	ioctl(break_fd, PERF_EVENT_IOC_DISABLE);
+	res = read(break_fd, &breaks, sizeof(unsigned long long));
+	assert(res == sizeof(unsigned long long));
+	if (breaks == 0) {
+		printf("TESTED: No overlap\n");
+	} else {
+		printf("FAILED: No overlap: %lld != 0\n", breaks);
+		fail = 1;
+	}
+
+	/* Hit */
+	ioctl(break_fd, PERF_EVENT_IOC_RESET);
+	ioctl(break_fd, PERF_EVENT_IOC_ENABLE);
+	temp16 = *((__u16 *)(target + 1));
+	*((__u16 *)(target + 1)) = temp16;
+	ioctl(break_fd, PERF_EVENT_IOC_DISABLE);
+	res = read(break_fd, &breaks, sizeof(unsigned long long));
+	assert(res == sizeof(unsigned long long));
+	if (breaks == 2) {
+		printf("TESTED: Partial overlap\n");
+	} else {
+		printf("FAILED: Partial overlap: %lld != 2\n", breaks);
+		fail = 1;
+	}
+
+	/* Hit */
+	ioctl(break_fd, PERF_EVENT_IOC_RESET);
+	ioctl(break_fd, PERF_EVENT_IOC_ENABLE);
+	temp16 = *((__u16 *)(target + 5));
+	*((__u16 *)(target + 5)) = temp16;
+	ioctl(break_fd, PERF_EVENT_IOC_DISABLE);
+	res = read(break_fd, &breaks, sizeof(unsigned long long));
+	assert(res == sizeof(unsigned long long));
+	if (breaks == 2) {
+		printf("TESTED: Partial overlap\n");
+	} else {
+		printf("FAILED: Partial overlap: %lld != 2\n", breaks);
+		fail = 1;
+	}
+
+	/* Shouldn't Hit */
+	ioctl(break_fd, PERF_EVENT_IOC_RESET);
+	ioctl(break_fd, PERF_EVENT_IOC_ENABLE);
+	temp16 = *((__u16 *)(target + 6));
+	*((__u16 *)(target + 6)) = temp16;
+	ioctl(break_fd, PERF_EVENT_IOC_DISABLE);
+	res = read(break_fd, &breaks, sizeof(unsigned long long));
+	assert(res == sizeof(unsigned long long));
+	if (breaks == 0) {
+		printf("TESTED: No overlap\n");
+	} else {
+		printf("FAILED: No overlap: %lld != 0\n", breaks);
+		fail = 1;
+	}
+
+	/* Hit */
+	ioctl(break_fd, PERF_EVENT_IOC_RESET);
+	ioctl(break_fd, PERF_EVENT_IOC_ENABLE);
+	temp64 = *((__u64 *)target);
+	*((__u64 *)target) = temp64;
+	ioctl(break_fd, PERF_EVENT_IOC_DISABLE);
+	res = read(break_fd, &breaks, sizeof(unsigned long long));
+	assert(res == sizeof(unsigned long long));
+	if (breaks == 2) {
+		printf("TESTED: Full overlap\n");
+	} else {
+		printf("FAILED: Full overlap: %lld != 2\n", breaks);
+		fail = 1;
+	}
+
+	close(break_fd);
+	return fail;
+}
+
 static int runtest(void)
 {
 	int rwflag;
@@ -172,7 +279,9 @@ static int runtest(void)
 				return ret;
 		}
 	}
-	return 0;
+
+	ret = runtest_dar_outside();
+	return ret;
 }
 
 
-- 
2.21.0

