Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496F72E918
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 19:12:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+I7tr8t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgZqs0z6vz3bvB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 03:12:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+I7tr8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgZl22v2Jz30Nq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 03:08:30 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkHEQ005364;
	Tue, 13 Jun 2023 17:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+1A1zqfHEUbYWB9uBTPci1+yQHUq42Huy66HuxFasQ0=;
 b=G+I7tr8thUdOz9PzzePtLAUSSWgHHR5bAipkAO+EPGY3YG2lThDzgeROYZY5Dkvakq2+
 q5FIqeZSfvX8GlMhJc1/g76FK4kWGEsGvdDmDdlyfVC5GsFFJhDE+B1tkwJhgWXfEoyB
 z6LvzkOLwLLQqi8kk87DAjQYmuLNxuOsRf+0RqZvrSXiei2YqhdwFRYx2OP8RlIduGAv
 dBFa43XIZZdbzYL/X+oMOLYnqkPR9wFtzpsouT7LCyh3wEqMMhu0Tra7tcubZ5pv1QD1
 geqIiyLHQqguooegMiYxwD1BGMVn2l7NrjjE6hCUlBNFBsR/FdMmBZ2qevlP880wCv1c Zw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs1g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:22 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DH8LBI004165;
	Tue, 13 Jun 2023 17:08:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v0hs0yx-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:08:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D9HtPs009704;
	Tue, 13 Jun 2023 16:43:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee2a8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:43:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGh4QS57934194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:43:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D27432004B;
	Tue, 13 Jun 2023 16:43:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C70B820040;
	Tue, 13 Jun 2023 16:43:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:43:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 16/17] perf tests task_analyzer: print command on failure
Date: Tue, 13 Jun 2023 22:11:44 +0530
Message-Id: <20230613164145.50488-17-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UFZJGs7T_y080kAQGblyBSHAWVfOkisy
X-Proofpoint-ORIG-GUID: QRzyQ15-wQU0Ob75Dqcq_EhZqsZNppCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130151
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

Instead of printing "perf command failed" everytime, print the exact
command that run earlier

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Aditya Gupta <adityag@linux.ibm.com>
---
 tools/perf/tests/shell/test_task_analyzer.sh | 24 ++++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
index 84ab7e7f57d5..b094eeb3bf66 100755
--- a/tools/perf/tests/shell/test_task_analyzer.sh
+++ b/tools/perf/tests/shell/test_task_analyzer.sh
@@ -53,14 +53,14 @@ prepare_perf_data() {
 test_basic() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer"
 	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
 }
 
 test_ns_rename(){
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --ns --rename-comms-by-tids 0:random > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --ns --rename-comms-by-tids 0:random"
 	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
 }
 
@@ -68,7 +68,7 @@ test_ms_filtertasks_highlight(){
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --ms --filter-tasks perf --highlight-tasks perf \
 	> "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --ms --filter-tasks perf --highlight-tasks perf"
 	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
 }
 
@@ -76,61 +76,61 @@ test_extended_times_timelimit_limittasks() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --extended-times --time-limit :99999 \
 	--limit-to-tasks perf > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --extended-times --time-limit :99999 --limit-to-tasks perf"
 	find_str_or_fail "Out-Out" "$out" "${FUNCNAME[0]}"
 }
 
 test_summary() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --summary > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --summary"
 	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
 }
 
 test_summaryextended() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --summary-extended > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --summary-extended"
 	find_str_or_fail "Inter Task Times" "$out" "${FUNCNAME[0]}"
 }
 
 test_summaryonly() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --summary-only > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --summary-only"
 	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
 }
 
 test_extended_times_summary_ns() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --extended-times --summary --ns > "$out"
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --extended-times --summary --ns"
 	find_str_or_fail "Out-Out" "$out" "${FUNCNAME[0]}"
 	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
 }
 
 test_csv() {
 	perf script report task-analyzer --csv csv > /dev/null
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --csv csv"
 	find_str_or_fail "Comm;" csv "${FUNCNAME[0]}"
 }
 
 test_csv_extended_times() {
 	perf script report task-analyzer --csv csv --extended-times > /dev/null
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --csv csv --extended-times"
 	find_str_or_fail "Out-Out;" csv "${FUNCNAME[0]}"
 }
 
 test_csvsummary() {
 	perf script report task-analyzer --csv-summary csvsummary > /dev/null
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --csv-summary csvsummary"
 	find_str_or_fail "Comm;" csvsummary "${FUNCNAME[0]}"
 }
 
 test_csvsummary_extended() {
 	perf script report task-analyzer --csv-summary csvsummary --summary-extended \
 	>/dev/null
-	check_exec_0 "perf"
+	check_exec_0 "perf script report task-analyzer --csv-summary csvsummary --summary-extended"
 	find_str_or_fail "Out-Out;" csvsummary "${FUNCNAME[0]}"
 }
 
-- 
2.39.1

