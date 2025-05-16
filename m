Return-Path: <linuxppc-dev+bounces-8620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 147D3ABA2C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 May 2025 20:29:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZzbG13qYCz30Vm;
	Sat, 17 May 2025 04:29:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747420169;
	cv=none; b=XnbXJh+Ru0MLncbVUdQl/5ZMVSdCQLtSMcS3QI5yXcVR3Nv2eWXcj5URQGmYMW9IEVe7Eu+31PohSBi1R+hxZs5gd3sIM7o1F6oF8ixbQdjvjNt1iVxuPUL15ygjtPinT5/C/dYn1wM/5jd3P3ElP0p5WwtZQSEfYpAr7VqO7ozCMdsYQ8yNkHGzcto8HswIlOb2SRgt4k23kfD5mJQwi1YsIZKAQlEpsSvupbKHapNt4okcy08MFilnDk4NEBD2LbwxGrOijpAAjWpF5GPme6q575gRdIi7wpP+DEdNje8c00RvS2FQNdDgu7OLVTV2WkJlj4dA9DZyPINmp/EbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747420169; c=relaxed/relaxed;
	bh=l9Sy2nZG/65Ih5GxVFRbkt9VFk6N59raehsFZJZALN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FxjmuTkKh7dzOlevmkqetd5b1+nGMIwBlCdH0aDTWha8BVEjPzoxehOesEpdp83yRUC+CJKgd5WUhVdMTP49NOpS1FajW04cNT0cpHQyclwAcVJI4uZOUiUCrM6iIXvTlRS0zuRD9uxMxm/6uhwAiWTIe44Cadd+HENXOnrAQK1u1QcyZrK/tvD/IpHik1H9CoHZIgfcPL5tn58yCvVIw2plVHWlrFRIQhUbw6+P3vjd6N60zCN5/k9wkkeCGxN54+jtNvms3VQu2LwYd5HQ8wFLVU3wt0yGNKCqvj5bkYtmSH/cxPssdiZwvMIf6bdWpepdpC3lQpZLJAlNaKBBcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l0zc2qsu; dkim-atps=neutral; spf=none (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l0zc2qsu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZzbFy5VN9z30Vf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 May 2025 04:29:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747420167; x=1778956167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s+EyXjLUXo0M2dfj157AL5fvrY36sWvSBJ2tuImTWtk=;
  b=l0zc2qsuW+uJ77BTE49jZtuyG4MAIXB1+iL/Hk49/ayP70LzLIIr0j7/
   fdXQJEjg1TKZTMhpsnlQcm5ze87gT++dRJ9bvCpM6YjtgLYpq5T6JzkbT
   YrUUqkfSFmLNOBZImvk1UN68htCYXecfjVzVZa/wVx5Ddm3+Woovb7DxR
   M/SVNHcQP0xRt0W/XDjDsErOTClakCvOtR56pVq+7DgwnPgOrqlW8lXkl
   kfWbtC44BS3bPs/x1cX/TjODpIedQUkT+wZeAFSlFlEQEk4L+ImEsMQMl
   AjoMcTnZb6jQXVDfwfHwgM1GTv3szx3vWw06Dt2kSLeyQwU74TAWpn7vC
   w==;
X-CSE-ConnectionGUID: aWBWDPAGTH62e4tOhZGN2A==
X-CSE-MsgGUID: KD6CJ5N5SS6zDsrQP5HCzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49328840"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="49328840"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 11:29:22 -0700
X-CSE-ConnectionGUID: JhatOYD3R/aJuVTali1oXA==
X-CSE-MsgGUID: PJZxwUZ2Qo+BlYBDLBCcQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; 
   d="scan'208";a="169802609"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2025 11:29:21 -0700
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
	leo.yan@arm.com,
	Kan Liang <kan.liang@linux.intel.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH V3 06/16] powerpc/perf: Remove driver-specific throttle support
Date: Fri, 16 May 2025 11:28:43 -0700
Message-Id: <20250516182853.2610284-7-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250516182853.2610284-1-kan.liang@linux.intel.com>
References: <20250516182853.2610284-1-kan.liang@linux.intel.com>
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


