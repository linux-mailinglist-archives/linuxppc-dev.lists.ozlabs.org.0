Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C024C79E9F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:45:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RaUCQ/Fd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm1ts4VVQz3dGN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:45:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=RaUCQ/Fd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::606; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s34Fjhz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:21 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f9+Brr4p7xirlTSCnYgUFEkWMkpGkNr7bgLTJz/iS0IfchvCotkYvcZpCO7qZqssK0Mw3V5tZQoOA9NpInB4VMhRi99rPFcZ11FGRyEwB9ca5SjBwBF1v8Cb89o6toZMBm9XjOTFjEaoa1KTycNGtLTXRdNyZ3i+ailUusg50oXHm8z29RD8lRMNkBrBL5YQkUdUfdZoioSpvtfRgJyGpJEoaM1oB+z6Y5i3R5pw0GV1+jwgdtcxvGkKyCYeRq9wlM+wNu47JBtPbAuPpSrou4HTC5FJjX2pry0DIDpTaboHPyGDHNt3s3+ryGG7ls4jPKJOwRVWzbOgL0wJ6LlIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkX3ucDsFIkmcvtH8Fk0dj+TXSDnts8NcoUAfdOzkug=;
 b=em32qs03ZmP5SnHZBNbXN9Sv8foxulA/G4UFzdHUK64QjR2c94Z9nGKEl2403EqddWKiWUg8+vlEKTrMSJcZ1U7Fh9Ys5sa476+1M4wq6SUgVFHLSXx7ML4GOcNEowYgSl+ClJIhAfhzGro/CtgdUGxY+TNWbrieiuB9JBhK9wpdGC63h4uj0JcueidaVAODeqyEdBef3NW+u3f7zkAKYAZhHAMS+sMoRru25iNGYswrRAm1ZOtTLP/p4QOmP+zJpt4srFKBexzaqFiPwg5MeobTHIqrltUJ70gh2ywZS0dCA2wTLJJoBNxAMstiRT0VCzGzRdHV4wt0TrrA/MVhag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkX3ucDsFIkmcvtH8Fk0dj+TXSDnts8NcoUAfdOzkug=;
 b=RaUCQ/Fdl6O6lWequZNLj0GC94rzKvLUlc6I5+C7oU/6rZiQhyvRRErLRL+zTgK7UP4LLZAab46jMIYEV0mN59qIyJrddTMTyGOumfwOlSEBPNp8AXx7dadSeKMNB95h/16FF7xieRtyMBQEVqBF3i9YL6ZeQTA4xylYmpoZ1sTgI5e8nMC9QAfPeytLtTrewSwyTDhHX8/hqsHQqx1tRoyAcbTFuNe4Fa5lx4006XPdZM3+lHw5s2BPTI6x8822LNp75Jh2Lh/CWbldOLKjM0DNMVXdGJ7wTE2AXMkJLWW2XES8bWqqtMf+vipY+rYiCH74ZCtYBN4h46IESHljSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:43:59 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:43:59 +0000
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
Subject: [PATCH v8 03/24] powerpc/iommu: Setup a default domain and remove set_platform_dma_ops
Date: Wed, 13 Sep 2023 10:43:36 -0300
Message-ID: <3-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:208:e8::46) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 397049e5-2842-4690-c5ca-08dbb45f7b24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qf4ttNUntYFdg6DNQ4R+xXMNl0EGerJS6LXZo0exuVdPbgFo8N9EdAJ2E5k89gi8l2tJoQWxjQWJR3vypI2eRbRlcV/53g0d2XbOghVTUVEbOq88t5PUXFCtMLOPWzDVJ8cBQGPWlUImUtWWCrvbpGIZGq3/f4YEwyvUXQJZyo4FG0bIa8dHs7PjV8+57LEFpWLAe0vB3hE/15XJV12C0Vp8USQ+3TiHIlR0w2rJx7mo4646ZvPJwwtZelidnuDKi76KCysfhTw1xDT+wATFeXIYVEPC2c+xFKIcP9dm4gssrannbwf5PNlVNjHU9mg0l1RVvL7wUKBj480FYfynq3CXJzFRMtvlkULopnJUO3YymoAeQ1+cKZ2fNvZ3DthG5oNFbFxydDm6XTY76/IbHuKN2sy/JmGgV7qInxs1qOR9ymtyoILnB9plSPbo9TMxiGGKgc5b8GJaDTfbtAtv9TLgrwxa5u2w6vFXAUlFNIGY53uLEfigULXqr3gACvd4vBkoeaIVFYkuch9NuQm9Y25ljDgLAIJKVgqZN+tm9a7MWBWND+OYLRqleuUcmzwfCEBpywDFHpo5KdIDEQLd7dpXNoIokcrPAoWvEVV+FAC5J8V+D+fplT9qXBdNxN/U
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?FPoV+eLxV4gj2aBvLNJa1P7fx0H9lNEkNvIYGmvLNlxulELBeoPcgc8zY5S1?=
 =?us-ascii?Q?R8CgKZDJScAKcwR98umBKcgKefswcgyNrqKQcajJqwudcMC5XNUoW4eaTKhA?=
 =?us-ascii?Q?Idc70QK3B0H+3xqI3VNBgSU4OqUrStAnZeBc7UoGchpiBOyK83nmDsKA39u5?=
 =?us-ascii?Q?XzgXWLqQE9uY4tMsigyCR8scd30SlqAEFtwZRBkq4yRGAispVLwNFlCLbfvQ?=
 =?us-ascii?Q?/zaSiyflQfqMLFG2ga2PCu9T74e9o0wjYIxYDXwj1UuMBAtILEo9rwGtqrQu?=
 =?us-ascii?Q?7bsDC+m7Nepm8zuV7Jabug/UzHc5zMy8iXTVPkKQ1kWElw9kLRq4rFo3InY/?=
 =?us-ascii?Q?efcwVFGxYMBgkgpf++RIzJmXhGi0oHKKT+oqv+3tikAJRtwbj9rgMXaSsmad?=
 =?us-ascii?Q?5HDOF4b/yXlMK/9tQN0Vdg8ZFNN0M3qQ21Ewqj1Q6WU7nic/+5+zFd5Du+4O?=
 =?us-ascii?Q?rKRnPDVwz3P/tXFFpqU2XyR8LQg270evdGRjGysVpk57/NO0pUN9y8knyCJl?=
 =?us-ascii?Q?mIKUxdh/E69cQbrEGGx0DTNcqaiQHdo+JoHwSVfE8t26ZUViK7xUECW14fWM?=
 =?us-ascii?Q?9kc9Px840iV3t+Z1quu3wjDN3DEpyn3EcK6oWgLiHgFww75AY6/CyVi8dpWk?=
 =?us-ascii?Q?qJbe0TuyGzj+zYHQPimNt8aqcmWsEf9ZhFps3RXGM0uuEXTsa77V/i2aKXWP?=
 =?us-ascii?Q?jYh3bZ4O50O1Xr8251TVnl61AwryAyTJq98faX1JAVxalRSHOOgFQseyBIr3?=
 =?us-ascii?Q?FJ8yzw/2GdKYTwGf5HbyNIP+TGPNYOpgI3gnfGCNB6BRr9nQDtAsl8Onq3/A?=
 =?us-ascii?Q?w2hF40r4vRSDY+xAXSFJwRlTAX9R2S/dO2/NrmaDwkzH6oQe4AUlqfZxEmZL?=
 =?us-ascii?Q?9qdeL4QctyLJ2WHo2o4WVy680NjMpGTV/xXbkJrHu7xCI2LZeSC2ZnCVkXEM?=
 =?us-ascii?Q?weaA/v5G3eu3h82hEOMM62Y6KApz8lZnMwZw5rx4kDJkfF/ADXguOzdhbd/P?=
 =?us-ascii?Q?UoXdeidm1/gv/GkQm5mlAX67CIrrqoADU3f4/tRDqWSN/I8eZk3SXW59lDlX?=
 =?us-ascii?Q?xHSalUn0yYhYfQlJkbvDlTcuV8+ruE9e2uFSEcRnsPEKzCe+mJnUKFP/8LJ/?=
 =?us-ascii?Q?GhYh8C2B6UCmdFcf7SDLrLfhuxMskDcDIUt5qjX2M4/KJFUmgdJujkeKm0yO?=
 =?us-ascii?Q?OfQxmIYhkU8auijwjH5p8/+aE8btYjMnUFRbA7GBXTbm3wPmqGjR294Os0Jj?=
 =?us-ascii?Q?tujuEJpQkbJed9TRy3zsqbuxI9aIbviDtS4b5knFRUzLO/n+cGIsXzANxCqh?=
 =?us-ascii?Q?82qkQ/MDIhEuYdOzC2la9vuhnwP5QY/Srp1wC4xZlTXqDRJ0r36YJ3z3gOGs?=
 =?us-ascii?Q?ULQ1BseLNDhUAeY7VLfzu6WpnKwwOmj4R3KSI2T4IQ3PIHaAkAGgClcIkX7a?=
 =?us-ascii?Q?Ekt1m+w9WQDYfnS8ZLP8hn3WV7qhtX73s2v7sJ+jlcIdCAiNSCbD5xRgbpfi?=
 =?us-ascii?Q?wOVOoYuETcO/TCVBJ0Okoz09bLm5bxnQBbdWb49LeUIGxR6qd4XLtA3jBWwh?=
 =?us-ascii?Q?Zgg3Iw0+fTxHjnF1IJALg+Xee86Ie+XBc7v9f1IH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397049e5-2842-4690-c5ca-08dbb45f7b24
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:58.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: brf+Tvpcwy/RBkgi+SggHRnM4Cqx3u+7fP24bVg0tyq8fb1bmqEMILfNHyxQfOGx
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

