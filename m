Return-Path: <linuxppc-dev+bounces-10941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C42B250A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:02:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6B3y5gz3bb6;
	Thu, 14 Aug 2025 03:02:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104530;
	cv=none; b=mKVlQR9UxIFUVOZjUj1wRbLylCP8KzAjnepM5zhmt0D9ljptv1mXL9GMf8BNa+ObHhPeidjqwbbR97SB+rBVXJik5Kgp8LsrcDZcV112CX9TvSFfiD5DmqtP+/cGon1XVLoCyR5nAEAnywhMKWX5OsmgkAPd4wMFbtaSGgiAc2Koh+2k91U+c0I47kyAoq4i9O1XfOjvGG8PGebfGADedyyu9hkecXocJewwt+5eNK7xJseXpNnoWddM4H7Sje1xmggG7Id41DvRxt68lDDYUKFyXV3g4jQvxzxLSp0EVdNmOk9CbTY9rNBhFhrakr+qN+mbL+K53/M7Hr7I48mqxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104530; c=relaxed/relaxed;
	bh=jQ/41hIPpTTrAOpCVHmiPSB53W+ewMMCnOjW1KAGW9M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Klaex8Jgfk8Wdrl/hzlC3hZGE3UjdWGGXbi4+4BmPi+jKlIwZjHlAUTIA1Hsb8X8FFsuiGQZm9FuZwH7rfdxZbpG5jm+qMt4VtZRiOJPluB3o3h/VmayyOFmyEQjBP7hNhR5M0IAZMASDhjPDvPhFvsth5K0tJaalrKbgB+KfxC1FZZhl0LWDQIXUZt5UAQrQsu8gou80wU2u6sU0IRVFI8Mm6OQJ5bvc14nHKslPdg83MUY7U/1up+OUiYmIjlEgkEhwrshErc3ybGM/GGDCOxa3Q79xbzPCDbQqkBg8YZYdy+iKevFwlPtzZmVdje2+QLwEKPfeTeuI/xbwkSoeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F696Dy0z3bV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:09 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 901F71BD0;
	Wed, 13 Aug 2025 10:01:30 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 776713F738;
	Wed, 13 Aug 2025 10:01:34 -0700 (PDT)
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
Subject: [PATCH 03/19] perf/imx8_ddr: Fix group validation
Date: Wed, 13 Aug 2025 18:00:55 +0100
Message-Id: <bfb1445bc741a170302b77e3f513b01cd676c9d8.1755096883.git.robin.murphy@arm.com>
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

The group validation here is erroneously inspecting software events,
as well as other hardware siblings, which are only checked for *after*
they've already been misinterpreted. Once again, just ignore events
which don't belong to our PMU, and don't duplicate what
perf_event_open() will already check for us.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/fsl_imx8_ddr_perf.c | 21 +++++----------------
 1 file changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/perf/fsl_imx8_ddr_perf.c b/drivers/perf/fsl_imx8_ddr_perf.c
index b989ffa95d69..56fe281974d2 100644
--- a/drivers/perf/fsl_imx8_ddr_perf.c
+++ b/drivers/perf/fsl_imx8_ddr_perf.c
@@ -331,6 +331,9 @@ static u32 ddr_perf_filter_val(struct perf_event *event)
 static bool ddr_perf_filters_compatible(struct perf_event *a,
 					struct perf_event *b)
 {
+	/* Ignore grouped events that aren't ours */
+	if (a->pmu != b->pmu)
+		return true;
 	if (!ddr_perf_is_filtered(a))
 		return true;
 	if (!ddr_perf_is_filtered(b))
@@ -409,16 +412,8 @@ static int ddr_perf_event_init(struct perf_event *event)
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
-	if (pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
+	if (event != event->group_leader &&
+	    pmu->devtype_data->quirks & DDR_CAP_AXI_ID_FILTER) {
 		if (!ddr_perf_filters_compatible(event, event->group_leader))
 			return -EINVAL;
 		for_each_sibling_event(sibling, event->group_leader) {
@@ -427,12 +422,6 @@ static int ddr_perf_event_init(struct perf_event *event)
 		}
 	}
 
-	for_each_sibling_event(sibling, event->group_leader) {
-		if (sibling->pmu != event->pmu &&
-				!is_software_event(sibling))
-			return -EINVAL;
-	}
-
 	event->cpu = pmu->cpu;
 	hwc->idx = -1;
 
-- 
2.39.2.101.g768bb238c484.dirty


