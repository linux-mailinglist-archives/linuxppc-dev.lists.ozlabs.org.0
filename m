Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EFA6E7F5C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:16:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mBQ2tTKz3fYl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:16:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B5jsfNfF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=B5jsfNfF;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5n061Qz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lskPeg9/4a1TV9FFDHrwxJ+Y9DyVVzCCfNsay5IUPHED/DSHWJ7w00XkCe+tLVt1ukRxrw2MQspsZ9Y6rxG6Bp2F9S8zPLxYzI49RsippnqYfCGxgKBut20MdgJQHMbxFi/hVL8/6A37gNoB1+hpeG+XNlfuxL1kuJj+8OzoXSFiHK4pV6EUr5jEwoOtpdiwHOob5q+1VwN+LE/LwZcd7kRF+ZO/2RjGvT+OEs/Vt/jJMJIoGJNwTbYBkKSCAdcQpW1EO6j38paiSzXWZQ0/32hTkua5hJ//Tivp4yx02UlCG6MQjPkyUDD1YD9Ha68iT67XTcrWL6C0UxU7PeJgrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkhcwo1MvvS4uEyQLFGpPIJVUSByXI6UYKCVXZ7joNE=;
 b=D87dynAkOy2SOABlz9Pj0tMimzYItJBa2hYgyNDPDxEk3/zmimo1YKrrsOlXW+mJW/GoKBqQDDSBTXxn++l4ZTbzzU9tX0cmHLmEaZtWQ8znuJubu8AWCUYSHbpl/0DV/pMdzHxYN2Nvk4LScHrALV5HV1Rj71HsCVykMExFFkNd/WvVd+13o6s05JUOWxK8uEfINltbrlSoznTH3KhKUtaxE7qPpPVJ6o96UOjXLK7vy2YGuh5Wt38aFwn6M8ADmMnalsyf1Lhr7nOzgF7JPR/xbaP4Capi9KMpLp3Dupf2dVVd+iRipemR4AyFpRB9jMga+jjvhIqSOecQqlT0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkhcwo1MvvS4uEyQLFGpPIJVUSByXI6UYKCVXZ7joNE=;
 b=B5jsfNfFVK543HtMFQD3dDuZU+lSzlI+lQFASNyibQZN+ksqFPJqn/+MW+DO4ZDnGoq/7WXoE8IHOMhqMDOgOsOB6JeSFZrGtH6ZPN3ThwRF6pOnkK2i6nUzALD5L4s4erxRMI4YMDi4KrGCA130eWty8x0O8LpPoJQQmZZs9ZaEVqX5Bf6tQJBSGhqVqmm5i6sKHwf57pApnl9DIRfcO0bgG8DxoVsriJEEPJPqPFwSm0vPN9AXKNjmzU/Ntu5WJCJ+dRWd3LuSNBQ5feieV/XumhZ/kKNgFEaFkWI8UrOwaaGKKTKKsQYyy428RXs6S/eyUTZVdgMH5rFUqD35Aw==
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
Subject: [PATCH 03/11] iommu: Inline iommu_group_get_for_dev() into __iommu_probe_device()
Date: Wed, 19 Apr 2023 13:11:49 -0300
Message-Id: <3-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0077.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 971a1756-062f-43b1-aa96-08db40f0ceb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Z6SbkqeSJrZ2EN4nL5a2buEX0UhkYjQXurehhBztfMA0XhM3ygof08J3eWc+xb43aBG0IMo0I4CxkMo8exQjUswFIociBe6JrPX4+36cwinCEetiHRUQBXjLswZM2KQ9NS3gU0FlSpGKxuCbph5wji2ixp07I7V8lBUOCpMQbR9a5BjeowG67DxGCaVVOfRJUNzvXbfzRt+LXdAPncK/0F35kqbjeE568QpKWbI0VWl2Hao3Lg1ceKEi1jO610aWOBV1/x/LcgXV/sxd0TrOJ3B+KVF13hktquwauWwSYGviLRkanFdZHn28FZ7UvhWiC/BXsBZRhpX934+j4SvN10h+gGJuCIA8l2L+hSmeejJX89iK06m3FKAeEEztnMVZj8azlqg+Ef2PTITl94BFNBKXp88At83IJuUNYEhcdE6wZN5OQ/eQLWNHnuhadR+p8iYOD7jFqbDZsA2r7ndHX1c9R2Kq9g3ijJNU03OxsSVF83KBnzY/wquOEvQTbELBjtynkiTLK8uQsmz0ZTNXnldyC/wSvq678OZ8EJiqvPwKl9Qkinh+TYkSY59Hwb2ouSJE9iGNnUi72IFuMazkUfANguPgW0fXWR42WIWLYbeVtYNU3IVmMtpI21DJAcSI
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?AdFI03mAuk7avDzQ9NEQg65jUrsnlIdNK36o3dsFTUVTuUjoC/k5Uq03Hrkx?=
 =?us-ascii?Q?lYSkTlNtU4KicNqDQLDKtJ8FB+1adhWOF905W7HQj5iXxXG9tLQUGRVVIfgA?=
 =?us-ascii?Q?X0Etk7VYoSnmzj9jjlIOw30eoxSkGy16oRz1IBrzxM78guZF7TJLFes1rSVL?=
 =?us-ascii?Q?XpOMUKmrv2Mg4YS5nI5MvtZ152ZHZ2huMgmEz9RygDVpPSIsFXTutPwiYHiE?=
 =?us-ascii?Q?ZtS8DICuevWGEs50VgcaVMkQroRR5DEovza694A+/are9ZFvHBbzOg1dquxy?=
 =?us-ascii?Q?THdlIv6z6ZwI6rPMUEnOb7H7+Tllc7s8tkKtBmmPIlheAzqNbnSFmodTWT2D?=
 =?us-ascii?Q?i6fFuHF6TmaN7Oa2UhODX5XtkB2hAp1m9+YSf+RxDN0IMkOlgagijKDygIhw?=
 =?us-ascii?Q?n4M1atV1R+y3YBMmHJqs44pSD8XLKGUXqXFLf8ODMJGNVFb/uwnbb0ViH2Fk?=
 =?us-ascii?Q?uwe0uhTNQzMPDo9AVgBuJc29IIeGLXkImwdYAbMmRaP0P2unpf52MykJny/h?=
 =?us-ascii?Q?YybgSK2IqAha4aXovScUS8MBkqwz+dob3WgX/SiYT36L/gDd69gbh3/BpPEI?=
 =?us-ascii?Q?bRMzKy+ky8DUxc6e+IUrqq01nsVKFe1JsPtKUQUQqAJ2L2TM+gbKABSkV8/A?=
 =?us-ascii?Q?TxoRRbCCQb83d+DP9UWjs7sLSZL5tRnx7qgKXHpyj6bZkARkicEfoNHhZ2g4?=
 =?us-ascii?Q?WuS2VjYY9mKuDI8xDmQiNU1dIT1roGbHOwPi/dwVUMd89TY2rwfAs2EKCTwA?=
 =?us-ascii?Q?WB65F//qUWKm1rOeerGvXx4ViDNZsQT/Utexep56BL9kkpoT941CIYZ46aZ0?=
 =?us-ascii?Q?cS3ijL0XomNyuvIsYj+Cewhot5gycvNSHZ3X1hwjz8rjMnT8BXWnFLoDm82p?=
 =?us-ascii?Q?FUzNVy2dSWnyOHuTbDb0+N0WRWDuSVfx0nNYtIIemQvTkgUkirYs/m31c9dr?=
 =?us-ascii?Q?vvDXxaxybBYjCorw8Ulx61RX6njVfhNGtwp8XrJv70OC4NvspKdK9Zb22YeK?=
 =?us-ascii?Q?dtFA3g2n9m0O5B9YX/Qq7/WYMplOkeBW5C2gOFNggMZ+P7xAOYq1K8wzWzDI?=
 =?us-ascii?Q?vX9tKLPgvczmbRV9acwCvSlXeaq5ZEmYzlAfnH/z+S7Ws4q4YI/1cO+ZrSLx?=
 =?us-ascii?Q?XDpFgwuRw9MqyO/bu2/ygtxAxLdTQ9mxvV/Huoumw/xzhH29naneEw0TZT4N?=
 =?us-ascii?Q?KRQyLa33yCWWCxeT6n5Q4nzXrjEVRzBQm8nQYQgus+kWDVYAvMw/XQVxT0/N?=
 =?us-ascii?Q?yuAziGd5DMRKB566fuU+CxChsFjXyrdq/FiVhT8me9wMtJ6Fub5ejT6BD50w?=
 =?us-ascii?Q?xxHofe007cN/4e59eQjhdg6m8D0F3RpvPsgcu3V4/rkXDkJsP/R9lftNRYYX?=
 =?us-ascii?Q?o8RKHwIvrt+DFEAAoBh8FvGos0Jbx/VIINQgCoo4VHnIKDEbS56Z6Oa6AnfJ?=
 =?us-ascii?Q?EJBhHnkR57tkB55vWQe7Sy8DJwh1dMZ5QMGfi0lxOSqMYttfS4Va8yR1aZba?=
 =?us-ascii?Q?NJCexhkuW08S1NxFbVMo7AZvBlF4zTVVUHudjKDJTQQc03mD0P5Px8jyQtjc?=
 =?us-ascii?Q?nFKeq2ZpirDuoESPzWt0dkSSApHR8r+/XtShBgxx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971a1756-062f-43b1-aa96-08db40f0ceb5
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:00.8786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vkhff+qS+U68PG9NZ4RZMJeoYziZ2rNW4sYPk2BOBh0Qa8iJsDhlNiWNM1ptH42M
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

