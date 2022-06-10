Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A620654677C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:42:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMZg4X5lz3by8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:42:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nhrgLDPa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nhrgLDPa;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMZ36QKXz30JK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:41:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AD7aBl029857;
	Fri, 10 Jun 2022 13:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=qwY5W8yPA9LPtVnpy7FG2dyNnL19Xkm683cyOhdONeQ=;
 b=nhrgLDPazkhvQ+upI5r7wBk4/PeIO3d6B35Bc13zQGE0wPRpBQ/pKBuQ8WwJlK5YIgf2
 bd6L8ioXXi5+wHN715A2QHtcZPaJSg6n4SLOM5jDa99mfa/PvqAiue9NClI3qXmmm1Vf
 cbbPTahazcgfFiq/dLhiG30DaG1tYmrZUjYcRA54g61XKObQRkajM81oySyPq4hWb9ce
 UIIUjGW5rt3IjlWrd4/feVZ66K0V53gQrGfPz2S1dNv6lQiUe1qXXEG1YpwtFB62ySW2
 Bp6MvjxmPl1qm9HoUGBpw0wLnbiyE7bP3DrqsPqCrjAB+mD5en6SYYNkKs9XYJEov0ib HA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm4vaaqbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADbJK9020295;
	Fri, 10 Jun 2022 13:41:23 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06fra.de.ibm.com with ESMTP id 3gfxnj6jf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:41:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADfKxJ15073592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:41:20 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AB3B5204E;
	Fri, 10 Jun 2022 13:41:20 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.7.130])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4396E5204F;
	Fri, 10 Jun 2022 13:41:17 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH V3 00/35] Add group constraints and event code test as part of selftest
Date: Fri, 10 Jun 2022 19:10:38 +0530
Message-Id: <20220610134113.62991-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XzAokcFRBUp4uhe4gjuxExk6Djg7REYt
X-Proofpoint-GUID: XzAokcFRBUp4uhe4gjuxExk6Djg7REYt
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100056
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch series extends the perf interface selftests
to cover scenarios for event code checking,
group constraints, and also thresholding/branch related
interface tests in sampling area.

In this series, patches 1 to 14 adds additional tests under
"powerpc/sampling_tests". These adds support for handling
sample type PERF_SAMPLE_BRANCH_STACK along with interrupt regs.
It adds utility functions and test for thresh_cmp and branch
filters programmed in control register. Some of the tests needs
to be skipped for "Generic Compat PMU" environment. Hence utility
functions are added in "include/utils.c" and "sampling_tests/misc.h"
to detect platform based on "auxv" entries.

Currently in other architectures (like x86), the pmu_name is
exposed via sysfs caps folder ie:
"sys/bus/event_source/devices/<pmu>/caps". But in powerpc,
"caps" is not supported. So, though the approach for detecting
compat mode currently uses auxv, patchset adds an
utility function considering a possibility of
getting "caps" added for powerpc.

Link to the patch to add support for caps under sysfs in powerpc:
http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=301270

Patches 15 to 35 covers test related to group constraints and event codes.
These new set of changes are added under new folder:
"selftests/powerpc/pmu/event_code_tests"

Patch 15 covers changes required for new folder with Makefile changes.
The other patches add tests for perf interface to check the event
group constraints, valid/invalid event codes, blacklisted events etc.
Also add required utility functions under header file "misc.h"
in sampling_tests folder.

Patch 13 of the patchset add selftest for mmcr1 pmcxsel/unit/cache fields,
which was initially dropeed from sampling test patchset (patch number: 16)

Link to the patch:
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220127072012.662451-17-kjain@linux.ibm.com/

Changelog:
v2 -> v3:
  Changed name for generic compat PMU to ISAv3
  in Patch2. This is based on recent patch sent by Joel
  Stanley to change name for generic_compat_pmu to ISAv3.
  http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=304131

v1 -> v2:
  Patch 12: Fixed bhrb_filter_map testcase to address build failure in
  distro like Ubuntu 16.04. This testcase uses perf branch sample
  types from include/uapi/linux/perf_event.h and three of the sample
  types are not defined in Ubuntu 16.04. Hence changed the logic to
  loop over values from PERF_SAMPLE_BRANCH_USER_SHIFT to
  PERF_SAMPLE_BRANCH_MAX_SHIFT as suggested by Michael Ellerman.

  Patch 2: The sampling_tests/misc.c used pmu_name for generic compat pmu
  as generic_compat_pmu. But latest version of patch to expose caps
  in powerpc will use power_pmu->name. So change the pmu name in
  misc code as GENERIC_COMPAT ( which is what pmu->name uses in driver
  code).

Link to linuxppc-ci:
https://github.com/athira-rajeev/linux-ci/actions?query=branch%3Aselftest_v5_set2

