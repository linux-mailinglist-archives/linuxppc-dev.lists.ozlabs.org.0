Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD48572EAEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 20:28:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X3R07dkM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgcVw5Wrdz30fY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:28:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X3R07dkM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgcV3340Vz30Nq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 04:27:22 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGxWW5009865;
	Tue, 13 Jun 2023 17:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xXqazhbUhrY4R1kuhMOqzVzZJOLanweyTr6rW+QihGU=;
 b=X3R07dkMtCHwk6Uzj1eiEUiV+smBJwIXjFEcvfvKzjRCLRk0L38DP9GofqC1LY2BCkaW
 E1zJDlc4Pu3C75bDt6Lj4kTGiiXNdIrR+Lh0zSoNin7/WZ/i7ULnkAcmsSkL+ikA2gbp
 HNPT4OhR78Adbs+I1uksET9tJr9LAxRWiSKQy38eg9dwlQXl4mhcIyaOkiIIssNZ4WMM
 C82LvX6nFhDJbzMGatP8Wa3m/u8+VKvn3x3tFoKbIfr7BMNKw17bAV5ECUGZ+Vaknsuo
 nGbGSx8987KTX7FfkgzQ7cZKjjdR8KVdRR7ToPKUXe6gO9B2AsyHlsmKY6pTgtWdyR6j ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6vf884fw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:05:08 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DH06Ff010902;
	Tue, 13 Jun 2023 17:05:08 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6vf88413-23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:05:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D3VE0r011851;
	Tue, 13 Jun 2023 16:42:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3r4gt52abc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:43 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGgd3C42730054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C485E20043;
	Tue, 13 Jun 2023 16:42:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B43DD20040;
	Tue, 13 Jun 2023 16:42:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 09/17] tools/perf/tests: Fix shellcheck issues in test_task_analyzer.sh file
Date: Tue, 13 Jun 2023 22:11:37 +0530
Message-Id: <20230613164145.50488-10-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: WO2aE8RNlzL32jjq65LkYNgrHOFwdWCc
X-Proofpoint-ORIG-GUID: jo5yF4Hs415RIzitCOOCnjns3XwVmqe7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=980
 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>

Fixed the following shellcheck issues in test_task_analyzer.sh file:

SC2086: Double quote to prevent globbing and word splitting
warnings in shell-check.
Fixes the following shellcheck issues,

SC2086: Double quote to prevent globbing and word splitting
warnings in shell-check.

Before Patch:

$ shellcheck ./test_task_analyzer.sh  | grep "SC2086" | ...
In ./test_task_analyzer.sh line 13:
SC2086: Double quote to prevent globbing and word splitting.
In ./test_task_analyzer.sh line 24:
SC2086: Double quote to prevent globbing and word splitting.
In ./test_task_analyzer.sh line 39:
SC2086: Double quote to prevent globbing and word splitting.

After Patch:
$ shellcheck ./test_task_analyzer.sh  | grep -i "SC2086"
None

perf test result after patch:

PASS: "test_basic"
PASS: "test_ns_rename"
PASS: "test_ms_filtertasks_highlight"
PASS: "test_extended_times_timelimit_limittasks"
PASS: "test_summary"
PASS: "test_summaryextended"
PASS: "test_summaryonly"
PASS: "test_extended_times_summary_ns"
PASS: "test_extended_times_summary_ns"
PASS: "test_csv"
PASS: "test_csvsummary"
PASS: "test_csv_extended_times"
PASS: "test_csvsummary_extended"

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/test_task_analyzer.sh | 54 ++++++++++----------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/tools/perf/tests/shell/test_task_analyzer.sh b/tools/perf/tests/shell/test_task_analyzer.sh
index a98e4ab66040..4264b54b654b 100755
--- a/tools/perf/tests/shell/test_task_analyzer.sh
+++ b/tools/perf/tests/shell/test_task_analyzer.sh
@@ -10,7 +10,7 @@ cleanup() {
   rm -f perf.data.old
   rm -f csv
   rm -f csvsummary
-  rm -rf $tmpdir
+  rm -rf "$tmpdir"
   trap - exit term int
 }
 
