Return-Path: <linuxppc-dev+bounces-8763-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC8ABE26A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 20:17:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b22p84Fy0z30g6;
	Wed, 21 May 2025 04:17:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747765040;
	cv=none; b=nPAy3NB7Fmw0BxTjr3IZaDkN+L7VjiPCvh7a3/aDWb0//rjcVHJBU+uvOozUVZtcpSHdKFVNTKLG0v76ZvUOikCHCJIpNjCRr4MZuH8beeJx0w3myKh7o6FYy49BjOwOe35CTct1kXvOKBSbRLmA7rs6xkkvLN5GrTbcuiFPhUWImcPARKbDcq9Wgumw0ztIOqrgHxCLmX4ULgfOIRXepgZApOGRPnL79Rngk4qIU6wo4/W5Zf7ywxyaD4my6O666sdIlRyQArtv88dt/+3RHOEBRl066SeOdGeE2BwoR5OL/yfqtjgXYeAdYrIiqqe2VBecdgaKQFqx54e/7b30ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747765040; c=relaxed/relaxed;
	bh=l9Sy2nZG/65Ih5GxVFRbkt9VFk6N59raehsFZJZALN4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f03E/Jbh+ZfTOEKMVasdEosnEyMPYCxS0Ga0faI6/SYFVTXGv24uhxim/Hb5HcQnyh7V5d1ooDoLv9cT1mUIyVRWD4pCUfCyft3jPigNW/LcP/gFjKjJFMV5f+emdPF6EsT60TUnNVizmKmUf19+Ws0arlAUzqG+P1NxVtrAGTV7BF9uwGEN6XXQ36zpqiim8ZkFJUJMlhRYjW9gwt3kGxDoW1WXPleWXzeFvS+RuFkitAEMr3RUwKEkluoQZoHoAfGFZ9DfWS8SOmWWRzetlFiSIa1f+bUuJjbeed3Ii1JcyA47RaEOZzQsixLJIPwgruj/KzNTgTwASzJvovVkZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RxCbWxZa; dkim-atps=neutral; spf=none (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RxCbWxZa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=kan.liang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b22p56CShz2yr1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 04:17:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747765038; x=1779301038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s+EyXjLUXo0M2dfj157AL5fvrY36sWvSBJ2tuImTWtk=;
  b=RxCbWxZaJDODVHd0IJ9UD4Ot6yqQcPLMJfVLeGmKzP1TPWXJQ2OPUvb5
   oobJR5FUTTNDKa4Cn2gTINzorIkh88baf+7b9w34rM0Oxrw9rNIqkj2dI
   hVCugPaQyrZaBQOLzYSwAQ0dG5OgsnI1Um7s4I6+EdYm0yrzQDjskxSNM
   kfmuVyVMsnnlcIgR7ac7qYwDFc/flUm3m3uonPZHp5rmqQ3n24ImSzQJQ
   N3t/QDgNgjApEestHXXCGCciBhxQ54Z8GaI6XPcFs6ZgGLMMZj7U30jib
   2r9KF5lsiebabFT4/1mvC0NFZ//q8p4aWtz2B0wBoyZtC89W889MkgBhT
   w==;
X-CSE-ConnectionGUID: Dt7kqhM4S6GgHIAAWIcZ/g==
X-CSE-MsgGUID: yO3RGfeiRNqDS1h7sjKylA==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49847971"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49847971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 11:17:13 -0700
X-CSE-ConnectionGUID: tt0fVSeZQYu+1VmXOJztCQ==
X-CSE-MsgGUID: DwqYvJaXTXKgUclat/S2VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="144514710"
Received: from kanliang-dev.jf.intel.com ([10.165.154.102])
  by orviesa003.jf.intel.com with ESMTP; 20 May 2025 11:17:12 -0700
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
Subject: [PATCH V4 06/16] powerpc/perf: Remove driver-specific throttle support
Date: Tue, 20 May 2025 11:16:34 -0700
Message-Id: <20250520181644.2673067-7-kan.liang@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20250520181644.2673067-1-kan.liang@linux.intel.com>
References: <20250520181644.2673067-1-kan.liang@linux.intel.com>
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
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=4.0.1
	OzLabs 8
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


