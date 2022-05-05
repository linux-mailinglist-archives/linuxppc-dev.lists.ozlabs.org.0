Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1538151CD5B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:03:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW4S6Z8Qz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:03:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WqaJtaue;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WqaJtaue; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzB2yWPz3c7X
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795142; x=1683331142;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=s6kx2WD+U+gm4lQdJ9AXtLnfiPC2EdKdrJZetgovSOw=;
 b=WqaJtauearGiRmM3fyiFKtXPSNm4KPHaTDDB110hGCFouDprLE7y+WK6
 Tgvq5gt3PyU9cdUPvJkC3OBg7qI0HKk6tqzKaNeQ6WyetWysdSjpIg1VM
 l3ijOmUNOpzbk4TBi6ojRcZIACIAbzHFT1PtsMi85fVOwXc8j5X3RRrlW
 AA+SXLWlpi1Cz32ZxOJJ4ooVLhZGpLZ31gnNyTsNuE1x4g8Q+aw46tEst
 JxU+puYiwqttwb9v5s8As0XJ0MJqi6JM766/bewQwP/zOghSnjC1rijz5
 tdoD/Np8E6k4fOI10dblSxDZk8R0QavFYupPpqh8lSihHax6Pb26zFR1G g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437300"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437300"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914346"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:46 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 07/29] iommu/vt-d: Clear the redirection hint when the
 destination mode is physical
Date: Thu,  5 May 2022 16:59:46 -0700
Message-Id: <20220506000008.30892-8-ricardo.neri-calderon@linux.intel.com>
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

When the destination mode of an interrupt is physical APICID, the interrupt
is delivered only to the single CPU of which the physical APICID is
specified in the destination ID field. Therefore, the redirection hint is
meaningless.

Furthermore, on certain processors, the IOMMU does not deliver the
interrupt when the delivery mode is NMI, the redirection hint is set, and
the destination mode is physical. Clearing the redirection hint ensures
that the NMI is delivered.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Suggested-by: Ashok Raj <ashok.raj@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * Introduced this patch.

Changes since v4:
 * N/A

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 drivers/iommu/intel/irq_remapping.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index a67319597884..d2764a71f91a 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1128,7 +1128,17 @@ static void prepare_irte(struct irte *irte, int vector, unsigned int dest)
 	irte->dlvry_mode = apic->delivery_mode;
 	irte->vector = vector;
 	irte->dest_id = IRTE_DEST(dest);
-	irte->redir_hint = 1;
+
+	/*
+	 * When using the destination mode of physical APICID, only the
+	 * processor specified in @dest receives the interrupt. Thus, the
+	 * redirection hint is meaningless.
+	 *
+	 * Furthermore, on some processors, NMIs with physical delivery mode
+	 * and the redirection hint set are delivered as regular interrupts
+	 * or not delivered at all.
+	 */
+	irte->redir_hint = apic->dest_mode_logical;
 }
 
 struct irq_remap_ops intel_irq_remap_ops = {
-- 
2.17.1

