Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DEA76DC82
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 02:19:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HyYtDj3T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTwl15XYz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 10:19:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=HyYtDj3T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::62a; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::62a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGThm6snGz3bNq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 10:08:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZqDF+r936W3tHqMRXyqiIQghwocYzqVrj35zmeGIUBWSqkDXGDFYi8V6TKtgC9SyTw9UWfABvwsPDCpbPiitZoehvD01khnhIsuNy5gqQ6N9qiK7GD6KukFXkaWbYHl38EQO0LDFW4Ij/pbB9rADRisMVNOxMKgfxfeOFmlm2U6FC54/hU0xwXkjIYajnx+m5NYz0Xt/c+lb7w1cB7VZf5TplhS0kJcoV+rClIiKjnXpq3+fSbIAL9yE5nOy+tPCUciziKIWVDhcg+xe0t1VIQBpA+v/ejXCFuiUc3VvUvB0ACHrBDEqZL8/UJX5SfoQjuZIY0zf5n4iGI830USQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MJsrCPZt05R68MxKoBpco2NR/z5JZDCOUNeUC4SYSu0=;
 b=BcmDUu2xI3qz04yvwBNZLVe+UHOGVJmH6nHyW8wkJxFROtJ+bGkHsY1e6fU1+LKZ2C+gGh1gVRx23HDrg3fcurU0ZqicitxqxgjH1NAZG1JgQwRPEYJCC4qNCjVHhhnLf6vQWPz7giQFAdQJ8KHICZc74qJgAN5W/MhuArDuM7RtHa+F1dDqhWZJC9yGunYNVVxL7kcmsNKUYFzZyfzXVAgc4LuCPbUl1aiMYhmKRPGUNUrRs04+zkw0e6g5tNHPKMpz5LYpDHDmmEH5Al8DahD85jqX5iRVxeDZmgUcS5SXHfU66s3H79ctzekEG3MM5YLlD4rm74aR+MdKI4/xSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJsrCPZt05R68MxKoBpco2NR/z5JZDCOUNeUC4SYSu0=;
 b=HyYtDj3T6ksLLCbv+tEPQSLh1ux268Fcw8Lf6j18GbMs4OVK4VnhUO+L0903oShBq/PGnSkmD58wxxfpgXgaAX4thNUIutLUuJW/kBgWVh5yNIStLuk0P+CK5wGt26iNBPxV3EAFfE9o0Mch96cM3bfupAOSFjUl0EspJ9aHPuYU+2DpDrfYR23nXVrfjRnWyctt28BGtJt+obdFJmY9Q7r5n1FMn3jSKbMIXgC7yD/bwmRP/2OVBEKRDm8cOWMBlmP8ep1pBz1FzPhslLXxm6rzXSbVximl/+4+ULwu+QD5SbIs/W6oF0hoifpQPR/memrWVzrwMU/OJNQFMicgTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Thu, 3 Aug
 2023 00:08:14 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Thu, 3 Aug 2023
 00:08:14 +0000
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
Subject: [PATCH v6 11/25] iommu/tegra-smmu: Implement an IDENTITY domain
Date: Wed,  2 Aug 2023 21:07:58 -0300
Message-ID: <11-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v6-e8114faedade+425-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0039.namprd16.prod.outlook.com
 (2603:10b6:208:234::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: c3ff1e60-18b6-4324-5749-08db93b5bacd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	km481S6zUt3BizvCPrNjPB7bsM2KEdiLqqUElAIjmmSXxs1wcOfqp19k7aRlFRsFTIrb8iTx2DCNPhgObc1omBWXaxvl7N7CWBHxogmaKnW20iWsj+TFvlcpySd38QGhSA5PHeXtitBM/ZdkSrbAIf86u+9EjIq9c9CiW5+z4SrAqcy4VET9i/hZAp2jdi2S//jHK06+ExU0/cpBXbG0YZrlJbP01S0BwPUZ20q2V0a80a7Vw1MEpU7dHaxTMgtXWwMgOhSBoIe7HOy74qBcucXKep0Xuuvp25CI+P1ZrhqhMFf9Xyqh/LxSIAcQaLrJ4/0KSDeVjYBSx4vubMVgLmVFoo4HphlDBijwdTeYWzFOqfWQMq4Pna10kM0LjKGU2I7lTk6ZTdz+ZXn0RlV98HpZBXyUyUZAl+hQeUdVy+XddUabkRY2lJi+AIY010J1T2sl1kaoV/dGQFuu23+c80i9CpBY5vPi4e2lohHRzyhs4teyyBGhFW8lreJbAllb7wGgO2hHlP7FAF01AMNBHo7pPJV+E60EMsUulVXvX7Rcd9mnzO9FstMXMK4cjaoAIcZTxhDQjb2uQO6TOzNQEV4A041jqzhAq16SYf7LXZQ=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(451199021)(110136005)(6512007)(54906003)(6486002)(6666004)(921005)(478600001)(38100700002)(41300700001)(5660300002)(316002)(66476007)(66946007)(8676002)(4326008)(8936002)(66556008)(2616005)(83380400001)(7406005)(26005)(107886003)(186003)(6506007)(7416002)(86362001)(36756003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VJp5qCnymMI+GeUB1bykehnTkbZPXkqMRQpFCQ8N0UEm5Xvza73KjA12xbr5?=
 =?us-ascii?Q?Lce/HMgHCipzF3c5tZy99EN1g2RAYRLiGegK6UDwcHNHo/2lXzfUyVa7JkqK?=
 =?us-ascii?Q?vC8XqpxUnj/Ey9JxHeWuDDXiAQN88V+f8u4ogJ6YCdhL3D+vtFzRejwJ6fXg?=
 =?us-ascii?Q?BZ0tnIH0Nq2jUNTWxXBrP4kbnXCW11F0LCYcbuI0bFo+jM6Btf9ppnerGSlR?=
 =?us-ascii?Q?lICXdaiOMRESroZBhlhdQtg6t0nhC2asl4mPRWCQa/IuUjOZHo3MiHS6XMS8?=
 =?us-ascii?Q?fewCZtLQLfPp3kaSGczw+hGHBbdMKZcVDGX/86rmM8/3m69T8ovXnplstb1K?=
 =?us-ascii?Q?9FG13mWUmrSU8GAle7M7lVWrb/FejO0bZKhBL5sizX6ZeSJfpCGV6T3KeAde?=
 =?us-ascii?Q?IRKtsymJnvKVm+jqMyfog0/tFPu6VbIM2ox2pmSGgki8ilC6Sfia7X13cb23?=
 =?us-ascii?Q?uE/blsUTPOTE5JTosGwFYuOyudqYsd8CX9nqU2DKNfQLEaodcu1WQoyX3DR/?=
 =?us-ascii?Q?3jLITCQJsn9Kff/ZCgmWs+KIz+ZaaMtTdj6/NsEsBaCSFkcNcb0udzeKnIAa?=
 =?us-ascii?Q?j4wWFdhJdEaBPWY9UGH9Mffp6tn7eCwJYgJ12QSXi3Q09WTYv32O5Dt6InUT?=
 =?us-ascii?Q?3lPWvlS8zW/b0V9wtKtAbfhMzPZBMzwxZis4PZUeWv235D1dNJ8WA1AXJ+rB?=
 =?us-ascii?Q?STLDySHSvCXrdd2qDuH6lnW/SFWryJvDlBmUW6rZc0dL2efBpUQWrQY0ROD8?=
 =?us-ascii?Q?kJZwZgtOBhJLRd+AokqYeuFLx17R5LRZH3bDhwyuY4ooa0dNYMxP0GpAsIwS?=
 =?us-ascii?Q?LEEXsBCWDisrTw3WRdGoi5Dy1rKsrnv7MnX55v5LYdwSpAvkEo39EBamwzRA?=
 =?us-ascii?Q?LN7Aip9sOAuvtyIjzWINAzPVrf7r81yM6qxI0AIsvgdIR6XqrYTalejb/2bN?=
 =?us-ascii?Q?Thid/TllpUisoPjNVNWLamikGejjYaVXpRN4cQXws8Q1aHqblsvVY447DFaA?=
 =?us-ascii?Q?aJI2mtmtIbXphIFS/rvU0Oe5wBr6v+5+iQrXh/sFXKhn7x1b0Lfaro7Q5Tyz?=
 =?us-ascii?Q?zhbpGEeK6hNk6e01SWI/wy+YUvh2/MKDTzP0egGe/YwCe8xQqV6mePVb1ruX?=
 =?us-ascii?Q?6WKF2iasxrcGCEeFwGNRl5JjysfYRNo03NMfD+I/s2jvq6Py2i1aDKt0nhH3?=
 =?us-ascii?Q?B3EsmdN0p1ckurtM6dgPi9IIOyTY/tsoI6oTE6QyYLVob04MOxU4NgOHc9F2?=
 =?us-ascii?Q?9+J+vcDSdSM1YB87ZeCu6s87wF5rp+nom2cpvbWu8V6XtZXJUJ1Z8u/8B1uG?=
 =?us-ascii?Q?YuC1WiXxntNRTeHtAdv721LnisCPiN0zkL4SA6nW5iI1ZBJKdzXpzR9ltSo4?=
 =?us-ascii?Q?dN/ocdweUzfZjHuqrrKEoxTYfICUVKnmkK1FCsk4isAjz5Uevy2EIf8tKXcN?=
 =?us-ascii?Q?VrDd+7jZT1skzx34gBf1Hee1xXPCfY4Q1RzJAfemG9wfRBD1oULlxJtMjrao?=
 =?us-ascii?Q?1Id35t8Ztztc4bV/ETyUrKK9774Is5360tkJ/eW/uwBIVHCWpLsW6ATdraAe?=
 =?us-ascii?Q?QsGDUyLnBnr67e5DhxaV+x7QYJHxJiJ+YR3PjK1B?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ff1e60-18b6-4324-5749-08db93b5bacd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 00:08:13.8849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8lmFMrGjQKXSSTGK30q+jKWxCyvAPb7LRQthtTxFfdZgyNa2zmhv3cTQkgQyawjK
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

What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
putting the iommu into identity mode.

Move to the new core support for ARM_DMA_USE_IOMMU by defining
ops->identity_domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 1cbf063ccf147a..f63f1d4f0bd10f 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -511,23 +511,39 @@ static int tegra_smmu_attach_dev(struct iommu_domain *domain,
 	return err;
 }
 
-static void tegra_smmu_set_platform_dma(struct device *dev)
+static int tegra_smmu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
-	struct tegra_smmu_as *as = to_smmu_as(domain);
-	struct tegra_smmu *smmu = as->smmu;
+	struct tegra_smmu_as *as;
+	struct tegra_smmu *smmu;
 	unsigned int index;
 
 	if (!fwspec)
-		return;
+		return -ENODEV;
 
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	as = to_smmu_as(domain);
+	smmu = as->smmu;
 	for (index = 0; index < fwspec->num_ids; index++) {
 		tegra_smmu_disable(smmu, fwspec->ids[index], as->id);
 		tegra_smmu_as_unprepare(smmu, as);
 	}
+	return 0;
 }
 
