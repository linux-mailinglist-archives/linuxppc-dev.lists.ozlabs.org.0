Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA870421F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxYc4L5Mz3f6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:14:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCM/fZBX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::629; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UCM/fZBX;
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGz1Gt5z3f4m
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mA50G3wJh66xgO8HHBaFyci71SVR0xuok2WInhD8V3LsYezfbvKihJjJt+V/fs5aCrs4XSgc8Kzl5nNeaU9HOFBb5z98Cwp85xGmm1E46JFOPEQzNtarn+3KmjDiNp/P9KkmLNtQHJtcvM2o+Nk6P1gDLwwohB1bgD9RJ0LVkxtPd02Wz79UYfs9PGkvwywRdMQ43Q2AAM41p+zm0n1uPK2TfSqodQ7PXKwMVvNXwXLW7XwaW7i9grlWyfF3q1LkcOihRmUNQSnl20bhOvlcvUR80isnAzMqCn8G0R5fgOn4ywRMLwFpTl6zftYRWmgqx9GormX/yVWo47Bo11V0og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sHEIBiqjTtqv1+CCFbjxN5Z3GYGJ/CUZjU6XUU4igZw=;
 b=PQmNSbnAMa9j+2JxyqgP/j+p/FU7AMHPK/u6RS87YlIao16+aD+UVbOyGD7KNgbC/8Nx8DyFktfcEcjvFTRFDZNOh6VMRpA3/vV9z2i/e/F1AFHT7jhGmAN90Un6aYVCBKuJgSFNjSbx7jBYTKt7W+hiLCOrE8WQZa0fLHvO3WkFBuEsYsMWrDjFH6+7+MKL2Q5Yn6ft3X+BniP6fzg1KOLrGOvx1yftQHXEp7W3yPrOxW5yGB4B9XNTPfIQKwHg2niqk0n/bMEja8b3Op8daT3OAxms7ceetW/mhaaqx6Im22bgvxtxpA6ubDsD8IIVHTtEgIOxkr8PYGeAhFjpiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sHEIBiqjTtqv1+CCFbjxN5Z3GYGJ/CUZjU6XUU4igZw=;
 b=UCM/fZBXzNWLDYHZ/zmC+4T+krAqNQ9EQx1FOkYjedUUu67Olt8EoLbhPOggWONyLDLZ8gWXEleCghfog/gcDvx1PZV50/hjkqD2ZF4hqC6AUTItOh6sUcTXa79Lc8N4XkTDzxRATGf5nEWsrXZFhhR35vu4ybUO5CLyM2QFeoO8sDwYcypRueCGyEZCv51Rzee9mCgyYyuatij7fWMhgW1AUvBrZEM4ua+ufvHrJkRFauI9hFkfmCBL6xycDRCbgMs3sBAq8T70gEHDLkXLmichuC5clAb+MlO+EsBWN7iHymWPvD3XxNvJWkzey0AJS64W2L8whWNGnzNigOM5Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:12 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:12 +0000
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: [PATCH v2 00/25] iommu: Make default_domain's mandatory
Date: Mon, 15 May 2023 21:00:33 -0300
Message-Id: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0025.namprd15.prod.outlook.com
 (2603:10b6:207:17::38) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: c562a445-3a38-427d-dbb8-08db55a0a354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FNsa0U+/GkuYaFXLpWhRdo9sAvqZ7mdcWOE52wgko43mNtg/7dbonY9b2Cek66gOd1Sg+eA3srqfSYipFjcUrzsbwnMz1BcrzMA3yiy+ZLPKt+z0t+tDQ3T7cYyeo9DSNauIl1U8aOuWhc7LQ8qRm8+LfPAymwKyaDlK7E8VZAelrtzoDBp0bcJmCrPn+/GJN0ngu/dM+2wFvUe/Ntu3/70N4g5pEC0iHjJfeWMucTTNO2vQapRiP2vrz5Uua1vQ9IFAu0zRAK9SNHMO5f1WhulCDxjVVsldet5TduP56U5hpBnTEO8WTF2IX/dxRjzEgw4ghQwkM1XTtRezALOf2E5CG9jG1LcTZlPcT/YTmTDexvz76JrGRRunrLiSGCx8ne0R+CJkn+Nnm1K949USFYmMv5q1eNdAc+I4AVAUnAII5JS5XS39woymAzmEi1+nPDt8DwPtpR0JdkZY/gHK+u96sgJfYXi//RiFXZ0YeVux4AfuXHyf6OwJhJzdOCf2sXR0CJxAGqrcY/BEKBZO5saDB/jMi/N7CfDkcNY1LtQy8g0T+hY1bUOCgvA5jJYX3HwrcpwsvOjaIsfRMc2wFNXJP3XtV8ISK5psMIQK290OG51FGe0eZ5+JfqD4Y1L+FdXQLN86otbJBKLko5FrLgM0p2LHdqccFuNgatclJ0OJ2ph1g3kN+yN28qY/CbugPgv3sqOp38PnavadoilPbQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(136003)(376002)(451199021)(36756003)(110136005)(54906003)(478600001)(38100700002)(41300700001)(7416002)(7406005)(8676002)(8936002)(5660300002)(2906002)(316002)(921005)(4326008)(66476007)(66946007)(66556008)(6506007)(6512007)(107886003)(86362001)(26005)(186003)(83380400001)(2616005)(966005)(6486002)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?CXATkejbYba9s7hg1VlQciAZMwmVHHCy7JA5Dd9AC2ps9Ez1GEcXsOUtnnci?=
 =?us-ascii?Q?Rkf0l020/5tkXXbV0uzCeSAVD1088XAfTYoVxTXqApZJYLtfCAK8b3z30tN6?=
 =?us-ascii?Q?rTcv4gcXZy+yRsP5/BiCYEuQOB76shTgc9w354KUvk4QDqQURE0insvOLqVh?=
 =?us-ascii?Q?EpWaVMogNiuKwfmowiuZsg2fqGELOliHlPuLywT4+e9q2nQG1cnABXDUERR2?=
 =?us-ascii?Q?qk3e9L9SThEiXokr9Y/XI+xjaDplaKiv+uA3yZzujPQ6USSrKVWYjcbNcngD?=
 =?us-ascii?Q?5c0oOB+DG/ocokEtEl1EGPz5o41Gjp1t1NcZp6UMPpufLpn+awUhzqadYRrL?=
 =?us-ascii?Q?62XeQa3sdBTGlFgWBkJc6KCK+HZMAfVg8KC5vF9yppRT0ahRiFDeYXwhcxHc?=
 =?us-ascii?Q?67q5Gmugq9Wkm4YuUqCbiglH3yrAJtbqJcLZjlWyD5CCxXnzUIO/4gc0txqf?=
 =?us-ascii?Q?RvkmbFZqPPr3icLfqsiR+MBbBrXhdV+YPJ1NgeS69/IFn/fwepPN0Fr/MaaF?=
 =?us-ascii?Q?IlJnaXSmPFLSOLKRUyQLBsfc/+LlWFeblqRX6ZSroehiONqJO7D+eDb+cwxD?=
 =?us-ascii?Q?gERb6WrMc6gavIjqZu3AAemkF5iFCUPqk8b1y7eL6yL0vRqKvcQTzSKWZb+o?=
 =?us-ascii?Q?tFah7Mdhnou2maLuIuTtPKOEgrt4KCXwZkvEvhXEaDSlTyUci9D3RL8RXw1t?=
 =?us-ascii?Q?GeIFBfMvY6F3KKuGrsUzPu0gY6Gv5OrItjJt2sRDnd3z20KCMFd3hPZIA8wL?=
 =?us-ascii?Q?w8sbzJ29V0cySosW4aYAwOvUCCoIqBTUjRUTLdyZvn07xJjilsJ68XYQ5KOS?=
 =?us-ascii?Q?inufQZUDhmm1l4ct/hLWQf+R5VrH2aYp3A5dqXY+5kc4udydmHFvHgJBJCzd?=
 =?us-ascii?Q?MX/TY1ef2VProc7WoaRLYmt3Xg7J1RX5uwcUiOhb+RWSyEdJffHUqivRbxkH?=
 =?us-ascii?Q?5JR8WsG+MGeaJfghcpZbtZ6uZ6GsfPeH0DBBRBiu43BLTISr26shnLst6ja1?=
 =?us-ascii?Q?aBm9bBD4dZu4BjDzes848LYgNwLAvqC46Pe348GQgqj9Sc9gIJoZcDHlaXAQ?=
 =?us-ascii?Q?shpYt2KOBWBzuZ+MNklpD735QmEXGw0giGKbMian0C3DvIu15y2wpRiPUvc0?=
 =?us-ascii?Q?8T6nlqYb7rVzs643kp6KvGiRzClXIOIgBOshc/cd3IDX4hdHWC0R9kB/pS53?=
 =?us-ascii?Q?nXnp7ySWRjEFIBRQTon+v7fgjAz3P/oF0C3f+IGurFz+rY9OrssHVFZ9woUb?=
 =?us-ascii?Q?OTLnb2AKvniFVhh1koWqCceL7G/hzejUuGY+9yCPXupIhpACe8LFfkBXqNHF?=
 =?us-ascii?Q?Ds4sIjHmTEL0DzhUfb4oaezqDYVjw0pdJ7z3AwARXLjOS8qTDqesdaU44XBH?=
 =?us-ascii?Q?JyjEzSzp0JC/fRDHF+RWUkczJOheLFCn2wG58WyPxPg9YpAqUQOJSuGHNXJR?=
 =?us-ascii?Q?Ez3gspPZMLRe+TdyOxq+dsCNE+n3qiVhMtmVdxOtKLbSe7DvbuW+ph1prvcV?=
 =?us-ascii?Q?pxYeSSPZiYqtlxtKWdBEncb0I8wT6gFHwcIZfI1B4zjjQnm5fyR5kCj7+NT1?=
 =?us-ascii?Q?1OHGupRD8+2n2vhmEYbZV2K9v+EhDaOH4ATwS1PT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c562a445-3a38-427d-dbb8-08db55a0a354
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:02.8548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvyKTkCh6rOFcikOl75JjcipOO2nxcV6Q8rlLpW6j4QS/ppoJeB7QEjG0BRqqx8Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ There was alot of unexpected complication after rc1 with this series,
several new patches were needed ]

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

This follows the prior series:

https://lore.kernel.org/r/0-v5-1b99ae392328+44574-iommu_err_unwind_jgg@nvidia.com

This is on github: https://github.com/jgunthorpe/linux/commits/iommu_all_defdom

v2:
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
  iommu/tegra-gart: Remove tegra-gart
  iommu/mtk_iommu_v1: Implement an IDENTITY domain
  iommu: Reorganize iommu_get_default_domain_type() to respect
    def_domain_type()
  iommu: Allow an IDENTITY domain as the default_domain in ARM32
  iommu/fsl_pamu: Implement an IDENTITY domain
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
 drivers/iommu/fsl_pamu_domain.c         |  39 ++-
 drivers/iommu/iommu-priv.h              |  16 +
 drivers/iommu/iommu.c                   | 263 +++++++++++------
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
 28 files changed, 622 insertions(+), 807 deletions(-)
 create mode 100644 drivers/iommu/iommu-priv.h
 delete mode 100644 drivers/iommu/tegra-gart.c


base-commit: 0b355ade2baf262f213da274411c0e05d8232a21
-- 
2.40.1

