Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B199179EA21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:55:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uC5Cz0Kn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm25L4Tjrz3dKK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uC5Cz0Kn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::60a; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s55X0Dz3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2m3cO5iGs8YQUWoatPikcuTBOmaQGXe7UlKPOk9O2x0gwbF0yc4KtXGUWL+Fr+XsbAFKDGsn+WaWwH3fRbKgg+gETCHx65K+9xr9A5c2Yj0WyBHujGKmnRiKOFDDqaYS/c3e+nyuPg69MDMUbhIz0AiWNGW/INFyD43L7ubr68M70lq5tbAS1pfALjQEXpB9nLpPZKNueURux3DV21RLYyJrod8BsuLfCFzX3H9hx4v3rMgozjFRaVa0vOlI4kvgHMpRnO7faAM7+emeIFKOAMz531zNT0NFGqlKfoC7RP2xa2IFVrWOA8o4CxGML/hwdnNHTCrV0ns3pmImUVoHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qCCuWeS+oqn/5yP0HL7+383YomikFT9+nV5x7q78VhE=;
 b=g0FMbldjjhBTqgMhg9+/sbp+8gTJODxOjnogchObPWgdjOFnsZWO4yKSo9CSum0yeir/Ay29ayIFeMeL29pLZxS2gdbCTgzvsnq97Q8vgq4AGy8rbklUIqOWgGb6eZm8EChY1jDrqjCfHWuN+QlhpwvQ12CwUVnSkMEsCnmNpn9e4pdp8lmsED4CrKPA9bH8t+12/E0dmg1NgEh6srUfjX8eXsbN05lzZLy2WyPVmXJMnrYhPN1ZNn031YdPpMB6N4/Z6T8OC7zRLruckwX/vZTNNibCPyI48ZgYbfmC07nykNcLFnE89X2K9mSDUUglGXX4Nq/gvrPxUfbPMuowqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCCuWeS+oqn/5yP0HL7+383YomikFT9+nV5x7q78VhE=;
 b=uC5Cz0KnU2O6mPm/nTRlONzleGWfn3uvtGyDtfTWsQOcid8/rQOtrcv6MgDi+T5PAsh8JPa0c4vMQ4i+GEfezdq8VnrQmZrQw3wjDyf2YjRygJNkiV7exzUebQ2ZfIHwk7tT833iA0KM1NQXeYvj2SGSiYri/0S2P1Wph/FoouLHrqHfSbnn1Ku2CH+bP5wJc7uQvYRjDk93NX/QdZ1aR/qk1DYTJ3GdB0Zwy60GqWoJkwd9OBokvu5pFXKq/I3IPsjYhd16Jx18Yg4mem5wQuiQOMZMIIUGMboG4m3Ogh7/xtFWIDoMzsg08p7OPDpn8OWz50GiUV2zdKRKZOKq9g==
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
Subject: [PATCH v8 16/24] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 13 Sep 2023 10:43:49 -0300
Message-ID: <16-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0368.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::13) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e428de-523d-4e3b-b74e-08dbb45f7bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	M74HS0bD9BOoFIYPQ3TgIvX2FlQkgHv/QpSEfir1IQRRqymJUpG9pcZisnfJaEWruehOKfjqEVc2sBUlHlOYlrkAdVlAHACKdRXWWYsoS67VGbXmEZOX2pss85CuPeYAZShh32TQIxdFFxIAYRBut7Buw2KzKRFZi1APsUCG7ZJ6rBrYI91KoBrjHsEfaMvdH4gLRIFUWDMccm1flZEUABuRrdqs5XsU5o4XSiMMJPYAf/ClRGS2AqBNx+53HJJz8t/MdEyZxKT9r15S+kgU7gk9lmf5KkkOUAfSovkhHmSV3F0tRRd1UaK6FHcZTGdzyd53qof/h9/YV4/EvXgqlF/1RfmSU0cNKZTVD5N7OZI2RDo0LnvLjYAvFFE03rzcyTrKqSpwkis1b1cOJEGSUK9doWQdUZRctmB9MI0p0xBJK65mz4u+6K+eF3aBDY9XxhkT4G3akUNceknlV2AE7LYoJP5o+/PHDuNXkpLpQMt9I4/UDzbBNJCUBNcj1dmDaib9aUesCVZen951g2ZHHmc1Dw7HsqkML3dsIgAzagVGcX8OQXXAQOtR6rrwdbKqKuficcrcEpqSFBg+yvmN7ZhgH13PNNmXVWhIXwBqfx0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3TRmUw7aAq+SMlb4WLUVA1ZrIkqoZAYivOHCQOyrX+lragLCyJ7N68Z1wB6Y?=
 =?us-ascii?Q?YAp6XRCI54yy5n5PR1p2tCuRgSBJ95lmCuTYRpxYFk5Vzq7T1uLUx24rtLIf?=
 =?us-ascii?Q?DE+YGKKrncsCx9eDef77crfbzns3oWjg33wmf2gEwXz01cn2b4/hMIYKmv3y?=
 =?us-ascii?Q?9nyrr2ajbFZP7NqTCBwXc35bptZBYkIV+enjaypdBDOhQjGtXoL6zcfmxOpS?=
 =?us-ascii?Q?Qd6TzSC9L6hwRSo9G8aBCLlu5BHX4JLiC7e6W5l0jDhMmZv0dNR8bKnx/acR?=
 =?us-ascii?Q?Y0Vub0d+3CD7a4jB+4b33aXdosuFo1oHGpYpXVH1GBHmPkdpctEGvFLE67os?=
 =?us-ascii?Q?lvtQgKVJznmILskWk2iHgdWRvC4NmBCIlba87Iiog4eRkL7zpwbnEBMV2qR/?=
 =?us-ascii?Q?CtDF5bMz4RFLJU6or+LgH4TREvpMabdsnaRKVNjOawHKG/0IpjySnJ/9/XI+?=
 =?us-ascii?Q?UFVRXWxXmiK36BrUJVZyMm2f7v9/yv5a5pyvb833m6GHFmCoIxq+LJDKEAhj?=
 =?us-ascii?Q?vXxJ1doFnOrjzQmTM1h8OB9Bl8S/ZZ5TakVDAZdPIvAH2jCbFznNb7wKqAmB?=
 =?us-ascii?Q?/U2rA2LV17xCBmTzvwuwQEXhkeizgfVycFIfm2tqhy76ECZICf454ACHYazO?=
 =?us-ascii?Q?PJKYz2Toq1N5R+xYWcIieuN2Wnax+r3RlzUUthBY1DNQxJK+16Y9vraVKeOv?=
 =?us-ascii?Q?ciFBDLxjMBnxqoT+sZnwTXdFA2ZX7pswvpHf0rVOnnOcPC5tiTIoLHjD5oW9?=
 =?us-ascii?Q?9/ctH8oJADXDwE2SU4P5ckoXwSa/4PeF6Lk3iyfb59z0fuCaSoO87/KG/jR2?=
 =?us-ascii?Q?i6ftqoUv9jYSNUt+vp6pMfckMQ6lr8fKLoFXa5hCv0/d3pAzz2RjI8+U6JuM?=
 =?us-ascii?Q?Ek7MNxJ9XBjd/IwjAxXCsOu3R/IxswNpfmxjyD92RXkZ/59YOR54BOlxSWbT?=
 =?us-ascii?Q?bdE3aaehs6vNeJwNL76wnZl0Cx0O9LJzw7iB7J1B3wbUHh8exEFW4T1kjmMK?=
 =?us-ascii?Q?BoQwpr+fBmNzcNFV8WNX0KILcIuSAMeMEUiqh3JgCAfnGEXE+qM+E3UEFq2s?=
 =?us-ascii?Q?V/Gxz1kVIEF4kIAxpy3R/kF29hYZlquWh1Ra11+MDCcpMy7RIH78YLuITqeP?=
 =?us-ascii?Q?+KULrbXEMJbsuzfxiFxrKILGbuMoEh3wqfJiehLCwT51tS2oBsbIcLvnWgRN?=
 =?us-ascii?Q?dRlP97Z6KKNHGGK5AfIOZyQQu10yA8c/jGInm4GKzS+VBCJsnF4yCNOhb5ib?=
 =?us-ascii?Q?XxN5gJOFOPo6pgV4NG5xoLOqzNYN+B4Fsw/v+qRN/rixmGzvWyfcvwAs407n?=
 =?us-ascii?Q?/U1AmI6WyW/ot4ixEJmputGS+uNLossZL+FLOq2VJI+ejWLteRdglolQJs8P?=
 =?us-ascii?Q?4LCuJYONFZvgCy557jzVqN5dxo8aupixB10j1Hh536CIX8ivurJNesrxDVoC?=
 =?us-ascii?Q?MW03rojvI2D6sAL0Nbj0POoL/sZp09MPzF4On+7wV03Jp9ZxIJrBBiTDc3W/?=
 =?us-ascii?Q?l6QKHwG9DJ0e9TqIBf44O7C/4FZclyc7kyK7mrJ9pGEbWFiDD8Rw0VXYfQwq?=
 =?us-ascii?Q?etcM3y4MQb4F+Lkvnw6b3CAgsBp0+yMAKb0WQaxz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e428de-523d-4e3b-b74e-08dbb45f7bbf
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.6072
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycWPi2V2eA2dXK9A7lF2pYgAwYN3Kazx7LQavpvkbXFT/TIpbnV76EmUgZRQtUIo
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

