Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCAE6E7F5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:15:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1m9T4V0Sz3fXL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:15:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gMi0pJbr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gMi0pJbr;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5n06NRz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3wim9rOk9KyxqVLuVMW3k9gx1Zf1fpIFiC0xx54Q2Dzt2eId5YMVtQl40nr6uDO+j8YBksI0Z/lm0iw03mx7yxrkQxV22USWLDcAQyGyCU3l7xINrVBzJcOSxOjDhxYc1JWnU/8rQyJKKnhF4UvH4/rUvniy9EiylEkXhYTtA1J2gT5lLKiw6GyMyOF/aVuBKy0nqoHRCyUjCBQ1B4Z5ZP4fPB8jfQ/s/K+bkIgierg9D4LGCPF7p0Gz6IK1SDkjaY9lqWwa3SIrrL6rj/b83QiUQImgGd84vNQTWbz36z+uniYu/bKmX+0liFu3sLJXl9VjBJn42UdUuYmPy5iUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aQqb0UgFmuJH8irX2bNc4c5jSYqG6xBHUQ56qzVTFPw=;
 b=aDUiblCq258p5Qt0RPr2sKMpxcoB4rLqtJf23bbNDROyECVg2F5cRdCHsXZHLytpKcRC5dNWDsvTxg1Y9ne2U6ojn1mjeQ0hm0h8KdmiPk1J9/FFvpgOzxQLTHBDngs11icmA9hFdptolVw3tN/PP2IkmpTWzIeY2UPrOd9AflhE7vbwYXwZ2DFMoDZ+FXn9XcMIOFNuBMzmFUTtbTEov5JoOx6yhN8o1ZmR78ICNXOcXtBp5jQqIounSlolLNtkFcqt7p+i8CrUgTLNc68X2tuT+c/H8sYgmlUwT+vd/cNb3CsFBt7ZZjPs5+ZtTBJ0VU/55iuzdDAcWvFMDWvzig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQqb0UgFmuJH8irX2bNc4c5jSYqG6xBHUQ56qzVTFPw=;
 b=gMi0pJbrbphIWaZxxEg3MQXejjh5EB22UQNzp0f7fiWLSW1HhJNHRzQQ0/WkGGbi+MjDeeJN0MR8ZGWBcducNLeWgMyjMN3e0wy2NCTbcHBz1YAqIY1bOrnLbKNpNQ3E9NRj+pikU/DItgiJIMHu2+6NXrvOwHxK/k4KqsjV16pkaVJzfEy8XZrZzNuVYbW8Z4cbEabRo1BtjxSHV+xeEsOky6WSa8k8GRU1sQrBGf+lTTW+voyT16z4XAz27ugJt//W4k4OAioWQBNrCUxt9wh+/nuqLd6OW3/Ox9CqvFlC2HlXWhOjqQ5uIcAshVhcFxM0im5NBXAl6CJirygUSw==
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
Subject: [PATCH 11/11] iommu: Avoid locking/unlocking for iommu_probe_device()
Date: Wed, 19 Apr 2023 13:11:57 -0300
Message-Id: <11-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0167.namprd05.prod.outlook.com
 (2603:10b6:a03:339::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d559e8-7f11-4551-0cdb-08db40f0ceb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TO/quZaleEzdGIZUYgKK96MbmNSuG90LyxpnZJNPO3f6jQQdB5vmfKF1dkukTzVIhwTKjLnqjT/xrBMlDVScUGhwwnPpGHBhYJcDsMPVmfEqtAiPzSi0pfm0Sw3PI2jEhBuJd6lg+JbHkOayN8dIBwrH8n/Z9TGCnj4dlhxcBT67ZkbAOd+Yq1zaGQPK5Fi1zy+yR+vR95mvNmy7zHDuoKb3uUlLybVbkw6oHiTOVoq0oDiX3IRJBZYQSJB+bKo4qgMRPwRPlsFGBGUpaV13xu9+gBtUYyOhVIXFE2hXhCgQlX9AeUnSV442kBtgMmDs/CcSOSGpZf/iz+0UhabN3M6lpCGFvIyA/GZMtfdgnmQG7Bfqo1UkvCC0742k+jS2TxzLVLHIPHw2meq80wb03jfX3NVSifBcupqPNU8TKVJiE+2HW7PnIeoBsRd5FtPI3rCXcLl+2aCt2A2jfVIjzdBifyISUQxV3RfTpGr2nTFiJvp6eG/RdjoA6vjBSDGhU0a1wXvoU3bVhu3mT/AEjgxnNEIjL2QioBBOvyHHeOuC9n107CBYoU/wxCUC5HZ+XR4sThw2xf2gswTcIwSHE5o8yeZpgTGuEW6N2eHwAVs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2ztZWjsUIPpPJ26h5meE2waatIcYVvtktRBRA5LDH7voDmz5pvJXvOK+MRug?=
 =?us-ascii?Q?t0NvYL8ARu9mkuRS86TirP8FEmr1YU5vTHw7kf9jt4jw9aRO9J6Jl7/tvAb3?=
 =?us-ascii?Q?fTLCbdpEyqo2l0miMsdY/+0RMJmDZx6PNw9vr1+NOxLkEBs7K0df/T5L6qF0?=
 =?us-ascii?Q?uOdhegjLGQdlW9h0NkHXUaoPMmXeXz+3E6kUBEXUS4KddhQEZsAB/Qa6/OIs?=
 =?us-ascii?Q?WXzcQBIShpjvowUYY/UliSSmCgqWDE9FTfKCZ6j9sRyfumgeROmFVCyuhDFR?=
 =?us-ascii?Q?GPouRn/pjgYIP8v/MJOFG1KmE3uix8gTBKLti/i3wBfiCF7CP11O5rRn9cle?=
 =?us-ascii?Q?60LJJXmX0zTl/bE8DZCuUJvfi261yVRQ5iMU7BqgOK6kjPxTrIxhM7JGth7P?=
 =?us-ascii?Q?ZovNu/F2SaAwhtl/PsrX/3z59rJHbJORWBObv9ZPCWdshkv55lyqpd29S+rG?=
 =?us-ascii?Q?90k/pd54Xp5KhwyGyC+6BAXJ/SePEzVZC1dIa4RKaj3uc1ghWWseGaUTAm+E?=
 =?us-ascii?Q?jUe7lvfz9I4iAcvPYMN1UVo1gHXX7NXwzzaZIvtv8RhSafQE96SWL+0BLMcX?=
 =?us-ascii?Q?Li3clbgVHpaY6Rymgp4c56Wqyhv53zVuKyIn2h3uxf4R3c/e7ALsktwyQA6A?=
 =?us-ascii?Q?pBPjoNvPEzTEftOjURvnUWwgP4W/br2AbeA2Mrhy09mMdBgQmEjruFFhElgW?=
 =?us-ascii?Q?+VH+bNATP1kyVxNWN1/u/cKMvDSf5VR6RQ4aPf9+F0JOAbPEfkC686Sct7vb?=
 =?us-ascii?Q?wPbU24hiElWz/C9hJXgVWYfXAfAx6pH6BxyYPSGfTGuU7cXp5Gvttbbd+cuh?=
 =?us-ascii?Q?O9D3Jtv9aC3zEeuLXQxyLY1sFkKgEDxlkuvpKS6OUwsPAZQm8GTcAT8GnfNh?=
 =?us-ascii?Q?PrEJVC5ri4fGS1+rIh3zsFtLLSDzGdO8bmKZwpeDc+qohmFvvEqY98hJdATz?=
 =?us-ascii?Q?Qy1hrRzuG3KyOqBxcra7q7O5gbAui41TnXmD1JIJuAIXeFqTWrL2JDs02jp2?=
 =?us-ascii?Q?w/UW80JPdc+RLUxOX3ZNCt4kPJkmcnwvJ1986dUSGVEMApHvtnpxu98UP8Dq?=
 =?us-ascii?Q?giU25lbL0s9U9m9kjGnuN8VofgRI79JSHGuIem+mCVnrgJKmAwNe7CapBib9?=
 =?us-ascii?Q?zTllqRgU3mONgz1aPsz0Q645kWg8aCnGAV/tZsD4VORiyO02hlopmwWRnYJW?=
 =?us-ascii?Q?/amoYGrpIZtRwVZclbWXCy0E/Mb/spj+aE8KKJSMC8NqSUqrTevvxyLw2hNI?=
 =?us-ascii?Q?tYUdTzUObpOZW4Fzx9B3X24RSJ7FQmPt6sIIUtgx/3rMy33O+qikSt5BFkcH?=
 =?us-ascii?Q?HCKXgbulL7G/qgDKrQW26R2v5zF6IxC+kCJ5WauayZ/zpO/o+ru/72SaUmOs?=
 =?us-ascii?Q?qzFODI/6ufceSZSEz+aaomT4cmTD7Xrv6U/b7Ks4dZEiHWXSyxdPaR9HV+35?=
 =?us-ascii?Q?bMzbE0z6ZmAy5Fz/7N6fKm0Lsnrxh9z1nsfZuUB4nvs147T9ZaQh7sfBREOX?=
 =?us-ascii?Q?x72ylHBoNyyjDSvpe2f1tf4Rbc4nBJeCdvk9WA1kw6lrVcNj9hQP0P67in7r?=
 =?us-ascii?Q?nq+erzYHdYZCq0Vidua+z4XWrirMxxQXwrRc2lDs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d559e8-7f11-4551-0cdb-08db40f0ceb8
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:00.8861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GqSX/dpJVQ8UztCjzRUyVHxbWyo3V89BUGQcUxOu6K6HVqbL/O+gthwpdazUvyL1
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

Remove the race where a hotplug of a device into an existing group will
have the device installed in the group->devices, but not yet attached to
the group's current domain.

Move the group attachment logic from iommu_probe_device() and put it under
the same mutex that updates the group->devices list so everything is
atomic under the lock.

We retain the two step setup of the default domain for the
bus_iommu_probe() case solely so that we have a more complete view of the
group when creating the default domain for boot time devices. This is not
generally necessary with the current code structure but seems to be
supporting some odd corner cases like alias RID's and IOMMU_RESV_DIRECT or
driver bugs returning different default_domain types for the same group.

During bus_iommu_probe() the group will have a device list but both
group->default_domain and group->domain will be NULL.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 78 +++++++++++++++++++------------------------
 1 file changed, 35 insertions(+), 43 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 5ebff82041f2d1..8fc230eb36d65f 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -130,6 +130,8 @@ static ssize_t iommu_group_store_type(struct iommu_group *group,
 				      const char *buf, size_t count);
 static struct group_device *iommu_group_alloc_device(struct iommu_group *group,
 						     struct device *dev);
+static void __iommu_group_free_device(struct iommu_group *group,
+				      struct group_device *grp_dev);
 
 #define IOMMU_GROUP_ATTR(_name, _mode, _show, _store)		\
 struct iommu_group_attribute iommu_group_attr_##_name =		\
@@ -461,14 +463,39 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 		goto err_put_group;
 	}
 
