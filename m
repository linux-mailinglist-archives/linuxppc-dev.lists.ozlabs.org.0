Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A6F5C051F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 19:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXlKK2NsQz3c8W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 03:10:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Spd2doT7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Spd2doT7;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXlHw30K9z300V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 03:09:00 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28LH8fhW016795;
	Wed, 21 Sep 2022 17:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7LCHwB5uvfYppDdSP/yVescePIr7gDhWrvC8IeSOuUM=;
 b=Spd2doT7XhvMMy/6ISc9s0mSYvgt06NFaJ/a3Dxf67tuDo1pJ6FotDElDuRsvhAa8ter
 enH+iqAxG5g3nXjOxvgx0Pd5va8bkU/YERX8pFDqOQnIV6JQxULsdQeNhGjz+IWQGHKS
 mnuYs1QTX+wa9q3PikgU7epID5pA0amh5iomOAsV4a+RkwnoLpzo8+zwaS+ZV1+wnjHM
 XLEwLTFfoPnQ7az9fcB6NotsZZf99BMxuushYBNhszw0DTAbUxKJFz35Fuh18u4sXnm3
 zWcc1eAwwzHcoRap0axOzUa+WeZG2KJrjxM+WfQ4n1aQhM7frxmByTzUUmwul39qArNM rw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jr6nq81ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 17:08:51 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28LH5HYi025981;
	Wed, 21 Sep 2022 17:08:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj5gjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 17:08:49 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28LH8kUJ54329638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 17:08:46 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E235A404D;
	Wed, 21 Sep 2022 17:08:46 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BE9FA4040;
	Wed, 21 Sep 2022 17:08:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.4.79])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 21 Sep 2022 17:08:43 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH 2/2] tools/perf/tests: Fix build id test check for PE file
Date: Wed, 21 Sep 2022 22:38:39 +0530
Message-Id: <20220921170839.21927-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
References: <20220921170839.21927-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1EC5ZKcRqT08vUJ0BUYFr5-T5OvEiP3h
X-Proofpoint-GUID: 1EC5ZKcRqT08vUJ0BUYFr5-T5OvEiP3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_09,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 phishscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209210116
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

Perf test "build id cache operations" fails for PE
executable.  Logs below from powerpc system.
Same is observed on x86 as well.

<<>>
Adding 5a0fd882b53084224ba47b624c55a469 ./tests/shell/../pe-file.exe: Ok
build id: 5a0fd882b53084224ba47b624c55a469
link: /tmp/perf.debug.w0V/.build-id/5a/0fd882b53084224ba47b624c55a469
file: /tmp/perf.debug.w0V/.build-id/5a/../../root/athira/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf
failed: file /tmp/perf.debug.w0V/.build-id/5a/../../root/athira/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf does not exist
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

ls /tmp/perf.debug.w0V/.build-id/5a/../../root/athira/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf | xargs stat --printf "%n %A \n"
/tmp/perf.debug.w0V/.build-id/5a/../../root/athira/linux/tools/perf/tests/pe-file.exe/5a0fd882b53084224ba47b624c55a469/elf -rw-r--r--

Fix the test to match with the permission of original file in
case of FE file. ie if the "tests/pe-file.exe" file is not
having exec permission, just check for existence of the buildid
file using [ ! -e <file> ]

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/tests/shell/buildid.sh | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/buildid.sh b/tools/perf/tests/shell/buildid.sh
index 3512c4423d48..75f5117c3417 100755
--- a/tools/perf/tests/shell/buildid.sh
+++ b/tools/perf/tests/shell/buildid.sh
@@ -77,7 +77,20 @@ check()
 	file=${build_id_dir}/.build-id/$(echo ${id}|cut -c 1-2)/`readlink ${link}`/elf
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
2.17.1

