Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2AF190ADD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 14:22:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AU7dbtN2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W2pt343yzz3fxQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2024 22:22:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AU7dbtN2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W2psL2CSjz3fsH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2024 22:21:41 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAUAOW029547;
	Mon, 17 Jun 2024 12:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=le9S76vTlRn1tWalgExIm7rVoW
	9z4NJZfMgeQwexxIA=; b=AU7dbtN2WWur0MtUfCsm3UFJQjL5jbyoMcY1GEzlzq
	7uKMheOP6EAAruV6QuqUHV5TZKnn5l+LYlebPcTty64TnNdjrBz4MrWdU4IjgkRr
	gbpMNhw3C1DvEcPXoy7lNtVnTk/mN3kVBmT4Qv0lGLM4VOC+Y+z/l/jBWGpqdj9p
	K71wpIUBnAyrMU4x8w9mDSfVHwskC5SE78C5xhdKEUeZy+ZzJizCYEo0jzgViyVF
	f1YzTfEh6UgEjE5hDQw26M4jUtVzvkvvXR5uL7/E3F2W5ClugN87grIpx/RQvRrb
	LLf5bNgr0GLBhJ2wczesvUdDd1h3nYaArGv9T4l5NJ9A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytke688m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 12:21:34 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45HCLYQ7002161;
	Mon, 17 Jun 2024 12:21:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ytke688m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 12:21:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45HC2qu9011010;
	Mon, 17 Jun 2024 12:21:33 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yspsmsswf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 12:21:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45HCLRDd41419244
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2024 12:21:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 826FC20043;
	Mon, 17 Jun 2024 12:21:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACB7A20040;
	Mon, 17 Jun 2024 12:21:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.120.136])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Jun 2024 12:21:24 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH] tools/perf: Handle perftool-testsuite_probe testcases fail when kernel debuginfo is not present
Date: Mon, 17 Jun 2024 17:51:21 +0530
Message-Id: <20240617122121.7484-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0yb8LJq94yIHYtfgbqDMuS1Ki8KqcugS
X-Proofpoint-ORIG-GUID: LySWQPJ0JAqI6EJCL471a4XWoTzo5Azx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_10,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170092
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, akanksha@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Running "perftool-testsuite_probe" fails as below:

	./perf test -v "perftool-testsuite_probe"
	83: perftool-testsuite_probe  : FAILED

There are three fails:

1. Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
   -- [ FAIL ] -- perf_probe :: test_adding_kernel :: listing added probe :: perf probe -l (output regexp parsing)

2. Regexp not found: "probe:vfs_mknod"
   Regexp not found: "probe:vfs_create"
   Regexp not found: "probe:vfs_rmdir"
   Regexp not found: "probe:vfs_link"
   Regexp not found: "probe:vfs_write"
   -- [ FAIL ] -- perf_probe :: test_adding_kernel :: wildcard adding support (command exitcode + output regexp parsing)

3. Regexp not found: "Failed to find"
   Regexp not found: "somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
   Regexp not found: "in this function|at this address"
   Line did not match any pattern: "The /boot/vmlinux file has no debug information."
   Line did not match any pattern: "Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo package."

These three tests depends on kernel debug info.
1. Fail 1 expects file name along with probe which needs debuginfo
2. Fail 2 :
    perf probe -nf --max-probes=512 -a 'vfs_* $params'
    Debuginfo-analysis is not supported.
     Error: Failed to add events.

3. Fail 3 :
   perf probe 'vfs_read somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64'
   Debuginfo-analysis is not supported.
   Error: Failed to add events.

There is already helper function skip_if_no_debuginfo in
lib/probe_vfs_getname.sh which does perf probe and returns
"2" if debug info is not present. Use the skip_if_no_debuginfo
function and skip only the three tests which needs debuginfo
based on the result.

