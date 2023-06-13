Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED20372EB45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 20:53:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OhDtwapg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qgd3v5Lbmz30gh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 04:53:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OhDtwapg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qgd313xnLz30J1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 04:52:28 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkL4K009924;
	Tue, 13 Jun 2023 17:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1YX+PY5dwKVfiN13QWKPQtlJpQ3SPm1/lHlQ6wfr87E=;
 b=OhDtwapgrvIhRMB7LmT3eEOyaY/1c7vGZ2sa/+VjZHkecyN9gA4y4l1gFgWffCsqX5tz
 qfV9zQXGKSq3GGThE/hkpkB5XEjJNxHeVnpQMiNJn26noVvQ1e/6HBJwWZ8MkIADxlzm
 NTwIynuWFdyA5sm9DVnBysdkAUVrKhmq/OJkazuyLAhLJoU1mTY+B3ZgFa9JexlIPz+q
 5IZfdtBcOcglz6Jlrvu4bnIrTUP2OUhlYjhtkFz7hT7jpFY+LtBDH/46Stj1QAid1FJa
 oMDBPwymHZwj6ppSTAn1IAb2stZCQX7OGdd1NsCGcBvHRdSPM44gbJXBh754KDqkEyCT zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v950f4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:56 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DGxfiS023143;
	Tue, 13 Jun 2023 17:04:55 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6v950ew0-9
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:54 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D8o1fF017849;
	Tue, 13 Jun 2023 16:42:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r4gedsqbm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGglH721431018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BA042004F;
	Tue, 13 Jun 2023 16:42:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EEDA20040;
	Tue, 13 Jun 2023 16:42:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:44 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 11/17] perf/tests/shell: fix shellscript errors for lock_contention.sh
Date: Tue, 13 Jun 2023 22:11:39 +0530
Message-Id: <20230613164145.50488-12-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TyUleZdVfl0yXrlJSYRAx9Md6EnJ0DDm
X-Proofpoint-ORIG-GUID: 2hiP3IIjdzFwdct_h3mbGvtT__ZIV4yp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Anushree Mathur <anushree.mathur2@ibm.com>, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>

Use quotes around variables to prevent POSIX word expansion,
use uppercase for signals(INT, TERM, EXIT) to avoid mixed/lower case
naming of signals and replace "==" with "=" as "==" is not
supported by POSIX shell.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Abhirup Deb <abhirupdeb@linux.vnet.ibm.com>
Signed-off-by: Anushree Mathur <anushree.mathur2@ibm.com>
---
 tools/perf/tests/shell/lock_contention.sh | 70 +++++++++++------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/tools/perf/tests/shell/lock_contention.sh b/tools/perf/tests/shell/lock_contention.sh
index be5fcafb26aa..f2cc187b6186 100755
--- a/tools/perf/tests/shell/lock_contention.sh
+++ b/tools/perf/tests/shell/lock_contention.sh
@@ -11,14 +11,14 @@ result=$(mktemp /tmp/__perf_test.result.XXXXX)
 cleanup() {
 	rm -f ${perfdata}
 	rm -f ${result}
-	trap - exit term int
+	trap - EXIT TERM INT
 }
 
 trap_cleanup() {
 	cleanup
 	exit ${err}
 }
-trap trap_cleanup exit term int
+trap trap_cleanup EXIT TERM INT
 
 check() {
 	if [ `id -u` != 0 ]; then
@@ -40,8 +40,8 @@ test_record()
 	perf lock record -o ${perfdata} -- perf bench sched messaging > /dev/null 2>&1
 	# the output goes to the stderr and we expect only 1 output (-E 1)
 	perf lock contention -i ${perfdata} -E 1 -q 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] Recorded result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] Recorded result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -58,8 +58,8 @@ test_bpf()
 
 	# the perf lock contention output goes to the stderr
 	perf lock con -a -b -E 1 -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] BPF result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] BPF result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -70,8 +70,8 @@ test_record_concurrent()
 	echo "Testing perf lock record and perf lock contention at the same time"
 	perf lock record -o- -- perf bench sched messaging 2> /dev/null | \
 	perf lock contention -i- -E 1 -q 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] Recorded result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] Recorded result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -81,8 +81,8 @@ test_aggr_task()
 {
 	echo "Testing perf lock contention --threads"
 	perf lock contention -i ${perfdata} -t -E 1 -q 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] Recorded result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] Recorded result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -93,8 +93,8 @@ test_aggr_task()
 
 	# the perf lock contention output goes to the stderr
 	perf lock con -a -b -t -E 1 -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] BPF result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] BPF result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -104,8 +104,8 @@ test_aggr_addr()
 {
 	echo "Testing perf lock contention --lock-addr"
 	perf lock contention -i ${perfdata} -l -E 1 -q 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] Recorded result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] Recorded result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -116,8 +116,8 @@ test_aggr_addr()
 
 	# the perf lock contention output goes to the stderr
 	perf lock con -a -b -l -E 1 -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] BPF result count is not 1:" $(cat "${result}" | wc -l)
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] BPF result count is not 1:" "$(cat "${result}" | wc -l)"
 		err=1
 		exit
 	fi
