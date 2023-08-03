Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0C76DC96
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EJjVJY3g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGV3y62lrz3cHc
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EJjVJY3g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::610; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThs4NYLz3c3t
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvMRUfUbggQKJcW6PBooGVIkeuyDOrKvK+YyNOT1iJA4JybBysB6Od5nTpKnLG/IllfEo0XeIv32HchCUryTXeZtO/9fdLqocnRzqrmqXGaTDrD+6akyextn8k+eXAddwWBVI+rDe7JPlR6JfC+umCFqsYRGxchap6t72hHFx6HkJLQ0XVZz9I34GZoSemzrr2Jkal/KtOBawvTGPCs4CIQklf5tBt6/pDAOL7ivgA1gRUKChjKy9QLmT3QMaEt9MxP/Nl6NT63eA0ZErPJObKCCD43wBvsNqqIRPTBRShjxJG85qSKD9W2D5x1k2pX5gRC4v7/udAqeme61LX9jNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twyESqCJPmPzDir8WHxA4GBbyWiFxyphZLU3/s0Xay8=;
 b=J0W2SJK3EOEqrIy9TYgzG4B63gPXPmhpx3n5fVIyoHgrv8Kpt6cSMiltYrYrh2iR5FVD7qxbTwzdYpaivivyTmzP3/IcxdJQxX0/VdIsQmnEInHXnQIZCmtvRyj+7F20APclEXiDubag/qGaK/tCCwPNAXmFDYuSpLbq8FfyaiCotRFu/CVB85c3YLqHDMEoyqLyH9QoonM0qjNnNuUpvNthXTktRGMTV9+5OCTpcDZ5cc/LVE6jSMXluZ+0bZiMYFL5Tp5k7ysdc3VsMkAJJ0XZXYzO0RokPiznfFVAoH9FHqkaNcvMAI1R4Ly6G/KnYr8J3IEvbmb7wIykzwgqKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twyESqCJPmPzDir8WHxA4GBbyWiFxyphZLU3/s0Xay8=;
 b=EJjVJY3gx50smufY/xHyFEB5Ue0T0vKN5t9PNMmETMMO4RKHs7rAYSC79aOymfxkPso3SZlqvthVpWqlHWJONUUEuJSMboDl889EyDwVPRzRov33ZQU2htRGugjVKWa44mZVWzUkekbNEth/PFKQv/3+CByrbXPjB1iFvfT1NWQcpt4Qh+9+KWns3BI/4bqhJAycq3EO8fW8/dY2rClEqX5wAHDJ4MGpnEJTB8Gq2LSy/nRYNMtd8jgp18T5pJ03ws7/InKnOwsPfdPpYeHnWin66/dHnhJ2ofUMei7KBMV15xtL2hI1zGyhhLWf2KNtE/pV3PewB8+BLzHHJKOV+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:15 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:15 +0000
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
Subject: [PATCH v6 00/25] iommu: Make default_domain's mandatory
Date: Wed,  2 Aug 2023 21:07:47 -0300
Message-ID: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0053.namprd16.prod.outlook.com
 (2603:10b6:208:234::22) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f60081b-cb54-4ce8-b975-08db93b5bacf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	t04Oo4MLT6xwY6l4K6h4Y9+bRm+gsNjLPtkjkI3f90xe3MRu3Roo0f3jud+2gMb60CbzCnQu3Emd1FarhyysSETeTG3sJJo5KBM5yKw2WpktoNSIcRmudpKeVNNmWuffn3x4QkoktdHsRC40emQY4DJeVjRAASHd+Zq9tYl/ZPqNBKNJBo6QBOlJDDH/pwL3dWTMA2/1Bs6ng1PMS2pRlPUzqNaVrqBhgbOD9qRESoju+uNV3uVMzccvD2uLcxCl2UdN1jHJ80LC/hNQHfgfWCkuW11KW0QNS1gPBOCaNkd1nO4KEc9rl6deGJ1BiI2UzZ4cqkEdiQ8Kr2OyGLu2c2o4ALTv20AeHz5GjpwZRnp2te2Oxrssmq7PGI00SS8z9W8uMQeiOrqS0bnbjlEJ1Tecz9XYxzSwmBsgxdFIIDjfjQr75QO1A8jXaHF4cEP8qPuliaya2oxZbjURHMNBiZkYu1VtTjfldfB0thwe5KQpEbrZMdCXY7M/6kxapCdOuduM3E+QOcrMIBluN8NakwQzsYm8DOqPDqJ2Rd/mCr+GEuNtoo2IDiDfeBuqEjLZKvkuYt98Dtk+O7Eb+9sKuBnfz2Sm4Y2S8C8Tobxd49bvikqvkEwrKZgS3y9V0GMWTK8tSa062XNVOSrrI4pjZVvjimb74fvhERv+uUPjAQdTxUsYk0BlcgZJoRnvm+YL+W6zu8tEeEgZZs82fNRGsg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(966005)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?g/a3885N8n5Exkhp4gJz+uF7crvazheZVlZQEtXOV1vJAY5tmIHJF8oBDQEp?=
 =?us-ascii?Q?gfhEY4kwBDPAw8iuxfzbq+td9bDKnSYEbHed/gE8JFP/0wKaSKYyZUeea63p?=
 =?us-ascii?Q?pA1TWRLisiHmxMv1eXY6aVqvNN6S7QhAgSrl3zK8LTLPtHX9BiApFV/q+Y6g?=
 =?us-ascii?Q?2awJYavRWqWop/cQxe8VSikWwClYYnnY5EoF7DXZqsDuEVPPx+1u9vahbqKK?=
 =?us-ascii?Q?Q/I7RYyh+27k3tRR1lEWfjuO9t9jctVPNlosCT51Y5ZqGnKztMtrVcQ6nQRx?=
 =?us-ascii?Q?YugEdJA3TQ6pmXlguaoY0PS87D5hs3l0ERaP3W0rjTt8hGCOV/uBi5aBDhW/?=
 =?us-ascii?Q?CKM2uo657LsVFtoLdF0IxTrk7fQrxnnP6LvkFBdeREMVJ8aSAniUekJmnnAV?=
 =?us-ascii?Q?CKyDAaZ7gXN84rTqcz976gm2Sp1PCL88UXEiVFA+YufMfd7/dQPFaBeYotMb?=
 =?us-ascii?Q?Ct9w+2Op6UN1DxkL6vdEPS1GiDaf2L2JRGjuUcG9a7lDjKWVmq7MfjxQKBPk?=
 =?us-ascii?Q?LiRrU9tLa1H6izM8hjEiOe9Oc9pNc9uV9WFh7353run4HNzHhYPDDhHeX67B?=
 =?us-ascii?Q?99lYjSXAGaVCjE2M1JM/8Ay3b2IrMBMv5DMKXX526ZLLHOnM7kTQbBDOuoiq?=
 =?us-ascii?Q?jpxF+YY+3lKrD+Fk4qDHruaqiLz1ZEpMh70mI1xgZITQLCi0xLPkcritNbnt?=
 =?us-ascii?Q?ZkT92OXCJbEctMBN+t1v0Uxp/ikdkn2mXbQ2h5ba9RQsUzR8dQVnEi0IrD/q?=
 =?us-ascii?Q?sxmilDnUprtT0Q+SCxEPgl7QNpnoXgMivnJ0LGZgzuhCGEPgmhQCKQifq+TU?=
 =?us-ascii?Q?X5J+CDT+nuAqM6u36ROo6+uI9OA0vglU2aLuwRUd2sBJyg5pk7mAWKXY/YzD?=
 =?us-ascii?Q?O8OHrAMYfvCD6dvu8PEwzLelLZOKaJyHDtuprGJjyy/abFELTVGKInByMBRg?=
 =?us-ascii?Q?qXNm9nnDmzB7DU0J2MwW9y5sAGMO4qClizBvIAQQVqAPtqEa2VtHbPPILPcf?=
 =?us-ascii?Q?2MPuio1qZ6jLtbcGAHepRCFRzNhxb3BYO6qlfglf3CesAa914352aUIWCQVj?=
 =?us-ascii?Q?IFPyhTGzVtORDKypZWQ4RpAaDH6965kMbGrd5dM7JBGnTdbgN6eQnUmboFXO?=
 =?us-ascii?Q?LQJe16KyUkUVIIm7qS09dW3DOOOS8k91Y7+F43XPRU16HOwebQ6qRKC+MX67?=
 =?us-ascii?Q?lbDeo16BFddWVMO4iX1OjNGGepy0MptUEp1S9Zv64jdkwKaHV8qwlJn6LS8s?=
 =?us-ascii?Q?zRtG2sKar5WShy4a6q61T10wr/MM9Uyyxlwmm9bYeS8ZoF0Op7b7mzK7YX7y?=
 =?us-ascii?Q?qhgIvx7sp0Jub7IdjmHVOLeGuocjimh2lIiB2YJwAB4dHhWQp1ReMDBPCzXf?=
 =?us-ascii?Q?FgApS3/1vHPRVPwSsUP9latzwdkmuIcgmiG0QhFy3CYCWecEHPjh5bhKZRCe?=
 =?us-ascii?Q?KiRIRB37XBu3NZMr1jRsjC5NqF4iCy6yAj1+j47IEZeyN5ZTo/FaCQbCHhyT?=
 =?us-ascii?Q?CLQ/atZU+gq2iPPbARN3KnX4jH4369xyY9C40W3nphDYfPnU0Zjvo3Bm3xMN?=
 =?us-ascii?Q?grN8KvnsEVHOAN5cFmbmaAPvstjDAZ7GOumCV21E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f60081b-cb54-4ce8-b975-08db93b5bacf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:13.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcjpNNRH6Ur8MaTtlmuQwf6JYdTHsnzd2YpAbBbioB+jupBAaqxQbCwhXK/7HgC6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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

