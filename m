Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAFD6A77FB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:49:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrYp2hhRz3fZh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:49:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5E6oTAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5E6oTAm;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJb0Kgqz3cLb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713887; x=1709249887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=btyWt/qyY31uspGHtLUS5h0GneCtSdCDc61owotTsK4=;
  b=h5E6oTAm1E/bpV/IHnHqUv6tUsIEJQyM1/A/Jyj7JCVWuDI7bs5Bb73D
   LXvAvjYpg4cRgmRO3c2Ngv95XnxWbBC/9stJ1XG5kydFYIGKvW2itJq4R
   ew1JbZfTeg++JLqrTEp+EVQrm49GaWySOA5aEwom4sRTztd6JQ19TI3nu
   J/QoxZyPtbmzyZeGIPxYB5cfGLugW8hWLlRB0pA+FfhRS3oRsMVXevmx5
   rk/Bvi4yQHE4zFaXKmgMCio6QzfeJIMCpBICl9/Xu1Rz3BgXb/xX91gx8
   3DoNAGNlqmG/7P5HRze0Qo2V9DFqoTVyrCHkXjIL3f4DL0XWJAHHHUGBO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818727"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818727"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826826"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826826"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:57 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 10/24] iommu/amd: Enable NMIPass when allocating an NMI
Date: Wed,  1 Mar 2023 15:47:39 -0800
Message-Id: <20230301234753.28582-11-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As per the AMD I/O Virtualization Technology (IOMMU) Specification, the
AMD IOMMU only remaps fixed and arbitrated MSIs. NMIs are controlled
by the NMIPass bit of a Device Table Entry. When set, the IOMMU passes
through NMI interrupt messages unmapped. Otherwise, they are aborted.

Also, Section 2.2.5 Table 19 states that the IOMMU will abort NMIs when the
destination mode is logical.

Update the NMIPass setting of a device's DTE when an NMI is being
allocated. Only do so when the destination mode of the APIC is not logical.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Removed check for nr_irqs in irq_remapping_alloc(). Allocation had
   been rejected already in the root domain. (Thomas)

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
 drivers/iommu/amd/iommu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 5a505ba5467e..9bf71e7335f5 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3299,6 +3299,10 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI)
 		return -EINVAL;
 
+	/* NMIs are aborted when the destination mode is logical. */
+	if (info->flags & X86_IRQ_ALLOC_AS_NMI && apic->dest_mode_logical)
+		return -EPERM;
+
 	sbdf = get_devid(info);
 	if (sbdf < 0)
 		return -EINVAL;
@@ -3348,6 +3352,13 @@ static int irq_remapping_alloc(struct irq_domain *domain, unsigned int virq,
 		goto out_free_parent;
 	}
 
+	if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
+		if (!get_dev_entry_bit(iommu, devid, DEV_ENTRY_NMI_PASS)) {
+			set_dev_entry_bit(iommu, devid, DEV_ENTRY_NMI_PASS);
+			iommu_flush_dte(iommu, devid);
+		}
+	}
+
 	for (i = 0; i < nr_irqs; i++) {
 		irq_data = irq_domain_get_irq_data(domain, virq + i);
 		cfg = irq_data ? irqd_cfg(irq_data) : NULL;
-- 
2.25.1

