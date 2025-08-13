Return-Path: <linuxppc-dev+bounces-10940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B065B250A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:02:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F655LzLz30Wg;
	Thu, 14 Aug 2025 03:02:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104525;
	cv=none; b=N1SpwvT/K0fTRwFZfdG8ormbICiCn3hvLM26gzuxkbXngvzzDeLXcRsbpQN0wgbn1lTxGgDm8DYuFeE7bHaekbBeBcZEQmlaMmVAbvSJoW3icVnz0JwtF+8NJkCX7GfU1QCjL1UGJV/CpJc4E0Vs0VHM4ZOQrJWEEd9tXBBCxGzHO2PITbhyfzvfal1bDNE33gLKb9HAlsQmky4VH7zzYJnbos4nNyfbPZlVGZvyJVqoFo04GXKyhELmG6MCTCU7Vzlioz0bBHaknFuhuau3wAECzd1yHBBLxmDQ7kU6FNlWJq04a+gtNY24kMSiODuaV3PH2Md327LZ5Sn3Ob5jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104525; c=relaxed/relaxed;
	bh=OtNOzTh64MmC/rI51h5ufDfuZnMgR3SAG018NNvubv8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M8iiWTciYf47b2jdYHoZvjQfFBxN/8SxPXjmS04p1bWf5AJFMnpSteyqo90WLNAvcGiz7QnPzB/6YKWbXdIpoJyetvNPZ9lGwhlSmQHhRngWudYAxsBkBHHm2wuduhvgzmVrDSxOHzlWng/iWVV7ox24Aq820qTLCu8PmCu77X0E6pw7yL35ZZlh7vYKIlECPkuIbyuHv9bVSvHshdQAsd0VR68z3OOUimMUgDa2w6PtuAP8CCUh5a2/ygrEcFiut9I6QxvgiQZHT59UJl0Xl229+jZKsi8Hpn/RRVV1E/YQ7hJZaGNHaCItxXp52IfE5tMMTCL6I4wakPQRj6lX3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F65173vz30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 128701BCB;
	Wed, 13 Aug 2025 10:01:26 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEB253F738;
	Wed, 13 Aug 2025 10:01:29 -0700 (PDT)
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
Subject: [PATCH 02/19] perf/hisilicon: Fix group validation
Date: Wed, 13 Aug 2025 18:00:54 +0100
Message-Id: <c7b877e66ba0d34d8558c5af8bbb620e8c0e47d9.1755096883.git.robin.murphy@arm.com>
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

The group validation logic shared by the HiSilicon HNS3/PCIe drivers is
a bit off, in that given a software group leader, it will consider that
event *in place of* the actual new event being opened. At worst this
could theoretically allow an unschedulable group if the software event
config happens to look like one of the hardware siblings.

The uncore framework avoids that particular issue, but all 3 also share
the common issue of not preventing racy access to the sibling list, and
some redundant checks which can be cleaned up.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/hisilicon/hisi_pcie_pmu.c   | 17 ++++++-----------
 drivers/perf/hisilicon/hisi_uncore_pmu.c | 23 +++++++----------------
 drivers/perf/hisilicon/hns3_pmu.c        | 17 ++++++-----------
 3 files changed, 19 insertions(+), 38 deletions(-)

diff --git a/drivers/perf/hisilicon/hisi_pcie_pmu.c b/drivers/perf/hisilicon/hisi_pcie_pmu.c
index c5394d007b61..3b0b2f7197d0 100644
--- a/drivers/perf/hisilicon/hisi_pcie_pmu.c
+++ b/drivers/perf/hisilicon/hisi_pcie_pmu.c
@@ -338,21 +338,16 @@ static bool hisi_pcie_pmu_validate_event_group(struct perf_event *event)
 	int counters = 1;
 	int num;
 
-	event_group[0] = leader;
-	if (!is_software_event(leader)) {
-		if (leader->pmu != event->pmu)
-			return false;
+	if (leader == event)
+		return true;
 
-		if (leader != event && !hisi_pcie_pmu_cmp_event(leader, event))
-			event_group[counters++] = event;
-	}
+	event_group[0] = event;
+	if (leader->pmu == event->pmu && !hisi_pcie_pmu_cmp_event(leader, event))
+		event_group[counters++] = leader;
 
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
-
 		if (sibling->pmu != event->pmu)
-			return false;
+			continue;
 
 		for (num = 0; num < counters; num++) {
 			/*
diff --git a/drivers/perf/hisilicon/hisi_uncore_pmu.c b/drivers/perf/hisilicon/hisi_uncore_pmu.c
index a449651f79c9..3c531b36cf25 100644
--- a/drivers/perf/hisilicon/hisi_uncore_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_pmu.c
@@ -101,26 +101,17 @@ static bool hisi_validate_event_group(struct perf_event *event)
 	/* Include count for the event */
 	int counters = 1;
 
-	if (!is_software_event(leader)) {
-		/*
-		 * We must NOT create groups containing mixed PMUs, although
-		 * software events are acceptable
-		 */
-		if (leader->pmu != event->pmu)
-			return false;
+	if (leader == event)
+		return true;
 
-		/* Increment counter for the leader */
-		if (leader != event)
-			counters++;
-	}
+	/* Increment counter for the leader */
+	if (leader->pmu == event->pmu)
+		counters++;
 
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
-		if (sibling->pmu != event->pmu)
-			return false;
 		/* Increment counter for each sibling */
-		counters++;
+		if (sibling->pmu == event->pmu)
+			counters++;
 	}
 
 	/* The group can not count events more than the counters in the HW */
diff --git a/drivers/perf/hisilicon/hns3_pmu.c b/drivers/perf/hisilicon/hns3_pmu.c
index c157f3572cae..382e469257f9 100644
--- a/drivers/perf/hisilicon/hns3_pmu.c
+++ b/drivers/perf/hisilicon/hns3_pmu.c
@@ -1058,21 +1058,16 @@ static bool hns3_pmu_validate_event_group(struct perf_event *event)
 	int counters = 1;
 	int num;
 
-	event_group[0] = leader;
-	if (!is_software_event(leader)) {
-		if (leader->pmu != event->pmu)
-			return false;
+	if (leader == event)
+		return true;
 
-		if (leader != event && !hns3_pmu_cmp_event(leader, event))
-			event_group[counters++] = event;
-	}
+	event_group[0] = event;
+	if (leader->pmu == event->pmu && !hns3_pmu_cmp_event(leader, event))
+		event_group[counters++] = leader;
 
 	for_each_sibling_event(sibling, event->group_leader) {
-		if (is_software_event(sibling))
-			continue;
-
 		if (sibling->pmu != event->pmu)
-			return false;
+			continue;
 
 		for (num = 0; num < counters; num++) {
 			/*
-- 
2.39.2.101.g768bb238c484.dirty


