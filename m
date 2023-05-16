Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F8E704247
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxpL3VDHz3fvW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:25:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K1tYkDrP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::62f; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=K1tYkDrP;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxX53KJ5z3fD1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:12:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7M/FZHBmedbXGJiSqbAtW1mLzD4uhxJlCWGpR1dPw5Y8MCydgLB3+prdFS0exbNp4yCL+wK+MHAmd54sZUCin+7ZQ9UbGD+jJ2iroAUoh5luMMMTdofL/vfgUoUPSvczh7ldiBwLm1WC+1Ra/RkLLzFjux6mLPR6YmZ0TIEDh3t+sq+Mddl+PaTtEW/oZ2P79vH+3FKQOpDuan34RbTWTfOTgwp17mEbW68xgCVQPwszvyvtnLjm72sBNIcbSjPrSq7QqBGI8FLh8IxttYErESnIyu4aYN6zcCbLqrgSxo4x2yUTXOxBVvKH2Yr5IP19y/tYiSUiiGPUIMiqd0Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCyTDatRkUlZW988LBowFJADkIXhGEJsiIYEon0I2i4=;
 b=BWZ1WkW7AUFbDAYmvreVEM0XjfwNOXmxvDHkZz0DIgmPs/Shfqm28DGCkESEeNGECtvXoHIl2fxvbTIv5svWijZHb3edPcHGHV6dLgjjOfh5FqEBXR9PRu9Zsa1NYaqpNLfSD9GzC4JRLrzZoYhsKpRm8JbE7ZiWWPN6pXmKRhTXvZDuUyzIWGe5QS5/H+M0exURyANCkrnmW2srT+DleGWXd2yqPmL6Lgnb3D/Wrr9YWVsTcTSthPWbtlvUFkT19XdRJRAGF2qtGHV4nNbyEFMXm8s6IJTxmyHrNA+D6f3M9Er0Mx0pBJzG/5cwEzlGDnETTwOmUPjY5Adb0x0yOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCyTDatRkUlZW988LBowFJADkIXhGEJsiIYEon0I2i4=;
 b=K1tYkDrPzzQGMpQNJgdkjLXt3KEonxIjMAqEJki1Pu1tlhfKMPT1gyDkt8XTNFotE9X+kxdLPAQnxSkyviqEZ+hRfVFGZ7U4PVDmNKTfEG1XkLnyiPH1SPZyM69szjuxUEeXL0h0wXzI6/7bgFUQIhozviUsAYA9ZcQJKvzUK41pmyH4O/CyegU56tMcm8fZzu2JIFEPflxHEA58nvHBxF5Ke8leXltLcCX8y39wz8QIqB+vbuyqWkeV+RK6Ih83dzRE+MOh9g1MfEsxbFy9/yrgPtl1rA4N5SqYXPRIUBwuw5w+NAInSSRBme9yL+QNIDwdN3j0Hmx5CI/eQA101g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:12:33 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:12:33 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH rc] iommu/power: Remove iommu_del_device()
