Return-Path: <linuxppc-dev+bounces-2230-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E27599D390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 17:39:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XS1cl5pFTz2xjN;
	Tue, 15 Oct 2024 02:39:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728920375;
	cv=none; b=Xf1q3eaEznzAyBHJut9i+LveehwNEn5Azjn/cZaxfJ7/6rFsNDdONVaseb5y+gxw0CqtsETOFThH+1gD7JGwY4dZJrPmAx/JjPRIC5uBiPbIVRVKHsBuwF5OKWQvJjQvt1TS8jTm8Mdugh7mUetlpqjJb4KaDr8ltokvDpTEeGE3JSeVEsuMX4Baw6yF7e+EBIgaIpWHsOH+/8Al5VUuThJSjTF535gAYd/Lyk593lrmPW6tdjv8n81ydBiH0xzaULdgwMuQm1v19b6Oqa7oqWUduKxlVL0S30nc+tOOZlO2lp31A6hNoXT3S26+VqLhTR/KIHH+6mfgf+x8MkzSRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728920375; c=relaxed/relaxed;
	bh=nopFvKMBtV8dIo5tbLzKM/+vo8NRhskTLxcRh8utwhU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=PaKv03RyLNPqUfk2eHeTSV2iqG0/q3Zcu2xzdY9gW45O46Re6cFdnYfJFfIGjKlz7yXpOF+lNaifatKCFR3inxrUkCSPJ06LMAq2byYNrX+kFSunYKFbFuZsBq/6g9ydus7HlNrKOGgxuLgyHE9NysKyq9tSNRvOaPR29ScDJ45M9vlHaDRJFdnIiDXWQb2P5Zz7SQ2PZTWDVDEl596fgNQg2qQt+sDabvzFnG76bTtbviYOeSnzy/vdVnYIKDl9chXdKF9VE6kndNNnr5rkBUi9+u5DW4Fx2gkXIPE9jeJFk5yGFCMkdY2WesuY0d1kQ+S9U6PRavQwgxSH6yjxBA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AnuhTzIA; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AnuhTzIA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XS1ck2v3nz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 02:39:33 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EFJOmK032411;
	Mon, 14 Oct 2024 15:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=pp1; bh=nopFvKMBtV8dIo5tbLzKM/+vo8
	NRhskTLxcRh8utwhU=; b=AnuhTzIA/7dbKHNiHm0hjw3wdI5xDlqqwLWBwt3Aa2
	MdKTO9+FqBY4l4jPgNqkCQ8bnorlgTbuEnpztbCsqPakpWfM/z+xadPVM+5T5eiw
	QZd8knQzDjfDuxK0BBSuO+4tcx8RQvvAMpOVqjWSuo464Lfs0Bu9yxenF9/GIKLM
	of3RMAN2+v1G+LXNSsvbc0e1JhlbuQ67GaTHLqVjN44BEAkyR7k81/kKLC1+qTmZ
	ri14VMJH0AuQENfPhr2G1H2ycNJUaHSF0mR/Ifz6e8KeYlL0H+JiRCMAqKq+H9Z7
	xJyCdY93PVQicDb0loJk+nh6vt6GnBDgNdixF8Lva5tA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4295ub8355-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:39:26 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49EFdPup018326;
	Mon, 14 Oct 2024 15:39:25 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4295ub8352-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:39:25 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49EErfGX002452;
	Mon, 14 Oct 2024 15:39:25 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4284emfagf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 15:39:25 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EFdLrS52101426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 15:39:21 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4234320049;
	Mon, 14 Oct 2024 15:39:21 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC6C720040;
	Mon, 14 Oct 2024 15:39:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.242.183])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 15:39:15 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com
Subject: [PATCH] tools/perf/tests/base_probe: Fix check for the count of existing probes in test_adding_kernel
Date: Mon, 14 Oct 2024 21:09:10 +0530
Message-Id: <20241014153910.85536-1-atrajeev@linux.vnet.ibm.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yYvOghp3YKTk2R1UeTm2MF2Ifut39zFv
X-Proofpoint-GUID: _Xx-b53Yk06BLv2THatpX2scuhjLdZHl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410140113
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_NONE autolearn=disabled version=4.0.0
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


