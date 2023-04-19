Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D7F6E7F74
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:20:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mH32Jg7z3fn3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:20:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QnfcsrLp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QnfcsrLp;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5p4VkKz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=keFkU2Uzy6ztZdXDcCWHEvM7nvmIPSQhfzN2gjoCdXFvLivZ3y0Uel3dTuRW82Ehvm5w2lwnFuAx+0jG5ElWYzUq/uuhsLMPywecQ8V6QotniMUI/HdfcWHA/MmhebvH0ykxZhITCAMtWO8H09RNzsijJxAKUznWPH/IPOxFjbsjw5+MmWV+fgIpQAx/BILJDBWWGkdpVTsx5vSkq8ok6vrSK00cC4wp9uei5TrrmuaaSCfRVy4ypEcbdclHwmR2j63atlVhUinatb2H9GBIZTArzzEWCV9qxhT1CLNvQtkCuSvXoqdWevRu2VO+wV5vI/n2br/lvGpCVCJ/RQVGYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zkU4TIkJCQSBw9Qz7BhF0/gnugPMjPL/sZ1r4i/1wQ=;
 b=BWtInYPoOV6M/Wu5Edvx2nHh9TuKyWDqRc5UJSafI0qyqfShh5Qxfktqatn7/nPeYkxCd+qjiMbCN1tD2unOT0bL1ct1u8gVqgIknsWIY/IYITpwng5+9ZhXM3QZaMt3U3kZfI73yGGGLRX7EO8l/1O6Egbgzv9aiN9Ce4UUsI/q55WGTsBGzK+JRXDHe3YXnNFxpLetqMf1gqWtnDywKcEYr6sOq4fqQVKm1sZR/zkJNRUcz/1qEhiZ06Vj2/wM9o5Y2XIBeEUDirbz9F51WahDFD31sSuuJhE199YTaSZxmJQc5907HT+T6x8B7s28/wbJZTT+e9NdjEb9x2rQ1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zkU4TIkJCQSBw9Qz7BhF0/gnugPMjPL/sZ1r4i/1wQ=;
 b=QnfcsrLprZyjHgDPNlP3cHofSHNhzT8s/ig0spL5urh2fDC7PBbFvnUN6Cqhq6qoLUrjohA7MOE7j1/IJkweXvhdbPf530CxaqGIonX6HZxrSOV1p4oZqPwLkL6cAAZ48/LcspTSIEjO2qExfWFfzCxhmRuoT5DFSqX1uv/CYIRjtaqm/iwjgxYud3FmnJ3x4QySS6fQAIL0FVWyd5qI62LxFTgY0vKNhBO/cqTXRR5jQGlNmMZtkWAxGAnHhZhy5FeVCss/8r7Y9RMgMUBbPe1a13T3j6zoNHLYd5luPuvUxGp5J7n5/tSbNpg3ramgw7TdZvc77CPFeF2OK4xFYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:05 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:05 +0000
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
Subject: [PATCH 06/11] iommu: Move the iommu driver sysfs setup into iommu_init/deinit_driver()
Date: Wed, 19 Apr 2023 13:11:52 -0300
Message-Id: <6-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0016.namprd13.prod.outlook.com
 (2603:10b6:a03:180::29) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 351a8674-1faf-4110-725c-08db40f0d035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LnLpMnYjFug1wgGiznw47k4adfwZn83/0NNMsXO+uXlTetbzuCY/VC2wAjM0hcQor5qn6tuVosFT4GOP2ie5ypx1/rJz1p1VTxh8oryWDqOtXSgqEFgya0NWUU6UBZtQqFno2m68RVIb0d8Ryka+BxGij07YalnEk5CrI3mUy6DJq+rcZx4YJ7zydU/jXpXhFQ9vloREsIUKz1XD+6hIQnRmKqmjWZ9OHPY73CB9rowLwdGqUAplUK5SfXRM7htCqIsCd8YI3ZvLPpFtnovee4Kv0qnWdz9Nf3hdL9stBk8FAoiQsDImJLIyQFwCoIbegOkBEgoKMv8aJFG4A/M+mCxsRLJQrp1AZRmW/qYlpJJtkmQuYtArhmr5vOGcpQRO2iVz1SXKaYgemcGGx3J4TLuZCtDLUgqPIBzp3/Iig9cx55ixWMYPZWldsVYe8He1gRaNZWXXaNLUbSfhP26V8YZ+AEjaNwJM8D96iu1NECwYPVADDACBVIhn30Bcw+Qj1Fu912WZoQ4XV1sFH7deHFFxhGNb32aUpYWIv1jDUTIa7XHA/rs8P06PeaJ4Ks556HFXr8bU3YaHXRoLu1RMBnupyVzhC4RCTsrBFabPd6pqgf2FfYv+A63bTCji2tyg
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pH9XvJKxotuXbRbPyL2PTCKEZQAtvpBrRoy459H3VQdZTihv47WKa8ZeL3qo?=
 =?us-ascii?Q?zAf9HuJeBxLFg4t4r9mvJksAMy2n7+/hHt+seGfvrXR6A7oPA7qvywfy9TFj?=
 =?us-ascii?Q?PmHabRK3BnqwAJ+KGlF2b9/E7MP7Ce9LjaR7u/qG9R/zkjuhIOhw7VqInW2A?=
 =?us-ascii?Q?mtuy2A5x2ieBf//FR199NBsNVaF1uI64NAGgnMZ6QgHrhKq6XPM6Lr/3fqRV?=
 =?us-ascii?Q?NjIEw4FKZtACruApGjgnr0RBPvoSSXj0gWcfAjmTCOCq9Fqj+zFKp3Y7OwwC?=
 =?us-ascii?Q?oCYRPnCRKTCnymn2VdKHc3OjlT9shYKyjJd0Jq2B+HeRAWGjGbZ5k8mIP4Mf?=
 =?us-ascii?Q?lIrGEUTYuUB5p5oI1tgEFLU5tV1mYEIpwb8Mev98oYH0uXmIt9fkYuocwF2C?=
 =?us-ascii?Q?G5OJosS5VjEeySG8QjjPpv76jzCshpTVrfRspDRcsiZZ+/nCEAx4ZGcRbj/Q?=
 =?us-ascii?Q?zoGLAX7n84PWQGXUjtJxpY8hVwsbHFSy1hjctspKlWDT2udmbAMSyGBwy1nj?=
 =?us-ascii?Q?lKTUynLd3TOgRw4g5QyH2kj7cMFPTp/8G+GblEkIySu7a+ddhwhKNlkb1ryS?=
 =?us-ascii?Q?IrFKr4TM1PW7Pyr18dW2tL5nWQjAIIlhukuE4YNe/nOzDnVP80lkM7HNS1C8?=
 =?us-ascii?Q?zbeZ5A9LeB7TTmntPd7gBoJe7QnKDVEIYTcJ9A7PVkV4mNB0pRjpTO2S4n/w?=
 =?us-ascii?Q?jqMFjLCu10g6chFV6IhFEI42oeaHx7vloYJeIBvaxRpzKCQL2RKpfnFEwn5a?=
 =?us-ascii?Q?VsGCIIorUSXZbJ3sCJi2eXfnWID9b651d+CUqUSRHWTGlVHlpy1B9yDESBPB?=
 =?us-ascii?Q?vK9fBRa7CZG+2569Oz22yrgYTELhYQEwjDmhCNMV8uO11tkYbdM87moSDfm2?=
 =?us-ascii?Q?Pjrp97xXE9EtAAB8uDAVma3PYVqDFEe0LZOLmEjMon2K/L7IxLrE9KAsnjRM?=
 =?us-ascii?Q?tF3bfpNEAtsiN9cN4SLUA9+WLf3L/y8ZxVzT618hdSYIAciUjJZiUIFZz9LI?=
 =?us-ascii?Q?0IfPrCeBYbvagQNRxI195m+6+2ZLNP2WBxYtsn14f2gFONXbhgVy4WfxxtRl?=
 =?us-ascii?Q?hcOPQd1Wh6qY15aEopK1h6oUE9iVDwAYPqo/6dmnb4+t0dO0VtVlcpwBq5xt?=
 =?us-ascii?Q?HAjBK9x+DBTZO/OqY3uRS6p+IVi/vR+6/ZTq4BfFgid3RgmAPL4InYcMLOvy?=
 =?us-ascii?Q?zMnmGr+/38WOfua0ijiQDvhDEAFMLuO1NSVSNVvsgxqfkxNz+E4n8HcDg23p?=
 =?us-ascii?Q?nbe/FfkU6HKc6YzW0Pc+ckCNDuGss352HyGAOxWikqSFgQRKnvaIAGUsZ7S5?=
 =?us-ascii?Q?/5ejDvEPTibO2Yj+nDTCvxER3mOssXZNJvehcSXybUkBHnrXzNbSdiNmHzSp?=
 =?us-ascii?Q?DNQtSrnjGlK76tnfdgY602n+QpIV2haDlzvCGZZ2wGx8ifQ2nNr6d30U+NQ1?=
 =?us-ascii?Q?R+NE81l4cyijsMudIblURxfXPDjeYq6qRiojm/Nkcbfte73FZdWXBfX/+008?=
 =?us-ascii?Q?atW7R2n+FcLrLkUBjsddk8IE7xL4Vllqh1Ii2eICXdKO/PIc2k0MeMt0gxTA?=
 =?us-ascii?Q?LaQxjWvps5vHxrFfFFq3xEsaHcdL2PGgUA9leNVu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 351a8674-1faf-4110-725c-08db40f0d035
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:03.3599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6KXzfVx+gWCuWyygUlHgOzjF12ZiNG2JdvFdPfoiVWD3BUpowIUNJMyq6irMysg
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

