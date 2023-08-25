Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E6E788DE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 19:41:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bOByqItZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXS1G51Ylz3cBK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 03:41:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bOByqItZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8d::628; helo=nam04-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20628.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::628])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXS0P2tVKz2ypy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 03:40:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=earOp9wCjbvXhNpxjZk6iiF1c5jKGxaHfnVf0WMl1z1Xaxeq27UJk8/RlIaGp0FYbWFN3iFZ0CPvBVTJBGB2SzYSP5AaGgHwpBCbpwtwR0Ep8I7xcg7b1iXrj/H8qFhJVOzdLT+YsigkHD5Sm9LMG6nWZyXNR7ck2Ht05IZVeTZ+z8ngPGO3iNzdIADnU54tTXThbLxcZoc8Qk6HaSYKYbjQ7IF2fN6JmM+Cwa3VZzcTJjhPBQJCJGAmRBWg9Dydgs+QWeQOcSDbBIykWrZ4DONfg+BIm37LRjwOBx7LB10RVBILNnPFEoMc2qcRRys5l9Ye3irQ5DeGzW5UBJw/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OimMWhjF3ieb++tVHK4fhFxIVzoG4uTQFZmSsIrjuv8=;
 b=P9hdq7UEBhwu9Va4C1XThgQhBmo8qzUkf2+BalVJ8QvMcy5Lu1kRfFWwlVCcic9/GflR5XCnAAaBlPvuSjZQ9A/pIwjrpr3wxK0UPtZBXWHUmyy6vU79fUWgJNyH7Fe90V3x6b9WghR3vXRoJkKhhnmF/rVh0/ZQAm8lBQYGDw7u6snPfdOc1HsQJbQIuJCyDlH9CnE9UA5DVRklrYDWPJdeOPV6Jv7q46rztsnE06x4FZxJetVWRhc45HDIAAUdzqYli9wiSy4JDzPNYg92P87m57uH7CoP/jqU3cKlh7116WL5avy3ROqEDcnbkZopSOJ0lg0MfcunjqKOA1Yxrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OimMWhjF3ieb++tVHK4fhFxIVzoG4uTQFZmSsIrjuv8=;
 b=bOByqItZSNBSr5J9I12IpliLcN6gb8qorA3kBFiAdHzE7OmejI8GAaLgqMpisO9lg6S1gbz/Y1FwiB28/ezSKqAwapV8/t9zwSD1FkVfR/7p6ZUOk6r6wQEx6c6uj5aHQ00jjXMBiH8YVDn4ISH/5vDxNFfgTk9aRT1Wm6rzH1i+LUJfQc74+X56zsdS7ivUqxrCNpGJi9a7Wc0I1izxcrVoTMruHgHwQSOBEXlXU0C2HPAdDlC8S2B74Rem3rOwA3zkh5f7QU+ohyTKo68WtLu00gsJ/LXTJIUXKJhFQ/CbZOAdj7c8MJUHHKCOp8Me3MRvl7NBYo1dVlguWcnncA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 17:40:13 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6699.032; Fri, 25 Aug 2023
 17:40:13 +0000
