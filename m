Return-Path: <linuxppc-dev+bounces-8579-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A65AB6F62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 17:15:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyH3c2CDzz2xtt;
	Thu, 15 May 2025 01:15:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747235756;
	cv=none; b=WS6hsZAM0EJUUkb8xoI7FSeNVbMHB5qzHLubYV1pgQ8usF0vf7dxQ3Qv0IMFROPUKmF/9XKkRY6kCFIjWwOStfMzZ3uq6mP4HQXJvlMqYTZmhT2bKXUg69XFsKQSPJ/2NOxV1Eqadr0MvOuTLrzskeuRG7C1l+pIad6phueMBMKlfH7ovYDQC+uM+3OEd3ireuvh3DmBBwdmIcPVE+HoJoqFKh8RBvVmlW+l3s9iCA/HSAnU77SF0aBYL9w9jTgu4DxhWezUFGmkzcjZcjCa2MJE+5zGohVeHDtj1dqwId0t8NhQWoAQYrC3dPnbOEQ/IfyliXAR/4OJYdjJ0QpBKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747235756; c=relaxed/relaxed;
	bh=l9Sy2nZG/65Ih5GxVFRbkt9VFk6N59raehsFZJZALN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NSref6HmkwX6OUK9DkZeAAxSkGngUsaXp2gWm8eAS5gSzOLlonwHESZ+frypHHq8UvxVSLPh8eWi67PYLuLGHf/I0Og7gqZA3XF3Bl9v5uTde8+yEYSvZeWU5IByJGdRAn9Z2NRHt6+rXpnYCFOOOMeiTXD7Juz0/mGVFHrXH+ViSGtp2N4fAtroey3/BzFn9pukC53hFZNpq6ofnpVDee5/peTN6O1JUEEMHBdDDnr2SGWuliO9B9Vmgv26MWbf7sJX5hJW/XyX4fYx7I/Uv+MlCat59WqumoVAfDXJxIpuvC5UhAtLga5MNjBgjJk92FWXllsmQoOvZeuQ/eJLQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jh9Wq4Tb; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jh9Wq4Tb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 15 May 2025 01:15:53 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyH3Y2xbnz2xCC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 01:15:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747235753; x=1778771753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s+EyXjLUXo0M2dfj157AL5fvrY36sWvSBJ2tuImTWtk=;
  b=Jh9Wq4Tbk7P9e4IL01NFirnzkOVtGjyu39qv3hlTf9sOpYOzoFLhHcgY
   4u92XhNiVuUyn8xSIpwr4G4ajAFhIbhEOlDHgzpC03GqtH/kAkLPyjjnE
   CHbbDRkJNdHwvC4Fjyn4ZKE+zJYnHcEWsbBAGLcP3RjkKKpiApQLr6v8h
   HqJC4KrCubhZ18V+tob7B//IJmpYNFaO/84kZHCX3PFL3gDlH9EskDVw4
   usXGt8GNmSLy7PTGBiG4A5zMlo8CaiszyZ+gOiLARFD4+OL+eBMzGQw5W
   hFYDarOrLMCbbWZ6PEYOvH6Vub/v6FZVnZoTeyI/xMharZ5uESySUD1eV
   Q==;
X-CSE-ConnectionGUID: T7kOFq1DQzqpRTkUimYmCw==
X-CSE-MsgGUID: FMv3+bAuQ9aYVhLf6v7Zjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49072743"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49072743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:14:44 -0700
X-CSE-ConnectionGUID: CIB9tTiBQxeDfYbnRRxmEw==
X-CSE-MsgGUID: X62WA9/KTryQTVKPFxrNVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="142939165"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2025 08:14:44 -0700
From: kan.liang@linux.intel.com
To: peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	irogers@google.com,
	mark.rutland@arm.com,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Cc: eranian@google.com,
	ctshao@google.com,
	tmricht@linux.ibm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH V2 05/15] powerpc/perf: Remove driver-specific throttle support
Date: Wed, 14 May 2025 08:13:51 -0700
Message-Id: <20250514151401.2547932-6-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250514151401.2547932-1-kan.liang@linux.intel.com>
References: <20250514151401.2547932-1-kan.liang@linux.intel.com>
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Kan Liang <kan.liang@linux.intel.com>

The throttle support has been added in the generic code. Remove
the driver-specific throttle support.

Besides the throttle, perf_event_overflow may return true because of
event_limit. It already does an inatomic event disable. The pmu->stop
is not required either.

Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/perf/core-book3s.c  | 6 ++----
 arch/powerpc/perf/core-fsl-emb.c | 3 +--
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 42ff4d167acc..8b0081441f85 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2344,12 +2344,10 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 			ppmu->get_mem_weight(&data.weight.full, event->attr.sample_type);
 			data.sample_flags |= PERF_SAMPLE_WEIGHT_TYPE;
 		}
-		if (perf_event_overflow(event, &data, regs))
-			power_pmu_stop(event, 0);
+		perf_event_overflow(event, &data, regs);
 	} else if (period) {
 		/* Account for interrupt in case of invalid SIAR */
-		if (perf_event_account_interrupt(event))
-			power_pmu_stop(event, 0);
+		perf_event_account_interrupt(event);
 	}
 }
 
diff --git a/arch/powerpc/perf/core-fsl-emb.c b/arch/powerpc/perf/core-fsl-emb.c
index d2ffcc7021c5..7120ab20cbfe 100644
--- a/arch/powerpc/perf/core-fsl-emb.c
+++ b/arch/powerpc/perf/core-fsl-emb.c
@@ -635,8 +635,7 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
 
 		perf_sample_data_init(&data, 0, last_period);
 
-		if (perf_event_overflow(event, &data, regs))
-			fsl_emb_pmu_stop(event, 0);
+		perf_event_overflow(event, &data, regs);
 	}
 }
 
-- 
2.38.1


