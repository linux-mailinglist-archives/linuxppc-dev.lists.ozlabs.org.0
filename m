Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8686F6E7F63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:18:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mDG3962z3cDG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:18:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ie7cqju+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ie7cqju+;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5n4Dyqz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI9N9npIIsGwxEj+GSBGKdOl9aJdrNc12M/IBSpVc2Li81sp2mkp87LPF/0aNvR1UQGSbukyQ+pjwZCy0bCdNRmYE8KH5OIBynhqdP/jiNBd7Bdm6nsfJlzaZHmdqbGM6oVFlvp/5wq+Xv2PfQ7KtbRqthMY0DXkJAxOlOH7wyBdieDdaDSzhAIF/v+g6YxkmOaN03VTJFcg/PdoV19ZpUC7Y7sUoBrvjomh0vQByDMxAIcBFhi8oq0rj/j45ezSQcDWJnL6qoWKPdiF5QTw/oxcSTCv7Sk0a84d8AKyzcmyWEAvPsD4vYi1ZZXTz0gWXbVb3csbKKHZz0U/XVgMLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6yoTcTxmlwEabQHB2MrRTymByLRYCzJGzpn5wU87Zg=;
 b=SNPGeIyzc1JOC/bwhvxAo9S8lMH2tnLjLxG7Dh4ypXzuHbaagdVA82gek2k/wTODFmWGQuS/ey1T3jj+sthf3vaTSABUlQ7QR5giHfNMXmMnFjdSLgH8g6U6ockbgnueSmt4agIFUve0F8JD9OKbKLEig0bmkPgeIlhF3j6yiHPUYkQF4HmhgD4Lh5bNvtH7BF6KPfKPv95pmgnmHTjbXf9BOsRCJti1AILdKJKIQscNE607vh1Y1SK98KRvQ4P0qs4XnV9fIV7hd9Yai6nbbJUvD1nsPVlR20O1teb+gzWSgX/rzIRsG09XKJA+L++eJ5e147oV4vF3HDQvkLSd7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6yoTcTxmlwEabQHB2MrRTymByLRYCzJGzpn5wU87Zg=;
 b=ie7cqju+dXVqId1M8BmODfV2jqMFk0zsAtjbIFHUNSR9ti1YxBY/rXiRcBYZ7/L+s+tTpT/3EIJhv9+YrY/VO9yoMbPn0QWsKFrgvA00jAERRL1R5sdHqIgMZajPG5shkR8i0rhX+cZbtkcTAE+vpAf5BixP98RuwxsdA/Rqiv0TRCEdft3/4KeP4Mjd4VIAoNpMOSF6DlLEIU8RUlDSJ2pYMdPWkjm7Tj4TDV9W7h0o2R/jIHapvlbCDWe7cbaO9rB1+ATCOXH8SCEXugs+qw5PFAmNtdwzLISPrSNFROn8cFYavVusAuPUK3I+S8bopSt3BUjn3JfoBZfU7JlaMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB6342.namprd12.prod.outlook.com (2603:10b6:208:3c1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 16:12:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:02 +0000
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
Subject: [PATCH 10/11] iommu: Split iommu_group_add_device()
Date: Wed, 19 Apr 2023 13:11:56 -0300
Message-Id: <10-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
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
X-MS-Office365-Filtering-Correlation-Id: 04094da9-b14e-46a8-ce5e-08db40f0cedb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bwEv5Wz3AmXBzdByF9FpEVDiw+Go6gqhWXN14twFPO9cIbv1FDZRledWRfINOwvTvGFee4l32fFMl3lxFiq9Uwg878A5TyLzj21gvueadhsWAX0E1jGv+Vuz7boTfdyjVsrvGCioop6seGD7IBIL4zHZTwuHMbC2A+qwHGK4DNB/JZgsZTF802YHBxaVfqegJ1iM2rTMSvFLDRpGLpbLgqBa/sVDIr6BEGajl/q2KOa9jBdkWB2V2FtxzCQEZqtfVQgRERLjqjUaSRlu+wfu637jkM9Zeti6VCv5RoU/MHcSuYuHTPJ3sttsfSDhmHFu2UlJGSDfy3mM51XsZXL4nkjN0CFe7RFFWOlKNjndYgJPbMzwGD5AqkzuuPZYdNBqaCpMxy3bFh8O/w2oN/FM9D9DuP3P7Coml98i6OH1Ms7OQvluoxsIE5S9WTHjwdgqhS3X3YYPTiPF4r9OPSmOCy1dEFETBlqOShqGpcPMfmeaSrSmFdLPlPGcOcDXh3NSux9vTIxej9U97/bLn8gYAoSxI6PYbTlD0+AdkjqlBA6r1ac5bioP1hQQVzGd4fjJlWULKUEu7X1DLz9fgF0l4Tgj4iaR0VvY9us+DBxI8nk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?urQX/wxFoWXo6jZOaNp7Ov6BkEWfCP81ogw5obelhg55aGsfffpTx7/NFF9H?=
 =?us-ascii?Q?cQ1nnmr+XBRS3P9dDJme0efR/mmqSpP2fMVykpTlnHdU+bSGZid7zW5nuS7q?=
 =?us-ascii?Q?RWrVlejvaNsPVRkEi1LYMLCM9l4Ay17G3lyzC88xiqyCBMsuU929H4Kc50pI?=
 =?us-ascii?Q?ERbbSVg+O9uQmy1rdrP0vC/ON0xjyCRTmY8vWhoiRBgbpxuXyUqOTWYaGsBW?=
 =?us-ascii?Q?xbn0q9jV1OQ+QyzRdeR4zEfrN70SYvfmQSV46jzJ/+fPwyslZJg+GfMWYJwS?=
 =?us-ascii?Q?PkEG/1fTc64C64RhpzO7qV23SC5jsy6DaiURLgGdPQod8v+XZA9Yqr4QN7Dm?=
 =?us-ascii?Q?2yxWORfBrSo1/LCHPZST14xQYomHbn13Topy11xtEUoRGV5ADnAt2bNTXt4B?=
 =?us-ascii?Q?5/TwXpvfyEkWdMc/SLdjKfXlpMbTMymk+QiJjMt4nm32kNSKackrkcp4xFEr?=
 =?us-ascii?Q?xnahh+cRYqCKcSNNm/lN8g61OfVEW7Q7BAWycCDeyLMxEGtnLqlFe+1uKVxW?=
 =?us-ascii?Q?lR52lwwmUHVTwkJhCPxkbk5IyQAn1ztEl3aRva8zxehtuMtOgsQ4GymW34hN?=
 =?us-ascii?Q?REnnjJyanJvJsrpfg13xNwmPBT6s6yxVv9OAudsfg3ZZFA9DC9+BfEi2hZzo?=
 =?us-ascii?Q?yjil2H2oju3nD59lF15KvS7EXaV083SZlFUtFH4Tutrqw3mfX9E7Sug+NaPa?=
 =?us-ascii?Q?QegjrHaOTlWYoZU2O23R6Zab07hD+MwV5WGE9sWd7GjNiqoHr1zXig0D4JBx?=
 =?us-ascii?Q?6ZBNpOvjJ0c2ToH1TDW+4Q9J8187h5N8OH3zIfGcelodKMMk9OXlhBP6Q24t?=
 =?us-ascii?Q?AGuhNlHkILSsORHr1yuJL0FJw2D6+d9ooXpaQxMyr50Ve/kG+vRFmC4xAIX1?=
 =?us-ascii?Q?cTZnix9mdqG+Jqd1pgtR2DnsnI+RXf41WSxtfr4Cr0v9IUWYlSD8lWlF+XE/?=
 =?us-ascii?Q?Biq8vV6DsOvNSIVqCrmEkk0fJZqERgCHl5xj+UV/3ZjGsG52mNbt0itTsHlC?=
 =?us-ascii?Q?lzSZgVjUHSz0y5yp0Ha2lP3KVcBhi9QVquzM73OPxjnxTWfyhx4PbKMvR43S?=
 =?us-ascii?Q?hIZdv1YcnEs63QiP6wRlockMfcVENwSO87EPiN2iTMxdMuu1r8KceXy50Cez?=
 =?us-ascii?Q?UWvLSK0PGDXRwuXbGcC3PQcU4WMrM9PTkGEKv/rYvTiJS1pZoXfyJAh8kf1m?=
 =?us-ascii?Q?woAIiBynOLPr9T/zTJrhjh5SCHHJkGnmXtxLre27aPU5ABuQRVTTG42gP029?=
 =?us-ascii?Q?E6KQZFOalukk8m/wrU0LgJKcOUMT4DBSw5hzwx8R/Dgch9TIimGsfjF3e28h?=
 =?us-ascii?Q?yu/o8vu8bi4a6JFDzQf0wWtKcRky3JhF8C2RT+ELJYVjuHN/ifGeLBeHsBSi?=
 =?us-ascii?Q?rQ2dfp+VoKPpE/L2HMJrNdhz49IhD+WTQVggqBwHLrEbXvpCipR4jmwiJk+r?=
 =?us-ascii?Q?MgRCotp0nBaNzL7eHI3sBPFJaOmIxryUXVNFYW8hbnBki9QIskiz2f6+v757?=
 =?us-ascii?Q?sgRbiYQYelqLV2uvRMMnCYL9wfZ+iFRbeew3qFk6525ARzPLoMuwDW3Pcmqk?=
 =?us-ascii?Q?FP8RIdmpRASZSiQAomTOXCpcEiUqCgWUDz2XsUEQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04094da9-b14e-46a8-ce5e-08db40f0cedb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:01.1422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59cpjBG5U6OJWjn0eYNYiIaVV9dCdr9WhGsT06quSnkqGPcAKXThMByCyQI3GEub
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

Move the list_add_tail() for the group_device into the critical region
that immediately follows in __iommu_probe_device(). This avoids one case
of unlocking and immediately re-locking the group->mutex.

Consistently make the caller responsible for setting dev->iommu_group,
prior patches moved this into iommu_init_driver(), make the no-driver path
do this in iommu_group_add_device().

This completes making __iommu_group_free_device() and
iommu_group_alloc_device() into pair'd functions.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 ++++++++++++++++++++++++++++---------------
 1 file changed, 43 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index a82516c8ea87ad..5ebff82041f2d1 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -128,6 +128,8 @@ static int iommu_create_device_direct_mappings(struct iommu_domain *domain,
 					       struct device *dev);
 static ssize_t iommu_group_store_type(struct iommu_group *group,
 				      const char *buf, size_t count);
+static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
+						     struct device *dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -427,6 +429,7 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	const struct iommu_ops *ops = dev->bus->iommu_ops;
 	struct iommu_group *group;
 	static DEFINE_MUTEX(iommu_probe_device_lock);
+	struct group_device *gdev;
 	int ret;
 
 	if (!ops)
@@ -451,16 +454,17 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 		goto out_unlock;
 
 	group = dev->iommu_group;
-	ret = iommu_group_add_device(group, dev);
+	gdev = iommu_group_alloc_device(group, dev);
 	mutex_lock(&group->mutex);
-	if (ret)
+	if (IS_ERR(gdev)) {
+		ret = PTR_ERR(gdev);
 		goto err_put_group;
+	}
 
+	list_add_tail(&gdev->list, &group->devices);
 	if (group_list && !group->default_domain && list_empty(&group->entry))
 		list_add_tail(&group->entry, group_list);
 	mutex_unlock(&group->mutex);
-	iommu_group_put(group);
-
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return 0;
@@ -572,7 +576,10 @@ static void __iommu_group_remove_device(struct device *dev)
 out:
 	mutex_unlock(&group->mutex);
 
-	/* Pairs with the get in iommu_group_add_device() */
+	/*
+	 * Pairs with the get in iommu_init_driver() or
+	 * iommu_group_add_device()
+	 */
 	iommu_group_put(group);
 }
 
