Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F29572A42D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:14:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC3z6nMwz3gDh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:14:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GgNESbXd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::60a; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GgNESbXd;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg20lXjz3fCK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djXjuhXFgMVKlm3zBiPNM/IiaargOImBS7AS4kCB1+1KYLN8Fm0Hj+tXnjFtoid+7KkwldxUM8j2pCETv/KphilYUktiUcGRoo5GQqcsNKtYjDcDA6muGyPsLRorRjhD/k9gozKJpZHcXn/NiuUJQgkyl52YkIpzjvfx4AJ3siHDn/LbYeNNuu8VOD+RmqJMND+6zRj4Th9xVAAAgCYFHob7IROwCaAUhGvwL3Yj2ra5mPHLBJOtqgo1oEWlRwWpuKB6nVJhoZp/6t+3PXGlgUJW9ajXD2aRkDCHwDdR35s5bEq79c6f0nHEGpIhwzR9DtcwXdHq6Ht00bujlR7AGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVBRMJorZVWVwH1iiXJNhZX5c9rwj6aTVJimBlNtVR8=;
 b=gZ80wi9DAuGQe4TwxARpEZHUXji2opI/91b9IedEKAa1sD7Xc1BiSTBLWykNob5S+EzPY19nBqitosFjzU8Q24MfwlEc5uGfgnP4Wxs4n3TisNshAMzfzN3gDkPaV9C7jDId26B4FtUNrlhjWvMs4WLUS/b3Un1OG0TKQdc4H4T3Qokd6BK78v03gckq0LFkg699M6p7ColHav7BqPE/FKkRoy2QgFCcgpuexQ6Fwkn3sbjvfI8gSBAQ1kDkIarTkqY/hUomsJUmzhjZOyhDawBw7GHGH3GL93K+8ZuAK2Yas6ER09hfSNpozPwhTFib6iNf4GI/MG0zaN6r1ddBVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tVBRMJorZVWVwH1iiXJNhZX5c9rwj6aTVJimBlNtVR8=;
 b=GgNESbXdUEOk+uYroZknSkvOCBfoc9Pkcs8JLBJguAf1nwwsml1M4qkIQM5t+ACOg1Xa5Wrihdm3SLd1VB/gbjm17oKQF7Av0x4tthtULtumYgOYL9xeF5K6Zw0IVD+xyHaz2BKqlpY3k/jC1wH1oH6aF/Vpi1h/0hwUgOnQZ0IhxNYFDkTf7hfGCpmJIJ+AaIr4KEUJ9RgRxP8M/6qYpiT9Y1O+DXJl/pt7raB+uuwH0+PXiZKPheGzh+7R/0HdImdaMsLBOdBMNUBcd0aQEpAHpcMGWvW6AhNg3maDNDl4hU0fNc9cyZMwFLCTLyQ4cfXBm4H6kp+sGC+OYg0nFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:23 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:23 +0000
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
Subject: [PATCH v3 00/25] iommu: Make default_domain's mandatory
Date: Fri,  9 Jun 2023 16:55:48 -0300
Message-Id: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 202ad62d-1743-4829-b59d-08db69239841
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	taYEzt2Bwu2dFAlvpekVpEVgq4noiGyHtS+ecz5vPkW2Fvrx9CxZ+VuVMLvE+D8hhLvCW8tJ3OJKnKHP25j0GSWUWV5Vte/xa3Hf2PUHHjXFMiB01KY1fRj6AIDhT7+EIwNsoklAvc2jWdXkYOdDmXrmTAIRRE+QykcrFFs4XOqq+XwK/3hvwhUkUV0Zb5b9eVouHJor5Artmob3ECL8kapRwF3bIa2IeWkCk02UEsGXD1OtNHipnja7drb4f5SguUnfBn4j7bmmQI/kPbp3MXMb4VzoY+XRRusr6dG4lZNkCQqdbnWbV2l/z6ANGHTLzXn5sxj0REUV4jPvAMELxdurdpTbcbxOiMI/J7butqYkQl5OlT6KncLrHkbR/cDqavvFBlVM/dsyjF2kP4hR2tad9oLCOyt+NjNGWMM8MlOYmCv3Ti+GTrPl/NzmX6XCC/+3QIY3Wta3KSuTRvvN+Pf0U1P/9wMpIOxpQUlcbGKMPNE1ZF6h1/kn+knKKaXjeu9uikZxOMvoJ5cHrLwh0YPBH0d6W7KOnsgQ5xZJhjnceWtUiPBtOHwLkdSqG+KWAHmYFbMrOp2u+KAEt5YZTby8j0+lzfCqKb9FkNz3HdmBzUw6VnOBiGKQVWtqKsdDjGHwxAqlA6WU4ZGsQJE1VcSIueZQHBXpJp6btuSzhR+fpKkvjEu/2rC+w/VEv6EFLeDAEo8WTyMLVFQws3v7Xw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(966005)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/oAYf8q0S/V49uIJQ/1AG+/YPcYkuq83RNZvDb0Q5jajgBKNcGqWH1tQ/9Bg?=
 =?us-ascii?Q?jKAfIxpd6+pAbWot/o59jWb9tV2hFrCmR0czj7mg8t2IhmZ6nSIXYWbXZZ/t?=
 =?us-ascii?Q?W6faIjmbIG7C+dnhegmM/KhKY1WRljEJ3fRz8aXdSZi+0V76MDP3jiXrT1Lr?=
 =?us-ascii?Q?xxXrXdk9c1IJZ4MdSxigsTh/tluErjnfH9/S6wE5ikhtvctu8h5ghkPHMZxE?=
 =?us-ascii?Q?L0uzBjAZnyPbzhvUu8+80D6QtBxEhTit9MPvtZS5BBUKUgkRcT6UWLifENAM?=
 =?us-ascii?Q?XSlDyKy3AYc+W0BFRs/aa4QRkSXZqLejv/uUtgUN6XfB4Fx8v0xpdocsOfV9?=
 =?us-ascii?Q?4L5PFyEWcQ1dq55CePLkBdcKMHIrKIBsgR0dCkyFCIilFrSDk6iqhU8+5hTY?=
 =?us-ascii?Q?IQTr9xANykkwINO6cm+vZZThzSakUZAGN+lNbOuVSmvkD8PYJRywhaiODmSu?=
 =?us-ascii?Q?Zlh5j8ITLJi3RvpSxQqCeN1vfl3x53U42lldPXHHR02wiQB0PfN44MhZcdiM?=
 =?us-ascii?Q?wOqW6lGdEesqBhErsCvdERdDRCWcGwBjN894D6NDSkdxv7RMbFPN14N3cvsf?=
 =?us-ascii?Q?vTAAa9qcTloH/cf5pxi7rZpU5fiEVHzrPYJdkvDdfVMUIJQDz5ZRpFtv8Kys?=
 =?us-ascii?Q?lMVjAXB+/QCet5XnquY1yokK7i+6vwL8h4jXkJRIKecZeMI1xMRzHGyqujiM?=
 =?us-ascii?Q?vY0Z1zjyE1iIkdwsPgJmD5pijwMHrPNr4epQGr2X4T6ZnVipRCBaSH28mCxP?=
 =?us-ascii?Q?yxpxezAak0lgJyIA2ECpIHv2yB2JOreRZPsZI4OzUrvQOdPqZJ5BoghNN3TG?=
 =?us-ascii?Q?IFEgVVN0q+XmsAPX+b8SmvUWkBLVFn7wAYshQ4zEPF2vwCcNaZ/o5efz1PWZ?=
 =?us-ascii?Q?dY8XeZ0NOsqhB78wVKsXli0j9GX3YfLg8g80QtGvm7hYnjQf2APLPIQrddNQ?=
 =?us-ascii?Q?aUuSU4Q9W5lWt4uYMxITEXtojYMQHDFhJHoXhTftDQrCyCB9sMcl7bx582fx?=
 =?us-ascii?Q?QCcevOr14smBvSXTGSrjDKhCay5n+N7nAQoKRELF/Uv5Ha9UPO0GNQSGnfRF?=
 =?us-ascii?Q?yGehOnZSXwgjG7mxOqAnPdz9amlYBYgZhcbibFaHX1HYPg0CnRcp8pQut7DW?=
 =?us-ascii?Q?Nvw88ZtBZ2iTiG0a/rmyO9FDy1StWgMuaRUFIDvkJVC1tMWjNsivVY7Tn+w2?=
 =?us-ascii?Q?h35c/hZkoryMzxJEtTkAHQOBWm4sSiELc9grl8sky5Xj+3GeUeYoZL3W7jFF?=
 =?us-ascii?Q?JWk43EuWxfO0+qwKmJTuDJBB+AhsF7GRwVdVwrV5ekItO4xIDRzAGKwiBv0u?=
 =?us-ascii?Q?akY+ep961mY9ijp0MysP7TsPNBZz4Tb2PDzsFFRxEH4AuLqAQ/CvT1odl1NL?=
 =?us-ascii?Q?DauW11euoxarp7U4nMo6Rz4f3VlCZN/YPyQ4mH4yyhnflfSVfb0R1vSAXTt+?=
 =?us-ascii?Q?UejRwLjF2VHHU0s8Z34iWUTudbrSJOvyQGrIWbEO6QEmd8sLN6/SXSmVVaV0?=
 =?us-ascii?Q?IgwjBhP5KB/8FZMvDjLFKPM8NKieyqtJmPP97jZzbvErrWIgGq4RY9Oufz9v?=
 =?us-ascii?Q?LOuqYnlA4iXS3q6vTZMYSHjMGw2k5LHO+H3mBLSD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 202ad62d-1743-4829-b59d-08db69239841
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:20.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76jhs7tnal2MbjEaaTCPK2Fkk0h7Kkan0racSRVJYrt2+b/yC9f/rlU/3Jc/64xm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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

v3:
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


base-commit: d11370bf64c57a3f50c68e2ee55e202ebdd396a2
-- 
2.40.1