@@ -21,7 +21,7 @@ trap_cleanup() {
 trap trap_cleanup exit term int
 
 report() {
-	if [ $1 = 0 ]; then
+	if [ "$1" = 0 ]; then
 		echo "PASS: \"$2\""
 	else
 		echo "FAIL: \"$2\" Error message: \"$3\""
@@ -36,11 +36,11 @@ check_exec_0() {
 }
 
 find_str_or_fail() {
-	grep -q "$1" $2
-	if [ $? != 0 ]; then
-		report 1 $3 "Failed to find required string:'${1}'."
+	grep -q "$1" "$2"
+	if [ "$?" != 0 ]; then
+		report 1 "$3" "Failed to find required string:'${1}'."
 	else
-		report 0 $3
+		report 0 "$3"
 	fi
 }
 
@@ -52,86 +52,86 @@ prepare_perf_data() {
 # check standard inkvokation with no arguments
 test_basic() {
 	out="$tmpdir/perf.out"
-	perf script report task-analyzer > $out
+	perf script report task-analyzer > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Comm" $out ${FUNCNAME[0]}
+	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
 }
 
 test_ns_rename(){
 	out="$tmpdir/perf.out"
-	perf script report task-analyzer --ns --rename-comms-by-tids 0:random > $out
+	perf script report task-analyzer --ns --rename-comms-by-tids 0:random > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Comm" $out ${FUNCNAME[0]}
+	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
 }
 
 test_ms_filtertasks_highlight(){
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --ms --filter-tasks perf --highlight-tasks perf \
-	> $out
+	> "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Comm" $out ${FUNCNAME[0]}
+	find_str_or_fail "Comm" "$out" "${FUNCNAME[0]}"
 }
 
 test_extended_times_timelimit_limittasks() {
 	out="$tmpdir/perf.out"
 	perf script report task-analyzer --extended-times --time-limit :99999 \
-	--limit-to-tasks perf > $out
+	--limit-to-tasks perf > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Out-Out" $out ${FUNCNAME[0]}
+	find_str_or_fail "Out-Out" "$out" "${FUNCNAME[0]}"
 }
 
 test_summary() {
 	out="$tmpdir/perf.out"
-	perf script report task-analyzer --summary > $out
+	perf script report task-analyzer --summary > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Summary" $out ${FUNCNAME[0]}
+	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
 }
 
 test_summaryextended() {
 	out="$tmpdir/perf.out"
-	perf script report task-analyzer --summary-extended > $out
+	perf script report task-analyzer --summary-extended > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Inter Task Times" $out ${FUNCNAME[0]}
+	find_str_or_fail "Inter Task Times" "$out" "${FUNCNAME[0]}"
 }
 
 test_summaryonly() {
 	out="$tmpdir/perf.out"
-	perf script report task-analyzer --summary-only > $out
+	perf script report task-analyzer --summary-only > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Summary" $out ${FUNCNAME[0]}
+	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
 }
 
 test_extended_times_summary_ns() {
 	out="$tmpdir/perf.out"
-	perf script report task-analyzer --extended-times --summary --ns > $out
+	perf script report task-analyzer --extended-times --summary --ns > "$out"
 	check_exec_0 "perf"
-	find_str_or_fail "Out-Out" $out ${FUNCNAME[0]}
-	find_str_or_fail "Summary" $out ${FUNCNAME[0]}
+	find_str_or_fail "Out-Out" "$out" "${FUNCNAME[0]}"
+	find_str_or_fail "Summary" "$out" "${FUNCNAME[0]}"
 }
 
 test_csv() {
 	perf script report task-analyzer --csv csv > /dev/null
 	check_exec_0 "perf"
-	find_str_or_fail "Comm;" csv ${FUNCNAME[0]}
+	find_str_or_fail "Comm;" csv "${FUNCNAME[0]}"
 }
 
 test_csv_extended_times() {
 	perf script report task-analyzer --csv csv --extended-times > /dev/null
 	check_exec_0 "perf"
-	find_str_or_fail "Out-Out;" csv ${FUNCNAME[0]}
+	find_str_or_fail "Out-Out;" csv "${FUNCNAME[0]}"
 }
 
 test_csvsummary() {
 	perf script report task-analyzer --csv-summary csvsummary > /dev/null
 	check_exec_0 "perf"
-	find_str_or_fail "Comm;" csvsummary ${FUNCNAME[0]}
+	find_str_or_fail "Comm;" csvsummary "${FUNCNAME[0]}"
 }
 
 test_csvsummary_extended() {
 	perf script report task-analyzer --csv-summary csvsummary --summary-extended \
 	>/dev/null
 	check_exec_0 "perf"
-	find_str_or_fail "Out-Out;" csvsummary ${FUNCNAME[0]}
+	find_str_or_fail "Out-Out;" csvsummary "${FUNCNAME[0]}"
 }
 
 prepare_perf_data
-- 
2.39.1

