Return-Path: <linuxppc-dev+bounces-10947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44EB250C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:03:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6f0JW6z3bqP;
	Thu, 14 Aug 2025 03:02:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104554;
	cv=none; b=hd1VlDPlJnBswfByejftVn9In0uV/kfCjxPeBXHB8QEdsruPOa7kTrNKW3ar2RbYfp0KAbj8WCP+h/HFL7pMZzbLwGZECiuu/KAW7mWQJ3zXdQtB5ywLpmXH/mk3nQZUBN2SxYZsDhir4pafEbzfy/8yM9SffVaAy6M9DpAotRPfYx+/VHch4ta29tt64FOYyPi2idWF9EjIC8hby8Pigs2ASVcAgfw9FdTkT20fN8+IfhzIO6vRPGxtEZEBRaSmDJHNYIaNMjiAOt7ZCsf2vCEG0LhTFauj79+3+eQRvLrWR5DaE9SFbe7ggpWvgMYmJdCTbkdlA+DogL4IrdWpzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104554; c=relaxed/relaxed;
	bh=eHwwlPAtand1e+7TeeNxrmIn7X9BoGhHY9gnNCUlrkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fz/6XszvPZux0pfeIrJE4lrdM3OYTd28ebbeIm1Q31pvsWE55wxQgJDFDrXKqRMETlj5+qImxsIf/h1/Yx/7OKQoVv2etfRkjUcDXSIRaERESP7XklUTDzqNnW2mlI5z6wG8x6rZXgSaYBXkWBtsoW13pP2i1CCFpUAAsrZgmxobDwmVzhn/x91calBQObOgcT2eqk39L+nyfnC2pcJAfjBb3N7exFrYenABLXZtecf7zh7uIvqQr3UGEFTebijTcfik+/mDkj5JkpPc+TG0ZlRK2DQVUIO/yAg0wVfcfIPDt2rtsU/rpo+ZxL5ve/lChPEklpZ3ggDeP3zCPpGAGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6d35DTz3cQq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF4931E7D;
	Wed, 13 Aug 2025 10:02:24 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A75D43F738;
	Wed, 13 Aug 2025 10:02:28 -0700 (PDT)
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
Subject: [PATCH 15/19] perf: Simplify group validation
Date: Wed, 13 Aug 2025 18:01:07 +0100
Message-Id: <8e86d5021812c720219c8843e5179fe03e5c4de4.1755096883.git.robin.murphy@arm.com>
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

All of these drivers copy a pattern of actively policing cross-PMU
groups, which is redundant since commit bf480f938566 ("perf/core: Don't
allow grouping events from different hw pmus"). Clean up these checks to
simplfy matters, especially for thunderx2 which can reduce right down to
trivial counting.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm_cspmu/arm_cspmu.c |  7 ++-----
 drivers/perf/arm_dsu_pmu.c         |  6 ++----
 drivers/perf/arm_pmu.c             | 11 ++---------
 drivers/perf/thunderx2_pmu.c       | 30 +++++++-----------------------
 4 files changed, 13 insertions(+), 41 deletions(-)

diff --git a/drivers/perf/arm_cspmu/arm_cspmu.c b/drivers/perf/arm_cspmu/arm_cspmu.c
index efa9b229e701..7f5ea749b85c 100644
--- a/drivers/perf/arm_cspmu/arm_cspmu.c
+++ b/drivers/perf/arm_cspmu/arm_cspmu.c
@@ -561,12 +561,9 @@ static bool arm_cspmu_validate_event(struct pmu *pmu,
 				 struct arm_cspmu_hw_events *hw_events,
 				 struct perf_event *event)
 {
-	if (is_software_event(event))
-		return true;
-
-	/* Reject groups spanning multiple HW PMUs. */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != pmu)
-		return false;
+		return true;
 
 	return (arm_cspmu_get_event_idx(hw_events, event) >= 0);
 }
diff --git a/drivers/perf/arm_dsu_pmu.c b/drivers/perf/arm_dsu_pmu.c
index cb4fb59fe04b..7480fd6fe377 100644
--- a/drivers/perf/arm_dsu_pmu.c
+++ b/drivers/perf/arm_dsu_pmu.c
@@ -492,11 +492,9 @@ static bool dsu_pmu_validate_event(struct pmu *pmu,
 				  struct dsu_hw_events *hw_events,
 				  struct perf_event *event)
 {
-	if (is_software_event(event))
-		return true;
-	/* Reject groups spanning multiple HW PMUs. */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != pmu)
-		return false;
+		return true;
 	return dsu_pmu_get_event_idx(hw_events, event) >= 0;
 }
 
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index e8a3c8e99da0..2c1af3a0207c 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -375,16 +375,9 @@ validate_event(struct pmu *pmu, struct pmu_hw_events *hw_events,
 {
 	struct arm_pmu *armpmu;
 
-	if (is_software_event(event))
-		return 1;
-
-	/*
-	 * Reject groups spanning multiple HW PMUs (e.g. CPU + CCI). The
-	 * core perf code won't check that the pmu->ctx == leader->ctx
-	 * until after pmu->event_init(event).
-	 */
+	/* Ignore grouped events that aren't ours */
 	if (event->pmu != pmu)
-		return 0;
+		return 1;
 
 	armpmu = to_arm_pmu(event->pmu);
 	return armpmu->get_event_idx(hw_events, event) >= 0;
diff --git a/drivers/perf/thunderx2_pmu.c b/drivers/perf/thunderx2_pmu.c
index 6ed4707bd6bb..472eb4494fd1 100644
--- a/drivers/perf/thunderx2_pmu.c
+++ b/drivers/perf/thunderx2_pmu.c
@@ -519,19 +519,6 @@ static enum tx2_uncore_type get_tx2_pmu_type(struct acpi_device *adev)
 	return (enum tx2_uncore_type)id->driver_data;
 }
 
-static bool tx2_uncore_validate_event(struct pmu *pmu,
-				  struct perf_event *event, int *counters)
-{
-	if (is_software_event(event))
-		return true;
-	/* Reject groups spanning multiple HW PMUs. */
-	if (event->pmu != pmu)
-		return false;
-
-	*counters = *counters + 1;
-	return true;
-}
-
 /*
  * Make sure the group of events can be scheduled at once
  * on the PMU.
@@ -539,23 +526,20 @@ static bool tx2_uncore_validate_event(struct pmu *pmu,
 static bool tx2_uncore_validate_event_group(struct perf_event *event,
 		int max_counters)
 {
-	struct perf_event *sibling, *leader = event->group_leader;
-	int counters = 0;
+	struct perf_event *sibling;
+	int counters = 1;
 
 	if (event->group_leader == event)
 		return true;
 
-	if (!tx2_uncore_validate_event(event->pmu, leader, &counters))
-		return false;
+	if (event->group_leader->pmu == event->pmu)
+		++counters;
 
-	for_each_sibling_event(sibling, leader) {
-		if (!tx2_uncore_validate_event(event->pmu, sibling, &counters))
-			return false;
+	for_each_sibling_event(sibling, event->group_leader) {
+		if (sibling->pmu == event->pmu)
+			++counters;
 	}
 
-	if (!tx2_uncore_validate_event(event->pmu, event, &counters))
-		return false;
-
 	/*
 	 * If the group requires more counters than the HW has,
 	 * it cannot ever be scheduled.
-- 
2.39.2.101.g768bb238c484.dirty


