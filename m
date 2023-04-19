Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D556E7F79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mHz3lKZz3fhf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:21:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ukDxOGAH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ukDxOGAH;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5p4VHfz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PuBxsruVz3SWpp75c5ChlXpbEVAMhIszVoScb18ynJFNsYP9ezDGdeB5zhrvxhoJ61kCxPC+gKtASUl575e0LihqQHM/EgQ2JyZhWv7rzvgWRZyzBmzlOMEbsFVUbvxLdbQN+SXWZhCcm3i+i0/p1GVGgAssizcQQy5OmoY+sQn550DL0289mbzX/dWho5TrKJvUA+FFLnsuqmS9dgkU/ds3Gi3vVQTL3R3WWHOijHUuKXLSyBCdiCl2c5Fm4gTtWRazmF0N+cR1gSGlVRpx5F6x8fSdMAuoCigL2RmfNCQfq501nEMBOu6m+DRLSElDA1jjFTIk7GKvFlNZkq6DMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=353FuJA1X3EhPJJ7umLqlJHQUoY7BY1Rk4U6jw1j/Xk=;
 b=HIIydWGN1Cs7Mn/DfWGL8h1/z6QiwB43j9psSBojxSeEE1YqEkE/GgNN1O+Eb8viQ+Ei3S+3UQgDzEPaMnkUju2td2Th0HriCyJFWacLCgJsPmhfPscGdCRIoCxQR7acNM6Ope0sMjwp9k4FPshP3oAIMN9jlYpyZR4xfCPYGjk1QMnHcjVPpIcJ/jlk9Na5kWW0V7eN0r4iUXJfsUejJ1o3a6KOEy8pKiGWPfrQAbNMX2iWXI9SP/tiAMC6XKnQKpUFmkNYe2N0TycFoDKAKEglE63dQn9QZFyTR2hjai1RhpZ8nN8CqIWchCZ+Tu4wn55Hf78bNQCTTifceZJrRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=353FuJA1X3EhPJJ7umLqlJHQUoY7BY1Rk4U6jw1j/Xk=;
 b=ukDxOGAH4E4sZwk1F2ezi72FLrkBU1Md5d/NK/XwsGzjF8rGoDJMUKvKbKSOF0cu+nnYdB+RERyqJH62JCxvXV/h5LfZpbeD9KWJnTH/r6t+g23BRXz6omy5/Fsya/NwJu8RQ7uhE+RE9n2yHWSYVHVPpSbkQsCTdpHtwOTdLJ2BEsvrh8joMflUxVkKLFtCiZISfXYJCFWxgI+1yZhEqims8wfK2d5NlbBctzf25VJS+O3fHp4Nb4gCR8/lFnfFJSeYkbmwNNl+g/t7g8rSveLXhmfBiMB5mltX6v38wKYjvYTmXPflJkYHI8Q+dQd2ya6x8qYFWvaXzODXZKu4rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:04 +0000
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
Subject: [PATCH 05/11] iommu: Add iommu_init/deinit_driver() paired functions
Date: Wed, 19 Apr 2023 13:11:51 -0300
Message-Id: <5-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:180::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: cbbbf07a-2158-4d11-4295-08db40f0cef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c3NIKHGRFvBJU+EZrvC2VI2xTfSa0Pr3rFRPZ5V2BHOtQzjvXEoPqtizVENAmCFKLBXP/OFAuyVnCx0unYa80HS3Y4k5uxnKEO+iF7e7L53AP8ijfdGma3c79g/1L0SKVHIlK0e1FQrc/UvhOGorsz6IJaxHsaM6LPbzRim90UNpMCvcBdQI9SKQGjGnaHDba6ITzIS2myG7QVHHg/qC1slPSYQ1X6sIh5dYeXW0VFEJr8L95VERU4c7cby84RUhO0OCiv8ZLDxUx93snZk4J5zylJ+3ZTXLXCoiACVbSedWAlbFh4D7RQgicr69+l0+g2gVP5mQI5Lr4a7Ztr7/H2gEthw3Ao3mlZETR6bIxnmw9FyYTU9T6Dn1Jv4SxXyH2DDoTQ0idK9gI30z3osVR3PVsAsR1GMwIBMId6A7i3dyU93li9RQYuJnniKT330s6jzW7BUFsiBikOvlZdJgdhb96vMMihDIBYl8stCSmzYCF/D5qefPqXCeMyOVFnSskpGglk1HTufc8MZtKO4uA+M3iykT4n7cd2SlID1VqqnP/BkRlvfdrCmt5u6DiynK+JpTe/jWVtlDP9I3v3XTBXLgnvlJgk0PqoE+tiMTH7fENuuUvS24X8+GD4TcwNAB
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ca+ySlVtvP0gIv9cJn1BidSGfrvGVbOUNQpx0NilhQWb3gJTCtJ2lHfcjVpc?=
 =?us-ascii?Q?UGOJu0ehoi1IFTKbdvbO9uq3pH1MPWCMBYJrDvwMsdorGR8mV1vLDozKmpyq?=
 =?us-ascii?Q?hW7qWosTpL2q5iqPKE0W0bm7KNZ4aPOoaC0C6NBeyk5QEeEnCVuszBoaMtie?=
 =?us-ascii?Q?4yNdWay5V0jYGlfXzbV8yK7gNQjywJmxHi5i57xqUrjnHmAOnc9MhKBCOyuv?=
 =?us-ascii?Q?t/X7Yq8bADvuNtL8/kDc+96f1KGx3Kt15HCZKqQs1cYdINyk/RYm1Dm3YVE6?=
 =?us-ascii?Q?2qasyPUik9sziA+x3Jtu+N4G2/TqHQI9itkNe9WaZEJgr8J7RQXixHjXgrMz?=
 =?us-ascii?Q?jQ0nhmL8dJnGqrgJVZ8jIOBe6NgyVROn3nu6TM/r44vci1IG1n1vyk+Wuhtu?=
 =?us-ascii?Q?/7S6VSYlalM2nyXvptjytZFAUQ7Ai+2LrhPNln/dn8h2Ym1QCnBXqB0yxv7x?=
 =?us-ascii?Q?aJN2H5eWWhFtuU51A+ueOmZsW0ItJlLFDhZdo65xs9to1BPFQXNYfNIakHze?=
 =?us-ascii?Q?1YWDP4WKhw3PjYYNNlwZj7XCSGCt++B//XUgv33w7XZ6LV/HqyqbvFdq3bpf?=
 =?us-ascii?Q?FPkPD1X2XF0cjyL2UVYPsQCYyqDsTFvum8tJlVd6W86HqCwOBXxnQS934r00?=
 =?us-ascii?Q?p4j6UX4tdi4BFzHeojycDolsI8jiMYx2Yej216MNeLntA6ObOoSRkHVOTH3f?=
 =?us-ascii?Q?N5bm9iPI6YrTQO/+XpOu1+kg89dbZqHNfSn4felav8E92wJf0O3f8WqM/hGh?=
 =?us-ascii?Q?24Rt6E+jb9WscGz7tcTaI0sI/AEi/2t9ZgQPQZ084qdOKmff2tQxbAl+A7rQ?=
 =?us-ascii?Q?rBs57QQ7Be2rZZnAJWo2pvihQm2uM+rmcdNGFGZAaJmEBO/3RiZIOpo5ptvy?=
 =?us-ascii?Q?K9pD30Khx8gTTadsIG0kqa+tvP/eBvGLyecbXYsuXXhIUzA1ljXQHVmjnRv7?=
 =?us-ascii?Q?b/1OWUdeh7ribRCDLMy4z4sjm/GtyVMVnHlE1EGioFZSFyxRsdlSVL0t3gIh?=
 =?us-ascii?Q?AyaA+M8L3BWbohbfp8peWN1wcoG2FZvK0AorYwNoQ2H9zYjJScoAQZuXBQhh?=
 =?us-ascii?Q?OmLuPwIWFJ0p4AZWsGms0OFqoQN3HpfLQnu0QgO2WGEFEEzITinZepZVUbgF?=
 =?us-ascii?Q?cl6gZPDShVgtDkFEjZWJMGT7P6v1qDofw77czSDHLv3W3JJq8WtRdZZbEhCT?=
 =?us-ascii?Q?sukhac6lGaV0EieCoV4lOlJQ8dZglBz06Ljz7Y3GLlfpUvpmOfPxXrX39tam?=
 =?us-ascii?Q?rY+bck97UuQWB2JXbjY5/yjEmlxTM58ZUaDWJbA8IZkrBpsYRjmG9hVrINhC?=
 =?us-ascii?Q?BMTc7CpSfki95xUyNzPNGgNiPJFVmT9mMhKUmqAh8vg59CenjkL+/chAuQbS?=
 =?us-ascii?Q?aHxQLdSbeX9vKsiqB3A8IX6+xbW9rBij/zEEmu5Ww+toNO5I+toev384mmPJ?=
 =?us-ascii?Q?Tf95kCxeBCmACYmfOflBJB5b4xggpbh6HYALJd55l9RKGwzSbFSsHMD5EcGO?=
 =?us-ascii?Q?/cRBSw/KyiWHUV5X0ARZGqu69VZHN+qrS6LxaK8eymG/jS2R696/qWeyUmMU?=
 =?us-ascii?Q?L69Ppa1V/ghxNBhhCjZlZbLDTNLAYb8EEMe7v1zs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbbbf07a-2158-4d11-4295-08db40f0cef1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:01.3975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UFp7WeVSIizCOqhCIaDqDeUUD56a37aX4gC1ihYdnjxBMzSqsXpYotG6nuSjc1gC
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