Date: Mon, 15 May 2023 21:12:31 -0300
Message-Id: <0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:208:c0::35) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: c082a033-05b6-44ee-dd44-08db55a23ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eXmWMbfhdMLKnLFaSod4rDgnLoxQ5Ek26czvQ8K8h2z+AQZQS9CXcnIL+gTBctu+ggOSC51SGviq55V95GX+LjaXaHhHDIa/A6dL3xWYrcRSIomj06tVbR19wmnw6O3jbrDlBm15CBgJAdZwtLXqC9H1vvbgS0kR2lo3rwkITwOpKDZ0V/o19+ZwFsfKiXDQYFWL7jnDeMbuinTBfgQa5WpEfRlZ+VPSXz0LsCmkdzzKc7LS8NrfWEP8Bo2NqS9ofycARqIljrBsotpFevRMOdmfCxF8qWzgDnEPtXwkLlLG8OJfUIuJ7NCKDAJGQfSIIjsdjJaF+xr2ZmWZIOs2fQxuoxGuOqYPJvjVRHRlmev/xEv7ioQBe0SKJ5+50GunE3kgki1fXgtMsYap9n46En206h+iMcRGAS04lGV1fRxQJb62BBs7lS1qcgLbu5tIgbQjeO4LR/oqpg9SJixamQiIWqJidCCkWcXvXYZ8wOQttL0uhWkHswo1WCsz9iMnRI+Zj9UpepL58jJeOpU4Z7w/P/yj+T8FeBRWWHLWYRVayTH1CIId/eLOqHcCMAwc8Lu5XnD/Ea5G6gC1tBsYUsBwE0gW2YygqteRK618I0E=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(451199021)(66556008)(66476007)(4326008)(478600001)(66946007)(110136005)(54906003)(6506007)(186003)(6512007)(38100700002)(83380400001)(2616005)(36756003)(8936002)(8676002)(2906002)(316002)(6486002)(41300700001)(86362001)(7416002)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Tr7g43peBM5aqaxNSD5qIT6Ywq/z2zFFJ8amyPjdJK67SJ9n5oFpiaaTc5wA?=
 =?us-ascii?Q?yzNDIcwWUO67vcfNO7mYd7gLHuq2mITCcZgdcL+a3FqyMV6HyLP1H0Wov6i8?=
 =?us-ascii?Q?xUXvEEUeEROMd/78kekUO1LixcMDJFzBxIwcNY5vuhA8S824Zc5s9lB/qZM/?=
 =?us-ascii?Q?LLESc5K70eP8lglKz2I6KiJJpvf6VjPFo4et4yKJxrdda2y9yFeSIsYTU2LU?=
 =?us-ascii?Q?WYjw9a9kRk54NeaEUL2K9Xbcy/xLNPwlofJdBnDuAi2Hd2RZVWjGLKnzsNkT?=
 =?us-ascii?Q?Z0RkhTCUs6zTijvywUJQ5SkfuwJFk6z8WavI32ty44LYHWfhQBnijjncMd9G?=
 =?us-ascii?Q?6njG7/lLlpfha1gcAwrYIHlpjMkrklzqkM1vtL7CyBG8RQ3KsphbA8QMb0Uu?=
 =?us-ascii?Q?M8HIr6qps3bcGFtXG2Eo+WruDVNRcxTkaP+vR7H0DUA/Qwp1SAADl44is61T?=
 =?us-ascii?Q?gGHbuVXC5v5fr4dW+qmbzjtFlgF7hlpV0wXP4gTBUHWQEFI3kgwghowPfOUC?=
 =?us-ascii?Q?nvoslohGvseTXoEVXQ1OSGaHy+n46tWsGnXNo69BOPt4RzPA962ym2qOxzn2?=
 =?us-ascii?Q?IWxAp8K5xrODHjQIY+zcSQ+ikmKetp9GVTGSVvyd1KqfOQgsnGa2X6NerKfZ?=
 =?us-ascii?Q?TmcwOILn7Sh7TiQZRysbAy+Ogw5FdOK+CwRFNS2d2k+oG6kfKRw9KxVSQMhF?=
 =?us-ascii?Q?u1q0w46jsq2inhHLB/PnZVb/Wt4MzhL+WfNmhdZcNc0grtP7S94eoL0EP0Er?=
 =?us-ascii?Q?PkEM+auC22jmO5S4PKst/LCvtu2zK/b+9Ab3o+QKJAcAK+qO3UzPKWPPj7Bp?=
 =?us-ascii?Q?Phe6SSQs/KYxMZCeUDukaIqPaAQOi+StUGe/ou+694iqL1FCNlXPJ8mgTrcJ?=
 =?us-ascii?Q?H33cV+k3N70UK5OHMA06YlIr4jVugBxsQodW0E/3OdDF3pIoHRDongLWvbm4?=
 =?us-ascii?Q?dB/2t0t8eI8nm2TjAWWnV+2bv62XwZ1tfU1em1wxW7fHuFbgMEogBVAaQ6k5?=
 =?us-ascii?Q?Hs2Rmo65yBSdwjwhyRlQV2wrfwURPl1Pg5Ngq/CdFLZy/K8fYI/p895+L6su?=
 =?us-ascii?Q?3dWV8p2CyiyZ9rDRJn1WqqcZt8WWzonWkJ0aYhhH5dDCCiItLsGhPMpysJ5p?=
 =?us-ascii?Q?HOfmfVkGorb0zgdRHzaYL6bKpMu7JHnhmSMcJI+n/WHi84NF+6TZiBtR1G5M?=
 =?us-ascii?Q?tkhRIkDz/C/f67DIx2lyHFOUNNAl3SfFo8XP0y4w8e0K99idVLv++79ijWA0?=
 =?us-ascii?Q?pbySjDWFrx2ddrhVoTnQcK3yQfzrXzeI0MwaPRuitgih3cX/W2X1rXnqfGFG?=
 =?us-ascii?Q?XlhTWd32Q8LTc5/iKccjaUJlAly72mvIuGcDx/4NU39bso05MF3cqSIZzem9?=
 =?us-ascii?Q?SItqUE/ILUbIq7Z2sBFsu2L16B4CRNR31DawPVbzAW+jU40b2MFpsA44uFz0?=
 =?us-ascii?Q?ulYNsK0ymaE0Mzh2OoIbvbuN01HZJepuoEUF8EFjy6RD0m+6+MMHVjUs8PPX?=
 =?us-ascii?Q?NjCBtY1UGXGnmPdD0yMiqO5nKOPBlKOFH8PUinIq797d6V3xyKEIpXtxkw1e?=
 =?us-ascii?Q?mlb9G30QHb+NVaNdtbDK/Q76g9YG2evYQFS5ZnXF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c082a033-05b6-44ee-dd44-08db55a23ee0
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:12:33.2374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xu7BSLvQDrn/i1waoq0pjdRLYKfLLSP+bwqoXVcLVmOO79e0Asrc7yuzdbnLcAHP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
Cc: Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <jroedel@suse.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, iommu@lists.linux.dev, Timothy Pearson <tpearson@raptorengineering.com>, Alex Williamson <alex.williamson@redhat.com>, Robin Murphy <robin.murphy@arm.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that power calls iommu_device_register() and populates its groups
using iommu_ops->device_group it should not be calling
iommu_group_remove_device().