[ It would be good to get this in linux-next, we have some good test
coverage on the ARM side already, thanks! ]

It has been a long time coming, this series completes the default_domain
transition and makes it so that the core IOMMU code will always have a
non-NULL default_domain for every driver on every
platform. set_platform_dma_ops() turned out to be a bad idea, and so
completely remove it.

This is achieved by changing each driver to either:

1 - Convert the existing (or deleted) ops->detach_dev() into an
    op->attach_dev() of an IDENTITY domain.

    This is based on the theory that the ARM32 HW is able to function when
    the iommu is turned off and so the turned off state is an IDENTITY
    translation.

2 - Use a new PLATFORM domain type. This is a hack to accommodate drivers
    that we don't really know WTF they do. S390 is legitimately using this
    to switch to it's platform dma_ops implementation, which is where the
    name comes from.

3 - Do #1 and force the default domain to be IDENTITY, this corrects
    the tegra-smmu case where even an ARM64 system would have a NULL
    default_domain.

Using this we can apply the rules:

a) ARM_DMA_USE_IOMMU mode always uses either the driver's
   ops->default_domain, ops->def_domain_type(), or an IDENTITY domain.
   All ARM32 drivers provide one of these three options.

b) dma-iommu.c mode uses either the driver's ops->default_domain,
   ops->def_domain_type or the usual DMA API policy logic based on the
   command line/etc to pick IDENTITY/DMA domain types

