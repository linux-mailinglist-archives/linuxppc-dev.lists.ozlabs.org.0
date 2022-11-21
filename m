Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AA1631E5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 11:29:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NG3Xg0Jdnz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 21:29:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X6s55OIN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X6s55OIN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NG3Wk3XL1z3bc5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 21:28:33 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALA0kHV025901;
	Mon, 21 Nov 2022 10:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=D/hh7DEq8C7afgU8Ly2ABga2BgcTiw2WRowCgfSv4Bc=;
 b=X6s55OINhevZC2ga8RYjK7r05ncruvtSVJQ4tef4AXwv05eZNA/F9AmvNfei3SEPKn9a
 0Kivu0/9KyB6zvuhRI4PkOvOiwlhpLprbloyg8Rb7zgDSNUNNt4LGAQpozIscy5YAZ4X
 VfRWfSvxExzH6L3+DnqJjLOlvOQQquT6063D+bSHrvG8r4TrhVDi08vzrxg0uHrWX4+Y
 N5jt0HJxhkzF516jZVGcrJFufDy11H6GggzNAHBk80O/rdNU4f1Br0dNY933YvtpW014
 HPIQUNRBr46squIZ0aF6+DSDK+XGgMBj/YYhfqwO0JsN8a1mSAYis3amuOdqNipCBGPS gA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9a25uvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 10:28:20 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ALAKpva002080;
	Mon, 21 Nov 2022 10:28:18 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3kxps8tg2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Nov 2022 10:28:17 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ALAM5xQ40567070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Nov 2022 10:22:05 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D0DD11C04A;
	Mon, 21 Nov 2022 10:28:15 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E6EF211C054;
	Mon, 21 Nov 2022 10:28:13 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.68.13])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 21 Nov 2022 10:28:13 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH] perf test: Skip watchpoint tests if no watchpoints available
Date: Mon, 21 Nov 2022 15:57:47 +0530
Message-Id: <20221121102747.208289-1-naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tRRaPVTLEBLEIcsJe37p0t0tZ10F4Ho_
X-Proofpoint-GUID: tRRaPVTLEBLEIcsJe37p0t0tZ10F4Ho_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_06,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 clxscore=1011 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210079
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
Cc: Ravi Bangoria <ravi.bangoria@amd.com>, linux-perf-users@vger.kernel.org, Disha Goel <disgoel@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On IBM Power9, perf watchpoint tests fail since no hardware breakpoints
are available. Detect this by checking the error returned by
perf_event_open() and skip the tests in that case.

Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 tools/perf/tests/wp.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/perf/tests/wp.c b/tools/perf/tests/wp.c
index 56455da30341b4..cc8719609b19ea 100644
--- a/tools/perf/tests/wp.c
+++ b/tools/perf/tests/wp.c
@@ -59,8 +59,10 @@ static int __event(int wp_type, void *wp_addr, unsigned long wp_len)
 	get__perf_event_attr(&attr, wp_type, wp_addr, wp_len);
 	fd = sys_perf_event_open(&attr, 0, -1, -1,
 				 perf_event_open_cloexec_flag());
-	if (fd < 0)
+	if (fd < 0) {
+		fd = -errno;
 		pr_debug("failed opening event %x\n", attr.bp_type);
+	}
 
 	return fd;
 }
@@ -77,7 +79,7 @@ static int test__wp_ro(struct test_suite *test __maybe_unused,
 
 	fd = __event(HW_BREAKPOINT_R, (void *)&data1, sizeof(data1));
 	if (fd < 0)
-		return -1;
+		return fd == -ENODEV ? TEST_SKIP : -1;
 
 	tmp = data1;
 	WP_TEST_ASSERT_VAL(fd, "RO watchpoint", 1);
@@ -101,7 +103,7 @@ static int test__wp_wo(struct test_suite *test __maybe_unused,
 
 	fd = __event(HW_BREAKPOINT_W, (void *)&data1, sizeof(data1));
 	if (fd < 0)
-		return -1;
+		return fd == -ENODEV ? TEST_SKIP : -1;
 
 	tmp = data1;
 	WP_TEST_ASSERT_VAL(fd, "WO watchpoint", 0);
@@ -126,7 +128,7 @@ static int test__wp_rw(struct test_suite *test __maybe_unused,
 	fd = __event(HW_BREAKPOINT_R | HW_BREAKPOINT_W, (void *)&data1,
 		     sizeof(data1));
 	if (fd < 0)
-		return -1;
+		return fd == -ENODEV ? TEST_SKIP : -1;
 
 	tmp = data1;
 	WP_TEST_ASSERT_VAL(fd, "RW watchpoint", 1);
@@ -150,7 +152,7 @@ static int test__wp_modify(struct test_suite *test __maybe_unused, int subtest _
 
 	fd = __event(HW_BREAKPOINT_W, (void *)&data1, sizeof(data1));
 	if (fd < 0)
-		return -1;
+		return fd == -ENODEV ? TEST_SKIP : -1;
 
 	data1 = tmp;
 	WP_TEST_ASSERT_VAL(fd, "Modify watchpoint", 1);

base-commit: 63a3bf5e8d9e79ce456c8f73d4395a5a51d841b1
-- 
2.38.1