@@ -1061,22 +1068,16 @@ static int iommu_create_device_direct_mappings(struct iommu_domain *domain,
 	return ret;
 }
 
-/**
- * iommu_group_add_device - add a device to an iommu group
- * @group: the group into which to add the device (reference should be held)
- * @dev: the device
- *
- * This function is called by an iommu driver to add a device into a
- * group.  Adding a device increments the group reference count.
- */
-int iommu_group_add_device(struct iommu_group *group, struct device *dev)
+/* This is undone by __iommu_group_free_device() */
+static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
+						     struct device *dev)
 {
 	int ret, i = 0;
 	struct group_device *device;
 
 	device = kzalloc(sizeof(*device), GFP_KERNEL);
 	if (!device)
-		return -ENOMEM;
+		return ERR_PTR(-ENOMEM);
 
 	device->dev = dev;
 
@@ -1107,17 +1108,11 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 		goto err_free_name;
 	}
 
-	iommu_group_ref_get(group);
-	dev->iommu_group = group;
-
-	mutex_lock(&group->mutex);
-	list_add_tail(&device->list, &group->devices);
-	mutex_unlock(&group->mutex);
 	trace_add_device_to_group(group->id, dev);
 
 	dev_info(dev, "Adding to iommu group %d\n", group->id);
 
-	return 0;
+	return device;
 
 err_free_name:
 	kfree(device->name);
@@ -1126,7 +1121,32 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 err_free_device:
 	kfree(device);
 	dev_err(dev, "Failed to add to iommu group %d: %d\n", group->id, ret);
-	return ret;
+	return ERR_PTR(ret);
+}
+
+/**
+ * iommu_group_add_device - add a device to an iommu group
+ * @group: the group into which to add the device (reference should be held)
+ * @dev: the device
+ *
+ * This function is called by an iommu driver to add a device into a
+ * group.  Adding a device increments the group reference count.
+ */
+int iommu_group_add_device(struct iommu_group *group, struct device *dev)
+{
+	struct group_device *gdev;
+
+	gdev = iommu_group_alloc_device(group, dev);
+	if (IS_ERR(gdev))
+		return PTR_ERR(gdev);
+
+	iommu_group_ref_get(group);
+	dev->iommu_group = group;
+
+	mutex_lock(&group->mutex);
+	list_add_tail(&gdev->list, &group->devices);
+	mutex_unlock(&group->mutex);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(iommu_group_add_device);
 
-- 
2.40.0

