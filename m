Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 332DF72A424
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 22:12:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QdC156pnKz3g7c
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Jun 2023 06:12:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=up/STK1S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::62b; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=up/STK1S;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2062b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::62b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QdBg11HNrz3fBs
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Jun 2023 05:56:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQijE0w0+Ypo+nnKkRRURI+maymGa05KjMKMF37myQuTYKbeypGLjfmpF4JZtNR+my1WwZFYZrXa4QySHSee5QHH1zwTWgnW9ervFu4ObVSjwWW+t1gCjOvwv4GWFLht+oMiZyrZnD853RD+fUxz3YjBrkDfbMRrWb7p0g+LLk36EBRRJx/33lQULWnr7Vh+rX0ileWxiZEyRvE5maDZVdLMrxvFcQ3D526ffm2jot5HceVEqJJfS8idSrjb+/74o5E1EVHhXFgO2lvE8ETQONfBdQpQKheh74CBYE+mrGwwaRv4g6xCky7NAl0/+dyfFdvd+txhO6Dol4txGkE78g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccdy4lMCVhPTXmPL2kfCI+rEpB3OgvMl4gKeFc77hkA=;
 b=Lg0WI7hoSBInbmjyENDov/Q/YxPefMMSbV2e6Sy88zRn0ebNnC5PCdnP0uSO8JpWDLeoQM+NbW/c3bDNKFhKmKhHvbwGQewCCJ5VwRxB9B6gLHKu0n/zOI0/HUJbk9gCMvKQ4eiGRz9wkDeO9Du6epJslqDLTWDyC6DyTeDgRnn1kw5CnvomL7pe9Zi/6criHqnOrB938CsNdA2mMsb4T6yTMJVPTO8XgpLSZJHU061B3MNkrm4FmBQ03l4KEnRAT6nC98ZhMUcNfWnRHxqgm9MxBTOPRX/sgFfPjhVGaxaq/w062ZA1sc9s1kipys8WB9QC32nH96L1rD42so3ywQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccdy4lMCVhPTXmPL2kfCI+rEpB3OgvMl4gKeFc77hkA=;
 b=up/STK1SR99cpKT+OAal8d7qvqJEKmtCQZQOqAfSH2SCSlRMAEDIKVZ/Tp2LfBMrxSFweOQ3yISRn+Y2D5YG58GrfQWRA3gYvk+9X2Y7IWq5/+wCs0L3n//DjndTUphu4zf+mm/gnaI87i0Qrjc/TNAlD0wVFmHVaYSODSVS6T1eJBSR7OVKlUW8y40S6UxIkKdDSicBvgAh21uGuzykVGA6vW4EHsuFSZVLBWPqYFGx0Qrg6ACZZOqTcGd2Yc2VfXvbOoisUELvlmQpy5SzacrlLjREvK/6AES5NmLkX1hTs/fS0wtAMiysDHO6yyP4dykyXZHYDMvjDr35Cv8u9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 19:56:25 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 19:56:25 +0000
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
Subject: [PATCH v3 20/25] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Fri,  9 Jun 2023 16:56:08 -0300
Message-Id: <20-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v3-89830a6c7841+43d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0031.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::6) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: 294ae354-ea81-4727-8054-08db692399a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pKEbaQlDMT1n36p/5PowoDmzBydKn/wgtY6vRDCpOCd8RwSIA0sldUhTRDjDWyM9vR9FNgogE2DjvWvdKC4GF2Q5R9rrYKQ0hLTJO9MNCuRh1ZE6UhUC4e8M3EWPyv2r+3m1v8xmiH65V+s9w6ugldZC64MEmMURAIQWaCALcNuLEKcd+jZhnlFZxSBLbETTdCx39b8wT+tFBLN2wr4cNDkjtY33mZlZ710+G2A1LH18DeB6IwJKgXilHxd5HhUYpJ/CQXU/OhAjmRNGw+yc5cwnVBsX/EFDQf/P+yajIYE4Mqv/OBULZdMamnyBxO5B35Mmap73VILyVUl7DqHPviCSEYdbkox/0OJ1TZzixwb8r0NWVZ7UfIgm56KUVPI8F4t5i9RRJtDhUm0T2dbh/WI2GE51Yn3h+MlN4oL1gfDgUSVMLkUqJ0zKbKwK1cOT+lURQGqW+JNY340/JNARn2TEjsthFKFBMuq6+S65Gd8429um8fxkKtliagDXip+C0YZzJIHzqGam3VL4xx94nD7pPyl0mglk0XzuCuGa0CPrGLhf/XktuDYybQwiIPYSqSYjzF540NdJ+jzpMi9u992yfQe7sifuqG2QaOdL+wk=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(346002)(366004)(376002)(451199021)(83380400001)(7416002)(7406005)(110136005)(478600001)(8676002)(8936002)(4326008)(86362001)(66476007)(66946007)(921005)(66556008)(5660300002)(38100700002)(41300700001)(316002)(6666004)(6486002)(36756003)(2906002)(54906003)(6512007)(107886003)(186003)(26005)(6506007)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?hdDTu5aag2EDjWf+yMJILSrYDJIIamD9Z0MgEWl0v1YGw6C1PvMomjDFywel?=
 =?us-ascii?Q?Q53zwxC6lv+ZdRxil5/LJh7/RJzzX7JIeLPPed0ZV+XEnvE/lwy+YvR2oMUx?=
 =?us-ascii?Q?00/2wFV9BQdaJgVfGKHgTtkWxHQxXt6lksB1Cqg1c7kYky2RxJs8SgU+VfgA?=
 =?us-ascii?Q?bCWljwgreWYeu9+AD31iv6wUBc3vkZNwaHRqqpO1tjgo+inC3pXwDh9e/XXg?=
 =?us-ascii?Q?6qilmpLSRbK7cmVnQlsC94gyR8TsuBb1Rb8rPqbTOrV2l9Mi4YxZqtNkazli?=
 =?us-ascii?Q?RRccAKylgKAi0ql+a5cDMf9Kn2LSQfvsYdBBor2fDOqvSK+ALEtzAyuQ7j4I?=
 =?us-ascii?Q?YB90GxRxvP1nlsvw+bIgTNIMT3szs0wq9L5o04Fckuxbxf+QXKyiQnxBL9oa?=
 =?us-ascii?Q?oijy71xln1lx031oD1XKVyXz1QDknO72iw/K76gAqLwi+2mwwWhWakQoPp5D?=
 =?us-ascii?Q?Oy6JdA8R+svu0KMS5y1qMSD+S0hHhRrEAJuzvWJzm4UXGxoW8KDuBT9PUp/D?=
 =?us-ascii?Q?TzShs4TcebHkiDbYtqdHgZ094DQVdXx0rvVof7XKrtJFlVMrBVlF6+EwpUZU?=
 =?us-ascii?Q?WfAdmUGDd+A09hj2+6k+Ic75QwsOdfmmR1Hdo41Hs6Ojj5ceeLhlAr795dgn?=
 =?us-ascii?Q?wXnGEVFdxHHWBrfmr4jJNpPxHuhT3kYzdQAUVN8ihzkMCeGIrOdq+rS+Oe2R?=
 =?us-ascii?Q?wcBxC5rEKcR4IikWPeQj5nUgvcyvF05mthpvl+DD/IfMNBXnHpYR68tDclRb?=
 =?us-ascii?Q?7yNhUchZycMkcNh/QQbidOY2M46Bjltx5usGu4ViRaKYwAbKDj7xwrmS+dDC?=
 =?us-ascii?Q?VM49m3GGwMKlparTQnNtHO20nmoHZCu4Sb5YdDNj8ypuBdmDGrsx/NZCHOWv?=
 =?us-ascii?Q?MmB/0ZcRL58683RJHi9/tXaKa5eArTd2IQpyV8hpmBs1gp0TbV1x8Y3mentG?=
 =?us-ascii?Q?MNRcaZ/l5ySxFLUn2NkM0EDRqeQ7xUbNigjKRSFC2/xOVhi+t6P+Gu64156q?=
 =?us-ascii?Q?c5UeytiKZyujN0T/6CyYA82nhBhRFS2JGtEKLeDevBNC6p7KBq1MMJBRySm2?=
 =?us-ascii?Q?r9tfU3OSHKtXnY+Gt390MspFd0Sxn7QRED2Xh7w1ziIlsBgrlfOtPvtYNS3h?=
 =?us-ascii?Q?MvVomphYP82KDL98THwrs81okyRkjWdt8nUKkmpLlJW7MFH9PNcLyKXCNHL+?=
 =?us-ascii?Q?wGwTR4/awM/NK1R49gBRtUMHcdSS48ZhP4sKYVPoJelDCM5lRoFPEecM/TTl?=
 =?us-ascii?Q?5mDG+NC5+kW1yaOz8yzkuMbwm6+sYPI0wj00aID82J0ZIjasuZ/UDiuH/4pM?=
 =?us-ascii?Q?X6JoskqGZ64IjE7fkMs+pNmb1Q/O00N8ATOim/SoXkRfdLfreZWOsMdBMOvS?=
 =?us-ascii?Q?R9IfzGAoHVM1++zXTaDu2C9sdmaZC5IpGVKM9kWZWpi6TB0ST8fh/4YCGe35?=
 =?us-ascii?Q?mYB8dTxvqEyGJ5BAhVlkApHC9ynw4Li8DuTwIUxtg9A+b5wVr3XRm19tZuIe?=
 =?us-ascii?Q?E55f4v5KCOcwbZAnnzlfgkfT1pg40nPyV1kg4PsvcVk8UPxmIPJSzys+lOZd?=
 =?us-ascii?Q?aVDT+EvjTLuf8bQvTQKnk9buu0cTIOuhvVYaQiQS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294ae354-ea81-4727-8054-08db692399a2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 19:56:22.6721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X24L7t9dxkPLjvXaioUlYS/uwTLVHmCARxiic8EaXvayiWxzDx/HRu+Mu7254DXC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785
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

Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
sun50i_iommu_detach_device() function was being called by
ops->detach_dev().

