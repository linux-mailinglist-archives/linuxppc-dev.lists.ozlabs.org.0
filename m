Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3DC79EA25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:55:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CPreIRLO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm26J1RbQz3fhL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:55:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=CPreIRLO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::606; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s569Ryz3c2f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDUYxMqIpJfGVs1A+YMhptP+0h87rV3fxPmXNezvTq+jiCjdoauEmI2RLV7UYoi5r68R5CkF2Zesl9g1fgUvmq7zxQM+mqITQfc4/LQNPimfA9dI6bA/AtHBTq9AG3NjrN7V5kP9kpgFgnyHA8Jm0V9P3iWqif439ZUF/urAKWRugcoZ04+GS1SR8mbJNVnscY15xEtyI5ITqTRir1fxST1NjPbDqtL927iMoeBBOPXeoJBEHcH4zoAkJLp0Ls11OEjRHGk2er8ZYJr5Xzr+ikemPKlG6wcTyVvWk8QBgr4quZEkot1K/m9QuzuM5P/sNFSgVWcWPT6juNcqm/2h2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aG5SIiGYugLZHs9Y0HmpZHU72zy6wBfYeKQhylNMXYQ=;
 b=mD71qgqa1mMujDoqtSGX6w2kLDbhqO3WdHDNxbZc/13jtbw8ZCTOtluR0n5zI5ruMDxbiyWCyjXAsCemtH3Prs8TAtNUpckrV1glELvkXjOX1TvRRuq6xrWnCLu5X9x2j2hTWh9+ejov6gzrGfSoBPlmajD78fk2JA9mg9cFulApgu9WHlWXdACbc6fNs5ULWIWNbpLGeM0Sv+TUxqv6Gyo2use3FVSdpWp9+hg24MM/6RTj6NBjrcZYvQf9pQxAqGAKdSNUYNzJBmw+uy0g93IkaA4gYsF+Qm9L50GM9iYATIn9hHwTG3p5Qw17+TeA+MTqiK2hVXHo3Mr95D9U7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aG5SIiGYugLZHs9Y0HmpZHU72zy6wBfYeKQhylNMXYQ=;
 b=CPreIRLOKIL1AhCtX9sdFgc/dwpfA2nAu8An4q9+/x31aYPMgrzdChcqyeC5OgNLYo48YnqQrkZXRrMWenbmCrRRATSnbcGWl1pk9THWGYs6hsWb+RSZrNhtrZG+ssWQCTwXMi3CQqCHz+MMDB6AvwQeivQiSJp5krZwnD113jQZZA/bA75N3qhPWARLfpBMgIAn9X0niT/nWI/5XtxHPt7pj4Nro+UfI+W30r5oglA15Mo2v/o6MCiFhKYQcD+696FnZYVvH5EhNc75+8SF4ECVg8had1/6xjLKlD0cYpeQRTrEk9OqE8ZktAa4oFuSetNrxCP3d79f4vnADo1kbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:02 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:02 +0000
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
Subject: [PATCH v8 12/24] iommu/tegra-smmu: Support DMA domains in tegra
Date: Wed, 13 Sep 2023 10:43:45 -0300
Message-ID: <12-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0371.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::16) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c6cf450-a99d-4e5f-b448-08dbb45f7bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iXpa/81L6Je/UZYcGk7N2s+btm3hGv28qwVz/Grwe2919UzxQQ4DFRSqsvN7vI9XKmD9XfG3Mw6OoJSwxNWGxdBqCsBzGAPjVRIykY+WqA2v5WmcUIk/6K36XRpX6zFSxZ45TEj43xE2T/hyiIzM0vS0bsdKiwFvawLzn0vfT3rrdcjLisAM02JSHnmBLaXuk4ZWipuNZHyblZjg/F/6w2mCrZq9LoMXcBu2FbdmzjNXVd0MpGwLVIj44HIGoF5YyFVBrBS33AlrHA4i1Wfv4QauveVECsSS2K6ALOVxpSO3u3IIIE+hdtgWHo+I1lzhXmS5YpAoWYf8RzzpYANNhFFgvqkoxJByK9D96wtFFd298JKrOHXU4N+ixVdhz6ROGgmWT3kag7U4+wLQFPf7cINIdwPeSetTJdW/AHtafqgQr8h7hOjqrS+O9ad/L8S9AksxbItvOuKAvU3FeMN285NdFbcXy91y0gTmZKqfZ5Yn6AplH/sVlmvpDtT53zS99VZczwK/gqFJ/YxmVHZedDmxilZXN/o+YEAz80R6KmoOx6+qf6Rbmz+f248qAsgb98J1Y4r2sHTPZswqywjrkZvN5Nag5Gr3uv4bLdDX6fk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?bAWulfLPIRxMivAHtBd+0Jv3ByvLHMGWFaxaxrJ06H+M8+RwwOixuXAmnK0X?=
 =?us-ascii?Q?Grs/prNzQda8CV+30NU7m2F3BIZFUS1PvF8rkRBInGnG6DyXCkyeS9lgrN0x?=
 =?us-ascii?Q?X9TNnNFPWUjLAutQ8XXLKUmjiMdu/v0cYLvjsWXxKIk3PWfBphTF2AJtGh3A?=
 =?us-ascii?Q?3dMJ8hnzIpKtng3LEV0j3wqgLCDoBC+FhqnpANWEI3Y4oAOp0RSLAQk7xisA?=
 =?us-ascii?Q?QlLsZ8eaz4jpU7GHxWuYlJLES177XhZKb09UTRdtADPVFGEmv8TRcYaeG8/3?=
 =?us-ascii?Q?JsaK+bC57DlzMBzt+px3B8hNmGL7J49wzvjUohlktNE2lyipUuMgcgk2sVGH?=
 =?us-ascii?Q?odXaVlsDfC/Ud3ep5CZTKrBgdMhKsOSoeFXYv0raRfYfkzVaeOB58ZQIIEuj?=
 =?us-ascii?Q?gSYXMx5RYWFzkqDnZtUNbHDomP1/ZJNwD7MKb6ZurzZyELEb+CPhS9nDuN+0?=
 =?us-ascii?Q?YXtzlRbNFubivkDQOs0fgHeBYrBK0fBEepC97+y4aiYCjw/1wQtf2ev0zgh2?=
 =?us-ascii?Q?+kQ0qj+9EPcPJiIBYM+xFgoYdqCKsgvWSxOM/aX/xr+FFe/uFCmDgGEEpnKM?=
 =?us-ascii?Q?s/upWHn6FpCJhVf0mxtXs7ZIzBopu/9kPnobfIaXfdHEe09QWf2h4dpRfiq+?=
 =?us-ascii?Q?M38MDTn0i5bZry20GFPNGCwuEAcUtHy80vYeI+1hrIPkgvIikmcmkNYOIvbN?=
 =?us-ascii?Q?iz0DiRtvuRjOF9kOxW+/GuByhwrCeJnUAfqIZs3MSb7/ecoGX7LEnYHRAy0x?=
 =?us-ascii?Q?HF+EkMoUuRgeQ24DUPX5Pus20wBcfkzHyM+NYgWWYrCLEQct2FvnCekGE0dB?=
 =?us-ascii?Q?Ts2J4VjNxYzU/vwzLryZD3e6BuZpi2kkftH6X0eJUy1EPuN2eKfGcSp7gmxk?=
 =?us-ascii?Q?o3kLwXMbPIdnd7r/ovF7pBy86RB9/3PoUkabO4aDa0ETwj1dmfoVJoTUODkt?=
 =?us-ascii?Q?dRZGshlBuq46Pf1RiFmpK3D+TT71fJm3KfcKeA+ZbR4E1X6y14qGP0TEZE72?=
 =?us-ascii?Q?pgm3kNAOaqtZmSJ0Wy6LKxiQcKNaFRAYhoWF5pX066vHISJ7XBCvSDQNvIxy?=
 =?us-ascii?Q?sWwlqa88o1KL/e7x9wnw9G/RYLqULfygzg9aBXxAcTNgrCbJSL7RYlvz5+vw?=
 =?us-ascii?Q?fmcXav8Gz4AZgloqCzhyjflIV9mXy+/RK4LkIbWMev91CoXWN2cv3BxPfGoC?=
 =?us-ascii?Q?AvTIKEyrVPnLlPd9rZ2OUYlApyQiPO7h/CPsyPbIL6+Y3Ty1sDgPSFCIGwAA?=
 =?us-ascii?Q?Bdn4Ek8wvSfxJSXtUQsqADvXubjjqd3yiQh9K33Bx2LkOpjQfmuTDLjNvJe7?=
 =?us-ascii?Q?n5Js5U/Cdw4Pkc8nf9STF8WaXPunrIfTw8qnrcI9cqJbXVPKxqjKmNnlPxyr?=
 =?us-ascii?Q?O/ROu5SR2g2Qd0odNiaXABzccOYVCRDmMpPkQmxq4VDiZKMHFXjoFdcnfqWW?=
 =?us-ascii?Q?Rw+fOjqnnusZhKsEj1EZt/dcGccL3O//r1rAdXGms1DdyG3bVARv4yPfNV67?=
 =?us-ascii?Q?smbAC9sJMcgsj8+x+6bwnwAzTWUqjHBKeqjoYgwcuEolFRPCmJPaZhSSQfJn?=
 =?us-ascii?Q?LRSFaIkF3tJrWJt9TWKqk7gdBnFFJJ11OwNj2j2i?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c6cf450-a99d-4e5f-b448-08dbb45f7bde
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.8356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iH2j4VZCo+zhOtYuMnikLDgh7jWLdCgxdfJ5wbWtZDpW52w5QwnuPdxQRWqKXYKH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5096
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
Cc: Thierry Reding <treding@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, Jerry Snitselaar <jsnitsel@redhat.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All ARM64 iommu drivers should support IOMMU_DOMAIN_DMA to enable
dma-iommu.c.

tegra is blocking dma-iommu usage, and also default_domain's, because it
wants an identity translation. This is needed for some device quirk. The
correct way to do this is to support IDENTITY domains and use
ops->def_domain_type() to return IOMMU_DOMAIN_IDENTITY for only the quirky
devices.

Add support for IOMMU_DOMAIN_DMA and force IOMMU_DOMAIN_IDENTITY mode for
everything so no behavior changes.

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 80481e1ba561b8..b91ad1b5a20d36 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -276,7 +276,7 @@ static struct iommu_domain *tegra_smmu_domain_alloc(unsigned type)
 {
 	struct tegra_smmu_as *as;
 
-	if (type != IOMMU_DOMAIN_UNMANAGED)
+	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
 		return NULL;
 
 	as = kzalloc(sizeof(*as), GFP_KERNEL);
-- 
2.42.0

