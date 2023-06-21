Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF21A737D4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:35:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wk38jIdZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmGyx4fsKz3cGD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 18:35:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wk38jIdZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmGt910Wzz3bXk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 18:30:56 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L7l9Th008867;
	Wed, 21 Jun 2023 08:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g4a83SV60DqfeeQBzooYV0XTJN3xFqELgVabFoYRJqk=;
 b=Wk38jIdZZi0U1oNCfIyDmKAeDDbio117m0ToPED8tgiSvPAFK6J+2YJvxuO5No55A/DG
 vg5yUMj1QPjulwnzdA3YfCRPuOACnrqB1rfY8unJR2qCLYV9UpmdNxPPk9bBuogznqYN
 6+K8slXDivz90Lr9UJktKjR2ZQZjtURbB/c/e440Hnb1xrNaAP4LYMo4+5VKVO9QaqDT
 lESM6UphBghLJlrqFTqgDndHY2pLkBjrwXQU2Vm+ga6t7gkzcar4LJ6UxHkGcSekDm/E
 Hx6G1lz2empklnbRHhpLZn3MmlL/oDEHLs5XcUSBVfX1bjhvM6U4MxCWPNXnv76QszQL IQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbw4bs3x8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:51 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L85eT2003744;
	Wed, 21 Jun 2023 08:30:51 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbw4bs3w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:50 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L876W6032655;
	Wed, 21 Jun 2023 08:30:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r943e2029-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:48 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8UiFF40174102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:30:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 542B02004D;
	Wed, 21 Jun 2023 08:30:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8C9020043;
	Wed, 21 Jun 2023 08:30:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:30:40 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 04/22] tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
Date: Wed, 21 Jun 2023 14:00:03 +0530
Message-Id: <20230621083021.71203-5-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
References: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VBrww0aoJtBPt7BVGNat_YniwH_D-Vrk
X-Proofpoint-ORIG-GUID: mf0cfV2cBec-EnEnAQwYRns_maNoW8Fe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306210067
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

