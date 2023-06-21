Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3535737D43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 10:31:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hqwATilb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QmGtr4b6zz3bbt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 18:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hqwATilb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QmGsw0bcMz30GX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 18:30:43 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35L8H1ar026697;
	Wed, 21 Jun 2023 08:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ZDQLsb8BEWRYzVeTmcqVrjmHeKSTjv1ohcrasF0hy+k=;
 b=hqwATilbW/EBrwikZrSiNeTrkOon7htd3Ln6YMVrrtF6/aDYkUlX31LTkN5BsZ/QevnR
 3N3jD/oVuOBRo787bU6Jt2HAisqYgHOy53ePjtWr8Sqte6M2gA/ISgbxLwxIbIrtjn/2
 1oQWKVqpdp+1aB2JrivUTmkcrKlroivLaajYUiPoPyubsYfZFbk0PphWPM7UEenxTF4b
 q2jw3ivdJHaG93vaak/NrG9qsJ88ojgOs7Ts4CTtYyvaxhGlYMD3hKdBx7gfa4js9CKg
 Oj2Twtpp80gz8UvIhUSzj5dMLL7kExwNtt9T2rdzXSoyPwJmB8ljcAHPfIyIR5oh4aRu dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwj908qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:36 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35L8Jvko005636;
	Wed, 21 Jun 2023 08:30:35 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rbwj908nt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:35 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35L0ndLu010614;
	Wed, 21 Jun 2023 08:30:33 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r943e2msa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jun 2023 08:30:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35L8UTE816581280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jun 2023 08:30:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E27C2004B;
	Wed, 21 Jun 2023 08:30:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 89F2220043;
	Wed, 21 Jun 2023 08:30:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.109.215.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 21 Jun 2023 08:30:26 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org,
        ravi.bangoria@amd.com, john.g.garry@oracle.com
Subject: [PATCH 00/22] tools/perf: Fix shellcheck coding/formatting issues of perf tool shell scripts
Date: Wed, 21 Jun 2023 13:59:59 +0530
Message-Id: <20230621083021.71203-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bB6XlXujfsJ5j7woIEDyT8CvRz2-sJ7M
X-Proofpoint-GUID: 6Wl15pRmLOSD6AUUZ3YabIhIlQIGyIBO
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-21_05,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306210067
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

Patchset covers a set of fixes for coding/formatting issues observed while
running shellcheck tool on the perf shell scripts.

This cleanup is a pre-requisite to include a build option for shellcheck
discussed here: https://www.spinics.net/lists/linux-perf-users/msg25553.html
First set of patches were posted here:
https://lore.kernel.org/linux-perf-users/53B7D823-1570-4289-A632-2205EE2B522C@linux.vnet.ibm.com/T/#t

This patchset covers remaining set of shell scripts which needs
fix. Patch 1 is resubmission of patch 6 from the initial series.
Patch 15, 16 and 22 touches code from tools/perf/trace/beauty.
Other patches are fixes for scripts from tools/perf/tests.

Akanksha J N (1):
  tools/perf/tests: Fix shellcheck warnings for
    trace+probe_vfs_getname.sh

Athira Rajeev (11):
  tools/perf/tests: fix test_arm_spe_fork.sh signal case issues
  tools/perf/tests: Fix unused variable references in
    stat+csv_summary.sh testcase
  tools/perf/tests: fix shellcheck warning for
    test_perf_data_converter_json.sh testcase
  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters.sh
    testcase
  tools/perf/tests: Fix shellcheck issues in
    tests/shell/stat+shadow_stat.sh tetscase
  tools/perf/tests: Fix shellcheck warnings for
    thread_loop_check_tid_10.sh
  tools/perf/tests: Fix shellcheck warnings for unroll_loop_thread_10.sh
  tools/perf/tests: Fix shellcheck warnings for lib/probe_vfs_getname.sh
  tools/perf/tests: Fix the shellcheck wanrings in lib/waiting.sh
  tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
  tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings

Kajol Jain (10):
  tools/perf/tests: Fix shellcheck warning for probe_vfs_getname.sh
    testcase
  tools/perf/tests: Fix shellcheck warning for record_offcpu.sh testcase
  tools/perf/tests: Fix shellcheck issue for lock_contention.sh testcase
  tools/perf/tests: Fix shellcheck issue for stat_bpf_counters_cgrp.sh
    testcase
  tools/perf/tests: Fix shellcheck warning for asm_pure_loop.sh shell
    script
  tools/perf/tests: Fix shellcheck warning for memcpy_thread_16k_10.sh
    shell script
  tools/perf/tests: Fix shellcheck warning for coresight.sh shell script
  tools/perf/tests: Fix shellcheck warning for probe.sh shell script
  tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
  tools/perf: Fix shellcheck issue for check-headers.sh script

 .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
 tools/perf/check-headers.sh                   |  6 ++--
 .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
 .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
 .../coresight/thread_loop_check_tid_10.sh     |  2 +-
 .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
 tools/perf/tests/shell/lib/coresight.sh       |  3 +-
 tools/perf/tests/shell/lib/probe.sh           |  1 +
 .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
 tools/perf/tests/shell/lib/waiting.sh         |  1 +
 tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
 tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
 tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
 tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
 tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
 tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
 .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
 tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
 .../shell/test_perf_data_converter_json.sh    |  2 +-
 .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
 tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
 tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
 22 files changed, 58 insertions(+), 61 deletions(-)

-- 
2.39.1

