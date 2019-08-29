Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DE1A1445
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:02:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JxSV42pHzDqDN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:02:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=107.173.13.209; helo=ozlabs.ru; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Received: from ozlabs.ru (ozlabs.ru [107.173.13.209])
 by lists.ozlabs.org (Postfix) with ESMTP id 46JxGB0jNLzDqLv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 18:53:06 +1000 (AEST)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 46E3BAE80570;
 Thu, 29 Aug 2019 04:52:41 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 4/5] powerpc/pseries/iommu: Switch to xchg_no_kill
Date: Thu, 29 Aug 2019 18:52:51 +1000
Message-Id: <20190829085252.72370-5-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190829085252.72370-1-aik@ozlabs.ru>
References: <20190829085252.72370-1-aik@ozlabs.ru>
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
Cc: kvm@vger.kernel.org, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the last implementation of iommu_table_ops::exchange() which
we are about to remove.

This implements xchg_no_kill() for pseries. Since it is paravirtual
platform, the hypervisor does TCE invalidations and we do not have
to deal with it here, hence no tce_kill() hook.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v3:
* new to the series and it fixes compile error from v2
---
 arch/powerpc/platforms/pseries/iommu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 42fb03253334..df7db33ca93b 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -621,7 +621,8 @@ static void pci_dma_bus_setup_pSeries(struct pci_bus *bus)
 
 #ifdef CONFIG_IOMMU_API
 static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
-				long *tce, enum dma_data_direction *direction)
+				long *tce, enum dma_data_direction *direction,
+				bool realmode)
 {
 	long rc;
 	unsigned long ioba = (unsigned long) index << tbl->it_page_shift;
@@ -649,7 +650,7 @@ static int tce_exchange_pseries(struct iommu_table *tbl, long index, unsigned
 struct iommu_table_ops iommu_table_lpar_multi_ops = {
 	.set = tce_buildmulti_pSeriesLP,
 #ifdef CONFIG_IOMMU_API
-	.exchange = tce_exchange_pseries,
+	.xchg_no_kill = tce_exchange_pseries,
 #endif
 	.clear = tce_freemulti_pSeriesLP,
 	.get = tce_get_pSeriesLP
-- 
2.17.1

