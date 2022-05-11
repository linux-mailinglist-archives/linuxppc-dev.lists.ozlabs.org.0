Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C3523228
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 13:51:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KytXY6jWcz3cC6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 21:51:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=azgIR1Dh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=azgIR1Dh; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KytWs2KLBz3bxH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 21:50:33 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24BBKD0C032027;
 Wed, 11 May 2022 11:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=XKktL9C4TJbbgvlgUu6QYnnnQDg15+ZTlwtjWaOyxAg=;
 b=azgIR1Dh4ZPUGmTSVYPUIAw4Ioz60t/wLln9zeLM1LUEBhmdnPqlPzHzsoWHiCO0RCmr
 Uc/B9HdQ1SFIfCEzniVzoid1U7y8JHa9wH91v4/aHsHaczCBnFsf0LxSE+HzcZ8kHV6S
 vMGM7AkBrDmXB3X6sB0DDdcfTbDiIESPv9/YQfpTHw7a0qiETGoA8EFQIZnh14Vyn7iz
 kE/e3Wkk7R2LNwBHP1MC2uZx1FlAYCeSAymkfU1BoEPCzl8i4FxLalg5XlvRVkEsO2FJ
 nLJpkC5NKk47GOvm17g4pN6XQFc1tLxOEFktQd2OWS7ca69UKUSK6Um7N604PpN3rIjp Sg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g099tuw4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 11:50:18 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24BBcQjx034997;
 Wed, 11 May 2022 11:50:17 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g099tuw3m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 11:50:17 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24BBlQeA014345;
 Wed, 11 May 2022 11:50:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3fwgd8v77p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 11:50:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24BBnrqR26935760
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 11:49:53 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C21E311C04C;
 Wed, 11 May 2022 11:50:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5152111C04A;
 Wed, 11 May 2022 11:50:07 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.43.135])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 May 2022 11:50:03 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH V2] tools/perf/tests: Fix session topology test to skip the
 test in guest environment
Date: Wed, 11 May 2022 17:19:59 +0530
Message-Id: <20220511114959.84002-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BMfLMz1iJzL-X23JinDln2Sq118k2iUx
X-Proofpoint-GUID: UeEVq0zHjOPOlaWuLQs2bVKjgpHU4iL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_03,2022-05-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205110053
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 linux-perf-users@vger.kernel.org, kjain@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The session topology test fails in powerpc pSeries platform.
Test logs:
<<>>
Session topology : FAILED!
<<>>

This testcases tests cpu topology by checking the core_id and
socket_id stored in perf_env from perf session. The data from
perf session is compared with the cpu topology information
from "/sys/devices/system/cpu/cpuX/topology" like core_id,
physical_package_id. In case of virtual environment, detail
like physical_package_id is restricted to be exposed. Hence
physical_package_id is set to -1. The testcase fails on such
platforms since socket_id can't be fetched from topology info.

Skip the testcase in powerpc if physical_package_id returns -1

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v1 -> v2:
 Addressed review comments from Arnaldo and Michael Ellerman.
 skip the test in powerpc when physical_package_id is set to
 -1.
 Dropped patch 1 from V1 since current change doesn't use info
 from /proc/cpuinfo and rather uses physical_package_id value.

 tools/perf/tests/topology.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
index ee1e3dcbc0bd..d23a9e322ff5 100644
--- a/tools/perf/tests/topology.c
+++ b/tools/perf/tests/topology.c
@@ -109,6 +109,17 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map)
 			&& strncmp(session->header.env.arch, "aarch64", 7))
 		return TEST_SKIP;
 
+	/*
+	 * In powerpc pSeries platform, not all the topology information
+	 * are exposed via sysfs. Due to restriction, detail like
+	 * physical_package_id will be set to -1. Hence skip this
+	 * test if physical_package_id returns -1 for cpu from perf_cpu_map.
+	 */
+	if (strncmp(session->header.env.arch, "powerpc", 7)) {
+		if (cpu__get_socket_id(perf_cpu_map__cpu(map, 0)) == -1)
+			return TEST_SKIP;
+	}
+
 	TEST_ASSERT_VAL("Session header CPU map not set", session->header.env.cpu);
 
 	for (i = 0; i < session->header.env.nr_cpus_avail; i++) {
-- 
2.31.1

