Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D34B2811F79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 20:53:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KoRyZwun;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sr5kt3xcYz3cXc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Dec 2023 06:53:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KoRyZwun;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sr5k25cr7z2yyT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Dec 2023 06:52:42 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDJ7A1M012825;
	Wed, 13 Dec 2023 19:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=1+5Ys1MrdFqFT5momMf4ujz7KI2hJKgQpfR87co7I7U=;
 b=KoRyZwunqzKIteMqceubB0mqyNYxzGwqiCyjBuMi88+IkvW1bh2vQ9xTiaONlrRPEISf
 02TGKU/NlfBdtuwqzdc8QE/WnQ9P7agyrNTCBHJ7g4AbV0DeUQABOe4OS9wzVxXWaWjw
 V3q+PKubuuhcDcczdmCWxC+TX0Pg8DzINX5/mH60Ve38Ym4DUuMvkmkK9YPAAY2Qp9/t
 gKK3QUesnc9TUpK0EKubZ1H2QG39ubTS3Dva0j6cJePDm/b6VPFPOwTV5cV6uwCo3pBo
 dz9ZvZ2IOtAnhMLLRwrtHG+KMk+QNztthrHlfooFBZs8HtA7VhZXLTVq4JJeMSllkbKx 7Q== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uyjg3119y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 19:52:37 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BDItECb028220;
	Wed, 13 Dec 2023 19:52:36 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw2xyuhxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Dec 2023 19:52:36 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BDJqZpK21037590
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Dec 2023 19:52:36 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBAC85805A;
	Wed, 13 Dec 2023 19:52:35 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CF0F58060;
	Wed, 13 Dec 2023 19:52:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.159.103])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Dec 2023 19:52:35 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
Date: Wed, 13 Dec 2023 13:52:33 -0600
Message-Id: <20231213195233.10329-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PqAnSQ9WhN6VARBTu8TdD70CDhxLCJXu
X-Proofpoint-GUID: PqAnSQ9WhN6VARBTu8TdD70CDhxLCJXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-13_13,2023-12-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=787 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312130141
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When kdump kernel tries to copy dump data over SR-IOV, LPAR panics due to
NULL pointer execption.

Here is the complete stack

