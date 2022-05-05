Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C66F51CD7B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWBn1QjSz3fTQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:09:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jsd+mMsL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jsd+mMsL; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzL2Cmsz3c9r
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795150; x=1683331150;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=yu43tYTm3rL820NWGTlU5e3BSTdrJeh1cVn1o9Y1twQ=;
 b=jsd+mMsLTnztbiMckL9tbbJsvCuwjjjN8b3vBtIERUTLUk60GJIIEzLb
 ah8dJ18vYt8PGwwh8e/+aqoumMHIE8HozmhFGRTRVhBSENE+fufM4gp9N
 DnBtc46xIPVPJEQ8X60Bgw2RK9DCimxRMLlDKv47wMxoOhCV2ONWdcl2s
 B4mAfKBb8aulXxaDEqsNI31hgHj1M7wnqsLD6CAZqOxfA9RuemerygTzp
 KqS3cJ/9myLi1SCF1mRHFP08UQtfe6IX6+4cBSDYIOqyOEYgFimxdhUok
 XJgridSnT2R0z/IdaVlta4b0titnIt0vAda3VlOR7njhNxYRMDer0OS4e Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437323"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437323"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914383"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:50 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 16/29] x86/hpet: Prepare IRQ assignments to use the
 X86_ALLOC_AS_NMI flag
Date: Thu,  5 May 2022 16:59:55 -0700
Message-Id: <20220506000008.30892-17-ricardo.neri-calderon@linux.intel.com>
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

The flag X86_ALLOC_AS_NMI indicates that the IRQs to be allocated in an
IRQ domain need to be configured as NMIs.  Add an as_nmi argument to
hpet_assign_irq(). Even though the HPET clock events do not need NMI
IRQs, the HPET hardlockup detector does. A subsequent changeset will
implement the reservation of a channel for it.

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
 arch/x86/kernel/hpet.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 2c6713b40921..02d25e00e93f 100644
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
2.17.1

