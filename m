Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE0705C06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 02:39:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLZ3t6hfkz3fYR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 10:39:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D9kCNW5c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::611; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=D9kCNW5c;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLZ0G6GMjz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 10:35:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMY4HgVn6BXNzOHYlo5AXqwBaFT4yO4C84Z2H+kqbR4ZN2HCJK/P3qxDs3fpR2mETx9PFOCi0tgbj/F7fonnVUKM8aeT6xRs/mczLaK4tDcAt/phjHGEZaVT19RqUoGSVejO2xXjvpA0JZ257OczWbJUcpXQkGIAgdj/uMl+Ak8AtCAPolboWYiFZ+h6laoklAKHzmSiRhIdXQR9yoCJShYkDQKWhCYFD7OryvqFw48r0Bms6pFIcxglU6FfaPBQDWC7sx6UDa0CKnXdVrqp/Gzyq1yRCJfV5P1WRrvhhNhiYo74vDdZ9Zw86IGnbc59LY098c2kZlKRDC8bgfTveQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HbLhhdrNfr6pZjCX/iJo2o7IofwaX2KCzf1LRysWDYc=;
 b=fDWmILLQ7MrEMLA8e2hOgKlN0IklTyfAydqisZuPbFC3R9Em6+7fbF5Azj3II+C/hysfsj6t7KFPfboYEn2nT4ei7tWmSC2ML/bQ7ospsMzlSPVasqghUiYni7bXuX7ppPfSRFh04376CyHRDCYospCp8Di2OvewljPeOJ6LYAp7vmQEPNSUjxmxADaWpS2h6lCUeByn4evStTb8wyBDd3nt1QNdUSMD0CZYwsP6FbWPSd6RLoF8hzO5mpE8i+KHv0qk6g1tX3qL0/iWkydoyk2/GxOW+/w3wBiYjdAV9Gf+A1wKR8bJBEu84yYaqWgveenzdo1rH+bjnwHpxJ5Tcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HbLhhdrNfr6pZjCX/iJo2o7IofwaX2KCzf1LRysWDYc=;
 b=D9kCNW5czIJiE0NC6ivBbE3+O++2xmEn2DAPkWbi1F8VXcFvsur01+KnEEDsUu4SUHBOMA14FTAIHwfbJWCa2URyY63HbHfhsy1C5FrGUWeetOmmMyFLAG3FumfFZB5n5nXffF0ru3MjmkvAZZ4Kijdbgw9Lk7ntPtpBFFyT2bEQGW9FN8eLt6hUNe0yC8Hh36I/hZGZZB4MDqwHNwBWSWMFTrpNfn4LrwEvj8qBS+XEUZpaxMYD6dLnsi2tTrrUkcWajpoSB2fALTKcVFyR4HcHHluUWxVPA1Y7jPl5NDaG+QrwyF/rbLtCCQPQC01CHF2qGLYg4sVTrRwMniWM2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 00:35:31 +0000
