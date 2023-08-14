Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B48577C3DD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 01:17:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TjAc3yZL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPr0T0w9vz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TjAc3yZL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::60a; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPqzb6ddCz2y1h
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 09:16:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVQ4FO/Enqh/VKPzMVjzsfE7yrJApq3EH2WaYvnn/y89+eMTlPLbrJdG+2Rzjet3Eqe5Xi+drGyp1KTqF9Uil8EYAsScf1yymbQFlokMXHw6aexKnbAjIQTcwvdseaUXUR2HmLT8/a/kJ4LwzTQvO1rYBOlquyfGfy0K0ASMUJM+a+92z4XhS+MRl3YtEzyQSZlFJDwMTwz8xcEofj3sUGWRw+UqLu3ChPEusjTtS04y0XwQ1T+vhc/WgEuDMETMrXSUg4x71rNYRoHvcgKjQzvOgqrMAfeLCAf3fErMq1yn0L3LWj2LEdThW0p5fqLaa04ZrvFR9Sx/zCNLuNCiuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZjGfzrH1eClK/mZ5X0Dt6S40ebi5fILUHGMVa4uvhY=;
 b=E/NOGQry6upoUqNydsnegyGhpdqK9+z3SWSVGUWrQMLxXhs7lLvcV/VuszEjBH70YOqNw66Drwq4wHGDpKwnoTEyStXuT4W96ovREPQp2lZf+lqmvRhBfxk4/lGrKQidxNNkv1+TJQCAICe+hWBfCasxpBtmlxTpyV3QA6uddIXUOsI+WL3JeBce+VMq0vvtDcLQkc0W4OEKVgCytV+Ly7SwUKzvRuSB039651zIBuSSepaEpZVrIloxI2TpjQKIivTQChFWaUSNkwLed/kJBrkTqlmQpARpdyQfhowFA9YzCmoUMpXBkM3lp+35DEcYwOzkg/ir5q4jnxnEAUEO0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JZjGfzrH1eClK/mZ5X0Dt6S40ebi5fILUHGMVa4uvhY=;
 b=TjAc3yZL058jLy5gCSoKsPon0/ZQ9h4Kx8M4MMU/j3GUKqvP5hQpEX7ur67liz9JK9z+lc/15zqBc166o3JrXTKNAw11PSoqz4WkqCF925Br1p2sJ586Jbsgqa8uFnrtZRRkLr0qoeSn6JxoJyw2Lv5g9YGqXpqlXu7Dvyyi19u8+9l2y5joZ3afI9zMF7sVgZNNgr3upYMmEGLtYeqBM1fDoRI5IRMnl8uQHtouXId1eB6siavaeXmxG7tn9GwfkMorKD4Ym7kyTP02Vn2kSSlH0qvcSBImM1aNfIbcgyGpFPTFeSTYfuEUaXRrAG9VJtUq9Ehj61SVdqA7FvtHLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SN7PR12MB7451.namprd12.prod.outlook.com (2603:10b6:806:29b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 23:16:35 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 23:16:35 +0000
Date: Mon, 14 Aug 2023 20:16:33 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH v6 15/25] iommufd/selftest: Make the mock iommu driver
 into a real driver
