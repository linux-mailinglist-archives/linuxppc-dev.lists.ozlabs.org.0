Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C050785E06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:03:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BQUfWDZx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCG86c0vz3dgM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:03:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BQUfWDZx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwq33M3z3c9h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AJol+rIJQeGZKdKBPOYvAcan5WmyWhSk5eOAD60TNJcM67nYXwDP5gftOa08uOF4up7DUdTWH5ooXHFvitHzgtxXPC402QlQe95c6MiB9ZKESujxgqPN86WB0Z4LX9T3DCts2EX3teVAa9VWI3yPfCxwdXWYceF1zLq9pIAVN833HllpKp6CE0zHN2ujI1G5pUBCXu6SYjCc8T0Bei1XNdETmLEtFfIoDH5WGw0BuPrs5V221IMtYvvI0LK0blYN/8JJhWuJNNDM69A5uvail4TqzQAgSvGB+AW4fLNr3TtnYg3s51VHZHrS5MdLROKdBZtgpaQsfY7zTD3tCUTtPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6TwDiWXXvGQGGxHhKF/TFRK9HB8cy+wK6EJFCKtVVIY=;
 b=dFXb/feOVTI8C3+E0IlHX/aTHygIBDWyEEVPpC9Nj8Cxf1YZjVe4maOsp/qPVGB8q/Ceq4yC+wXPXjXMgRljlsVKC6ia0xoCAllI7BzvAQXDhxuK2w+BhjzXteDl2cZ1+U/CJ4C8iz3ep6ejCC3ArYnU2oqrmWglmKqVb7VUo5ZmqF/H1jTwAq+t97Sgc0XFqShW1mc9kherLxoae9JN8OHjhpLVvFXZnIJcZHghypqstIhGe5/JlbXqmFN0+qRjt6IGNEjij39OHv1+kf430hxlJBtZjdgM0pPa4gWoAhTZPgb0PAVvwDUIqmzzK4izZ+xB1qQY0o5k3FlGPTb8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TwDiWXXvGQGGxHhKF/TFRK9HB8cy+wK6EJFCKtVVIY=;
 b=BQUfWDZx8feE/8eRmFgmTl76oEriVtvmEI0TLO33O9zPFdWOOxkKXQu9UHoJgmQa81r35h3pPx9mVkm23ujwDKMRRrR2nNeLKjIj4LnRMsRkZg0ENu5xwcgXeO7ExeU851YFdyvCu+W0lCxY7kEaeA05s6LHtpCC2d82I00cDJ/z+HNXnvzvg7qeqk/8O78At5MGPxiOgPPq/h+B53QJKs9iyeUF030Nrc0UOlbeoOqw91UIwF35mJkIHL7bwixbpzUbDyj3l0j0kFvnf2HefekDydErUc40RbYqPobXn0edLZBQ60wus0FsEzbnH3MilXJPyMSP38o5aC5oJfap9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:56 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:56 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH v7 12/24] iommu/tegra-smmu: Support DMA domains in tegra
