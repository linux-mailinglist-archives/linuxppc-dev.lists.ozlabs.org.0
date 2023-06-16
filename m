Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A52A9733964
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:17:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k+7yPOjP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjTSL40DSz3cZX
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 05:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=k+7yPOjP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8a::625; helo=nam10-bn7-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjT8D4GXbz3bng
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 05:03:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mE52CDJvFZIAz/pd5K7s+xgYS4v/NnhCEZZQkISLeGJfJMcs5EJvKBEwrg3JnOPcBG1x+q8IDz72C7GYmTA5xw8bvFuK5ddQPGYBeR/pG1TanFKwJtKJXk/tWUhvl+CC1DKKANHV23t8jPGRwmBLshvIyb10ny31JIjtRkCD3za6VembIdSeM5vNxVKyKu5ckwAHdZ8D66oZkfd6ah4LKinXXruTb36Hy1ZXzIptQ0nBTFehVttKKgISl55xsYCKnLO4JMnlJpMl9WZq/E7JZtqhsj+wALfhFv5Ymc+krsZ8yttUmIWADLRWt/SAATr0li8BWSv6V6t2PVKITvEw2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKNaZwKctNyYbRBuZB+xdODMOwwW/nmEM/YaUXrFqNI=;
 b=kDVzaoFiNeIavXEzW4StyUy3RVxzzwq9ep71KJG06q41cfmq56qg7lsddOlrsZ9a+HiT1JntbMnjcNbJTQDxC1HhO+iF9ed4lDAVqvBtLFe3o8vlCxtkqiAMekxkccbyalyUm+fc5g9y45FzXjJr0fpjDZH0eHKCkrG8ubz3LL71XmL65w5i0BA1fd1r3Ny4B6b1K7PTWKmjsn/emvlynli5pqZQsqutDRQt7WsJ7ea/EfI3RLJI6Fgkk+80SdfSdp2HhmUo33NcTIBoCSSV0ZrUIqVo0np59i4tqerx6LoXkkw4P6LEKLVwJResEdcVbg6Y9yq6CgUS6zqXj5217w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKNaZwKctNyYbRBuZB+xdODMOwwW/nmEM/YaUXrFqNI=;
 b=k+7yPOjPZD5wesC4N6PCgL6OnzNBsCusCJllh/bWpjMVAbgEz5tO3cwMNBzqd7dC1AT8yFGFlxfKSrn6w2iqLEAJmUDWz8sCt4P9URUPHlGkNzdMCGMVIdugYCMK02ocF1GTD8GGQPPkmQdx5V3zuTS2jSFWjwQAuhHrUVVNB8BXbaCTUvxpJb+vra+ks1lcH6mfzwtMaeOfj8Jlwd25BsA5S84pJm0i3CTs34QQDFxoUM4yR+1gPkfysNI4ESbHUioUpzIookYpiL76/AVKnzotRFK7PrY9XDsVHzdM2/PLdJJ2yfqINV+FnYF/U28xsB/HXoG4/RxKApZLdwBPJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ1PR12MB6051.namprd12.prod.outlook.com (2603:10b6:a03:48a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Fri, 16 Jun
 2023 19:03:05 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%7]) with mapi id 15.20.6477.037; Fri, 16 Jun 2023
 19:03:05 +0000
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
Subject: [PATCH v4 19/25] iommu/mtk_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri, 16 Jun 2023 16:02:48 -0300
Message-Id: <19-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0061.namprd20.prod.outlook.com
 (2603:10b6:208:235::30) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ1PR12MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: fb37472f-804d-4dcf-2deb-08db6e9c4ba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mp/XKFBJdS7hVhMhwYC03AhYl6aFd+JZIqk1DZToPCnRHyrrjrZWo77eMIja7bHBNBc4VVZ202tqH4ikE8x3Fqx2maWX62h1Fy7Mu8dmkCXcZ2H3t+G9Six95RUeUQi4S3b7OwqsBOYGk1pNkxoL7xlt0o37vMWVcFcMrEwPP7R0FSPoW3bv7VD1EhkpITCTW1Dee97x6yQXsrU3YO8IGofBiBjSGQMk+kMYI3IOHJxFQf4cl5L2Bdik3xxodvHFj0FabU3+SuzJJMWg07bQqiDMI9cbczPAsM95wHShEBi86OvBYnpQmw/jFvkwGlQhkwubZWR+n5d5eNVFJd0ehB6XU2PSzKLpT3iWFwW6aoTnZEkifoHiVHe4svsn+JdStdstJGdLe21CEkyyuRNGaM9VmBO8O1GEzPeYNn/JsB1Gu4CgVfLc4lJClu3qTxhcMOkCcYp41GY8/QFbA7u6boxkhyAiFXsqwn5sXxtzjzvkC+XBJNWB91FFOx+cG1qjpKVjeRetQqU2weYJ6ENyDjxMUBtsbvGTIfb4ZqFEPRFsuTa/aZQ8T2DLf5L8ue1RvyBd8KJ/r7KB2V8T5AhIaNKqgo84KzdyzceYeqnooEE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199021)(2906002)(83380400001)(2616005)(36756003)(86362001)(921005)(38100700002)(8676002)(8936002)(5660300002)(107886003)(66556008)(316002)(478600001)(66476007)(66946007)(4326008)(6666004)(6486002)(186003)(7416002)(6506007)(54906003)(7406005)(110136005)(41300700001)(26005)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?VgREuTnAz85QySWRSWkXTM3ufrZSDn9I/TmX730+bK54LVdhK8awSScdSu2e?=
 =?us-ascii?Q?8jFZEFadS7OaSX2K/RI55PfZ5/R6cXX4ZAGqiRL/EmuiqRMGDvYUTZ9rRTtc?=
 =?us-ascii?Q?RVrNVGT8Jog+IOyG03AuiGS/ok38SjHQ7qZecB0GEnERwBYwfpmvZcAmkUr2?=
 =?us-ascii?Q?bhzmQgsgSJw6bgC4K5Bp0c2K/eLxT8wR3427EfPiVGoCkoWNtfHIkl9toNIp?=
 =?us-ascii?Q?X8ftNfzvGiCGgykSfH17VLkHq5MoqHkDrk30l9Es8+kygAV7Ovq0idQgjlhS?=
 =?us-ascii?Q?5BVljNora+mYYjsotrspHRD7B9wWF7p7pLePrPjYLRXJSx/zcgIPO4xzw22G?=
 =?us-ascii?Q?iSEScu43abMiSWQkJHQCXGE5vJuMcvf3YFG/h4TfscQCEq5i+q5xU+OKXKbX?=
 =?us-ascii?Q?vITO9kdnYjYgYn+1F3y0e+NiPG/RFRm6urqchRU3IAzZzgsQqrSbj5aHm/NE?=
 =?us-ascii?Q?rS4kt7iVQdNJKUmAIH91UEckCJFJ5N+ef/zdcZgzO2D2OiYaFuvceOESlegB?=
 =?us-ascii?Q?rTmHkn8ecnXmz+LeYzKnJWB1DR3Yp37xvNROHw6A7ZEqITeKyfDGaYpuHvDJ?=
 =?us-ascii?Q?NDf/w2Zzx8taNmP7CZU0NDhMQyKwwvtapu3vUb4NppVybOBhxdB+ZRFntH3i?=
 =?us-ascii?Q?8XZ30noPjlihkLU+/neeAyHNNHJ1vS/0NkRAGc1qg1ktPTQAqUHKlweSgiTG?=
 =?us-ascii?Q?Y9mG6nNC++u7y9J1g/Dtdr4BN4sCL3Unds5AvTg1N9PUWBOu/J9uTBmtn/x0?=
 =?us-ascii?Q?WjjPFR2OiwppvFfIaan/155r2NYHsW/qAC9fy341BL5m67izzLiupehRVrZR?=
 =?us-ascii?Q?mJXC+vRNt/iAaIE0qln2AnT2xrgWiG4PurLqQGqrT8MP5QcsxKpwlKwIjhJD?=
 =?us-ascii?Q?lNWlXwj9gP2u64YAMTFacnTPCRybLVgtAUUN3kqdWga+6KWb8s+hLyvNuqvd?=
 =?us-ascii?Q?mZTlRDpGisaR15LPuy6S84ll2QxJhM17ICnWGMOgWpt3tzqucXJmHrn9yRAh?=
 =?us-ascii?Q?8+7MQSB1g4V919lZxgK7AevyKOLQT0qYSWH/gSIOmVeuziPckEWN8Dvh1Hk6?=
 =?us-ascii?Q?X2wKxS0h2E3Wok8IlDiI2mTx8F3u4IFv3w8C9M5N80+yxvqFRkzIcYfILM7C?=
 =?us-ascii?Q?hfduArz+6c4YbUHylknPeOfh/NL5EvbYRYP9yapsgBxN75rlQInIAsKpHpWV?=
 =?us-ascii?Q?h7liTLvECRVuDn8GhrocXwwVKytHl2fw7W1sJ3vaI51u3LphPo7IK9TVr2s4?=
 =?us-ascii?Q?xPrQfAQnPWPneJCVIWteLksCUg113D2u8sk5K3GErmEThG6N06aHLq/sakap?=
 =?us-ascii?Q?FC0royfSVdoYR9wQIW4PY+AN4ragvsGN7P8FDTM8RICNRs8AQqiB25JasTcH?=
 =?us-ascii?Q?VM+mFdDAoECdIo8QQpRH1dzQ8fSR3m29kB7knVqnyMJdegZKZhwIuTxmm1j0?=
 =?us-ascii?Q?g2GVjO+EIVze1zU8jZsK47IWFlqX4LHiN1wDCq/UQM4LQa7HsrkDm4j/nXdp?=
 =?us-ascii?Q?Cmd9geqpMxZnRV5ReIUXLSNGFymSDwdZ7PIwpP0/vZWu6x91HpLwd7HFUsde?=
 =?us-ascii?Q?SOxVGI4KhnJRKpp0ZTC06ta3Q7R4LZh9dzJn85KE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb37472f-804d-4dcf-2deb-08db6e9c4ba9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 19:02:56.8417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WX3gc/RvHVrYAwxhQevyj2cmnVvRQyrKs2fZwZ/ITdNmUFTAhTLV3hwSopdDO97Z
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/mtk_iommu.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index e93906d6e112e8..fdb7f5162b1d64 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -753,6 +753,28 @@ static int mtk_iommu_attach_device(struct iommu_domain *domain,
 	return ret;
 }
 
+static int mtk_iommu_identity_attach(struct iommu_domain *identity_domain,
+				     struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct mtk_iommu_data *data = dev_iommu_priv_get(dev);
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	mtk_iommu_config(data, dev, false, 0);
+	return 0;
+}
+
+static struct iommu_domain_ops mtk_iommu_identity_ops = {
+	.attach_dev = mtk_iommu_identity_attach,
+};
+
+static struct iommu_domain mtk_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &mtk_iommu_identity_ops,
+};
+
 static int mtk_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			 phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			 int prot, gfp_t gfp, size_t *mapped)
@@ -972,6 +994,7 @@ static void mtk_iommu_get_resv_regions(struct device *dev,
 }
 
 static const struct iommu_ops mtk_iommu_ops = {
+	.identity_domain = &mtk_iommu_identity_domain,
 	.domain_alloc	= mtk_iommu_domain_alloc,
 	.probe_device	= mtk_iommu_probe_device,
 	.release_device	= mtk_iommu_release_device,
-- 
2.40.1