[   19.944378] Kernel attempted to read user page (0) - exploit attempt? (uid: 0)^M
[   19.944388] BUG: Kernel NULL pointer dereference on read at 0x00000000^M
[   19.944394] Faulting instruction address: 0xc000000020847ad4^M
[   19.944400] Oops: Kernel access of bad area, sig: 11 [#1]^M
[   19.944406] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries^M
[   19.944413] Modules linked in: mlx5_core(+) vmx_crypto pseries_wdt papr_scm libnvdimm mlxfw tls psample sunrpc fuse overlay squashfs loop^M
[   19.944435] CPU: 12 PID: 315 Comm: systemd-udevd Not tainted 6.4.0-Test102+ #12^M
[   19.944442] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1060.00 (NH1060_008) hv:phyp pSeries^M
[   19.944450] NIP:  c000000020847ad4 LR: c00000002083b2dc CTR: 00000000006cd18c^M
[   19.944457] REGS: c000000029162ca0 TRAP: 0300   Not tainted  (6.4.0-Test102+)^M
[   19.944463] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 48288244  XER: 00000008^M
[   19.944480] CFAR: c00000002083b2d8 DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 1 ^M
[   19.944480] GPR00: c00000002088ecd4 c000000029162f40 c000000021542900 ffffffffffffffff ^M
[   19.944480] GPR04: ffffffffffffffff 0000000000000000 0000000000000000 000000000000ffff ^M
[   19.944480] GPR08: 0000000000000000 ffffffffffffffff 0000000000000000 0000000000000001 ^M
[   19.944480] GPR12: 0000000000000000 c000000022ec1000 0000000040000000 0000000000000000 ^M
[   19.944480] GPR16: c00000002b8b3900 c00000002b8b3918 c00000002b8b3800 ffffffffffffffff ^M
[   19.944480] GPR20: 0000000000000000 000000000000ffff ffffffff00000000 00000000ffffffff ^M
[   19.944480] GPR24: 000000000000ffff 0000000000010000 0000000000000000 ffffffffffff0000 ^M
[   19.944480] GPR28: 0000000000000000 ffffffffffffffff ffffffffffffffff 0000000000000000 ^M
[   19.944553] NIP [c000000020847ad4] _find_next_zero_bit+0x24/0x110^M
[   19.944564] LR [c00000002083b2dc] bitmap_find_next_zero_area_off+0x5c/0xe0^M
[   19.944572] Call Trace:^M
[   19.944576] [c000000029162f40] [c0000000209fec70] dev_printk_emit+0x38/0x48 (unreliable)^M
[   19.944587] [c000000029162fa0] [c00000002088ecd4] iommu_area_alloc+0xc4/0x180^M
[   19.944596] [c000000029163020] [c00000002005a3d8] iommu_range_alloc+0x1e8/0x580^M
[   19.944606] [c000000029163150] [c00000002005a7d0] iommu_alloc+0x60/0x130^M
[   19.944613] [c0000000291631a0] [c00000002005b9f8] iommu_alloc_coherent+0x158/0x2b0^M
[   19.944621] [c000000029163260] [c000000020058fdc] dma_iommu_alloc_coherent+0x3c/0x50^M
[   19.944629] [c000000029163280] [c000000020235260] dma_alloc_attrs+0x170/0x1f0^M
[   19.944637] [c0000000291632f0] [c00800000140c058] mlx5_cmd_init+0xc0/0x760 [mlx5_core]^M
[   19.944745] [c0000000291633c0] [c008000001403448] mlx5_function_setup+0xf0/0x510 [mlx5_core]^M
[   19.944845] [c000000029163490] [c0080000014039bc] mlx5_init_one+0x84/0x210 [mlx5_core]^M
[   19.944943] [c000000029163520] [c008000001404c00] probe_one+0x118/0x2c0 [mlx5_core]^M
[   19.945041] [c0000000291635b0] [c0000000208ddce8] local_pci_probe+0x68/0x110^M
[   19.945049] [c000000029163630] [c0000000208deb98] pci_call_probe+0x68/0x200^M
[   19.945057] [c000000029163790] [c0000000208dfecc] pci_device_probe+0xbc/0x1a0^M
[   19.945065] [c0000000291637d0] [c000000020a032f4] really_probe+0x104/0x540^M
[   19.945072] [c000000029163850] [c000000020a037e4] __driver_probe_device+0xb4/0x230^M
[   19.945080] [c0000000291638d0] [c000000020a039b4] driver_probe_device+0x54/0x130^M
[   19.945088] [c000000029163910] [c000000020a03da8] __driver_attach+0x158/0x2b0^M
[   19.945096] [c000000029163990] [c0000000209ffa78] bus_for_each_dev+0xa8/0x130^M
[   19.945103] [c0000000291639f0] [c000000020a026c4] driver_attach+0x34/0x50^M
[   19.945110] [c000000029163a10] [c000000020a01aac] bus_add_driver+0x16c/0x300^M
[   19.945118] [c000000029163aa0] [c000000020a05944] driver_register+0xa4/0x1b0^M
[   19.945126] [c000000029163b10] [c0000000208dd428] __pci_register_driver+0x68/0x80^M
[   19.945133] [c000000029163b30] [c0080000015414cc] mlx5_init+0xb8/0x100 [mlx5_core]^M
[   19.945247] [c000000029163ba0] [c000000020012f60] do_one_initcall+0x60/0x300^M
[   19.945255] [c000000029163c80] [c000000020241cbc] do_init_module+0x7c/0x2b0^M

At the time of LPAR dump, before kexec hands over control to kdump kernel,
DDWs are scanned and added in the FDT. For the SR-IOV case, default DMA
window "ibm,dma-window" is removed from the FDT and DDW added, for the
device.

Now, kexec hands over control to the kdump kernel.

When the kdump kernel initializes, PCI busses are scanned and IOMMU
group/tables created, in pci_dma_bus_setup_pSeriesLP(). For the SR-IOV
case, there is no "ibm,dma-window". As a result, due to the code bug, the
newly created IOMMU table is not initialized. Later, when the device driver
tries to enter TCEs for the SR-IOV device, NULL pointer execption is thrown
from iommu_area_alloc().

The fix would be to initialize IOMMU table with DDW property stored in
the FDT. There are 2 points to remember -

	1. For the dedicated adapter, kdump kernel would encounter both
	   default and DDW in FDT. In this case, DDW property is used to
	   initialize the IOMMU table.

	2. A DDW could be direct or dynamic mapped. kdump kernel would
	   initialize IOMMU table and mark the existing DDW as
	   "dynamic". This works fine since, at the time of table
	   initialization, iommu_table_clear() makes some space in the
	   DDW, for some predefined number of TCEs which are needed for
	   kdump to succeed.

Fixes: b1fc44eaa9ba ("pseries/iommu/ddw: Fix kdump to work in absence of ibm,dma-window")
Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 150 ++++++++++++++++---------
 1 file changed, 99 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 496e16c588aa..6f022c51bd57 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -574,29 +574,6 @@ static void iommu_table_setparms(struct pci_controller *phb,
 
 struct iommu_table_ops iommu_table_lpar_multi_ops;
 
-/*
- * iommu_table_setparms_lpar
- *
- * Function: On pSeries LPAR systems, return TCE table info, given a pci bus.
- */
-static void iommu_table_setparms_lpar(struct pci_controller *phb,
-				      struct device_node *dn,
-				      struct iommu_table *tbl,
-				      struct iommu_table_group *table_group,
-				      const __be32 *dma_window)
-{
-	unsigned long offset, size, liobn;
-
-	of_parse_dma_window(dn, dma_window, &liobn, &offset, &size);
-
-	iommu_table_setparms_common(tbl, phb->bus->number, liobn, offset, size, IOMMU_PAGE_SHIFT_4K, NULL,
-				    &iommu_table_lpar_multi_ops);
-
-
-	table_group->tce32_start = offset;
-	table_group->tce32_size = size;
-}
-
 struct iommu_table_ops iommu_table_pseries_ops = {
 	.set = tce_build_pSeries,
 	.clear = tce_free_pSeries,
@@ -724,26 +701,71 @@ struct iommu_table_ops iommu_table_lpar_multi_ops = {
  * dynamic 64bit DMA window, walking up the device tree.
  */
 static struct device_node *pci_dma_find(struct device_node *dn,
-					const __be32 **dma_window)
+					struct dynamic_dma_window_prop *prop)
 {
-	const __be32 *dw = NULL;
+	const __be32 *default_prop = NULL;
+	const __be32 *ddw_prop = NULL;
+	struct device_node *rdn = NULL;
+	bool default_win = false, ddw_win = false;
 
 	for ( ; dn && PCI_DN(dn); dn = dn->parent) {
-		dw = of_get_property(dn, "ibm,dma-window", NULL);
-		if (dw) {
-			if (dma_window)
-				*dma_window = dw;
-			return dn;
+		default_prop = of_get_property(dn, "ibm,dma-window", NULL);
+		if (default_prop) {
+			rdn = dn;
+			default_win = true;
+		}
+		ddw_prop = of_get_property(dn, DIRECT64_PROPNAME, NULL);
+		if (ddw_prop) {
+			rdn = dn;
+			ddw_win = true;
+			break;
+		}
+		ddw_prop = of_get_property(dn, DMA64_PROPNAME, NULL);
+		if (ddw_prop) {
+			rdn = dn;
+			ddw_win = true;
+			break;
 		}
-		dw = of_get_property(dn, DIRECT64_PROPNAME, NULL);
-		if (dw)
-			return dn;
-		dw = of_get_property(dn, DMA64_PROPNAME, NULL);
-		if (dw)
-			return dn;
+
+		/* At least found default window, which is the case for normal boot */
+		if (default_win)
+			break;
 	}
 
-	return NULL;
+	/* For PCI devices there will always be a DMA window, either on the device
+	 * or parent bus
+	 */
+	WARN_ON(!(default_win | ddw_win));
+
+	/* caller doesn't want to get DMA window property */
+	if (!prop)
+		return rdn;
+
+	/* parse DMA window property. During normal system boot, only default
+	 * DMA window is passed in OF. But, for kdump, a dedicated adapter might
+	 * have both default and DDW in FDT. In this scenario, DDW takes precedence
+	 * over default window.
+	 */
+	if (ddw_win) {
+		struct dynamic_dma_window_prop *p;
+
+		p = (struct dynamic_dma_window_prop *)ddw_prop;
+		prop->liobn = be32_to_cpu(p->liobn);
+		prop->dma_base = be64_to_cpu(p->dma_base);
+		prop->tce_shift = be32_to_cpu(p->tce_shift);
+		prop->window_shift = be32_to_cpu(p->window_shift);
+	} else if (default_win) {
+		unsigned long offset, size, liobn;
+
+		of_parse_dma_window(rdn, default_prop, &liobn, &offset, &size);
+
+		prop->liobn = liobn;
+		prop->dma_base = offset;
+		prop->tce_shift = IOMMU_PAGE_SHIFT_4K;
+		prop->window_shift = order_base_2(size);
+	}
+
+	return rdn;
 }
 
 static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
@@ -751,17 +773,20 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	struct iommu_table *tbl;
 	struct device_node *dn, *pdn;
 	struct pci_dn *ppci;
-	const __be32 *dma_window = NULL;
+	struct dynamic_dma_window_prop prop;
 
 	dn = pci_bus_to_OF_node(bus);
 
 	pr_debug("pci_dma_bus_setup_pSeriesLP: setting up bus %pOF\n",
 		 dn);
 
-	pdn = pci_dma_find(dn, &dma_window);
+	pdn = pci_dma_find(dn, &prop);
 
-	if (dma_window == NULL)
-		pr_debug("  no ibm,dma-window property !\n");
+	/* In PPC architecture, there will always be DMA window on bus or one of the
+	 * parent bus. During reboot, there will be ibm,dma-window property to
+	 * define DMA window. For kdump, there will at least be default window or DDW
+	 * or both.
+	 */
 
 	ppci = PCI_DN(pdn);
 
@@ -771,13 +796,21 @@ static void pci_dma_bus_setup_pSeriesLP(struct pci_bus *bus)
 	if (!ppci->table_group) {
 		ppci->table_group = iommu_pseries_alloc_group(ppci->phb->node);
 		tbl = ppci->table_group->tables[0];
-		if (dma_window) {
-			iommu_table_setparms_lpar(ppci->phb, pdn, tbl,
-						  ppci->table_group, dma_window);
 
-			if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
-				panic("Failed to initialize iommu table");
-		}
+		iommu_table_setparms_common(tbl, ppci->phb->bus->number, prop.liobn,
+				prop.dma_base, 1ULL << prop.window_shift,
+				prop.tce_shift, NULL, &iommu_table_lpar_multi_ops);
+
+		/* Only for normal boot with default window. Doesn't matter even
+		 * if we set these with DDW which is 64bit during kdump, since
+		 * these will not be used during kdump.
+		 */
+		ppci->table_group->tce32_start = prop.dma_base;
+		ppci->table_group->tce32_size = 1ULL << prop.window_shift;
+
+		if (!iommu_init_table(tbl, ppci->phb->node, 0, 0))
+			panic("Failed to initialize iommu table");
+
 		iommu_register_group(ppci->table_group,
 				pci_domain_nr(bus), 0);
 		pr_debug("  created table: %p\n", ppci->table_group);
@@ -968,6 +1001,12 @@ static void find_existing_ddw_windows_named(const char *name)
 			continue;
 		}
 
+		/* If at the time of system initialization, there are DDWs in OF,
+		 * it means this is during kexec. DDW could be direct or dynamic.
+		 * We will just mark DDWs as "dynamic" since this is kdump path,
+		 * no need to worry about perforance. ddw_list_new_entry() will
+		 * set window->direct = false.
+		 */
 		window = ddw_list_new_entry(pdn, dma64);
 		if (!window) {
 			of_node_put(pdn);
@@ -1524,8 +1563,8 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 {
 	struct device_node *pdn, *dn;
 	struct iommu_table *tbl;
-	const __be32 *dma_window = NULL;
 	struct pci_dn *pci;
+	struct dynamic_dma_window_prop prop;
 
 	pr_debug("pci_dma_dev_setup_pSeriesLP: %s\n", pci_name(dev));
 
@@ -1538,7 +1577,7 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 	dn = pci_device_to_OF_node(dev);
 	pr_debug("  node is %pOF\n", dn);
 
-	pdn = pci_dma_find(dn, &dma_window);
+	pdn = pci_dma_find(dn, &prop);
 	if (!pdn || !PCI_DN(pdn)) {
 		printk(KERN_WARNING "pci_dma_dev_setup_pSeriesLP: "
 		       "no DMA window found for pci dev=%s dn=%pOF\n",
@@ -1551,8 +1590,17 @@ static void pci_dma_dev_setup_pSeriesLP(struct pci_dev *dev)
 	if (!pci->table_group) {
 		pci->table_group = iommu_pseries_alloc_group(pci->phb->node);
 		tbl = pci->table_group->tables[0];
-		iommu_table_setparms_lpar(pci->phb, pdn, tbl,
-				pci->table_group, dma_window);
+
+		iommu_table_setparms_common(tbl, pci->phb->bus->number, prop.liobn,
+				prop.dma_base, 1ULL << prop.window_shift,
+				prop.tce_shift, NULL, &iommu_table_lpar_multi_ops);
+
+		/* Only for normal boot with default window. Doesn't matter even
+		 * if we set these with DDW which is 64bit during kdump, since
+		 * these will not be used during kdump.
+		 */
+		pci->table_group->tce32_start = prop.dma_base;
+		pci->table_group->tce32_size = 1ULL << prop.window_shift;
 
 		iommu_init_table(tbl, pci->phb->node, 0, 0);
 		iommu_register_group(pci->table_group,
-- 
2.39.3 (Apple Git-145)