+	/*
+	 * The gdev must be in the list before calling
+	 * iommu_setup_default_domain()
+	 */
 	list_add_tail(&gdev->list, &group->devices);
-	if (group_list && !group->default_domain && list_empty(&group->entry))
-		list_add_tail(&group->entry, group_list);
+	WARN_ON(group->default_domain && !group->domain);
+	if (group->default_domain)
+		iommu_create_device_direct_mappings(group->default_domain, dev);
+	if (group->domain) {
+		ret = __iommu_device_set_domain(group, dev, group->domain, 0);
+		if (ret)
+			goto err_remove_gdev;
+	} else if (!group->default_domain && !group_list) {
+		ret = iommu_setup_default_domain(group, 0);
+		if (ret)
+			goto err_remove_gdev;
+	} else if (!group->default_domain) {
+		/*
+		 * With a group_list argument we defer the default_domain setup
+		 * to the caller by providing a de-duplicated list of groups
+		 * that need further setup.
+		 */
+		if (list_empty(&group->entry))
+			list_add_tail(&group->entry, group_list);
+	}
 	mutex_unlock(&group->mutex);
 	mutex_unlock(&iommu_probe_device_lock);
 
 	return 0;
 
+err_remove_gdev:
+	list_del(&gdev->list);
+	__iommu_group_free_device(group, gdev);
 err_put_group:
 	iommu_deinit_driver(dev);
 	mutex_unlock(&group->mutex);
