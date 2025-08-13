Return-Path: <linuxppc-dev+bounces-10939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA11B2509C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:02:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F611p8Yz30Qk;
	Thu, 14 Aug 2025 03:02:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104521;
	cv=none; b=HanKSSJ1U77uxBXlEsPgpO6seaG2wD3Mp1ZxjdaEO0a5udQ3AKE7BwwFPm2MpgQmmY3Y1s5PSZfyiRaF/jMuyvUkq66VMzPQJyLoUV84Qe1xiBraPUw27udC09aw2QdQbExanHl70ufIzLMevwi0+D85NTmtfWBIZKs4ZiNI5YzYqm0HgY4md/rZI4b+CqmEj/OTvIiIkQF/JmN7vcBFQqXdP8pHP7VnnjmncSK75K6EhsFHlEPtZWZzckqURKTDE/9lVd4J+0osnBbXo7nCuklbT1H9hVM1CeEKkPO4Gew4XhqsOi2NCRuZkT/T9x8XUp5IR/GA6Gg0GMP/vKWz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104521; c=relaxed/relaxed;
	bh=NHREWrH7Mbs7rvCbLIz7UIapzcu/f0n2BpaQMkaLxAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G4vzQoay8fZv2GnBeIKyCQPF0CYuBliTaIXUwrBnCcw3IvRZIx7DZuNIt1wf1QzKkeeVvogQ5FkG8pooEb+5jZbMzxXYzbASH3ZUyJsQn2ReTa7gV3qCSgxbFTCakF9C9srIVCLac6E287062uGJBRwQ30cnspKQUOmqaCFvJxqJTiQU+UlJPpsAqcA7+J1hvShG2bIViCqh1nzXTxM1WGFZVtFGRaHoifZNo3DMlIAmMvCYcC9NSXnEe4HZ9DzGW+Wf6qoLr6I5ewSSjWLJbnHmGDj37gtJA8eNwtohBrGILF19mrCPwpBAk84B+YmXzmn0f66ls8G9VngegqEF6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6060f6z30W9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:00 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8977914BF;
	Wed, 13 Aug 2025 10:01:21 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 704653F738;
	Wed, 13 Aug 2025 10:01:25 -0700 (PDT)
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
Subject: [PATCH 01/19] perf/arm-cmn: Fix event validation
Date: Wed, 13 Aug 2025 18:00:53 +0100
Message-Id: <0716da3e77065f005ef6ea0d10ddf67fc53e76cb.1755096883.git.robin.murphy@arm.com>
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

In the hypothetical case where a CMN event is opened with a software
group leader that already has some other hardware sibling, currently
arm_cmn_val_add_event() could try to interpret the other event's data
as an arm_cmn_hw_event, which is not great since we dereference a
pointer from there... Thankfully the way to be more robust is to be
less clever - stop trying to special-case software events and simply
skip any event that isn't for our PMU.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/perf/arm-cmn.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/perf/arm-cmn.c b/drivers/perf/arm-cmn.c
index 11fb2234b10f..f8c9be9fa6c0 100644
--- a/drivers/perf/arm-cmn.c
+++ b/drivers/perf/arm-cmn.c
@@ -1652,7 +1652,7 @@ static void arm_cmn_val_add_event(struct arm_cmn *cmn, struct arm_cmn_val *val,
 	enum cmn_node_type type;
 	int i;
 
-	if (is_software_event(event))
+	if (event->pmu != &cmn->pmu)
 		return;
 
 	type = CMN_EVENT_TYPE(event);
@@ -1693,9 +1693,6 @@ static int arm_cmn_validate_group(struct arm_cmn *cmn, struct perf_event *event)
 	if (leader == event)
 		return 0;
 
-	if (event->pmu != leader->pmu && !is_software_event(leader))
-		return -EINVAL;
-
 	val = kzalloc(sizeof(*val), GFP_KERNEL);
 	if (!val)
 		return -ENOMEM;
-- 
2.39.2.101.g768bb238c484.dirty


