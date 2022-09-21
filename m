Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F105C051C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 19:09:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXlJd0pDyz3blJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 03:09:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O2eHz4wu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=O2eHz4wu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXlHt3wP2z300V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 03:08:57 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LGRgst025692;
	Wed, 21 Sep 2022 17:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=AMCejasndF/RRn3K44dKJz4fxASMQaaBGTH5TqwHxbY=;
 b=O2eHz4wuDDuQEJoV8zOc3u7oywS+WomiHxrYN+5Qk28A/TYX/uuG9eLzU11mNIXmbnEl
 JW5rEWbpHwDpEOq4MqfVV8aFMFMhLa6l+KjA1vipKo2z9DilhxyPAy0nCiTp+24yXaVo
 k4ZfLegJg33q5zfus9/pU2NBWvRVkMn5UNjyK0Mdwd/2HOcX1OzQTni6oT+nvINLFkPI
 4lca8OGm3TDv/4WQw+AvC3m9EjRC9if7CqqTDX8eRGCaP5Ce9pUQ9WeOH2/F+U2S8w84
 VZwGpquShJRLV1QoxFUKeMvRI9gJ5ga+NB9uBjqviYO0caaPXT2inffZ+ewMi4/gRBTE SQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr2dfjs1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 17:08:49 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LH5EaX027275;
	Wed, 21 Sep 2022 17:08:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3jn5v8nhru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 17:08:46 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LH8h8F46268784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 17:08:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B159FA4051;
	Wed, 21 Sep 2022 17:08:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79C87A4040;
	Wed, 21 Sep 2022 17:08:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.4.79])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 17:08:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] tools/perf/tests: Fix string substitutions in build id test
Date: Wed, 21 Sep 2022 22:38:38 +0530
Message-Id: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xEsWktrbS4PzU1xSapvRKTcewwqk74qG
X-Proofpoint-GUID: xEsWktrbS4PzU1xSapvRKTcewwqk74qG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_09,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210116
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
Cc: maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The perf test named “build id cache operations” skips with below
error on some distros:

<<>>
 78: build id cache operations                                       :
test child forked, pid 111101
WARNING: wine not found. PE binaries will not be run.
test binaries: /tmp/perf.ex.SHA1.PKz /tmp/perf.ex.MD5.Gt3 ./tests/shell/../pe-file.exe
DEBUGINFOD_URLS=
Adding 4abd406f041feb4f10ecde3fc30fd0639e1a91cb /tmp/perf.ex.SHA1.PKz: Ok
build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
./tests/shell/buildid.sh: 69: ./tests/shell/buildid.sh: Bad substitution
test child finished with -2
build id cache operations: Skip
<<>>

The test script "tests/shell/buildid.sh" uses some of the
string substitution ways which are supported in bash, but not in
"sh" or other shells. Above error on line number 69 that reports
"Bad substitution" is:

<<>>
link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
<<>>

Here the way of getting first two characters from id ie,
${id:0:2} and similarly expressions like ${id:2} is not
recognised in "sh". So the line errors and instead of
hitting failure, the test gets skipped as shown in logs.
So the syntax issue causes test not to be executed in
such cases. Similarly usage : "${@: -1}" [ to pick last
argument passed to a function] in “test_record” doesn’t
work in all distros.

Fix this by using alternative way with "cut" command
to pick "n" characters from the string. Also fix the usage
of “${@: -1}” to work in all cases.

Another usage in “test_record” is:
<<>>
${perf} record --buildid-all -o ${data} $@ &> ${log}
<<>>

This causes the perf record to start in background and
Results in the data file not being created by the time
"check" function is invoked. Below log shows perf record
result getting displayed after the call to "check" function.

<<>>
running: perf record /tmp/perf.ex.SHA1.EAU
build id: 4abd406f041feb4f10ecde3fc30fd0639e1a91cb
link: /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb
failed: link /tmp/perf.debug.mLT/.build-id/4a/bd406f041feb4f10ecde3fc30fd0639e1a91cb does not exist
test child finished with -1
build id cache operations: FAILED!
root@machine:~/athira/linux/tools/perf# Couldn't synthesize bpf events.
[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.010 MB /tmp/perf.data.bFF ]
<<>>

Fix this by redirecting output instead of using “&” which
starts the command in background.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/buildid.sh | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
index f05670d1e39e..3512c4423d48 100755
--- a/tools/perf/tests/shell/buildid.sh
+++ b/tools/perf/tests/shell/buildid.sh
@@ -66,7 +66,7 @@ check()
 	esac
 	echo "build id: ${id}"
 
-	link=${build_id_dir}/.build-id/${id:0:2}/${id:2}
+	link=${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/$(echo ${id}|cut -c 3-)
 	echo "link: ${link}"
 
 	if [ ! -h $link ]; then
@@ -74,7 +74,7 @@ check()
 		exit 1
 	fi
 
-	file=${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
+	file=${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/`readlink ${link}`/elf
 	echo "file: ${file}"
 
 	if [ ! -x $file ]; then
@@ -117,20 +117,22 @@ test_record()
 {
 	data=$(mktemp /tmp/perf.data.XXX)
 	build_id_dir=$(mktemp -d /tmp/perf.debug.XXX)
-	log=$(mktemp /tmp/perf.log.XXX)
+	log_out=$(mktemp /tmp/perf.log.out.XXX)
+	log_err=$(mktemp /tmp/perf.log.err.XXX)
 	perf="perf --buildid-dir ${build_id_dir}"
+	eval last=\${$#}
 
 	echo "running: perf record $@"
-	${perf} record --buildid-all -o ${data} $@ &> ${log}
+	${perf} record --buildid-all -o ${data} $@ 1>${log_out} 2>${log_err}
 	if [ $? -ne 0 ]; then
 		echo "failed: record $@"
-		echo "see log: ${log}"
+		echo "see log: ${log_err}"
 		exit 1
 	fi
 
-	check ${@: -1}
+	check $last
 
-	rm -f ${log}
+	rm -f ${log_out} ${log_err}
 	rm -rf ${build_id_dir}
 	rm -rf ${data}
 }
-- 
2.17.1

