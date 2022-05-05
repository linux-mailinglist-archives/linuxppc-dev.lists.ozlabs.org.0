Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D13451CD65
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:07:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW8Y0hcdz3dxQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:07:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bVcN3nFl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bVcN3nFl; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzH6LBFz3c8k
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795148; x=1683331148;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=60YeowQrYtVQTC/Y9/6aG1nPAySkU1vh5niJqWVSb28=;
 b=bVcN3nFl4qGcIyY1U0tboz4a2UlvshlIvUXjwoqdKUdSZPV+fL/7cQfq
 dUbu20eY0fudka8aEbHUedfVaDBdGsOUyptzwvnCV7ABvUHJlsL910Shk
 o8maI7kiW/GzhDVMr0tXEFf8z8TI8+TAJ730HvFzptJjOrfTSnGmN+2Qr
 sVgpZlYAePP4kiZrjvqUIPXfA3PE6q6ZzIxZ2NpB0LntJ4XT1ACH4Sxsj
 oWFsrQUbDEpym5hE4Dt9xPv0TdgKO91chF+/UfcsfU2y08OX9l6g5r760
 bL/CfKJHwzcDlZumQot89OpMrMkdpvJ9VAVPYci2ePI4qRPtonVFEHRE0 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437315"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914372"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:49 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 13/29] iommu/amd: Compose MSI messages for NMI irqs in
 non-IR format
Date: Thu,  5 May 2022 16:59:52 -0700
Message-Id: <20220506000008.30892-14-ricardo.neri-calderon@linux.intel.com>
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

If NMIPass is enabled in a device's DTE, the IOMMU lets NMI interrupt
messages pass through unmapped. Therefore, the contents of the MSI
message, not an IRTE, determine how and where the NMI is delivered.

Since the IOMMU driver owns the MSI message of the NMI irq, compose
it using the non-interrupt-remapping format. Also, let descendant
irqchips write the MSI as appropriate for the device.

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
 drivers/iommu/amd/iommu.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd/iommu.c b/drivers/iommu/amd/iommu.c
index 4d7421b6858d..6e07949b3e2a 100644
--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -3111,7 +3111,16 @@ static void irq_remapping_prepare_irte(struct amd_ir_data *data,
 	case X86_IRQ_ALLOC_TYPE_HPET:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSI:
 	case X86_IRQ_ALLOC_TYPE_PCI_MSIX:
-		fill_msi_msg(&data->msi_entry, irte_info->index);
+		if (irq_cfg->delivery_mode == APIC_DELIVERY_MODE_NMI)
+			/*
+			 * The IOMMU lets NMIs pass through unmapped. Thus, the
+			 * MSI message, not the IRTE, determines the irq
+			 * configuration. Since we own the MSI message,
+			 * compose it. Descendant irqchips will write it.
+			 */
+			__irq_msi_compose_msg(irq_cfg, &data->msi_entry, true);
+		else
+			fill_msi_msg(&data->msi_entry, irte_info->index);
 		break;
 
 	default:
@@ -3509,6 +3518,18 @@ static int amd_ir_set_affinity(struct irq_data *data,
 	 */
 	send_cleanup_vector(cfg);
 
+	/*
+	 * When the delivery mode of an irq is NMI, the IOMMU lets the NMI
+	 * interrupt messages pass through unmapped. Hence, changes in the
+	 * destination are to be reflected in the NMI message itself, not the
+	 * IRTE. Thus, descendant irqchips must set the affinity and compose
+	 * write the MSI message.
+	 *
+	 * Also, NMIs do not have an associated vector. No need for cleanup.
+	 */
+	if (cfg->delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return IRQ_SET_MASK_OK;
+
 	return IRQ_SET_MASK_OK_DONE;
 }
 
-- 
2.17.1