This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
back up the same was as the old ops->detach_dev().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/sun50i-iommu.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 74c5cb93e90027..0bf08b120cf105 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -757,21 +757,32 @@ static void sun50i_iommu_detach_domain(struct sun50i_iommu *iommu,
 	iommu->domain = NULL;
 }
 
-static void sun50i_iommu_detach_device(struct iommu_domain *domain,
-				       struct device *dev)
+static int sun50i_iommu_identity_attach(struct iommu_domain *identity_domain,
+					struct device *dev)
 {
-	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 	struct sun50i_iommu *iommu = dev_iommu_priv_get(dev);
+	struct sun50i_iommu_domain *sun50i_domain;
 
 	dev_dbg(dev, "Detaching from IOMMU domain\n");
 
-	if (iommu->domain != domain)
-		return;
+	if (iommu->domain == identity_domain)
+		return 0;
 
+	sun50i_domain = to_sun50i_domain(iommu->domain);
 	if (refcount_dec_and_test(&sun50i_domain->refcnt))
 		sun50i_iommu_detach_domain(iommu, sun50i_domain);
+	return 0;
 }
 
+static struct iommu_domain_ops sun50i_iommu_identity_ops = {
+	.attach_dev = sun50i_iommu_identity_attach,
+};
+
+static struct iommu_domain sun50i_iommu_identity_domain = {
+	.type = IOMMU_DOMAIN_IDENTITY,
+	.ops = &sun50i_iommu_identity_ops,
+};
+
 static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 				      struct device *dev)
 {
@@ -789,8 +800,7 @@ static int sun50i_iommu_attach_device(struct iommu_domain *domain,
 	if (iommu->domain == domain)
 		return 0;
 
-	if (iommu->domain)
-		sun50i_iommu_detach_device(iommu->domain, dev);
+	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev);
 
 	sun50i_iommu_attach_domain(iommu, sun50i_domain);
 
@@ -827,6 +837,7 @@ static int sun50i_iommu_of_xlate(struct device *dev,
 }
 
 static const struct iommu_ops sun50i_iommu_ops = {
+	.identity_domain = &sun50i_iommu_identity_domain,
 	.pgsize_bitmap	= SZ_4K,
 	.device_group	= sun50i_iommu_device_group,
 	.domain_alloc	= sun50i_iommu_domain_alloc,
@@ -985,6 +996,7 @@ static int sun50i_iommu_probe(struct platform_device *pdev)
 	if (!iommu)
 		return -ENOMEM;
 	spin_lock_init(&iommu->iommu_lock);
+	iommu->domain = &sun50i_iommu_identity_domain;
 	platform_set_drvdata(pdev, iommu);
 	iommu->dev = &pdev->dev;
 
-- 
2.40.1