It makes logical sense that once the driver is attached to the device the
sysfs links appear, even if we haven't fully created the group_device or
attached the device to a domain.

Fix the missing error handling on sysfs creation since
iommu_init_driver() can trivially handle this.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-sysfs.c |  6 ------
 drivers/iommu/iommu.c       | 13 +++++++++----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/iommu-sysfs.c b/drivers/iommu/iommu-sysfs.c
index 99869217fbec7d..c8aba0e2a30d70 100644
--- a/drivers/iommu/iommu-sysfs.c
+++ b/drivers/iommu/iommu-sysfs.c
@@ -107,9 +107,6 @@ int iommu_device_link(struct iommu_device *iommu, struct device *link)
 {
 	int ret;
 
-	if (!iommu || IS_ERR(iommu))
-		return -ENODEV;
-
 	ret = sysfs_add_link_to_group(&iommu->dev->kobj, "devices",
 				      &link->kobj, dev_name(link));
 	if (ret)
@@ -126,9 +123,6 @@ EXPORT_SYMBOL_GPL(iommu_device_link);
 
 void iommu_device_unlink(struct iommu_device *iommu, struct device *link)
 {
-	if (!iommu || IS_ERR(iommu))
-		return;
-
 	sysfs_remove_link(&link->kobj, "iommu");
 	sysfs_remove_link_from_group(&iommu->dev->kobj, "devices", dev_name(link));
 }
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e428de5b386833..dbaf3ed9012c45 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -348,12 +348,16 @@ static int iommu_init_driver(struct device *dev, const struct iommu_ops *ops)
 		goto err_module_put;
 	}
 
