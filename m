Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B87066B6C4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 06:02:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwKf619Klz3cdB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 16:02:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jR1wZkMi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jR1wZkMi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwKd70gYdz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 16:02:02 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30G2M525030325;
	Mon, 16 Jan 2023 05:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WnqHynCU2yo8nBVT1xHmuQLaLFaLfnDWykbf2G06emc=;
 b=jR1wZkMiDNptUgrZhoE2k4PqMMzlT5u95o7IZsEY4TqUyhm8N9CPCUuVtj8jF0E39YEm
 UvH6KUUdiY/qMjQT+PH20MzKe5kT9/kAcamLinw3kmcGXCsoeKqMWLBGK8eN3tnFUE+0
 DIzCntwoXBCKazYlLeHSQ1yBJ/3m5s9/w0GoQ59LHfVSnnmyyq84ZZJkneJfh2ZjK84l
 XDl4TBKILrxOUnrXz+MKxG/M4AmIcr8S4eWC2KtmNCDZWpEPOpGDuK6X/L5iTTjtOx9w
 fumggZCHMM5oaCG+/cVXACw2wWd2HJb0KS+/VAL1n85i0mQUmoc1v32je/uBCrJZVTjR iA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n48y5c4a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:01:44 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30G4p6vd020923;
	Mon, 16 Jan 2023 05:01:44 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n48y5c49k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:01:44 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30G1NBtf007923;
	Mon, 16 Jan 2023 05:01:42 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3n3knfhx5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Jan 2023 05:01:42 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30G51ddt45547896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 05:01:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7A8520040;
	Mon, 16 Jan 2023 05:01:38 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4BF982004E;
	Mon, 16 Jan 2023 05:01:36 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.122.245])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Jan 2023 05:01:36 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org
Subject: [PATCH 2/2] tools/perf/tests: Fix build id test check for PE file
Date: Mon, 16 Jan 2023 10:31:31 +0530
Message-Id: <20230116050131.17221-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230116050131.17221-1-atrajeev@linux.vnet.ibm.com>
References: <20230116050131.17221-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c7vFXqaNjn1dTtVWjpP0f3C-2ka8wDky
X-Proofpoint-ORIG-GUID: z6-AFH0F02N0swIbOwsA2FZffLf1xkhG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-16_02,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301160033
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
Cc: irogers@google.com, ak@linux.intel.com, rnsastry@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, james.clark@arm.com, kjain@linux.ibm.com, namhyung@kernel.org, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Perf test "build id cache operations" fails for PE
executable.  Logs below from powerpc system.
Same is observed on x86 as well.

<<>>
Adding 5a0fd882b53084224ba47b624c55a469 ./tests/shell/../pe-file.exe: Ok
build id: 5a0fd882b53084224ba47b624c55a469
link: /tmp/perf.debug.w0V/.build-id/5a/0fd882b53084224ba47b624c55a469
file: /tmp/perf.debug.w0V/.build-id/5a/../../root/<user>/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf
failed: file /tmp/perf.debug.w0V/.build-id/5a/../../root/<user>/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf does not exist
test child finished with -1
---- end ----
build id cache operations: FAILED!
<<>>

The test tries to do:

<<>>
mkdir /tmp/perf.debug.TeY1
perf --buildid-dir /tmp/perf.debug.TeY1 buildid-cache -v -a ./tests/shell/../pe-file.exe
<<>>

The option "--buildid-dir" sets the build id cache
directory as /tmp/perf.debug.TeY1. The option given
to buildid-cahe, ie "-a ./tests/shell/../pe-file.exe",
is to add the pe-file.exe to the cache. The testcase,
sets buildid-dir and adds the file: pe-file.exe to build
id cache. To check if the command is run successfully,
"check" function looks for presence of the file in buildid
cache directory. But the check here expects the added
file to be executable. Snippet below:

<<>>
if [ ! -x $file ]; then
	echo "failed: file ${file} does not exist"
	exit 1
fi
<<>>

Buildid test is done for sha1 binary, md5 binary and also
for PE file. The firt two binaries are created at runtime
by compiling with "--build-id" option and hence the check
for sha1/md5 test should use [ ! -x ]. But in case of PE
file, the permission for this input file is rw-r--r--
Hence the file added to build id cache has same permissoin

Original file:
ls tests/pe-file.exe | xargs stat --printf "%n %A \n"
tests/pe-file.exe -rw-r--r--

buildid cache file:

ls /tmp/perf.debug.w0V/.build-id/5a/../../root/<user>/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf | xargs stat --printf "%n %A \n"
/tmp/perf.debug.w0V/.build-id/5a/../../root/<user>/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf -rw-r--r--

Fix the test to match with the permission of original file in
case of FE file. ie if the "tests/pe-file.exe" file is not
having exec permission, just check for existence of the buildid
file using [ ! -e <file> ]

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/buildid.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
index f05670d1e39e..22e5b2225abe 100755
--- a/tools/perf/tests/shell/buildid.sh
+++ b/tools/perf/tests/shell/buildid.sh
@@ -77,7 +77,20 @@ check()
 	file=${build_id_dir}/.build-id/${id:0:2}/`readlink ${link}`/elf
 	echo "file: ${file}"
 
-	if [ ! -x $file ]; then
+	# Check for file permission of orginal file
+	# in case of pe-file.exe file
+	echo $1 | grep ".exe"
+	if [ $? -eq 0 ]; then
+		if [ -x $1  -a ! -x $file ]; then
+			echo "failed: file ${file} executable does not exist"
+			exit 1
+		fi
+
+		if [ ! -x $file -a ! -e $file ]; then
+			echo "failed: file ${file} does not exist"
+			exit 1
+		fi
+	elif [ ! -x $file ]; then
 		echo "failed: file ${file} does not exist"
 		exit 1
 	fi
-- 
2.31.1

