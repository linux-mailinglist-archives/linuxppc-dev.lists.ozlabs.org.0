Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 679D477BD32
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 17:37:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dYc1fPxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPdn84np9z3cRn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 01:37:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dYc1fPxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::60f; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPdmG0JF6z30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 01:36:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NLMkkNx51ihwWXUHKbIQ2FmVdDVkKSzhH6xmtt/6SAvRwxUnhebKdPNNABAEc4UfHD9fFQONmjfI7UgGyKLU72zzY2DaktFFpvDzc/EBTkCh7WZH0Wd6K8npgJxt5yxIYoJBf71IO6Eyr8aIw4u/wuL0AEY/kk2jtlIbd+ujHCIQtItvBRtrZ6egYJY+IB1ImXVnsQ7QRj5dH4US8Gc1lmwIH+7O68F8YGxwPM7mqra9tf2qqPLL9yYjidH/gLz4/BHm++sZg7PnfLlUj5QTA+GFfiLNCXSUi8OMkjFu29Z1VoZMBRKg7mjyLCgNWXzjcLVq7AGyB80oAzV/MGb8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKcBZZSBmJ7WmN4zNVbNbtNajuWTqmaSwT+tOTrOi1c=;
 b=ZPkQcAP+wFbb0R5UVK1ZZNoZ73C/6NsKJ9Wxz/DJOBzKY3pUxql5xuopvjKSXm9CDofsjCyTiNHKBXHhm7cB0kS927p5rwUwhLIc52h5lyovnjRjSV04B9LCnu0wf0BARfl7fYnmkMsGn3QKZgZffomcs8rZ0PpIVjQwJpGwuxZtUozEHF55hgO/cj6QMKCn3BYmfvFnju1rj/aSnFKkBJkVKGUEhE/ByXHsbGJVmiiMdTvYNZhY8pdlyuQ94buEMsw3iYzWKKCOfye+KGy3yyZru94OfMeHvW4EW5Mn7IJBLG5mpIPhNBs2uLT8yvbE6APvCnhjq5WmtucgsUcYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKcBZZSBmJ7WmN4zNVbNbtNajuWTqmaSwT+tOTrOi1c=;
 b=dYc1fPxLqm0cCvGXm+WKMRVf4pP6uGe8PBHrQzwAZRykcrHLWf0Eyuf/hJwa7gNMYPctZQNJ6YdRdF1/7f13n40bKmdSOAQr4HoCpjQAxqJ1POE+GcRxmS/mhNwWEI8theanRxaaIih53gqNMRaIsRWKf3oUkZ0l32ZQln8Mt2FufUtFscQPEtwZeIfyQ7elLEYwEj+odIoo29zyFLpOqdvrIp+io5YZbvsUxx30KH5vxea0VdKZWwgBgt0Y1eabpnN04KKb58f7NCbVUOwgpjbsnfXN/krEhsJXYx92qKOqUcKQ3bFvQIj1ai+F763sENLZbnz2qczGrMwjCSwqWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 15:36:09 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6678.022; Mon, 14 Aug 2023
 15:36:09 +0000
Date: Mon, 14 Aug 2023 12:36:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v6 17/25] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <ZNpJ5irR4XeLw6qG@nvidia.com>
References: <17-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
 <8cef9a0d-15ba-f8af-7e22-d4d3063c97bf@linux.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cef9a0d-15ba-f8af-7e22-d4d3063c97bf@linux.intel.com>
