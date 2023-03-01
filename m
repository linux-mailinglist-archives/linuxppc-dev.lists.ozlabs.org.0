Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B4C6A77FF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:51:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrbq6m0mz3fcn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:51:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e8hRTtkW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e8hRTtkW;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJb4TyPz3cMJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713887; x=1709249887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gdPe6IuTUA94m909UzTKj74jsvfoBAZ0rK9kosJdsBc=;
  b=e8hRTtkWHtdR3WPpf7Y5Z0k8Jt9z6LARn12ATMioV0deaSjbfoEbz1OX
   StlH79Q061bFWFbRG1AhpfHT9MJxpzszS/rVvKC+duwJOydB3ryzDJ/bI
   95lN07pqMg+Cr/NL0IACTgp7BXU452kx1qaBGdk2exZcp+vcrwB4HZ3e0
   x1dNok4/J1TuyfuYNoHIq0u3uJ9pkCV83GVUIKI6y5RNuEqrhtpSZvTGH
   tBGqlhNYkUjxYvSDzxkScQVBrAL1pDSwkWNozLAmKrkpK4kW33AGXJM5Z
   eApPKFXSMiaek75xL7rwOH066d7k5iJFLmCCCag2u0YG/3RptsyYmpmlP
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818751"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818751"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826842"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826842"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:58 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 14/24] x86/hpet: Prepare IRQ assignments to use the X86_ALLOC_AS_NMI flag
Date: Wed,  1 Mar 2023 15:47:43 -0800
Message-Id: <20230301234753.28582-15-ricardo.neri-calderon@linux.intel.com>
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

The flag X86_ALLOC_AS_NMI indicates that the interrupts to be allocated in
an interrupt domain need to be configured as NMIs. Add an as_nmi argument
to hpet_assign_irq(). The HPET clock events do not need NMIs, but the HPET
hardlockup detector does.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Tony Luck <tony.luck@intel.com>
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
 arch/x86/kernel/hpet.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 3563849c2290..f42ce3fc4528 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -618,7 +618,7 @@ static inline int hpet_dev_id(struct irq_domain *domain)
 }
 
 static int hpet_assign_irq(struct irq_domain *domain, struct hpet_channel *hc,
-			   int dev_num)
+			   int dev_num, bool as_nmi)
 {
 	struct irq_alloc_info info;
 
@@ -627,6 +627,8 @@ static int hpet_assign_irq(struct irq_domain *domain, struct hpet_channel *hc,
 	info.data = hc;
 	info.devid = hpet_dev_id(domain);
 	info.hwirq = dev_num;
+	if (as_nmi)
+		info.flags |= X86_IRQ_ALLOC_AS_NMI;
 
 	return irq_domain_alloc_irqs(domain, 1, NUMA_NO_NODE, &info);
 }
@@ -755,7 +757,7 @@ static void __init hpet_select_clockevents(void)
 
 		sprintf(hc->name, "hpet%d", i);
 
-		irq = hpet_assign_irq(hpet_domain, hc, hc->num);
+		irq = hpet_assign_irq(hpet_domain, hc, hc->num, false);
 		if (irq <= 0)
 			continue;
 
-- 
2.25.1

