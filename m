Return-Path: <linuxppc-dev+bounces-10950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC0B250CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:03:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6n5nBqz3bpS;
	Thu, 14 Aug 2025 03:02:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104561;
	cv=none; b=kvQaP5+e4ISCD1CvYhr+gNy4RXAdTvJpJioEPmow+ejcp06lJhH2jVH4CoxKOGq7L3j//6hRZRChJSMczJ0mlecZm8g2QhEVKATajW93sZJd7VbOUMoDBtxWGcOuiUEjCalupJeAo/VHdUH5r5eZnLLJjwtorR5IrPfZJ2aFimjujijpstLcFnEk9mF6mt/FR7s/REcPH+llk0qnfJ331XpT0A5hNcgkWyxjHp5pLUaS8ekbrYnEsMtGMlf62L8Vfv6C56eR3M+nNZVC98yyyH8HmH7bDYGxUKjxp63lNd4B5RbTJ/8g8DryU+kfb4Hjw/fZXiaRpFgx6OOi0AUdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104561; c=relaxed/relaxed;
	bh=Z1fPRqYnV6aR5TuB9Je51zw0t5F0DkBhJ3b+qU0qgjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E22kS3v4kt/nGUWsKaFdSAvZb5iXgS70IX5vio5KJys9ztuizbcbZdCVs7+CfrLeBZAKfVlkuee5Alo5m1sDQtHRUztTAMQw3bsEGJ9B0gZrxLYIK0XCP6kSYvklbiriAwOKyS2+xkLIg7xMVIKdMD0jhBHWp+JN0aCjbpMNysOytD1Zrp5q8l94r5BR9wHDPJkl/22/ONfUWbMwJHwJ/6cBV/3SDCnIfaudWYtObnYcZA+HE90TJ+GMLHk1ABnzCDU8++mkCOB7vgY0WnZ36tH8S9nwFMBtWmJ+yldy2XXbUHCKklDSyjQH+G0vbQA7jjCJCRho7Fx+UToEROcbUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6n1PYsz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:41 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AAD71CE2;
	Wed, 13 Aug 2025 10:02:02 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1F4713F738;
	Wed, 13 Aug 2025 10:02:06 -0700 (PDT)
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
Subject: [PATCH 10/19] perf/arm-ni: Improve event validation
Date: Wed, 13 Aug 2025 18:01:02 +0100
Message-Id: <b1cf78c0f67dda1069f5132db9093fe0dec4c66e.1755096883.git.robin.murphy@arm.com>
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

Although it is entirely benign for arm_ni_val_count_event() to count
any old hardware leader/sibling as an NI event (perf core will still
ultimately reject the cross-PMU group), it would still be nicer if it
didn't. Stop trying to special-case software events and simply skip any
event which doesn't belong to our PMU. Similarly drop the early return
paths since they can almost never actually return early.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-ni.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 1615a0564031..d6b683a0264e 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -271,40 +271,37 @@ static void arm_ni_pmu_disable(struct pmu *pmu)
 }
 
 struct arm_ni_val {
+	const struct pmu *pmu;
 	unsigned int evcnt;
 	unsigned int ccnt;
 };
 
-static bool arm_ni_val_count_event(struct perf_event *evt, struct arm_ni_val *val)
+static void arm_ni_val_count_event(struct perf_event *evt, struct arm_ni_val *val)
 {
-	if (is_software_event(evt))
-		return true;
-
-	if (NI_EVENT_TYPE(evt) == NI_PMU) {
-		val->ccnt++;
-		return val->ccnt <= 1;
+	if (evt->pmu == val->pmu) {
+		if (NI_EVENT_TYPE(evt) == NI_PMU)
+			val->ccnt++;
+		else
+			val->evcnt++;
 	}
-
-	val->evcnt++;
-	return val->evcnt <= NI_NUM_COUNTERS;
 }
 
 static int arm_ni_validate_group(struct perf_event *event)
 {
 	struct perf_event *sibling, *leader = event->group_leader;
-	struct arm_ni_val val = { 0 };
+	struct arm_ni_val val = { .pmu = event->pmu };
 
 	if (leader == event)
 		return 0;
 
 	arm_ni_val_count_event(event, &val);
-	if (!arm_ni_val_count_event(leader, &val))
+	arm_ni_val_count_event(leader, &val);
+	for_each_sibling_event(sibling, leader)
+		arm_ni_val_count_event(sibling, &val);
+
+	if (val.evcnt > NI_NUM_COUNTERS || val.ccnt > 1)
 		return -EINVAL;
 
-	for_each_sibling_event(sibling, leader) {
-		if (!arm_ni_val_count_event(sibling, &val))
-			return -EINVAL;
-	}
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


