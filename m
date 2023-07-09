Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5B174C770
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:48:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mF+93tKL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qzbk80TRzz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:48:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mF+93tKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbJ957Mzz3c3X
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:29:13 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHZMm004046;
	Sun, 9 Jul 2023 18:29:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QV44nS02n8688jFl6sNnr3ZGgq/qcy8hrCYFg4D5rZI=;
 b=mF+93tKL00I+goD6qNeFP89Hmjcap0xpsxCCUr79p2z4tNrMjvA+h0doH4jCR11ZnO1W
 2Sgxo5tYUFFlxshO76MqQt6JphQkD63BTLqLlPDhflURxo8R7YT4xDwuD6fkkpNcbrnL
 tTDpsiAnRQOC8vWliZW4L1XKnDADMR4qowqTBYM9+HXkXDp6+Wc8ofzgoU9xSESm0KK7
 ocBwo/9k9RVaKW4Ma8Yur4AHIIn23ngeSEzNNk7ldZxrta+N6UvwDkv0w/FbVC+BnwiL
 L5n/fwC7jZS3gzxlcUkDRS+DOcTAovQGrUCkUkH98r+1oUKETGJ/pj6kxwhTC3qg3RxV dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21nr3y8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:29:09 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369IQYfQ025920;
	Sun, 9 Jul 2023 18:29:09 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21nr3y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:29:08 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369Cx44D009401;
	Sun, 9 Jul 2023 18:29:07 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rpy2e0v9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:29:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369IT3OK43450798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:29:03 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D17020043;
	Sun,  9 Jul 2023 18:29:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F5CC20040;
	Sun,  9 Jul 2023 18:29:01 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:29:01 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 22/26] tools/perf/tests/shell: Fix the shellcheck warnings in record+zstd_comp_decomp.sh
Date: Sun,  9 Jul 2023 23:57:56 +0530
Message-Id: <20230709182800.53002-23-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
References: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xU6tVY4jatlxFcSOIcJjRhYDl35CEY-M
X-Proofpoint-GUID: c74dVqlssg1_6pqIuPnOY3uNvcz8nL0S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-09_12,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
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

Running shellcheck on record+zstd_comp_decomp.sh testcases
throws below warning:

   In tests/shell/record+zstd_comp_decomp.sh line 16:
       	   $perf_tool record -o $trace_file $gflag -z -F 5000 -- \
                                ^---------^ SC2086 (info): Double quote to prevent globbing and word splitting.

   Did you mean:
     	   $perf_tool record -o "$trace_file" $gflag -z -F 5000 -- \

   In tests/shell/record+zstd_comp_decomp.sh line 22:
	   $perf_tool report -i $trace_file --header --stats | \
                                ^---------^ SC2086 (info): Double quote to prevent globbing and word splitting.

Added double quote around file names to fix these
shellcheck reported issues.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/record+zstd_comp_decomp.sh | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/perf/tests/shell/record+zstd_comp_decomp.sh b/tools/perf/tests/shell/record+zstd_comp_decomp.sh
index 49bd875d5122..8929046e9057 100755
--- a/tools/perf/tests/shell/record+zstd_comp_decomp.sh
+++ b/tools/perf/tests/shell/record+zstd_comp_decomp.sh
@@ -13,25 +13,25 @@ skip_if_no_z_record() {
 collect_z_record() {
 	echo "Collecting compressed record file:"
 	[ "$(uname -m)" != s390x ] && gflag='-g'
-	$perf_tool record -o $trace_file $gflag -z -F 5000 -- \
+	$perf_tool record -o "$trace_file" $gflag -z -F 5000 -- \
 		dd count=500 if=/dev/urandom of=/dev/null
 }
 
 check_compressed_stats() {
 	echo "Checking compressed events stats:"
-	$perf_tool report -i $trace_file --header --stats | \
+	$perf_tool report -i "$trace_file" --header --stats | \
 		grep -E "(# compressed : Zstd,)|(COMPRESSED events:)"
 }
 
 check_compressed_output() {
-	$perf_tool inject -i $trace_file -o $trace_file.decomp &&
-	$perf_tool report -i $trace_file --stdio -F comm,dso,sym | head -n -3 > $trace_file.comp.output &&
-	$perf_tool report -i $trace_file.decomp --stdio -F comm,dso,sym | head -n -3 > $trace_file.decomp.output &&
-	diff $trace_file.comp.output $trace_file.decomp.output
+	$perf_tool inject -i "$trace_file" -o "$trace_file.decomp" &&
+	$perf_tool report -i "$trace_file" --stdio -F comm,dso,sym | head -n -3 > "$trace_file.comp.output" &&
+	$perf_tool report -i "$trace_file.decomp" --stdio -F comm,dso,sym | head -n -3 > "$trace_file.decomp.output" &&
+	diff "$trace_file.comp.output" "$trace_file.decomp.output"
 }
 
 skip_if_no_z_record || exit 2
 collect_z_record && check_compressed_stats && check_compressed_output
 err=$?
-rm -f $trace_file*
+rm -f "$trace_file*"
 exit $err
-- 
2.39.1

