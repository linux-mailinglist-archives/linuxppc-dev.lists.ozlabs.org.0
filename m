Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF99E76F93F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 07:02:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bS9b9+fR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHD9n5smqz3cVP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:02:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bS9b9+fR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHD7p1K8Nz2yVf
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 15:01:09 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3744jQw3027127;
	Fri, 4 Aug 2023 05:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1pJRRbC0l4Yn2SJnIQkLf4d4xQmG5UoKmyPA/lII3do=;
 b=bS9b9+fRqniBnBPglTYTSHqvUIdyAisVBg0BO+RKlloMNyHQG9n6/bSPkZA70Pc2kcCm
 itwzjfa698sZn1/69+f42/H9lvb3XC0Df7KUd89r6mRMPY+t1jH3fafpuUi3gmagjomU
 Vu6CszgUfqSxXug4P+bTXhPM9lJ8jRDoE9SQgxy5/V+uoIPal/kxzCi38AogXVfFYw29
 e9bHWyb8b1bpBDWod+75Q89ciXh8ceZq/QigAZGISEdhpgsqPY9wt8Mg9BhuJFkqgDbk
 ti2TWMLFXMJcsBDIYIs01GcK7OAxSpWmqQfG/wsloq6cCgYSWZZJRgcAqkrg6b1K3FYK ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8tk3r9fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:01:03 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3744mWhP002496;
	Fri, 4 Aug 2023 05:01:03 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s8tk3r9fm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:01:03 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3744hOrc021566;
	Fri, 4 Aug 2023 05:01:02 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s8kmcas10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 05:01:02 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37450x2p38142564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Aug 2023 05:00:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5ABC02004F;
	Fri,  4 Aug 2023 05:00:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E50D20040;
	Fri,  4 Aug 2023 05:00:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.75.173])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  4 Aug 2023 05:00:56 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 2/2] tools/perf/tests: perf all metricgroups test fails when perf_event access is restricted
Date: Fri,  4 Aug 2023 10:30:47 +0530
Message-Id: <20230804050047.94240-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230804050047.94240-1-atrajeev@linux.vnet.ibm.com>
References: <20230804050047.94240-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MVZc13Ldovncw75cxB8ubx-WHugrHGlJ
X-Proofpoint-ORIG-GUID: rARAjlyShdjU28zs2OkP2XpR8bvSxQv4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_01,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 malwarescore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 phishscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308040040
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

Perf all metricgroups test fails as below when perf_event access
is restricted.

    ./perf test -v "perf all metricgroups test"
    Testing Memory_BW
    Error:
    Access to performance monitoring and observability operations is limited.
    Enforced MAC policy settings (SELinux) can limit access to performance
    access to performance monitoring and observability operations for processes
    without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capability.

    test child finished with -1
    ---- end ----
    perf all metricgroups test: FAILED!

Fix the testcase to skip those metric events which needs perf_event access
explicitly. The exit code of the testcase is based on return code of
the perf stat command ( enabled by set -e option ). Hence save the
exit status in a variable and use that to decide success or fail for the
testcase.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
v1 -> v2:
 Changed the condition to use "echo" and "grep" so it works on
 Posix shell as well.

 tools/perf/tests/shell/stat_all_metricgroups.sh | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/stat_all_metricgroups.sh b/tools/perf/tests/shell/stat_all_metricgroups.sh
index cb35e488809a..eaa5e1172294 100755
--- a/tools/perf/tests/shell/stat_all_metricgroups.sh
+++ b/tools/perf/tests/shell/stat_all_metricgroups.sh
@@ -2,11 +2,19 @@
 # perf all metricgroups test
 # SPDX-License-Identifier: GPL-2.0
 
-set -e
-
 for m in $(perf list --raw-dump metricgroups); do
   echo "Testing $m"
-  perf stat -M "$m" -a true
+  result=$(perf stat -M "$m" -a true 2>&1)
+  rc=$?
+  # Skip if there is no access to perf_events monitoring
+  # Otherwise exit based on the return code of perf comamnd.
+  if echo "$result" | grep -q "Access to performance monitoring and observability operations is limited";
+  then
+      continue
+  else
+      [ $rc -ne 0 ] && exit $rc
+  fi
+
 done
 
 exit 0
-- 
2.31.1

