Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3B275FDB2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 19:30:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mFVbFOEZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8nH23DKMz3cXQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jul 2023 03:30:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=mFVbFOEZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e8c::629; helo=nam04-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on20629.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8c::629])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8n6Y6f2Yz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jul 2023 03:22:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrsSniUx1g6YTJD0OW2/kHnhwO4XutiSeYEjzldV4Q1q3YVNKBwG1I0pofAU535421zQNMXPo6ko4CCmCE6PoM5Ls0WHkwQsOisO8iNPcGniaI3EAQI1FobwmoA2vDY8CTxEy847w2M+UjOExOtmDrn8D2IZ5PUAuxiqmV363L0tM8VaQZf5Z/MGVFV0haRDWI0n3+hA0/nGbGoUPhD3g9nWyWosHoaplMk8U2rBwar2/gKWsj/l8lZzHTlMz57CRPi8HEYwhZOQUDJ3iQMB2gBlTTWNlg38vNklAMZmuXY1BALr/StTsXGaDHV5nBiJS0r9EF/YYLAE8fwtUsXEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYlxcy3yMGsIVIlD8LPwPMp6KhU7POD+Z4J27TYymUI=;
 b=oVl6BD5nB6Ls4SLgtb6/OxW0DnNIUoLCfXu682uQ5WGe6fNoPB+eYuN8AyNdztEsJNJYqz4BWxVUHlXek/+nLB/qc1HCbFzAoA8QnGH9UTPxYoR8YL3bRSH/QNMJHxMnlxjRMHQnNPvmYwpgWRMjA49xv9v2BmM4KF54INl+leeVHhE05OJOtRp2SIsjqTebpMczrG92Fa4Ie0yt+KaTYNDU7xHqoIlNp6iqdgtM0il0mgWXm1q2PxrPOzRWtUSR0n4Zmq5MGb1u/cgErkd+o3VbP6LL/qFzDezwonrGXHYqJf3BmPn5fcgVOoSaNNDXfAi5OXJoRH7qzHLf843IpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYlxcy3yMGsIVIlD8LPwPMp6KhU7POD+Z4J27TYymUI=;
 b=mFVbFOEZ+h3jhSy0y1MS1ELWCBq30ufLxpzcbglFlDZY7MObdbVrgKj9SXG4KSn4bSIzZzM1zmui+ursHd1gUMq3hfsvBzZM8aaxvHP33M+KaIvt7CqCeFssUDXMaJ/OqyVBKT7MRMZz9OKs+n4aaX+FcdjBcs2l8pATQTgdZoIF9N+l9axTH2kzcBi1rC9YSLxfG1swpnrSBXCjDn9GwVNdBWj6gM0mBWRJB5OiQ9Bsy5H+RUs6TSHYzKLcGr7344Xv3Xq/KaI/GhjGS42C+AShy5BrAUnBubgOYVrLGEZ7EYRN8rNUmHbx/3qCrIC/CNxnVwoL0itULVe7bRjKJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by CH0PR12MB5252.namprd12.prod.outlook.com (2603:10b6:610:d3::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 17:22:24 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 17:22:24 +0000
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
Subject: [PATCH v5 18/25] iommu/ipmmu: Add an IOMMU_IDENTITIY_DOMAIN
Date: Mon, 24 Jul 2023 14:22:08 -0300
Message-ID: <18-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0007.namprd22.prod.outlook.com
 (2603:10b6:208:238::12) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|CH0PR12MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ca101f-9c4e-4a88-63cf-08db8c6a8880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4uY/KoePL4iBpn+nxQmyDAXRaWIrU4EYbGUkb7OwhTVk6ZN0t+PtajM1QEuKtADiEq9yDseFIIZ8XNJotf7KXQnvGwpi3ajmubo25KWi0+lS9LIiim//U2WCqUvFrSEYfPLq20lbNLJVrIGPip9ktQvnFPEl/qW61hB/IFCzREN99hNbAqQmnGMBuJGcYm/6nQRl/yYuoHGjFI1CqDXKI7wRZSl/CCz08RN/D8LHg5f2MWLsAEM8wYPeuxfmw4UBTWAYFuhtDwgZXMCRvArTdqQRc3SLNPxQv44Yxf/MCY31epr0/EIyMqMNSEkn7bZpDsoXU8bVHc+5a7iz12xPVKile1LwrceFEA9T1RE/mQmOTCOKGZB+5a1ch+FWv4Yd1LcC/CBKW7Il7eTLgjK9n/A8Bg3SDEgLTn0b6M453kiCqzzlU6pdeyX5nBFKJpskCA0scJiRsYBnqj+W+EJpoKxSzKNgEEYljcvQKt/QU0wZurVe82Y/krRDtmgHU680IHqDWthPChhngohFvJPqROQkverpGZCssFox4MRqpw1TthBoX24873ykyO2wsKF75Uvpotvl5goP4a756bU79hkMxpejrQrxc1ud7h9fpKs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(2906002)(2616005)(83380400001)(4326008)(316002)(6512007)(66476007)(66556008)(66946007)(107886003)(41300700001)(6486002)(36756003)(478600001)(6666004)(86362001)(110136005)(54906003)(921005)(38100700002)(186003)(7406005)(7416002)(8676002)(8936002)(6506007)(5660300002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IRgh897fiCrGJN6XqCEJVS1NnoxcmrTjT/q6KXKB7HMWMFigbraSqNSky3Li?=
 =?us-ascii?Q?QMn7rFu2zo7qv2lWxztUs2+o8SJZI1+DCnEmwYxtOuHmfD150H31WxcExiWR?=
 =?us-ascii?Q?/WloavCwDVRnqK6rVdEzdC+QMsx8F6A3M9krbaA2e8u8JUgOwyLFN7LUSDck?=
 =?us-ascii?Q?TeLUcohsU+whyDQ774aLaOosW/W4fMQzetpW/R3u01/gYGpzxYOIHwCYRnGx?=
 =?us-ascii?Q?MrhWR8RtIyChx5yBFDdO90PZNQT4PNtORCnSGdabb0tWWQd/cQPfSSlMMPFz?=
 =?us-ascii?Q?3UeyZDNgjAnS5ZTdH1u/v7i1Z7bCgth7VPzRgVJCJvVri6hGBBICGXpSqOiB?=
 =?us-ascii?Q?lxkZmrawAKnuG5PfxHSa3WWwNs5bGbD1G/59HflqxasFgHkpVM7RXjOR+Vry?=
 =?us-ascii?Q?uNfaTzsTP5dTKukyoHqZ3zeZ6ZPMENMlwyw40+hFXd2KTN7QNMiFmxV+aGNf?=
 =?us-ascii?Q?AJavx9XdNxHepM25Uq6VsDLQiix3+gZ5qBBMDPPaAS9dU6Fxwxdg2J1aMP4V?=
 =?us-ascii?Q?ctr7qcxVfb446OoGV4dPmFHjb7ylCmSYp1HgcnisURRZiP3CbaXINSsOeyq7?=
 =?us-ascii?Q?5zKW3GgB4E5F6UuVo8GIWy/Vh4kRHDFWdU8DGpqIwYkJ/Sf6E0MfjXxxYrSj?=
 =?us-ascii?Q?QdOg3RRtsAAZf0nqPoug4aQRfTc3u5gGCnYzWB0csMKZbFzWJZNCOKOxVOJR?=
 =?us-ascii?Q?NtS8EkXGUFmvgarp5fGSCBLc/BYUPNYAzKOtSIcDq7k2hsVcXQSCFYpzVsym?=
 =?us-ascii?Q?KfAF4mqcOo6O5YEGhOqRtdHxTcMQTbws4KeH96SbnrfnBDzjBR4z7LZNd5Xt?=
 =?us-ascii?Q?Gz4J2ZOQXk65XO9+Nsky8aJ4jQW6kBQGMNhsOPUD3Iiv/NX4hiczquTBaYyo?=
 =?us-ascii?Q?Cihy/kORPu7fqwsVSOecURJwK4l9FRA86tKXqpfwUzVgWu5r84w6241m8hce?=
 =?us-ascii?Q?cRwVNzglRXde8fzoh/+V+UE5sMV5qHFAf0BPTTYDkRMHyi9YOpNeNK2wkrVi?=
 =?us-ascii?Q?v0BGGBwQ7/jxo3LPpz51rIo7ehNzDknr7j77JdiUGH6iVDtrnItWmpymupty?=
 =?us-ascii?Q?F8OkHEN/+18Vg+Eo1Xh0HX3tn59dmnFb7eZzmkQs16DLMhxZtTBxQyAPuoVu?=
 =?us-ascii?Q?pJS+xb7Z5OkEQLKUFXIofIPhlwfsQsshEA7l0dY2gjDWWXz/NNRUbgIBmiZS?=
 =?us-ascii?Q?vWKTwxOrYkZHIZV/i1aS+K66xOngEWl5HhwJxbN26v97zfWgXrtE+deVi2/O?=
 =?us-ascii?Q?jkMVjMm9TIR9VDt1dYJpLXEg198ppJ3DUc7M16P3jNB3ZIJlaecWpT9Z3Drd?=
 =?us-ascii?Q?zAF8c9p0EpAPwrBU4FYwhNvctboRXl7gQgGF0ytOcP/kEjELxBGN9AB7iSQq?=
 =?us-ascii?Q?3N6WPtEBsV5Gca1A7NY/6c6y1PZvCs2ru3ck+j2xubzzntw8EaYN0cJjnLLN?=
 =?us-ascii?Q?GMevbme5qQOe3h+WaDE0WDmjq/h4ejCO151L7aCkkDEmn8ocqcA2Q99KBN2D?=
 =?us-ascii?Q?hOxHphKIVQL/orVdgMCOqbzRZkJI1DYcvTxVt1NWFeauv4HG16cJQF3G7hed?=
 =?us-ascii?Q?4MOZEdfpYu4L6ZeyuXF5fRy+YTaczDhR4YpL9epb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ca101f-9c4e-4a88-63cf-08db8c6a8880
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 17:22:18.8551
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnMUXvmrYt9+QqDbNtD3NkOupFvc8DD9SA7RjcxoVUpqZVuNYfu3JeU3k99O97tF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5252
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

Also reverts commit 584d334b1393 ("iommu/ipmmu-vmsa: Remove
ipmmu_utlb_disable()")

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/ipmmu-vmsa.c | 43 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
index 9f64c5c9f5b90a..de958e411a92e0 100644
--- a/drivers/iommu/ipmmu-vmsa.c
+++ b/drivers/iommu/ipmmu-vmsa.c
@@ -298,6 +298,18 @@ static void ipmmu_utlb_enable(struct ipmmu_vmsa_domain *domain,
 	mmu->utlb_ctx[utlb] = domain->context_id;
 }
 
+/*
+ * Disable MMU translation for the microTLB.
+ */
+static void ipmmu_utlb_disable(struct ipmmu_vmsa_domain *domain,
+			       unsigned int utlb)
+{
+	struct ipmmu_vmsa_device *mmu = domain->mmu;
+
+	ipmmu_imuctr_write(mmu, utlb, 0);
+	mmu->utlb_ctx[utlb] = IPMMU_CTX_INVALID;
+}
+
 static void ipmmu_tlb_flush_all(void *cookie)
 {
 	struct ipmmu_vmsa_domain *domain = cookie;
@@ -630,6 +642,36 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
 	return 0;
 }
 
+static int ipmmu_iommu_identity_attach(struct iommu_domain *identity_domain,
+				       struct device *dev)
+{
+	struct iommu_domain *io_domain = iommu_get_domain_for_dev(dev);
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct ipmmu_vmsa_domain *domain;
+	unsigned int i;
+
+	if (io_domain == identity_domain || !io_domain)
+		return 0;
+
+	domain = to_vmsa_domain(io_domain);
+	for (i = 0; i < fwspec->num_ids; ++i)
+		ipmmu_utlb_disable(domain, fwspec->ids[i]);
+
+	/*
+	 * TODO: Optimize by disabling the context when no device is attached.
+	 */
+	return 0;
+}
+
+static struct iommu_domain_ops ipmmu_iommu_identity_ops = {
+	.attach_dev = ipmmu_iommu_identity_attach,
+};
+
+static struct iommu_domain ipmmu_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &ipmmu_iommu_identity_ops,
+};
+
 static int ipmmu_map(struct iommu_domain *io_domain, unsigned long iova,
 		     phys_addr_t paddr, size_t pgsize, size_t pgcount,
 		     int prot, gfp_t gfp, size_t *mapped)
@@ -848,6 +890,7 @@ static struct iommu_group *ipmmu_find_group(struct device *dev)
 }
 
 static const struct iommu_ops ipmmu_ops = {
+	.identity_domain = &ipmmu_iommu_identity_domain,
 	.domain_alloc = ipmmu_domain_alloc,
 	.probe_device = ipmmu_probe_device,
 	.release_device = ipmmu_release_device,
-- 
2.41.0