Move the driver init and destruction code into two logically paired
functions.

There is a subtle ordering dependency in how the group's domains are
freed, the current code does the kobject_put() on the group which will
hopefully trigger the free of the domains before the module_put() that
protects the domain->ops.

Reorganize this to be explicit and documented. The domains are cleaned up
by iommu_deinit_driver() if it is the last device to be deinit'd from the
group.  This must be done in a specific order - after
ops->release_device() and before the module_put(). Make it very clear and
obvious by putting the order directly in one function.

Leave WARN_ON's in case the refcounting gets messed up somehow.

This also moves the module_put() and dev_iommu_free() under the
group->mutex to keep the code simple.

Building paired functions like this helps ensure that error cleanup flows
in __iommu_probe_device() are correct because they share the same code
that handles the normal flow. These details become relavent as following
patches add more error unwind into __iommu_probe_device(), and ultimately
a following series adds fine-grained locking to __iommu_probe_device().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 186 ++++++++++++++++++++++++------------------
 1 file changed, 108 insertions(+), 78 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 471f19f7de8c4a..e428de5b386833 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -328,10 +328,95 @@ static u32 dev_iommu_get_max_pasids(struct device *dev)
 	return min_t(u32, max_pasids, dev->iommu->iommu_dev->max_pasids);
 }
 
