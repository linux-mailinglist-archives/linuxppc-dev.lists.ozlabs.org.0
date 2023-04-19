Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5470A6E7F7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:22:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mJv1klWz3fs5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:22:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cuMB1G29;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cuMB1G29;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5q2K7Kz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSoZaH26hpPKl/Pr9HfKsvSVxC4WWb5q/ZSG1KvI+L9X2eBPHLQaF7f+r7+Ch30f+JA6y2hUELkXj3xampnnMPoAT+bvhM30d2Pq/CpYrdnO+aqUIi/Emlw7o4fMsDu+pfzRd0nrYLaHGyrYL7eTfiskK3QBM4dJnzsM4RVumk1qxYx/3xd0rromER7Nf+Ji+u+t4dqRpniFTdnb/uOY9idW3FZgTU6TfbJOUwTH7+Bt0OYFm1XIEtjAp64dUEVCbk2ePQBQKOxp6SUYsLOp4JSV78NK1p/R21sU6LklsOje4hbru9/GQwV58i2rVFUakxWE5v9hUqnvyYEksToaNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HVLxJR9iE/gNszq8p/v3CUol3et1BHp7qOc/SpwCcY4=;
 b=NjXKG8jSc/ycOBFWcXpvYCAvn1VWmGuozXIJ3ZxGD+zVRvU5zdysa8VJciF5ATFB2xZOVoQqqXyDxrpOupxXL1TatDtdokmLeejoTD0udZOlk2mziIE3oMgQYomrcX8x/wM3Xawbmz+fv88xY8/oMhqIB2erq22sxsNXJO6JFCL+dGWe79ezxInHsM7N9bF8z6hbTXhNlWSjjRxGfVRZTIUyhmX48zsKfwUvyTE5/yzJgj24RdB6a3fdQj5Q5a7KPOb60kPRC+C6fgLT+0wDrECqcOI3O+cK3TvxIe5GE53e6/GpGxdZ+vi9veNLq/IKsvSF6qsg9xR3ztFiuYkw5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HVLxJR9iE/gNszq8p/v3CUol3et1BHp7qOc/SpwCcY4=;
 b=cuMB1G29RHRkNaRsjQJqnI4Cz5+tMg25uqtYrGOqG+eTnfn/TPSVT6KvYs6bLxxRG52Laa9aBz6+zjrLUlGU3ukUP8gZ0no6RcqzJzSh6+KQXJAypV+L/C8jzbyeHsKh6ljbbKtvdsT0RTPKtGvf0ikCssHLc7OdkkHBDRQvxo4IGhFvMhPKH924u42NojyJeMDPMUFeW/rYZKHz1nc4ubcCJ3U/Mu2yoBFaME3CUpxtGtuQgHOkmmwrVbmlFZhhvH78WOwTl/rFOIP++11HMYyJgHcisotiY159EgyroPDfTwkYAu9FElBJUZSCqPJPY8F3fRApMLOqMsluCqAeNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:09 +0000
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
Subject: [PATCH 04/11] iommu: Simplify the __iommu_group_remove_device() flow
Date: Wed, 19 Apr 2023 13:11:50 -0300
Message-Id: <4-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::23) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 95adde55-8713-47fb-8dd6-08db40f0d3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	BBZoPp7TrYeU/TDsk3Btwqzskm1LCTkZ5Uh43rrAXn0k3aX6hUAKzzozUWxo5iAXJiBHsEHTBeXsJgym3tLlzKiipp/bLMQDfx1BIspBVdxuLzBhd5FmeKEx8wZBiJ/Q+1Jvs6Ldh+aDLg9qnSh88SXpaekcDcnvQAeg05VLOWgyTvTKyNxPLQC82UZN4ub2ZWTD05EXKmovTRBKyfKg1jBIgiVxO+fNHtPi3+VOzjXEAZ5rgxqQlt429I2oRktYUYGyaM/FXj0e4pdi20My4K3aZguD3KNq0SkDKQ9GR4qamMOiJJjMtthKKL4cvddYDPyeS30t+QCnWE1aDaIlwKiJ/9AVCB1t2pYo4aXlM5Q4ItboNTLdqNBTHyK4nr1ShYBP4Gd4SNc3sPUawZmENw7RQlZaAT16+9BUnhaNL3drNxUmqIMNcy2V23k+Pa2lJTeXmTHPfhxjUne2fY3YbFFYfHv8pgAeWbu+AWzmDjsL3OD9zrf2Xf9U6dfrYGcd5ktiD2BCl7kEbpOIqt90KJZys0Okfllu96cYRw2ffTOM+a+PQennPMKI4vOYPHPXn8k20P9n+IFABV/0dW5BwMqg9CHC+rWokyZMSi4DnS3x+Epqi0a6QqGGx8OZ8IMk
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?8wVFQ7a1CNmKpJjLBfHyfUvUGdJoaIUBqGbsUlxA0GBTpL+bDbeA0mTL07Jo?=
 =?us-ascii?Q?u8vg0PRK9ML+oSNAASaEYpIa/qzP6rJy3s9PSlGAgUw5Ad8Ug2aOBTb6Xt50?=
 =?us-ascii?Q?wAQy2kY+6Rfdd8NXhYwZ598QoJejcpbU+2EXsMUrM3Biu7svA8m0nkj0YrXC?=
 =?us-ascii?Q?YDJx7Ovq5ui8kgPyOSqKMCp7uXTOtMIrol1uhGEVJkflIb5gRAj0eOrHhdYl?=
 =?us-ascii?Q?qrAJ1Qui3JsDP6US4ID1/s7nTouQPUr7YYBA64LNP2TFpgbnbG5zJFffn6MW?=
 =?us-ascii?Q?IQfHPeCGf1lAnBQod2r3rQOg9/eh65vkRC1Ltj40MZxTsZU45gRMCygzaw8H?=
 =?us-ascii?Q?7q8iZ0qEy4pfOp76QZD9wL5sFLin8aAhA4vwc1FgEvFlkzG90LvzMUehp/E2?=
 =?us-ascii?Q?vHuhVJWmM13jGJnO2ovAcKlwHX3g8LJ9FJm/dKDzcn4yslSrXnQm14xcPFUb?=
 =?us-ascii?Q?tIF+Q/8tz2NVISakDJc+joUMy3sHWzH9dmbP5CXMVUnGpGKfPBV1jsYHSmmz?=
 =?us-ascii?Q?+JkNwCLROcQKCnXJtXowVn9KjWrNd89781rrAudAkXV7NrpLZVUSM9zQYg3j?=
 =?us-ascii?Q?bTR6ouLlpVstjlx9gL9E3ZX5dIh7B87MzhkejoRhfK/Q17BQ8rEF7oj3k7bG?=
 =?us-ascii?Q?f7oDvGmK4Z1Fe07z0ufUXPcK660nTAB2PshhhhVuQaDihs7dKKWBDMxTgdwp?=
 =?us-ascii?Q?gzNdeLBpeQVoeE9zeqYRuJVfKvIMglhOvoyY5qZHaxzW6ezzwVLg/HDZQXa3?=
 =?us-ascii?Q?P1lChCBD0Wl/lf+kdF7gN0JJwaPNCZMBi3+AE51l5pOnBkcN8lq/nCtGpMRV?=
 =?us-ascii?Q?kRxqXLMzXd+8/ijVUJKtPgDZ80ba3c9P36iSFnsaMxwk4U1eytE03OETWUFi?=
 =?us-ascii?Q?sX+xuvnm1opT1j6FAIiDdi98rLNT+NzsjVUdOB18jFFkPZdQFALC9yyMYyg/?=
 =?us-ascii?Q?+VR8+1WUnvlpk7Teom2oBa1JWWYfWhxkk5xSXbF8pWN9XTSqdyRgHRJ/J89Q?=
 =?us-ascii?Q?5C3VdaEp+eAFoxjAqscepvC2Fvy7a1muNCYE64HBMNHxyqdKa1hGk0VIJUKz?=
 =?us-ascii?Q?tsgwvbS+7wri2+GGW6iRtk8V6IicdUOMBmmu9EhYzq3QPQtVteSHVyuF3Iuj?=
 =?us-ascii?Q?UhIe6dVtOh0ZThMokx0LwfoPvP6B+karWG36cudIyUao/rUI0VWKc1lqpx4W?=
 =?us-ascii?Q?NN2UnwpF45zyrdBRVTSuODmYUZlzD9bqwLRJCqEUPPt4jL7E5gc1Ap5a25yG?=
 =?us-ascii?Q?ZCOgKUC0toG78J0zqrifkayk/yqgiSwWOltKhb1OgNRc8CdqVczOtb4UZFFH?=
 =?us-ascii?Q?XGLD5Bgo+RyhEkx9jvMTLG9yDlJ6E8CXO8p4GJhr8pA75MqwX5k9aSYoAfaa?=
 =?us-ascii?Q?/yYbe1sOOIVehQcbHkGTovq5gdK+77iPCmJcv0dvZ7JkaHnqHEBkUpC9uFQY?=
 =?us-ascii?Q?iXo5S5IJGUiCatEFmN6J4q7ZfoIudotaXiNOUZMBimYTbIgynve4lewKS0sc?=
 =?us-ascii?Q?esil7FLnixl8G6PyRuBj0V6gpJfYcrJzm27Grz+g2ZhMIpg6jxBYOvVvJ4in?=
 =?us-ascii?Q?CKXBGJENk6DgA+g/GELG6Iheg9LRwZSOdO6HUM8N?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95adde55-8713-47fb-8dd6-08db40f0d3ec
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:09.6011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xU7OcIT4vOODPbjpMoHGKnhV8W2dgwgLIyihO+B8INO7QnnuIZ59LSEcNkB101IG
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