POWER is using the set_platform_dma_ops() callback to hook up its private
dma_ops, but this is buired under some indirection and is weirdly
happening for a BLOCKED domain as well.

For better documentation create a PLATFORM domain to manage the dma_ops,
since that is what it is for, and make the BLOCKED domain an alias for
it. BLOCKED is required for VFIO.

Also removes the leaky allocation of the BLOCKED domain by using a global
static.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
 1 file changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
index 14251bc5219eba..d6ad3fde85a212 100644
--- a/arch/powerpc/kernel/iommu.c
+++ b/arch/powerpc/kernel/iommu.c
@@ -1280,7 +1280,7 @@ struct iommu_table_group_ops spapr_tce_table_group_ops = {
 /*
  * A simple iommu_ops to allow less cruft in generic VFIO code.
  */
-static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
+static int spapr_tce_platform_iommu_attach_dev(struct iommu_domain *dom,
 					       struct device *dev)
 {
 	struct iommu_group *grp = iommu_group_get(dev);
@@ -1297,17 +1297,22 @@ static int spapr_tce_blocking_iommu_attach_dev(struct iommu_domain *dom,
 	return ret;
 }
 
-static void spapr_tce_blocking_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_group *grp = iommu_group_get(dev);
-	struct iommu_table_group *table_group;
+static const struct iommu_domain_ops spapr_tce_platform_domain_ops = {
+	.attach_dev = spapr_tce_platform_iommu_attach_dev,
+};
 
-	table_group = iommu_group_get_iommudata(grp);
-	table_group->ops->release_ownership(table_group);
-}
+static struct iommu_domain spapr_tce_platform_domain = {
+	.type = IOMMU_DOMAIN_PLATFORM,
+	.ops = &spapr_tce_platform_domain_ops,
+};
 
-static const struct iommu_domain_ops spapr_tce_blocking_domain_ops = {
-	.attach_dev = spapr_tce_blocking_iommu_attach_dev,
+static struct iommu_domain spapr_tce_blocked_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	/*
+	 * FIXME: SPAPR mixes blocked and platform behaviors, the blocked domain
+	 * also sets the dma_api ops
+	 */
+	.ops = &spapr_tce_platform_domain_ops,
 };
 
 static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
@@ -1324,18 +1329,9 @@ static bool spapr_tce_iommu_capable(struct device *dev, enum iommu_cap cap)
 
 static struct iommu_domain *spapr_tce_iommu_domain_alloc(unsigned int type)
 {
-	struct iommu_domain *dom;
-
 	if (type != IOMMU_DOMAIN_BLOCKED)
 		return NULL;
-
-	dom = kzalloc(sizeof(*dom), GFP_KERNEL);
-	if (!dom)
-		return NULL;
-
-	dom->ops = &spapr_tce_blocking_domain_ops;
-
-	return dom;
+	return &spapr_tce_blocked_domain;
 }
 
 static struct iommu_device *spapr_tce_iommu_probe_device(struct device *dev)
@@ -1371,12 +1367,12 @@ static struct iommu_group *spapr_tce_iommu_device_group(struct device *dev)
 }
 
 static const struct iommu_ops spapr_tce_iommu_ops = {
+	.default_domain = &spapr_tce_platform_domain,
 	.capable = spapr_tce_iommu_capable,
 	.domain_alloc = spapr_tce_iommu_domain_alloc,
 	.probe_device = spapr_tce_iommu_probe_device,
 	.release_device = spapr_tce_iommu_release_device,
 	.device_group = spapr_tce_iommu_device_group,
-	.set_platform_dma_ops = spapr_tce_blocking_iommu_set_platform_dma,
 };
 
 static struct attribute *spapr_tce_iommu_attrs[] = {
-- 
2.42.0