@@ -127,8 +127,8 @@ test_type_filter()
 {
 	echo "Testing perf lock contention --type-filter (w/ spinlock)"
 	perf lock contention -i ${perfdata} -Y spinlock -q 2> ${result}
-	if [ $(grep -c -v spinlock "${result}") != "0" ]; then
-		echo "[Fail] Recorded result should not have non-spinlocks:" $(cat "${result}")
+	if [ "$(grep -c -v spinlock "${result}")" != "0" ]; then
+		echo "[Fail] Recorded result should not have non-spinlocks:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -138,8 +138,8 @@ test_type_filter()
 	fi
 
 	perf lock con -a -b -Y spinlock -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(grep -c -v spinlock "${result}") != "0" ]; then
-		echo "[Fail] BPF result should not have non-spinlocks:" $(cat "${result}")
+	if [ "$(grep -c -v spinlock "${result}")" != "0" ]; then
+		echo "[Fail] BPF result should not have non-spinlocks:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -149,7 +149,7 @@ test_lock_filter()
 {
 	echo "Testing perf lock contention --lock-filter (w/ tasklist_lock)"
 	perf lock contention -i ${perfdata} -l -q 2> ${result}
-	if [ $(grep -c tasklist_lock "${result}") != "1" ]; then
+	if [ "$(grep -c tasklist_lock "${result}")" != "1" ]; then
 		echo "[Skip] Could not find 'tasklist_lock'"
 		return
 	fi
@@ -159,8 +159,8 @@ test_lock_filter()
 	# find out the type of tasklist_lock
 	local type=$(head -1 "${result}" | awk '{ print $8 }' | sed -e 's/:.*//')
 
-	if [ $(grep -c -v "${type}" "${result}") != "0" ]; then
-		echo "[Fail] Recorded result should not have non-${type} locks:" $(cat "${result}")
+	if [ "$(grep -c -v "${type}" "${result}")" != "0" ]; then
+		echo "[Fail] Recorded result should not have non-${type} locks:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -170,8 +170,8 @@ test_lock_filter()
 	fi
 
 	perf lock con -a -b -L tasklist_lock -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(grep -c -v "${type}" "${result}") != "0" ]; then
-		echo "[Fail] BPF result should not have non-${type} locks:" $(cat "${result}")
+	if [ "$(grep -c -v "${type}" "${result}")" != "0" ]; then
+		echo "[Fail] BPF result should not have non-${type} locks:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -181,14 +181,14 @@ test_stack_filter()
 {
 	echo "Testing perf lock contention --callstack-filter (w/ unix_stream)"
 	perf lock contention -i ${perfdata} -v -q 2> ${result}
-	if [ $(grep -c unix_stream "${result}") == "0" ]; then
+	if [ "$(grep -c unix_stream "${result}")" = "0" ]; then
 		echo "[Skip] Could not find 'unix_stream'"
 		return
 	fi
 
 	perf lock contention -i ${perfdata} -E 1 -S unix_stream -q 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] Recorded result should have a lock from unix_stream:" $(cat "${result}")
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] Recorded result should have a lock from unix_stream:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -198,8 +198,8 @@ test_stack_filter()
 	fi
 
 	perf lock con -a -b -S unix_stream -E 1 -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] BPF result should have a lock from unix_stream:" $(cat "${result}")
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] BPF result should have a lock from unix_stream:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -209,14 +209,14 @@ test_aggr_task_stack_filter()
 {
 	echo "Testing perf lock contention --callstack-filter with task aggregation"
 	perf lock contention -i ${perfdata} -v -q 2> ${result}
-	if [ $(grep -c unix_stream "${result}") == "0" ]; then
+	if [ "$(grep -c unix_stream "${result}")" = "0" ]; then
 		echo "[Skip] Could not find 'unix_stream'"
 		return
 	fi
 
 	perf lock contention -i ${perfdata} -t -E 1 -S unix_stream -q 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] Recorded result should have a task from unix_stream:" $(cat "${result}")
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] Recorded result should have a task from unix_stream:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -226,8 +226,8 @@ test_aggr_task_stack_filter()
 	fi
 
 	perf lock con -a -b -t -S unix_stream -E 1 -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ $(cat "${result}" | wc -l) != "1" ]; then
-		echo "[Fail] BPF result should have a task from unix_stream:" $(cat "${result}")
+	if [ "$(cat "${result}" | wc -l)" != "1" ]; then
+		echo "[Fail] BPF result should have a task from unix_stream:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
-- 
2.39.1