Message-ID: <ZNq10UxCKerGqg5O@nvidia.com>
References: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
X-ClientProxiedBy: CH2PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:610:54::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SN7PR12MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: ae27e0cb-6672-47a7-3510-08db9d1c80a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PfYrMl9MfAoGN0AM2zjvB/rGvB+UMB/j74zdvyUU7zB7joXEBFu4bYARPZTtI2Zue+PPoN6QESezYSBjQMDx4oVHxJ3XW5yT5FBCBTf/u49XfG6YdfVEt44IJWD7jbZL7jC7mT4/vhQ3yznjCCvugiF1ZPOSbWtznYrJPT8k9tWLDXxWy3tKtuDSi0aQg1UycpwXbzTdpYeJYsBYoQEustmdysf3/IgiHgYw+sMmu7G/SpXH8ztxex8zTXVn3sqaQRrlwCN4C4Ibj6xhvpckDbAfqxZQD6/9tecKTm2WmP53HCpAy6xekTawkhBRaHBBjqm64Pz6ynh1kW6RRTGB3U9fylVj9hJ+IOmeyr5T4Zzhk7lp623joi7Wr2evEixTm/2ZnZH2azu8J1E6cllfFcE5Bct5vPJP0af/pzZo+e463ANj/3iacuDIkGttTRYxUTIiVvB5sIY0fOpjs3L9XfpeMDvq/U1C42A5zqb6i8un0uEb9p5a7UsxAK+v4sMpQEEDKYYlb0CFRkM3LnTl49Jl6WXa1jskgybsgv1uNPSi1ezshZqRPYm4jCbkWVC9H+u/uDHZr+kbaIF8Jtp/e4zXU88i4IYB4mQdZ3+CGaE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(376002)(366004)(136003)(396003)(186006)(1800799006)(451199021)(83380400001)(36756003)(86362001)(921005)(41300700001)(478600001)(66946007)(66476007)(54906003)(6512007)(66556008)(316002)(8676002)(110136005)(5660300002)(4326008)(8936002)(38100700002)(2616005)(107886003)(26005)(6486002)(2906002)(7416002)(6506007)(7406005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?m+wgfV/4zOEh1RJN/JFaYwki7nBxnXUrSAlBXx4hvMW0mAlP2cKB4RqtruSj?=
 =?us-ascii?Q?O1mTPhRLpBvRPWX7khThoFarjLGlGMRgBo0+Ro9hFRi9PEn5X1PEChI1ykM8?=
 =?us-ascii?Q?z+CxMcjmZ+KqV29yDnmdoE+JHNWPfRGjns00wA8RpYO5RC1K1DtEpnD0j05x?=
 =?us-ascii?Q?YT0Mb0wjc3WEcqP4HPVej5cv+UcIIRIfqUaC7oDNRBr4AvEAVJfj1JfajLca?=
 =?us-ascii?Q?QegaAycQtPIZ2UGsNMCH48u319gdm9Y1av7yAbuYzI44tgh2KciXGQWp7nlf?=
 =?us-ascii?Q?4bGbQDjWLoSXESmJOqnwwM8wogFo69qTYlp/DA0GCd9ouZ0xHAVwApx1uGfF?=
 =?us-ascii?Q?CCEshwKf1mPP1VC5g7DtytOFHXq72lQ/IyQC7Y/R3ljVS6sM5zxKCPnHTRZT?=
 =?us-ascii?Q?B6lieRORsvGpyzzDTQEeqLL7pxx5kfCCYsANboA0feUXCX7ELS2LiXHc6e0x?=
 =?us-ascii?Q?/LHRoH7baEOxRYWPFmQCJ0KtphnkoS5XDWKv0OlyoTsGwFX0SaSpCEnu3eWW?=
 =?us-ascii?Q?6ImJWn9N4n+5rXgDKyY76E/5CnSvjgjEYvbqJVpTwqWwsEENEKPViaZKbdl1?=
 =?us-ascii?Q?RuwfyWOjscXgX4z9gzR18kV5cL4kKZKYhJZw4raSWiRxZSisg4uZ9iudk3CG?=
 =?us-ascii?Q?HQ14/YmtEkJSue6MIdA04WL7Mr43Gea8Y+2usC9fsIig76eHVFaZkRT3Ho1p?=
 =?us-ascii?Q?plM+Pfxxp77Abvc8wWC/QegcKF9e5SwfMxacemYLSB5CX4zuLrsbxKxVv3RF?=
 =?us-ascii?Q?TFTzZKFulcHz69pgTIB1fi27tFpHfy6081FM2DrLdgbgrTWvIIVkR5W3hAU7?=
 =?us-ascii?Q?VfR1R1XfW9dBIsp2wUVUU4huJPZQjlDWcZZLehqRWeIX9hKn1y9ZPfKeq/cT?=
 =?us-ascii?Q?VASC029a5X0BkyRV8xCfiZ4zOlB7ogmrS9nJbTxlDdBeJOwhS2OfsOG6Kq5/?=
 =?us-ascii?Q?N0UwUgHdcVzUfLH7ThCvR+XKlYSIhDRJzC8tHgN8gJvCoeD6E+ZQyc0S2zbJ?=
 =?us-ascii?Q?FO7LitSrE15lhM0RO90UjV8KtK4L1a7Qod4lwQYvxdBs8U9NRdEznGuqYhvN?=
 =?us-ascii?Q?b7/a0SKPJ0K1kmgWqwkKE2mHrx1DfYTSXBx/rO21m03v8Wqkc8Kq2ocGWaw8?=
 =?us-ascii?Q?8anFI6DP8AJ22FfXZ6W3BRO9aMRlZyEs2ia/ZVNu+55Py7//fxo2u8cDUrCl?=
 =?us-ascii?Q?K+a79IbvcG+vdHsgEHE7qE/P/h5Kh2vaaxwYwvjZb65ZKNrM72kt7bUcPZkX?=
 =?us-ascii?Q?VwpmL8xeh01osof5564dVTHmKbEDKRSkc7XtWKvNUfyfio1+hQ+aYvks7Sz8?=
 =?us-ascii?Q?nFnuvCHEN3oRrKiSL2AglZx/9Kl/YnzepizY8SGy4YR4tvx62IzOiVLZg9cn?=
 =?us-ascii?Q?Glyh1NDL3lfRyIQAhf39VmByy7iM1J0SM+Hlf86y4Zpe+Fup7l0kAf/SIw/4?=
 =?us-ascii?Q?u7PsGvIFwvv+fTQZj4DUpbtOLpxO1BzAkYhvJqbFjA9jrEvKOQkEzouVulib?=
 =?us-ascii?Q?rlUK9Lvz9uVcU5tVGdEt/T7qCeKgR0f0Q0xV7YfYVYPaZXbWOYwEDglUMMp+?=
 =?us-ascii?Q?2avF73qK83Qyi+P7ciwIAtiYWz3/DjK/wiXBSGVi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae27e0cb-6672-47a7-3510-08db9d1c80a2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 23:16:34.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXOO3M95Dbi8AYsMMbSx6l/KvHgkGJ7WQ4MzzlxPcW9UPtpbZ3KGuCGmLVq+5BvB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7451
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

On Wed, Aug 02, 2023 at 09:08:02PM -0300, Jason Gunthorpe wrote:
> I've avoided doing this because there is no way to make this happen
> without an intrusion into the core code. Up till now this has avoided
> needing the core code's probe path with some hackery - but now that
> default domains are becoming mandatory it is unavoidable. The core probe
> path must be run to set the default_domain, only it can do it. Without
> a default domain iommufd can't use the group.
> 
> Make it so that iommufd selftest can create a real iommu driver and bind
> it only to is own private bus. Add iommu_device_register_bus() as a core
> code helper to make this possible. It simply sets the right pointers and
> registers the notifier block. The mock driver then works like any normal
> driver should, with probe triggered by the bus ops
> 
> When the bus->iommu_ops stuff is fully unwound we can probably do better
> here and remove this special case.
> 
> Remove set_platform_dma_ops from selftest and make it use a BLOCKED
> default domain.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu-priv.h              |  16 +++
>  drivers/iommu/iommu.c                   |  43 +++++++
>  drivers/iommu/iommufd/iommufd_private.h |   5 +-
>  drivers/iommu/iommufd/main.c            |   8 +-
>  drivers/iommu/iommufd/selftest.c        | 149 +++++++++++++-----------
>  5 files changed, 152 insertions(+), 69 deletions(-)
>  create mode 100644 drivers/iommu/iommu-priv.h

Since this series will miss this kernel again I've taken this patch
into the iommufd tree to fix the broken selftest.

It needed two edits to make it work out of the context of this series

The core code still requires empty free functions:

    +@@ drivers/iommu/iommufd/selftest.c: static struct iommu_domain *mock_domain_alloc(unsigned int iommu_domain_type)
    +   if (iommu_domain_type == IOMMU_DOMAIN_BLOCKED)
    +           return &mock_blocking_domain;
      
    --static void mock_domain_blocking_free(struct iommu_domain *domain)
    --{
    --}
    --
    - static int mock_domain_nop_attach(struct iommu_domain *domain,
    -                             struct device *dev)
    - {
    +@@ drivers/iommu/iommufd/selftest.c: static void mock_domain_set_plaform_dma_ops(struct device *dev)
    +    */
      }
      
    - static const struct iommu_domain_ops mock_blocking_ops = {
    --  .free = mock_domain_blocking_free,
    -   .attach_dev = mock_domain_nop_attach,
    - };
    - 

And we can't use default_domain so rely on a NULL default domain and set_platform_dma_ops:

    -@@ drivers/iommu/iommufd/selftest.c: static int mock_domain_nop_attach(struct iommu_domain *domain,
    +-  if (WARN_ON(iommu_domain_type != IOMMU_DOMAIN_UNMANAGED))
    ++  if (iommu_domain_type != IOMMU_DOMAIN_UNMANAGED)
    +           return NULL;
    + 
    +   mock = kzalloc(sizeof(*mock), GFP_KERNEL);
    -@@ drivers/iommu/iommufd/selftest.c: static bool mock_domain_capable(struct device *dev, enum iommu_cap cap)
    -   return cap == IOMMU_CAP_CACHE_COHERENCY;
    - }
    - 
    --static void mock_domain_set_plaform_dma_ops(struct device *dev)
     +static struct iommu_device mock_iommu_device = {
     +};
     +
     +static struct iommu_device *mock_probe_device(struct device *dev)
    - {
    --  /*
    --   * mock doesn't setup default domains because we can't hook into the
    --   * normal probe path
    --   */
    ++{
     +  return &mock_iommu_device;
    - }
    - 
    ++}
    ++
      static const struct iommu_ops mock_ops = {
    -+  /*
    -+   * IOMMU_DOMAIN_BLOCKED cannot be returned from def_domain_type()
    -+   * because it is zero.
    -+   */
    -+  .default_domain = &mock_blocking_domain,
        .owner = THIS_MODULE,
        .pgsize_bitmap = MOCK_IO_PAGE_SIZE,
        .domain_alloc = mock_domain_alloc,
        .capable = mock_domain_capable,
    --  .set_platform_dma_ops = mock_domain_set_plaform_dma_ops,
    +   .set_platform_dma_ops = mock_domain_set_plaform_dma_ops,
     +  .device_group = generic_device_group,
     +  .probe_device = mock_probe_device,
        .default_domain_ops =

Otherwise it works the same and solves the same problem. There is a
small merge conflict with the fixes in Joerg's tree around the
bus_iommu_probe

Thanks,
Jason
