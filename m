Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0697269791A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 10:39:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGtMq6Y2Tz3cf2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 20:39:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R16/uOSX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R16/uOSX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGtLr0T54z3c9C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 20:38:59 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F93MJN035307;
	Wed, 15 Feb 2023 09:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=HaaNFUYd7/y/gH0aZ5dqcVhecNeq1B8ns+OY0zegHJE=;
 b=R16/uOSXeY3xxE+0fWV8qKeCoo8v+flTqteaaou8Kc5cENe+eGw1ABO1V7Vw+CDef91e
 vJ/0WBVGI2gZ8EyCEW1SDalfxrnNaJEiwOa9lPI/kNSppFGqJgvkGSklk2uAsWGDv4En
 HyBMP4T89HVZXc03sc5y8dG+QdRtbhqb+o16PKCkdmut0Q+7tpvFl6UB88hv1iFd8UvM
 bTwJhyvzxUt7qzMcQGAFbe4irbZpxS1cHnCpBCYfMyhb48mPXn3Dkk1Ho5U1GPrFZhdq
 3XULfRMeRrzQpayz19uL3wITQVv4k0DbtYgEF238T4F+G84Zd4pDr7elopEHCr504Dl2 Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrve4h8wu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 09:38:50 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31F94wSO040934;
	Wed, 15 Feb 2023 09:38:50 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrve4h8w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 09:38:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31EIYT1E010698;
	Wed, 15 Feb 2023 09:38:48 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6w697-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 09:38:48 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F9cjl250266396
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 09:38:45 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D1D520043;
	Wed, 15 Feb 2023 09:38:45 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77E0020040;
	Wed, 15 Feb 2023 09:38:42 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.3.48])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 09:38:42 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: acme@kernel.org
Subject: [PATCH v2] tools/perf/tests: Change true workload to sleep workload in all metric test for system wide check
Date: Wed, 15 Feb 2023 15:08:27 +0530
Message-Id: <20230215093827.124921-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ynkS7O4K1Ei1qXB-iK5cudy8PgYbXvkC
X-Proofpoint-GUID: ihf7kGT1qK2GVUHfS9ImQoPwZtG42Ci7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-15_05,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150087
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
Cc: irogers@google.com, maddy@linux.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, atrajeev@linux.vnet.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Testcase stat_all_metrics.sh fails in powerpc:

98: perf all metrics test : FAILED!

Logs with verbose:

[command]# ./perf test 98 -vv
 98: perf all metrics test                                           :
 --- start ---
test child forked, pid 13262
Testing BRU_STALL_CPI
Testing COMPLETION_STALL_CPI
 ----
Testing TOTAL_LOCAL_NODE_PUMPS_P23
Metric 'TOTAL_LOCAL_NODE_PUMPS_P23' not printed in:
Error:
Invalid event (hv_24x7/PM_PB_LNS_PUMP23,chip=3/) in per-thread mode, enable system wide with '-a'.
Testing TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01
Metric 'TOTAL_LOCAL_NODE_PUMPS_RETRIES_P01' not printed in:
Error:
Invalid event (hv_24x7/PM_PB_RTY_LNS_PUMP01,chip=3/) in per-thread mode, enable system wide with '-a'.
 ----

Based on above logs, we could see some of the hv-24x7 metric events fails,
and logs suggest to run the metric event with -a option.
This change happened after the commit a4b8cfcabb1d ("perf stat: Delay metric
parsing"), which delayed the metric parsing phase and now before metric parsing
phase perf tool identifies, whether target is system-wide or not. With this
change, perf_event_open will fails with workload monitoring for uncore events
as expected.

The perf all metric test case fails as some of the hv-24x7 metric events
may need bigger workload with system wide monitoring to get the data.
Fix this issue by changing current system wide check from true workload to
sleep 0.01 workload.

Result with the patch changes in powerpc:

98: perf all metrics test : Ok

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Tested-by: Disha Goel <disgoel@linux.ibm.com>
Suggested-by: Ian Rogers <irogers@google.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
Changelog:

v1->v2:
- Addressed review comments from Ian, by changing true workload
  to sleep workload in "perf all metric test". Rather then adding
  new system wide check with perf bench workload.
- Added Reviewed-by, Tested-by and Suggested-by tags.

 tools/perf/tests/shell/stat_all_metrics.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/stat_all_metrics.sh b/tools/perf/tests/shell/stat_all_metrics.sh
index 6e79349e42be..22e9cb294b40 100755
--- a/tools/perf/tests/shell/stat_all_metrics.sh
+++ b/tools/perf/tests/shell/stat_all_metrics.sh
@@ -11,7 +11,7 @@ for m in $(perf list --raw-dump metrics); do
     continue
   fi
   # Failed so try system wide.
-  result=$(perf stat -M "$m" -a true 2>&1)
+  result=$(perf stat -M "$m" -a sleep 0.01 2>&1)
   if [[ "$result" =~ "${m:0:50}" ]]
   then
     continue
-- 
2.39.1

