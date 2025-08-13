Return-Path: <linuxppc-dev+bounces-10948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FFEB250C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:03:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6j2457z3cYH;
	Thu, 14 Aug 2025 03:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104557;
	cv=none; b=HKAmRKSyGY19NoZMJA5fTtcMYgLhFksM+rCBHymA8Ha6Ea9Yw2To+bEHPVLSqHqM+xJu/dLW3H3/t4CHEkZTdec9boLR6n4ON3r1uEpgqxXJ3EaghT5yV0N6C5yBxbGJIj03VR9/tIBvfawC7Wq9mWO8ots9JtrNEUO83gAkbuYKTrMNLgWyd3DtepP9jxPbCaz47ndtcGocUa7kXjYsWHB1QnXyuSdHaD6/uAvXRnDdjBbOwqjuhoameV8OHk3iTxyAzk2lWqMnTJEG46/YpMAcq6KiCgrmT2xtLoSc7YH+tkL5s2MZYxOHvDLfWPDY1IJFYCE3iJx7L0+wK3UPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104557; c=relaxed/relaxed;
	bh=6zMyqiCv2M/U2yYZT3qMYAKyPv8u005FDdR0kHpu8uw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kGat2BBWgPbNyG1gCDJbzuaH1np8OV+VnVA+h+hfrpuFNZtPYXb1S7aiPPlGOsuTq1Xhs05wNw5AuV4PLw7CliWgRqqlvd+yuK31dk9ALIMuZthsFqZamTMLliMr1vBhk9CyhbEdkEBzpGaUye3demTf9/fFUwkZgw/c30r2yn54qBAz080Iret6pdgl4aA0nU091oTaZ2mfDM3RieCniGg2giB/aCljAE+3vgX3Lm7RrFdwDXH5cMduzDtXlD2OkEwNFnxyuFrBB6auw4uPUTTVox1A3Xy4vuy1MtFXjF50mTwqjfE5e8cyaD8vzcQouOBJrvOp0FcpzbP6DkRMaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6h57hCz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:36 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEBB71CE0;
	Wed, 13 Aug 2025 10:01:57 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 95E5A3F738;
	Wed, 13 Aug 2025 10:02:01 -0700 (PDT)
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
Subject: [PATCH 09/19] perf/qcom: Improve group validation
Date: Wed, 13 Aug 2025 18:01:01 +0100
Message-Id: <ae74987481902e3937a8aa7ceaee4adcc681d7b4.1755096883.git.robin.murphy@arm.com>
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

The L3 driver's group validation is almost right, except for erroneously
counting a software group leader - which is benign other than
artificially limiting the maximum size of such a group to one less than
it could be. Correct that with the now-established pattern of simply
ignoring all events which do not belong to our PMU.

The L2 driver gets a cleanup of some slightly suspicious logic, and both
can have the same overall simplification to not duplicate things that perf
core will already do, and avoid racy access to the sibling list of group
leader events.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/qcom_l2_pmu.c | 81 +++++++++++++++-----------------------
 drivers/perf/qcom_l3_pmu.c | 14 +++----
 2 files changed, 37 insertions(+), 58 deletions(-)

diff --git a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c
index ea8c85729937..9c4e1d89718d 100644
--- a/drivers/perf/qcom_l2_pmu.c
+++ b/drivers/perf/qcom_l2_pmu.c
@@ -468,23 +468,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Don't allow groups with mixed PMUs, except for s/w events */
-	if (event->group_leader->pmu != event->pmu &&
-	    !is_software_event(event->group_leader)) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Can't create mixed PMU group\n");
-		return -EINVAL;
-	}
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-		    !is_software_event(sibling)) {
-			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-				 "Can't create mixed PMU group\n");
-			return -EINVAL;
-		}
-	}
-
 	cluster = get_cluster_pmu(l2cache_pmu, event->cpu);
 	if (!cluster) {
 		/* CPU has not been initialised */
@@ -493,39 +476,6 @@ static int l2_cache_event_init(struct perf_event *event)
 		return -EINVAL;
 	}
 
-	/* Ensure all events in a group are on the same cpu */
-	if ((event->group_leader != event) &&
-	    (cluster->on_cpu != event->group_leader->cpu)) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Can't create group on CPUs %d and %d",
-			 event->cpu, event->group_leader->cpu);
-		return -EINVAL;
-	}
-
-	if ((event != event->group_leader) &&
-	    !is_software_event(event->group_leader) &&
-	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
-	     L2_EVT_GROUP(event->attr.config))) {
-		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			 "Column exclusion: conflicting events %llx %llx\n",
-		       event->group_leader->attr.config,
-		       event->attr.config);
-		return -EINVAL;
-	}
-
-	for_each_sibling_event(sibling, event->group_leader) {
-		if ((sibling != event) &&
-		    !is_software_event(sibling) &&
-		    (L2_EVT_GROUP(sibling->attr.config) ==
-		     L2_EVT_GROUP(event->attr.config))) {
-			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
-			     "Column exclusion: conflicting events %llx %llx\n",
-					    sibling->attr.config,
-					    event->attr.config);
-			return -EINVAL;
-		}
-	}
-
 	hwc->idx = -1;
 	hwc->config_base = event->attr.config;
 
@@ -534,6 +484,37 @@ static int l2_cache_event_init(struct perf_event *event)
 	 * same cpu context, to avoid races on pmu_enable etc.
 	 */
 	event->cpu = cluster->on_cpu;
+	if (event->cpu != event->group_leader->cpu) {
+		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			 "Can't create group on CPUs %d and %d",
+			 event->cpu, event->group_leader->cpu);
+		return -EINVAL;
+	}
+
+	if (event == event->group_leader)
+		return 0;
+
+	if ((event->group_leader->pmu == event->pmu) &&
+	    (L2_EVT_GROUP(event->group_leader->attr.config) ==
+	     L2_EVT_GROUP(event->attr.config))) {
+		dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			 "Column exclusion: conflicting events %llx %llx\n",
+		       event->group_leader->attr.config,
+		       event->attr.config);
+		return -EINVAL;
+	}
+
+	for_each_sibling_event(sibling, event->group_leader) {
+		if ((sibling->pmu == event->pmu) &&
+		    (L2_EVT_GROUP(sibling->attr.config) ==
+		     L2_EVT_GROUP(event->attr.config))) {
+			dev_dbg_ratelimited(&l2cache_pmu->pdev->dev,
+			     "Column exclusion: conflicting events %llx %llx\n",
+					    sibling->attr.config,
+					    event->attr.config);
+			return -EINVAL;
+		}
+	}
 
 	return 0;
 }
diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 66e6cabd6fff..f0cf6c33418d 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -454,18 +454,16 @@ static bool qcom_l3_cache__validate_event_group(struct perf_event *event)
 	struct perf_event *sibling;
 	int counters = 0;
 
-	if (leader->pmu != event->pmu && !is_software_event(leader))
-		return false;
+	if (leader == event)
+		return true;
 
 	counters = event_num_counters(event);
-	counters += event_num_counters(leader);
+	if (leader->pmu == event->pmu)
+		counters += event_num_counters(leader);
 
 	for_each_sibling_event(sibling, leader) {
-		if (is_software_event(sibling))
-			continue;
-		if (sibling->pmu != event->pmu)
-			return false;
-		counters += event_num_counters(sibling);
+		if (sibling->pmu == event->pmu)
+			counters += event_num_counters(sibling);
 	}
 
 	/*
-- 
2.39.2.101.g768bb238c484.dirty


