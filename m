Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F78645F81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 17:59:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NS3RS1FX8z3bfs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 03:59:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgETVlaZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UgETVlaZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NS3QV2rM6z3bbx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 03:58:41 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7GHwOU026645;
	Wed, 7 Dec 2022 16:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=r+3Om0QSsbre8QtYGLrj5cnrhs7nG4bTZt4PL+e9rtI=;
 b=UgETVlaZx4T9tmcOVmvTlrHpGVXfUeVqawBk2yUPTGFrS28fDB4HOIuW/QkbmSnmXZjQ
 LBdptUBLkpRcybvKwxdhDHm7jRY4EsNuyr/RqJz6NovXbZXcmrCih6vTGIkK+XHsW1yj
 RM3QAe7gZc3CbGgEbn3ahGOYuQ5+gWxtVFnwsw7ExOWvzoOaTyVzRqXxfNvSs58B3xUl
 ZdN5sPG1X/HMcqBRhpamGTbqhiIk90jaxW+arAst3wENaUPeHD597APOI28iikaNhVRF
 LviF2Jpala1U2e8GacSw5fwdk4CbzBRUmdl//sfy04a3xoLfgybrnTfEpWXBvctFmEOp YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3max7w13jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 16:58:28 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2B7GIe6e028005;
	Wed, 7 Dec 2022 16:58:27 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3max7w13hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 16:58:27 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2B7C42i9010326;
	Wed, 7 Dec 2022 16:58:25 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3m9ks4386b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Dec 2022 16:58:25 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B7GwLoC38863104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Dec 2022 16:58:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B66620040;
	Wed,  7 Dec 2022 16:58:21 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8964220043;
	Wed,  7 Dec 2022 16:58:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.55.175])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Dec 2022 16:58:18 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, ravi.bangoria@amd.com
Subject: [PATCH] perf test: Update event group check for support of uncore event
Date: Wed,  7 Dec 2022 22:28:15 +0530
Message-Id: <20221207165815.774-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Le_AnK1W45-7YbUdsTbD659nmT3rwyJn
X-Proofpoint-ORIG-GUID: -6Hl6Qjz4-UhH_iD7v_fdfemSh8yOEJj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212070143
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Event group test checks group creation for combinations of
hw, sw and uncore PMU events. Some of the uncore pmus may
require additional permission to access the counters.
For example, in case of hv_24x7, partition need to have
permissions to access hv_24x7 pmu counters. If not, event_open
will fail. Hence add a sanity check to see if event_open
succeeds before proceeding with the test.

Fixes: b20d9215a35f ("perf test: Add event group test for events in multiple PMUs")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Note: The patch is based on tmp.perf/core branch
    of git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git

 tools/perf/tests/event_groups.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/event_groups.c b/tools/perf/tests/event_groups.c
index 612c0444aaa8..029442b4e9c6 100644
--- a/tools/perf/tests/event_groups.c
+++ b/tools/perf/tests/event_groups.c
@@ -51,7 +51,7 @@ static int event_open(int type, unsigned long config, int group_fd)
 static int setup_uncore_event(void)
 {
 	struct perf_pmu *pmu;
-	int i;
+	int i, fd;
 
 	if (list_empty(&pmus))
 		perf_pmu__scan(NULL);
@@ -62,6 +62,18 @@ static int setup_uncore_event(void)
 				pr_debug("Using %s for uncore pmu event\n", pmu->name);
 				types[2] = pmu->type;
 				configs[2] = uncore_pmus[i].config;
+				/*
+				 * Check if the chosen uncore pmu event can be
+				 * used in the test. For example, incase of accessing
+				 * hv_24x7 pmu counters, partition should have
+				 * additional permissions. If not, event open will
+				 * fail. So check if the event open succeeds
+				 * before proceeding.
+				 */
+				fd = event_open(types[2], configs[2], -1);
+				if (fd < 0)
+					return -1;
+				close(fd);
 				return 0;
 			}
 		}
-- 
2.31.1

