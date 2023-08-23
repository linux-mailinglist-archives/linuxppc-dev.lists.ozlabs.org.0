Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BC7785DFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 19:00:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PuYxJ7Kg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWCCD2NMLz3dmb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 03:00:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PuYxJ7Kg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::62a; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWBwn3wrCz3c8W
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 02:48:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WGHBuNTJTjExIeCpZReo8yz4jjpUuJtZwldFDTZ5zIbGFNgOuJpiPHEWtwT6LIHZQHxaFWo9FQDBigEV8TNUQNVHPw43M3QY7VQam7r9TODPy/yRXOaU0OIvULS5AyQ3eMkvMveTGE8xctaAKP8eTfdOi4k9AmfJLW5LEli3WkFNkxXS2ri+7RLnTLgWg4ZDZWplqeSwtw8AZ7q4Fu8fr8Tbvn2P9s6eS5jYrna4g4zJlA7r/9JKnYoVOEC9MiV9U1VQDOI4SCtajk5c/mKWrOnaysr5PiuWfo9W5bytiUINYUXGCRwS75YzR1LQavOiDQgnZCF2K8mrFJxLAyHgxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvATlWQq3cR2MPX4SUYdTXCyZAJZ2dwB6KmLH6oQh6c=;
 b=fFYwspJoGUT0bJ+W/NCdTy+xc6D0BAjgUQJbgVSmFG4zdwBYT9HtPotzApSMHBbKmUkNJ7T3BYUCEbrrqhKTQQkFKDyEnHpYD7TlNVT/E9Pc1mLZl7pVcPgMWiSpiXXBfn1qGAr8p7OCa1kOUMlYm6kQUt4E7Qf9Uovt6Sagcv+UpM4b9lhf4ZotLssCB8SMM+cUO8vmoMTDLvTj6E67+2HuT7Q8p2cDLClw57BGrsHuV8a2nS4UF3LKD3GW42oCFvA+suYJ7C4UQIjFJ77fueH3T6q1PXFQ41cccKFHAG4UKzBIfMN6KMBEhV2eYxy+rvKYU7p9AojieHWWeCz62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvATlWQq3cR2MPX4SUYdTXCyZAJZ2dwB6KmLH6oQh6c=;
 b=PuYxJ7KgmOqqKJqvWJTAXrAE0fjI3f7UA1ZsZ4hwAPEdLdphfZ5Ub5/fCJCFUCkghwuv7QjqTFeIz8F3pZNQF1JG7yzLJdQQRAGMoixgdWP0kY+BNwc4HEKwT7C2AgzjT+gWRU3HMhdE99AhkcAOgn71p+CjbX37haeQmKlRNc94udPPY/LJoP/+p0xBdUQ6kiLPxoKvy589QB7jnprZIEpI6PgD32iQ/dAJbgeMYaO8OvZV23dAI6gNbosnlWUXVDg32I0Hkak98IunDm96Q4uN+pwe6jejeMsHG41IjxgfqhaJOF7+ghj5V60u7VqyQGeuOLQSGjfVlbEebfRnRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CY5PR12MB6346.namprd12.prod.outlook.com (2603:10b6:930:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Wed, 23 Aug
 2023 16:47:54 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 16:47:54 +0000
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
Subject: [PATCH v7 00/24] iommu: Make default_domain's mandatory
Date: Wed, 23 Aug 2023 13:47:14 -0300
Message-ID: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR03CA0349.namprd03.prod.outlook.com
 (2603:10b6:610:11a::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CY5PR12MB6346:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f573b31-d845-427b-9f27-08dba3f8ac7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0k+CIGYmsoiE3TIvaz+NrF0RkuY1OIzNspvfRGne8HKWnIChkhRUgsbtjn1mb/j43IUvECqZfMjpqrpsGSjBzoVdS+GZgcll669o2amvuPMagYKBUV3k3terb+o7o5J9a2NY7TXjXK7WRsEUZ9AquNO5KNUR5sOpr86ZFXWlH20u5t4YAwYoKQwdLK0BMNgQiw/lM7Z7mL8BBuFq43e3Kx3++x6IplCwbjr7wiR6P/G9TPY8prBH3zQAgwwfg3cRFwp/Csq2pV9sjsKzPQzB1DsAIRehw/djMxnXUcVH/wm4lghrI5Rc4yfat1jl97QKkPzrXmyTP6sRNJdb+SNJ1J3Cb8aq59AQAIFJpuu6gRvemXtnk0lNa1v0Hqp+KS4zMesaLWRE2IAPaT1CuhK31FfMUl+oNWmC8WxhBv+rZJRo0TU/aIfSbFg31Yj0QyVbiUYQ9Zkv5yKKbZRgQNp3PHakl5MTI0jblkyjJ10NoGzKKP/8TrzsFstjSX/uuqHrKddqQnphRvgcMkqQ0/KsTrn8ZIymi/fRsfoVUfeLdWi0Vu3JV87tYC0cH+0oniGg/vk3Cl9RSqnjriqnE10EsXWsYuNTKRg6HAlrGgMFKhLleuRZdo/UmVTpMqDIv/SUsa5XxNmB49Mi0L/M2SRNvduxLzYA9j2Ht7euqsJw1og=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(54906003)(66476007)(66946007)(6512007)(316002)(66556008)(110136005)(8676002)(8936002)(107886003)(2616005)(966005)(4326008)(36756003)(41300700001)(921005)(478600001)(6666004)(6506007)(38100700002)(6486002)(83380400001)(7416002)(2906002)(7406005)(86362001)(5660300002)(26005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?U9FSjvuxFju8fV9DxZahrv8vl8z6XEl6ZvfuTqeeu6WxmuNg8Ff4hRh3URe1?=
 =?us-ascii?Q?Utg90K4wkXT78JMckPof3J7315aVJK6hcpUIQq7IUhw0ZqXQmLUhh9bHvlFA?=
 =?us-ascii?Q?rmgEynVzeBxABQmIr0AtrvW+gd3OHuCNb4q3pdoIDLq3L+9XI5HITxEdzrft?=
 =?us-ascii?Q?e0MUIyWD6Zyo6333e7/KmjBVDlvZx1c1tTu0iCxEWLbgCI0LdquHlYzQ72Nu?=
 =?us-ascii?Q?cPa8KyXFctzVlneDqQDM9qmfGlfoYpSDf9b9fulRFD/jAflXCrAEWxDRxkBb?=
 =?us-ascii?Q?W/UYGvhnMzveEB/baR68ch731Cje20UKg1c8MXg/wv07tR/Z2QOxooTZ9eWL?=
 =?us-ascii?Q?CytBKKrwagZPSnL0mZj9w1JLOsLGQZ/kkXE4MxzwSUndHn27fwhe7/S9GbZX?=
 =?us-ascii?Q?r3+1ZIwLf1fhS+v9F+5rI2T0NYlxWPi7ZQ2GCKE3dEmnSzdQUlJzhki99jSc?=
 =?us-ascii?Q?bF2cMm2g+bnfBL3LsJMnOKph4VHkG6W4GXuVGYI+o19tSv7KQLNoDnIVcJhK?=
 =?us-ascii?Q?jMD2QJsXOSJ5Fo4WmeKLKHS/5/3vmYAOXd94Mr5A55A2YQVvJ6gEvXId0S9o?=
 =?us-ascii?Q?ehRQUtt05Y/JqUMmODfj9TwMcC1UydzGuwkhzh9IfZOT2XAi66AyO3s6z88d?=
 =?us-ascii?Q?7la9VuzwcQQ7GcOuNq/qUV7EBPzubPHhUWMlANzKePeTMZNBdcbpQbrV+vHT?=
 =?us-ascii?Q?nzPzI9m9taO93g9evL246C8wrQnyaviCtA+7OHHwtvxi9hZ0e9DDC72tXWfp?=
 =?us-ascii?Q?99H8L0UyWzoBRxcWfjWl/ZIoFKRc7Xf8oTW5Gt+UAUPrsU0/GYL/Arv8QFUG?=
 =?us-ascii?Q?CN/bxsECCfaBm4jCfzVdM/Juu0gzbfDc6lmUfE54Wcuhf4dojqzn/+LT3qki?=
 =?us-ascii?Q?gA3YUdptkBsqMp5dGuucW6Ngbt4DBLeK9sDaAYbI4hIAOg+HQeqlg+GqxYeF?=
 =?us-ascii?Q?go11JqlquWRAvARvgKBppa1CUHipsOmQ/F3eE5ZUuMG75vqmgsqm2QawszUw?=
 =?us-ascii?Q?Wj6sHSDRh6Gxxx8vllLWPXv08b0a/HckEmvwz3Adh4Acwv2xUJcRPxEZ4H6v?=
 =?us-ascii?Q?vhYT6oCCohw0FzWj15WJ767eEdYYCmhmRHY6o3LIxV7/9j96Neuei0ckh9h9?=
 =?us-ascii?Q?l5LqLcfNlRF9DveR8e+nWp/+SemLxyuaBEqLv3iL/f5Ct6N64MYfuynFXfF8?=
 =?us-ascii?Q?d79SNX7ARaNQRwpOGnEC+30MPNOMY8I6I/jDWmJ/zlA3gC7FsRyJOQiSsxzr?=
 =?us-ascii?Q?lqezuqDpx5HyjwqAYifnn7zEw5GlcBy72ZO894HT84Bng1+2l/MOt2Bo9TIf?=
 =?us-ascii?Q?dhAuiFOnqZPaptGii7BwRCWpsoH2HjiVuZbjkalD80H/sByIJNkf/Pbmxbob?=
 =?us-ascii?Q?3ev9k+HV+tS+kayDM+c+elgGwsJxoBvevMfkWhK/hsSqevOvRJFayBjQTg+a?=
 =?us-ascii?Q?rxRbgHqE5Gb13lXoXLAOfnotY2lz7Wtn8KRjkNrkcpSGyoVP32VLBjxy+jC2?=
 =?us-ascii?Q?ig7GW+/JlJ0RJwm6kT+rTTK4rg/qrELGfYOFbBMcIUdANPyBwDi2eIur+a5d?=
 =?us-ascii?Q?uE2egtY8Ok+WTVnqzlZ/P8lSEDRKwXuqvh99inE5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f573b31-d845-427b-9f27-08dba3f8ac7f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 16:47:44.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCk7nH5PKJMXCP5vizfHXz2ime7hZc3xAHB2EBjg1iW1Lkp4+2Oqic+3UE+0bHsI
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

v7:
 - Rebase on v6.5-rc6/Joerg's tree/iommufd
 - Most of patch "iommufd/selftest: Make the mock iommu driver into a real
   driver" is now in the iommufd tree, diffuse the remaining bits to
   "iommu: Add iommu_ops->identity_domain" and
   "iommu: Add IOMMU_DOMAIN_PLATFORM"
 - Move the check for domain->ops->free to patch 1 as the rockchip
   conversion relies on it
 - Add IOMMU_DOMAIN_PLATFORM to iommu_domain_type_str
 - Rewrite "iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()"
   to be clearer and more robust
 - Remove left over .default_domain in tegra-smmu.c
 - Use group_iommu_ops() in all appropriate places
 - Typo s/paging/dev/ in sun50i
v6: https://lore.kernel.org/r/0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com
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

Jason Gunthorpe (24):
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
 drivers/iommu/iommu.c                   | 259 ++++++++++-------
 drivers/iommu/iommufd/selftest.c        |  19 +-
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
 drivers/iommu/tegra-smmu.c              |  44 ++-
 drivers/memory/tegra/mc.c               |  34 ---
 drivers/memory/tegra/tegra20.c          |  28 --
 include/linux/iommu.h                   |  16 +-
 include/soc/tegra/mc.h                  |  26 --
 25 files changed, 514 insertions(+), 756 deletions(-)
 delete mode 100644 drivers/iommu/tegra-gart.c


base-commit: dec980836cf9cc517a56b59ca88e5f3423b7f68b
-- 
2.41.0