+	ret = iommu_device_link(iommu_dev, dev);
+	if (ret)
+		goto err_release;
+
 	group = ops->device_group(dev);
 	if (WARN_ON_ONCE(group == NULL))
 		group = ERR_PTR(-EINVAL);
 	if (IS_ERR(group)) {
 		ret = PTR_ERR(group);
-		goto err_release;
+		goto err_unlink;
 	}
 	dev->iommu_group = group;
 
@@ -363,6 +367,8 @@ static int iommu_init_driver(struct device *dev, const struct iommu_ops *ops)
 		dev->iommu->attach_deferred = ops->is_attach_deferred(dev);
 	return 0;
 
+err_unlink:
+	iommu_device_unlink(iommu_dev, dev);
 err_release:
 	if (ops->release_device)
 		ops->release_device(dev);
@@ -380,6 +386,8 @@ static void iommu_deinit_driver(struct device *dev)
 
 	lockdep_assert_held(&group->mutex);
 
+	iommu_device_unlink(dev->iommu->iommu_dev, dev);
+
 	/*
 	 * release_device() must stop using any attached domain on the device.
 	 * If there are still other devices in the group they are not effected
@@ -454,7 +462,6 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	iommu_group_put(group);
 
 	mutex_unlock(&iommu_probe_device_lock);
-	iommu_device_link(dev->iommu->iommu_dev, dev);
 
 	return 0;
 
@@ -577,8 +584,6 @@ static void iommu_release_device(struct device *dev)
 	if (!dev->iommu || !group)
 		return;
 
-	iommu_device_unlink(dev->iommu->iommu_dev, dev);
-
 	__iommu_group_remove_device(dev);
 }
 
-- 
2.40.0

