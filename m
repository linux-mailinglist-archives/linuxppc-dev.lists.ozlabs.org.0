Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB51707916
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 06:26:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMH3V0Tsjz3fG6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 14:26:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T9dbxYfi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::626; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=nicolinc@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=T9dbxYfi;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20626.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::626])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM8Y90m8Xz3c6H
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 09:32:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2J+oE80v+B1Kweq6z+STuijyPtEkRwz8pWoXjK5/lQ4oTOz3mj7kQzuMqaizG9F3CDXxn1SPDZ12GUVIrss5lQvnO8AOsROrJUHU08jWds/Xwy2ni4vQ6NT3akOEHyDNXrU0AQf7GG7/ndMSDYssSOJNoOJW7BNYvWmlow4ZTg+0Z1R81JLQTzISBekPtY7ntcWV4mBmsXlEhhFfteRdZHsEOze+edxxSXD+de+gaZsjOsIXvAO6wJx60ga8lV5hSOXUMsHx0ZRZtxb0cbb5t0uynFY9iRHWxsQFsEsfk5XV5EcivwgSrhAade6XQ/BagWzw4JeIkEsqBhvyzz5og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU7+OS0futKjoBt58LQ+nXP395IRweXRjQi4kW6PQLU=;
 b=Oeo0w4/5iIve7I8iVusfV7B8W3I/Fz6Wxu2h+/W+gJKHNDn5maJ1ZKO016jx3O6IIRHXD4iEAEXDy+N3X3RJw5NDwwpb+S9cIgbKHcAafK0ONde0BZSBLcYpJvbwFpi4010MX9ajBY89qOqYnJMMHu5USl52el4hupiiJNKxyqnfTg8ptZvVkZHk+yTXIMGrvN7eQmUokftc15sZCRDH+bpPurGs1h3H7L43+Xrx5bh4uxSrLpW6Wx3ctNAc5Hx1SOQvtYS+chdssRAE2v0q1N55PQVj4Ay5uC5Nphu8dOe9Zn4ysQpWiHtzSLlqilkyffZxycabLwasEIhuoZaLAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU7+OS0futKjoBt58LQ+nXP395IRweXRjQi4kW6PQLU=;
 b=T9dbxYfi0ePh8X7jY4DWSOh/1wX2Pd3qEz/X3enlbBpLhGYWh+9H9J8rgPwD7yquiJvDAeDLOhOt3pCQFi00U3NOIDUA+dUAlN02tFWC75pOM12ItgpPcDBhHd9ZpcYDl38kmQI1OsTb5REddcPhFx6Xh+wL59OQnHdxP1vmaSbLPy5tbCWpGE5+RUrMnr52BGOg0U50+SzNGm6CizbLS/swXInbWEdZZzWGEbUBf/F2IQJ9XEVzzQSnFTnxUKykC1E4AswHHdnhtQbiN/JngfDwbkNa4gGol5cIZ3UJUOhjcCjjt/pyJm2XsU9g6JPUnJJWxkFTHhHsR7JY/otAnw==
