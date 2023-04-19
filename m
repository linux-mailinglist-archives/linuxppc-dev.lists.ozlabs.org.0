Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 375CB6E7F5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:17:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mCL1RQFz3fW3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:17:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=svJsc6lu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=svJsc6lu;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5n4DZRz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:29 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXXDKPNzylCtFiYzpKUMLwwVww23mnbJzrgwqCoVQFpo9JHOo26/TTSkBYbuyZu2R3kstectC4jD3yyrSE8G+yq0LtkkRF6+UrIbycsab+jDN3tIgeUEazAzepAQgck+t+aP7TuddXhgoPwsMCxfX1KlMi4G75dM/eafTyd0JXaRFevd7Lxmj4evwR/zvZ78nRHug50kqBaRsWeHuUJKqZln5/nNb+uH0Wnrbf5v58fGUPOphizEvd6Z0UTcoiKpgRj10RYJsII75S/ddAZdB2YY9yyzAP+Il5U02sOS9lRrS19iLtovJ2hSR8z4GxuYwhPBObvOuk5X1hqF3KVHXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob1XCKWMZ1f8+JVqs+EBlACIP6d3Jj0FvGWJMUiTryM=;
 b=hvjAO1pQyBaek0uTy6zrKzEHM5lu4PQwV10blFXbEHQsyYGGd2cGFez/OtcB4y5TcSZnNDjccwTI+pRYYJ66v81IGFNHBmVuMyf0rg9dLT0DZhwnBAKx91tS0q/uLhH+acH+CgWloolITgsl31PJ3+Uubze1uGRQQTOtCO5u58hr1WThIzlJ/bDQ00z84tgPdWdfelV407fcxD+sWm6qLZRyJFhBSUsc0aHW04yotWc+sz/Fm0O6d9wdrw4XFUCakjIab7CGBfuPYJaKfm3EQblXImD7+u53LGplkp45bPDvL1RQAXimkrdURfBpeMB/qS5NR//9tQGpAFXSzxFwDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob1XCKWMZ1f8+JVqs+EBlACIP6d3Jj0FvGWJMUiTryM=;
 b=svJsc6luABNNQFcI7BswDOsmGkEl2CpIXc0FaF9sDxxbZVzZUfwiSPsXbmL/dzxyEQ2xSFcnms+QqvVInmVKFjFgGwluM1m80YfhMSDZLqv1C1rc77jAuyjf3A24jEhdHx3OQ+eCnSnHKOzLy/vBD+FVHVLWP9fAaQufR0TM0E5KsaRASBbyv/LRMfQjpJ/f3aV/Szc/qCi4vobaSvZ5+nj0raj5ktloCKT9OlpRmmYJPOdz/Up8hkctxM6mtKGolW8GjduIt62nkHLy8gNNOC6GDy5QA/TmB0gwiXUCr8YNT5z8+0QdVk+N3SREJpDUdJNuqcVmFBpQps41LYIwBg==
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
Subject: [PATCH 02/11] iommu: Use iommu_group_ref_get/put() for dev->iommu_group
Date: Wed, 19 Apr 2023 13:11:48 -0300
Message-Id: <2-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0008.namprd13.prod.outlook.com
 (2603:10b6:a03:180::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 475ca1c8-411f-402f-485b-08db40f0ceb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Rdc5Jut1iyB9vH0nN/YooH8lraIpWFKLaCSfhSFG070biEHGmacakRnHwFrMbuL3FkmLUqh+wAJlGkgiah5NLSleUho90952WrygMRP1+FGhwAfDzY59walc2vgc07gdsC3Cx2AxXDhVcYY+reDlEpM8332fNqeMOD/lhJe2eESox46vWnCNGq/koQFLBdFI9k9wZw7LH4aPk0n9q60c/S3QbujyaN6IB6WGz7M14Ec1YFCO5JUa7MlZYVhe1m88hYqcWSXr3rvxC1TtHZE7zZe1OdnOqhKE7ZOY6FJUSqGwN8A/uSwlHuHMlIqqh9Zkv+CmyyJpxLOIK/+99SkS1AjCaP9HC5E6k6ccZvfM9+ydFOG5Ue9MIqXmNoaxp1ooQtX7Yh2+rxwNR6Gs2HeVlJ+vBFXhU81IlxX8dU6vZajd+Ez3cflPzHvpnqs65Sas1wuL/zbrEYxIMbvBvMkGXc1a0F8TwlQI+njDhafJgCpFzCO67ZY+wH8YCPvWsytvUIQuIL/KMSD4syyXTI8kHn4h182mRWicS1fToUfi4QThfo/F5/oNg1MkR28hdtf+ZnS4MSXhTuogMRLJ4+nGr/r94hTu/Fi2yiYTTn5MXhGRUe2dvJ+nrOzQc6vvvnlL
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(4744005)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1K5W1cDddxAqOWX1h4yXFUPe38nxM6RznUhliDnP2UsbCEjRB2T9b5fgpsqa?=
 =?us-ascii?Q?mGLbzRyhBaL15l4W+VGuD6ODUbCzh6EB17zEMUXh98ChXR2KGgV+uPBGukeR?=
 =?us-ascii?Q?LAv4GXCdlUVVbGDGpGP2Q2KoRalNRM7P6cgTyaDyTGFrk2yriGlrY1FjpzT3?=
 =?us-ascii?Q?n7mH56cmrpgwbgvw+Xw3PmFMaFg+MHO42qmusPxd97nSxR5JmmxDxoFPhPD6?=
 =?us-ascii?Q?VopBciA1eXfl2ROYxdu9VrLP1QMgF5gvPXzY/MOj6dwhTV/INrsNnisKnYwy?=
 =?us-ascii?Q?DmzwykWPDxyKrGntN8p1HCpZWNwP33ymMFrzZUkfQod3H43Id4xFm16Jk4HQ?=
 =?us-ascii?Q?fOX+P3YVQhRZudsFb3q78ihefk3jufYZlhi3zD+fGTQ3hxx07QE45hev4syy?=
 =?us-ascii?Q?R5FHZ4S4glZJI+pLYTRSYDOt1WulNp9dOtaex0NffPiPIJug6l8PHH7ghRwY?=
 =?us-ascii?Q?RoOQ8yTz7dvP0JnACxddKEL0YqeqhQQDxccDVFrn4ihG9RNalTOG2a4E844/?=
 =?us-ascii?Q?swQmqfkM7rDDj4qOF1UdTdwZ/Gqhq70weB1nol907rO8iHDpx7tb81GgMJt7?=
 =?us-ascii?Q?M3pUCBB8J+1kR3BB5Ouvjf6FCBz0ltb2rj+7rKg/HIZSilxggRLuMkdAt0o6?=
 =?us-ascii?Q?/4LK2d7MuV5hWqO5eSWUxa7XlvWQc8gIwsje+yvDXTN+42Dbo475yAQ/bKft?=
 =?us-ascii?Q?NfTpNyary5pDHb3b9UAnEIaTwW/nh/wMwxYj6IbEA5rxbkR7X4Fta2z8ILFG?=
 =?us-ascii?Q?gT0oGEidibtLWGgUH4iLbE3V1XourVw9+gHn9xy1yqpLtZNrSZor0M0oFWvr?=
 =?us-ascii?Q?dChlND3SdKOp2o3VJYfRiqzeM0i9yV2nVH9rLRZKmb/ElP0SvqjwR9v4L9zh?=
 =?us-ascii?Q?FMu/iz66VU3UdeoZyII7JKRK5F6CfNMbiVubR5WuA7mdspQ8ODTsfzjaHacV?=
 =?us-ascii?Q?mJkULIyt4u7h9umJHnFq1TrMUhZ8oPp1z43SlNcMNXbRFxr082CUjocm3I5W?=
 =?us-ascii?Q?V6AVaZCFFBNVwVWsfS3T9weGxoWn+bRRXtG1UzqufZHbJe7SPo5NfuZMPTBF?=
 =?us-ascii?Q?+ZWpMlIlOM3UdPGAVi5hHn2mLq5i2VHfQwrnPeDduVq1NJ7THkBkg5szqblc?=
 =?us-ascii?Q?YzNeETMpZDidjseRvyVkZ8Z3uqv0Jm7+Desy1Zj1OJn/k/BsxpQar31h+sxE?=
 =?us-ascii?Q?VcICUnUhXiUQBi4xTGx6370oUUgEjll+XtpII2jaCXANRgBhlcoTDW7IDw4L?=
 =?us-ascii?Q?ZNI5RNTsnPWgWyAVN7UH6dvstzEkUlcp3eNLBbCsZnIXipnYv1SDhJMXa34y?=
 =?us-ascii?Q?neXfAlY/2HXmjtcdcwnIPMUA8jkF0VM7Aiv8k50NP8l+oNRO63WoGSn+Du+i?=
 =?us-ascii?Q?Qqm9yAyxQ79J57jxGKWNbKtq/TayrL0kBW9T5yV1OmEK2o6GMxOa8gvZL6RL?=
 =?us-ascii?Q?zE9IAQlmBgKbhWZeZReMXEv8VrYsBo/9MUsx5cmlZUeyNVct8NxICDh5BoOu?=
 =?us-ascii?Q?W7dZkrBCTTHXQNvGI+5nPdO1gV1sv6oI75LkJkNVejzY6F+GDT5sqDz80q0H?=
 =?us-ascii?Q?i8sblN8TaM/ErMN5owujlFISTEnTpAbaHQwSNf6z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 475ca1c8-411f-402f-485b-08db40f0ceb3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:00.9098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlQ+YSeIikrBcNmIqqrMQNrBudwIYaH/4aadbrPQx4XFuk9NjAVcYXw9J9R0wfY8
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

No reason to open code this, use the proper helper functions.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index c486e648402d5c..73e9f50fba9dd2 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -496,7 +496,7 @@ static void __iommu_group_release_device(struct iommu_group *group,
 	kfree(grp_dev->name);
 	kfree(grp_dev);
 	dev->iommu_group = NULL;
-	kobject_put(group->devices_kobj);
+	iommu_group_put(group);
 }
 
 static void iommu_release_device(struct device *dev)
@@ -1063,8 +1063,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
 		goto err_free_name;
 	}
 
-	kobject_get(group->devices_kobj);
-
+	iommu_group_ref_get(group);
 	dev->iommu_group = group;
 
 	mutex_lock(&group->mutex);
-- 
2.40.0

