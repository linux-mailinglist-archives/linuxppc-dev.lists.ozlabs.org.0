Return-Path: <linuxppc-dev+bounces-2231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679D99D39D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 17:40:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS1f71Q0xz3c2t;
	Tue, 15 Oct 2024 02:40:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728920447;
	cv=none; b=h8K3Ubremi4P6GQPLZuC8n3o0FowqDKURgStisK9KYBZ5F6oZO6E86pMOR01zFHmE2xg2q/Jc/x9sf1Rn+40aXBqm6FVBRHbaXOmKV4cjlXkosOUgJC7sbMGjLPNUjP0nyxPr6CAuQFoJe2o7yZoLwoiPQj09L6ux2Kpiz+VkUTFITN49/kGc5Y2fDtv+c8FbcsOjPf1GIBqDgp8F2ZypoDlp+dkR7CHqQoxDQCAyuiKMUC1s7cfZ11mDVRT11BxLk7nXvECJUbUsiVt+wdVhJf8leMuIy58DDL8KFOEO4O/cIcrAf89069hvvt4WZ5kBs1hgGv842iv8hAV5KDUFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728920447; c=relaxed/relaxed;
	bh=EYlvhA6ZTEU918yL/dNv4EAbx+cp7KlnoRypRkxwZpo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ACF4axnwwgylyrFhHvXTs3jcAP3jLv4IVNwmM7EFrTlThw/TJHaCxW6VXqmgK77pAWfN11WvydWH/lRZXivmfMZ+gfffWAzXL3psoQMtEk+fdVoDt1G8pDwx6I1gJsGvLz8wOJMYuxWUs+Y1FWm3cgiYxy+81PCJN7Qn0jdSSQbJmu0qLZhJDbBSqQylG5iy+lhGvadbNeGksUhUksuBvp+fGNEeLNcS3TeAmfb5ZVAzHA3sxgY9aIrdn22c7E+FnyDG2z8dsTG8gXqHXr3ZImOG0rdY8/3TJTDk0dnUiBf9+Bwc3ivT/ijLknWkGnG2qJuEheoyeEl4yZ5//1Ho0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EsPtNEo8; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EsPtNEo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS1f61mBQz3c2l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 02:40:46 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EFP7g8019589;
	Mon, 14 Oct 2024 15:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=EYlvhA6ZTEU918yL/dNv4EAbx+
	cp7KlnoRypRkxwZpo=; b=EsPtNEo8H0qAV38RSl7regVJr9pWgFlK6yP5mrLG9X
	SBRgap4rt39eX4d6D9QnqbctXEJyqUE27IuyXRBGsRUIA+qmrh3TXHb3hoqZ8SQY
	vssoUDd7jdSVN6hEgDN9Kt37N8Kd8kqzidegGJ9XXXjgFuwFlodKrewUe0H9A0lw
	9mVm918KteZcpQjxJ0wWyDu+5JNtoz/BvwLpySjw8xZVjVoMPnkDh6B8m0DwP0xx
	J/YdQ/kPzOTYubcFw+OvI+6bx8sufdvzgedOGD9ggMZ6uHawMn7u4Jbcz7ZI6hhB
	9EGCp0l3duSWu8w0XVwzALF2lydURpXpxfjM+jFWCqBw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4295wy02n0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:40:40 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49EFedSe024899;
	Mon, 14 Oct 2024 15:40:39 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4295wy02mv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:40:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49EEeYdE001940;
	Mon, 14 Oct 2024 15:40:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284emfana-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:40:38 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EFeY2Y46203388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 15:40:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94C8720043;
	Mon, 14 Oct 2024 15:40:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BEBD20040;
	Mon, 14 Oct 2024 15:40:29 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.183])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 15:40:28 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH] tools/perf/tests/shell/base_probe: Enhance print_overall_results to print summary information
Date: Mon, 14 Oct 2024 21:10:25 +0530
Message-Id: <20241014154025.85564-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gnSDmrcaq49Kapv9YynIEepP3JKC3eh_
X-Proofpoint-ORIG-GUID: f7c0vw2x27eG3ZfVH_Ky_ndrMGvdviHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxlogscore=835 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140113
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
failed when perf is built without DWARF.

With the change:
 ## [ FAIL ] ## perf_probe :: test_invalid_options SUMMARY ::
 11 failures found :: Some of the tests need DWARF to run

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/base_probe/test_invalid_options.sh | 2 +-
 tools/perf/tests/shell/base_probe/test_line_semantics.sh  | 2 +-
 tools/perf/tests/shell/common/init.sh                     | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/base_probe/test_invalid_options.sh b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
index 1fedfd8b0d0d..e133bb0aa949 100755
--- a/tools/perf/tests/shell/base_probe/test_invalid_options.sh
+++ b/tools/perf/tests/shell/base_probe/test_invalid_options.sh
@@ -75,5 +75,5 @@ done
 
 
 # print overall results
-print_overall_results "$TEST_RESULT"
+print_overall_results "$TEST_RESULT" "Some of the tests need DWARF to run"
 exit $?
diff --git a/tools/perf/tests/shell/base_probe/test_line_semantics.sh b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
index d8f4bde0f585..99f4f56a3292 100755
--- a/tools/perf/tests/shell/base_probe/test_line_semantics.sh
+++ b/tools/perf/tests/shell/base_probe/test_line_semantics.sh
@@ -51,5 +51,5 @@ done
 
 
 # print overall results
-print_overall_results "$TEST_RESULT"
+print_overall_results "$TEST_RESULT" "Some of the tests need DWARF to run"
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