Instead of returning the struct group_device and then later freeing it, do
the entire free under the group->mutex and defer only putting the
iommu_group.

It is safe to remove the sysfs_links and free memory while holding that
mutex.

Move the sanity assert of the group status into
__iommu_group_free_device().

The next patch will improve upon this and consolidate the group put and
the mutex into __iommu_group_remove_device().

__iommu_group_free_device() is close to being the paired undo of
iommu_group_add_device(), following patches will improve on that.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 83 ++++++++++++++++++++-----------------------
 1 file changed, 39 insertions(+), 44 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e08856c17121d8..471f19f7de8c4a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -466,32 +466,8 @@ int iommu_probe_device(struct device *dev)
 
 }
 
-/*
- * Remove a device from a group's device list and return the group device
- * if successful.
- */
-static struct group_device *
-__iommu_group_remove_device(struct iommu_group *group, struct device *dev)
-{
-	struct group_device *device;
-
-	lockdep_assert_held(&group->mutex);
-	for_each_group_device(group, device) {
-		if (device->dev == dev) {
-			list_del(&device->list);
-			return device;
-		}
-	}
-
-	return NULL;
-}
-
-/*
- * Release a device from its group and decrements the iommu group reference
- * count.
- */
-static void __iommu_group_release_device(struct iommu_group *group,
-					 struct group_device *grp_dev)
+static void __iommu_group_free_device(struct iommu_group *group,
+				      struct group_device *grp_dev)
 {
 	struct device *dev = grp_dev->dev;
 
@@ -500,16 +476,45 @@ static void __iommu_group_release_device(struct iommu_group *group,
 
 	trace_remove_device_from_group(group->id, dev);
 
+	/*
+	 * If the group has become empty then ownership must have been
+	 * released, and the current domain must be set back to NULL or
+	 * the default domain.
+	 */
+	if (list_empty(&group->devices))
+		WARN_ON(group->owner_cnt ||
+			group->domain != group->default_domain);
+
 	kfree(grp_dev->name);
 	kfree(grp_dev);
 	dev->iommu_group = NULL;
-	iommu_group_put(group);
 }
 
-static void iommu_release_device(struct device *dev)
+/*
+ * Remove the iommu_group from the struct device. The attached group must be put
+ * by the caller after releaseing the group->mutex.
+ */
+static void __iommu_group_remove_device(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *device;
+
+	lockdep_assert_held(&group->mutex);
+	for_each_group_device(group, device) {
+		if (device->dev != dev)
+			continue;
+
+		list_del(&device->list);
+		__iommu_group_free_device(group, device);
+		/* Caller must put iommu_group */
+		return;
+	}
+	WARN(true, "Corrupted iommu_group device_list");
+}
+
+static void iommu_release_device(struct device *dev)
+{
+	struct iommu_group *group = dev->iommu_group;
 	const struct iommu_ops *ops;
 
 	if (!dev->iommu || !group)
@@ -518,16 +523,7 @@ static void iommu_release_device(struct device *dev)
 	iommu_device_unlink(dev->iommu->iommu_dev, dev);
 
 	mutex_lock(&group->mutex);
-	device = __iommu_group_remove_device(group, dev);
-
-	/*
-	 * If the group has become empty then ownership must have been released,
-	 * and the current domain must be set back to NULL or the default
-	 * domain.
-	 */
-	if (list_empty(&group->devices))
-		WARN_ON(group->owner_cnt ||
-			group->domain != group->default_domain);
+	__iommu_group_remove_device(dev);
 
 	/*
 	 * release_device() must stop using any attached domain on the device.
@@ -543,8 +539,8 @@ static void iommu_release_device(struct device *dev)
 		ops->release_device(dev);
 	mutex_unlock(&group->mutex);
 
-	if (device)
-		__iommu_group_release_device(group, device);
+	/* Pairs with the get in iommu_group_add_device() */
+	iommu_group_put(group);
 
 	module_put(ops->owner);
 	dev_iommu_free(dev);
@@ -1103,7 +1099,6 @@ EXPORT_SYMBOL_GPL(iommu_group_add_device);
 void iommu_group_remove_device(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
-	struct group_device *device;
 
 	if (!group)
 		return;
@@ -1111,11 +1106,11 @@ void iommu_group_remove_device(struct device *dev)
 	dev_info(dev, "Removing from iommu group %d\n", group->id);
 
 	mutex_lock(&group->mutex);
-	device = __iommu_group_remove_device(group, dev);
+	__iommu_group_remove_device(dev);
 	mutex_unlock(&group->mutex);
 
-	if (device)
-		__iommu_group_release_device(group, device);
+	/* Pairs with the get in iommu_group_add_device() */
+	iommu_group_put(group);
 }
 EXPORT_SYMBOL_GPL(iommu_group_remove_device);
 
-- 
2.40.0

