Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F408179EA5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 16:02:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DGdg1K0L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm2Fn6Mk9z3hHn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 00:02:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DGdg1K0L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::614; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20614.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1sJ2mkxz3cDd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPVovjoXHvTnO0pXAbRxquagSQdlifICCiaJkCeO9/6FVkv1u0t2LIliDi+TmbIp7aFdUoUYqhnY/PpKrLCkW/8GnVh00IwEV+v5pj6HHQTEiWlvScYLdzszaiV8D4Ckjt9LZzzV6PH3dWKw+7UGD5Jd1g2o71EobPZGRNY3bKG30jMGe45p0GI8vGkbdVHXgIom2MhJPRMGgwoKFHSR87G01/Z23zBDzSQDIJISYCHPbrS9jikkQoMbBIihvFQjQyn04VUrpErvHTqwTKG4xhklf3EGpy2+zFU8+9h0m+gJ0dWsJVNJmBCKaIWeS3qlUcSqqXP5I740cJ7YEsovuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQcdF0HxywOpBQqZiGOJQ4kUbIVpQIl4n/1FcryEkFQ=;
 b=gDjw7pgvfh8FAhp3DPYUFJiIQy0gbV0bl43tyq+aDyS8G84dQ+JW+9emf6bwHimb9O+cAFcrpF2GWyK7Z9GUo7u0Jd/dNFFQb/3mFfmQKPFYNH9IPxNjzp3l1L7sYcyMwBRhnNFwqBSpZcUnOhLhbtAcxXRniSwcompZ/eV1cb3lTj1qeG1/bGLgPmQ6G17RbL13W7z2MnD5Jk4/0WXhRv7RzoWgsSg2QQdnrlw0RrskP5fqk7syA5bbbFhkN/Yxv8uGHNq9YyKD2TBtCfGiQUfACLR06cHF8yZXeXEuUrBcRejYvXMD/DpOJvrmnKi1cTz9C89NIyKDAP0pIMCuLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQcdF0HxywOpBQqZiGOJQ4kUbIVpQIl4n/1FcryEkFQ=;
 b=DGdg1K0LFFcLdM/UDBEYTe/vMzMTZUE9Lyd55zODyB+5xK3wGtzOFox+qAzPm2w7CLonVOF2BAYaF2jtFkioeVdM13owSvo34dbdlH+qg+Mmgacg+PJKgY1MDKb14qCaavIStZYCYH0KAvGfyqPD8gGmD4S4jWn43SthHruqC3I1igg9cnmHqqWFbXR2DRVL5btTCXsYmcP4n1qLGzfo5ax3PjxJlOV+WF8LfK+CaDfpuFvmgDiYXGwpL9sFxMZ4bSGo0Q8QD9lsXysT8UekgxbQlrEx2DUcrYjoZOnD7aYgEZoLsNDXUlnrl3K5P8u2Qz+6TZC84ehgmj2viNCVvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SJ2PR12MB7848.namprd12.prod.outlook.com (2603:10b6:a03:4ca::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.31; Wed, 13 Sep
 2023 13:44:16 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:16 +0000
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
Subject: [PATCH v8 22/24] iommu: Add ops->domain_alloc_paging()
Date: Wed, 13 Sep 2023 10:43:55 -0300
Message-ID: <22-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:208:23a::8) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SJ2PR12MB7848:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c23e77d-dcb5-45a4-ddf5-08dbb45f84b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JHMKAyE2AGNrRRvlzs8RnGTlydwyCJWI7tebbfRcdPPoVuDOVLdPhLBTO4lOspG2Ted+gXYp9bey3oGSDS6pjCY+Jc1T2xGo4p1+eLn+3jkI3hX/upBxXYaMM5JyH3r68QPQ6mx9fKnc9fbA/ezoJN3BqLeCYnjkVR6khZDBjIuOXCvYIFsYuhX2QRF9q31BQICRqRCaTgN20cLmz6wPJQAp6BhcuEBZQiL9i1vO44kKf/nTTtwIw504zrpJIlrYFVwdAGfElVA/VSHb4RI822DKvhfa6QS8Ylz1EThxdKDIdP/OiVNYiZxAbEEbbkEMGg+oJCuVpYFnnE1u5mTZnm2O2mZbnVPCZy/Is3yyf4g/FB4Aky5+W2uyoH67W5XdXuURkqwVPYf4ENn0JIlAU8A+u1GDPUXEUpWg1m0GLCzIqJLZCFcNC/dpFgFRQfoQz3Mw6AV6f15NzaAvFM9Cv08B+jDoDaBF/QTUYdK4N1qJJDY4NsUa73NioqdK45F2bHftBLzfuNYmK9pcbao1IJyNw5giw1decYbqs6QyzHUQOff/VS4lCY7c5C7bAqD+zaR1meTknwh/VY+ENCA5DRteS/K30A15DuOBj+6Vt1M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(346002)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(86362001)(6512007)(921005)(66946007)(110136005)(2616005)(478600001)(107886003)(6666004)(38100700002)(6506007)(6486002)(26005)(316002)(4326008)(54906003)(66476007)(8936002)(66556008)(41300700001)(36756003)(8676002)(5660300002)(2906002)(7406005)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?73rlS5TIEJDkK8IrcSrJ2W13N5gpDhAkVK8GrL1HHvGgPJ9Pp0oCUgCyMlCy?=
 =?us-ascii?Q?Sujt9wDDzeyvWfqonmYYjSeAI/DXV1GYQNUJxB2Zg1lJJq1AQXxIyQ6z472j?=
 =?us-ascii?Q?TImTtEg2DQQxHKOwiaojNSvjf9ppcs0tUc0PYf9NkNg1LJVw9HEzyZrwL1xW?=
 =?us-ascii?Q?b7JQ4tClzwc7zs4rlVCVNVM6dpK8YghJ5ZjOZJOgvGUAGfD2SoQObBJUiU95?=
 =?us-ascii?Q?wVWNoppZyFhoPsh55UMNL/LFMTaVyTbU3Rt+W6LvyruCjZBqENWGrFg2pg/+?=
 =?us-ascii?Q?NK5pbVejcdEFM1TBuRndzhP2KIzGz8lNiAMQF2Vkm9qxJ3t6WcV71iofbLJg?=
 =?us-ascii?Q?OBxvVJLH7WidgyATMqSGHYGO9XggdiK5Hp2pE3LmifM3XnyHp4VAm62sypvB?=
 =?us-ascii?Q?GnfYU7CnjLaxrD+syAfvVrUXDitZxn85Y1SUDWJcJPaqErR7iL/iDBH58FF3?=
 =?us-ascii?Q?IKWodToa7A4KOsNepcAj6PEKWX17E6T3nImwS4J3mx5BNXkExkn+f2IpAo8K?=
 =?us-ascii?Q?qZ0rVeIRR5m7cqS4Q5sVX6SGzmvslmDdZmllIfjm6TD+sFbj5iInuYJd1gkB?=
 =?us-ascii?Q?BbfA0Gr0ya8jTEL35Mqh6B29PUi4BkuqkMIuhaSGKKS/wvQ7lyb6hCeZ9QCW?=
 =?us-ascii?Q?a4MfLOUNkeAe9v3+ZSFCsPP8fwqC0DyONTcDlST7U8uIZrEMdopB9quJDkL3?=
 =?us-ascii?Q?5w9IcsnldWD8gb0wHte04T98GsuqkRcJJ79WdcbqgLjQJwhaXCrf95MlSu+f?=
 =?us-ascii?Q?5k8V4Y76hhXI1pfLwCbLPEk4RhDFC6iFxIJoM6SugyNmpLvCRlariCJY48Bj?=
 =?us-ascii?Q?prwHulNk/7fo86EfO9UOnPysoivBUJXUj2+Qha/vEBALExePPp1MfQcg0DcO?=
 =?us-ascii?Q?WgHx8D6XF2sFMxlVWYpEzYR4Z1CRQ0N+t7je4LXor5GU4g0knEM5r1vs0yl5?=
 =?us-ascii?Q?JlVinukcm/L56cjAT5dJ4+oJbEwaGH7d6QYLmZ22LcDjVvsUbD9orbLnFyXI?=
 =?us-ascii?Q?1FIkonsnWvEsJnXNasgDEV+Xe9t9S6nKF7O4aXNcDOFRe5ZnlmTGHVfNGGnO?=
 =?us-ascii?Q?6Q//2qv9JUeVvovmOxfXi/WZURGa8Mpr/b8ZhVOaGGHKkgC09zhggzWa0eWN?=
 =?us-ascii?Q?7cQkKfMOhLZip1qcHwDT2uKynwZsWZqBcGC2zHuVnP9PO7X7wPWF619AFd1O?=
 =?us-ascii?Q?GR2ARfsWhq/Z2P2bAYBAGl63KCdriFaiys4FSl4K2+ZA0KGfijLTPraBzZub?=
 =?us-ascii?Q?98S5B2U5nK1nE+jAOQLG8IoJ3XwDM6drgW1O0M+ozdgX6DURnRxzNxjU5YV4?=
 =?us-ascii?Q?bL87XP0rD6koaMv5Y1mYn3i2l7zpMJoft1mFiggpa6WL+Kow/cTb8WWTsX7E?=
 =?us-ascii?Q?W/73B3vopieGoqh3taSu54Hv945K1vAoZKNdrRLMBFIDqRhD0uHgprjbEt6R?=
 =?us-ascii?Q?2syCCoVug5U3qbm61X9VrLxq3Fk9rztmqMpfM+NpOfEb7PtnrfChekpcwksT?=
 =?us-ascii?Q?IQ5nXvJEG5QlyA46ENriXxe9IqdircNMFlqn2nGDbIYlIOaaZXymUpAiKHU5?=
 =?us-ascii?Q?yUFMPApn9yxLCac/TcfHo8QMycC8lhVwcGVPDvFX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c23e77d-dcb5-45a4-ddf5-08dbb45f84b4
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:44:14.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hhBnNIkNfGAR0nOByu6fGDu382Xv3IyVUEelbUCJ9rsXlDp7ICgwMNcpis+fZSyW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7848
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

