Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 681E55137D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 17:11:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpzb72HsXz3brp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 01:10:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JGJ4poU7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=JGJ4poU7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpzYG6ZV0z3bdC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 01:09:22 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SF99rO027050;
 Thu, 28 Apr 2022 15:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mGo1ElBCrK7nUHpOGTtgWYU32Bs1wZeN7Wlf+69f+PY=;
 b=JGJ4poU7R1xro3stmUcn0yGuwDALu5sEAN8Y9yan3DiOVUiTe6wDXtHJMlu2sc6kAuud
 bESpDG6pkaulYriZJ/aQc/vDzRYoO1uq7mCGI2w1sC8S/YZZqs+tLcpSSZR1FEe6Flc8
 Pm81wQclGBgSNp/CcPTOYFj7ZoPSLUL9AnbVad/YguESdnaINRAn1HW3Yn50/7lhsAVr
 LXooyPkSFAI9O0hFrDUr9HlX/VuPqNQ3whpI3Ri0MQQqFqH23t71llvKgRbRnUNGuZQh
 EhW5Fg4ZAQn3bBY8VM//d2rLhC1Bp2YEgKp9t5lNgLyJAE6cz3Z2/OBK9L879ArzpPWL wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtdmmxgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:09:16 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23SF9G72028140;
 Thu, 28 Apr 2022 15:09:16 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtdmmx6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:09:15 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23SEwdBP027056;
 Thu, 28 Apr 2022 15:08:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3fm938yq4c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 15:08:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23SF8oLB36634982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 15:08:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 644F3A405B;
 Thu, 28 Apr 2022 15:08:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 867E3A4054;
 Thu, 28 Apr 2022 15:08:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.4.60])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 15:08:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH 2/2] tools/perf/tests: Fix session topology test to skip the
 test in guest environment
Date: Thu, 28 Apr 2022 20:38:29 +0530
Message-Id: <20220428150829.30733-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
References: <20220428150829.30733-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4aWvfZI__c20NJb3GBIGdvThUoGqXEBP
X-Proofpoint-ORIG-GUID: EmLo_u_2Egkwfjfd68BYwbF48M0fVV22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_02,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280091
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
 linuxppc-dev@lists.ozlabs.org
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

Skip the testcase in powerpc for pSeries. Use the utility
function "cpuinfo_field" to check platform from /proc/cpuinfo.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/topology.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
index ee1e3dcbc0bd..0ddcafa158db 100644
--- a/tools/perf/tests/topology.c
+++ b/tools/perf/tests/topology.c
@@ -109,6 +109,23 @@ static int check_cpu_topology(char *path, struct perf_cpu_map *map)
 			&& strncmp(session->header.env.arch, "aarch64", 7))
 		return TEST_SKIP;
 
+	/*
+	 * In powerpc pSeries platform, not all the topology information
+	 * are exposed via sysfs. Due to restriction, detail like
+	 * physical_package_id will be set to -1. Hence skip this
+	 * test for pSeries.
+	 */
+	if (strncmp(session->header.env.arch, "powerpc", 7)) {
+		char *cpuinfo_platform = NULL;
+
+		cpuinfo_platform = cpuinfo_field("platform");
+		if (!strcmp(cpuinfo_platform, "pSeries")) {
+			free(cpuinfo_platform);
+			return TEST_SKIP;
+		}
+		free(cpuinfo_platform);
+	}
+
 	TEST_ASSERT_VAL("Session header CPU map not set", session->header.env.cpu);
 
 	for (i = 0; i < session->header.env.nr_cpus_avail; i++) {
-- 
2.35.1

