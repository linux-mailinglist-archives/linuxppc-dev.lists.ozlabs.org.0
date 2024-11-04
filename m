Return-Path: <linuxppc-dev+bounces-2818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA90F9BAD1D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 08:29:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xhjlq50xkz2xGQ;
	Mon,  4 Nov 2024 18:29:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730705383;
	cv=none; b=XvdtBm2un5z3oRZ1fK/aOIJ6lrGrtBOBZRBo1MXW8Jxs+/GSJZsjlIdVdknuNL7MolbM4/RFR+K+wrSt44L654a4wnN6wboxweR5v59rK4xbxg3lSZmCNd7quNW3JFN4o3WodkhDOaQrwqJlKcNd3WVhUoDti9Ii3HKnL4XY20nN2uc0j08kZpVvQm95Y94f4b3CJSN2MqTJ0l+WN5WMIj2cVh+p/85+s6G8WY46HZeX55w74ylwiJprhuGk/xPCBMy8Ud35F3ff4GYgqoZJXdodC/H06U5ORkw209REtHK+0WyqLxmAQP8djHkiRjtqkS5rVngRaGfT7mP29zPpKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730705383; c=relaxed/relaxed;
	bh=nLkYmtBtDHpw5HrNqvFnObaxUKs9S56IrfEc9MjTFYM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jwOy7o7PBfVa0kRYfhzkjAiza9XZ5ZeyzdyHcr4Ay5VPdOSPnSEHaXG/2Yx1nisss7zNAOdhWc23sYfVH2qkkTqo9fO9zZaQHMVas2FgIxjZQA+vKiAgrfwiemeo10E6fXxl/Onm5Sjd5Ae6F3NdsD01kAAmrJFT8GRglUWKhB4GKJfmjgJtARhdirnSlMH2KqlxQFa4z9td36iynH7aJ1LsxXTI9W7O9PjkyRS+k0Cdi0yPwPwsoxrlpDt4yYBQQUAdbsWHGypf9Y4EPU0hkqaayY8/PWSxx3+GuS22ZW75Xh2m7Ff7Q937oScGrbdxKX2VNvGvZ1V1kRarCbp7UA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bmqOAw7r; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bmqOAw7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xhjln3h0Zz2xDM
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 18:29:40 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A47ARJa027925;
	Mon, 4 Nov 2024 07:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=nLkYmtBtDHpw5HrNqvFnObaxUKs9S56IrfEc9MjTF
	YM=; b=bmqOAw7rMQGlZZEQsIj8lgWzXPM8n2SH27rugvAO3kj9kdej1hiEg6dpd
	Dt4MKRfQX0WIMH9dvpbP6CIJtgYw2EA3tnX9MFAP2bLIUt5uHPzhx2eyRsuVql4d
	OuvCp4QhD3Tn0H+IIbHyBZQV965rE9q6+U1WKBaNyJBCIdM4VUJTcWYe/NpRy78B
	AXX6rDVemj/p9OVZ6Izyi6dvEB3UgBrWto8Xivsk1hCXDWlBx5fSH0kM4i3tGHdx
	AeDUVuJxmJ4sFbuddWmq4aewrDHGnOUCOdr4DdnFahGPaJvh8bd6rJaqfJpojgjC
	cXzTLEpLmSq5enPC6w0Quyjlzp2SA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42psn382hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:29:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A47TVI9004558;
	Mon, 4 Nov 2024 07:29:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42psn382hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:29:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A47Sfum008439;
	Mon, 4 Nov 2024 07:29:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42nywk2hb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 07:29:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4A47TQd227591278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Nov 2024 07:29:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C271D20040;
	Mon,  4 Nov 2024 07:29:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A775B2004B;
	Mon,  4 Nov 2024 07:29:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.251.57])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Nov 2024 07:29:20 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, mpetlan@redhat.com, hbathini@linux.ibm.com,
        vmolnaro@redhat.com
