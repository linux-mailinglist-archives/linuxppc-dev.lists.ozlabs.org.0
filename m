Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12659705C02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 02:37:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLZ226w17z3f7s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 10:37:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DWJ+BoUs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::611; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DWJ+BoUs;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLZ0F4GF5z2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 10:35:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJU1NhCAIu2sgISBD6HK0t0N73XQMIBmBHLzsNkXKik6T22NTG6QG07g+XTrieGD9eFIHO5BoRyqIoLDRPSx9E9SPQP/H9P3NYcXc/YA9zYzd/mpK7VIS66kxKBtieTuJnDqHBACLJE7dCsz0dU8MaPa4OTmjCZ5XUrqSY+L63BX0aDh7+rQUBhWiJsMqQZJEptTinYYu7bxjM6qGonG0DHyDH8MxkRHZWOjdNkt6x7HHsgwNIdHXwRwLZ+8nnAcBXJ78WIN2yxPCSujhOqhaqv1M3I3/x1G9Ha4Yg13oyl2Bee6lnuvHBNeRXZyWO/PdXISmjCSth1uddHvXEzADA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5Kp1uktbk5uhd4+iDJPSOnkwVSi12TPgD9kQ78ob38=;
 b=CgG52YB2EbKcadLd0eTbNUE/kQOb4E7I8EsMpVxttM4XdH8wBNHvVmqZGL8xXb85/2sl+xtIt8UlA4jnUuXauP72d08av/YWjJ4Us3hsqx9tF5MUhfkFZdaOe7mHo7FLy1mJE8EadlbpqPozy3e3l80S0ytRpyY7WjyGpN4SW8et0KtGsXscsHpO0l4y+LqNSpNVDvpeHBUHRLSXSw5UHo9QxtOW6VKwO/iiyWKypnIH4hexS6rvl0w5deIUev8Zwd8s3tQ26AgooVF6U4IxKSIF3kYAyRrLwjrLcCIe7kbZg1vzEAVI23b+b6f7OY7r9MIK8G/ebPcxDg4o72b+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5Kp1uktbk5uhd4+iDJPSOnkwVSi12TPgD9kQ78ob38=;
 b=DWJ+BoUsGwtGtKujfTy3k22qdhukCoGMVBdBoZYIUjEcyUiYWwkJRUPoZoFh2ZYheR0d4kVEsHqxw1mZQeoaJmC9laU/NlHsm4tg0lciRU8o3sH546d8Mj7ESSJalNc9ln4kKoB1M7PRQ/BX15zo4q36eBMHPjfFSI5NIXxgP2casWx8EnT4heZW3EzqgKJtbNZWv6qvloYtNMhl7oNyF6kc9D28+CA04Cz8tWDer7Ly3kEYoJx4SPoT8xbRbfYtvmH3jHc1jAwxzOS2tdjRHpj/TFFbAZ56+iq9bu5nx7G7ed07LWiQdlyxcI7wRydbW1r9gF/wOlaPpiNut0Fqag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 00:35:30 +0000
