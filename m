Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023A56E7F54
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:14:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1m7Z5Vmcz3fRk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:14:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sumJDtMh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=sumJDtMh;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5l6gq6z3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fP/nWE4Y+1zAJ6aT3Spz0TAjPJge/ox1xIf5jdb2bBCqQC5wvVWIm/+ivOaOWb2oT4WSubJfBz/CB7wl8V1FT4H2E41m9ysbfKIUhUOId9dJuMWwUibwUPfMlul60o31n6DSgOv3KUcFHtonFHJsydGdv4pjOy18yRqhuaBDcOwWz5+dYmPo0kgJnnDo6zPcSe/bYgofofHiBTGYIcDeZG+Pvw3WqdQqoakFrFlHvAk53kReH1ipgLxnZEWwjrXM5IorBIAtFjEpKciYe+CrEL1rUU2opsNvPxRVuXqFlI7Y8jQfup0I6Ns2XmFxPei5bejmK8PbUAdNYiUbmugpMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IZIH2eqDTb7gvP2TE87a3iuY8EB0jHQh5ieF/dsAzvg=;
 b=Y11SXZ/HEKeNAeMqWqWrlFsaDSzSHn8M6DWpmcEELmVh9Z9AI6ACyGYHh24B6Jn1W5IvRfKwJfARg/HJypRt7JYHYGmIU1F5+VqilA5lcccyrY0vaOmXmVkqyLLKHggVhNJ0o4kMDSTATVuKc4ZiX+/woex81I9syDc/ZVx8fPxND3QR+DjlgEKfK8ttR6IZdXnthfhpBrsMHEWWH2X426YZ47C8FFv7KjdwgBV63gmDH8h+eeT42WE8pxbl76n8PkOxiE5poK2zVvIfVozTFaNRxAoOTS6PxFheLd9Gv4f3llhltqH+roBjUIlw6GEh1tsjjeXDNUiXHjAfCNl2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IZIH2eqDTb7gvP2TE87a3iuY8EB0jHQh5ieF/dsAzvg=;
 b=sumJDtMhvEQMk+e3JmEt/P5+d/TJ3QMmxB9wb//9KL2e2pjT1+yN9UbuVMjoGYvVrW6Dbw35XfMuZeX4X58qLE2MS2ZDPQT3q1Okzy2yVgJV0SGl6QIDDKcZFJSOyUnrBj27awP2zHcY+8xI9J5i/tj6tOOYNF96BEP0xCRcft1pJf7N/3Nd70/T5Bsz6hIeJN1PclItFLxwJQNt5JvpPzgaMv2KqNtqNpmYCBwmuc8rVtxCI9D2AtJRRGHPCnlnFaUMrD1cRn0f8FWoczpWN3v0a7rK6I74KvC7Yd0FocozbsE3bI6Mz0X55HA9GrcZewlZjyar6jojWm9HtJb+4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:01 +0000
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
Subject: [PATCH 01/11] iommu: Have __iommu_probe_device() check for already probed devices
Date: Wed, 19 Apr 2023 13:11:47 -0300
Message-Id: <1-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 359c4b31-8f71-4895-c852-08db40f0ce4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Dui5RwpWn8CPvnE9Lx/K3KH1P/b+5yoq0qOwMDZtjFX6xI8eCw5KJToNe9QPynLO/sS6u8uPFWgIhsXE/0Lnr+8VspEsAgD/cUTKAwPOnb6LEL69Z0/DNRakPBjAwD1rq7dZ7FZMgwZeOCsq9GHLpxon3aEQOcWJAjtujxItnOFPZaSY62gvVK4PcZD8kuMMysUA4qng7mQ5q51vIlkcprdAsxJ2lAIlo2PSJeQjxopwuZ7pCG4mHBdZb+d22QtfdOz4z4LwypHhvyX7g4mi6eCiViaSUr7q9VG5erHe7xIqZ5EQlrB98bvFynDHidUuR8+y+8iXZmUAjYWM49FNrwtdM+sO1L04YZP9Vqqj11GCl4yoVaG1zSJoArF8AU/iKoRXPMmDFN0z39w4/qKhGqiWziVPUWxW/00WAq1e0yXtccoUHzE9KMvUB+I8Wd1J5g+ZnNnmr/PJvke+RNVoFstg7YsxwNwab8hDqtjUqA0j3OkX878PpNdDUwNrirm8ysL7RGlkyDc6lOdFUgQS2M2tTAlT4x/rh/RTmuCHwW2QLZDRHU2tPrOExbT3Eo1cMMoC0INNnvC6Hx2h/UhQ33ClK6oYBx1510xBsJgUOOmUc5i9L0+pGv87/K1dkjRB
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uANyYfqmq+SNLUfRMinp2OALKebol8u0nKWuxCIceEaS/emHxahogcTgRFhj?=
 =?us-ascii?Q?6NdaVdzir61ijQA6ULvqpQ/9XrP0D8IGuWjFPa8CazWiS19OsE55jmNwHmN+?=
 =?us-ascii?Q?gKLlkgeImp5A+M77Mpk2QZG56kL+Cr66ZbBES18vLPiwLsblA7NUC8JyPJVs?=
 =?us-ascii?Q?LcL++qXXf35wn4i4zPUwJZ8BKFBReat3UTYr9GCenyXb4tsqd0FR4qkQBCxj?=
 =?us-ascii?Q?5mtOVkbak+2U/KvlmNioBeVXcq3ILpHG74qn4f6Zh8rYKZiyHXufxPlgmJFs?=
 =?us-ascii?Q?obJqKH2uyh8Tukfhx5UWEA4tXlxS3t8M45bmuJH7Poxb0qhgfISBdZ7RV6j8?=
 =?us-ascii?Q?aPXZezCnSc4ET/j9u26y3HUMoj3mXUQdRyH8WSp1d3EangJoq2haa4xzoF7j?=
 =?us-ascii?Q?q6fEX2cLPdImvl+70CE/fo/5N8fo312wdJU1YM4SrcUoXNOBUmnmKQ2ujaZB?=
 =?us-ascii?Q?VCjctnS1B1UiUf1qAmP1MPYw8N8CYFxWow0nJ0oPbcm7MoVmhnKwj3u+DMNf?=
 =?us-ascii?Q?/k01j66/bP6opAXWrwqq2KiCnIQX1S+GXQXHqLptvReizgM4RLj4feYGtRFy?=
 =?us-ascii?Q?ItNBnP2kXdTnMZyN8dz3ZQ9moUCpIiNW52ozvmEmYUEvpJElQ5dAtoUgKXIo?=
 =?us-ascii?Q?fcz8FEBHt/gzwzxE1dej45gR/BJcUAZfD2FbNd3UM8OxVkA8HAj2/3k38d5o?=
 =?us-ascii?Q?XM2Fkte6U2M5oKAQQjSwLIHE/OmyAq61aJWQ5lD7zsl7VjWzW/uO8jWzAKJU?=
 =?us-ascii?Q?uGMuSNAr44mV8rkYO8YfPoUT4nG4bngRewOBXjgckHZRULRCQQvY5IBMu/ov?=
 =?us-ascii?Q?x0zi63OGu5elfi7rJWHEeHE8zGLx2lMtVXuo/0pvatR5lRV9+oLIyvzt6vGn?=
 =?us-ascii?Q?0czUzU9LRatTNvhdK5k/6c6x1jBDQAgIcrGjR43w6Vd7qTo7dueUfa61zpZ5?=
 =?us-ascii?Q?mHxeqIudpy91J2ybEYTFva3N02Cmbf+SXntjUexXKxSRx1c6maDrZhV/A0zD?=
 =?us-ascii?Q?Ggp2JKc24jNAPh4IYTsWA0WZ9M8HNmeJMroBw0JexS1O5mjvk8RQAmGzTn4g?=
 =?us-ascii?Q?a+cu8vzxb4dYBYN9M2rWFEMFlT3u3tQ6PQHXZh/7SRWLsMNhU8wRGQQfB9cQ?=
 =?us-ascii?Q?HCWqtpAQedxm0/V3MHqdmb3d3eZbH78dryVFk1GkQiyP1uSpMB9W3yrH3t8k?=
 =?us-ascii?Q?8pYW+P7e/GHZ5XOFGxfd2IFGsFKTh8yMbftGqKVe9zVhkIsHsiq/QDoLdByI?=
 =?us-ascii?Q?UK3dqYIaVUEBGt4ptcB+NO6mRGkxlI10Sh8aDkTKDo8KxAH0cY6Aoi8H3oFi?=
 =?us-ascii?Q?SuUlcCvlL7N6HJWzww5WiI/6NR5buOwvFYNNzth3SrzOCTM38V7+adViyirc?=
 =?us-ascii?Q?sRc3ldflQOWoMHNX/cnyVmpYhD/htbJ8FRVg1WnO5XyxeBld2ZV8seGSpg4t?=
 =?us-ascii?Q?oir75pFaH/toA22mMrgLIa5aflGVP1sPBLegl7VK9wnCon+y5VI9RaUYpKe6?=
 =?us-ascii?Q?DGXJrltgaAtCYVAjZfp6aOirOzMd+rulinUKJXmuYp+bxu8gxj15T/ineXao?=
 =?us-ascii?Q?sAZ4rwO6JJ3TMiNZFPw4bIQQO1DR7gqRuWvDqo3F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 359c4b31-8f71-4895-c852-08db40f0ce4c
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:00.1878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rR1NovEdg2ODAgVuDXIGz36Fvkgn2L3R2I3FgKmwpxsP40lDdvII5v1gkLZgbCKg
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

