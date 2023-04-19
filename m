Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B76E7F72
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:19:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mG71Lt5z3flH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:19:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=So9NzKOd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=So9NzKOd;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5p0nbNz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfkhuI7YmdaEPmPZ7kXjTXe1s40PKs2DOW3K3bgZn+ziZ+jJMaPjyM/bwCIUrQ3s7x8g37nqez7/3rl53gtzdAlWp8L7UAH+SwefTk3DUySVKhnBke9v4Q4NHXLn2S5sDVWsgRCTAFjDprTqwyzVWuXAhxaqJ/CHeH518AaAIHzpdEWvdc+7rr8/41TSTDzK9Qo+EnSC6kPWVbHO+m/Ta4k+WCfYFpw/zkIj+H5Xt4b0wZ2vc5zodmfh9ySQZdZL4vtSZ5Y1z/CMgYFpGn/UZxAeS4yZjE/SyhuYAlKqudm0nnfoQOrdDYydTtvggnMzIsgmabG7QDvkpgXMfib6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMAOlrhOsAjRHZPZVr7iC5jegG8NoY81ZiHzpk9P7no=;
 b=bjFF+fCiu60+XrvWlSZpTjxRuV9x4YReR3E9uZ0wNCenkhL/8iM2mI/ecgMa4cf0HSZYc35ldCSPREYGQ8saODkMELIFCEj/+T7Him1odkv/+p73fea1MthyNaiMMJD1GS5GWsJHjKM9Z1Uk4MV2RvyGxip+/VxfOePsj/PvEUpWf1V85hHKgu/dsB0A+8PpClUwvZHwuw2UagMsYTkrtOFpBrlFs0j8mdWN8wJ6y8MJCtnycaXFrNFcxZt1bgS1LEGiRH0EKcbbXLY61LzskTbQEZ7XCEQzBxZgQ1SmfCGyDqkNVoxDSYVVH6D3cL9nx00EFyrPDSgdN1IioiS8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMAOlrhOsAjRHZPZVr7iC5jegG8NoY81ZiHzpk9P7no=;
 b=So9NzKOdYpsdUofKNB+c09S621WOhG7ajePS+4LtsS9H0AN+tyzoj8RN1FaAzCeAJl0JgeyGAGqhd0Yr/YucGIbp/jLRS5rmCRShDVNGoM4Nl9MSnLsykkjuwKTcynyh7uFVz2ySwf3YDdEnGKk74vdZrqmuxfsYCW1p67kWXtUxCO3lTuddJkTeWZxt6H9LYz06VpcBj3rp87+RS66Xkprmz5skaA/8elJddMmK4vDlIoIMqvbD/PuO+ak21/rTYsLvgm3OufVdNiOZz+Z/FJxlJPjss8F8VB00DYyzA4FnETv5eRmxrMzMK0koHiv9ODC/iEou2CBpwNaM0C/q7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:03 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:03 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 09/11] iommu/power: Remove iommu_del_device()