This is the only caller, and it doesn't need the generality of the
function. We already know there is no iommu_group, so it is simply two
function calls.

Moving it here allows the following patches to split the logic in these
functions.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 50 ++++++++-----------------------------------
 1 file changed, 9 insertions(+), 41 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 73e9f50fba9dd2..e08856c17121d8 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -126,7 +126,6 @@ static int iommu_setup_default_domain(struct iommu_group *group,
 				      int target_type);
 static int iommu_create_device_direct_mappings(struct iommu_domain *domain,
 					       struct device *dev);
-static struct iommu_group *iommu_group_get_for_dev(struct device *dev);
 static ssize_t iommu_group_store_type(struct iommu_group *group,
 				      const char *buf, size_t count);
 
@@ -375,12 +374,18 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 	if (ops->is_attach_deferred)
 		dev->iommu->attach_deferred = ops->is_attach_deferred(dev);
 
-	group = iommu_group_get_for_dev(dev);
+	group = ops->device_group(dev);
+	if (WARN_ON_ONCE(group == NULL))
+		group = ERR_PTR(-EINVAL);
 	if (IS_ERR(group)) {
 		ret = PTR_ERR(group);
 		goto out_release;
 	}
 
+	ret = iommu_group_add_device(group, dev);
+	if (ret)
+		goto err_put_group;
+
 	mutex_lock(&group->mutex);
 	if (group_list && !group->default_domain && list_empty(&group->entry))
 		list_add_tail(&group->entry, group_list);
