Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4AB6A77F3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:46:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrVl0jRXz3f4K
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:46:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjOj3TX/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjOj3TX/;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJZ33LJz3c6C
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713886; x=1709249886;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mR16pLKgTuMhf9u2kE2UXUD7nzGYQyqB0h6xQLOZJvc=;
  b=EjOj3TX/NnDJ23yE1tNidQhgHdR5cOao0Y3OYzRo5hYttFGEf1PIgryG
   8VsrJHlagz8RJ7ldoGfoZLZBdGs0EX+VqpWDZZCuty9kJ0iygKqtZJGWN
   h6I+np9mNPYzgWb2rZVuhRWc/ZzrGbDdbCs2h9AHUfL/6HXtX9Mvva35J
   1GrzfihXDZ8FemsELDl8c+TRNL1mz+ofrqcE37Li5RKU+zDFwQ47ZDgpi
   kpO8hpgSyP4c+GdciI/caiSmc7GKy2dFkZFFktvmzgTKPRWgkwMnTsfc5
   lT90b3C5g3Fjt6+5s184Fzt9psSBX6sfdCz+Xygh42C28sHnC6z8g8ol/
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818723"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818723"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826821"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826821"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:57 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 09/24] iommu/amd: Expose [set|get]_dev_entry_bit()
Date: Wed,  1 Mar 2023 15:47:38 -0800
Message-Id: <20230301234753.28582-10-ricardo.neri-calderon@linux.intel.com>
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

If an interrupt is allocated with NMI as delivery mode, the Device Table
Entry needs to be modified accordingly in irq_remapping_alloc().

No functional changes.

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
 * None

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
index c160a332ce33..b9b87a8cd48e 100644
--- a/drivers/iommu/amd/amd_iommu.h
+++ b/drivers/iommu/amd/amd_iommu.h
@@ -141,4 +141,7 @@ extern u64 amd_iommu_efr;
 extern u64 amd_iommu_efr2;
 
 extern bool amd_iommu_snp_en;
+
+extern void set_dev_entry_bit(struct amd_iommu *iommu, u16 devid, u8 bit);
+extern int get_dev_entry_bit(struct amd_iommu *iommu, u16 devid, u8 bit);
 #endif
diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 19a46b9f7357..559a9ecb785f 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -999,7 +999,7 @@ static void __set_dev_entry_bit(struct dev_table_entry *dev_table,
 	dev_table[devid].data[i] |= (1UL << _bit);
 }
 
-static void set_dev_entry_bit(struct amd_iommu *iommu, u16 devid, u8 bit)
+void set_dev_entry_bit(struct amd_iommu *iommu, u16 devid, u8 bit)
 {
 	struct dev_table_entry *dev_table = get_dev_table(iommu);
 
@@ -1015,7 +1015,7 @@ static int __get_dev_entry_bit(struct dev_table_entry *dev_table,
 	return (dev_table[devid].data[i] & (1UL << _bit)) >> _bit;
 }
 
-static int get_dev_entry_bit(struct amd_iommu *iommu, u16 devid, u8 bit)
+int get_dev_entry_bit(struct amd_iommu *iommu, u16 devid, u8 bit)
 {
 	struct dev_table_entry *dev_table = get_dev_table(iommu);
 
-- 
2.25.1

