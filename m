Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D7A51CD5F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:05:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW6V0S4Hz3dq2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:05:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WY85luSk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WY85luSk; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzF2qNDz3c8g
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795145; x=1683331145;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=5M26CnkIjGrveCxZY+LFQe6aJhW+irvkad9bEfjWjOs=;
 b=WY85luSkcO9vQtS4zp7QLN+CclqKWKPT1tv184E4Af2p6yDfoZ5NGbiy
 bX402OZZAs9s5FDnsLqH51HFtgtMNHvoiHfk8sbzOW+LxMxQu3wFFVPqU
 ACfvqd6DXiTfZew9N4fYLlOEOvOThZitFiRX+IXf7hSGISECLcc4jv6mo
 H7gmZ5znT3vonfi8oCsyw76C/Z/qO8X7n45Gz5yh6Bk+Rnmb83HIrREGb
 nyweE+UbH+FnwCx879jVQcE0zlEdK9hMOaCR2IbvOgQqRznUCGpAzz+QJ
 xvtfZAGtabSHPX33qdrYkq6qxdPbfHqL3TsjHYYiYH5IzuzZhUhZ5cDKj w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437305"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437305"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914357"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:48 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 10/29] iommu/vt-d: Implement minor tweaks for NMI irqs
Date: Thu,  5 May 2022 16:59:49 -0700
Message-Id: <20220506000008.30892-11-ricardo.neri-calderon@linux.intel.com>
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

The Intel IOMMU interrupt remapping driver already programs correctly the
delivery mode of individual irqs as per their irq_data. Improve handling
of NMIs. Allow only one irq per NMI. Also, it is not necessary to cleanup
irq vectors after updating affinity. NMIs do not have associated vectors.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
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
 drivers/iommu/intel/irq_remapping.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index fb2d71bea98d..791a9331e257 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1198,8 +1198,12 @@ intel_ir_set_affinity(struct irq_data *data, const struct cpumask *mask,
 	 * After this point, all the interrupts will start arriving
 	 * at the new destination. So, time to cleanup the previous
 	 * vector allocation.
+	 *
+	 * Do it only for non-NMI irqs. NMIs don't have associated
+	 * vectors.
 	 */
-	send_cleanup_vector(cfg);
+	if (cfg->delivery_mode != APIC_DELIVERY_MODE_NMI)
+		send_cleanup_vector(cfg);
 
 	return IRQ_SET_MASK_OK_DONE;
 }
@@ -1352,6 +1356,9 @@ static int intel_irq_remapping_alloc(struct irq_domain *domain,
 	if (info->type == X86_IRQ_ALLOC_TYPE_PCI_MSI)
 		info->flags &= ~X86_IRQ_ALLOC_CONTIGUOUS_VECTORS;
 
+	if ((info->flags & X86_IRQ_ALLOC_AS_NMI) && nr_irqs != 1)
+		return -EINVAL;
+
 	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, arg);
 	if (ret < 0)
 		return ret;
-- 
2.17.1

