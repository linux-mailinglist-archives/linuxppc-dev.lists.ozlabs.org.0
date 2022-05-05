Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E44B51CD55
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:03:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW3n0vVMz3bww
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:03:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXHbkeXT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DXHbkeXT; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVz93XCzz3byT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795141; x=1683331141;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=eY8ASsd7/aj+9aYNbmEq9GanUaeYVEui2oMFa5HCVds=;
 b=DXHbkeXT+D+mqbNqhUs3kqhENh5U4Bk2Va/HS8xmRrE9KR4VoDafB5hV
 LKtqq0EiJIUepv3O4pgzFL1NK7cxzbL9GaRW5CiXgfoXqL7Jsi9ALNBzU
 TpoBtLX6Tjw1A+tL+5cCnSWcoCYB2dXSdBm8RcvmXwy1gxYzBXlJk5zuo
 n3X8NsA1fA7An2GkGEcX0fqtWZVqgkUwX2GrKykFRb8fh3IUcfjH8zjH9
 3QWKlyCruNGTDYNT/v2NJZyKsYT5v5/K+7Uw4KBRZkAW6y4fyWJYA1jgx
 q/MK03g5x4/FKmTTlz+u0CPzGNGyAmLMGXokn8rlO3945jCfJ2V4KMkJY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437298"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437298"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914342"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:46 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 06/29] x86/apic/vector: Implement support for NMI delivery
 mode
Date: Thu,  5 May 2022 16:59:45 -0700
Message-Id: <20220506000008.30892-7-ricardo.neri-calderon@linux.intel.com>
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

The flag X86_IRQ_ALLOC_AS_NMI indicates to the interrupt controller that
it should configure the delivery mode of an IRQ as NMI. Implement such
request. This causes irq_domain children in the hierarchy to configure
their irq_chips accordingly. When no specific delivery mode is requested,
continue using the delivery mode of the APIC driver in use.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Tony Luck <tony.luck@intel.com>
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
 arch/x86/kernel/apic/vector.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index 11f881f45cec..df4d7b9f6e27 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -570,6 +570,10 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
 	if ((info->flags & X86_IRQ_ALLOC_CONTIGUOUS_VECTORS) && nr_irqs > 1)
 		return -ENOSYS;
 
+	/* Only one IRQ per NMI */
+	if ((info->flags & X86_IRQ_ALLOC_AS_NMI) && nr_irqs != 1)
+		return -EINVAL;
+
 	/*
 	 * Catch any attempt to touch the cascade interrupt on a PIC
 	 * equipped system.
@@ -610,7 +614,15 @@ static int x86_vector_alloc_irqs(struct irq_domain *domain, unsigned int virq,
 		 * default delivery mode of the APIC. Children irq domains
 		 * may take the delivery mode from the individual irq
 		 * configuration rather than from the APIC driver.
+		 *
+		 * Vectors are meaningless if the delivery mode is NMI. Since
+		 * nr_irqs is 1, we can return.
 		 */
+		if (info->flags & X86_IRQ_ALLOC_AS_NMI) {
+			apicd->hw_irq_cfg.delivery_mode = APIC_DELIVERY_MODE_NMI;
+			return 0;
+		}
+
 		apicd->hw_irq_cfg.delivery_mode = apic->delivery_mode;
 
 		/*
-- 
2.17.1

