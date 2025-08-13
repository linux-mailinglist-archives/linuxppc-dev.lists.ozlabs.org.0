Return-Path: <linuxppc-dev+bounces-10943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498EB250B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 19:02:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6b72Dcz3blg;
	Thu, 14 Aug 2025 03:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755104551;
	cv=none; b=aCUaNemdvsKTjE0tAVxeQH0L3+pxfSWrOnCftfVjptyVK3+fdbUrfLnvn/SSHH4uUUOaQHPNFkRf+TlqxUu4B2DN+nEq3Sr/JsOuaqf7Tu/XMrDtmMj/6x7CXu6+TV8MF51CLmhZPcNCQk+puwdha9ZKbD7s3QymBnEkE7Lb2n+ie8ijCXmbVNgGQ4G7VQnT378W2BFIVcaOEckuAuF+G0fl416LI0TMzDNwj6DcvLAFMkSmsznF8he4JfMhYYUHAiXI627vNSY3KgVkC5VTqe4V1qscsoB5IFbURT5khKeMiK/6wVI8RXXMqfzLA46cD00x6L9gKUvPdKHM+xEqzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755104551; c=relaxed/relaxed;
	bh=Uc8fOc4Lhu/m2WW5BM6aa9lqPgjYRi2ZfrHRXJ8mFBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EpNldndCbfz5E+veoeTyBRQ++N30YJAAtKr+qH4eRyiVmgDzXI23IXDBfd+SB2aITZbltdxAQmxrlYdB/EYbVFRU48+2Lc252YJcQw7yo4GZ9Kb55uUSIPCSvHYMiESWDcF/SO17RlDacu2DwIouKF53xVzroK//HSjBlXWeoCrY6K2u/vVHKFlKqeKxuiRWoFSdYB/IsHMmflMT5Q00oS+JkdgRcARfJ6HPgJxKKnGyfyMJ6pQJuEGTBKiCkHxv3Cig/H0rQaQYwVuqNn17PGWUlG5oNrgUuuWoDvwr4If+bKFcbelYmD8zZjEUi9TBqmirv6bsOd1Zq3bYFfuSwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c2F6b3DwYz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Aug 2025 03:02:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29D641C01;
	Wed, 13 Aug 2025 10:01:44 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 074E03F738;
	Wed, 13 Aug 2025 10:01:47 -0700 (PDT)
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
Subject: [PATCH 06/19] ARM: l2x0: Fix group validation
Date: Wed, 13 Aug 2025 18:00:58 +0100
Message-Id: <925c34a4b7f0defc3582a9fcccb6af1c21279a86.1755096883.git.robin.murphy@arm.com>
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

The group validation here is almost right, but fails to count the new
event itself. While we fix that, also adopt the standard pattern to
avoid racy access the sibling list and drop checks that are redundant
with core code.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 arch/arm/mm/cache-l2x0-pmu.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0-pmu.c b/arch/arm/mm/cache-l2x0-pmu.c
index 93ef0502b7ff..6fc1171031a8 100644
--- a/arch/arm/mm/cache-l2x0-pmu.c
+++ b/arch/arm/mm/cache-l2x0-pmu.c
@@ -274,18 +274,17 @@ static bool l2x0_pmu_group_is_valid(struct perf_event *event)
 	struct pmu *pmu = event->pmu;
 	struct perf_event *leader = event->group_leader;
 	struct perf_event *sibling;
-	int num_hw = 0;
+	int num_hw = 1;
+
+	if (leader == event)
+		return true;
 
 	if (leader->pmu == pmu)
 		num_hw++;
-	else if (!is_software_event(leader))
-		return false;
 
 	for_each_sibling_event(sibling, leader) {
 		if (sibling->pmu == pmu)
 			num_hw++;
-		else if (!is_software_event(sibling))
-			return false;
 	}
 
 	return num_hw <= PMU_NR_COUNTERS;
-- 
2.39.2.101.g768bb238c484.dirty


