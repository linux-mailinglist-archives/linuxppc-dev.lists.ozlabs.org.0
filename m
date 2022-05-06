Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F55351CDC6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:16:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWMG0HFkz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:16:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IaHhIg9X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IaHhIg9X; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzZ3yBHz3cDm
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795162; x=1683331162;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=OMAzr1b+gR0ghYqlTvIkOvlFxefky6ROYu4/AGgKvYI=;
 b=IaHhIg9X7GE/Oomz0cSUED3mAGy/5t9hE3RmNeJDZK3Mx3YWH5yYYwR0
 WOi0oJkZq3zCYQFfm9WpDK59u8ThjUyliYEQWvtEffZYiqyg8Lzs72pVp
 +JnTbxc8v1l4N7OToQtb8S3HsKlFuYqVqH2tJhnn5lCa+/i+sdGms2mGp
 SdSF8gB2BZCxr9rGxEYPyLX+Ie8CJBPFEYYECF61fdfP2pDJxYG723XWP
 9d0bnlkMMKN8un0epCxXOAJQOrXxGQ07xyoWhGYAXQHkMjsNE1kgAifqN
 NGtsaF6OND1RWknEYnTvfhfV6+3ROPahpM919FQioHnOM3ZjXT0AxpnWk A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437344"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437344"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914455"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:56 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 28/29] x86/tsc: Restart NMI watchdog after refining tsc_khz
Date: Thu,  5 May 2022 17:00:07 -0700
Message-Id: <20220506000008.30892-29-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The HPET hardlockup detector relies on tsc_khz to estimate the value of
that the TSC will have when its HPET channel fires. A refined tsc_khz
helps to estimate better the expected TSC value.

Using the early value of tsc_khz may lead to a large error in the expected
TSC value. Restarting the NMI watchdog detector has the effect of kicking
its HPET channel and make use of the refined tsc_khz.

When the HPET hardlockup is not in use, restarting the NMI watchdog is
a noop.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * Introduced this patch

Changes since v4
 * N/A

Changes since v3
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 arch/x86/kernel/tsc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
index cafacb2e58cc..cc1843044d88 100644
--- a/arch/x86/kernel/tsc.c
+++ b/arch/x86/kernel/tsc.c
@@ -1386,6 +1386,12 @@ static void tsc_refine_calibration_work(struct work_struct *work)
 	/* Inform the TSC deadline clockevent devices about the recalibration */
 	lapic_update_tsc_freq();
 
+	/*
+	 * If in use, the HPET hardlockup detector relies on tsc_khz.
+	 * Reconfigure it to make use of the refined tsc_khz.
+	 */
+	lockup_detector_reconfigure();
+
 	/* Update the sched_clock() rate to match the clocksource one */
 	for_each_possible_cpu(cpu)
 		set_cyc2ns_scale(tsc_khz, cpu, tsc_stop);
-- 
2.17.1

