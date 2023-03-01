Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48F6A77C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:38:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrKP4nr4z3cLB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:38:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RkqbnzZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RkqbnzZE;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJV4sRNz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713882; x=1709249882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=RjtAUFRJrzBKfA0+yFHKXNZopzCyfP9+J4w+QU7OMp8=;
  b=RkqbnzZEyg8YxkM8895UqwBEuXNsvdIlDe+2tyYWL/FVhUJvjUxG17lm
   tbmInyvVUP9Mn8pxJIO3Rf4/3xX1J5ZwtfQeenrZFvgP8hvjsXaapTGYY
   fQZ9CjBTJBN+Oo8aZL5UxmekxS4W101L0WawGJIuOGfrnuJ5oEkZnvMKb
   LiJjw99293rKACHJFFrKRRFo6y3H2wYgAcRfS5atrwZHEU2O3EZ2pUm60
   Fpxx5NuziP8Feke0koHdBTiAOFzuGvCadPRdUwa2gSHZLvewP9BVRhe7l
   +O7cfAGTnremlnBd2yjwt/1AvRcG6ghegux+nzwrU1aWlYtUHbO6N5DDe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818681"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818681"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826789"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826789"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:55 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 02/24] x86/apic/msi: Use the delivery mode from irq_cfg for message composition
Date: Wed,  1 Mar 2023 15:47:31 -0800
Message-Id: <20230301234753.28582-3-ricardo.neri-calderon@linux.intel.com>
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

irq_cfg provides a delivery mode for each interrupt. Use it instead
of the hardcoded APIC_DELIVERY_MODE_FIXED. This allows to compose
messages for NMI delivery mode which is required to implement a HPET-
based NMI watchdog.

No functional change as the default delivery mode is set to
APIC_DELIVERY_MODE_FIXED.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Reworded changelog as per suggestion from Thomas.

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
index 20d9a604da7c..352738238e52 100644
--- a/arch/x86/kernel/apic/apic.c
+++ b/arch/x86/kernel/apic/apic.c
@@ -2562,7 +2562,7 @@ void __irq_msi_compose_msg(struct irq_cfg *cfg, struct msi_msg *msg,
 	msg->arch_addr_lo.dest_mode_logical = apic->dest_mode_logical;
 	msg->arch_addr_lo.destid_0_7 = cfg->dest_apicid & 0xFF;
 
-	msg->arch_data.delivery_mode = APIC_DELIVERY_MODE_FIXED;
+	msg->arch_data.delivery_mode = cfg->delivery_mode;
 	msg->arch_data.vector = cfg->vector;
 
 	msg->address_hi = X86_MSI_BASE_ADDRESS_HIGH;
-- 
2.25.1

