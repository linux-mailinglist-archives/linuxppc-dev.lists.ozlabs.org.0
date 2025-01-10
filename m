Return-Path: <linuxppc-dev+bounces-4968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C5EA08C84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 10:43:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTxYd58qPz3cC6;
	Fri, 10 Jan 2025 20:43:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736502229;
	cv=none; b=fRB3pEqfkbPrijBfdfa5bFsKbEYUwWij3JHjlTJ3Smwe86PfSu4inlXSk+SsOpAfTzrwcl2RBLwFBVDgw0LxcWUXmxI9bj03btjFFBiWkpf0enA6cfFKE9MmNuG/BAPV6ppv/RLv1CJfkLp3Yu0ew6YY2ZeY5n9g4Uzd3JBXCzeJttxjMz3Puu4aS6vqG643WiS/G+ABW7MmidHLFaLcZmOGXCTXjSY3Y5rN6JHqiD96liK/v01eu/+Dtv93SDOHsG+ssamkPBiHyKkx0wzb0zGNU/eGXnB8xGV3vViNJpWLby69gIC50YOd5i0vxwOO9MWpfrprNinizGogtTLBmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736502229; c=relaxed/relaxed;
	bh=Q15Qs22smqoIRdd57Er+BBVsac7oQoNNAeF9ajmNHjk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=LIFluEXwSQINVCEPKNyA0bFS0RD7KMO33MBbRYD2HrqBOcvpXxVITpGa0DCODeKp8U/ZFiA9cOg25S0uQxSWrfXtK7QaOR1u0ydBIokiEdMec9a0sm9u4tWv3AxrAf8U7zMvGW+h43b0tLu1p2XWMcI17JvpZMygqVsII2luKNW2uaF2Jr4PXWvZp5F3qW9DebesraabmuCGiTX2oQVpHPEGlcMbRGiEU2v14Y9uHR64CGH/50ZsN+2b04i4lCwh/JRzyFehvD3O8FwrqbvcOWuJzqOJkdKw5F1NuuGpn7yMDQO2hRwdQjTYantTZkjMd4T7ddOzU+6Sx8/gkUN0vg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9ivZtts; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9ivZtts;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTxYc3fL2z3cBk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 20:43:48 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509NaGfW018158;
	Fri, 10 Jan 2025 09:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Q15Qs22smqoIRdd57Er+BBVsac7o
	QoNNAeF9ajmNHjk=; b=a9ivZtts+eZCel7EAVYBohbqWBrjA+zQfuQvLmEME+FW
	5xiiLM6Mqxzq4AUSR/6D5LYHgMaPaswBlpxlsGMzzaKLl8cKLlsL94SBWViJydxx
	M0iOTwo9lRnq+2elhrl8/cOoH3tobBfLFsosY85uMQTHcJS/nRltWRUnJBvZbmew
	Ls2gqLLxqEeYf0/4hdNvFyLSrNGfSUKSU5lv4+TCMjB8aVZ0Iwpabw5HqgyyyTW7
	6ClqykijLbTZI1AxkO8TnkAlcg7X+TvwzxkrjyQxnsQsV4h6qbkU9iWbYCnr7KGI
	gx7pRSyDNKxriP1u+1wM9oZPqHe86FjBuoJ2qAEPlQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442r9asw7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:43:39 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A9efm3013605;
	Fri, 10 Jan 2025 09:43:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442r9asw7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:43:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A9NEBg008974;
	Fri, 10 Jan 2025 09:43:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43yfq09q3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:43:38 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A9hYwl21037528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 09:43:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 564FB2004B;
	Fri, 10 Jan 2025 09:43:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00C2F20040;
	Fri, 10 Jan 2025 09:43:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.241.17])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jan 2025 09:43:27 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, vmolnaro@redhat.com,
        mpetlan@redhat.com
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH V2] tools/perf/tests/base_probe: Fix check for the count of existing probes in test_adding_kernel
Date: Fri, 10 Jan 2025 15:13:24 +0530
Message-Id: <20250110094324.94604-1-atrajeev@linux.vnet.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XgF3CVrlekrAvSZ0E1Ww3Ry2vnMElDRM
X-Proofpoint-ORIG-GUID: l2G_PTBcpE4blZkPYnPmoCQgJMFNnW34
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100078
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perftool-testsuite_probe fails in test_adding_kernel as below:
	Regexp not found: "probe:inode_permission_11"
	-- [ FAIL ] -- perf_probe :: test_adding_kernel :: force-adding probes ::
	second probe adding (with force) (output regexp parsing)
	event syntax error: 'probe:inode_permission_11'
	  \___ unknown tracepoint

	Error:  File /sys/kernel/tracing//events/probe/inode_permission_11
	not found.
	Hint:   Perhaps this kernel misses some CONFIG_ setting to
	enable this feature?.

