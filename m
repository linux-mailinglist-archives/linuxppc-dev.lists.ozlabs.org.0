Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3648C72EBBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 21:15:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fyU218Vy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QgdYy07s7z30gt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jun 2023 05:15:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fyU218Vy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QgdY26cgWz2xqq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jun 2023 05:15:01 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGkW5G007782;
	Tue, 13 Jun 2023 17:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=LUWWfN0fL/r8kWv5U3DzyZ1X0qXpgm0BC6QrDVF5Xyc=;
 b=fyU218VyvW+u3AWZ755LeISiNWH0gyp1UoGJVfY7pf6vEyTioPZP+jpcHXFFSw9LlDi/
 rFEFHnF4/yXpePSg7jHZGANbV+aQxr/JRJV9ZNZbgjlj02MW1052KXa34ZXbWSZ2OAsi
 IX9ZYD4tl23Yig8BZr7pAX+eM7YLAMEWf8QfosB0QVpjlya04ubRnHmxgrWjsWJ9FWY/
 vzgqVS7PYLQDRSS4AKnGrvmSGlM8xNIcxly97D8bv621NPkyssNPvV4XNdcXb3jbmmuj
 n53EiXr+zCukyFWhhKrJ5TuKVj+vb37YZtjD9OSE0r82vV9pA6SjxNXREWVj7zzjHfLJ jw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uvn0pyd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:34 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35DGvDSF008324;
	Tue, 13 Jun 2023 17:04:33 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r6uvn0pw5-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 17:04:33 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35D4xb4G019431;
	Tue, 13 Jun 2023 16:42:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4spya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Jun 2023 16:42:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35DGgWX142730050
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Jun 2023 16:42:33 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFBF120043;
	Tue, 13 Jun 2023 16:42:32 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C882620040;
	Tue, 13 Jun 2023 16:42:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.111.115])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Jun 2023 16:42:29 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 07/17] perf/tests/shell : Shellcheck fixes for perf test "test_arm_coresight.sh"
Date: Tue, 13 Jun 2023 22:11:35 +0530
Message-Id: <20230613164145.50488-8-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
References: <20230613164145.50488-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HeVnWIhNcqr5RmNTD_GYmWI0aBPyj1QH
X-Proofpoint-GUID: cRfUBAMnzrqlsYVS3kMG-_lkAgvnaPM0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1011 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 mlxscore=0
 mlxlogscore=834 bulkscore=0 classifier=spam adjust=0 reason=mlx
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
Cc: atrajeev@linux.vnet.ibm.com, Anushree Mathur <anushree.mathur@linux.vnet.ibm.com>, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Anushree Mathur <anushree.mathur@linux.vnet.ibm.com>

Fixed the following shellcheck issues in test_arm_coresight.sh file:

In tools/perf/tests/shell/test_arm_coresight.sh line 31:
        trap - exit term int
               ^--^ SC2039: In POSIX sh, using lower/mixed case for signal names is undefined.
                    ^--^ SC2039: In POSIX sh, using lower/mixed case for signal names is undefined.
                         ^-^ SC2039: In POSIX sh, using lower/mixed case for signal names is undefined.

In tools/perf/tests/shell/test_arm_coresight.sh line 35:
trap cleanup_files exit term int
                   ^--^ SC2039: In POSIX sh, using lower/mixed case for signal names is undefined.
                        ^--^ SC2039: In POSIX sh, using lower/mixed case for signal names is undefined.
                             ^-^ SC2039: In POSIX sh, using lower/mixed case for signal names is undefined.

In tools/perf/tests/shell/test_arm_coresight.sh line 92:
        if [ $? -eq 0 -a -e "$1/enable_sink" ]; then
                      ^-- SC2166: Prefer [ p ] && [ q ] as [ p -a q ] is not well defined.

Fixed above warnings by:
1)Capitalize signals(INT, TERM, EXIT) to avoid mixed/lower case naming of
signals.
2)Expression [p -a q] was not defined,changed it to [p] && [q] to avoid the
ambiguity as this is older format using -a or -o ,now we use [p] && [q] in
place of [p -a q] and [p] || [q] in place of [p -o q].

Result after fixing the issues:

shell$ shellcheck -S warning test_arm_coresight.sh
shell$

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Signed-off-by: Anushree Mathur <anushree.mathur@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/test_arm_coresight.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/test_arm_coresight.sh b/tools/perf/tests/shell/test_arm_coresight.sh
index 482009e17bda..f1bf5621160f 100755
--- a/tools/perf/tests/shell/test_arm_coresight.sh
+++ b/tools/perf/tests/shell/test_arm_coresight.sh
@@ -28,11 +28,11 @@ cleanup_files()
 	rm -f ${perfdata}
 	rm -f ${file}
 	rm -f "${perfdata}.old"
-	trap - exit term int
+	trap - EXIT TERM INT
 	exit $glb_err
 }
 
-trap cleanup_files exit term int
+trap cleanup_files EXIT TERM INT
 
 record_touch_file() {
 	echo "Recording trace (only user mode) with path: CPU$2 => $1"
@@ -89,7 +89,7 @@ is_device_sink() {
 	# cannot support perf PMU.
 	echo "$1" | grep -E -q -v "tpiu"
 
-	if [ $? -eq 0 -a -e "$1/enable_sink" ]; then
+	if [ $? -eq 0 ] && [ -e "$1/enable_sink" ]; then
 
 		pmu_dev="/sys/bus/event_source/devices/cs_etm/sinks/$2"
 
-- 
2.39.1

