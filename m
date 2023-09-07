Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD97797905
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 19:00:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lh31hp8e;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhQVD1xb2z3c28
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 03:00:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lh31hp8e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhQTK1Nlgz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 02:59:48 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 387GbNGR002971;
	Thu, 7 Sep 2023 16:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HSHZzMtzR0jk/8qlnDbb8fyLNSuFY5081mfhU9vxNhk=;
 b=Lh31hp8eOdgZvH4dZlX8zcUF923MAlhxVgDzj3+0GhR/AGiamuZvtm6bv58aKnxU2OGo
 /wH8LN+WEluNlLsggOtI1BervV2FCbrzNgeRr7Uj8qeXeSC89TpckGJXWWeVqawAJQ52
 JwCz1+g9l5bmyVyc9ffeowQVZTxJmHsPMguqzAAyecq7tbZ86JAhrrWOUxSe5/G2QtHy
 M5yQP8SMDttQZ+4brcd291Uq0CqSVx5xWXmrJaAaQLGYaajZ4qn4U1TW2PBlhji13anU
 90S9++jeQFHqyLhjlLV5nWkMExZMFB+RhF82zBJhU1MsuT02WK3Q0LrmI6SW0VvM94Ub lg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfuuw7e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:59:43 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 387GbX2r003777;
	Thu, 7 Sep 2023 16:59:43 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3syfuuw7dq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:59:43 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 387FRVRk011138;
	Thu, 7 Sep 2023 16:59:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svj324src-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 16:59:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 387GxdjL20775574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 7 Sep 2023 16:59:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2339920043;
	Thu,  7 Sep 2023 16:59:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA83220040;
	Thu,  7 Sep 2023 16:59:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.9.102])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  7 Sep 2023 16:59:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2] perf test: Fix parse-events tests to skip parametrized events
Date: Thu,  7 Sep 2023 22:29:33 +0530
Message-Id: <20230907165933.36442-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DY2NQBLqdBV1hwcOUDWK-Jl4Na5IBdYe
X-Proofpoint-ORIG-GUID: WZIg936gPg4oXyr6vSnFUcC91vhDM3KT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309070147
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Testcase "Parsing of all PMU events from sysfs" parse events for
all PMUs, and not just cpu. In case of powerpc, the PowerVM
environment supports events from hv_24x7 and hv_gpci PMU which
is of example format like below:

- hv_24x7/CPM_ADJUNCT_INST,domain=?,core=?/
- hv_gpci/event,partition_id=?/

The value for "?" needs to be filled in depending on system
configuration. It is better to skip these parametrized events
in this test as it is done in:
'commit b50d691e50e6 ("perf test: Fix "all PMU test" to skip
parametrized events")' which handled a simialr instance with
"all PMU test".

Fix parse-events test to skip parametrized events since
it needs proper setup of the parameters.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v1 -> v2:
 Addressed review comments from Ian. Updated size of
 pmu event name variable and changed bool name which is
 used to skip the test.

 tools/perf/tests/parse-events.c | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index 658fb9599d95..1ecaeceb69f8 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -2514,9 +2514,14 @@ static int test__pmu_events(struct test_suite *test __maybe_unused, int subtest
 	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
 		struct stat st;
 		char path[PATH_MAX];
+		char pmu_event[PATH_MAX];
+		char *buf = NULL;
+		FILE *file;
 		struct dirent *ent;
+		size_t len = 0;
 		DIR *dir;
 		int err;
+		int n;
 
 		snprintf(path, PATH_MAX, "%s/bus/event_source/devices/%s/events/",
 			sysfs__mountpoint(), pmu->name);
@@ -2538,11 +2543,44 @@ static int test__pmu_events(struct test_suite *test __maybe_unused, int subtest
 			struct evlist_test e = { .name = NULL, };
 			char name[2 * NAME_MAX + 1 + 12 + 3];
 			int test_ret;
+			bool is_event_parameterized = 0;
 
 			/* Names containing . are special and cannot be used directly */
 			if (strchr(ent->d_name, '.'))
 				continue;
 
+			/* exclude parametrized ones (name contains '?') */
+			n = snprintf(pmu_event, sizeof(pmu_event), "%s%s", path, ent->d_name);
+			if (n >= PATH_MAX) {
+				pr_err("pmu event name crossed PATH_MAX(%d) size\n", PATH_MAX);
+				continue;
+			}
+
+			file = fopen(pmu_event, "r");
+			if (!file) {
+				pr_debug("can't open pmu event file for '%s'\n", ent->d_name);
+				ret = combine_test_results(ret, TEST_FAIL);
+				continue;
+			}
+
+			if (getline(&buf, &len, file) < 0) {
+				pr_debug(" pmu event: %s is a null event\n", ent->d_name);
+				ret = combine_test_results(ret, TEST_FAIL);
+				continue;
+			}
+
+			if (strchr(buf, '?'))
+				is_event_parameterized = 1;
+
+			free(buf);
+			buf = NULL;
+			fclose(file);
+
+			if (is_event_parameterized == 1) {
+				pr_debug("skipping parametrized PMU event: %s which contains ?\n", pmu_event);
+				continue;
+			}
+
 			snprintf(name, sizeof(name), "%s/event=%s/u", pmu->name, ent->d_name);
 
 			e.name  = name;
-- 
2.31.1

