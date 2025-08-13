Return-Path: <linuxppc-dev+bounces-10952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9CAB250D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:03:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6t0xxqz3cR2;
	Thu, 14 Aug 2025 03:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104566;
	cv=none; b=HkmogijjRPz2JsD+He2p84g8WXTZvs5N4xg23OF+n59Ur04sNczktKeDJd4G47GFoaFJ2TXELKJzqQNs57lCQcAl1AoR3A8ovV2KALEgLfpbVuvzFLmCwK3TmfTpMcInMS7dxMn366vLcOhd7W3YYDIr2XPRHXK6iVwy0B5n805Ue/17FlVCbUmu8SjXNCk5J08A2aQOi4TriZWQUMsvaH84r7oAsVCDRKmT9a43X227oDSuarLVvzY8OrlmcocUm0ELukxRRusJdSAHaWNV2eXaD6+jQCw9DWesNAedwim84MTW3hBisY8kGckQNZPTCEiyuUNj4g18eQlWlC5Dvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104566; c=relaxed/relaxed;
	bh=RXHamsMLNwHVpaGynDdhERM2+xzdxPhWLgT1ksjOIBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UyfcPVG4mD1Rrxih/5gxHRKUB7z0ygzWFWb/9eF67YpGIh2mg26nt3FZmLxgPdv8v9Rzs11fNS6ATBqf0raryFYzAo/xmh4kVAOzbyqT/dAj+Rz2d3rwYpPc4C3TL0sdb3+RT6vVBf2c6ZV0Iwmr2uTCiYR8jSOEIIarOeW/TaBD+vJeMmX032USnzl8HJrjsLwbxnaghQv32wfDev7AUA2kuJ1S8SvDVDfy7PSNUOUFnjRiVI/Pe4F99yG9EsVdPzDRU8m7euaLCEzh2uxevjnFMrC8CwvY2ZaEzjWHSzttdG+hPuV52gbveJ+dL+dpH8wnTJ+IWS78zQZ54lNFkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6s31Bnz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4F331D14;
	Wed, 13 Aug 2025 10:02:06 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DB4C3F738;
	Wed, 13 Aug 2025 10:02:10 -0700 (PDT)
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
Subject: [PATCH 11/19] perf/arm-cci: Tidy up event validation
Date: Wed, 13 Aug 2025 18:01:03 +0100
Message-Id: <b433bdccbf83a71878b67a9c159c3e9414bef2d0.1755096883.git.robin.murphy@arm.com>
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

The CCI driver only accepts events of its own type, so it is pointless
to re-check the event type again further into validation. Conversely, if
an event *is* for CCI but has a nonsense config, we should not return
-ENOENT to potentially offer it to other PMUs. Finally it seems wrong
not to count disabled events which may be enabled later.

These are all artefacts left over from the original attempt to fit CCI
into the arm_pmu framework; clean them up, along with the now-redundant
checks for cross-PMU groups which core code will already handle (albeit
not quite as the out-of-date comment says).

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cci.c | 47 +++++++++++-------------------------------
 1 file changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/perf/arm-cci.c b/drivers/perf/arm-cci.c
index 1cc3214d6b6d..086d4363fcc8 100644
--- a/drivers/perf/arm-cci.c
+++ b/drivers/perf/arm-cci.c
@@ -333,7 +333,7 @@ static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw_ev
 	int if_type;
 
 	if (hw_event & ~CCI400_PMU_EVENT_MASK)
-		return -ENOENT;
+		return -EINVAL;
 
 	if (hw_event == CCI400_PMU_CYCLES)
 		return hw_event;
@@ -354,14 +354,14 @@ static int cci400_validate_hw_event(struct cci_pmu *cci_pmu, unsigned long hw_ev
 		if_type = CCI_IF_MASTER;
 		break;
 	default:
-		return -ENOENT;
+		return -EINVAL;
 	}
 
 	if (ev_code >= cci_pmu->model->event_ranges[if_type].min &&
 		ev_code <= cci_pmu->model->event_ranges[if_type].max)
 		return hw_event;
 