Date: Fri, 25 Aug 2023 14:40:10 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Jerry Snitselaar <jsnitsel@redhat.com>
Subject: Re: [PATCH v7 02/24] iommu: Add IOMMU_DOMAIN_PLATFORM
Message-ID: <ZOjneiqLzRRD7ulL@nvidia.com>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <2-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <hbmfqpq2oyjjz3loccfbslpalzhlsyr2w3bpx6qasq23kyrfso@e6kry74ifgnt>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hbmfqpq2oyjjz3loccfbslpalzhlsyr2w3bpx6qasq23kyrfso@e6kry74ifgnt>
X-ClientProxiedBy: SJ0PR05CA0141.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::26) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 58786a3e-aa3c-45af-dcc2-08dba59255eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	a8Gnigr2aF9SIPJCrxuBJK0DSHHSWMBbcxYk0WxAHH+TojN1Gvlky7nyxLoGUigqZx+wWQse5Eif5ixtjUTWxNw9v/ugMBXUFH6ND0qCuEcW2sc66uhLKr000hB29sEehLToAiTtbrDLvgB9LLezXQAJkbL5mcBuM27vGR8hpiHLc0xvDiuDHbQYSI7vflacHe8ThaM5nwDXzuvuF0v37H66N+VRIK/vsAfKSXD8lxYEn44ZLMkfG5cafZvhqjDh5TwZWJrX6YLR4j8eo1w97hRkW3uLun6CdwqPZWly8fBhvcdHwHzkbI2xhH6fh+6t6nn8Jgk1IslBiooHII9xrzoe7VFEzSmUP8snbrSDrDeCLm+nEbgrpy/ux0jCvar5lsqaaqL/ZsmLDMAi5esuLJ+YFl8gBWqM03xfVSmmvT/XRvlwmnLSeuW0/Dfve/gJKJG0JxK+TK9yvPInRO4lg/2ANi2TvXQ9b+ktVpDKTiK9GdEK3Se3Qwcj17nXmn3FoOwl7gEY2mV0uGvJFo0op67WrPjfNH0/1nNJDMDfxlPJRGy7ebPGUaVIVjiOr5zN
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(396003)(366004)(346002)(1800799009)(186009)(451199024)(5660300002)(83380400001)(86362001)(6512007)(6506007)(26005)(2616005)(6486002)(38100700002)(107886003)(36756003)(66946007)(478600001)(54906003)(4326008)(8936002)(6916009)(8676002)(66476007)(316002)(66556008)(41300700001)(7406005)(7416002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vvgV5ntNbJnFy5TerXzlekncoqxnviQO4r6DerMaR7/Xw8peRzERjkiAau8j?=
 =?us-ascii?Q?YTRWOFswON+4fKllm1SrjUXZX4pLpQiXapVA3glR1/fM9N8Bj1qs4ffqBhZF?=
 =?us-ascii?Q?XSwuk6COHMfBSoNhdw7hroan2o36kidxruhSGM28UFBsyWuy55LgWCOwPX9s?=
 =?us-ascii?Q?BBOSbJhmmvE1NbFaSfZNsLzCzifVVKZRALPhkZCzZ6qOnJcjm9eQc+3A1oj9?=
 =?us-ascii?Q?It52NOulwurqZfk23csGiIc3WYS2j3v9cHwU3QiNZeKRkab0bW1FucSMqdix?=
 =?us-ascii?Q?m4Zmbg0GGSK9Nemgc24cZ1hNo46qrLpVVDep8FZxjdGf6VSXMhNV7Y/J3jy+?=
 =?us-ascii?Q?t0hgqAp9Vlyp+nXc5OzPJpRymYwoNHD8RXhf13kaGDRnjlfZHb4nzAzZr4t/?=
 =?us-ascii?Q?DhlcCY23vNG1SFcK5OkTVogVaTZgo7kS0dZhoBmXDwsHyfRxpLR0SsadzUTx?=
 =?us-ascii?Q?7PVSKoMB9epwl9ji04a92GCaVxv1heeNbfUroQIrMyvPn5O9udlZYgb/pW8x?=
 =?us-ascii?Q?pLHUV4daK2vjxfwRPldDcqlENxHVrqr9FoqRaGugEEHi0QQp7wqD/vfeooNh?=
 =?us-ascii?Q?d6XrbBH5VDQKv22/hln8SQtf+SpAZE5APLoziCBPZ36ShGGmRY49X9g1axx4?=
 =?us-ascii?Q?jP5RfcrqATYeFMvilpsdGZqVYZKU+cdHkJF5+T20kW9EPVoYA5jgi5Pa07Bx?=
 =?us-ascii?Q?4GSxCVm2pDuffgCfh/AhO6RUke6ldQz/P5i4VM22WDrpXyb+lA0oLvsK+3U4?=
 =?us-ascii?Q?T8i/9qMXqWfrBBdOV16xiOaSM0Q5odNsD9A8ufbUC6wAqwCiYjeZXd/E72ol?=
 =?us-ascii?Q?Jnhn3TxxRQGeTosqkt0vaQlB9sqFQ3hPIyTHxG6RxHiIaqRTMWPhZ9rpXNQQ?=
 =?us-ascii?Q?g7IgJjiu7byaYZj9M0VeTNCVLr/jMxgz8mg/KVTroZFQM/vAOcIA41pzQtei?=
 =?us-ascii?Q?VDV+VEGmyTCCWwYBW3uYU6D8RV61C2Lv8MGFD9F/Dy2xSESbAKWkYhx1AD3J?=
 =?us-ascii?Q?s2p3TQKoRpAOPHN6sOEReEi1BfCE78EeehELV/TdIVapsK96ovX/b7FCAPoY?=
 =?us-ascii?Q?8OJVV0jevWjA0o84otiauvU0hOwsuxY02Lda3knBRrI/pbg1E/MV2uC0K95f?=
 =?us-ascii?Q?Nk4A/jt1adEHhTvsEyNRoOgqVc7tlqQ2WeiDOheHJHJo+cPZ4yAbyOzwrA9/?=
 =?us-ascii?Q?agi1uFJKwTzqUp7d1ACXHEzfdz0d7pnXhOon6p8qGMjwXHqjUF7xkNlTbFr+?=
 =?us-ascii?Q?B+8/P53OdCSSRhwGvFg/zsLwnDpO14wHNsaJNwyGdCVDNShuv4/+rYLa6ouY?=
 =?us-ascii?Q?2er0IWGnsD/PXHQSvYY8SYu0wRpmApig2zVHMVFtGiRx7lE/SBoqOPzJvuk3?=
 =?us-ascii?Q?E0Q2Py+SENB8FMtyEFKrX4DzEZoTQEcN4ZBxMYyp4owAXD1222aCRO0cDaP/?=
 =?us-ascii?Q?ZhDJ/4G6mdu9JakGiSYrFXVDQTNQMqW7BQEgDIySWAP8keEExA9/p1kxwW7M?=
 =?us-ascii?Q?e/IoAeX2HuRg37EhGM+UiXcbLY9L1EXOueraZu/Jinq8K5h34zk+LqWcqnvs?=
 =?us-ascii?Q?MD54E5k+9Lu2J+Rb5HHttaheDoy+0aXMw709c2md?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58786a3e-aa3c-45af-dcc2-08dba59255eb
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 17:40:13.0741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/lHqPfLm8ZdGGXUSmMC6bjlG6PP0TtcgCXnvFIc/GCrpMVM1mXDhZvZRzMfHio0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326
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
  <schnelle@linux.ibm.com>, linux-arm-msm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, linux-mediatek@lists.infradead.org, Baolin Wang <baolin.wang@linux.alibaba.com>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, linuxppc-dev@lists.ozlabs.org, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 24, 2023 at 06:51:48PM -0700, Jerry Snitselaar wrote:

> > +	/*
> > +	 * Allow legacy drivers to specify the domain that will be the default
> > +	 * domain. This should always be either an IDENTITY or PLATFORM domain.
> > +	 * Do not use in new drivers.
> > +	 */
> 
> Would it be worthwhile to mention this in iommu.h for the iommu_ops default_domain?

I did this:

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 11d47f9ac9b345..7fa53d28feca87 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1757,8 +1757,8 @@ iommu_group_alloc_default_domain(struct iommu_group *group, int req_type)
 
        /*
         * Allow legacy drivers to specify the domain that will be the default
-        * domain. This should always be either an IDENTITY or PLATFORM domain.
-        * Do not use in new drivers.
+        * domain. This should always be either an IDENTITY/BLOCKED/PLATFORM
+        * domain. Do not use in new drivers.
         */
        if (ops->default_domain) {
                if (req_type)
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 7e9d94a56f473e..6f9e0aacc4431a 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -267,6 +267,8 @@ struct iommu_iotlb_gather {
  * @blocked_domain: An always available, always attachable blocking
  *                  translation.
  * @default_domain: If not NULL this will always be set as the default domain.
+ *                  This should be an IDENTITY/BLOCKED/PLATFORM domain.
+ *                  Do not use in new drivers.
  */
 struct iommu_ops {
        bool (*capable)(struct device *dev, enum iommu_cap);

Thanks,
Jason