With the patch:

    83: perftool-testsuite_probe:
   --- start ---
   test child forked, pid 3927
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_permission ::
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_permission :: -a
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: adding probe inode_permission :: --add
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing added probe :: perf list
   Regexp not found: "\s*probe:inode_permission(?:_\d+)?\s+\(on inode_permission(?:[:\+][0-9A-Fa-f]+)?@.+\)"
   -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due to missing debuginfo :: testcase skipped
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: using added probe
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: deleting added probe
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: listing removed probe (should NOT be listed)
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: dry run :: adding probe
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes :: first probe adding
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes :: second probe adding (without force)
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: force-adding probes :: second probe adding (with force)
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: using doubled probe
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: removing multiple probes
   Regexp not found: "probe:vfs_mknod"
   Regexp not found: "probe:vfs_create"
   Regexp not found: "probe:vfs_rmdir"
   Regexp not found: "probe:vfs_link"
   Regexp not found: "probe:vfs_write"
   -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due to missing debuginfo :: testcase skipped
   Regexp not found: "Failed to find"
   Regexp not found: "somenonexistingrandomstuffwhichisalsoprettylongorevenlongertoexceed64"
   Regexp not found: "in this function|at this address"
   Line did not match any pattern: "The /boot/vmlinux file has no debug information."
   Line did not match any pattern: "Rebuild with CONFIG_DEBUG_INFO=y, or install an appropriate debuginfo package."
   -- [ SKIP ] -- perf_probe :: test_adding_kernel :: 2 2 Skipped due to missing debuginfo :: testcase skipped
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with retval :: add
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: function with retval :: record
   -- [ PASS ] -- perf_probe :: test_adding_kernel :: function argument probing :: script
   ## [ PASS ] ## perf_probe :: test_adding_kernel SUMMARY
   ---- end(0) ----
   83: perftool-testsuite_probe                                        : Ok

Only the three specific tests are skipped and remaining
ran successfully.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 .../shell/base_probe/test_adding_kernel.sh    | 31 +++++++++++++++++--
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
index 63bb8974b38e..187dc8d4b163 100755
--- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
+++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
@@ -21,8 +21,18 @@
 THIS_TEST_NAME=`basename $0 .sh`
 TEST_RESULT=0
 
+# shellcheck source=lib/probe_vfs_getname.sh
+. "$(dirname "$0")/../lib/probe_vfs_getname.sh"
+
 TEST_PROBE=${TEST_PROBE:-"inode_permission"}
 
+# set NO_DEBUGINFO to skip testcase if debuginfo is not present
+# skip_if_no_debuginfo returns 2 if debuginfo is not present
+skip_if_no_debuginfo
+if [ $? -eq 2 ]; then
+	NO_DEBUGINFO=1
+fi
+
 check_kprobes_available
 if [ $? -ne 0 ]; then
 	print_overall_skipped
@@ -67,7 +77,12 @@ PERF_EXIT_CODE=$?
 ../common/check_all_patterns_found.pl "\s*probe:${TEST_PROBE}(?:_\d+)?\s+\(on ${TEST_PROBE}(?:[:\+]$RE_NUMBER_HEX)?@.+\)" < $LOGS_DIR/adding_kernel_list-l.log
 CHECK_EXIT_CODE=$?
 
-print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added probe :: perf probe -l"
+if [ $NO_DEBUGINFO ] ; then
+	print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to missing debuginfo"
+else
+	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "listing added probe :: perf probe -l"
+fi
+
 (( TEST_RESULT += $? ))
 
 
@@ -208,7 +223,12 @@ PERF_EXIT_CODE=$?
 ../common/check_all_patterns_found.pl "probe:vfs_mknod" "probe:vfs_create" "probe:vfs_rmdir" "probe:vfs_link" "probe:vfs_write" < $LOGS_DIR/adding_kernel_adding_wildcard.err
 CHECK_EXIT_CODE=$?
 
-print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding support"
+if [ $NO_DEBUGINFO ] ; then
+	print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to missing debuginfo"
+else
+	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "wildcard adding support"
+fi
+
 (( TEST_RESULT += $? ))
 
 
@@ -232,7 +252,12 @@ CHECK_EXIT_CODE=$?
 ../common/check_no_patterns_found.pl "$RE_SEGFAULT" < $LOGS_DIR/adding_kernel_nonexisting.err
 (( CHECK_EXIT_CODE += $? ))
 
-print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing variable"
+if [ $NO_DEBUGINFO ]; then
+	print_testcase_skipped $NO_DEBUGINFO $NO_DEBUGINFO "Skipped due to missing debuginfo"
+else
+	print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "non-existing variable"
+fi
+
 (( TEST_RESULT += $? ))
 
 
-- 
2.35.3

