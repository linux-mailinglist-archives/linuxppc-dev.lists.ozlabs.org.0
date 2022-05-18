Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0177F52BB73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 15:24:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L3DGP6Ly2z3c7g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 23:23:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SiJ4GYlp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L3DFn6n46z3bqk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 23:23:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=SiJ4GYlp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L3DFk6gkzz4xVP;
 Wed, 18 May 2022 23:23:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652880203;
 bh=gpe326A87jPjETNgZZ3WBK9Fi6DaQ8RS907Vw1/NOkw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=SiJ4GYlp5hY3xxS0pdwZFOPN+A8uvidA9MimzvFJTG/9pVe4bWBrdAdqM/sFG1coe
 sDj71mhabV4LfsSJ2FKpxvO92h8QtjuHb0aJfcvCWZr0byZq/9TZarCpOuAIHiZimz
 Ji/GP4vc2Vccgoa269Mu/Kd6k0IMKkoA6VGYpFp6nO3UcZF99eYOhXumtOeb/A9qkA
 a6gGD6dJR+tmW0lUufX0Z+e9qNM6FWRO2ggX9e5ZvHKpblB/9DJKrg9rho/GAopvsx
 FqLg/gdE+WWvBhk5Z4lS/wlVIUTBxnSIJ0sqLH05FzmYx8rwAfmWjXvXFhVIukicxN
 HT7yH6txrYHYA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/35]  Add group constraints and event code test as
 part of selftest
In-Reply-To: <20220506084544.56527-1-kjain@linux.ibm.com>
References: <20220506084544.56527-1-kjain@linux.ibm.com>
Date: Wed, 18 May 2022 23:23:21 +1000
Message-ID: <87a6bfnfee.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com,
 disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> Patch series extends the perf interface selftests
> to cover scenarios for event code checking,
> group constraints, and also thresholding/branch related
> interface tests in sampling area.

There are build failures in CI:

  https://github.com/ruscur/linux-ci/actions/runs/2317863271

If you follow the instructions here:

  https://github.com/linuxppc/wiki/wiki/Testing-with-GitHub-Actions

You can have the same tests run against your own tree before you post to
the list.

cheers

