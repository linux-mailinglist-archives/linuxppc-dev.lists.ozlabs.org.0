Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 288A76A77F4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrWl6q23z3fX3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:47:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n168adnf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n168adnf;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJZ5jWdz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713886; x=1709249886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=YMNfvnXnJB4uXk1mrYyUpmBPZvcLm4WxebEkvmrXwQo=;
  b=n168adnfUZB3psphHcNy3h3h5bKl0sXQdrNJ8bhaKib4Pc2VM2Bt7DqC
   2Ka34KuTrQCb3JYWL5y15T28sjZKCmG6Ofy6E6XSBeTTDBvBlDEuK+Rvr
   uK3UrG2RNhl2RvnoxQ4WISFnc0Das1jnwe/4QB9bBD7xlZCJ6QR+ziPy0
   tGTaeV0JmXJWAqjGoe5mqpEnWctO1LhxVfBKGMxmtOlbRD96x3JFnB43L
   5a4zWZP+c852M/ojwvBaglxbVucIUv+mmr+MJuRHxSM+WETZHndVBnyYx
   bWsvrelGuCN/piJ0U0Wb+QitOqjmuYTKOTAfoqYAk3otdR882b+pWiwKv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818733"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818733"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826831"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826831"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:57 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 11/24] iommu/amd: Compose MSI messages for NMIs in non-IR format
Date: Wed,  1 Mar 2023 15:47:40 -0800
Message-Id: <20230301234753.28582-12-ricardo.neri-calderon@linux.intel.com>
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

If NMIPass is enabled in a Device Table Entry, the IOMMU lets NMI interrupt
messages pass through unmapped. The contents of the MSI message, not an
IRTE, determine how and where the NMI is delivered.

The IOMMU driver owns the MSI message of the NMI. Compose it using the non-
interrupt-remapping format. Let descendant irqchips write the composed
message.

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
 * Reworded changelog to remove acronyms. (Thomas)
 * Removed confusing comment regarding interrupt vector cleanup after
   changing the affinity of an interrupt. (Thomas)

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
 drivers/iommu/amd/iommu.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 9bf71e7335f5..c6b0c365bf33 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3254,7 +3254,16 @@ static void irq_remapping_prepare_irte(struct amd_ir_data *data,
 	case X86_IRQ_ALLOC_TYPE_HPET:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		fill_msi_msg(&data->msi_entry, irte_info->index);
+		if (irq_cfg->delivery_mode == APIC_DELIVERY_MODE_NMI)
+			/*
+			 * The IOMMU lets NMIs pass through unmapped. Thus, the
+			 * MSI message, not the IRTE, determines the interrupt
+			 * configuration. Since we own the MSI message,
+			 * compose it.
+			 */
+			__irq_msi_compose_msg(irq_cfg, &data->msi_entry, true);
+		else
+			fill_msi_msg(&data->msi_entry, irte_info->index);
 		break;
 
 	default:
@@ -3643,6 +3652,15 @@ static int amd_ir_set_affinity(struct irq_data *data,
 	 */
 	send_cleanup_vector(cfg);
 
+	/*
+	 * When the delivery mode of an interrupt is NMI, the IOMMU lets the NMI
+	 * interrupt messages pass through unmapped. Changes in the destination
+	 * must be reflected in the MSI message, not the IRTE. Descendant
+	 * irqchips must set the affinity and write the MSI message.
+	 */
+	if (cfg->delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return IRQ_SET_MASK_OK;
+
 	return IRQ_SET_MASK_OK_DONE;
 }
 
-- 
2.25.1