Date: Wed, 19 Apr 2023 13:11:55 -0300
Message-Id: <9-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0084.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 712be6ed-3a1e-4829-4295-08db40f0cef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	WUtcRPzg+XeChLLrBeb1xMNbfaW9V1xjxX3my7i89e17GApwQ37NaoyLpPTwyBo5cTNGNIeCxE50sN1Kp6LhltJlQE7e8kcb5eX8SizAH62Uj/1GL0lHyKUo9/cHyIVQPCbQSvf7rTcmG8aalrrPuoMRRcGWDIjxQTZ76c7ADw/sz/FIbO+gZN0l14rYYd9lZ1ZckkHOJ1R6Sde6jyuyABjAjROfd26kRMYUKq0hojluNBi/qqNs+EuHsAIChtrvZiZ5A1WkcCkVZzLn+q+/Lbooeb87b7abRe/owt475xDJ9WeNmaAdDswgKbEKEberFL4etFNvVRNYxxCHjkwcW75XeCgXULHYv3jnZciUpdKy98yc7C2jQQtKRoIK4PfYwLGaZqKc1EC5hmh1Ms0nf005aVcyE6BK1VF4F4UvfDZnW9Z8AMIv5gpkXSe5+Kj0auebmFRkEQ3kyhmlKkRC0Cgb8SgC6uNZaaqoRmK6MUmFig7YA4/+DRfet19zGrUmZDbbygFVNFivXHuLWofU2/H8VKpT3p4rtBNAeJqqab8dMHl1o2Yr+/nl6ODqXoc+7wcICYaohvPNKIhtAQJSdAKxYlLmMnBCuWvWwkduhK9IcGg8QwcqE6EeAwWCZ11o
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BU/mgQlNxq9Rn2uAFXIYR3uQYs+bft4H3kHxVEvEekcRw8BlXlvN2YK6X5S2?=
 =?us-ascii?Q?dgB2hkGjNOY0gXIu1NvocdreIgeK2Sbdb7pf+7KV9V1VZYJuxbO/cRsfmzrY?=
 =?us-ascii?Q?9M8JrwP4K6jU1reZalsGW3juatUFGQEeFmoEMZP846JwkZa0i1UKRs9jx1Hb?=
 =?us-ascii?Q?BSVcLKI0BOsf6uN3c4d1IBMTBIqsB5cpeaN9nNr35eWEqQbGPC37S0Eeg6I1?=
 =?us-ascii?Q?ODG1O8JXYQQ+J00GrhOPS29ChysP4OuFbhZqPAgi+/PvPYZrrRwOp1IQ23sq?=
 =?us-ascii?Q?ER21LDCCeeIhHt1qvHWcJIAh4G5yCIA7wr4WWkV87LraDHIA74wk1Hml9yoB?=
 =?us-ascii?Q?7p4NydImQ+focmIwd/YufULPJuLBqQcmOxtKdWmSE7wlazCjudDjAanMPTqU?=
 =?us-ascii?Q?IOqhR8YsRqhuZhzNlFx3urB7bO1s+k2Y3uVLSMQU9ZIHGcG/8R1ZiBeakf/R?=
 =?us-ascii?Q?f0D0DylDmiVtvhXMLCMZr/R2EUJbtjx1eSxqHA6LSouJMaUFd2lhHfSW+ZU/?=
 =?us-ascii?Q?p7x6lxR33L+dQLt0sdjLMfeTfuXK+rFFVGH0BQIzidWVlYwj81s8/Rw/yjzw?=
 =?us-ascii?Q?7fxV6n0YFqB11TQ4k0yguKiWbVxVD3c1iRacZM6qaWtXj7k0VL/gVDKTcUwq?=
 =?us-ascii?Q?56fkfuEGVYhyU8PaR7BQRt+7QJdNGcfCG8ZpIIl0ZAWU2s3trg5mbnMxHsJy?=
 =?us-ascii?Q?ks5SWnAhHTyP7nfhTbdCiCvKpnewP2MJARFTyA3zF8awlKQ6gmjdaEOeO+1K?=
 =?us-ascii?Q?n6+/Ej8eCjp4hptFrld81Z84VJs9+uG04i9NUyQnyeHKyH4oP9P/SKFg9VEZ?=
 =?us-ascii?Q?gHW0soEz/6V9Vro5F9vV4FJ/ChcYKVuXGHIJcQsYN/QsyjciZabrMBpE8MEu?=
 =?us-ascii?Q?zW/AUeA+l8LBfolMbLQgKviEaQYdqKOD3XLqlXj9C6XsJwyUtBI71GD50pM9?=
 =?us-ascii?Q?nf6lVmM9eNYuUH2z7UZXm0skJZ5Dh0ElXhx9zxoZXwPIXVzGTsry5l5ubq8h?=
 =?us-ascii?Q?3eZuBW/wPQScx2SrViKa5++VsAE631cAGUThM+syrA1C6j+fFJuUApWDzANd?=
 =?us-ascii?Q?ID0Bld9bGf5Dn9bmVjWrMPXasjnsUC6G8SSRpqT5mu4++SlFS4DEMtkoC8KF?=
 =?us-ascii?Q?g+6momJ8A1wHXDEXFZHKSWRfJymX2YX/z4nmCDMSWXXn1WvyN10dKnPArHDi?=
 =?us-ascii?Q?IcZh8/xz6n6RoFMg9ICIkQcwanki49g+YzlZzGgY6PnUykHLcDNkTJl6J2w5?=
 =?us-ascii?Q?K/uRt7e49cOcON21FMuY/tCs+o8itoZOA4waFM1QYw2ENNFFP+hmTYWfuCka?=
 =?us-ascii?Q?YTLaSK4X/P05G1tCL0WLegaw6kwntTh15WIctql1iF0q+oWLMMNrIihDD71g?=
 =?us-ascii?Q?eVsidWhkG9FfL3rtCdZVGm+xituSAytwc7ZVcqjot6Wv4DPjBnNLVIuFgpNZ?=
 =?us-ascii?Q?j3ATVXMt1K/UAGiLFAxmn0LPw130XUQ/xv9njKGuWG60K/e9rjb6QyWMOYcy?=
 =?us-ascii?Q?W0kxxQDUzqn1XYrAzfQNUveKT9zGlZtLT1wDZrXCqV5qbKaCW9x9I66/M4N7?=
 =?us-ascii?Q?46emp+LJxb0RzZkxkuDbkZIgYx4ootsk8HzBKdVt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 712be6ed-3a1e-4829-4295-08db40f0cef1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:01.2501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPf7828p9oFa+7OBdDGn6+nav52rZ3o4dxmpyPGr1RVP+WnEVUnhEAtGH9Vm8lby
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6342
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
Cc: Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is only called from a BUS_NOTIFY_DEL_DEVICE notifier and it only
calls iommu_group_remove_device().

The core code now cleans up any iommu_group, even without a driver, during
BUS_NOTIFY_REMOVED_DEVICE. There is no reason for POWER to install its own
bus notifiers and duplicate the core code's work, remove this code.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/include/asm/iommu.h       |  5 -----
 arch/powerpc/kernel/iommu.c            | 17 -----------------
 arch/powerpc/platforms/powernv/pci.c   | 25 -------------------------
 arch/powerpc/platforms/pseries/iommu.c | 25 -------------------------
 4 files changed, 72 deletions(-)

diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
index 7e29c73e3dd48d..55d6213dbeaf42 100644
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
@@ -227,10 +226,6 @@ static inline int iommu_add_device(struct iommu_table_group *table_group,
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
index ee95937bdaf14e..f02dd2149394e2 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1162,21 +1162,4 @@ int iommu_add_device(struct iommu_table_group *table_group, struct device *dev)
 	return iommu_group_add_device(table_group->group, dev);
 }
 EXPORT_SYMBOL_GPL(iommu_add_device);
-
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
 #endif /* CONFIG_IOMMU_API */
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
index c74b71d4733d40..7818ace838ce61 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -1699,28 +1699,3 @@ static int __init disable_multitce(char *str)
 }
 
 __setup("multitce=", disable_multitce);
-
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
-- 
2.40.0