> In this series, patches 1 to 14 adds additional tests under
> "powerpc/sampling_tests". These adds support for handling
> sample type PERF_SAMPLE_BRANCH_STACK along with interrupt regs.
> It adds utility functions and test for thresh_cmp and branch
> filters programmed in control register. Some of the tests needs
> to be skipped for "Generic Compat PMU" environment. Hence utility
> functions are added in "include/utils.c" and "sampling_tests/misc.h"
> to detect platform based on "auxv" entries.
>
> Currently in other architectures (like x86), the pmu_name is
> exposed via sysfs caps folder ie:
> "sys/bus/event_source/devices/<pmu>/caps". But in powerpc,
> "caps" is not supported. So, though the approach for detecting
> compat mode currently uses auxv, patchset adds an 
> utility function considering a possibility of
> getting "caps" added for powerpc.
>
> Link to the patch to add support for caps under sysfs in powerpc:
> http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=297293
>
> Patches 15 to 35 covers test related to group constraints and event codes.
> These new set of changes are added under new folder:
> "selftests/powerpc/pmu/event_code_tests"
>
> Patch 15 covers changes required for new folder with Makefile changes.
> The other patches add tests for perf interface to check the event
> group constraints, valid/invalid event codes, blacklisted events etc.
> Also add required utility functions under header file "misc.h"
> in sampling_tests folder.
>
> Patch 33 and 34 depend upon thresh_cmp group constraint fix patches
> sent in upstream mailing list.
>
> Link to the thresh_cmp fix patchset:
> http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=298742
>
> Patch 13 of the patchset add selftest for mmcr1 pmcxsel/unit/cache fields,
> which was initially dropeed from sampling test patchset (patch number: 16)
>
> Link to the patch:
> http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220127072012.662451-17-kjain@linux.ibm.com/
>
> Athira Rajeev (20):
>   testing/selftests/powerpc: Add support to fetch "platform" and "base
>     platform" from auxv to detect platform.
>   selftest/powerpc/pmu: Refactor the platform check and add macros to
>     find array size/PVR
>   selftest/powerpc/pmu: Add selftest to check branch stack enablement
>     will not crash on any platforms
>   selftest/powerpc/pmu: Add selftest to check PERF_SAMPLE_REGS_INTR
>     option will not crash on any platforms
>   selftest/powerpc/pmu: Add selftest for checking valid and invalid bhrb
>     filter maps
>   selftest/powerpc/pmu: Add selftest for mmcr1 pmcxsel/unit/cache fields
>   selftest/powerpc/pmu: Add support for perf event code tests
>   selftest/powerpc/pmu: Add selftest for group constraint check for PMC5
>     and PMC6
>   selftest/powerpc/pmu: Add selftest to check PMC5/6 is excluded from
>     some constraint checks
>   selftest/powerpc/pmu: Add selftest to check constraint for number of
>     counters in use.
>   selftest/powerpc/pmu: Add selftest for group constraint check when
>     using same PMC
>   selftest/powerpc/pmu: Add selftest for group constraint check for
>     radix_scope_qual field
>   selftest/powerpc/pmu: Add selftest for group constraint for MMCRA
>     Sampling Mode field
>   selftest/powerpc/pmu: Add selftest for group constraint check MMCRA
>     sample bits
>   selftest/powerpc/pmu: Add selftest for checking invalid bits in event
>     code
>   selftest/powerpc/pmu: Add selftest for reserved bit check for MMCRA
>     thresh_ctl field
>   selftest/powerpc/pmu: Add selftest for blacklist events check in
>     power9
>   selftest/powerpc/pmu: Add selftest for event alternatives for power9
>   selftest/powerpc/pmu: Add selftest for event alternatives for power10
>   selftest/powerpc/pmu: Add selftest for PERF_TYPE_HARDWARE events valid
>     check
>
> Kajol Jain (15):
>   selftest/powerpc/pmu: Add mask/shift bits for extracting threshold
>     compare field
>   selftest/powerpc/pmu: Add interface test for mmcra_thresh_cmp fields
>   selftest/powerpc/pmu: Add support for branch sampling in get_intr_regs
>     function
>   selftest/powerpc/pmu: Add interface test for mmcra_ifm field of
>     indirect call type
>   selftest/powerpc/pmu: Add interface test for mmcra_ifm field for any
>     branch type
>   selftest/powerpc/pmu: Add interface test for mmcra_ifm field for
>     conditional branch type
>   selftest/powerpc/pmu: Add interface test for bhrb disable field
>   selftest/powerpc/pmu: Add interface test for bhrb disable field for
>     non-branch samples
>   selftest/powerpc/pmu: Add selftest for group constraint check for
>     MMCR0 l2l3_sel bits
>   selftest/powerpc/pmu: Add selftest for group constraint check for
>     MMCR1 cache bits
>   selftest/powerpc/pmu: Add selftest for group constraint check for
>     MMCRA thresh_cmp field
>   selftest/powerpc/pmu: Add selftest for group constraint for unit and
>     pmc field in p9
>   selftest/powerpc/pmu: Add selftest for group constraint check for
>     MMCRA thresh_ctl field
>   selftest/powerpc/pmu: Add selftest for group constraint check for
>     MMCRA thresh_sel field
>   selftest/powerpc/pmu: Add test for hardware cache events
>
>  tools/testing/selftests/powerpc/include/reg.h |   4 +
>  .../testing/selftests/powerpc/include/utils.h |  10 ++
>  tools/testing/selftests/powerpc/pmu/Makefile  |  11 +-
>  .../selftests/powerpc/pmu/branch_loops.S      |  28 ++++
>  .../powerpc/pmu/event_code_tests/Makefile     |  15 ++
>  .../blacklisted_events_test.c                 | 132 +++++++++++++++++
>  .../event_alternatives_tests_p10.c            | 109 ++++++++++++++
>  .../event_alternatives_tests_p9.c             | 116 +++++++++++++++
>  .../generic_events_valid_test.c               | 130 +++++++++++++++++
>  .../group_constraint_cache_test.c             |  60 ++++++++
>  .../group_constraint_l2l3_sel_test.c          |  64 +++++++++
>  .../group_constraint_mmcra_sample_test.c      |  54 +++++++
>  .../group_constraint_pmc56_test.c             |  63 ++++++++
>  .../group_constraint_pmc_count_test.c         |  70 +++++++++
>  .../group_constraint_radix_scope_qual_test.c  |  56 ++++++++
>  .../group_constraint_repeat_test.c            |  56 ++++++++
>  .../group_constraint_thresh_cmp_test.c        |  96 +++++++++++++
>  .../group_constraint_thresh_ctl_test.c        |  64 +++++++++
>  .../group_constraint_thresh_sel_test.c        |  63 ++++++++
>  .../group_constraint_unit_test.c              |  74 ++++++++++
>  .../group_pmc56_exclude_constraints_test.c    |  64 +++++++++
>  .../hw_cache_event_type_test.c                |  88 ++++++++++++
>  .../invalid_event_code_test.c                 |  67 +++++++++
>  ...eserved_bits_mmcra_sample_elig_mode_test.c |  77 ++++++++++
>  .../reserved_bits_mmcra_thresh_ctl_test.c     |  44 ++++++
>  .../powerpc/pmu/sampling_tests/Makefile       |   7 +-
>  .../pmu/sampling_tests/bhrb_filter_map_test.c | 115 +++++++++++++++
>  .../bhrb_no_crash_wo_pmu_test.c               |  59 ++++++++
>  .../intr_regs_no_crash_wo_pmu_test.c          |  57 ++++++++
>  .../powerpc/pmu/sampling_tests/misc.c         | 135 +++++++++++++++++-
>  .../powerpc/pmu/sampling_tests/misc.h         |   9 +-
>  .../mmcr1_sel_unit_cache_test.c               |  77 ++++++++++
>  .../pmu/sampling_tests/mmcra_bhrb_any_test.c  |  65 +++++++++
>  .../pmu/sampling_tests/mmcra_bhrb_cond_test.c |  69 +++++++++
>  .../mmcra_bhrb_disable_no_branch_test.c       |  64 +++++++++
>  .../sampling_tests/mmcra_bhrb_disable_test.c  |  66 +++++++++
>  .../sampling_tests/mmcra_bhrb_ind_call_test.c |  69 +++++++++
>  .../sampling_tests/mmcra_thresh_cmp_test.c    |  74 ++++++++++
>  38 files changed, 2471 insertions(+), 10 deletions(-)
>  create mode 100644 tools/testing/selftests/powerpc/pmu/branch_loops.S
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/Makefile
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/blacklisted_events_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p10.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/event_alternatives_tests_p9.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/generic_events_valid_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_cache_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_l2l3_sel_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_mmcra_sample_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc56_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_pmc_count_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_radix_scope_qual_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_repeat_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_cmp_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_ctl_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_thresh_sel_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_constraint_unit_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/group_pmc56_exclude_constraints_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/hw_cache_event_type_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/invalid_event_code_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_sample_elig_mode_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/event_code_tests/reserved_bits_mmcra_thresh_ctl_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_filter_map_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/bhrb_no_crash_wo_pmu_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/intr_regs_no_crash_wo_pmu_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcr1_sel_unit_cache_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_any_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_cond_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_no_branch_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_disable_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_bhrb_ind_call_test.c
>  create mode 100644 tools/testing/selftests/powerpc/pmu/sampling_tests/mmcra_thresh_cmp_test.c
>
> -- 
> 2.31.1