X-ClientProxiedBy: YT3PR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::34) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: 600e8427-f6c3-4c7b-6722-08db9cdc2e43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	McCwXnCJTor//4T5eGu/kLiWrYT9B7SsLP02t0bHO/0Vi9t69v6FW9OaFCOTHFqJdcd+ly9AW0ErZHUPMChztl459xQtBxL9Dyj2t+Ni7ZWH2QtnXI7CUFvDbaIBRsetKvMnNlnIknFAZbhukelvtUArc6WlorwsKhIUqTt31qjGtT05ZpiGjlI9FBZSx959jHfpWjrqce/jI7/zLCIKblECwwjtbWD03HSfsJ3+5Ma3oeW36J+GIMXo6bNgILU/T7A1GQP2AFYl8061KbX9Fiqt/BDERsqjz441bTl9V6MqJ7mJjoblSLUz0fflDnxXmwOMCQaCbS4W5eWsUG4EjJo/EfEMwvNpSTq7Q+f9l7XVEb26oFM72ZwbnS5dpCRfvGJgyVFkHxQ6Z0BjalDummbuuTl4nxo/Vwu3ktjMDZgvFVH8QB/UxsUeo69RjABNQPV6180NOn6ppNKGAGA7z4qyzXq4Nt2i78RxrCqOd4xoZijQvzjPRChIGUKEO3z3QhQW1tZjfeANeff4LiqfnCeCxYGTwez//KZVEXMWYTo50ncSghPEC2ssPhOtUGNETyXPeRQqVbW3ZI2Jnbq/9Me1vESQh4Mc+cTPo/2H1gw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(186006)(1800799006)(6666004)(6486002)(6506007)(478600001)(83380400001)(36756003)(86362001)(2906002)(7406005)(7416002)(6512007)(26005)(107886003)(66946007)(4744005)(2616005)(38100700002)(316002)(4326008)(8676002)(66476007)(6916009)(66556008)(54906003)(5660300002)(41300700001)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GY/kMsYgcmKrTRvwXX8pktTiWxET/2fwE9IpnXVAHCrGGzeEFIlOcEIG+CCh?=
 =?us-ascii?Q?oi6y2O3BtI+qDFbhIMJ9ihPDu3prP+mGTOEb9K1NBH/XIpp4qvhr5veoZH0j?=
 =?us-ascii?Q?khUQZS9NTucukIQgAibQWP0ZcI3gGZHxy1AuCOJPT1/sNm/qjY/zkZKc5TcC?=
 =?us-ascii?Q?ISXO4BzaqUVPO7Q7hS/125Xc8WAqlYmxb8WOKAdp3+86EzzAeamrfDZJpUSg?=
 =?us-ascii?Q?nktdPtueoGx4uHqbSfktudOnsscEZqedpOqS71LgOSIaM1AV1q+6JPC0JGGo?=
 =?us-ascii?Q?yoZjhzHn3477qMZG96Yn8etacwIQBdxbiwQCnG1j+bJv6WyRUqVVgky0RogG?=
 =?us-ascii?Q?+cgBokfw6Oavl9ITygj0qKu8jJU2OHpUFp5BqU+24gDpiXoLqvqaNOb3J3nx?=
 =?us-ascii?Q?sCgFrbCLDtwfGSB+eWPUj/QQ88qghRIXi4Y/cJAD35e0Q+0wT18w7h5jslJI?=
 =?us-ascii?Q?ImqwjqIyqoxHl1dNRC43tZWz5wyPdcibh6rCffKscAyyRpgzFpfVp+EZTGoI?=
 =?us-ascii?Q?b8ywXoNweerQhP+QigmHk0WKQRswMWPBIoxcQ7hUxvTnEzFBfbGpssZmnHr2?=
 =?us-ascii?Q?ab55/5LttlqNyGzmYg89/X/wBqRYioSXgSPcm5IGcgacq8YYIq/XK0lJt/Yz?=
 =?us-ascii?Q?IjHWUf4X3IvS6dDw0gpEd6ySPJTCCDqgxfqWYJsgvrCw06jY0mKi4SOR9u/Z?=
 =?us-ascii?Q?JAyIhiM6zB4WKGzyibWDJuWMBHrBwe/+hFjTu0SA1CZVkVTtMnzaL/OI5q7q?=
 =?us-ascii?Q?bYotk8OLGpiiKfX5G0RGiHYm/0fvU1DeHbozrEH4rI+3AwPPIuGvzv3Ddci/?=
 =?us-ascii?Q?ijAx3GCGtdIYF5AKwaJy1RPhvcyJVeIJSD0r6vh2aDoQdDkkMjynT+zy+FR9?=
 =?us-ascii?Q?Vs2OKohtZPsgvx6NR6ZIJH6TX1vG5Y3XkVTVkXg7Xywnvp6qaQHA/uFlndI9?=
 =?us-ascii?Q?A4ketpHriiWyrHr/6GFw2o+YBelT6rOCpogMOs6v2wwjrIZCoh+0nwKTPpI6?=
 =?us-ascii?Q?od1WaQ0hCSTW/8Phe59JZNrjxnAHYrK53xYLZUykJch3uBl8Aea0PgT2wVD1?=
 =?us-ascii?Q?pOSrFjClncq/QfZNVDctIJ6odCh7F8fUM8uiaJ8SN+mfaEYm5DvBv7x+WaSz?=
 =?us-ascii?Q?DM8ykiySdnUup0j+hGV0e6KbTRnQVQ74LjY/wPAV205PTzPi/rfNdzDLhYre?=
 =?us-ascii?Q?mGv1pU+q7DPGlDMzwe8sa5+heDZqmTtOhAQZs3Ufj5ybRPYVKmjHsM2pGksz?=
 =?us-ascii?Q?MhJvBSWHE7dfVc0fTu+GyrmMQFLSIfVWzhCp1S5cxoeTlfMe0r16QIjF6HKV?=
 =?us-ascii?Q?np43l3z7Q8Kr7Bi2LyFMr1baLu4mWRqTEAKkUraeMN/3dm+pvbn7SGVc3ehh?=
 =?us-ascii?Q?5FiIFZea9Fi4lTht8sntv76huIcOPoRq/dGUccD4RVr+FKljSU89W8CKUtez?=
 =?us-ascii?Q?0o0Sep7PbXcYnPCa59bUEezCqly2oJYHpK1d3TkRpquDt0/L36cnPJU2WObo?=
 =?us-ascii?Q?vWAs2+i2mu8XQQ7ih4tIFQESExHcyJdL19oe3BSmE4vcVvsInMmn/ih48wgw?=
 =?us-ascii?Q?zUhbgJZlZ/0oi0rUwLxZxJDyIdVyJWtlbFdqX+Pk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600e8427-f6c3-4c7b-6722-08db9cdc2e43
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 15:36:08.8340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vOgEwsXQReKrPcORVQmW06GxsAyyn/59hb0MYwXgoLDwsbCHwRGeeJkYFqFuqBz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356
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
Cc: Heiko Stuebner <heiko@sntech.de>, Matthew Rosato <mjrosato@linux.ibm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Holland <samuel@sholland.org>, Joerg Roedel <joro@8bytes.org>, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, iommu@lists.linux.dev, Andy Gross <agross@kernel.org>, Nicolin Chen <nicolinc@nvidia.com>, Yong Wu <yong.wu@mediatek.com>, Orson Zhai <orsonzhai@gmail.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Thierry Reding <treding@nvidia.com>, linux-sunxi@lists.linux.dev, Rob Clark <robdclark@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Niklas Schnelle
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 14, 2023 at 02:32:33PM +0800, Baolu Lu wrote:

> > +	pm_runtime_get_sync(qcom_iommu->dev);
> > +	for (i = 0; i < fwspec->num_ids; i++) {
> > +		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
> > +
> > +		/* Disable the context bank: */
> > +		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
> > +
> > +		ctx->domain = NULL;
> 
> Does setting ctx->domain to NULL still match this semantics?

Yes, I did not try to fix this driver. NULL means identity in the
ctx->domain.

Thanks,
Jason
