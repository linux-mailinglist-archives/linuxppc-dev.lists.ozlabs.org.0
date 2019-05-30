Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3922F0F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 06:09:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DvGZ6HXgzDqBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 14:09:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=thunder.leizhen@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dtqq0w1TzDqSV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 13:49:26 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id DB4C41F0F32B9FF7AF5D;
 Thu, 30 May 2019 11:49:22 +0800 (CST)
Received: from HGHY4L002753561.china.huawei.com (10.133.215.186) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Thu, 30 May 2019 11:49:12 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>, John Garry
 <john.garry@huawei.com>, Robin Murphy <robin.murphy@arm.com>, Will Deacon
 <will.deacon@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Corbet
 <corbet@lwn.net>, linux-doc <linux-doc@vger.kernel.org>, Sebastian Ott
 <sebott@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "Martin Schwidefsky" <schwidefsky@de.ibm.com>, Heiko Carstens
 <heiko.carstens@de.ibm.com>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>, Tony Luck <tony.luck@intel.com>, Fenghua Yu
 <fenghua.yu@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin"
 <hpa@zytor.com>, David Woodhouse <dwmw2@infradead.org>, iommu
 <iommu@lists.linux-foundation.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, x86 <x86@kernel.org>,
 linux-ia64 <linux-ia64@vger.kernel.org>
Subject: [PATCH v8 1/7] iommu: enhance IOMMU default DMA mode build options
Date: Thu, 30 May 2019 11:48:25 +0800
Message-ID: <20190530034831.4184-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.21.0.windows.1
In-Reply-To: <20190530034831.4184-1-thunder.leizhen@huawei.com>
References: <20190530034831.4184-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.133.215.186]
X-CFilter-Loop: Reflected
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
Cc: Hanjun Guo <guohanjun@huawei.com>, Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

First, add build option IOMMU_DEFAULT_{LAZY|STRICT}, so that we have the
opportunity to set {lazy|strict} mode as default at build time. Then put
the three config options in an choice, make people can only choose one of
the three at a time.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/iommu/Kconfig | 42 +++++++++++++++++++++++++++++++++++-------
 drivers/iommu/iommu.c |  3 ++-
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index 83664db5221df02..d6a1a45f80ffbf5 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -75,17 +75,45 @@ config IOMMU_DEBUGFS
 	  debug/iommu directory, and then populate a subdirectory with
 	  entries as required.
 
-config IOMMU_DEFAULT_PASSTHROUGH
-	bool "IOMMU passthrough by default"
+choice
+	prompt "IOMMU default DMA mode"
 	depends on IOMMU_API
-        help
-	  Enable passthrough by default, removing the need to pass in
-	  iommu.passthrough=on or iommu=pt through command line. If this
-	  is enabled, you can still disable with iommu.passthrough=off
-	  or iommu=nopt depending on the architecture.
+	default IOMMU_DEFAULT_STRICT
+	help
+	  This option allows IOMMU DMA mode to be chose at build time, to
+	  override the default DMA mode of each ARCHs, removing the need to
+	  pass in kernel parameters through command line. You can still use
+	  ARCHs specific boot options to override this option again.
+
+config IOMMU_DEFAULT_PASSTHROUGH
+	bool "passthrough"
+	help
+	  In this mode, the DMA access through IOMMU without any addresses
+	  translation. That means, the wrong or illegal DMA access can not
+	  be caught, no error information will be reported.
 
 	  If unsure, say N here.
 
+config IOMMU_DEFAULT_LAZY
+	bool "lazy"
+	help
+	  Support lazy mode, where for every IOMMU DMA unmap operation, the
+	  flush operation of IOTLB and the free operation of IOVA are deferred.
+	  They are only guaranteed to be done before the related IOVA will be
+	  reused.
+
+config IOMMU_DEFAULT_STRICT
+	bool "strict"
+	help
+	  For every IOMMU DMA unmap operation, the flush operation of IOTLB and
+	  the free operation of IOVA are guaranteed to be done in the unmap
+	  function.
+
+	  This mode is safer than the two above, but it maybe slower in some
+	  high performace scenarios.
+
+endchoice
+
 config OF_IOMMU
        def_bool y
        depends on OF && IOMMU_API
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 67ee6623f9b2a4d..56bce221285b15f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -43,7 +43,8 @@
 #else
 static unsigned int iommu_def_domain_type = IOMMU_DOMAIN_DMA;
 #endif
-static bool iommu_dma_strict __read_mostly = true;
+static bool iommu_dma_strict __read_mostly =
+			IS_ENABLED(CONFIG_IOMMU_DEFAULT_STRICT);
 
 struct iommu_group {
 	struct kobject kobj;
-- 
1.8.3