+static int iommu_init_driver(struct device *dev, const struct iommu_ops *ops)
+{
+	struct iommu_device *iommu_dev;
+	struct iommu_group *group;
+	int ret;
+
+	if (!dev_iommu_get(dev))
+		return -ENOMEM;
+
+	if (!try_module_get(ops->owner)) {
+		ret = -EINVAL;
+		goto err_free;
+	}
+
+	iommu_dev = ops->probe_device(dev);
+	if (IS_ERR(iommu_dev)) {
+		ret = PTR_ERR(iommu_dev);
+		goto err_module_put;
+	}
+
+	group = ops->device_group(dev);
+	if (WARN_ON_ONCE(group == NULL))
+		group = ERR_PTR(-EINVAL);
+	if (IS_ERR(group)) {
+		ret = PTR_ERR(group);
+		goto err_release;
+	}
+	dev->iommu_group = group;
+
+	dev->iommu->iommu_dev = iommu_dev;
+	dev->iommu->max_pasids = dev_iommu_get_max_pasids(dev);
+	if (ops->is_attach_deferred)
+		dev->iommu->attach_deferred = ops->is_attach_deferred(dev);
+	return 0;
+
+err_release:
+	if (ops->release_device)
+		ops->release_device(dev);
+err_module_put:
+	module_put(ops->owner);
+err_free:
+	dev_iommu_free(dev);
+	return ret;
+}
+
+static void iommu_deinit_driver(struct device *dev)
+{
+	struct iommu_group *group = dev->iommu_group;
+	const struct iommu_ops *ops = dev_iommu_ops(dev);
+
+	lockdep_assert_held(&group->mutex);
+
+	/*
+	 * release_device() must stop using any attached domain on the device.
+	 * If there are still other devices in the group they are not effected
+	 * by this callback.
+	 *
+	 * The IOMMU driver must set the device to either an identity or
+	 * blocking translation and stop using any domain pointer, as it is
+	 * going to be freed.
+	 */
+	if (ops->release_device)
+		ops->release_device(dev);
+
+	/*
+	 * If this is the last driver to use the group then we must free the
+	 * domains before we do the module_put().
+	 */
+	if (list_empty(&group->devices)) {
+		if (group->default_domain) {
+			iommu_domain_free(group->default_domain);
+			group->default_domain = NULL;
+		}
+		if (group->blocking_domain) {
+			iommu_domain_free(group->blocking_domain);
+			group->blocking_domain = NULL;
+		}
+		group->domain = NULL;
+	}
+
+	/* Caller must put iommu_group */
+	dev->iommu_group = NULL;
+	module_put(ops->owner);
+	dev_iommu_free(dev);
+}
+
 static int __iommu_probe_device(struct device *dev, struct list_head *group_list)
 {
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
-	struct iommu_device *iommu_dev;
 	struct iommu_group *group;
 	static DEFINE_MUTEX(iommu_probe_device_lock);
 	int ret;
@@ -353,62 +438,30 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 		goto out_unlock;
 	}
 
