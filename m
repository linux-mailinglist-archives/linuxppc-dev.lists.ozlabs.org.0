Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6325179EA0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 15:50:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hO7qycxb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rm20c2SxCz3dxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 23:50:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=hO7qycxb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::606; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rm1s45NBLz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 23:44:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDcBLmytfyYSB6sThXjmTM0ZhBnOqyhJrP8yQSBSr1dV/6LR7lMOLuppoPkOHnVSHBuTECbOCkncuHLSPBJeDRDut6OFQXK1cJIgTxMPoonE//3VSJEhXqikMzA0PiGE1n4AXlgXHbusers+BD3ZMzGyouYv7gOuFfRLk9wvh28/m6OHmE97w9GEZ2jDbCXAW9NDk+OZeJSjpBBW52XuvuOrSH5jCFwGVTgkWKDsxzHWsVUpokDkqTbhtKIA1871rJJhWtcZ4YdF6oA4o7q8D1nz6LkTTbrKeu84ZeKMpna2vrr5PyI4ydKDmoEnXt+5LZKRxZIOsthaZ845dnb/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ou7rfQroeYq9baTZ4HBkLryOOjpPSQIHHIszthUqJ3g=;
 b=TBLeiQLXmGQLnvGxTvc/CxTvaPC/yeIhXwg/B4kMGyOy2d+B02tRiExC+hGoj/SC+3oxoY2cFu44f8W3uJiRIiyRSD9lVS9aVwiwURv6mBRstQeS54d9nuS0Xt9HFraxfuxzh5ZL6YXjs7q49jixCabVlcybyW82FjESfH7PjT4vrw3wC6Xo+r6L3YUg9ED8wiC829oPAGQTjpsoisqyGF/D2I5W4tM7sU62M3unX3QLxA2n89wZhBFbvbgNxYVUvQbgZ92rKBhTC+zUFgcZmegSsFRRdW38+U9VwTcRtUS43eG06X/8PI2ZO9n9sP7PAF+8qXFnoyI9Q/TVUkA17Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ou7rfQroeYq9baTZ4HBkLryOOjpPSQIHHIszthUqJ3g=;
 b=hO7qycxbw7oNWLYmRjwUHO781/AlI2PjSQDIqYEb8KMpLszCo2baVFt15Ze5Wk99ZTIRLWWbESHMuyIq0SCTQNRC0E6jKXoFDwbFBTuaQSn+Fd/HO7iPO1kOAGPKwUaM7bXp7Ls7Bjl1IBfC2pStsW/bi9dG7LW1hhqTdjk2d1L/Jc7Qi+7CBIcpPV61fh9bSSemHAjjJ8sOWUwXoiBm8lgI1bUS+FsaDtHHmU7XKUEb6E5VfWND0+hXAVth/jJK8HESgh8n/Q0X/TH6DT9rqbrFIff/Vu+kFXoJjxz6OSO+n8kME5mmC2J5rduJx4fa9CdydnBI7Ql31KxTs99PWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by BL1PR12MB5096.namprd12.prod.outlook.com (2603:10b6:208:316::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 13:44:01 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::faf:4cd0:ae27:1073%6]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 13:44:01 +0000
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
Subject: [PATCH v8 19/24] iommu/sun50i: Add an IOMMU_IDENTITIY_DOMAIN
Date: Wed, 13 Sep 2023 10:43:52 -0300
Message-ID: <19-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v8-81230027b2fa+9d-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0373.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|BL1PR12MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 11c573fd-4137-4a07-5ad5-08dbb45f7b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ymv0+hdVc5lIQD5kHM7jv0WvugI8kUajj9L5zKIA0T3A6Bi51ZR4WSPUz1w7pO+5lJ2hshNpjFi9kcblUGCHTxEA/bGEw1kKCCZ2P82byIVZzGIbXCo+haEZ6Fzk++VPt88oZyb6fNNZf6mUQxfpvzfvcgwBXZCDLwVAAX3DVitb3rzhuIulv8kxql6GzgXUwg/YnDRTP/krpt//PQFTtkO1h8pVAvYGjNGv60U3i7AAUX07f6jZ4GGTVourjwydSSeIKXfXDsGqwJNtrVMVKuuzhxbgGVVjLEToFmQSSo6SRVSZ8sYDnGe8DQx65k1mq4q9F5LTaaL8stvaXMUGjs6x99z4IQmrutZ9ucun4RmjQawkNmIRGRZ86KqKm2ZJjlGM9dnAJa2hkvfYZYLvaU5NIEYgfHe0Pt1Zp4VsK8li0VZpsSP6KgccBPZKsj2Sb4XFWejTeVWnEodFfBsj2CoCDJ7LIJKZ2yvbKyriUTN3JHwNmTeaMNCme4WTVa7r7JwaADeKOdnJIrAVR5CyFvL1jzjTD5Ht0DrcNnwx45Z+J62+HxaXJIbfb+NHcvU2Q6dl2GZ6yflcbEpMxDwq5zyvvvJJYhnD81iowS4TNo8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(39860400002)(396003)(136003)(1800799009)(451199024)(186009)(26005)(8936002)(8676002)(4326008)(6666004)(921005)(38100700002)(2616005)(107886003)(478600001)(5660300002)(66556008)(54906003)(66946007)(110136005)(41300700001)(6506007)(6486002)(6512007)(316002)(66476007)(83380400001)(7406005)(7416002)(2906002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Wd06HOhEJeNcbEwS3hEKkO/HCitxAXlfUOAEvvsOOFig8DINbH03a4ZtTVkx?=
 =?us-ascii?Q?iULdX7Gt7gYM32ZYMSTNqYBD7Pko3YZnTYNuTpdwDdbsdWZBko2QWbeL3SLS?=
 =?us-ascii?Q?rbaHVPiYm6ydxCsNkWf04kGseDgQ1vQlt72ySgaS+ybT2XqE7PQEZPJvZ7uM?=
 =?us-ascii?Q?Ho5Pp2/KDSXgV8K6cc4370KTHBBnNoPx5a471jbo0VnOC8yosZ0FGMOvSjMb?=
 =?us-ascii?Q?zx/9umWHZQgzLg2V6XKCI3T329hnXuaaD8bJSFerxr2vZ4L//Pe7B2NGK6ih?=
 =?us-ascii?Q?B9KCHGQjgZTBEGvipS/fdIm8b+8BveV5IrUdzcWrQAnNRgfOVxptBL12U9GK?=
 =?us-ascii?Q?UW6QYRmpu4oLx9T3S/oNPvGhQ94uyK4RA+6yQZL/216KW6kZKs1d4w/AlBgP?=
 =?us-ascii?Q?EMFEOp+oUQhjtkyFZ9ICBGR4sDmxaYqPk73L7qofQpup5lkwbHMUcYSc6QM9?=
 =?us-ascii?Q?9GhLXLfx7AElkdAtNugK3mY1BJnkUjJFahtM8Sce55b3CMCZJITDlrmreCjL?=
 =?us-ascii?Q?FNb299hoNJ+AIbT3WFgoysLVwbTGE1Pgqu0DktboPnWTwzMncOI2HiSrFuB3?=
 =?us-ascii?Q?a+w0//cH1YMEyVksH5PO3a1DGsw8SqwF7AQRB42UkZnHZVbtrn2BpxJK/3TE?=
 =?us-ascii?Q?ScJm5m0DPVfmpXXuq06e8nJfIviHpV6DSMBD5yI/2VpWe7SyIBbfywiZdk0M?=
 =?us-ascii?Q?M+noTbfmZrHv+P1bd4frKSLaqTBWlpsKZbmqJ/sVsnW8cQemHrcgwyDwS41J?=
 =?us-ascii?Q?qeXkhy+fcM40I1iPWSmIZRs3fKZSOZor2T8AOkk7MVmE2HeE77KcocTonjsC?=
 =?us-ascii?Q?83nmTZegoquwxPgo0adfhRg4kojXy4nwG0ZOlj4+/czvnbZpR+vWAK8VeNDM?=
 =?us-ascii?Q?IbCk3EXex88zBAbgSNe8fznEIY+8WoEtwcWsX79i4RYsDe7xvhpOyB3yQj6l?=
 =?us-ascii?Q?nYqrntCiVEB71p9IbyNFroQmQZmErg2wEDpRpJCpzjfXVVWdRSa57aGRjfDs?=
 =?us-ascii?Q?08Xmov3Z4JOr9+yjozrqwo6j4f7wq3HwO5eQSuoSbBbQtTeE5yj0cen89rjv?=
 =?us-ascii?Q?9PJhTRbmLVZ41SXyI7lG3REWPhj+Zgm92iJdBxfQtRFam6LFghadKDvxDQgu?=
 =?us-ascii?Q?rKZiskvkAikgpH+2tQjsZSOVI8LoHCIbl0NhLLJeTZ7Y4tZzPH5MWmM1Q+tw?=
 =?us-ascii?Q?iGXtrrUoVsoT33frV40MF2RFYcw3WSa1Kz0RFtArsrNJNSmYm8RagWBfsG7q?=
 =?us-ascii?Q?HPX7xrd9ubYD2hTvhG0B3r5x672vq4blb2VDKTc6su4nqZ4QwcAo3zI95BPh?=
 =?us-ascii?Q?e1iFNppU1izdvDayO5jT8BFu5dEA0cZA3CAjG3VPnGqvAoDp0vCqnlI8LiPh?=
 =?us-ascii?Q?uHm/vqLCk8QE04dFi9O0ykWteFH2BxyyoDjzDYuk4qLQwFpveC1cuyR6e6vl?=
 =?us-ascii?Q?4zu/QqS+Hr+7yicRSL3kw6HfnxEI1RbisIHS4dOoIY1BkUO5Dk8lF+ZDYhzb?=
 =?us-ascii?Q?+ikn6GKaZZhYYNhV/+/UguDHC0zur7X3hcFSAs8r9HPIEAThJxsRm+UWTk+W?=
 =?us-ascii?Q?lE/baXTTpfLvECvYimrqMC3pYYVydsdG+kDgFPui?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11c573fd-4137-4a07-5ad5-08dbb45f7b7f
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 13:43:59.1460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kvcB9cgZDKOHx1tooVzhlSh2sOw+PPulGQ54os/SZ8/ikmSDH7B3kuzrMCYu/Qr
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

Prior to commit 1b932ceddd19 ("iommu: Remove detach_dev callbacks") the
sun50i_iommu_detach_device() function was being called by
ops->detach_dev().

This is an IDENTITY domain so convert sun50i_iommu_detach_device() into
sun50i_iommu_identity_attach() and a full IDENTITY domain and thus hook it
back up the same was as the old ops->detach_dev().

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>
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
2.42.0

