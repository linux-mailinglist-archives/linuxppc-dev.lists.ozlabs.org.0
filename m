Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEDC74C701
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jul 2023 20:30:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i/jfzfOw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzbL8449zz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 04:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i/jfzfOw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzbHG3dX6z30dp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 04:28:26 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 369IHODo003462;
	Sun, 9 Jul 2023 18:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=RT7wtVMWrCf4n9QG8OOQIvHbsnUjTUr1CnbadvSDrBw=;
 b=i/jfzfOwZwqXvxFhrS6mZdjh1p9LSCGilxFmOuB+nFZKDacQoOsw3Ba26H5916/8kriJ
 WPRO0EYqn6h1Ifz+r9DClPbOFusfMQZd6fCutk4x2huRQ9RgknUmqkvr6bgrvgcmq6Xy
 6BuFsWfdzDp+abH1bVxMMbqnSU7bhATbWxlccN281IesJinmJYhk265UVYmyrmX/msEw
 XdYU3JdoP7MnpAoSJHzDXs2SZu5xmPYFn86RNtqXpjm0G9hrjlXXml6LrdGWde1ypCKu
 0edAYmF8AnCH5EOI5PbqviUMwOSFJx6j8rbsXssszHNwvqN3EYCVQdraFkafEQA3zh++ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21nr3n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:12 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 369IHblF004214;
	Sun, 9 Jul 2023 18:28:12 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rr21nr3mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:12 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 369CmpvO012478;
	Sun, 9 Jul 2023 18:28:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3rpye58mqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jul 2023 18:28:10 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 369IS6sx22020694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 9 Jul 2023 18:28:07 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C4DDE2005A;
	Sun,  9 Jul 2023 18:28:06 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93B8A2004B;
	Sun,  9 Jul 2023 18:28:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.24.202])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  9 Jul 2023 18:28:04 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, irogers@google.com, namhyung@kernel.org
Subject: [PATCH V2 00/26] tools/perf: Fix shellcheck coding/formatting issues of perf tool shell scripts
Date: Sun,  9 Jul 2023 23:57:34 +0530
Message-Id: <20230709182800.53002-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: fb6vIpj1__yR6buMCDvno-hwHkRTzZXi
X-Proofpoint-GUID: ZJqTWcx6Lx62E2UwKrzMTz0MfcsoIcfT
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
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

The shellcheck is run for severity level for errors and warnings.
Command used:

# for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
# echo $?
0

Changelog:
v1 -> v2:
  - Rebased on top of perf-tools-next from:
  https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git/log/?h=perf-tools-next

  - Fixed shellcheck errors and warnings reported for newly
    added changes from perf-tools-next branch

  - Addressed review comment from James clark for patch 
    number 13 from V1. The changes in patch 13 were not necessary
    since the file "tests/shell/lib/coresight.sh" is sourced from
    other test files.

Akanksha J N (1):
  tools/perf/tests: Fix shellcheck warnings for
    trace+probe_vfs_getname.sh

Athira Rajeev (14):
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
  tools/perf/tests: Fix the shellcheck warnings in lib/waiting.sh
  tools/perf/trace: Fix x86_arch_prctl.sh to address shellcheck warnings
  tools/perf/arch/x86: Fix syscalltbl.sh to address shellcheck warnings
  tools/perf/tests/shell: Fix the shellcheck warnings in
    record+zstd_comp_decomp.sh
  tools/perf/tests/shell: Fix shellcheck warning for stat+std_output.sh
    testcase
  tools/perf/tests: Fix shellcheck warning for stat+std_output.sh
    testcase

Kajol Jain (11):
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
  tools/perf/tests: Fix shellcheck warning for probe.sh shell script
  tools/perf/trace: Fix shellcheck issue for arch_errno_names.sh script
  tools/perf: Fix shellcheck issue for check-headers.sh script
  tools/shell/coresight: Fix shellcheck warning for
    thread_loop_check_tid_2.sh shell script
  tools/perf/tests/shell/lib: Fix shellcheck warning for stat_output.sh
    shell script

 .../arch/x86/entry/syscalls/syscalltbl.sh     |  2 +-
 tools/perf/check-headers.sh                   |  6 ++--
 .../tests/shell/coresight/asm_pure_loop.sh    |  2 +-
 .../shell/coresight/memcpy_thread_16k_10.sh   |  2 +-
 .../coresight/thread_loop_check_tid_10.sh     |  2 +-
 .../coresight/thread_loop_check_tid_2.sh      |  2 +-
 .../shell/coresight/unroll_loop_thread_10.sh  |  2 +-
 tools/perf/tests/shell/lib/probe.sh           |  1 +
 .../perf/tests/shell/lib/probe_vfs_getname.sh |  5 ++--
 tools/perf/tests/shell/lib/stat_output.sh     |  1 +
 tools/perf/tests/shell/lib/waiting.sh         |  1 +
 tools/perf/tests/shell/lock_contention.sh     | 12 ++++----
 tools/perf/tests/shell/probe_vfs_getname.sh   |  4 +--
 .../tests/shell/record+zstd_comp_decomp.sh    | 14 +++++-----
 tools/perf/tests/shell/record_offcpu.sh       |  6 ++--
 tools/perf/tests/shell/stat+csv_output.sh     |  2 +-
 tools/perf/tests/shell/stat+csv_summary.sh    |  4 +--
 tools/perf/tests/shell/stat+shadow_stat.sh    |  4 +--
 tools/perf/tests/shell/stat+std_output.sh     |  3 +-
 tools/perf/tests/shell/stat_bpf_counters.sh   |  4 +--
 .../tests/shell/stat_bpf_counters_cgrp.sh     | 28 ++++++++-----------
 tools/perf/tests/shell/test_arm_spe_fork.sh   |  2 +-
 .../shell/test_perf_data_converter_json.sh    |  2 +-
 .../tests/shell/trace+probe_vfs_getname.sh    |  6 ++--
 tools/perf/trace/beauty/arch_errno_names.sh   | 15 ++++------
 tools/perf/trace/beauty/x86_arch_prctl.sh     |  6 ++--
 26 files changed, 67 insertions(+), 71 deletions(-)

-- 
2.39.1