-	return -ENOENT;
+	return -EINVAL;
 }
 
 static int probe_cci400_revision(struct cci_pmu *cci_pmu)
@@ -541,7 +541,7 @@ static int cci500_validate_hw_event(struct cci_pmu *cci_pmu,
 	int if_type;
 
 	if (hw_event & ~CCI5xx_PMU_EVENT_MASK)
-		return -ENOENT;
+		return -EINVAL;
 
 	switch (ev_source) {
 	case CCI5xx_PORT_S0:
@@ -565,14 +565,14 @@ static int cci500_validate_hw_event(struct cci_pmu *cci_pmu,
 		if_type = CCI_IF_GLOBAL;
 		break;
 	default:
-		return -ENOENT;
+		return -EINVAL;
 	}
 
 	if (ev_code >= cci_pmu->model->event_ranges[if_type].min &&
 		ev_code <= cci_pmu->model->event_ranges[if_type].max)
 		return hw_event;
 
-	return -ENOENT;
+	return -EINVAL;
 }
 
 /*
@@ -592,7 +592,7 @@ static int cci550_validate_hw_event(struct cci_pmu *cci_pmu,
 	int if_type;
 
 	if (hw_event & ~CCI5xx_PMU_EVENT_MASK)
-		return -ENOENT;
+		return -EINVAL;
 
 	switch (ev_source) {
 	case CCI5xx_PORT_S0:
@@ -617,14 +617,14 @@ static int cci550_validate_hw_event(struct cci_pmu *cci_pmu,
 		if_type = CCI_IF_GLOBAL;
 		break;
 	default:
-		return -ENOENT;
+		return -EINVAL;
 	}
 
 	if (ev_code >= cci_pmu->model->event_ranges[if_type].min &&
 		ev_code <= cci_pmu->model->event_ranges[if_type].max)
 		return hw_event;
 
-	return -ENOENT;
+	return -EINVAL;
 }
 
 #endif	/* CONFIG_ARM_CCI5xx_PMU */
@@ -801,17 +801,6 @@ static int pmu_get_event_idx(struct cci_pmu_hw_events *hw, struct perf_event *ev
 	return -EAGAIN;
 }
 
-static int pmu_map_event(struct perf_event *event)
-{
-	struct cci_pmu *cci_pmu = to_cci_pmu(event->pmu);
-
-	if (event->attr.type < PERF_TYPE_MAX ||
-			!cci_pmu->model->validate_hw_event)
-		return -ENOENT;
-
-	return	cci_pmu->model->validate_hw_event(cci_pmu, event->attr.config);
-}
-
 static int pmu_request_irq(struct cci_pmu *cci_pmu, irq_handler_t handler)
 {
 	int i;
@@ -1216,21 +1205,8 @@ static int validate_event(struct pmu *cci_pmu,
 			  struct cci_pmu_hw_events *hw_events,
 			  struct perf_event *event)
 {
-	if (is_software_event(event))
-		return 1;
-
-	/*
-	 * Reject groups spanning multiple HW PMUs (e.g. CPU + CCI). The
-	 * core perf code won't check that the pmu->ctx == leader->ctx
-	 * until after pmu->event_init(event).
-	 */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != cci_pmu)
-		return 0;
-
-	if (event->state < PERF_EVENT_STATE_OFF)
-		return 1;
-
-	if (event->state == PERF_EVENT_STATE_OFF && !event->attr.enable_on_exec)
 		return 1;
 
 	return pmu_get_event_idx(hw_events, event) >= 0;
@@ -1266,10 +1242,11 @@ static int validate_group(struct perf_event *event)
 
 static int __hw_perf_event_init(struct perf_event *event)
 {
+	struct cci_pmu *cci_pmu = to_cci_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
 	int mapping;
 
-	mapping = pmu_map_event(event);
+	mapping = cci_pmu->model->validate_hw_event(cci_pmu, event->attr.config);
 
 	if (mapping < 0) {
 		pr_debug("event %x:%llx not supported\n", event->attr.type,
-- 
2.39.2.101.g768bb238c484.dirty