Athira Rajeev (20):
  testing/selftests/powerpc: Add support to fetch "platform" and "base
    platform" from auxv to detect platform.
  selftest/powerpc/pmu: Refactor the platform check and add macros to
    find array size/PVR
  selftest/powerpc/pmu: Add selftest to check branch stack enablement
    will not crash on any platforms
  selftest/powerpc/pmu: Add selftest to check PERF_SAMPLE_REGS_INTR
    option will not crash on any platforms
  selftest/powerpc/pmu: Add selftest for checking valid and invalid bhrb
    filter maps
  selftest/powerpc/pmu: Add selftest for mmcr1 pmcxsel/unit/cache fields
  selftest/powerpc/pmu: Add support for perf event code tests
  selftest/powerpc/pmu: Add selftest for group constraint check for PMC5
    and PMC6
  selftest/powerpc/pmu: Add selftest to check PMC5/6 is excluded from
    some constraint checks
  selftest/powerpc/pmu: Add selftest to check constraint for number of
    counters in use.
  selftest/powerpc/pmu: Add selftest for group constraint check when
    using same PMC
  selftest/powerpc/pmu: Add selftest for group constraint check for
    radix_scope_qual field
  selftest/powerpc/pmu: Add selftest for group constraint for MMCRA
    Sampling Mode field
  selftest/powerpc/pmu: Add selftest for group constraint check MMCRA
    sample bits
  selftest/powerpc/pmu: Add selftest for checking invalid bits in event
    code
  selftest/powerpc/pmu: Add selftest for reserved bit check for MMCRA
    thresh_ctl field
  selftest/powerpc/pmu: Add selftest for blacklist events check in
    power9
  selftest/powerpc/pmu: Add selftest for event alternatives for power9
  selftest/powerpc/pmu: Add selftest for event alternatives for power10
  selftest/powerpc/pmu: Add selftest for PERF_TYPE_HARDWARE events valid
    check

Kajol Jain (15):
  selftest/powerpc/pmu: Add mask/shift bits for extracting threshold
    compare field
  selftest/powerpc/pmu: Add interface test for mmcra_thresh_cmp fields
  selftest/powerpc/pmu: Add support for branch sampling in get_intr_regs
    function
  selftest/powerpc/pmu: Add interface test for mmcra_ifm field of
    indirect call type
  selftest/powerpc/pmu: Add interface test for mmcra_ifm field for any
    branch type
  selftest/powerpc/pmu: Add interface test for mmcra_ifm field for
    conditional branch type
  selftest/powerpc/pmu: Add interface test for bhrb disable field
  selftest/powerpc/pmu: Add interface test for bhrb disable field for
    non-branch samples
  selftest/powerpc/pmu: Add selftest for group constraint check for
    MMCR0 l2l3_sel bits
  selftest/powerpc/pmu: Add selftest for group constraint check for
    MMCR1 cache bits
  selftest/powerpc/pmu: Add selftest for group constraint check for
    MMCRA thresh_cmp field
  selftest/powerpc/pmu: Add selftest for group constraint for unit and
    pmc field in p9
  selftest/powerpc/pmu: Add selftest for group constraint check for
    MMCRA thresh_ctl field
  selftest/powerpc/pmu: Add selftest for group constraint check for
    MMCRA thresh_sel field
  selftest/powerpc/pmu: Add test for hardware cache events

 tools/testing/selftests/powerpc/include/reg.h |   4 +
 .../testing/selftests/powerpc/include/utils.h |  10 ++
 tools/testing/selftests/powerpc/pmu/Makefile  |  11 +-
 .../selftests/powerpc/pmu/branch_loops.S      |  28 ++++
 .../powerpc/pmu/event_code_tests/Makefile     |  15 ++
 .../blacklisted_events_test.c                 | 132 +++++++++++++++++
 .../event_alternatives_tests_p10.c            | 109 ++++++++++++++
 .../event_alternatives_tests_p9.c             | 116 +++++++++++++++
 .../generic_events_valid_test.c               | 130 +++++++++++++++++
 .../group_constraint_cache_test.c             |  60 ++++++++
 .../group_constraint_l2l3_sel_test.c          |  64 +++++++++
 .../group_constraint_mmcra_sample_test.c      |  54 +++++++
 .../group_constraint_pmc56_test.c             |  63 ++++++++
 .../group_constraint_pmc_count_test.c         |  70 +++++++++
 .../group_constraint_radix_scope_qual_test.c  |  56 ++++++++
 .../group_constraint_repeat_test.c            |  56 ++++++++
 .../group_constraint_thresh_cmp_test.c        |  96 +++++++++++++
 .../group_constraint_thresh_ctl_test.c        |  64 +++++++++
 .../group_constraint_thresh_sel_test.c        |  63 ++++++++
 .../group_constraint_unit_test.c              |  74 ++++++++++
 .../group_pmc56_exclude_constraints_test.c    |  64 +++++++++
 .../hw_cache_event_type_test.c                |  88 ++++++++++++
 .../invalid_event_code_test.c                 |  67 +++++++++
 ...eserved_bits_mmcra_sample_elig_mode_test.c |  77 ++++++++++
 .../reserved_bits_mmcra_thresh_ctl_test.c     |  44 ++++++
 .../powerpc/pmu/sampling_tests/Makefile       |   7 +-
 .../pmu/sampling_tests/bhrb_filter_map_test.c | 105 ++++++++++++++
 .../bhrb_no_crash_wo_pmu_test.c               |  59 ++++++++
 .../intr_regs_no_crash_wo_pmu_test.c          |  57 ++++++++
 .../powerpc/pmu/sampling_tests/misc.c         | 135 +++++++++++++++++-
 .../powerpc/pmu/sampling_tests/misc.h         |   9 +-
 .../mmcr1_sel_unit_cache_test.c               |  77 ++++++++++
 .../pmu/sampling_tests/mmcra_bhrb_any_test.c  |  65 +++++++++
 .../pmu/sampling_tests/mmcra_bhrb_cond_test.c |  69 +++++++++
 .../mmcra_bhrb_disable_no_branch_test.c       |  64 +++++++++
 .../sampling_tests/mmcra_bhrb_disable_test.c  |  66 +++++++++
 .../sampling_tests/mmcra_bhrb_ind_call_test.c |  69 +++++++++
 .../sampling_tests/mmcra_thresh_cmp_test.c    |  74 ++++++++++
 38 files changed, 2461 insertions(+), 10 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/pmu/branch_loops.S
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p9.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_mmcra_sample_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc56_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_count_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_repeat_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_constraints_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_thresh_ctl_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
 create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c

-- 
2.35.1

