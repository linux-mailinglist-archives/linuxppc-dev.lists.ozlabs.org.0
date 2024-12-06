Return-Path: <linuxppc-dev+bounces-3844-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7B9E6F96
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2024 14:53:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y4Xlm5LTRz2yVV;
	Sat,  7 Dec 2024 00:53:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733493204;
	cv=none; b=EtFaPwVyqUV64StAVXCDK3LtUXf55SDMetP9JhgdC0WaU14WZO6gKdEiDH6upFLY3zjVxYJzLT0NCYc5K2wtxbqnFN0QUN+2D72K0ZpTRQpimYs8ap1+4FQ+eYTfW7aGzr5TgOQaNbQ7lBU46QOqAkKRu6t80T/i+Wa54Kq3Il751deBYG5RsHTUnS39GdTDa+7e61e9ACldL4iBd0ggmBbJfnTAhE2D/1WbJOOL3K2JTl5yEmRczS96zakzppVCwiuOezqw6Px4A/B/kV40dOw3w7SImJiZA6fnXiyo4Qs8811fzM6HiWJ1KwfcKto4AcIX0ptVpU0IsGCexQ80WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733493204; c=relaxed/relaxed;
	bh=j6a/5nELmVvzW7RBn0lo+X1Ulo3HZGlYxE0pch8J/Gg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=U16n1yphW9oD4Uy5yxOYlSMvZOWti1JftA6oL7iyyIOkiD7uBuX39PKEZzxaoOaDe6CgQKWiXEF/M+ITdJ6XL4HcxXq3RQHSA+XOQ5KCskkg6SRwTD5aLRt7F46BrsxxYAwHeck2yelz9lmUJAPrYO4QilR2nvURx0NbU16u0rCdaRZa++rmbTPUIhA56N42Xj688Gwv6phYsW6+WE/q2LVNHMqluqlCf7WzTMp6ahQH8Hh3Kv12HbbI/GsaxZrHvazQKYWfODkwV/Bvg64C33jYMND6G9YD0sFzNDceYkVDS5duE2OjHgsg3gVDhzpMMEULchv6U8EPkARYmDxPNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hz4kGGB6; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hz4kGGB6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y4Xll3Gt9z2y71
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Dec 2024 00:53:23 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6DRdPd010817;
	Fri, 6 Dec 2024 13:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=j6a/5nELmVvzW7RBn0lo+X1Ulo3HZGlYxE0pch8J/
	Gg=; b=hz4kGGB6IdjFe7t0mD2Gx7opnF2f77J08DxNCpkVWtVGnoFN6otT9r5+q
	mhifmwCS4fw2B3nAZORsyDK+iZTVK3R+rl1hruyIPebJWhVEs2m4htXy1D+E1+5f
	wplcSYRvsQTy8VRv+9d/cXRC2bKmDdLBD5bfi6gJxQAWqlTfkZG9D+xFdSdwR0sq
	lSzAy2kwt5Bu0bahqtkIAPflGTMF0acinCzqMMhniT96kTNGGuXq8BB+agS3osn/
	0qJdNKgL2y+w7/pKKUoPxQkV4P5dRHT8VsWYo6G4rBPoGOxIDhbII6OAEl1QmVbx
	rEW9rUvwUUL/JcYvz20CpmtpV1DFg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b24rh9t9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:53:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B6DlBSX030722;
	Fri, 6 Dec 2024 13:53:16 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43b24rh9t6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:53:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B6Ahbms023542;
	Fri, 6 Dec 2024 13:53:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438e1ndthd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:53:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B6DrBtl48497106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2024 13:53:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9714420043;
	Fri,  6 Dec 2024 13:53:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AA7820040;
	Fri,  6 Dec 2024 13:53:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.245.143])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Dec 2024 13:53:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, mpetlan@redhat.com, vmolnaro@redhat.com
Subject: [PATCH V3] tools/perf/tests/shell/base_probe: Enhance print_overall_results to print summary information
Date: Fri,  6 Dec 2024 19:22:54 +0530
Message-Id: <20241206135254.35727-1-atrajeev@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: T8M1A0-vWUG_BwSkCz0aMQqRKY4VZ6BB
X-Proofpoint-ORIG-GUID: GYTlBYgYCohyvti5uNlTwmUku567qHIP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060102
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
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
v1 -> v2
 Check presence of dwarf using "perf check feature". Add
 failure hint message for dwarf based on this check

v2 -> v3
 Check for empty task comment to avoid trailing space
 at the end as suggested by Michael Petlan

 tools/perf/tests/shell/base_probe/test_invalid_options.sh | 5 ++++-
 tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 5 ++++-
 tools/perf/tests/shell/common/init.sh                     | 5 ++++-
 3 files changed, 12 insertions(+), 3 deletions(-)

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
index 075f17623c8e..259706ef5899 100644
--- a/tools/perf/tests/shell/common/init.sh
+++ b/tools/perf/tests/shell/common/init.sh
@@ -46,10 +46,13 @@ print_results()
 print_overall_results()
 {
 	RETVAL="$1"; shift
+	TASK_COMMENT="$*"
+	test -n "$TASK_COMMENT" && TASK_COMMENT=":: $TASK_COMMENT"
+
 	if [ $RETVAL -eq 0 ]; then
 		_echo "$MALLPASS## [ PASS ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY"
 	else
-		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found"
+		_echo "$MALLFAIL## [ FAIL ] ##$MEND $TEST_NAME :: $THIS_TEST_NAME SUMMARY :: $RETVAL failures found $TASK_COMMENT"
 	fi
 	return $RETVAL
 }
-- 
2.43.5