-	if (!dev_iommu_get(dev)) {
-		ret = -ENOMEM;
+	ret = iommu_init_driver(dev, ops);
+	if (ret)
 		goto out_unlock;
-	}
-
-	if (!try_module_get(ops->owner)) {
-		ret = -EINVAL;
-		goto err_free;
-	}
-
-	iommu_dev = ops->probe_device(dev);
-	if (IS_ERR(iommu_dev)) {
-		ret = PTR_ERR(iommu_dev);
-		goto out_module_put;
-	}
-
-	dev->iommu->iommu_dev = iommu_dev;
-	dev->iommu->max_pasids = dev_iommu_get_max_pasids(dev);
-	if (ops->is_attach_deferred)
-		dev->iommu->attach_deferred = ops->is_attach_deferred(dev);
-
-	group = ops->device_group(dev);
-	if (WARN_ON_ONCE(group == NULL))
-		group = ERR_PTR(-EINVAL);
-	if (IS_ERR(group)) {
-		ret = PTR_ERR(group);
-		goto out_release;
-	}
 
+	group = dev->iommu_group;
 	ret = iommu_group_add_device(group, dev);
+	mutex_lock(&group->mutex);
 	if (ret)
 		goto err_put_group;
 
-	mutex_lock(&group->mutex);
 	if (group_list && !group->default_domain && list_empty(&group->entry))
 		list_add_tail(&group->entry, group_list);
 	mutex_unlock(&group->mutex);
 	iommu_group_put(group);
 
 	mutex_unlock(&iommu_probe_device_lock);