@@ -392,6 +397,8 @@ static int __iommu_probe_device(struct device *dev, struct list_head *group_list
 
 	return 0;
 
+err_put_group:
+	iommu_group_put(group);
 out_release:
 	if (ops->release_device)
 		ops->release_device(dev);
@@ -1666,45 +1673,6 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 	return dom;
 }
 
-/**
- * iommu_group_get_for_dev - Find or create the IOMMU group for a device
- * @dev: target device
- *
- * This function is intended to be called by IOMMU drivers and extended to
- * support common, bus-defined algorithms when determining or creating the
- * IOMMU group for a device.  On success, the caller will hold a reference
- * to the returned IOMMU group, which will already include the provided
- * device.  The reference should be released with iommu_group_put().
- */
-static struct iommu_group *iommu_group_get_for_dev(struct device *dev)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-	struct iommu_group *group;
-	int ret;
-
-	group = iommu_group_get(dev);
-	if (group)
-		return group;
-
-	group = ops->device_group(dev);
-	if (WARN_ON_ONCE(group == NULL))
-		return ERR_PTR(-EINVAL);
-
-	if (IS_ERR(group))
-		return group;
-
-	ret = iommu_group_add_device(group, dev);
-	if (ret)
-		goto out_put_group;
-
-	return group;
-
-out_put_group:
-	iommu_group_put(group);
-
-	return ERR_PTR(ret);
-}
-
 struct iommu_domain *iommu_group_default_domain(struct iommu_group *group)
 {
 	return group->default_domain;
-- 
2.40.0