This is a step toward making __iommu_probe_device() self contained.

It should, under proper locking, check if the device is already associated
with an iommu driver and resolve parallel probes. All but one of the
callers open code this test using two different means, but they all
rely on dev->iommu_group.

Currently the bus_iommu_probe()/probe_iommu_group() and
probe_acpi_namespace_devices() rejects already probed devices with an
unlocked read of dev->iommu_group. The OF and ACPI "replay" functions use
device_iommu_mapped() which is the same read without the pointless
refcount.

Move this test into __iommu_probe_device() and put it under the
iommu_probe_device_lock. The store to dev->iommu_group is in
iommu_group_add_device() which is also called under this lock for iommu
driver devices, making it properly locked.

The only path that didn't have this check is the hotplug path triggered by
BUS_NOTIFY_ADD_DEVICE. The only way to get dev->iommu_group assigned
outside the probe path is via iommu_group_add_device(). Today there are
only three callers, VFIO no-iommu, powernv and power pseries - none of
these cases probe iommu drivers. Thus adding this additional check is
safe.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/acpi/scan.c         |  2 +-
 drivers/iommu/intel/iommu.c |  7 -------
 drivers/iommu/iommu.c       | 19 +++++++++----------
 drivers/iommu/of_iommu.c    |  2 +-
 4 files changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 0c6f06abe3f47f..945866f3bd8ebd 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1579,7 +1579,7 @@ static const struct iommu_ops *acpi_iommu_configure_id(struct device *dev,
 	 * If we have reason to believe the IOMMU driver missed the initial
 	 * iommu_probe_device() call for dev, replay it to get things in order.
 	 */
-	if (!err && dev->bus && !device_iommu_mapped(dev))
+	if (!err && dev->bus)
 		err = iommu_probe_device(dev);
 
 	/* Ignore all other errors apart from EPROBE_DEFER */
diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
index b871a6afd80321..3c37b50c121c2d 100644
--- a/drivers/iommu/intel/iommu.c
+++ b/drivers/iommu/intel/iommu.c
@@ -3763,7 +3763,6 @@ static int __init probe_acpi_namespace_devices(void)
 		for_each_active_dev_scope(drhd->devices,
 					  drhd->devices_cnt, i, dev) {
 			struct acpi_device_physical_node *pn;
-			struct iommu_group *group;
 			struct acpi_device *adev;
 
 			if (dev->bus != &acpi_bus_type)
@@ -3773,12 +3772,6 @@ static int __init probe_acpi_namespace_devices(void)
 			mutex_lock(&adev->physical_node_lock);
 			list_for_each_entry(pn,
 					    &adev->physical_node_list, node) {
-				group = iommu_group_get(pn->dev);
-				if (group) {
-					iommu_group_put(group);
-					continue;
-				}
-
 				ret = iommu_probe_device(pn->dev);
 				if (ret)
 					break;
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 6bd275fb640441..c486e648402d5c 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -347,9 +347,16 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	 * but for now enforcing a simple global ordering is fine.
 	 */
 	mutex_lock(&iommu_probe_device_lock);
+
+	/* Device is probed already if in a group */
+	if (dev->iommu_group) {
+		ret = 0;
+		goto out_unlock;
+	}
+
 	if (!dev_iommu_get(dev)) {
 		ret = -ENOMEM;
-		goto err_unlock;
+		goto out_unlock;
 	}
 
 	if (!try_module_get(ops->owner)) {
@@ -395,7 +402,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 err_free:
 	dev_iommu_free(dev);
 
-err_unlock:
+out_unlock:
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return ret;
@@ -1707,16 +1714,8 @@ struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 static int probe_iommu_group(struct device *dev, void *data)
 {
 	struct list_head *group_list = data;
-	struct iommu_group *group;
 	int ret;
 
-	/* Device is probed already if in a group */
-	group = iommu_group_get(dev);
-	if (group) {
-		iommu_group_put(group);
-		return 0;
-	}
-
 	ret = __iommu_probe_device(dev, group_list);
 	if (ret == -ENODEV)
 		ret = 0;
diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 40f57d293a79d4..157b286e36bf3a 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -159,7 +159,7 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 	 * If we have reason to believe the IOMMU driver missed the initial
 	 * probe for dev, replay it to get things in order.
 	 */
-	if (!err && dev->bus && !device_iommu_mapped(dev))
+	if (!err && dev->bus)
 		err = iommu_probe_device(dev);
 
 	/* Ignore all other errors apart from EPROBE_DEFER */
-- 
2.40.0

