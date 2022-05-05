Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CFA51CD4B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:01:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW1f1NYqz3chn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:01:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m6qjD9Vu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=m6qjD9Vu; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVz6285yz2xC3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:58:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795139; x=1683331139;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=H881t49gt9ruU/EtOx7+sxhRpxmGtS427Z13jRF3PD8=;
 b=m6qjD9VuVvrvKrzOrwMwx8E06K0fnEo+UIONm25Mw2fWjGlpbfU4be+u
 Una0E4fLfPKOo43Iy9GMxBgcLC2PttLOoxGx3G8aFj+xHD5+GpQuWPGpk
 plyS40LnjPkOVi8+hcE3/+ceTPx2YPXwoDx5lsVgjsn3Q6fAiB+GowIRu
 93ncyBtXeHIAc827I9036kpIjf3EfnEUYpx6TDXJHbOmyqT4iA2/X15zX
 lnHeJDqM3AyFi/JfNiGniJUknQ/i07wWfKsXPfRbIj8ymeI5T4zvEalo+
 BWYl9Sy3VwLNfw1nR9CWYYkB3gFFCL0gPI74FflCnBn9mh0czvpLx/Aiv g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437289"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437289"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914332"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:45 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 03/29] x86/apic/msi: Set the delivery mode individually for
 each IRQ
Date: Thu,  5 May 2022 16:59:42 -0700
Message-Id: <20220506000008.30892-4-ricardo.neri-calderon@linux.intel.com>
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

There are no restrictions in hardware to set  MSI messages with its
own delivery mode. Use the mode specified in the provided IRQ hardware
configuration data. Since most of the IRQs are configured to use the
delivery mode of the APIC driver in use (set in all of them to
APIC_DELIVERY_MODE_FIXED), the only functional changes are where
IRQs are configured to use a specific delivery mode.

Changing the utility function __irq_msi_compose_msg() takes care of
implementing the change in the in the local APIC, PCI-MSI, and DMAR-MSI
irq_chips.

The IO-APIC irq_chip configures the entries in the interrupt redirection
table using the delivery mode specified in the corresponding MSI message.
Since the MSI message is composed by a higher irq_chip in the hierarchy,
it does not need to be updated.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
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
 arch/x86/kernel/apic/apic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/apic/apic.c b/arch/x86/kernel/apic/apic.c
index 189d3a5e471a..d1e12da1e9af 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2528,7 +2528,7 @@ void __irq_msi_compose_msg(struct irq_cfg *cfg, struct msi_msg *msg,
 	msg->arch_addr_lo.dest_mode_logical = apic->dest_mode_logical;
 	msg->arch_addr_lo.destid_0_7 = cfg->dest_apicid & 0xFF;
 
-	msg->arch_data.delivery_mode = APIC_DELIVERY_MODE_FIXED;
+	msg->arch_data.delivery_mode = cfg->delivery_mode;
 	msg->arch_data.vector = cfg->vector;
 
 	msg->address_hi = X86_MSI_BASE_ADDRESS_HIGH;
-- 
2.17.1