Received: from MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2]) by MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2%7]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 00:35:30 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 1/3] iommu/fsl: Always allocate a group for non-pci devices
Date: Tue, 16 May 2023 21:35:26 -0300
Message-Id: <1-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
In-Reply-To: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::17) To MN0PR12MB5859.namprd12.prod.outlook.com
 (2603:10b6:208:37a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5859:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 3992a9b1-a62c-487b-24c0-08db566e9db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ujcEfo/9PxwxMh43eOIDVYsRkYmbHnf6Mj1osNXb7xFSkuyvwLlKtFtnnjuIF3ufRsvSMl/j4OmBCBhHYOMlv2ECw0oK7oUntFx/gdpY6T7ToU5byo+SE+co7FR7mEhhyiam7S2BIaRFa5oarrt9s5giV7oPTRjVnYFvn06vUbgbLp1zGSkSbeg7ICUt48JsI40r/RieZk2owLMGipKwhVyxkzmCHDpHeg2lWe4EnJZjrtffD6sboqxNFCgLAKDg1530eoQsATNYuJ/sCo99besbXkynoj45D3pzP/xA/07U21+EE0hfVDl+oEGZdj1x3tc7cmW9FsFxXOnZiVEmtXB2SDaWLOjdpFWs98nq0XhW3H1uanLqNqtcSq+qLfvOCK+TL9dcLulPQ9kbityLl3IEtiKXsb+3yVzyaZ+rfceRlBBTLvxABStigntoij7ubMBmuB4hiTcoWWHk4l69SQNPaL9H/fiOsDlw59HK6KX7qN60DD+K2NxZcr77Y8p0AOPi8Ai2RalAXhB3vYpLb0JsnFkXgufF9tqWTR6/407mM0aluiBqfXs31T7y1RfLaq6ECGX93J49gVCUliSm4sbSlftrIABbxPxoT45oLrQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5859.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(6486002)(2616005)(36756003)(83380400001)(6512007)(38100700002)(26005)(6506007)(186003)(86362001)(110136005)(4744005)(2906002)(41300700001)(8676002)(5660300002)(316002)(8936002)(4326008)(66556008)(66476007)(66946007)(478600001)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?iJ6HtaUsHEpAZ0YygApZwssUnj+bbslDH3mXE8hSsXiqx4QKMxJNqnUjSH14?=
 =?us-ascii?Q?c5EG4e/YVHkcDSbW/EFL/N3bYXMdgAANuylG4UTatphP3hWTcdmB9Uv4sQ0T?=
 =?us-ascii?Q?lUkCBmxVvQ0jQzKxxr+HE/FSugsvz+YJ/n9EwKyT6QMua264pQz4wh8HyE0f?=
 =?us-ascii?Q?BBaWgtdITD1OX9mCFhsZ8hwSlwRQAHyRuPMVs50yK+55svWLRjFjBzQtlOnB?=
 =?us-ascii?Q?F2CJ0misR+dW1ctuAJvm6hzTvOnLP3j5rqQk9/cZCJYlxzt/j/pPVJkp4Hvo?=
 =?us-ascii?Q?ufoar5/rWQ48qK2F/Y27qvnBiez2Nobfc0GuQEWTi90AH/p4l/9pGAWh8ssO?=
 =?us-ascii?Q?nf5yMgOpRKnPbenbA2ZcGYjxvX4qSX1RiwPsAiCwU3MLoYZRNazTTIVMpX4c?=
 =?us-ascii?Q?MyHmmzU30E7OZabjme27JELR+V05a90P2pQc68OhZHaFGl/B6KraGCsQ0Gst?=
 =?us-ascii?Q?gltr6rNA1DD4KCN14HHSwAy5ci9JFJUK/8LjPD3fY1pFVubv+Dhres4qTGPw?=
 =?us-ascii?Q?4OLT+qYxaGvCC9CeEnFe+gfplmN0hq/a/3nBorwPIv+89a6VIG9YHbBe2w8Q?=
 =?us-ascii?Q?q1MeGqHhN1w0YKzRgXNW8WqMk3skZDqDrJ81uboEbBbCBX+TvsAeX4fLdn8t?=
 =?us-ascii?Q?a1YSS1SyZSyE9FurtreSgxv3pK/l28Nf2SPodKLGxO7XWEHLVNGHdeDDz5Iq?=
 =?us-ascii?Q?AyCO5hY03SKnokByhX1deBIdBEjm/s7XK9xWkwA23ME+PYOUrVnKfTs2elro?=
 =?us-ascii?Q?52PB+/E3RjQPBcB3H7e+lcyv1gZf6nbDDS+/8EecNSFXDf7A4QCTZhsMQUk/?=
 =?us-ascii?Q?j3YLnAbJ9ElO8bAZQqIo4sFBcfHtAntYj5BON/7pRr8omTyU2lhjEzs507x2?=
 =?us-ascii?Q?QCV6dXHjoFiMK8gifZ733kz9adEWXmyJHgh16gO0Mxz70mAksFaDfhC/DiNP?=
 =?us-ascii?Q?iFTidW/tEeOGJScYehkqZ7XTgWovmlEsYL0iypCcNMHgUW3d2u0fy4AzGp3L?=
 =?us-ascii?Q?tShD1VNPDk/1Vn46V+4M2VxNAzszW2BsMvYWTRebGnrsKaoI5fiOK3mJW1GQ?=
 =?us-ascii?Q?EhSKMAGaYv+MCJI8v7JUE0N9+u7Jncs7419aoahPCCOhObqc3AZ4GVz+XBfA?=
 =?us-ascii?Q?O/xk0jTtwzgvvaQNyBVl+JdyG9IfrtGQ6YBVc9e8T6sMHCeCtm/h7ku/avet?=
 =?us-ascii?Q?15RB1reiqRZppqZ3VgDOkWmQYYUJnM9qqMDfuHeKGkkE163ww7F+lYUOykJ7?=
 =?us-ascii?Q?Zb8+dg4bNVsb8wvL0zzG7/PiA2f6IgnVUufoej9skJi5iFkfHlWS9BzKq4hz?=
 =?us-ascii?Q?bgt/bOj1XKN89FDPRJSd7yu3ppbt2PDNr4RhHXfOUPYl6Rg0vL6PsEg0BlV1?=
 =?us-ascii?Q?ZyW24R1FpWa4Uzzo/oVodSmdez6Lfp+rIz97+SbRqd4Hau0RW3UnM7uN9qyN?=
 =?us-ascii?Q?Yecg2dmmv+yqNmHGipHIRdsH2uTbRzczhHCVMwSTtfWuIA7H4RRnf1fw2qZG?=
 =?us-ascii?Q?yFUKOwgKproBkK2dbXWUUoLrvLHkGMNlhxYFonhtUf/4x2R/w6MQUP5ighKY?=
 =?us-ascii?Q?TjAj6zN9R0h1Mie8yeVjmfLx/s/JJnZrq/NTbhn4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3992a9b1-a62c-487b-24c0-08db566e9db8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5859.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 00:35:29.7526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DNUyNRQVqR9s4DxaHPNADv9tz1SXNhAn94qp9e5Z+Bkw5UNLXb44s2D/Qoi49gIG
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

fsl_pamu_device_group() is only called if dev->iommu_group is NULL, so
iommu_group_get() always returns NULL. Remove this test and just allocate
a group. Call generic_device_group() for this like the other drivers.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index bce37229709965..cd0c60b402154f 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -437,7 +437,7 @@ static struct iommu_group *fsl_pamu_device_group(struct device *dev)
 	if (dev_is_pci(dev))
 		group = get_pci_device_group(to_pci_dev(dev));
 	else if (of_get_property(dev->of_node, "fsl,liodn", &len))
-		group = get_device_iommu_group(dev);
+		return generic_device_group(dev);
 
 	return group;
 }
-- 
2.40.1

