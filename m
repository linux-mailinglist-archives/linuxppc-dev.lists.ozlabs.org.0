Return-Path: <linuxppc-dev+bounces-10956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7671B250DE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:04:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F730sLSz3cZN;
	Thu, 14 Aug 2025 03:02:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104575;
	cv=none; b=EZuOknVZ5kp6JA2H89v09jrOw5/p3n6ps11meLhxTtwpUn838otqBoGDCbhAQV7LPYTTmjF2eiXuQxcWW4irOrm8+KfB6I9ZG4xh+HEH96YUGR/6/xnCFE00Tov5tPjXzg9IaWxnhJDl5rGHeWstDJZxEGDsuSe6XLb7HsYdu3OdL6kJJaU/CjA6L9Qau1l3kWgMp2R5vCmOLjn3jHUsyPypQ/bKaNCTZpOav5FHyJN1qpBjxrGLvHofC5zHAcV07qEHw/cC/FCCT90vWjg7I6mZWA9Q7utu7KnBfDBBk4pQam5MfraItyR6y+YVlZxoS2fXYKqWKQL8WGGBYug2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104575; c=relaxed/relaxed;
	bh=U1ijO7tiBjLYZul6mmLTN/nzmNllO2SHYgxlEa1Xz/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BKacPomOQiWM2baqQO/JP1d40fvVsU4tXqhLIRef3080lZyivyFDsxWXKjSBACALg2C6R51E9LvZaJuYWZ66OeBNka4xxBBwBELomWvuUbtuUKVieNG3ArQStINX2LM/f5/dsHSyIqyksx0psbBN1VYQQETuPhozQgloZG2QAa4QIq8iBC84IAvpYyaasGwTgyH+Te39a8LRpnqfgx9q0KA5dvK73gHjKz8f7cEuqJyxUdSn7GXcOSBPbD2GuuFtSYLCjJrcu6XhAOssuNizXipEesOrCVCjiwcZfLkk50YQzkH1zCNvaaN5m+O/ARPi7KGDmgVy1sj0f1EkffiLKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F723PHMz30Vs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:54 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6F701D6F;
	Wed, 13 Aug 2025 10:02:15 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A1A5F3F738;
	Wed, 13 Aug 2025 10:02:19 -0700 (PDT)
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
Subject: [PATCH 13/19] perf: Add helper for checking grouped events
Date: Wed, 13 Aug 2025 18:01:05 +0100
Message-Id: <b05607c3ce0d3ce52de1784823ef9f6de324283c.1755096883.git.robin.murphy@arm.com>
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

Several drivers cannot support groups, but enforce this inconsistently
(including not at all) in their event_init routines. Add a helper so
that such drivers can simply and robustly check for the acceptable
conditions that their event is either standalone, or the first one
being added to a software-only group.

In particular it took a while to see that marvell_cn10k_tad_pmu was
seemingly trying to rely on the empirical behaviour of perf tool
creating group leader events with disabled=1 and subsequent siblings
with disabled=0. Down with this sort of thing!

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/x86/events/amd/ibs.c             | 30 ++++++---------------------
 drivers/devfreq/event/rockchip-dfi.c  |  3 +++
 drivers/perf/alibaba_uncore_drw_pmu.c | 11 +---------
 drivers/perf/arm_dmc620_pmu.c         | 12 +----------
 drivers/perf/dwc_pcie_pmu.c           | 10 ++-------
 drivers/perf/marvell_cn10k_tad_pmu.c  |  6 ++----
 drivers/perf/marvell_pem_pmu.c        | 11 ++--------
 include/linux/perf_event.h            |  7 +++++++
 8 files changed, 24 insertions(+), 66 deletions(-)

diff --git a/arch/x86/events/amd/ibs.c b/arch/x86/events/amd/ibs.c
index 112f43b23ebf..95de309fc7d5 100644
--- a/arch/x86/events/amd/ibs.c
+++ b/arch/x86/events/amd/ibs.c
@@ -248,27 +248,6 @@ int forward_event_to_ibs(struct perf_event *event)
 	return -ENOENT;
 }
 
-/*
- * Grouping of IBS events is not possible since IBS can have only
- * one event active at any point in time.
- */
-static int validate_group(struct perf_event *event)
-{
-	struct perf_event *sibling;
-
-	if (event->group_leader == event)
-		return 0;
-
-	if (event->group_leader->pmu == event->pmu)
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu == event->pmu)
-			return -EINVAL;
-	}
-	return 0;
-}
-
 static bool perf_ibs_ldlat_event(struct perf_ibs *perf_ibs,
 				 struct perf_event *event)
 {
@@ -309,9 +288,12 @@ static int perf_ibs_init(struct perf_event *event)
 	     event->attr.exclude_hv))
 		return -EINVAL;
 
-	ret = validate_group(event);
-	if (ret)
-		return ret;
+	/*
+	 * Grouping of IBS events is not possible since IBS can have only
+	 * one event active at any point in time.
+	 */
+	if (in_hardware_group(event))
+		return -EINVAL;
 
 	if (hwc->sample_period) {
 		if (config & perf_ibs->cnt_mask)
diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
index 0470d7c175f4..88a9ecbe96ce 100644
--- a/drivers/devfreq/event/rockchip-dfi.c
+++ b/drivers/devfreq/event/rockchip-dfi.c
@@ -413,6 +413,9 @@ static int rockchip_ddr_perf_event_init(struct perf_event *event)
 		dev_warn(dfi->dev, "Can't provide per-task data!\n");
 		return -EINVAL;
 	}
+	/* Disallow groups since we can't start/stop/read multiple counters at once */
+	if (in_hardware_group(event))
+		return -EINVAL;
 
 	return 0;
 }