Subject: [PATCH V2] tools/perf/tests/shell/base_probe: Enhance print_overall_results to print summary information
Date: Mon,  4 Nov 2024 12:59:14 +0530
Message-Id: <20241104072914.15196-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pVk7GQDBCzbM2ZGIi_BXwaRz0xX4W3VR
X-Proofpoint-ORIG-GUID: tSeJ-X5kw_Q-aO8JITQmfOhyQvtEfFBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411040062
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently print_overall_results prints the number of
fails in the summary, example from base_probe tests in
testsuite_probe:

 ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
	11 failures found

test_invalid_options contains multiple tests and out
of that 11 failed. Sometimes it could happen that it
is due to missing dependency in the build or environment
dependency.

Example, perf probe -L requires DWARF enabled. otherwise
it fails as below:
 ./perf probe -L
  Error: switch `L' is not available because NO_DWARF=1

"-L" is tested as one of the option in :
   for opt in '-a' '-d' '-L' '-V'; do
   <<perf probe test>>
   print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "missing argument
	for $opt"

Here -a and -d doesn't require DWARF. Similarly there
are few other tests requiring DWARF. To hint the user that
missing dwarf could be one issue, update print_overall_results
to print a comment string along with summary hinting the possible
cause. Update test_invalid_options.sh and test_line_semantics.sh
to pass the info about dwarf requirement since these tests
failed when perf is built without DWARF. Use the check for
presence of dwarf with "perf check feature" and append the
hint message based on the result.

With the change:
 ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
 11 failures found :: Some of the tests need DWARF to run

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2:
 Check presence of dwarf using "perf check feature". Add
 failure hint message for dwarf based on this check

 tools/perf/tests/shell/base_probe/test_invalid_options.sh | 5 ++++-
 tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 5 ++++-
 tools/perf/tests/shell/common/init.sh                     | 3 ++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/base_probe/test_invalid_options.sh b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
index 1fedfd8b0d0d..c51d8d9bfdb7 100755
--- a/tools/perf/tests/shell/base_probe/test_invalid_options.sh
+++ b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
@@ -22,6 +22,9 @@ if ! check_kprobes_available; then
 	exit 0
 fi
 
+# Check for presence of dwarf
+$CMD_PERF check feature -q dwarf
+[ $? -ne 0 ] && HINT_FAIL="Some of the tests need DWARF to run"
 
 ### missing argument
 
@@ -75,5 +78,5 @@ done
 
 
 # print overall results
-print_overall_results "$TEST_RESULT"
+print_overall_results "$TEST_RESULT" $HINT_FAIL
 exit $?
diff --git a/tools/perf/tests/shell/base_probe/test_line_semantics.sh b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
index d8f4bde0f585..f5d3b6e8d0d6 100755
--- a/tools/perf/tests/shell/base_probe/test_line_semantics.sh
+++ b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
@@ -23,6 +23,9 @@ if ! check_kprobes_available; then
 	exit 0
 fi
 
+# Check for presence of dwarf
+$CMD_PERF check feature -q dwarf
+[ $? -ne 0 ] && HINT_FAIL="Some of the tests need DWARF to run"
 
 ### acceptable --line descriptions
 
@@ -51,5 +54,5 @@ done
 
 
 # print overall results
-print_overall_results "$TEST_RESULT"
+print_overall_results "$TEST_RESULT" $HINT_FAIL
 exit $?
diff --git a/tools/perf/tests/shell/common/init.sh b/tools/perf/tests/shell/common/init.sh
index 075f17623c8e..0862cbc1c6f7 100644
--- a/tools/perf/tests/shell/common/init.sh
+++ b/tools/perf/tests/shell/common/init.sh
@@ -46,10 +46,11 @@ print_results()
 print_overall_results()
 {
 	RETVAL="$1"; shift
+	TASK_COMMENT="$*"
 	if [ $RETVAL -eq 0 ]; then
 		_echo "$MALLPASS## [ PASS ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY"
 	else
-		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found"
+		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found :: $TASK_COMMENT"
 	fi
 	return $RETVAL
 }
-- 
2.43.5