The core code owns the groups and all the other related iommu data, it
will clean it up automatically.

Remove the bus notifiers and explicit calls to
iommu_group_remove_device().

Cc: iommu@lists.linux.dev
Fixes: a940904443e4 ("powerpc/iommu: Add iommu_ops to report capabilities and allow blocking domains")
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/include/asm/iommu.h       |  5 -----
 arch/powerpc/kernel/iommu.c            | 17 -----------------
 arch/powerpc/platforms/powernv/pci.c   | 25 -------------------------
 arch/powerpc/platforms/pseries/iommu.c | 25 -------------------------
 4 files changed, 72 deletions(-)

Michael, please take this on the PPC tree to -rc thanks

Jason

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 678b5bdc79b1f5..34e14dfd8e042a 100644
--- a/arch/powerpc/include/asm/iommu.h
+++ b/arch/powerpc/include/asm/iommu.h
@@ -205,7 +205,6 @@ extern void iommu_register_group(struct iommu_table_group *table_group,
 				 int pci_domain_number, unsigned long pe_num);
 extern int iommu_add_device(struct iommu_table_group *table_group,
 		struct device *dev);
-extern void iommu_del_device(struct device *dev);
 extern long iommu_tce_xchg(struct mm_struct *mm, struct iommu_table *tbl,
 		unsigned long entry, unsigned long *hpa,
 		enum dma_data_direction *direction);
@@ -229,10 +228,6 @@ static inline int iommu_add_device(struct iommu_table_group *table_group,
 {
 	return 0;
 }
-
-static inline void iommu_del_device(struct device *dev)
-{
-}
 #endif /* !CONFIG_IOMMU_API */
 
 u64 dma_iommu_get_required_mask(struct device *dev);
diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 0089dd49b4cbf7..8fce2da109ebe5 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1168,23 +1168,6 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 }
 EXPORT_SYMBOL_GPL(iommu_add_device);
 
-void iommu_del_device(struct device *dev)
-{
-	/*
-	 * Some devices might not have IOMMU table and group
-	 * and we needn't detach them from the associated
-	 * IOMMU groups
-	 */
-	if (!device_iommu_mapped(dev)) {
-		pr_debug("iommu_tce: skipping device %s with no tbl\n",
-			 dev_name(dev));
-		return;
-	}
-
-	iommu_group_remove_device(dev);
-}
-EXPORT_SYMBOL_GPL(iommu_del_device);
-
 /*
  * A simple iommu_table_group_ops which only allows reusing the existing
  * iommu_table. This handles VFIO for POWER7 or the nested KVM.
diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
index 233a50e65fcedd..7725492097b627 100644
--- a/arch/powerpc/platforms/powernv/pci.c
+++ b/arch/powerpc/platforms/powernv/pci.c
@@ -865,28 +865,3 @@ void __init pnv_pci_init(void)
 	/* Configure IOMMU DMA hooks */
 	set_pci_dma_ops(&dma_iommu_ops);
 }
-
-static int pnv_tce_iommu_bus_notifier(struct notifier_block *nb,
-		unsigned long action, void *data)
-{
-	struct device *dev = data;
-
-	switch (action) {
-	case BUS_NOTIFY_DEL_DEVICE:
-		iommu_del_device(dev);
-		return 0;
-	default:
-		return 0;
-	}
-}
-
-static struct notifier_block pnv_tce_iommu_bus_nb = {
-	.notifier_call = pnv_tce_iommu_bus_notifier,
-};
-
-static int __init pnv_tce_iommu_bus_notifier_init(void)
-{
-	bus_register_notifier(&pci_bus_type, &pnv_tce_iommu_bus_nb);
-	return 0;
-}
-machine_subsys_initcall_sync(powernv, pnv_tce_iommu_bus_notifier_init);
diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index 7464fa6e414553..e44d3c4a0781d8 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1695,31 +1695,6 @@ static int __init disable_multitce(char *str)
 
 __setup("multitce=", disable_multitce);
 
-static int tce_iommu_bus_notifier(struct notifier_block *nb,
-		unsigned long action, void *data)
-{
-	struct device *dev = data;
-
-	switch (action) {
-	case BUS_NOTIFY_DEL_DEVICE:
-		iommu_del_device(dev);
-		return 0;
-	default:
-		return 0;
-	}
-}
-
-static struct notifier_block tce_iommu_bus_nb = {
-	.notifier_call = tce_iommu_bus_notifier,
-};
-
-static int __init tce_iommu_bus_notifier_init(void)
-{
-	bus_register_notifier(&pci_bus_type, &tce_iommu_bus_nb);
-	return 0;
-}
-machine_subsys_initcall_sync(pseries, tce_iommu_bus_notifier_init);
-
 #ifdef CONFIG_SPAPR_TCE_IOMMU
 struct iommu_group *pSeries_pci_device_group(struct pci_controller *hose,
 					     struct pci_dev *pdev)

base-commit: 0b355ade2baf262f213da274411c0e05d8232a21
-- 
2.40.1

