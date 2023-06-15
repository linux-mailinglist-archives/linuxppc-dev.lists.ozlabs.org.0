Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC257310FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 09:40:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fA7zIy7K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhZ2J4XKXz3bnw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:40:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fA7zIy7K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhZ0K2XcNz3039
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 17:38:25 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35F7aYbq002445;
	Thu, 15 Jun 2023 07:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=e+vXTENNj83eLaphzsrDFschLK/8vnU5fpDaxfL+HGU=;
 b=fA7zIy7KWLwdzP9UgkkQU8C+a5SIDA9OvzI8G64XLQlj+l3WBoQxUhZBAT1ccoV8ja4F
 97oEDszpbFSGoN6G4jspKvvawCjuOf7BGDUYtbrTKkv3hHA5wAb28C5HWTXBmRQGlDff
 JKrGY6pDW889myhN8pn5hntIo9seuuYGjjFzxZXWOG4HUlc8p9asnt81XTr+y6Jr8z1M
 99pONq/IvrcJeBfMWvcPWeo4Jw+Ix51ld0KvyIv3DZljoJS/QbRz7NwksOVAp58zLcZ3
 0hUYCEw7gSb8ng5dMeQMc9iQEC9YlGNmSR0G7HtbYhfTeqNNIWC83zv5nVMrH7ES5ttY oA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7x6wg7aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 07:38:20 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35F7atMY006042;
	Thu, 15 Jun 2023 07:38:20 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r7x6wg79m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 07:38:20 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F4aZsu002937;
	Thu, 15 Jun 2023 07:38:17 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r4gedthxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 07:38:17 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35F7cD3i22217240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 07:38:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C57E120040;
	Thu, 15 Jun 2023 07:38:13 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C990B20043;
	Thu, 15 Jun 2023 07:38:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.120.107])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 07:38:11 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH 2/2] tools/perf/tests: perf all metricgroups test fails when perf_event access is restricted
Date: Thu, 15 Jun 2023 13:08:03 +0530
Message-Id: <20230615073803.54481-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
References: <20230615073803.54481-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pnVG3ScaMjWQjKKyIu_HrJcGrUU93bkq
X-Proofpoint-ORIG-GUID: Gk3OkRG4hUMtA8aYXZ-4ZSJPiKme53Mg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-15_04,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306150063
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
    —
    access to performance monitoring and observability operations for processes
    without CAP_PERFMON, CAP_SYS_PTRACE or CAP_SYS_ADMIN Linux capability.
    —
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
 tools/perf/tests/shell/stat_all_metricgroups.sh | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/stat_all_metricgroups.sh b/tools/perf/tests/shell/stat_all_metricgroups.sh
index cb35e488809a..fa86b562676a 100755
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
+  if [[ "$result" =~ "Access to performance monitoring and observability operations is limited" ]]
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

