Return-Path: <linuxppc-dev+bounces-10957-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A1FB250E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F780Byxz3cZy;
	Thu, 14 Aug 2025 03:03:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104580;
	cv=none; b=dKFh9MGAY1Feez/KodN2BPygKNYmk2TCO6R7BUOPkwWBaWJKlxO2wmA82kKX7XwZF7HJsqVsBJSW3JYJJwsDIV+u+xHtJowJltlCZo09WB08CLFuAmAnLw5hy5x80ywmFp70Rr2LH5RE24NildBC9mUxaFMkRuYX57mqA2sxluKYf7seyHI482FiBQeM266fVw2zYMp8IwsRCRuRWg8OevhdvsbAnSbG5QG3UKtnUuS1hQK70VD3O6fltXGFis9xz7/qspAhclnprC2ztTeXuGcEUAsZaepYUhpYijHeUFN76r/CuhzhFai8s9fm8bV9/CBUMuK4b7Fvskfxgs6izQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104580; c=relaxed/relaxed;
	bh=vKffw2qIY7FBZiLyX+4YSMdw1nxSd+bXuH1ERvjOzvw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hPXKQFMHwzLvX/FxGJpFsh3O/IRSRstX3M+/VGmxk5TfpF2Jc7inbsf61GFLSPkqdkxTvQoO7Ir1OWSN+OB8yQ1ole6oM0BcZZsR5an7Fjk3W9kV9XRlkG1NXIJOenRABdxcDC4FV8b6LGnMNclfwHtE9GZ+iBm7FoPtscqFnoTW9N1YPjJnuijcXu5HpaQuyInYdkbajdbqLDk8QtNt2Q4BbuvEHiFl/Ikq7V16XfQMtdUaulrbixWn4Ot4NSwnO/5FRlYpKDW+xJdmQ9btDO2nOtqUJ3N2yBJ17PXxz7UuJKxpDsW8eBTm36ykdgf+EIns23xzX7iLljvwPhtsLA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F772Kz1z3cZx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:59 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A3B1E2F;
	Wed, 13 Aug 2025 10:02:20 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A6983F738;
	Wed, 13 Aug 2025 10:02:24 -0700 (PDT)
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
Subject: [PATCH 14/19] perf: Clean up redundant group validation
Date: Wed, 13 Aug 2025 18:01:06 +0100
Message-Id: <778547b3a1c6eb907a7d775c5ac579610ea2be71.1755096883.git.robin.murphy@arm.com>
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

None of these drivers are doing anything that perf_event_open() doesn't
inherently do as of commit bf480f938566 ("perf/core: Don't allow
grouping events from different hw pmus"). While it's quite possible
that they should be doing some actual validation of the schedulability
of their own events within the given group, for now at least removing
this redundant code makes it even clearer that they are not.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ccn.c               | 16 ----------------
 drivers/perf/fsl_imx9_ddr_perf.c     | 16 ----------------
 drivers/perf/marvell_cn10k_ddr_pmu.c |  5 -----
 drivers/perf/xgene_pmu.c             | 15 ---------------
 4 files changed, 52 deletions(-)

diff --git a/drivers/perf/arm-ccn.c b/drivers/perf/arm-ccn.c
index 1a0d0e1a2263..63549aad3b99 100644
--- a/drivers/perf/arm-ccn.c
+++ b/drivers/perf/arm-ccn.c
@@ -708,7 +708,6 @@ static int arm_ccn_pmu_event_init(struct perf_event *event)
 	u32 node_xp, type, event_id;
 	int valid;
 	int i;
-	struct perf_event *sibling;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -814,21 +813,6 @@ static int arm_ccn_pmu_event_init(struct perf_event *event)
 				node_xp, type, port);
 	}
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable (for example to create a CCN group
-	 * periodically read when a hrtimer aka cpu-clock leader triggers).
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
index 267754fdf581..85874ec5ecd0 100644
--- a/drivers/perf/fsl_imx9_ddr_perf.c
+++ b/drivers/perf/fsl_imx9_ddr_perf.c
@@ -552,7 +552,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 {
 	struct ddr_pmu *pmu = to_ddr_pmu(event->pmu);
 	struct hw_perf_event *hwc = &event->hw;
-	struct perf_event *sibling;
 
 	if (event->attr.type != event->pmu->type)
 		return -ENOENT;
@@ -565,21 +564,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable (for example to create a CCN group
-	 * periodically read when a hrtimer aka cpu-clock leader triggers).
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	event->cpu = pmu->cpu;
 	hwc->idx = -1;
 
diff --git a/drivers/perf/marvell_cn10k_ddr_pmu.c b/drivers/perf/marvell_cn10k_ddr_pmu.c
index 72ac17efd846..54e3fd206d39 100644
--- a/drivers/perf/marvell_cn10k_ddr_pmu.c
+++ b/drivers/perf/marvell_cn10k_ddr_pmu.c
@@ -487,11 +487,6 @@ static int cn10k_ddr_perf_event_init(struct perf_event *event)
 		return -EOPNOTSUPP;
 	}
 
-	/*  We must NOT create groups containing mixed PMUs */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader))
-		return -EINVAL;
-
 	/* Set ownership of event to one CPU, same event can not be observed
 	 * on multiple cpus at same time.
 	 */
diff --git a/drivers/perf/xgene_pmu.c b/drivers/perf/xgene_pmu.c
index 33b5497bdc06..5e80ae0e692d 100644
--- a/drivers/perf/xgene_pmu.c
+++ b/drivers/perf/xgene_pmu.c
@@ -877,7 +877,6 @@ static int xgene_perf_event_init(struct perf_event *event)
 {
 	struct xgene_pmu_dev *pmu_dev = to_pmu_dev(event->pmu);
 	struct hw_perf_event *hw = &event->hw;
-	struct perf_event *sibling;
 
 	/* Test the event attr type check for PMU enumeration */
 	if (event->attr.type != event->pmu->type)
@@ -913,20 +912,6 @@ static int xgene_perf_event_init(struct perf_event *event)
 	 */
 	hw->config_base = event->attr.config1;
 
-	/*
-	 * We must NOT create groups containing mixed PMUs, although software
-	 * events are acceptable
-	 */
-	if (event->group_leader->pmu != event->pmu &&
-			!is_software_event(event->group_leader))
-		return -EINVAL;
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


