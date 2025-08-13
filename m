Return-Path: <linuxppc-dev+bounces-10954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BA5B250D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6y64Fcz3cZB;
	Thu, 14 Aug 2025 03:02:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104570;
	cv=none; b=Mb42VOYP2lj1GzRxyB8DwBE5uAG0SHgkDUmY1Eqmj6NC7yX3rQUOCFey9QCot4nmMcfcBmHhNufHet++Wp1TDDJzJDoo5EMi9IxzTutB1UmkuBp6mgbaUTAqgPww4YoVp/hMPrPRWUF6HToCglJREIPhdM6ORxjqkn6plT1zq4DMhz1zlr0jfl13v2LKamUzx84squL22GLrpLD9lbbki+7uEoTonmd3ryZSxWCMBDNFzOG4JcIqQg42gjIGEz67uTKpUDauQv2vzI2auOi1kSORftWqbHDc3OpMyVUom4fdWAaUe0R8BlkxZL3tMDAueDSI831JC+Lr8isPhO23Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104570; c=relaxed/relaxed;
	bh=v8vVt+hyG8dD0Tbz+oeO5uX4deqsIy2mk9ronRV2MPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MvmwJ4vCDAV5r4mTx8WhLpJmrYwC33/O7cRMRwyF3oPqbOcaOI/zj54YvncCyDIhDie28MxxXeRZRs1GyrBROZynuqqVsurap7NfA6WGrLXmf9mt3qDGalPHfdV75XL755QsZ8CmEeEpRBxchudDZ7eFkIb7+Py8OOE9yjX/osDk74oABZdCfLivd+tO+0sGk390iw9KTzvEaoLfvpN4f1/MoDl6Asckmg9434WZnHn/bohPBdcBH/2HNOqN6HFzo+K0z8zVIaAMZ02zmrKzjOeNnNEAmJnnVjQVBt2vNNqjhLom01mH/NtdP9RXjASL4LxaNc/5eXUU15jGs8n6fQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6y1yWVz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:50 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8671D15;
	Wed, 13 Aug 2025 10:02:11 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 25A5E3F738;
	Wed, 13 Aug 2025 10:02:15 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	mark.rutland@arm.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com
Cc: linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	coresight@lists.linaro.org,
	iommu@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-cxl@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 12/19] perf: Ignore event state for group validation
Date: Wed, 13 Aug 2025 18:01:04 +0100
Message-Id: <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
In-Reply-To: <cover.1755096883.git.robin.murphy@arm.com>
References: <cover.1755096883.git.robin.murphy@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

It may have been different long ago, but today it seems wrong for these
drivers to skip counting disabled sibling events in group validation,
given that perf_event_enable() could make them schedulable again, and
thus increase the effective size of the group later. Conversely, if a
sibling event is truly dead then it stands to reason that the whole
group is dead, so it's not worth going to any special effort to try to
squeeze in a new event that's never going to run anyway. Thus, we can
simply remove all these checks.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/alpha/kernel/perf_event.c   | 2 +-
 arch/powerpc/perf/core-book3s.c  | 3 +--
 arch/powerpc/perf/core-fsl-emb.c | 3 +--
 arch/sparc/kernel/perf_event.c   | 3 +--
 arch/x86/events/core.c           | 2 +-
 arch/x86/events/intel/uncore.c   | 3 +--
 drivers/dma/idxd/perfmon.c       | 3 +--
 drivers/perf/arm_pmu.c           | 6 ------
 8 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/alpha/kernel/perf_event.c b/arch/alpha/kernel/perf_event.c
