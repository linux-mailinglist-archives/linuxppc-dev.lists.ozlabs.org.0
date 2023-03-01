Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F26A77E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrSY3DV2z3cQk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:45:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CHArbZUA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CHArbZUA;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJY72Bwz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713886; x=1709249886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iAMY6btPT3LkFo8ii1+Ro1+SLEC/lk7JJlUCyqpnpJM=;
  b=CHArbZUAwDcZlmxLH9o2heZQwJeuzUYhKtZA3Pk4WYjO/c1v6xlF7QDQ
   DyX1iJNtT47bgmd9VLpuSoQu9lkUp7Y3qe6rpLb19foMpTbW5GP1u8D5e
   kTaKEoaKTPIW0j7ZM1X2YbzXhgBlTB5anOBDkXQ2bvo8Z9f64s1lU6jfK
   28kP5izeRPJCtNhC/Y5x24VScI0ZObdm+vR94pmLZYRokplK06jHjN6sU
   BZ+N16C0FfaF1KQqp2bJXgNvYhqnlbznjBs9Uf97AkrXm/ebDJRJZ07YI
   5gWHVdDYhh7jCBt2JMFY+R5OD79c7UoXJ7EjfoTJ0TFVupA1ULiLqvLjK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818718"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818718"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826817"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826817"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:57 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 08/24] iommu/vt-d: Set the IRTE delivery mode individually for each interrupt
Date: Wed,  1 Mar 2023 15:47:37 -0800
Message-Id: <20230301234753.28582-9-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the mode specified in the provided interrupt hardware configuration
data to set the delivery mode.

Since most interrupts are configured to use the delivery mode of the APIC
driver, there are no functional changes. The only exception are interrupts
that do specify a different delivery mode.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * None

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
 drivers/iommu/intel/irq_remapping.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/irq_remapping.c b/drivers/iommu/intel/irq_remapping.c
index 1fe30c31fcbe..7b58406ea8d2 100644
--- a/drivers/iommu/intel/irq_remapping.c
+++ b/drivers/iommu/intel/irq_remapping.c
@@ -1120,7 +1120,7 @@ static void prepare_irte(struct irte *irte, struct irq_cfg *irq_cfg)
 	 * irq migration in the presence of interrupt-remapping.
 	*/
 	irte->trigger_mode = 0;
-	irte->dlvry_mode = apic->delivery_mode;
+	irte->dlvry_mode = irq_cfg->delivery_mode;
 	irte->vector = irq_cfg->vector;
 	irte->dest_id = IRTE_DEST(irq_cfg->dest_apicid);
 
-- 
2.25.1

