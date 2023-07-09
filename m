Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AC074C70A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:31:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hT7KIEmD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzbM70s32z3cHB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:31:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hT7KIEmD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHJ33fgz30dp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:28 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IM9G8030847;
	Sun, 9 Jul 2023 18:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g4a83SV60DqfeeQBzooYV0XTJN3xFqELgVabFoYRJqk=;
 b=hT7KIEmDLOo8uxoRmM4P+kBteFQ3VEamjsBo48rd2cdyWIfeeAbwb6TjgZmTl5dHI3wv
 U7hwCqZWtk6sIbPpTch44kv6Dyr0yACg6KPMcxVzu/lwpCdrEPiTXyGp6GMbTlVQ4JQ5
 fIGLvUKbhN8RL4rZoPrv/YXtgu3Li0+c7GLw/gq02b6inEcv+zE5ct630hBdY9AJFdHI
 MwQA1qm3fcKc06eJWZLN/MuZBSlU9OGY3DNt6IKvdboCxBqG8xjflvqutNOmY7vNkW3r
 M98b22naJPOgNFSOuvcqtijQ/e9loOtoMJPumS9k6ehbSytlrYb395L0Dkd+byZm7UP3 AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr24381ga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:23 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369ISMrD011307;
	Sun, 9 Jul 2023 18:28:22 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr24381g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:22 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3699nUq3022939;
	Sun, 9 Jul 2023 18:28:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rpy2e0v9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369ISHL017957558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 395D82004F;
	Sun,  9 Jul 2023 18:28:17 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3AA920043;
	Sun,  9 Jul 2023 18:28:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:14 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 04/26] tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
Date: Sun,  9 Jul 2023 23:57:38 +0530
Message-Id: <20230709182800.53002-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ss3kuSKg1_vBnDXQb-GXe8WeqOqW3cs9
X-Proofpoint-GUID: 5r86e7Sh3GRrQLvnnFw8ANzzeTRaujkN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 malwarescore=0 impostorscore=0
 mlxscore=0 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2307090169
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

From: Kajol Jain <kjain@linux.ibm.com>

Running shellcheck on lock_contention.sh generates below warning:

In tests/shell/lock_contention.sh line 24:
	if [ `id -u` != 0 ]; then
             ^-----^ SC2046 (warning): Quote this to prevent word splitting.

In tests/shell/lock_contention.sh line 160:
	local type=$(head -1 "${result}" | awk '{ print $8 }' | sed -e 's/:.*//')
        ^--------^ SC3043 (warning): In POSIX sh, 'local' is undefined.
              ^--^ SC2155 (warning): Declare and assign separately to avoid masking return values.
                   ^-- SC2046 (warning): Quote this to prevent word splitting.

Fixed above warnings by:
- Adding quotes to avoid word splitting.
- Fixing shellcheck warnings for local usage, by prefixing
  function name to the variable.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 tools/perf/tests/shell/lock_contention.sh | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/perf/tests/shell/lock_contention.sh b/tools/perf/tests/shell/lock_contention.sh
index f2cc187b6186..51421f02fb02 100755
--- a/tools/perf/tests/shell/lock_contention.sh
+++ b/tools/perf/tests/shell/lock_contention.sh
@@ -21,7 +21,7 @@ trap_cleanup() {
 trap trap_cleanup EXIT TERM INT
 
 check() {
-	if [ `id -u` != 0 ]; then
+	if [ "$(id -u)" != 0 ]; then
 		echo "[Skip] No root permission"
 		err=2
 		exit
@@ -157,10 +157,10 @@ test_lock_filter()
 	perf lock contention -i ${perfdata} -L tasklist_lock -q 2> ${result}
 
 	# find out the type of tasklist_lock
-	local type=$(head -1 "${result}" | awk '{ print $8 }' | sed -e 's/:.*//')
+	test_lock_filter_type=$(head -1 "${result}" | awk '{ print $8 }' | sed -e 's/:.*//')
 
-	if [ "$(grep -c -v "${type}" "${result}")" != "0" ]; then
-		echo "[Fail] Recorded result should not have non-${type} locks:" "$(cat "${result}")"
+	if [ "$(grep -c -v "${test_lock_filter_type}" "${result}")" != "0" ]; then
+		echo "[Fail] Recorded result should not have non-${test_lock_filter_type} locks:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
@@ -170,8 +170,8 @@ test_lock_filter()
 	fi
 
 	perf lock con -a -b -L tasklist_lock -q -- perf bench sched messaging > /dev/null 2> ${result}
-	if [ "$(grep -c -v "${type}" "${result}")" != "0" ]; then
-		echo "[Fail] BPF result should not have non-${type} locks:" "$(cat "${result}")"
+	if [ "$(grep -c -v "${test_lock_filter_type}" "${result}")" != "0" ]; then
+		echo "[Fail] BPF result should not have non-${test_lock_filter_type} locks:" "$(cat "${result}")"
 		err=1
 		exit
 	fi
-- 
2.39.1