index a3eaab094ece..8557165e64c0 100644
--- a/arch/alpha/kernel/perf_event.c
+++ b/arch/alpha/kernel/perf_event.c
@@ -352,7 +352,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		current_idx[n++] = PMC_NO_INDEX;
 	}
 	for_each_sibling_event(pe, group) {
-		if (!is_software_event(pe) && pe->state != PERF_EVENT_STATE_OFF) {
+		if (!is_software_event(pe)) {
 			if (n >= max_count)
 				return -1;
 			event[n] = pe;
diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 8b0081441f85..d67f7d511f13 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -1602,8 +1602,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		events[n++] = group->hw.config;
 	}
 	for_each_sibling_event(event, group) {
-		if (event->pmu->task_ctx_nr == perf_hw_context &&
-		    event->state != PERF_EVENT_STATE_OFF) {
+		if (event->pmu->task_ctx_nr == perf_hw_context) {
 			if (n >= max_count)
 				return -1;
 			ctrs[n] = event;
diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-fsl-emb.c
index 7120ab20cbfe..509932b91b75 100644
--- a/arch/powerpc/perf/core-fsl-emb.c
+++ b/arch/powerpc/perf/core-fsl-emb.c
@@ -261,8 +261,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		n++;
 	}
 	for_each_sibling_event(event, group) {
-		if (!is_software_event(event) &&
-		    event->state != PERF_EVENT_STATE_OFF) {
+		if (!is_software_event(event)) {
 			if (n >= max_count)
 				return -1;
 			ctrs[n] = event;
diff --git a/arch/sparc/kernel/perf_event.c b/arch/sparc/kernel/perf_event.c
index cae4d33002a5..706127749c66 100644
--- a/arch/sparc/kernel/perf_event.c
+++ b/arch/sparc/kernel/perf_event.c
@@ -1357,8 +1357,7 @@ static int collect_events(struct perf_event *group, int max_count,
 		current_idx[n++] = PIC_NO_INDEX;
 	}
 	for_each_sibling_event(event, group) {
-		if (!is_software_event(event) &&
-		    event->state != PERF_EVENT_STATE_OFF) {
+		if (!is_software_event(event)) {
 			if (n >= max_count)
 				return -1;
 			evts[n] = event;
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 7610f26dfbd9..eca5bb49aa85 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -1211,7 +1211,7 @@ static int collect_events(struct cpu_hw_events *cpuc, struct perf_event *leader,
 		return n;
 
 	for_each_sibling_event(event, leader) {
-		if (!is_x86_event(event) || event->state <= PERF_EVENT_STATE_OFF)
+		if (!is_x86_event(event))
 			continue;
 
 		if (collect_event(cpuc, event, max_count, n))
diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index a762f7f5b161..297ff5adb667 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -406,8 +406,7 @@ uncore_collect_events(struct intel_uncore_box *box, struct perf_event *leader,
 		return n;
 
 	for_each_sibling_event(event, leader) {
-		if (!is_box_event(box, event) ||
-		    event->state <= PERF_EVENT_STATE_OFF)
+		if (!is_box_event(box, event))
 			continue;
 
 		if (n >= max_count)
diff --git a/drivers/dma/idxd/perfmon.c b/drivers/dma/idxd/perfmon.c
index 4b6af2f15d8a..8c539e1f11da 100644
--- a/drivers/dma/idxd/perfmon.c
+++ b/drivers/dma/idxd/perfmon.c
@@ -75,8 +75,7 @@ static int perfmon_collect_events(struct idxd_pmu *idxd_pmu,
 		return n;
 
 	for_each_sibling_event(event, leader) {
-		if (!is_idxd_event(idxd_pmu, event) ||
-		    event->state <= PERF_EVENT_STATE_OFF)
+		if (!is_idxd_event(idxd_pmu, event))
 			continue;
 
 		if (n >= max_count)
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 5c310e803dd7..e8a3c8e99da0 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -386,12 +386,6 @@ validate_event(struct pmu *pmu, struct pmu_hw_events *hw_events,
 	if (event->pmu != pmu)
 		return 0;
 
-	if (event->state < PERF_EVENT_STATE_OFF)
-		return 1;
-
-	if (event->state == PERF_EVENT_STATE_OFF && !event->attr.enable_on_exec)
-		return 1;
-
 	armpmu = to_arm_pmu(event->pmu);
 	return armpmu->get_event_idx(hw_events, event) >= 0;
 }
-- 
2.39.2.101.g768bb238c484.dirty