Date: Wed, 23 Aug 2023 13:47:26 -0300
Message-ID: <12-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0352.namprd03.prod.outlook.com
 (2603:10b6:610:11a::21) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: ad215c65-3840-4387-0a5a-08dba3f8acf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dX6q/JfWU62h5+QWsXCVGhx01rHULEf+WMCmnaEbnidHx6W3RaiQ8gHsGwo/5rndSUEhHjQPRsFPVILfhCHR9JQN/7TpKXJrU7SgbQRlkCAQ4P26SqRg1FxGE5GOz8PxYued+GGY8d0ViogKpSZvJOn7Xzu5HP3azYlQi0SMUtU7EHqqrSiR8guhXbRmh+/6OwoibWKes6x5tR86RR242jznYrD0wDUXH109Sr6HjeMQ/VL5Dod0IebIJMZWevEb0mHj31f4RAkR0P7esfghx+dz/9YLAzbSyEgda8woalXgBaqyBWGxmKX4xBub5XAum9EEEvGpvPHCDkxT4GQYgF7HdLL+5eqdyC1YMM3frc00+suDzfmExg2gqlIMZOantJ00ltNlVy8VPG7om8I2qpMaRv8RoMZHI6aoCnr9GRn/x2OuQJkPyubU0f07MwTkoP5IHY4PPYm5VczvEOR7LkWi/m0A+5FwBy3bv/Wawh+jvx5pPqAI+n/L841SaC4sRVRC6zCwdrkmhzl6A+UWgy7XVvXYKEjsBfK21PAW7ykUJKb//mWqusmsimk6Sowsl+Hoz0MEKNzFtXAPpwf88RnzwWKUkIMN/mJt2Wj75pc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?B5eyCVvPuOz1gnHKByc1+4yywowZeKwW6WMG/iLGswTZw8bAoMx4BXk2jC3V?=
 =?us-ascii?Q?vzPWu/9vPbbsPpR3VRCzvHkSjY0wF58y932q+BSKhlkeBLPvVxpfi7EZS74N?=
 =?us-ascii?Q?qIeeFSKJvrB/IAKy+cXthV8qac9iFdvXRe0y9z7GHzksbHrzQ+qJtfRVDifE?=
 =?us-ascii?Q?ZKjZClratEi295qewq2LN84MCEaBAmaafa+rOrTEM547US4ApCSTcQdjmPnw?=
 =?us-ascii?Q?oz25bF/E5/f03NTajFQJVgTafUy1b1Ts6dI9HXrB4mTFLtemG+FqEbHiABRa?=
 =?us-ascii?Q?Oc5P/kiL8mesFqxibiOVBkhnTWTW14E0duI/KtGNVaJ7mourwZ68vRf1lh39?=
 =?us-ascii?Q?b8ZwFl8VjvSKVcRtZDHKyYIP7gAjtpmMtoHMra6zfG3/UOYXSDnIT8Z+Pl55?=
 =?us-ascii?Q?KcnwmJsQ6qPadjtwt70WOWdN6BwYh7jdGPKdB1yWdxwcgkTg8yEXA7CRp7bw?=
 =?us-ascii?Q?tTf4zenUrdNySo/JZjr0wvPAnJQynvtfof6ZR2JT7JhZapmY+yN30Pdt+CHz?=
 =?us-ascii?Q?Z6f4HZ0XGxgksI+PdCWPBMOV+veVwq6fahHwNKu/aJ1x5PrVoXbPUQDUw9In?=
 =?us-ascii?Q?GPGIxgI1v4xjaTNPft9tb7l7y6kjmqqpYHTmqPKlI9lyZ5i389no92NzVvRO?=
 =?us-ascii?Q?R99xSze/TowUxCkB6tSCBbzUHVxxptZJlzJsAo4jSfUOSp9dnQElpZsVEMBn?=
 =?us-ascii?Q?V7GJiCSTZxwW62hc/M3uufZjrgp170VFSGt7FmdLQMOKomOUo+7aLvUvfm3W?=
 =?us-ascii?Q?EhWbr9Yvb+bKtBSzfqpSfP+ikqRmYBXoXrijKGGSl6X8mpSqSexFTG01o3Tk?=
 =?us-ascii?Q?uv+gPbcP+IDhpTk0CNLZZhysU1qULxwMQz3LGlrqQQm7iBHpgkntVxKufe4W?=
 =?us-ascii?Q?61TgcEOEnfqSHgHFC52x1APF7nm+VLRbMVPL3exNk+50UXw2mOr3KsdGDmMj?=
 =?us-ascii?Q?IX4NzbhG4JI4e4VNLMIN/1G1WpN7ljGdwnHUFUSw0ZRXOW1ioJMc/rpBAq8a?=
 =?us-ascii?Q?yCNqqxMJY9fWkMpf8Q1O/o9ye/9NYVIUEzhsDjUJNUEvuox1IsWyx3bHj8wE?=
 =?us-ascii?Q?KHncSoAuhrX7/aQh7zZE/pWtjk+dmSOFr5AL3HeKL79ppH4w67FVRZBCuj3q?=
 =?us-ascii?Q?E6Azt7kmmzTiJmtBDcNAYS4F/FeQ3HddJgi/aoZa4k7AzYYG0a7W5FaWwN8B?=
 =?us-ascii?Q?2Th5ecwWRoMrEqxBuYOG6NW3ReYjG79E5Jv/Bb7TuuTmZm0YZC43elWjrijG?=
 =?us-ascii?Q?oX3Myd8Do3NY+cgy21BlDz1eeyYhswgbnWgkdnLkvKfYdNGDP1iz/u4Tqqg9?=
 =?us-ascii?Q?8wwKAJ/YceCVzKIO/meZAn02gyG92tme7s+BxlF6rafkJzt2mlk1JJCU2JZ8?=
 =?us-ascii?Q?HAh7UiX3fkZ+aTNMeQ/bFQk92O1meLeqYzfmhVxFStAOjmVmcoUIFY2E6313?=
 =?us-ascii?Q?gnR9cv49MUXIJM+7n5CT/Di54bU6Q0D8nBExWhu3yHGpnbNW5+sgHALLOOg/?=
 =?us-ascii?Q?G9sslhZPvOoRxOIctw8qnqh2OMe9mSrGqtSJPxB/87HBwd8Ql7rdD4/YmoVF?=
 =?us-ascii?Q?vJVFvh9ncP97WQe6gdTfWUY7Cd1l8/+N9DNa/xaQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad215c65-3840-4387-0a5a-08dba3f8acf2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:45.4881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tXY1tT6CzZkjgPdpTQlji1WtE1+kqNOU6uzQVt6kqckCxkEcj0YhcN5GJG+qKKir
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6346
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 80481e1ba561b8..b91ad1b5a20d36 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
-- 
2.41.0