c) All other arch's (PPC/S390) use ops->default_domain always.

See the patch "Require a default_domain for all iommu drivers" for a
per-driver breakdown.

The conversion broadly teaches a bunch of ARM32 drivers that they can do
IDENTITY domains. There is some educated guessing involved that these are
actual IDENTITY domains. If this turns out to be wrong the driver can be
trivially changed to use a BLOCKING domain type instead. Further, the
domain type only matters for drivers using ARM64's dma-iommu.c mode as it
will select IDENTITY based on the command line and expect IDENTITY to
work. For ARM32 and other arch cases it is purely documentation.

Finally, based on all the analysis in this series, we can purge
IOMMU_DOMAIN_UNMANAGED/DMA constants from most of the drivers. This
greatly simplifies understanding the driver contract to the core
code. IOMMU drivers should not be involved in policy for how the DMA API
works, that should be a core core decision.

The main gain from this work is to remove alot of ARM_DMA_USE_IOMMU
specific code and behaviors from drivers. All that remains in iommu
drivers after this series is the calls to arm_iommu_create_mapping().

This is a step toward removing ARM_DMA_USE_IOMMU.

The IDENTITY domains added to the ARM64 supporting drivers can be tested
by booting in ARM64 mode and enabling CONFIG_IOMMU_DEFAULT_PASSTHROUGH. If
the system still boots then most likely the implementation is an IDENTITY
domain. If not we can trivially change it to BLOCKING or at worst PLATFORM
if there is no detail what is going on in the HW.

I think this is pretty safe for the ARM32 drivers as they don't really
change, the code that was in detach_dev continues to be called in the same
places it was called before.

This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

v6:
 - Rebase on v6.5-rc1/Joerg's tree
 - Fix the iommufd self test missing the iommu_device_sysfs_add()
 - Update typo in msm commit message
v5: https://lore.kernel.org/r/0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com
 - Rebase on v6.5-rc1/Joerg's tree
 - Fix Dan's remark about 'gdev uninitialized' in patch 9
v4: https://lore.kernel.org/r/0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com
 - Fix rebasing typo missing ops->alloc_domain_paging check
 - Rebase on latest Joerg tree
v3: https://lore.kernel.org/r/0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com
 - FSL is back to a PLATFORM domain, with some fixing so it attach only
   does something when leaving an UNMANAGED domain like it always was
 - Rebase on Joerg's tree, adjust for "alloc_type" change
 - Change the ARM32 untrusted check to a WARN_ON since no ARM32 system
   can currently set trusted