+static struct iommu_domain_ops tegra_smmu_identity_ops = {
+	.attach_dev = tegra_smmu_identity_attach,
+};
+
+static struct iommu_domain tegra_smmu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &tegra_smmu_identity_ops,
+};
+
 static void tegra_smmu_set_pde(struct tegra_smmu_as *as, unsigned long iova,
 			       u32 value)
 {
@@ -962,11 +978,22 @@ static int tegra_smmu_of_xlate(struct device *dev,
 	return iommu_fwspec_add_ids(dev, &id, 1);
 }
 
+static int tegra_smmu_def_domain_type(struct device *dev)
+{
+	/*
+	 * FIXME: For now we want to run all translation in IDENTITY mode, due
+	 * to some device quirks. Better would be to just quirk the troubled
+	 * devices.
+	 */
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
 static const struct iommu_ops tegra_smmu_ops = {
+	.identity_domain = &tegra_smmu_identity_domain,
+	.def_domain_type = &tegra_smmu_def_domain_type,
 	.domain_alloc = tegra_smmu_domain_alloc,
 	.probe_device = tegra_smmu_probe_device,
 	.device_group = tegra_smmu_device_group,
-	.set_platform_dma_ops = tegra_smmu_set_platform_dma,
 	.of_xlate = tegra_smmu_of_xlate,
 	.pgsize_bitmap = SZ_4K,
 	.default_domain_ops = &(const struct iommu_domain_ops) {
-- 
2.41.0

