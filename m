Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7957339B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:21:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s/loTbzj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTYR10Pxz3cmJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:21:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=s/loTbzj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60d; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8G3Lxsz3bnv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gl3WHa+exFa1nbk+BHGXk48UdahCGctlNKLLC6QKqGbBpGLuBNG7nZk00/sryUJ1lggIQpFN9S/BTp980lc4Ucp28O/hAdfOuoNp4/jZAkt51qWFZ+ic6DMczJzWBvQ5yE3Khe1AnNvHoS6QLjtSjFEYZBTZXb35jlkHCQq0CiWLF5UX5NEEvBbTtEVd3VWmM7xTwjLSPGiQZNng5pzqXtVZxNdI8eVOTZ5WR5shtI47w28wJK1S9KKDXlbfCizlKqSI0xJ8Q9z9/8Wj9VhsGfFrYiRI65y12aAB8uiBVIHIZPtVSqYFb4xvNpEXgz4Pz+YgflzCJ+/9Sdq17bueaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zlxmJQaMSbD2/ecErvFE0S9HE2J8Pt99TWUP5WDzlHs=;
 b=JnlvoL95oe4SanRQc+VTQfr7S4cafmxtHtM7JedO1k1dp9kRmRWR1+j+1NnDUX//8fuvp6pI+SeS37hvYzeCBWpYvSST7xzqEfRwaAE/EeaZasBJF4H7TGJoCuIuV2pnzMfvf9nqBXT8TnWkkhSl8KVHHJk5Yklflp5teXP+zWhyWdJLQx3fXrUzsnr0B/qNtiVJ0cF6LYOmF6Rl5PMhZuWGd+0RES5CpILvb3APvv54CkC71V3L1Ewt1YCdIIddXLp9X4Bu1MVw4XnQDjZlyen1G6dktJCIQQWmEWdEXu5jGSrtW/ZQCud+rXVwHi3TbUFZ6APFDtcAZ5lt6YOEpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zlxmJQaMSbD2/ecErvFE0S9HE2J8Pt99TWUP5WDzlHs=;
 b=s/loTbzjUsWghybafNiVMG9W/7ZznsXR09YsYw6YqsEur6yd61UtDUKF7UQd82UB3tRCawmSfBrN3Lfb1+ONCbW0K+0G6m4WvfyTa2i6+In7WMnlq+4zU07ocPTjEcMarh/C34RKC3QyWjoSQU2hC4HUrQ1a4WT8ZGszuOAAjY06NERjvY+hAKZZsbGuQMVCkaPknOBiwv0iPZpTysfdr97sWilyBMcskCYB9hEYVskmC4oAw9lY6Z2q0fylruovp+joY0Yd0VyyQP5Sc+BuO3l8lQWRL/xzkBpeD0lwi+ZFK1ZaeUmjsr/vmhY0nWI4uJVGmrWbNyvg38QiKgMkcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:08 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:08 +0000
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
Subject: [PATCH v4 00/25] iommu: Make default_domain's mandatory
Date: Fri, 16 Jun 2023 16:02:29 -0300
Message-Id: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d7d999-dc78-424b-9c22-08db6e9c4bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	9Jl/9JSHoCU4z+9ER/rdjXGsG2WARs6yhJpiE/yn8TBSO+Jucw8xgPlDT72mTB0OadJ36rINwwFzX1CDCM/xB5a+xt3+L4u4PlOs0duGlRAKQppEj8ZdZuaINyX4GTNXq2519UI1EVHsHtfXjlwNGpObOz0fJHOghE5HOx8rBHrSdnIZFCCX6c8GJjLD/VsLytDGOCQAyCxl50DYjTQFwLwveKW/BKHyZq2138djHd5is9PMLGes7dTTAvjS7CTj48+/TyMP1ogssVZubivSIjozsdqAkoO4CVyal2MIlOI85cK9WM24P38C/omUrIls6lRkyglEBSOCKQWxbBM0rDQqAqYfcwgCJAlCn8xU+IFmBJfK13EKBl8e7z8CnOlCk8gl+O6+6gAr9E31nq8FSOQM1nXZeDc5lWrOtY3k/hF0aHr0V+P55DjrgwIU/l+gKMKHZd23zv9hipzw/bVZabSIlfaQKiOSdApYcj4ZEq+/3j95if5XaxIFHWuVghqF2UUoIBJBy+TjoPSkzfenQPaLf9HLE5kcNgfhGs+JrQTHB3s4FfUI52gPTJEFZIfeTuAT09a+c+v+FyGjBpOjfo1f94LOx+kpOErrf2moMgTI5GE3GIaeNh7r4AJMJOvfsEvcOl8MbaXyid111dvekXjRtixVGdGyLCG767CkL32ujMgLBdR0w8v7M/Bpb09sZ97psHu7eB8W+x5DnR5IZA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(966005)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?xT4GD1FJeyCtReaPngD19pgCqQfHpd+92CwOwXudjCBbzG3/9C6JhrSSw29o?=
 =?us-ascii?Q?bAjwca8F7XOJGsg96yk3jn6cWV4pfIGF1QmwM6hQUHfZsZUbLauHQqq788FI?=
 =?us-ascii?Q?zSlvvLXgrBzAsLOWg5t6FsH8xbFomvV1/gp86tWMl+rJIqnI7/S92rjy+X71?=
 =?us-ascii?Q?SDYPIxv5idZdcwjJe8501wSljfpwOo+oVIXdo6AQmkqbXijr+jhK6yyKWJVh?=
 =?us-ascii?Q?khVpJ+tS6S3Q09TOQ6n/NtIV2TWTSToOXPLtTPGiynvzr6vQWjmODiAhvWqP?=
 =?us-ascii?Q?ZxpdxTC/K9aroDZkDtX9Ad5iKJVblTpiBUdN44EPBx+SEmx1ERoA9e+t49xK?=
 =?us-ascii?Q?BCIz8MJoEhZbpNxpPMFEYE3dWzEKSlhGppK27/g6cJ1zbxouANrg1PH8Fl6/?=
 =?us-ascii?Q?v4dd/IJNIU5voSmVU7HM6KuKBAFtyTA1WfmpPREgkFNbtCUHZZVWgJ8I3nki?=
 =?us-ascii?Q?Yiuqkt05a8thQ9axvj7rOnK+Y1X9dtneq9HX9zwATljbEPfP24bjEDZx53xD?=
 =?us-ascii?Q?3Mydi2PZmsZBGcqYuGRwbi2PPeSSvhA1OOf41LxDGA7ovQxi4r5TVz9NEFGD?=
 =?us-ascii?Q?CEclm6kXo7xw28earl3FDvc8obXSbroCtr258QqSqaicj3cxRbQV/yu3xxsR?=
 =?us-ascii?Q?ochA9AcKISFGUlL4f73MDNEkHdmg1f8tPm3XKSppAk2607pHX/FSicE11eZb?=
 =?us-ascii?Q?4yMdqCZBg9EnuXwaAdiQBgBF16GPxq4XuSCEmzNDOxsogSNaYRl22EkSIWF3?=
 =?us-ascii?Q?q/dp3Eu66dkZSt24agCqlK1VZHxqUbJ001RigWXvR/Rfd/+FqAIYeSrX9coB?=
 =?us-ascii?Q?FRTi5ZfPSIWSyrV6nier9v2lPi5/BW8hBm9xXsl+VMg9DiiMBR5f/0YTYjbD?=
 =?us-ascii?Q?jll408PnJnT7Xf187gBALW7ctyeSn89HZSi+lD5XBsoc7C6zW1OxNQt8Bs1+?=
 =?us-ascii?Q?7jVzGWixA+lY36RrUOTbCZiL72w5BNj/iLbDc8kUsKl3EwdtGO6lRPVJWdYN?=
 =?us-ascii?Q?3rY8bN0w29aq8G3TtTpUtkUmzyMJ2DJEsvFz26aMXA3cSi00wdaDQS0bOLrD?=
 =?us-ascii?Q?D0Nxb2yz46JsFbW+cSr3/ILCF55PfEDzkaenuul+RPquclNJyBOCuXS9o0P7?=
 =?us-ascii?Q?HT6TF1NQT+3uLwy5OvhWtGTX7cpZcfjWZMyibTwesSibdOjdCW0dy5uqyj4z?=
 =?us-ascii?Q?yGVqKuLTzlyQakuyu2hSPNUm4IDUeZIS2n/LkRO/UIlHQ2rGy++7mlzREq0y?=
 =?us-ascii?Q?hVETLLJPcYDnQlh0O42J0xJqSl7ZyK/k0FCmqexDhYddzxfBrF20D2C++Kgg?=
 =?us-ascii?Q?1faNgdouNEKjZQhj3LMs08ZmDUIVwU2fASVuWiodN6qx6ex4yleAym6YT6qQ?=
 =?us-ascii?Q?0Sq30GLarXU/yL+kW1LxemZTmQSsGGzuZsNwVojpPDLXGPws5LPESDzobbi8?=
 =?us-ascii?Q?Z9LOe+2waMKvxNFvibqnTRjQ+5CZ579GHvqRxjuOrsu82ShaBWh4kBzb7h8u?=
 =?us-ascii?Q?Rf+ziEW/p/RMNIigUvuxQBY8BfvqUj/bc7hCTDczV/EBnmK7Y5CCpOjsFl2l?=
 =?us-ascii?Q?xROSkMX1axtvP7jLsBf1OQ62qALBvMfrj1lUROmp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d7d999-dc78-424b-9c22-08db6e9c4bfc
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:57.3755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Lcsce1LR7xx9+mWY+AsTEY/51I9e6U9yadsTAIGdvWCaM71kc3GuZ8pRyiuN8uK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6051
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
    the iommu is turned off as so the turned off state is an IDENTITY
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

v4:
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


base-commit: fe420865bd74f5917ff0d8d38a46fbbbe5dd1ea6
-- 
2.40.1

