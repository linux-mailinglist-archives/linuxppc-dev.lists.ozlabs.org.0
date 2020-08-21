Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DEB24DAD1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:28:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY6Qg6qydzDr6Q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 02:28:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=2bOsaDd1; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY68Y0FYgzDrFF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 02:16:29 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F143820FC3;
 Fri, 21 Aug 2020 16:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598026586;
 bh=Bdpad47Y9xaJkg3DYY8jaH4brrvoaBEGpKqgrVpA5KM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2bOsaDd1PkYYzXJfEbIQdcUNDWeU5N6kZS/MywxGkxVxemN7a1kV9c3oo0CABBQ5X
 MSvJ6aAvFuWp26li58gtPCAVE1plBOiGWeZlJ6mQtuIeIhmDiIwj444hUDOmrRIOvD
 HBqD7/d2K66ERrHC5zBYNoYAuSQtYoKc0UFlDZYs=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 33/61] selftests/powerpc: Purge extra count_pmc()
 calls of ebb selftests
Date: Fri, 21 Aug 2020 12:15:17 -0400
Message-Id: <20200821161545.347622-33-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821161545.347622-1-sashal@kernel.org>
References: <20200821161545.347622-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Sasha Levin <sashal@kernel.org>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>

[ Upstream commit 3337bf41e0dd70b4064cdf60acdfcdc2d050066c ]

An extra count on ebb_state.stats.pmc_count[PMC_INDEX(pmc)] is being per-
formed when count_pmc() is used to reset PMCs on a few selftests. This
extra pmc_count can occasionally invalidate results, such as the ones from
cycles_test shown hereafter. The ebb_check_count() failed with an above
the upper limit error due to the extra value on ebb_state.stats.pmc_count.

Furthermore, this extra count is also indicated by extra PMC1 trace_log on
the output of the cycle test (as well as on pmc56_overflow_test):

==========
   ...
   [21]: counter = 8
   [22]: register SPRN_MMCR0 = 0x0000000080000080
   [23]: register SPRN_PMC1  = 0x0000000080000004
   [24]: counter = 9
   [25]: register SPRN_MMCR0 = 0x0000000080000080
   [26]: register SPRN_PMC1  = 0x0000000080000004
   [27]: counter = 10
   [28]: register SPRN_MMCR0 = 0x0000000080000080
   [29]: register SPRN_PMC1  = 0x0000000080000004
>> [30]: register SPRN_PMC1  = 0x000000004000051e
PMC1 count (0x280000546) above upper limit 0x2800003e8 (+0x15e)
[FAIL] Test FAILED on line 52
failure: cycles
==========

Signed-off-by: Desnes A. Nunes do Rosario <desnesn@linux.ibm.com>
Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20200626164737.21943-1-desnesn@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c     | 2 --
 tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c      | 2 --
 .../selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c    | 2 --
 .../selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c     | 2 --
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c              | 2 --
 .../selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c  | 2 --
 .../selftests/powerpc/pmu/ebb/lost_exception_test.c        | 1 -
 .../testing/selftests/powerpc/pmu/ebb/multi_counter_test.c | 7 -------
 .../selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c       | 2 --
 .../testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c | 2 --
 .../selftests/powerpc/pmu/ebb/pmc56_overflow_test.c        | 2 --
 11 files changed, 26 deletions(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
index a2d7b0e3dca97..a26ac122c759f 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/back_to_back_ebbs_test.c
@@ -91,8 +91,6 @@ int back_to_back_ebbs(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
index bc893813483ee..bb9f587fa76e8 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_test.c
@@ -42,8 +42,6 @@ int cycles(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
index dcd351d203289..9ae795ce314e6 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_freeze_test.c
@@ -99,8 +99,6 @@ int cycles_with_freeze(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	printf("EBBs while frozen %d\n", ebbs_while_frozen);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
index 94c99c12c0f23..4b45a2e70f62b 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/cycles_with_mmcr2_test.c
@@ -71,8 +71,6 @@ int cycles_with_mmcr2(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
index dfbc5c3ad52d7..21537d6eb6b7d 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
@@ -396,8 +396,6 @@ int ebb_child(union pipe read_pipe, union pipe write_pipe)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
index ca2f7d729155b..b208bf6ad58d3 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb_on_willing_child_test.c
@@ -38,8 +38,6 @@ static int victim_child(union pipe read_pipe, union pipe write_pipe)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	FAIL_IF(ebb_state.stats.ebb_count == 0);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
index ac3e6e182614a..ba2681a12cc7b 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/lost_exception_test.c
@@ -75,7 +75,6 @@ static int test_body(void)
 	ebb_freeze_pmcs();
 	ebb_global_disable();
 
-	count_pmc(4, sample_period);
 	mtspr(SPRN_PMC4, 0xdead);
 
 	dump_summary_ebb_state();
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
index b8242e9d97d2d..791d37ba327b5 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_counter_test.c
@@ -70,13 +70,6 @@ int multi_counter(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-	count_pmc(2, sample_period);
-	count_pmc(3, sample_period);
-	count_pmc(4, sample_period);
-	count_pmc(5, sample_period);
-	count_pmc(6, sample_period);
-
 	dump_ebb_state();
 
 	for (i = 0; i < 6; i++)
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
index a05c0e18ded63..9b0f70d597020 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/multi_ebb_procs_test.c
@@ -61,8 +61,6 @@ static int cycles_child(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_summary_ebb_state();
 
 	event_close(&event);
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
index 153ebc92234fd..2904c741e04e5 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/pmae_handling_test.c
@@ -82,8 +82,6 @@ static int test_body(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(1, sample_period);
-
 	dump_ebb_state();
 
 	if (mmcr0_mismatch)
diff --git a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
index eadad75ed7e6f..b29f8ba22d1e6 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/pmc56_overflow_test.c
@@ -76,8 +76,6 @@ int pmc56_overflow(void)
 	ebb_global_disable();
 	ebb_freeze_pmcs();
 
-	count_pmc(2, sample_period);
-
 	dump_ebb_state();
 
 	printf("PMC5/6 overflow %d\n", pmc56_overflowed);
-- 
2.25.1

