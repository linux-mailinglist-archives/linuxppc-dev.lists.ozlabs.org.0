Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D25771929
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 06:51:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MgI28yRZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK3nG30TKz3c8L
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 14:51:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MgI28yRZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK3mG6wN6z307h
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 14:50:38 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3774kamZ014882;
	Mon, 7 Aug 2023 04:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UuP9aRu3tk0m27KOOQtMge3pXIYOa+dtLNim1ZUwBbI=;
 b=MgI28yRZ5muRtoKTbL5FlOndkftdxm4vFkF1MAFqWZYcMA7ra7Yuno2CPDZWi3mgFh3W
 Uv7vKXLgLIfhd7On/ZUGttXI881/HZkUS3FSEnCctoQfh3WHkDKQgYDr73H89ez2Fjv8
 zaYdLHk8pBGOZ0NXtI1LdCQX8oZVoal3+lR7LimHc3Bo2F297WxnqGUmtIRSPAjcrmtn
 q0KEy7ssifXJ58TIQ2vpzABANhARd+yeeqtUCrmSgGJOv7Q+63ojU+vqGgrYRGy/t4ts
 /Otvd7F886F6L7drI9rm5KOa8jmsdgaQ/fJaNE9CEK62t5d3ZAmEUGEBLzQIJ3ScmSyu NA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sasvpg1q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:50:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3774nCie022637;
	Mon, 7 Aug 2023 04:50:25 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sasvpg1px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:50:25 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3772pnla001772;
	Mon, 7 Aug 2023 04:50:24 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3sa3f19fr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Aug 2023 04:50:24 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3774oL0J59113976
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Aug 2023 04:50:22 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE53520049;
	Mon,  7 Aug 2023 04:50:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B79DE20040;
	Mon,  7 Aug 2023 04:50:19 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.77.230])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Aug 2023 04:50:19 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH] perf test: Fix parse-events tests to skip parametrized events
Date: Mon,  7 Aug 2023 10:20:16 +0530
Message-Id: <20230807045016.23409-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nqJqp9SZ-wM8A7F14GJz3JA2RleI6y3h
X-Proofpoint-ORIG-GUID: -9627zt--WdbRFYGacMndZuV9rBcyUEN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-07_02,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308070041
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
 tools/perf/tests/parse-events.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index b2f82847e4c3..605373c7d005 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -2504,7 +2504,11 @@ static int test__pmu_events(struct test_suite *test __maybe_unused, int subtest
 	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
 		struct stat st;
 		char path[PATH_MAX];
+		char pmu_event[PATH_MAX + 256];
+		char *buf = NULL;
+		FILE *file;
 		struct dirent *ent;
+		size_t len = 0;
 		DIR *dir;
 		int err;
 
@@ -2528,11 +2532,39 @@ static int test__pmu_events(struct test_suite *test __maybe_unused, int subtest
 			struct evlist_test e = { .name = NULL, };
 			char name[2 * NAME_MAX + 1 + 12 + 3];
 			int test_ret;
+			int skip = 0;
 
 			/* Names containing . are special and cannot be used directly */
 			if (strchr(ent->d_name, '.'))
 				continue;
 
+			/* exclude parametrized ones (name contains '?') */
+			snprintf(pmu_event, PATH_MAX + 256, "%s%s", path, ent->d_name);
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
+				skip = 1;
+
+			free(buf);
+			buf = NULL;
+			fclose(file);
+
+			if (skip == 1) {
+				pr_debug("skipping parametrized PMU event: %s which contains ?\n", pmu_event);
+				continue;
+			}
+
 			snprintf(name, sizeof(name), "%s/event=%s/u", pmu->name, ent->d_name);
 
 			e.name  = name;
-- 
2.31.1