Received: from MW4PR04CA0257.namprd04.prod.outlook.com (2603:10b6:303:88::22)
 by SA0PR12MB4542.namprd12.prod.outlook.com (2603:10b6:806:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Wed, 17 May
 2023 23:32:39 +0000
Received: from CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::3c) by MW4PR04CA0257.outlook.office365.com
 (2603:10b6:303:88::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18 via Frontend
 Transport; Wed, 17 May 2023 23:32:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT087.mail.protection.outlook.com (10.13.174.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.19 via Frontend Transport; Wed, 17 May 2023 23:32:38 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 17 May 2023
 16:32:32 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 17 May 2023 16:32:32 -0700
Received: from Asurada-Nvidia (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37 via Frontend
 Transport; Wed, 17 May 2023 16:32:29 -0700
Date: Wed, 17 May 2023 16:32:28 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 00/25] iommu: Make default_domain's mandatory
Message-ID: <ZGVkDB+MCrx3tQho@Asurada-Nvidia>
References: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT087:EE_|SA0PR12MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 192db192-fae9-42d6-3f47-08db572f0083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xp1ANaCQqDkvQxMkDGNeVnZgg2QHq7mlxtx6A8BUGbMjgoK/P5t4maMzuKixtU7LOp1Uo51Vq1YlcBrFPWS0rnzkEwCuhDzcZeOuHx/19o9krkOp0BlyU+ELCWMUAa2hwCDlxWgHCeqWhgEmE/6HiMNQ3HaErUKoXy1VV+dz5h9TrvywnLzRpJS4c5bx3ly6mA5NODX6vzM91weyCKzGWGqSEKxblrcKPQn6ug8piZ8Bp71af5OIFJd4wIwY6r5tgQhZ/OWx3z6/vImdPUa7OL33h6NUI3X+UUCl3lwWLMfbYcf48h2em+LTnt8k2b/xfZfdLOwqtyB+/vcWiH0tUgSU3UCZFbEQlnWMm2dGI2NsnvZSke9uazUM3qy3KR6LdIVfXbnjrx9xpCEzwl9H0xvpZT7axGCMoG/RBVT/rjx0IO6nfxRmzCFQIRXTm245v+wimriyw7R8Z691v8EpdPwTZ+JsqDOSIdYsWIxL6jK14OaX+JShd8mKAe5d5V918vZ2AcBEpzMLOWu0zl+eOMkD6ihhybqSDfKBlYw5BFA+BxtQo0mXWF+7TCnGhGrvi/rGWPHYrKmd3RPzf0jRIRe1ckw48EBLqTTkA0QPyisnVLFgu2A+82FWUp2LDoyPUY1LjMGD65nnIxPjWZdUVjbHzaY9rvlgmAIWNrawbvWntCrWkGwAGa9aU59g/9Iwyk6RYfuMygImtPEcSX7+iCzGDeF7hBh5dMDabpdtET0nSRboAE8Ym/yNorJPawsljffBQTVY97BVKPn21CS5etWQxehgcoxSHpfuCz7vii6g6rpIQ9uyBl4A9UO5PmM9
X-Forefront-Antispam-Report: 	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(136003)(376002)(451199021)(36840700001)(40470700004)(46966006)(36860700001)(82740400003)(7636003)(356005)(40460700003)(41300700001)(7416002)(7406005)(2906002)(6862004)(8676002)(5660300002)(33716001)(6636002)(8936002)(55016003)(86362001)(316002)(4326008)(70206006)(70586007)(40480700001)(82310400005)(83380400001)(966005)(336012)(186003)(47076005)(107886003)(426003)(9686003)(26005)(478600001)(54906003)(67856001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 23:32:38.5800
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 192db192-fae9-42d6-3f47-08db572f0083
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 	CO1NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4542
X-Mailman-Approved-At: Thu, 18 May 2023 14:25:32 +1000
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan
 Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas
 Schnelle <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 15, 2023 at 09:00:33PM -0300, Jason Gunthorpe wrote:
 
> This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

Ran some VFIO-passthrough sanity on x86 and ARM64, using this
branch. It should cover partially this series. So, if I may:

Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks
Nic

> v2:
>  - FSL is an IDENTITY domain
>  - Delete terga-gart instead of trying to carry it
>  - Use the policy determination from iommu_get_default_domain_type() to
>    drive the arm_iommu mode
>  - Reorganize and introduce new patches to do the above:
>     * Split the ops->identity_domain to an independent earlier patch
>     * Remove the UNMANAGED return from def_domain_type in mtk_v1 earlier
>       so the new iommu_get_default_domain_type() can work
>     * Make the driver's def_domain_type have higher policy priority than
>       untrusted
>     * Merge the set_platfom_dma_ops hunk from mtk_v1 along with rockchip
>       into the patch that forced IDENTITY on ARM32
>  - Revise sun50i to be cleaner and have a non-NULL internal domain
>  - Reword logging in exynos
>  - Remove the gdev from the group alloc path, instead add a new
>    function __iommu_group_domain_alloc() that takes in the group
>    and uses the first device. Split this to its own patch
>  - New patch to make iommufd's mock selftest into a real driver
>  - New patch to fix power's partial iommu driver
