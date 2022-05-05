Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E28F51CD63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:06:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW7s3Dr1z3dv0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:06:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dO50ioh2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=dO50ioh2; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzH0PD0z3c9C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795147; x=1683331147;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=3xUpwlx5TiZjojK61Skg6W12+8Hy6giKnPG/YThYLqA=;
 b=dO50ioh2Q2FhzZgUkzHP3y6Ioac29Y3kzYrf78ZULq/t0sdY9kVvmHSb
 cZhPSqTGgZYjMW3DK6wrcjdlLuwTiSKkl2i9Vi1pxParqxyfHv188rBtu
 TayyvXLM5nBesK46gpB60dQhOf1E5CL2pN8If/UW2jqbRn3NaAq71mFs5
 LmlYUC4VMETYi8yuhIRe6iss8HChdNG7ASipnMe3IV/5a1GWeRNnOrZLz
 idwg2/NPG4qgqP5eDF+TPWcC+omEpaTBddUmexHBhS95o8FZS4FDQ4Dda
 dAUHnN4YPJ3slWPkYu2PjpTdD5LTVhU1SAt4kTabDm+ddcR0bA7Cpr/67 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437310"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437310"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914367"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:49 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 12/29] iommu/amd: Enable NMIPass when allocating an NMI irq
Date: Thu,  5 May 2022 16:59:51 -0700
Message-Id: <20220506000008.30892-13-ricardo.neri-calderon@linux.intel.com>
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As per the AMD I/O Virtualization Technology (IOMMU) Specification, the
AMD IOMMU only remaps fixed and arbitrated MSIs. NMIs are controlled
by the NMIPass bit of a Device Table Entry. When set, the IOMMU passes
through NMI interrupt messages unmapped. Otherwise, they are aborted.

Furthermore, Section 2.2.5 Table 19 states that the IOMMU will also
abort NMIs when the destination mode is logical.

Update the NMIPass setting of a device's DTE when an NMI irq is being
allocated. Only do so when the destination mode of the APIC is not
logical.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v5:
 * Introduced this patch

Changes since v4:
 * N/A

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 drivers/iommu/amd/iommu.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index a1ada7bff44e..4d7421b6858d 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3156,6 +3156,15 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
 		return -EINVAL;
 
+	if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
+		/* Only one IRQ per NMI */
+		if (nr_irqs != 1)
+			return -EINVAL;
+
+		/* NMIs are aborted when the destination mode is logical. */
+		if (apic->dest_mode_logical)
+			return -EPERM;
+	}
 	/*
 	 * With IRQ remapping enabled, don't need contiguous CPU vectors
 	 * to support multiple MSI interrupts.
@@ -3208,6 +3217,15 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 		goto out_free_parent;
 	}
 
+	if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
+		struct amd_iommu *iommu = amd_iommu_rlookup_table[devid];
+
+		if (!get_dev_entry_bit(devid, DEV_ENTRY_NMI_PASS)) {
+			set_dev_entry_bit(devid, DEV_ENTRY_NMI_PASS);
+			iommu_flush_dte(iommu, devid);
+		}
+	}
+
 	for (i = 0; i < nr_irqs; i++) {
 		irq_data = irq_domain_get_irq_data(domain, virq + i);
 		cfg = irq_data ? irqd_cfg(irq_data) : NULL;
-- 
2.17.1