The test does the following:
1) Adds a probe point first using :
    $CMD_PERF probe --add $TEST_PROBE
2) Then tries to add same probe again without —force
and expects it to fail. Next tries to add same probe again
with —force. In this case, perf probe succeeds and adds
the probe with a suffix number. Example:

 ./perf probe --add inode_permission
 Added new event:
  probe:inode_permission (on inode_permission)

 ./perf probe --add inode_permission --force
 Added new event:
  probe:inode_permission_1 (on inode_permission)

  ./perf probe --add inode_permission --force
 Added new event:
  probe:inode_permission_2 (on inode_permission)

Each time, suffix is added to existing probe name.
To get the suffix number, test cases uses :
NO_OF_PROBES=`$CMD_PERF probe -l | wc -l`

This will work if there is no other probe existing
in the system. If there are any other probes other than
kernel probes or inode_permission, ( example: any probe),
"perf probe -l" will include count for other probes too.

Example, in the system where this failed, already some
probes were default added. So count became 10
  ./perf probe -l | wc -l
  10

So to be specific for "inode_permission", restrict the
probe count check to that probe point alone using :
NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`

Similarly while removing the probe using "probe --del *",
( removing all probes ), check uses:

 ../common/check_all_lines_matched.pl "Removed event: probe:$TEST_PROBE"

But if there are other probes in the system, the log will
contain reference to other existing probe too. Hence change
usage of check_all_lines_matched.pl to check_all_patterns_found.pl
This will make sure expecting string comes in the result

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v1 -> v2:
 No code changes. After being reviewed by Michael Petlan, since
 initial patch was posted in 2024-10-14, rebased on top of latest
 perf-tools-next

 tools/perf/tests/shell/base_probe/test_adding_kernel.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
index d541ffd44a93..f8b5f096d0d7 100755
--- a/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
+++ b/tools/perf/tests/shell/base_probe/test_adding_kernel.sh
@@ -169,7 +169,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "force-adding probes :: second pr
 (( TEST_RESULT += $? ))
 
 # adding existing probe with '--force' should pass
-NO_OF_PROBES=`$CMD_PERF probe -l | wc -l`
+NO_OF_PROBES=`$CMD_PERF probe -l $TEST_PROBE| wc -l`
 $CMD_PERF probe --force --add $TEST_PROBE 2> $LOGS_DIR/adding_kernel_forceadd_03.err
 PERF_EXIT_CODE=$?
 
@@ -205,7 +205,7 @@ print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "using doubled probe"
 $CMD_PERF probe --del \* 2> $LOGS_DIR/adding_kernel_removing_wildcard.err
 PERF_EXIT_CODE=$?
 
-../common/check_all_lines_matched.pl "Removed event: probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < $LOGS_DIR/adding_kernel_removing_wildcard.err
+../common/check_all_patterns_found.pl "Removed event: probe:$TEST_PROBE" "Removed event: probe:${TEST_PROBE}_1" < $LOGS_DIR/adding_kernel_removing_wildcard.err
 CHECK_EXIT_CODE=$?
 
 print_results $PERF_EXIT_CODE $CHECK_EXIT_CODE "removing multiple probes"
-- 
2.43.5


