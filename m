Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF46A77D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:39:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrLR07cSz3cNG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:39:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D/SEhmsQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D/SEhmsQ;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJV2GtCz3c41
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713882; x=1709249882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Lma7M0NQuejLahUyWUzCNBxEauMnVUBUBK0aoIXgw+I=;
  b=D/SEhmsQvUx0AAfVvwSKzRxOrHzsQ+w/rovYYsjHxmkvlhJOtId9Vd0L
   n+jDwjFuX7v44m9r+aDeNufR1UFLrW+f3iE/X9zf8psoRoRk5OCo88V3X
   IpAyYXq0wVwH9v+s6CqZtkDPo3nlzxKOEqKLWb4k+IauPunYfDCESJe1v
   2VTG4dypP/HM944VfBCTrSgypl6raOn/P2SLDftYbY366wFne8nl4dtu+
   2serIvs/MFFujrNoL/f+0OeP3aJss00BvptFOsev2t63+TGbrlUa6pFHp
   xcLOttifxA+PSIFjzGEiuL+MIPSFNPBg2+znoN7ycLMAJBUiW/J6vLv8R
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818675"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818675"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826785"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826785"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:55 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 01/24] x86/apic: Add irq_cfg::delivery_mode
Date: Wed,  1 Mar 2023 15:47:30 -0800
Message-Id: <20230301234753.28582-2-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are no restrictions in hardware to configure the delivery mode of
each interrupt individually. Also, certain interrupts need to be
configured with a specific delivery mode (e.g., non-maskable interrupts).
Add a new member, delivery_mode, to struct irq_cfg to this effect.

To keep the current behavior, use the delivery mode of the APIC driver when
allocating a vector for an interrupt in the root domain (i.e.,
x86_vector_domain).

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Reworded the commit message to accurately state that the root domain
   allocates a vector for an interrupt, not an interrupt. (Thomas)
 * Removed stray newline. (Thomas)
 * Replaced 'irq' with 'interrupt' in the changelog and in the code.
  (Thomas).

Changes since v5:
 * Updated indentation of the existing members of struct irq_cfg.
 * Reworded the commit message.

Changes since v4:
 * Rebased to use new enumeration apic_delivery_modes.

Changes since v3:
 * None

Changes since v2:
 * Reduced scope to only add the interrupt delivery mode in
   struct irq_alloc_info.

Changes since v1:
 * Introduced this patch.
---
 arch/x86/include/asm/hw_irq.h | 5 +++--
 arch/x86/kernel/apic/vector.c | 6 ++++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/hw_irq.h b/arch/x86/include/asm/hw_irq.h
index d465ece58151..5ac5e6c603ee 100644
--- a/arch/x86/include/asm/hw_irq.h
+++ b/arch/x86/include/asm/hw_irq.h
@@ -88,8 +88,9 @@ struct irq_alloc_info {
 };
 
 struct irq_cfg {
-	unsigned int		dest_apicid;
-	unsigned int		vector;
+	unsigned int			dest_apicid;
+	unsigned int			vector;
+	enum apic_delivery_modes	delivery_mode;
 };
 
 extern struct irq_cfg *irq_cfg(unsigned int irq);
diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index c1efebd27e6c..633b442c8f84 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -573,6 +573,12 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
 		/* Don't invoke affinity setter on deactivated interrupts */
 		irqd_set_affinity_on_activate(irqd);
 
+		/*
+		 * A delivery mode may be specified in the interrupt allocation
+		 * info. If not, use the delivery mode of the APIC.
+		 */
+		apicd->hw_irq_cfg.delivery_mode = apic->delivery_mode;
+
 		/*
 		 * Legacy vectors are already assigned when the IOAPIC
 		 * takes them over. They stay on the same vector. This is
-- 
2.25.1

