Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A536E7F6F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:18:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1mFB3TjFz3fTn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:18:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ik35qUtn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::614; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ik35qUtn;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5p0nwgz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2gdzuPiPGvLbAULbJRD77GDLD3HMF0Fr0IoYH4drYIf94FQynVyADSzBd5pudi7H97vgP7SJGvdVllsk7WsTyB6ix3USs+5AxtqBt+IRe5t5Baa6Mp8J83tGYrWGbHR++UhUmYLJQe8vkEqpNc+X3p2h/p8jO3bUtC7EnAoIfc+1AWgeWH4KAG1eHYN3dzx7WThop4FyemU+Hn3NGrx1a9+HOHU0IRiXjbzLqrOszSRiCnjPGC7iIzA3/uURlXfPHvwQLWn9U+C1RoAwhCpgjH9HGM/9XVFanRb9bb0UcJvqiGOM/3as08MAg5I8KYPTLNRR1Y1dCsSu1fytbf9xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXROLBZWq41chf0UWWjKrlZqXcyr2NcZSeQQ5Hphdt4=;
 b=DTB8rrC9chuqbtnsJlWkr0VZ5O6nyozhW0O1K0wCyJ+xxXTapXuIlbDS92QlY0xmzRoYGvhAB/H0X6uyKvbW31iP7IfCcX13QJtiFKbWoPZXHWbS2R5gZN3wxkxa9DhSCY5otcM8s++WF1uUB2v+OI3AxXLFbWc3lNMgQ3w0EGS0sXwkquR2pkF3Al8iglLxJh9H92eZTtt9DpKwn+E0xaPS4+s2LYBWrM8/k6rlN+Gz700jrcAn5FFidF82d50LQis4Htc2G6Oqdg9NIbfagkT4bBTk6wnoZDgFoBOdAU7E2IsIfrgtW1EWf1kjn6PMmXp1bnNcSx0qergDjR7R+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uXROLBZWq41chf0UWWjKrlZqXcyr2NcZSeQQ5Hphdt4=;
 b=Ik35qUtnrQo63VLUyOTrTMHHQEAH0Mz+jD1YTznEY8c2QLXIQqkuYjJEiXxtqY0B6OCXlIKIUxvosc8Y204GksMq/D9MUfbgXGNbWgtnIOzrKccT080iYIYemuyONfo3q3lWC1vwTcmJhZpEJdrU9pFp57X00tSHGNXJuclMk4Sp+as4v84kqkTuoOSVPl0ZPTEb7WzdFjqR50VSI1/On8YmPHObUksxGlnj6xglMFVu0p97VLvvMtYINUFzvomosKoAkP7p8HLovXysBkafrulkXv/ysqRBjxa4GwjQh6rn/6fvpP9LTulUvmXKRNiAfCcZw+AoTEiSAR2BebNHiA==
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
Subject: [PATCH 08/11] iommu: Always destroy the iommu_group during iommu_release_device()
Date: Wed, 19 Apr 2023 13:11:54 -0300
Message-Id: <8-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0177.namprd05.prod.outlook.com
 (2603:10b6:a03:339::32) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB6342:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d768044-573e-4e16-4295-08db40f0cef1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DIKW/4pLKXCwL2bMw0GdK53xznvgV+ZM4zEbPV2DpRydBNQ8KIg7riHSv/X84+TTZRd+LfPvIbC6IJoj2eWgdrnPVvqcrsS1rhXQqr1QjGbuWjUCIcE/MIMmzhylRe9VMtc8nHotENmWdjXxPMa13RdPfXlTP/2KKkL+bcMOa3138N/04OGwHeMzp3sWWgaU+IKWLzevGnfLp6LDRctVW2NTX0MDQ1e4QTAPNYSnkmXNqsAAYPPYC0+rMtfS51xEWn6kheDVBKgp4WMaAc3iOVDkbiIRQdG+O1HsgPyxkGU2uVDqV4I0FR0ld7GR+l9mpdL+3HwOYrz/65TrEHS1b8AMTdzTdYeKmBfQ/8tbVkUY7PqPz9AxH1MoNLx2q4wv2yiSIl9IAYI0R84lWtAFA9vX1zX9ZUi87YgpUVkSw/SNYaVAlbaauO3LT4ZSZ2+mk30WytuKUmYF4mBbV5QPqJeX4Otylx1q1X5FkDZkDd6cve0bhIZCnkvOXxdMn+tZAIqwQalCxH/sE+B3eK7ucebM6ivo1vGVhnK9eozpuDFRPYgCsWNsYfJ6YJM6gLV9jfMpak1LfHhJdssUxzG5cGBmbE6kYKPg5LlqcdUzBJRidJKv+Jl3xNGQgPywoHwv
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(6666004)(6486002)(478600001)(110136005)(86362001)(36756003)(2616005)(83380400001)(107886003)(6512007)(186003)(6506007)(26005)(38100700002)(316002)(921005)(66946007)(66476007)(66556008)(2906002)(8676002)(5660300002)(8936002)(7416002)(41300700001)(4326008)(54906003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2NKee0phDVWu2C9sVDaLY0Qq1YK1KRYYghXDntxBW1C97Yy+Qsnhh5I8n7iC?=
 =?us-ascii?Q?6um7iPT9NUMyV6WRYiDHw4Lo8qdXu2Azi2hM44/AJxUzMAWQbQKAhGq1sCSA?=
 =?us-ascii?Q?QUTuYAJtjjz4ZNk0LwYlZf21FJwiQNMmIkfJ2LuKrj+LROH4OjIX5IX4CsKO?=
 =?us-ascii?Q?szP0XAkX4MeCH3xZYODggNErjX21MQnvvJWIjI9E6ly3Pg+mHg5Umwfa49xN?=
 =?us-ascii?Q?ZocXe0eFoCk8Y0VpW4Re29frcl72J6y337m0YEpVRVupVo1G8bGtZRHJZWAJ?=
 =?us-ascii?Q?9I+PLZ82rRfTiQn5pEgpzTmM32W4KnBSCJPpB+RRwwE549jGbMyOshHs2I6z?=
 =?us-ascii?Q?iFYpo69y11oe7qpxd9eND/NrYU7SB7GGUiOK6k0l4+8Te7X6nuohIEpFvYFE?=
 =?us-ascii?Q?Ax2sZobz4nKSGfJEgUSHOJoKCrywJGbEdVYkm73dFXYlRauvuObCr4nJZiQw?=
 =?us-ascii?Q?5bU2Fy/FedJpPmxewoYXPYSqjYzM1i3iD0CmogKxggnks9hPl0bZjmXwRPtA?=
 =?us-ascii?Q?7J8Cumf5RGSBIvH1DM4PEjL0IKCJWbdXvfN5hB0Y1pwrD0l3GEXhX4HmqtAh?=
 =?us-ascii?Q?V3na6isU33GwZ2DNQOwG4yLdX0upNLIZUPi4oSwsNEIyJzxichMtu/0Mm/kf?=
 =?us-ascii?Q?KWpVEUpHmYMc/xU3bnuGZtVt0NIZo7LgckLOku9rZIEWEmsA1xQ6aZpR9PrK?=
 =?us-ascii?Q?7XSLPMJHKbHx8DVS2unCIMevwXw/M2FHv21TGK49+A5FCsESqtxjDbh1uGvV?=
 =?us-ascii?Q?w/dXGEmUk6GeoyxMwKLdtRecKw8iRkSBs9EW13JMKuvkqCXqcTgpcerj8GFN?=
 =?us-ascii?Q?g5nfvlStsuswoQb3bz0Dvets3S4QDn5vDEGUsPBgzMyd/9K0JA4voGlZKwA7?=
 =?us-ascii?Q?eim76MUWuFbuwxoMZ678sjU/kOvzpDd02SqbExNpmpE9rFfdQB5B9QpJOegg?=
 =?us-ascii?Q?wCjxJ6K8/4HPbzk8of5G7JMy4qc/j4vcZ3HjvtU0UNn7WKSi7hSGuQTzkHYG?=
 =?us-ascii?Q?4ObmX7rotY29UJ8ebPbM8h6vVWidwlRt67Owcedq8czq0serK9tecxfIBBGa?=
 =?us-ascii?Q?IaPvB0aycGEsywpJm33mI6hFgT+d73AVQm9JiZFXT23N6FaxDxJDFKSQpjpt?=
 =?us-ascii?Q?L7CTPerEhyMzE5r4T9OwDIqkY9AvfAdVQhutRSPWBLbK2ZzkgRuew4QFSZPx?=
 =?us-ascii?Q?l1nXMMz3zLhjyDvsDsSbcNh4vynHlt8YCclniTJCoBz/VkZ/DRQw01sEOUtn?=
 =?us-ascii?Q?f0FA6pSeKRf7QT/OuLv/PAspxY28mE7s5vKuliv7CZqZX/RyYr7UM2618xaO?=
 =?us-ascii?Q?kms4F49ZEb36FEmePUEKC6BYASnStB/KRV7+MJ68IjPpcyEdqCkX9DsAWQjC?=
 =?us-ascii?Q?FFHkggXKfhQdPNX7gz8YP5+2GDKsLpPabjxU4DhXUZ05+bPenTA4ozjNMpvs?=
 =?us-ascii?Q?rO8F1Ue4wdYLWBR8DOzEBY+RZ+jSjwveZoUIqpouhsoI/7H9WKMplaRl/vge?=
 =?us-ascii?Q?7euOPVGopuEYBDXDCUBAf3eAFSupu6qO6yRFEIUyTQ3bsdLKup8a8/P3I7i3?=
 =?us-ascii?Q?DzErRGBXYjC6hroUwwwBJmARXtIoR1Bn4FfN1GvA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d768044-573e-4e16-4295-08db40f0cef1
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:01.2197
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1UmE3jrkFKhbNLr+EnP5Oebi5nxl8HqYpY54/AXJpGIiN242ykJG0z9eq9hSHWGR
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

Have release fully clean up the iommu related parts of the struct device,
no matter what state they are in.

POWER creates iommu_groups without drivers attached, and the next patch
removes the open-coding of this same cleanup from POWER.

Split the logic so that the three things owned by the iommu core are
always cleaned up:
 - Any attached iommu_group
 - Any allocated dev->iommu, eg for fwsepc
 - Any attached driver via a struct group_device

This fixes a bug where a fwspec created without an iommu_group being
probed would not be freed.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index dbaf3ed9012c45..a82516c8ea87ad 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -569,7 +569,6 @@ static void __iommu_group_remove_device(struct device *dev)
 			dev->iommu_group = NULL;
 		goto out;
 	}
-	WARN(true, "Corrupted iommu_group device_list");
 out:
 	mutex_unlock(&group->mutex);
 
@@ -581,10 +580,12 @@ static void iommu_release_device(struct device *dev)
 {
 	struct iommu_group *group = dev->iommu_group;
 
-	if (!dev->iommu || !group)
-		return;
+	if (group)
+		__iommu_group_remove_device(dev);
 
-	__iommu_group_remove_device(dev);
+	/* Free any fwspec if no iommu_driver was ever attached */
+	if (dev->iommu)
+		dev_iommu_free(dev);
 }
 
 static int __init iommu_set_def_domain_type(char *str)
-- 
2.40.0

