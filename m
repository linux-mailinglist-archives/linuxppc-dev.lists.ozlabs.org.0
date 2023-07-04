Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C27B27468B2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 07:05:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijv8xrQd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qw9jD4v84z3bhk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 15:05:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijv8xrQd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qw9gg5Nt9z3brj
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jul 2023 15:04:15 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3644lQB9009396;
	Tue, 4 Jul 2023 05:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/6pvM9vBeSYJK1BhSenMsSpIu4OXtUUJeIh79wu2SrM=;
 b=ijv8xrQd3MMyYYYY6Mo7ZOpR4a96ZqUAEuA9S8g8ntPBSjRSWtTJPmOb6ajEqpDV3VMw
 ALUsypa+gRb5n1OJsm52/HsFg6x5GFpAsF0vHs99Nz2NdRZfBwlNE6c2DUtKUa2ACNHL
 nRkHFezsGmu0tVL+8qrgyxv0YKgGNVv5SOWCA57mUGAUedE9alQAs0QG1UMPpZblJ6gU
 k1yynIRjgXwrmamJvP+cDE/RQxEcT66/qCmjT+FuFxldNn+yRPhzvFOD38TM+z02uQGH
 s/62JTTxJMwDod/QydQ9cY95wjQxsKz8Q946JBtdcfhzq9CF+CiARavUR4YJ1I3Fu14P qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcpvgb3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:05 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3644nXhH015064;
	Tue, 4 Jul 2023 05:04:04 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rmcpvgb35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:04 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3643msjm006770;
	Tue, 4 Jul 2023 05:04:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3rjbs4st80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jul 2023 05:04:01 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36453wCf8913494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Jul 2023 05:03:58 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94A802005A;
	Tue,  4 Jul 2023 05:03:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF9BF20040;
	Tue,  4 Jul 2023 05:03:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.47.10])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Jul 2023 05:03:55 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ak@linux.intel.com
Subject: [PATCH] tools/perf/tests: Fix objdump in Object code reading test to look for all sections
Date: Tue,  4 Jul 2023 10:33:53 +0530
Message-Id: <20230704050353.14979-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BgFy6xopOiaTqfDVbEzWgKv6LG9tW1Dt
X-Proofpoint-GUID: RxLrSimjKwzjIgzpSkPJpNXbL_SWs1x6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-04_02,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0 spamscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307040042
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
Cc: irogers@google.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Object code reading test fails intermittently with below logs:

   Reading object code for memory address: 0xc008000001dd34fc
   File is: /lib/modules/6.3.0-rc7+/kernel/fs/xfs/xfs.ko
   On file address is: 0x11359c
   Objdump command is: objdump -z -d --start-address=0x1134fc --stop-address=0x11357c /lib/modules/6.3.0-rc7+/kernel/fs/xfs/xfs.ko
   objdump read too few bytes: 128
   test child finished with -1
   ---- end ----
   Object code reading: FAILED!

This issue happens ramdomly depending on the sample ip
captured during the test run. In some cases, the same ip falls
in the xfs module. The test does an objdump on the xfs.ko file and
compares it with the dump from the dso that perf captures. But
since the range of ip address falls in debug info section, it fails
to find the address range with objdump. Fix the objdump option so
as to disasseble all sections to check the address range.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/code-reading.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/code-reading.c b/tools/perf/tests/code-reading.c
index ed3815163d1b..02132478856a 100644
--- a/tools/perf/tests/code-reading.c
+++ b/tools/perf/tests/code-reading.c
@@ -184,7 +184,7 @@ static int read_via_objdump(const char *filename, u64 addr, void *buf,
 	FILE *f;
 	int ret;
 
-	fmt = "%s -z -d --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
+	fmt = "%s -z -D --start-address=0x%"PRIx64" --stop-address=0x%"PRIx64" %s";
 	ret = snprintf(cmd, sizeof(cmd), fmt, "objdump", addr, addr + len,
 		       filename);
 	if (ret <= 0 || (size_t)ret >= sizeof(cmd))
-- 
2.35.3

