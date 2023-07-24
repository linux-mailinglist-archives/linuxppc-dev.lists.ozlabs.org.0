Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8C375FE3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:46:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ox970yVW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8ndc0ffvz3gYk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ox970yVW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8b::604; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8b::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8nHG57Fsz3cFX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:30:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZzHA7bN/uHXP2wwP8lQpdKyU9i1bZHJtllyLPjvB9zbtSr+xvqLpOJthTAmydkSNcSCuSxin7W27GZjtq9VTYC037r1+L8xwj0HJt1uZh26w4q0S5RwNmSRvM/93Vf58yjkqYeNCKyf2pftFMsFQQgaRCGBJsqPHn0lM2K/XIFLMNaTN5ZFUmPYGjk6H+8K9s2u5XyXxi7n8HUpm0JDDoM7RtnzT8M6vPQkLgO8jC6ewjQ4Lhjf0mECAEY9ROXnad6L++IGYx7cBybvOcEcbXmz2imbFyu8lSqJ48j9zxmLhZPadMxpmV4TXryQpJvnbYhMASiItv7M0+dmdfYLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhB6YJf/MxhkoeZ3msnO+Mh1ntwDQViVJ1bE4PnFaI0=;
 b=Nqf7g24kEnNcRfZCk6HmSHwFiG0LoBVwr4laYofEpamIj7QK34OmqRfkoOvfwZvJCiYNdJIQseop/k9tKYLZs3t2tGmJxRhxA4VRi2NydvL0ULg7Hh/TAajEIgh2uaajRFxDpcXA5rJTcULXWidkmp1dFec8PK77Z72w/0tTwlAcbUUQKvEIyGTSJ8N5AXr6XEqVILHFXk2L1/Ec8FPIWPIv0snaAQ9PNrek+HHDa9v3rM/j1m/fqg+aLiqHZjTMrVV+gSYHwrqAp3FsNT2GKTnI+bJJgOkI8+5/j8/jrY8Y2ilnaNglgRORe5ooKAlWRIYLLGbIPgvFNbi/UWL/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhB6YJf/MxhkoeZ3msnO+Mh1ntwDQViVJ1bE4PnFaI0=;
 b=Ox970yVWTsdrJlYmz+tixKLe6hVmONPJ6RJ/K8KfN3Va4kH3fekAYLTWDXA1U+mhOCUEWYaTrRUuVVmJh2a/Dxh05Iu/SxHq1TiYIk354HkpDPGfgRwDlWiCNbkl8M9SgoWVbIT1wzF4sMQWAhtzReIN+Lu0FT3vO4BFZY7tdvK9loO18QrUl8QP18X1O/rJ1wzHIySU6manUyOyPpmTjeqZuWlukYtD2ZoRKJ7vc0aQnxGdXY3jH9JtlczK1Sub8rsqicKO7fgS87v+sU6yiOKgVwA2jhKOrt3+xbvRZ2Z+oToDn44NJtkGHw7KlnMB9GryBA62clYTJGQM+EJyog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM6PR12MB4958.namprd12.prod.outlook.com (2603:10b6:5:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.31; Mon, 24 Jul
 2023 17:29:58 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:29:57 +0000
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
Subject: [PATCH v5 00/25] iommu: Make default_domain's mandatory
Date: Mon, 24 Jul 2023 14:21:50 -0300
Message-ID: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0015.namprd03.prod.outlook.com
 (2603:10b6:208:23a::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM6PR12MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: 914b71ab-c6f1-440a-af41-08db8c6b99db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RvK/mIvkr8cJSRF+jIHRI78Mbga2Gq22rwcW7fKsJWOiIPG1q7TterXEC7RT5T5V8PbeafvOTdmTq7WUG2p9pf1l4fCyF3oVz799rs1yqzDd4kt3UVpT9uLWdka9CdfQ0+wjEs8I0LDkY9tyvLCvLT7kyJ7hzHMaA90KaxMv+35Alve/LZlzBj+OuRe4+PJq/WQxipk13jvzEHUhzxPWnR4nv2JcVqwBRJ9wMK1fyO2C3Y2ZVd9NApAt9NE9m+rzRwknbLemZDYJyVSrpSLDEr1Wp2ogzMdisdZ+hY8w16LqIaOSv9StYb/0f0carpEVSPsHGILbqgdpMMec+G52fg4x4HtZWyha7bVTTssrUw+6bsbqO7YrfTi8XzPEaZ6BqIEd4y6PmOy3N3WGshHm6V2zYo7CUBN4Dl5wsoiOi3KwjXVa+VOO5rSdU67bXSauT6l3YS0lAbw4c7N3t8CDmlnte+3bB/5kfhBqbxQW7IJFJ+wfsEdkaQ1n1TdhVbyPgRY9AumkEgUIWsqCYojidwzNKO+JUJhfA0eIwHEXVKbwZUYnPHtUHYSwHhQVJGV1GmpodswpMY1dvNd1VUng0wJ4eo2vxfnni0uENm2xfKKxGLU/+hkz3lEHGdd4J23v2o32QZ8tAVq1UAmQg3w45vUNjES5hOBKtQuxpTA16rsTxFxB5Etno/p5fVah2dludVFu5r9vWL1L0mRUVGu+KA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(451199021)(38100700002)(921005)(2616005)(107886003)(83380400001)(36756003)(7406005)(7416002)(8936002)(110136005)(8676002)(5660300002)(54906003)(478600001)(66556008)(316002)(66476007)(4326008)(66946007)(41300700001)(966005)(6486002)(186003)(26005)(6506007)(2906002)(6666004)(6512007)(86362001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hyv4GEvbEu6s8n7CyANUjgIurc4bJWnNm9hH53P08K+atN+mry69ykVnBNiS?=
 =?us-ascii?Q?tChnd6f0j0LCiTtk1Wp15Hg5+TVrLTBE1ifmzJ7glkV9YAucKNhX7DQZNsuZ?=
 =?us-ascii?Q?FP4Q7wnjmqXcFM1buHZR38/Rf0zMKY9wJd/DNUlZDzLQzdZAGQh0acEHv5y5?=
 =?us-ascii?Q?zNk7ICDrR1B4bKMCH34LYzCR7FG31sgzo8MsuunoseV37b00kn9gKAxjdgT1?=
 =?us-ascii?Q?cFofFYwpFGumsK4jR2SFXW9h/ptG47ADk79pu23Y/aX04wZhABHFM+Ba88hS?=
 =?us-ascii?Q?hKNQpMb5IeKZj5L6VWp2NwD7O71BnAI0ZMmvin2y2Sj+HF02nxXzc19Vef2K?=
 =?us-ascii?Q?iWq9RCS2r5x9gK7iPfbybg2+71ThYKCATxu7hDWcbGxY5pKO8gb8nsmmf/8n?=
 =?us-ascii?Q?fNTidC0W6kNKbCQE5E+YHC5D2sGD6i85ZMVoV/3bdPDS+7jqby3rfeVGYA2d?=
 =?us-ascii?Q?vpQ4g2l2sT8+aLFDasOp8fvfl924zJ2eigARQnKnZV0YtGexSA/BBaQTr+PZ?=
 =?us-ascii?Q?SmxWZ5ksOtrOFLi17wge3O8Sdu6/HW28EURFIJaPLMKGNSvMbZnDMgdh8H33?=
 =?us-ascii?Q?/AEffAIZUDpGemsAwGCfidELywWenAzKj3RVP2EX0Wal2vGWlTjZt1NN7iaQ?=
 =?us-ascii?Q?O4BaWVU0CQIkDWU+oO05b9HT9bcL/stoxNu5ksfsb5YddZrMlzUqmMFZvumr?=
 =?us-ascii?Q?1xJWx3aGwO/dOvCYCfLxsVYfAlU3K9i+ySR9U+5Xg0k0yJYaq21AVOVsZl37?=
 =?us-ascii?Q?yuP38R7Tr+VKxetWcen7ByianIivBcw2myO4Q7JCAR+cSTtqdHKsx7E5pxaF?=
 =?us-ascii?Q?DDN8hG9gaBcvvNiZdJLCuEo5MmAipNrQDWWQc389kmS4Bn+GlzJW+ke0zJDK?=
 =?us-ascii?Q?9Duh0QBCaoeez2mD5CWWO7EvYuj1eSIyZaSgCkYvz6CYB5uzaKYFXlXFc/Gc?=
 =?us-ascii?Q?G+IAWonh9RxyyF7V1ff08C+crSaqRHyMInhDAWn+1jA9BqVHcrxGLgwm0fGq?=
 =?us-ascii?Q?uKYSn4Ewt1Y17TZGKJWOgcFsOxRBWyL+T6qwe9HZBNGvhJu6yu0kI8hMAxt3?=
 =?us-ascii?Q?xKXOci3vC8qZjPgNgQ9splfVnOmRvDy3HFHqVH34LTZK+NBfydLYOdb8wMUQ?=
 =?us-ascii?Q?Oe0Z9Nmg9pi8ukX6rfB9hSsyIIwjOf6P9RCMMOpNYWdVs9INI7bRyqqC8fFv?=
 =?us-ascii?Q?17W0pzcbUycJr+PFcs9ITTFZN9qa+m6icRcXJN2Zkaw0B+by7Q5LLN/W3QK0?=
 =?us-ascii?Q?kfWtMFinXj3MbkpSwmI9CGooMVzuTHITDzGLRdDhDL8k3L0yqDsnpIL4KAES?=
 =?us-ascii?Q?WbJtOjQUFgjHK5a5EmSHP4PvFWcyxK7YXHLbcn5+QQx8rThoOlUReUX/3Yrr?=
 =?us-ascii?Q?h5aKXEZ+WP+hkGyH0c1tCY/z0AbTC62zNyqqk/8ZUcLV2o9Mn9c6xHZWqGbT?=
 =?us-ascii?Q?avMrDhxhhkM4fJWBqU8v8llWDG+Gs63QusMfmXzht5Xet4yHbEaN6IFLdX62?=
 =?us-ascii?Q?mT6keX3NXpy/wfgKF3LchPfcqXNLBWb1CHXGimO0ZsNVtSa7aXO25oSDAxXg?=
 =?us-ascii?Q?Zkfd4NctMi6euEC8zJZr2goYTSBlUBh0jYWbvQdE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 914b71ab-c6f1-440a-af41-08db8c6b99db
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:29:57.5563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yL1mCWRCouEPKh4HEgE0CPMc8HApV2n9DhjENlleek5HQmYtk9lcDH/yiQ1Jaygx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4958
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

v5:
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
 drivers/iommu/iommufd/selftest.c        | 141 ++++-----
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
 28 files changed, 614 insertions(+), 802 deletions(-)
 create mode 100644 drivers/iommu/iommu-priv.h
 delete mode 100644 drivers/iommu/tegra-gart.c


base-commit: a5003e75a1714857c01317d04982eef81331fe2f
-- 
2.41.0