This brings back the ops->detach_dev() code that commit
1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
into an IDENTITY domain.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 775a3cbaff4ed0..bc45d18f350cb9 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -400,6 +400,44 @@ static int qcom_iommu_attach_dev(struct iommu_domain *domain, struct device *dev
 	return 0;
 }
 
+static int qcom_iommu_identity_attach(struct iommu_domain *identity_domain,
+				      struct device *dev)
+{
+	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
+	struct qcom_iommu_domain *qcom_domain;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct qcom_iommu_dev *qcom_iommu = to_iommu(dev);
+	unsigned int i;
+
+	if (domain == identity_domain || !domain)
+		return 0;
+
+	qcom_domain = to_qcom_iommu_domain(domain);
+	if (WARN_ON(!qcom_domain->iommu))
+		return -EINVAL;
+
+	pm_runtime_get_sync(qcom_iommu->dev);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
+
+		/* Disable the context bank: */
+		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+
+		ctx->domain = NULL;
+	}
+	pm_runtime_put_sync(qcom_iommu->dev);
+	return 0;
+}
+
+static struct iommu_domain_ops qcom_iommu_identity_ops = {
+	.attach_dev = qcom_iommu_identity_attach,
+};
+
+static struct iommu_domain qcom_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &qcom_iommu_identity_ops,
+};
+
 static int qcom_iommu_map(struct iommu_domain *domain, unsigned long iova,
 			  phys_addr_t paddr, size_t pgsize, size_t pgcount,
 			  int prot, gfp_t gfp, size_t *mapped)
@@ -565,6 +603,7 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 }
 
 static const struct iommu_ops qcom_iommu_ops = {
+	.identity_domain = &qcom_iommu_identity_domain,
 	.capable	= qcom_iommu_capable,
 	.domain_alloc	= qcom_iommu_domain_alloc,
 	.probe_device	= qcom_iommu_probe_device,
-- 
2.42.0