v2: https://lore.kernel.org/r/0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com
 - FSL is an IDENTITY domain
 - Delete terga-gart instead of trying to carry it
 - Use the policy determination from iommu_get_default_domain_type() to
   drive the arm_iommu mode
 - Reorganize and introduce new patches to do the above:
    * Split the ops->identity_domain to an independent earlier patch
    * Remove the UNMANAGED return from def_domain_type in mtk_v1 earlier
      so the new iommu_get_default_domain_type() can work
    * Make the driver's def_domain_type have higher policy priority than
      untrusted
    * Merge the set_platfom_dma_ops hunk from mtk_v1 along with rockchip
      into the patch that forced IDENTITY on ARM32
 - Revise sun50i to be cleaner and have a non-NULL internal domain
 - Reword logging in exynos
 - Remove the gdev from the group alloc path, instead add a new
   function __iommu_group_domain_alloc() that takes in the group
   and uses the first device. Split this to its own patch
 - New patch to make iommufd's mock selftest into a real driver
 - New patch to fix power's partial iommu driver
v1: https://lore.kernel.org/r/0-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com

Cc: Steven Price <steven.price@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (25):
  iommu: Add iommu_ops->identity_domain
  iommu: Add IOMMU_DOMAIN_PLATFORM
  powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
  iommu: Add IOMMU_DOMAIN_PLATFORM for S390
  iommu/fsl_pamu: Implement a PLATFORM domain
  iommu/tegra-gart: Remove tegra-gart
  iommu/mtk_iommu_v1: Implement an IDENTITY domain
  iommu: Reorganize iommu_get_default_domain_type() to respect
    def_domain_type()
  iommu: Allow an IDENTITY domain as the default_domain in ARM32
  iommu/exynos: Implement an IDENTITY domain
  iommu/tegra-smmu: Implement an IDENTITY domain
  iommu/tegra-smmu: Support DMA domains in tegra
  iommu/omap: Implement an IDENTITY domain
  iommu/msm: Implement an IDENTITY domain
  iommufd/selftest: Make the mock iommu driver into a real driver
  iommu: Remove ops->set_platform_dma_ops()
  iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
  iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
  iommu: Require a default_domain for all iommu drivers
  iommu: Add __iommu_group_domain_alloc()
  iommu: Add ops->domain_alloc_paging()
  iommu: Convert simple drivers with DOMAIN_DMA to domain_alloc_paging()
  iommu: Convert remaining simple drivers to domain_alloc_paging()

 arch/arm/configs/multi_v7_defconfig     |   1 -
 arch/arm/configs/tegra_defconfig        |   1 -
 arch/powerpc/kernel/iommu.c             |  38 ++-
 drivers/iommu/Kconfig                   |  11 -
 drivers/iommu/Makefile                  |   1 -
 drivers/iommu/arm/arm-smmu/qcom_iommu.c |  45 ++-
 drivers/iommu/exynos-iommu.c            |  73 +++--
 drivers/iommu/fsl_pamu_domain.c         |  41 ++-
 drivers/iommu/iommu-priv.h              |  16 +
 drivers/iommu/iommu.c                   | 248 ++++++++++------
 drivers/iommu/iommufd/iommufd_private.h |   5 +-
 drivers/iommu/iommufd/main.c            |   8 +-
 drivers/iommu/iommufd/selftest.c        | 149 +++++-----
 drivers/iommu/ipmmu-vmsa.c              |  50 +++-
 drivers/iommu/msm_iommu.c               |  30 +-
 drivers/iommu/mtk_iommu.c               |  30 +-
 drivers/iommu/mtk_iommu_v1.c            |  28 +-
 drivers/iommu/omap-iommu.c              |  28 +-
 drivers/iommu/rockchip-iommu.c          |  26 +-
 drivers/iommu/s390-iommu.c              |  28 +-
 drivers/iommu/sprd-iommu.c              |   7 +-
 drivers/iommu/sun50i-iommu.c            |  35 ++-
 drivers/iommu/tegra-gart.c              | 371 ------------------------
 drivers/iommu/tegra-smmu.c              |  50 +++-
 drivers/memory/tegra/mc.c               |  34 ---
 drivers/memory/tegra/tegra20.c          |  28 --
 include/linux/iommu.h                   |  16 +-
 include/soc/tegra/mc.h                  |  26 --
 28 files changed, 622 insertions(+), 802 deletions(-)
 create mode 100644 drivers/iommu/iommu-priv.h
 delete mode 100644 drivers/iommu/tegra-gart.c


base-commit: a5003e75a1714857c01317d04982eef81331fe2f
-- 
2.41.0

