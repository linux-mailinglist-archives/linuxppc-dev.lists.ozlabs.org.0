Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FC51CD60
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvW792mJlz3fNK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:05:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jr7qidgg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jr7qidgg; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzG1wNfz3bx8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795146; x=1683331146;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=fO8Z/cunSnljRh67cIhZwnOKie+7UxkAbp0EHXuT2pk=;
 b=jr7qidggi392Nlhmw82nRWbtkXPDt4Rda+L6wak13wUMCyZyEWvyZafq
 apNWHbgmR6pGn+H/pBMtQbDf0FzG+PEE/qtkhvaTENTmYyHdFfx9pkK2C
 5MgzI58nJ4zFEv0B02oqrxvLhVq+XCHG1/EALZhQf/bjBJEZan5oW2ri2
 jaeEKifGMFiY/Cx86Nca1E2PtMKaRD6au2x7cN5Zy0KxdT30UYkABgMc5
 Hh2gtCaAQzZwe0Q6lyQjbaNEDBWzxrJD4vb8XSMeN0HBjmkxVj5l0VwOv
 O1hkC535fTxdn462MyvW5/HlHKQU1W+Ve6KVBK3JuzAuInJDnN5WM/B9s g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437309"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437309"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914361"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:48 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 11/29] iommu/amd: Expose [set|get]_dev_entry_bit()
Date: Thu,  5 May 2022 16:59:50 -0700
Message-Id: <20220506000008.30892-12-ricardo.neri-calderon@linux.intel.com>
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

These functions are used to check and set specific bits in a Device Table
Entry. For instance, they can be used to modify the setting of the NMIPass
field.

Currently, these functions are used only for ACPI-specified devices.
However, an interrupt is to be allocated with NMI as delivery mode, the
Device Table Entry needs modified accordingly in irq_remapping_alloc().

As a first step expose these two functions. No functional changes.

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
 drivers/iommu/amd/amd_iommu.h | 3 +++
 drivers/iommu/amd/init.c      | 4 ++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/amd_iommu.h b/drivers/iommu/amd/amd_iommu.h
index 1ab31074f5b3..9f3d1564c84e 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -128,4 +128,7 @@ static inline void amd_iommu_apply_ivrs_quirks(void) { }
 
 extern void amd_iommu_domain_set_pgtable(struct protection_domain *domain,
 					 u64 *root, int mode);
+
+extern void set_dev_entry_bit(u16 devid, u8 bit);
+extern int get_dev_entry_bit(u16 devid, u8 bit);
 #endif
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index b4a798c7b347..823e76b284f1 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -914,7 +914,7 @@ static void iommu_enable_gt(struct amd_iommu *iommu)
 }
 
 /* sets a specific bit in the device table entry. */
-static void set_dev_entry_bit(u16 devid, u8 bit)
+void set_dev_entry_bit(u16 devid, u8 bit)
 {
 	int i = (bit >> 6) & 0x03;
 	int _bit = bit & 0x3f;
@@ -922,7 +922,7 @@ static void set_dev_entry_bit(u16 devid, u8 bit)
 	amd_iommu_dev_table[devid].data[i] |= (1UL << _bit);
 }
 
-static int get_dev_entry_bit(u16 devid, u8 bit)
+int get_dev_entry_bit(u16 devid, u8 bit)
 {
 	int i = (bit >> 6) & 0x03;
 	int _bit = bit & 0x3f;
-- 
2.17.1