@@ -482,52 +509,17 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 int iommu_probe_device(struct device *dev)
 {
 	const struct iommu_ops *ops;
-	struct iommu_group *group;
 	int ret;
 
 	ret = __iommu_probe_device(dev, NULL);
 	if (ret)
-		goto err_out;
-
-	group = iommu_group_get(dev);
-	if (!group) {
-		ret = -ENODEV;
-		goto err_release;
-	}
-
-	mutex_lock(&group->mutex);
-
-	if (group->default_domain)
-		iommu_create_device_direct_mappings(group->default_domain, dev);
-
-	if (group->domain) {
-		ret = __iommu_device_set_domain(group, dev, group->domain, 0);
-		if (ret)
-			goto err_unlock;
-	} else if (!group->default_domain) {
-		ret = iommu_setup_default_domain(group, 0);
-		if (ret)
-			goto err_unlock;
-	}
-
-	mutex_unlock(&group->mutex);
-	iommu_group_put(group);
+		return ret;
 
 	ops = dev_iommu_ops(dev);
 	if (ops->probe_finalize)
 		ops->probe_finalize(dev);
 
 	return 0;
-
-err_unlock:
-	mutex_unlock(&group->mutex);
-	iommu_group_put(group);
-err_release:
-	iommu_release_device(dev);
-
-err_out:
-	return ret;
-
 }
 
 static void __iommu_group_free_device(struct iommu_group *group,
@@ -1809,11 +1801,6 @@ int bus_iommu_probe(struct bus_type *bus)
 	LIST_HEAD(group_list);
 	int ret;
 
-	/*
-	 * This code-path does not allocate the default domain when
-	 * creating the iommu group, so do it after the groups are
-	 * created.
-	 */
 	ret = bus_for_each_dev(bus, NULL, &group_list, probe_iommu_group);
 	if (ret)
 		return ret;
@@ -1826,6 +1813,11 @@ int bus_iommu_probe(struct bus_type *bus)
 		/* Remove item from the list */
 		list_del_init(&group->entry);
 
+		/*
+		 * We go to the trouble of deferred default domain creation so
+		 * that the cross-group default domain type and the setup of the
+		 * IOMMU_RESV_DIRECT will work correctly in non-hotpug scenarios.
+		 */
 		ret = iommu_setup_default_domain(group, 0);
 		if (ret) {
 			mutex_unlock(&group->mutex);
-- 
2.40.0