Received: from MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2]) by MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2%7]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 00:35:31 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 3/3] iommu/fsl: Use driver_managed_dma to allow VFIO to work
Date: Tue, 16 May 2023 21:35:28 -0300
Message-Id: <3-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
In-Reply-To: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:208:236::27) To MN0PR12MB5859.namprd12.prod.outlook.com
 (2603:10b6:208:37a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5859:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: c3127cf9-8a55-486d-8101-08db566e9df8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ijaO6dQVnq98rifcPKnkHRqKvSWV3qArg1S34mvYeeB30r0VEyAUyJTkz7jFIy74ZjAlRgmio0xc9reBjJ6LEToNrHBHx4gza6tgyz4bom7dcqOVVgRR+wuXgoDWUJQiBEiPIx17czeWVW1GCEZx+CPzdJgrlb3ykL6PluNMKMarNRMPsDtmgLMh5a+vxilo/70gxixSLtAf03mwrOmQ46WhfWGkBhNo/+iGnUyoLLaVIK7e7lJ5rDOhe1y1NVg35rmY/yytQdy9L8ZzAKgPsssqXQJxVAti6epKnbR9jbpNaefIFr3s8OssbXYl0wRY56Zzr/TJ82PpeaZmKEf+p712QKFdvZtwrBslUnd9JEtdAcdx90XQOw4yFV5Ke5fZje9DqjZHpZeMFQIg1TwKqzpV5vmIjLx2F9HSo3GAPEXMxP+iFjtK3S3wApyK+6B7UeVjlqchkVzr6VahqOupM6b4b6PwBNYfKAOru+jQpLLCfy3ezEEanMDyxRU+3I3iXILoGPNQBsuhucEOFY645/DNZ+8gczBh12oNqcqnxmi5i4T7hRgqv7inkAbRnfX7kd2d7TaAnu3v067yuz9OTCmzXirpuvCRe3SKQETW7oJ7xceNtDEwyqrgfjl606UjYndGRaFtgJVd1oIbZnPTyg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5859.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(6486002)(966005)(2616005)(36756003)(83380400001)(6512007)(38100700002)(26005)(6506007)(186003)(86362001)(110136005)(2906002)(41300700001)(8676002)(5660300002)(316002)(8936002)(4326008)(66556008)(66476007)(66946007)(478600001)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?MjovoV9/FSCPgbEo6bfM8OxJK/eirBQKLTB81BC80DHaEDZkbMzB78nl4VTR?=
 =?us-ascii?Q?XsqLQ040BzGYqDr2KoAGBprd9PDF7Jvr3FM5ktghQIsvXvaEY4LM02MPyuaC?=
 =?us-ascii?Q?tD1XPKo7ee9mBqWXrjdXEhrLLDksmWG1DOwx//NJ4s8pLSPykYPzTmDpUDuy?=
 =?us-ascii?Q?h50XyQjdbmCNPySI4iZqv3D7KALA0Ng9mvfyPV1UveZcsoyVFgP+QLhrdh6V?=
 =?us-ascii?Q?M+GavCKHyh8lNFfV4m/DOM5rg7qlnP8WlGqJE7BEZdWn3QffcfmWTFN8qcIc?=
 =?us-ascii?Q?OABYKx/G5ZEY3XEy1qYbFPUm2BUcXQHcUKvlGa07CBCSOB5SjFNfQwp/np6r?=
 =?us-ascii?Q?AbnIE9eTtsfrvtqebEhWLZAJHJqhRpQevktMcb/i4nJB9dLU7vreIrNTCMBR?=
 =?us-ascii?Q?m2Qrx1cX3V2W7nD/7XFnnBrG4G1o6XlzglYt4Zhosqi0YuQTDObGpjn/ANiO?=
 =?us-ascii?Q?DNvRwjsXXxsI3TV9bFh0V/+0k84/6hjWL8e6ZIbwyC4jSysbG7Ma/Dh3w/lU?=
 =?us-ascii?Q?T4T0Z9Mzu2hm8LCvt3VUKulDvbfOxiCxbE3lCudp6cGqKWWiKOYlnGJfe1NC?=
 =?us-ascii?Q?X3MXaKjiqA2qaEyRWkxB5+ckF0HiJuKl42j0vdANydvkhNDAczrT7d6Fvhji?=
 =?us-ascii?Q?87Z5v7ksvADSJdISuKryR6JPrxER9uxD2F6AiuCKb3nRludNM4ipUtLPt2ym?=
 =?us-ascii?Q?pYRsflPFIBFhn5ssZ8ED079z5gmn2BYiJcDhWLsNQbNDObHZby0gtin9NtlM?=
 =?us-ascii?Q?M6zfqJrvq3x99bLpLmuPiIGoQ8ZNMDCaf3rp57qTzWz/VDUc+6o+nyS9dvzr?=
 =?us-ascii?Q?HCONxy5LngjCN5BnHKDW6mNDTTvZDwrtIqXzJq2W4+UmuwSKVBjV38C3v/PN?=
 =?us-ascii?Q?jv1B3tL+hIhuC692GeJZCg9bSZsff0KKiA/bec246M0vc03z+yQrre3kmW+I?=
 =?us-ascii?Q?LBq3Xfe3JClaIMouZzaYwGNK6pkjkVgZKHP8cwrRiKT88EiVIrnZ2+5xUVv7?=
 =?us-ascii?Q?IpXmmGpbChtbV8WL1Dl28o4oQeM3dGmrqEkfoyTU3ACwPqXPGAzbVSVi3P/x?=
 =?us-ascii?Q?PsHLx0iNNHwGf/XkpPIxSyooIdg1PNOTjXRsYqN+zcIYn1wa8M8PSiUImJhB?=
 =?us-ascii?Q?DfwCHLrBkScvmF3rsfWwRCXhU76lEwRIdVfJz9F85DtZLfhCwrjdkJrHjAVG?=
 =?us-ascii?Q?3rczdYJKYpibqdXjUt09TVUhrpfz1GjuB1x2c9Gu+1ILQYGkytHjPJa/+kLu?=
 =?us-ascii?Q?FFdCZkM82xS8cvzX9VVUeNosT5IesyBWF2TUVC8t77LA9qPRlFSv1rJdq0Yz?=
 =?us-ascii?Q?e62Yya+d0zEDf6c6540g3o8B8SB666tUpdftsysYDn4B2LN8PbSz+6w0hB40?=
 =?us-ascii?Q?6tbZVewNLBIhRMwzZlBRP1oGSHgSnBjNFncaYIWCoy3jiSatcFJQCVBkufNW?=
 =?us-ascii?Q?ve2mSMyfO8Oz45MocMSprT9KDHx6I/VKly0RwcpI/QW0/MQi1ueIzJzf+2KJ?=
 =?us-ascii?Q?e0Sp1T5biQcWNh3OOipmRPcZta5/hQChC+Rmpy5KgggQSILdEyaBMk11PPEf?=
 =?us-ascii?Q?RxWLhXQTCwrokbcMFyRHoPc3vuCgx0CuQNS99ORY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3127cf9-8a55-486d-8101-08db566e9df8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5859.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 00:35:30.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WrJdGDehUJDMX01XcOS96+lfCDuPut8IGgBByOfPhzeDf7U1QLmZNslbthztc49z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215
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
Cc: Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The FSL driver is mangling the iommu_groups to not have a group for its
PCI bridge/controller (eg the thing passed to fsl_add_bridge()). Robin
says this is so FSL could work with VFIO which would be blocked by having
a probed driver on the platform_device in the same group. This is
supported by comments from FSL:

 https://lore.kernel.org/all/C5ECD7A89D1DC44195F34B25E172658D459471@039-SN2MPN1-013.039d.mgd.msft.net

 ..  PCIe devices share the same device group as the PCI controller. This
  becomes a problem while assigning the devices to the guest, as you are
  required to unbind all the PCIe devices including the controller from the
  host. PCIe controller can't be unbound from the host, so we simply delete
  the controller iommu_group.

However, today, we use driver_managed_dma to allow PCI infrastructure
devices that are 'security safe' to co-exist in groups and still allow
VFIO to work. Set this flag for the fsl_pci_driver.

Change fsl_pamu_device_group() so that it no longer removes the controller
from any groups. For check_pci_ctl_endpt_part() mode this creates an extra
group that contains only the controller.

Otherwise force the controller's single group to be the group of all the
PCI devices on the controller's hose. VFIO continues to work because of
driver_managed_dma.

Remove the iommu_group_remove_device() calls from fsl_pamu and lightly
restructure its fsl_pamu_device_group() function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/sysdev/fsl_pci.c   |   1 +
 drivers/iommu/fsl_pamu_domain.c | 108 ++++++++------------------------
 2 files changed, 26 insertions(+), 83 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_pci.c b/arch/powerpc/sysdev/fsl_pci.c
index b7232c46b24481..6daf620b63a4d5 100644
--- a/arch/powerpc/sysdev/fsl_pci.c
+++ b/arch/powerpc/sysdev/fsl_pci.c
@@ -1353,6 +1353,7 @@ static struct platform_driver fsl_pci_driver = {
 		.of_match_table = pci_ids,
 	},
 	.probe = fsl_pci_probe,
+	.driver_managed_dma = true,
 };
 
 static int __init fsl_pci_init(void)
diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index d0683daa900fa5..4ac0e247ec2b51 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -334,17 +334,6 @@ int fsl_pamu_configure_l1_stash(struct iommu_domain *domain, u32 cpu)
 	return ret;
 }
 
-static struct iommu_group *get_device_iommu_group(struct device *dev)
-{
-	struct iommu_group *group;
-
-	group = iommu_group_get(dev);
-	if (!group)
-		group = iommu_group_alloc();
-
-	return group;
-}
-
 static  bool check_pci_ctl_endpt_part(struct pci_controller *pci_ctl)
 {
 	u32 version;
@@ -356,85 +345,38 @@ static  bool check_pci_ctl_endpt_part(struct pci_controller *pci_ctl)
 	return version >= 0x204;
 }
 
-/* Get iommu group information from peer devices or devices on the parent bus */
-static struct iommu_group *get_shared_pci_device_group(struct pci_dev *pdev)
-{
-	struct pci_dev *tmp;
-	struct iommu_group *group;
-	struct pci_bus *bus = pdev->bus;
-
-	/*
-	 * Traverese the pci bus device list to get
-	 * the shared iommu group.
-	 */
-	while (bus) {
-		list_for_each_entry(tmp, &bus->devices, bus_list) {
-			if (tmp == pdev)
-				continue;
-			group = iommu_group_get(&tmp->dev);
-			if (group)
-				return group;
-		}
-
-		bus = bus->parent;
-	}
-
-	return NULL;
-}
-
-static struct iommu_group *get_pci_device_group(struct pci_dev *pdev)
-{
-	struct pci_controller *pci_ctl;
-	bool pci_endpt_partitioning;
-	struct iommu_group *group = NULL;
-
-	pci_ctl = pci_bus_to_host(pdev->bus);
-	pci_endpt_partitioning = check_pci_ctl_endpt_part(pci_ctl);
-	/* We can partition PCIe devices so assign device group to the device */
-	if (pci_endpt_partitioning) {
-		group = pci_device_group(&pdev->dev);
-
-		/*
-		 * PCIe controller is not a paritionable entity
-		 * free the controller device iommu_group.
-		 */
-		if (pci_ctl->parent->iommu_group)
-			iommu_group_remove_device(pci_ctl->parent);
-	} else {
-		/*
-		 * All devices connected to the controller will share the
-		 * PCI controllers device group. If this is the first
-		 * device to be probed for the pci controller, copy the
-		 * device group information from the PCI controller device
-		 * node and remove the PCI controller iommu group.
-		 * For subsequent devices, the iommu group information can
-		 * be obtained from sibling devices (i.e. from the bus_devices
-		 * link list).
-		 */
-		if (pci_ctl->parent->iommu_group) {
-			group = get_device_iommu_group(pci_ctl->parent);
-			iommu_group_remove_device(pci_ctl->parent);
-		} else {
-			group = get_shared_pci_device_group(pdev);
-		}
-	}
-
-	if (!group)
-		group = ERR_PTR(-ENODEV);
-
-	return group;
-}
-
 static struct iommu_group *fsl_pamu_device_group(struct device *dev)
 {
+	struct iommu_group *group;
+	struct pci_dev *pdev;
+
 	/*
-	 * For platform devices we allocate a separate group for
-	 * each of the devices.
+	 * For platform devices we allocate a separate group for each of the
+	 * devices.
 	 */
 	if (!dev_is_pci(dev))
 		return generic_device_group(dev);
 
-	return get_pci_device_group(to_pci_dev(dev));
+	/*
+	 * We can partition PCIe devices so assign device group to the device
+	 */
+	pdev = to_pci_dev(dev);
+	if (check_pci_ctl_endpt_part(pci_bus_to_host(pdev->bus)))
+		return pci_device_group(&pdev->dev);
+
+	/*
+	 * All devices connected to the controller will share the same device
+	 * group.
+	 *
+	 * Due to ordering between fsl_pamu_init() and fsl_pci_init() it is
+	 * guaranteed that the pci_ctl->parent platform_device will have the
+	 * iommu driver bound and will already have a group set. So we just
+	 * re-use this group as the group for every device in the hose.
+	 */
+	group = iommu_group_get(pci_bus_to_host(pdev->bus)->parent);
+	if (WARN_ON(!group))
+		return ERR_PTR(-EINVAL);
+	return group;
 }
 
 static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
-- 
2.40.1

