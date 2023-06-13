Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F1672E9F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:35:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hBUmt6qj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgbLV4Kydz30P4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:35:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hBUmt6qj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgbKX5jZhz2xq1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:34:55 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkVW1007751;
	Tue, 13 Jun 2023 17:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8jSFQJB5naLQVyFMHRG/TH9owClp3TviKTEJY9vtYO4=;
 b=hBUmt6qjbHnXf2hxIwNEk230CvRtaw9AVhUMKFokWhtK33/QLUg8yFCGz9IoSCzmfT+P
 kZax7tG8dEBN6Fd/fTximlJg5WdmYO4z2i9gM5zoP7FfSFASlWemNQKxo+PeirJ2Zsxf
 /YNhKThhrF5D7Ehlbfm2SvAAf7hyg96FVlon5du9gxaFue/1hynACzsk+rNtaReGD5It
 RDj3i14io4htkaVz0kUqFEHRozVUevvdalnb+SDhK1A46hvLxnDfv+UKZmFfXLX1jd2J
 ODEO4YHlp1WZIRv00qeusyRHozAWosXaHjsxezAPqXTzjRcx8iWNHyv9ujiwStS8r79B 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uvn0q21-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:38 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DGlE6A011163;
	Tue, 13 Jun 2023 17:04:37 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uvn0q05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:37 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35DBcEBE017360;
	Tue, 13 Jun 2023 16:43:12 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3r4gt51qhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:43:11 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGh8ZW21562048
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:43:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73B3A20040;
	Tue, 13 Jun 2023 16:43:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4108020043;
	Tue, 13 Jun 2023 16:43:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:43:05 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 17/17] perf tests task_analyzer: skip tests if no libtraceevent support
Date: Tue, 13 Jun 2023 22:11:45 +0530
Message-Id: <20230613164145.50488-18-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WMD2LXxM8lxeC2Sio5rAovGcyKA4dCkb
X-Proofpoint-GUID: mCnNM_1bdKdCWUli-xtoZUGGlAYOnpJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130151
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Aditya Gupta <adityag@linux.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Aditya Gupta <adityag@linux.ibm.com>

Test "perf script task-analyzer tests" fails in environment with missing
libtraceevent support, as perf record fails to create the perf.data
file, which further tests depend on.

Instead, when perf is not compiled with libtraceevent support, skip those
tests instead of failing them, by checking the output of `perf
record --dry-run` to see if it prints the error "libtraceevent is
necessary for tracepoint support"

For the following output, perf compiled with: `make NO_LIBTRACEEVENT=1`

Before the patch:

108: perf script task-analyzer tests                                 :
test child forked, pid 24105
failed to open perf.data: No such file or directory  (try 'perf record' first)
FAIL: "invokation of perf script report task-analyzer command failed" Error message: ""
FAIL: "test_basic" Error message: "Failed to find required string:'Comm'."
failed to open perf.data: No such file or directory  (try 'perf record' first)
FAIL: "invokation of perf script report task-analyzer --ns --rename-comms-by-tids 0:random command failed" Error message: ""
FAIL: "test_ns_rename" Error message: "Failed to find required string:'Comm'."
failed to open perf.data: No such file or directory  (try 'perf record' first)
<...>
perf script task-analyzer tests: FAILED!

With this patch, the script instead returns 2 signifying SKIP, and after
the patch:

108: perf script task-analyzer tests                                 :
test child forked, pid 26010
libtraceevent is necessary for tracepoint support
WARN: Skipping tests. No libtraceevent support
test child finished with -2
perf script task-analyzer tests: Skip

Fixes: e8478b84d6ba ("perf test: add new task-analyzer tests")
Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---
 tools/perf/tests/shell/test_task_analyzer.sh | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
index b094eeb3bf66..59785dfc11f8 100755
--- a/tools/perf/tests/shell/test_task_analyzer.sh
+++ b/tools/perf/tests/shell/test_task_analyzer.sh
@@ -44,9 +44,20 @@ find_str_or_fail() {
 	fi
 }
 
+# check if perf is compiled with libtraceevent support
+skip_no_probe_record_support() {
+	perf record -e "sched:sched_switch" -a -- sleep 1 2>&1 | grep "libtraceevent is necessary for tracepoint support" && return 2
+	return 0
+}
+
 prepare_perf_data() {
 	# 1s should be sufficient to catch at least some switches
 	perf record -e sched:sched_switch -a -- sleep 1 > /dev/null 2>&1
+	# check if perf data file got created in above step.
+	if [ ! -e "perf.data" ]; then
+		printf "FAIL: perf record failed to create \"perf.data\" \n"
+		return 1
+	fi
 }
 
 # check standard inkvokation with no arguments
@@ -134,6 +145,13 @@ test_csvsummary_extended() {
 	find_str_or_fail "Out-Out;" csvsummary "${FUNCNAME[0]}"
 }
 
+skip_no_probe_record_support
+err=$?
+if [ $err -ne 0 ]; then
+	echo "WARN: Skipping tests. No libtraceevent support"
+	cleanup
+	exit $err
+fi
 prepare_perf_data
 test_basic
 test_ns_rename
-- 
2.39.1

