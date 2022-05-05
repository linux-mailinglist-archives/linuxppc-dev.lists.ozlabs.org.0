Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24051BC5A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 11:42:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv7yt60pnz3cH9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 19:42:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z2s8NzWC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Z2s8NzWC; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv7wj4myWz3bs4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 19:40:37 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2457jTxs031007;
 Thu, 5 May 2022 09:40:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BCEFBshtjfRBdcHBltoVd2W8qtTwpP2gTUulwHU5C+A=;
 b=Z2s8NzWCucQDoXqAGE11g/TosispnanEx1lUdhFjpmm27O7ImuvicTO7v3t/HD32/ivN
 huMMJa2D1lDzzZs99sWVMDtaS7jBmH7FG9C3JYaFSSJ6030o4xRnrJynKp6mfsoY0N7z
 hkpOmwEGdYRsjtUM8XbL80X/jI+qUoRxJ5vSWNDBDuPITWnEkwAPR60MgmtL7UqfXXsX
 SuNsnY+NYegeJ44WfBEGQtitOpWbRJS2I9TLjnAACZX08SIpBKL+a5a2PzgR3plJpZDR
 XG0dH9FL4Q9MzVirG+dtKi29ns+iA2azUNi7OJJjm/sMIagTvCpZl+9GXqykPe6SlLnF tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvafnhvkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:29 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2459ZWOt009249;
 Thu, 5 May 2022 09:40:28 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvafnhvkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:28 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2459Xag9008933;
 Thu, 5 May 2022 09:40:26 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 3fuyn78p8h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 May 2022 09:40:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2459eNAq54591942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 May 2022 09:40:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D750A404D;
 Thu,  5 May 2022 09:40:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F1AECA4040;
 Thu,  5 May 2022 09:40:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.80.15])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 May 2022 09:40:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, disgoel@linux.vnet.ibm.com
Subject: [PATCH V2 2/2] tools/perf/tests: Fix session topology test to skip
 the test in guest environment
Date: Thu,  5 May 2022 15:10:00 +0530
Message-Id: <20220505094000.58220-3-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
References: <20220505094000.58220-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KIF772insSkP7gzEtQprOFZ5lQOIRECa
X-Proofpoint-ORIG-GUID: jZTslHMPKe65Smu4Sl0JbVjPLbitsyy3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_03,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205050063
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

Results:

 After the patch:
 ----------------
 # ./perf test 41
 41: Session topology                  : Skip

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/topology.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/perf/tests/topology.c b/tools/perf/tests/topology.c
index ee1e3dcbc0bd..036143928023 100644
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
+		if (cpuinfo_platform && !strcmp(cpuinfo_platform, "pSeries")) {
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