-	iommu_device_link(iommu_dev, dev);
+	iommu_device_link(dev->iommu->iommu_dev, dev);
 
 	return 0;
 
 err_put_group:
+	iommu_deinit_driver(dev);
+	mutex_unlock(&group->mutex);
 	iommu_group_put(group);
-out_release:
-	if (ops->release_device)
-		ops->release_device(dev);
-
-out_module_put:
-	module_put(ops->owner);
-
-err_free:
-	dev_iommu_free(dev);
-
 out_unlock:
 	mutex_unlock(&iommu_probe_device_lock);
 
@@ -487,18 +540,15 @@ static void __iommu_group_free_device(struct iommu_group *group,
 
 	kfree(grp_dev->name);
 	kfree(grp_dev);
-	dev->iommu_group = NULL;
 }
 
-/*
- * Remove the iommu_group from the struct device. The attached group must be put
- * by the caller after releaseing the group->mutex.
- */
+/* Remove the iommu_group from the struct device. */
 static void __iommu_group_remove_device(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
 	struct group_device *device;
 
+	mutex_lock(&group->mutex);
 	lockdep_assert_held(&group->mutex);
 	for_each_group_device(group, device) {
 		if (device->dev != dev)
@@ -506,44 +556,30 @@ static void __iommu_group_remove_device(struct device *dev)
 
 		list_del(&device->list);
 		__iommu_group_free_device(group, device);
-		/* Caller must put iommu_group */
-		return;
+		if (dev->iommu && dev->iommu->iommu_dev)
+			iommu_deinit_driver(dev);
+		else
+			dev->iommu_group = NULL;
+		goto out;
 	}
 	WARN(true, "Corrupted iommu_group device_list");
+out:
+	mutex_unlock(&group->mutex);
+
+	/* Pairs with the get in iommu_group_add_device() */
+	iommu_group_put(group);
 }
 
 static void iommu_release_device(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
-	const struct iommu_ops *ops;
 
 	if (!dev->iommu || !group)
 		return;
 
 	iommu_device_unlink(dev->iommu->iommu_dev, dev);
 
-	mutex_lock(&group->mutex);
 	__iommu_group_remove_device(dev);
-
-	/*
-	 * release_device() must stop using any attached domain on the device.
-	 * If there are still other devices in the group they are not effected
-	 * by this callback.
-	 *
-	 * The IOMMU driver must set the device to either an identity or
-	 * blocking translation and stop using any domain pointer, as it is
-	 * going to be freed.
-	 */
-	ops = dev_iommu_ops(dev);
-	if (ops->release_device)
-		ops->release_device(dev);
-	mutex_unlock(&group->mutex);
-
-	/* Pairs with the get in iommu_group_add_device() */
-	iommu_group_put(group);
-
-	module_put(ops->owner);
-	dev_iommu_free(dev);
 }
 
 static int __init iommu_set_def_domain_type(char *str)
@@ -804,10 +840,9 @@ static void iommu_group_release(struct kobject *kobj)
 
 	ida_free(&iommu_group_ida, group->id);
 
-	if (group->default_domain)
-		iommu_domain_free(group->default_domain);
-	if (group->blocking_domain)
-		iommu_domain_free(group->blocking_domain);
+	/* Domains are free'd by iommu_deinit_driver() */
+	WARN_ON(group->default_domain);
+	WARN_ON(group->blocking_domain);
 
 	kfree(group->name);
 	kfree(group);
@@ -1105,12 +1140,7 @@ void iommu_group_remove_device(struct device *dev)
 
 	dev_info(dev, "Removing from iommu group %d\n", group->id);
 
-	mutex_lock(&group->mutex);
 	__iommu_group_remove_device(dev);
-	mutex_unlock(&group->mutex);
-
-	/* Pairs with the get in iommu_group_add_device() */
-	iommu_group_put(group);
 }
 EXPORT_SYMBOL_GPL(iommu_group_remove_device);
 
-- 
2.40.0