diff --git a/drivers/perf/alibaba_uncore_drw_pmu.c b/drivers/perf/alibaba_uncore_drw_pmu.c
index 99a0ef9817e0..0081618741c3 100644
--- a/drivers/perf/alibaba_uncore_drw_pmu.c
+++ b/drivers/perf/alibaba_uncore_drw_pmu.c
@@ -526,7 +526,6 @@ static int ali_drw_pmu_event_init(struct perf_event *event)
 {
 	struct ali_drw_pmu *drw_pmu = to_ali_drw_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	struct perf_event *sibling;
 	struct device *dev = drw_pmu->pmu.dev;
 
 	if (event->attr.type != event->pmu->type)
@@ -548,19 +547,11 @@ static int ali_drw_pmu_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	if (event->group_leader != event &&
-	    !is_software_event(event->group_leader)) {
+	if (in_hardware_group(event)) {
 		dev_err(dev, "driveway only allow one event!\n");
 		return -EINVAL;
 	}
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling != event && !is_software_event(sibling)) {
-			dev_err(dev, "driveway event not allowed!\n");
-			return -EINVAL;
-		}
-	}
-
 	/* reset all the pmu counters */
 	writel(ALI_DRW_PMU_CNT_RST, drw_pmu->cfg_base + ALI_DRW_PMU_CNT_CTRL);
 
diff --git a/drivers/perf/arm_dmc620_pmu.c b/drivers/perf/arm_dmc620_pmu.c
index 619cf937602f..24308de80246 100644
--- a/drivers/perf/arm_dmc620_pmu.c
+++ b/drivers/perf/arm_dmc620_pmu.c
@@ -513,7 +513,6 @@ static int dmc620_pmu_event_init(struct perf_event *event)
 {
 	struct dmc620_pmu *dmc620_pmu = to_dmc620_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	struct perf_event *sibling;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -544,22 +543,13 @@ static int dmc620_pmu_event_init(struct perf_event *event)
 
 	hwc->idx = -1;
 
-	if (event->group_leader == event)
-		return 0;
-
 	/*
 	 * We can't atomically disable all HW counters so only one event allowed,
 	 * although software events are acceptable.
 	 */
-	if (!is_software_event(event->group_leader))
+	if (in_hardware_group(event))
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling != event &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 146ff57813fb..78c522658d84 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -353,7 +353,6 @@ static int dwc_pcie_pmu_event_init(struct perf_event *event)
 {
 	struct dwc_pcie_pmu *pcie_pmu = to_dwc_pcie_pmu(event->pmu);
 	enum dwc_pcie_event_type type = DWC_PCIE_EVENT_TYPE(event);
-	struct perf_event *sibling;
 	u32 lane;
 
 	if (event->attr.type != event->pmu->type)
@@ -367,15 +366,10 @@ static int dwc_pcie_pmu_event_init(struct perf_event *event)
 	if (event->cpu < 0 || event->attach_state & PERF_ATTACH_TASK)
 		return -EINVAL;
 
-	if (event->group_leader != event &&
-	    !is_software_event(event->group_leader))
+	/* Disallow groups since we can't start/stop/read multiple counters at once */
+	if (in_hardware_group(event))
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu && !is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	if (type < 0 || type >= DWC_PCIE_EVENT_TYPE_MAX)
 		return -EINVAL;
 
diff --git a/drivers/perf/marvell_cn10k_tad_pmu.c b/drivers/perf/marvell_cn10k_tad_pmu.c
index 51ccb0befa05..ee6505cb01a7 100644
--- a/drivers/perf/marvell_cn10k_tad_pmu.c
+++ b/drivers/perf/marvell_cn10k_tad_pmu.c
@@ -152,10 +152,8 @@ static int tad_pmu_event_init(struct perf_event *event)
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
 
-	if (!event->attr.disabled)
-		return -EINVAL;
-
-	if (event->state != PERF_EVENT_STATE_OFF)
+	/* Disallow groups since we can't start/stop/read multiple counters at once */
+	if (in_hardware_group(event))
 		return -EINVAL;
 
 	event->cpu = tad_pmu->cpu;
diff --git a/drivers/perf/marvell_pem_pmu.c b/drivers/perf/marvell_pem_pmu.c
index 29fbcd1848e4..53a35a5de7f8 100644
--- a/drivers/perf/marvell_pem_pmu.c
+++ b/drivers/perf/marvell_pem_pmu.c
@@ -190,7 +190,6 @@ static int pem_perf_event_init(struct perf_event *event)
 {
 	struct pem_pmu *pmu = to_pem_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	struct perf_event *sibling;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -206,16 +205,10 @@ static int pem_perf_event_init(struct perf_event *event)
 	if (event->cpu < 0)
 		return -EOPNOTSUPP;
 
-	/*  We must NOT create groups containing mixed PMUs */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader))
+	/* Disallow groups since we can't start/stop/read multiple counters at once */
+	if (in_hardware_group(event))
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-		    !is_software_event(sibling))
-			return -EINVAL;
-	}
 	/*
 	 * Set ownership of event to one CPU, same event can not be observed
 	 * on multiple cpus at same time.
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index ec9d96025683..4d439c24c901 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1556,6 +1556,13 @@ static inline int in_software_context(struct perf_event *event)
 	return event->pmu_ctx->pmu->task_ctx_nr == perf_sw_context;
 }
 
+/* True if the event has (or would have) any non-software siblings */
+static inline bool in_hardware_group(const struct perf_event *event)
+{
+	return event != event->group_leader &&
+	       !in_software_context(event->group_leader);
+}
+
 static inline int is_exclusive_pmu(struct pmu *pmu)
 {
 	return pmu->capabilities & PERF_PMU_CAP_EXCLUSIVE;
-- 
2.39.2.101.g768bb238c484.dirty


