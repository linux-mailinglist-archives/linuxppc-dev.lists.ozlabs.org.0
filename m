Return-Path: <linuxppc-dev+bounces-10944-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F4CB250B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:02:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6c1vtnz3bmS;
	Thu, 14 Aug 2025 03:02:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104552;
	cv=none; b=C/PJAgfQTsLSbbQLFK2QLV8qgm8jZ3DtUhnbILAdThx81rhwGk2EL0SMZ9ypILDE+yhVFRGmOqL1foI9Wm3uYT8gE62eMQmIhSYVVuaalSOrdDEbXHY7W/7LARtm2HVg2LOksZPOXx7suXukL1bH1he2ZssUBImn+sit/+Mv7VevizKaghbl/zgzh8scEba1EeAXcyNYLMHKN3Bwc6Ll/x5CiInQpXDDwXWEieir6jjsLP2tZoSSF+pxf41Ct2aKxM9Q7EMLvSvvaNcmLDbzjltln0/fzCD8+PHGQxV4slPQXrIxxJWwTb8nitqosvYhHQKUYVRAafOYAoUIsg6Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104552; c=relaxed/relaxed;
	bh=jiRkyMGNQe8ri4us5YwuHaYzp7gBwG5DOl+ObHonGLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I0WiO5BWycDjs2BO/XpQIBR2yvSW6ZlSrcgZuyCYyA/YL6+7QEG5yhnh0IiVOl+xrq7xsd6dDykQuNoQPeSgRT7FURm2gyIXwGxkLJ/oNIQs3mN+P/yfeohVMln3QMClaujw+uuFrBzii0WfPeCCStmAOiuuI2gaNa7BBcXw3OXxZI2FdifBkIsGFBfGDRGtAUjSLWH8jo34twKMq4L5G3PSIcceIIuiqTAaeF/IbSTA2YoKu2Pt/R4pn8Umi+BcVjbSBBvq9CxYuFoMqPFVjVDerEGfEfARzSFFcjz3VwQdNJV5rmTh44tCgYAqwNQD4X7jRTXCtZrpYk1LzFSU0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6b4c05z3blF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93BEC1C00;
	Wed, 13 Aug 2025 10:01:39 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7CB223F738;
	Wed, 13 Aug 2025 10:01:43 -0700 (PDT)
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
Subject: [PATCH 05/19] iommu/vt-d: Fix perfmon group validation
Date: Wed, 13 Aug 2025 18:00:57 +0100
Message-Id: <fcc4a9091ff02606df9495fd16b00094216a933e.1755096883.git.robin.murphy@arm.com>
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

The group validation here has a few issues to fix: firstly, failing to
count the group leader or the event being opened itself. Secondly it
appears wrong not to count disabled sibling events given that they could
be enabled later. Finally there's the subtlety that we should avoid racy
access to the sibling list when the event is its own group leader.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/intel/perfmon.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/intel/perfmon.c b/drivers/iommu/intel/perfmon.c
index 75f493bcb353..c3a1ac14cb2b 100644
--- a/drivers/iommu/intel/perfmon.c
+++ b/drivers/iommu/intel/perfmon.c
@@ -258,21 +258,25 @@ static int iommu_pmu_validate_group(struct perf_event *event)
 {
 	struct iommu_pmu *iommu_pmu = iommu_event_to_pmu(event);
 	struct perf_event *sibling;
-	int nr = 0;
+	int nr = 1;
 
+	if (event == event->group_leader)
+		return 0;
 	/*
 	 * All events in a group must be scheduled simultaneously.
 	 * Check whether there is enough counters for all the events.
 	 */
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (!is_iommu_pmu_event(iommu_pmu, sibling) ||
-		    sibling->state <= PERF_EVENT_STATE_OFF)
-			continue;
+	if (is_iommu_pmu_event(iommu_pmu, event->group_leader))
+		++nr;
 
-		if (++nr > iommu_pmu->num_cntr)
-			return -EINVAL;
+	for_each_sibling_event(sibling, event->group_leader) {
+		if (is_iommu_pmu_event(iommu_pmu, sibling))
+			++nr;
 	}
 
+	if (nr > iommu_pmu->num_cntr)
+		return -EINVAL;
+
 	return 0;
 }
 
-- 
2.39.2.101.g768bb238c484.dirty