This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
domain, so it saves a few lines in a lot of drivers needlessly checking
the type.

More critically, this allows us to sweep out all the
IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
drivers, simplifying what is going on in the code and ultimately removing
the now-unused special cases in drivers where they did not support
IOMMU_DOMAIN_DMA.

domain_alloc_paging() should return a struct iommu_domain that is
functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.

Be forwards looking and pass in a 'struct device *' argument. We can
provide this when allocating the default_domain. No drivers will look at
this.

Tested-by: Steven Price <steven.price@arm.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 17 ++++++++++++++---
 include/linux/iommu.h |  3 +++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 38856d542afc35..fe033043be467a 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2041,6 +2041,7 @@ void iommu_set_fault_handler(struct iommu_domain *domain,
 EXPORT_SYMBOL_GPL(iommu_set_fault_handler);
 
 static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
+						 struct device *dev,
 						 unsigned int type)
 {
 	struct iommu_domain *domain;
@@ -2048,8 +2049,13 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 
 	if (alloc_type == IOMMU_DOMAIN_IDENTITY && ops->identity_domain)
 		return ops->identity_domain;
+	else if (type & __IOMMU_DOMAIN_PAGING && ops->domain_alloc_paging)
+		domain = ops->domain_alloc_paging(dev);
+	else if (ops->domain_alloc)
+		domain = ops->domain_alloc(alloc_type);
+	else
+		return NULL;
 
-	domain = ops->domain_alloc(alloc_type);
 	if (!domain)
 		return NULL;
 
@@ -2074,14 +2080,19 @@ static struct iommu_domain *__iommu_domain_alloc(const struct iommu_ops *ops,
 static struct iommu_domain *
 __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type)
 {
-	return __iommu_domain_alloc(group_iommu_ops(group), type);
+	struct device *dev =
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev;
+
+	return __iommu_domain_alloc(group_iommu_ops(group), dev, type);
 }
 
 struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
 {
 	if (bus == NULL || bus->iommu_ops == NULL)
 		return NULL;
-	return __iommu_domain_alloc(bus->iommu_ops, IOMMU_DOMAIN_UNMANAGED);
+	return __iommu_domain_alloc(bus->iommu_ops, NULL,
+				    IOMMU_DOMAIN_UNMANAGED);
 }
 EXPORT_SYMBOL_GPL(iommu_domain_alloc);
 
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 511dfeea527215..3f173307434dcc 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -239,6 +239,8 @@ struct iommu_iotlb_gather {
  *           use. The information type is one of enum iommu_hw_info_type defined
  *           in include/uapi/linux/iommufd.h.
  * @domain_alloc: allocate iommu domain
+ * @domain_alloc_paging: Allocate an iommu_domain that can be used for
+ *                       UNMANAGED, DMA, and DMA_FQ domain types.
  * @probe_device: Add device to iommu driver handling
  * @release_device: Remove device from iommu driver handling
  * @probe_finalize: Do final setup work after the device is added to an IOMMU
@@ -273,6 +275,7 @@ struct iommu_ops {
 
 	/* Domain allocation and freeing by the iommu driver */
 	struct iommu_domain *(*domain_alloc)(unsigned iommu_domain_type);
+	struct iommu_domain *(*domain_alloc_paging)(struct device *dev);
 
 	struct iommu_device *(*probe_device)(struct device *dev);
 	void (*release_device)(struct device *dev);
-- 
2.42.0

