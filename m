Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B700704216
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 02:10:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QKxTq69t5z3fs8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 10:10:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gDdvbMSv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe59::60d; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gDdvbMSv;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe59::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QKxGy4Nt4z3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 May 2023 10:01:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jLmxF5dxtwutCJkFUkp0qSV5lq9JF2Uv3NNVpuktznCvgaWZmk5ncfnZKbY3HD6iBYasPwfQuA0B87cSB14JvAxx7g/vvGTUBEDcc5QIyi0FPnok4Ko7qCn6YjcrPRdB3FMTuxbIZShXBbZE68nfQgwaNVAv6GDLeVXVGcBQcbCu/PenGzfBUZNumROJpF75wvIoprHWVRKjHR+lyduZ/JEcsv3HJJSnizR9miCDxFUhm3+rZYhdpxi0DoAgNSTgZ6tsOzJHxgEYAcNg60DvTF6iPQCFUEy99ZOXtHH6He7MxoBy/EcLxJs+bpYGQZSnsEVHQMXdOSNmOhwCLQQfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcU4vFVuCNnvu6zOEx5HRyN28JNKCcqIBM+Br/bv1rk=;
 b=ncjZQiqJKtbIsw6naNjE1J4YkkGbLnltgtHmc8lcguHgMHuAPFheYlIw5dV/bo4birst41Bb7XF/iAjpEsT/I8Ft6s2vdLGXmsNSgse/+32a84Mj5q/J2XiB+pRaXIoGON2CcDW910EGcT8HP2WjVvucpxLLihi0GpiLYcPI8FtDBfrrc+Z2HptcSb5jAHmH6msEBb789PCmcrepQyWtEzqx3+Woc99fXEXTENtRPtOqncX+9LCqbFld8BgckLpxZoqZh99PRQ+NwPtyPAMn6mHsJXEQgMrT2J6rgcpt9vnYvYo4Q5IdJw1oieTrxWCfSxUGhZYtRAGPaLLtowaiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcU4vFVuCNnvu6zOEx5HRyN28JNKCcqIBM+Br/bv1rk=;
 b=gDdvbMSvQgcEfNF5Pr1FbgtBVpoF71X3rYUmeS/I+xUje5Vi/wz7I1iy1MxP/Za+2lIjEPL+mU5xs7oUjL0GOOpRqul7Or70sWbKFyFRj2lRnMJZc5Pdg9PPp9brCuNXTrIb/m/dx8s9bbjvNCEwlwapJmDC6CXuN9B1s3rahdJb0Z6s5KB1/+n4xFnbX6MxGlxOYNxwC5nenUobdt/CJDw44qA00FKYcJwwmcS6dtFcFMEVauR1W3RaRFU2/wGXiW5XIgRxLu7ZHAJgQLFj7n23RVi5DTec1cqAizvRRMClDBCxLY866goYaNr02VVDmhzH4VGBbvq2Y95w99u8Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by PH7PR12MB6786.namprd12.prod.outlook.com (2603:10b6:510:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Tue, 16 May
 2023 00:01:07 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 00:01:07 +0000
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
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
Subject: [PATCH v2 07/25] iommu: Reorganize iommu_get_default_domain_type() to respect def_domain_type()
Date: Mon, 15 May 2023 21:00:40 -0300
Message-Id: <7-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
In-Reply-To: <0-v2-8d1dc464eac9+10f-iommu_all_defdom_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0020.namprd08.prod.outlook.com
 (2603:10b6:208:239::25) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|PH7PR12MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: ae658b39-fb1b-46e9-9a03-08db55a0a2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TkYnPB2o/t6WD3+xYLtKg//vb6xMy8Y2AGvZ9NUrjCdvg8N6Lo9H1o4Z3E76mr4shfr+c3U6Bh7i2UI280KF4jtQQW2Q9JHpjk0j0nW2qVFYctB+4JW/MH4dywdRjrlyVo2Iu8IXV8Kk/n6n814Tv4H2ro4jzvHtDfhiQXSw7hzFaBY3BnEskW8tunmrGilxQogI3mbxykyTL91s7cfkVse/7kVQnm9qsmBhcpRDa2r4EsVKBblSKi4tJIfeybT2JQKLuh+IHnePl1psFQAO4VncD30i3Oe0l6wxl+G1mTUBK6Pm4KKBFDTeayiy22slT3NM9I/NyUmiNerdiRznS1k5ZI0sB/lKhpGJ86asAZZBpIRkFLtbNdp1iC0ApfD3LJ0FAB394NmtAFEHQeCrCC43iuen0aum0j7toUd8CRF2CrRV62Y/aLXvhGQ6z5t8tx0b5oDNYpAN+ClbFUySRsE7AXHKmKR5kpcp9f8mHJ/Cgy43/2NLanRHS/YzWZs0OznYeEi8gytHTB+It+RrCqKIzdt8D7FnSu5PatTJdtIKWBv37iXr8ajRtk3QQaD+6cjq4HQFE6rvmtQEUiUVaFMMUCzy9JZv2fHzKvayC1iHiegFSpcEG8s3PsBCxNl0
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(451199021)(83380400001)(4326008)(41300700001)(316002)(2906002)(921005)(36756003)(38100700002)(6512007)(6506007)(26005)(6486002)(478600001)(107886003)(66556008)(66946007)(66476007)(2616005)(86362001)(5660300002)(8936002)(8676002)(110136005)(54906003)(7416002)(7406005)(186003)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?y1wiHsHsgpx1PzNCL5jffThXLrZTnyeHs8+RduZNMOEnpjCtHKr/l1WiXL6Z?=
 =?us-ascii?Q?04x6Auw6s8+hoWHRfaqJQGuDR95X9rrtrsKx/8/pYpFLlkVERvcRVV9FBB9T?=
 =?us-ascii?Q?KKlGdzE8OVT7upg/5J/3To+AVmLjBZYZf3mv/oVo8HP3ikHO49p1kZikmSnI?=
 =?us-ascii?Q?TMM5joawk4+wWUrHtoH6RDDNqven+wp5ZkWwS8NtKG4r74WXEyD8xEVG5b/G?=
 =?us-ascii?Q?8y5VFAS5LPipdylRPCscH2BH7WZREO1HLXTeGqplc0225h1NO9EjPv/jxfz7?=
 =?us-ascii?Q?xYW4E6LDhX0SyLB8CHiI1uysYcR/UKTWC6zxtDZ0zCzaLFrEOiQh9y0nySt/?=
 =?us-ascii?Q?X33jC7Oz+mRom05J8xChFfJGd4xDzbPI4DNT7NwiAemz4mgYMykcASbKjaXe?=
 =?us-ascii?Q?6UxXMYBp+Z7KmLwgCwA+1UbgZ5MQZiiyXVzcJLidnBKCa4fgVlBa+q1NRZ/K?=
 =?us-ascii?Q?yuFDjbYYPt128YxZES/i0Pf0mPjoF2hiyF7HXElR5rUNbI/oIXEY4E7ukZ+g?=
 =?us-ascii?Q?XANGNMbaVJqfVSkT7u2YS5OhP2amqsEW/p6NlrOlQgfqBOf0U+9DPdROCEkh?=
 =?us-ascii?Q?y7/84xueLUYW49tgYvVtVH76Rc8DAK/dxUZnEf12MA5OIMg9Yj/2Z05g9On2?=
 =?us-ascii?Q?nzPjtPvB3LAr4/nL9OoScZcGzu08y8/6U610wT76MTmu0Llk5ABSZtKKQAgA?=
 =?us-ascii?Q?+bhUSAurWOWWQHQ5HbJNqhf7/gcA7FlVt0JvGQOVX1qNMweqlSBq8beEdRsb?=
 =?us-ascii?Q?PiLBLd48qpSOMMPeMVKA8mkWicOXjDZtu9vCMVN4qf877AVy+Jg23F2FbYKq?=
 =?us-ascii?Q?rEy9l3uO7hoeD34l53owhofAR33vr8oycwDBug/0wrCDgeAD1dp07iCzTxvH?=
 =?us-ascii?Q?99jsYYIUyZv+HvZC5L6N94EOiTqeYtVGm7W3SF5cEULE4MNSXwjjQA5iW1um?=
 =?us-ascii?Q?RGpyWLuLtj3IESO6l8lYWBVc4hz2/tqINrknV/3X+QGrs4SZERS1N0+qDXSC?=
 =?us-ascii?Q?VEb74KVlTGsX4CbQf6WGagqkhwrZMgz3/vPoLunazF6l4grJ4xo+OjuOO2tD?=
 =?us-ascii?Q?yZrpf0xEML5NM8CHg2ZlRXEW+8leX4XykuM91ZSTpGz9fuqkb3dfKD4HkJXE?=
 =?us-ascii?Q?2SLRDhEwtuEXKHyPAuOrjFHi4ptTTr8PLbvY8F6nkS4QnhGWWpRNRf6C/6Vg?=
 =?us-ascii?Q?WYN1HgcirCmR0lZZNymBma+3tnQNfOt9+U3wZjioQZCvhxHcT433mbDBWXbl?=
 =?us-ascii?Q?PWunZbbsW4XE5Pw8EhaR4pyGitD3BybyvBdbLrXyh8Wn122ndqj27UHLrhsW?=
 =?us-ascii?Q?ID1MqXb2/d9BlVQjeQFD2Kb26yEA+hPb6UNuLa1hGYMrNnxW2W2620/Uz6DP?=
 =?us-ascii?Q?8rHVBelVIqYSJx8rYLBajLU71gR7WqdTPpwa/AbR94wUuV7xqQVKzei6pr3V?=
 =?us-ascii?Q?EtogFpAJL2oyv+5MUcv/OLycCwmXsOs+5L/ti0tevkvzZ74r9vhowkLOmaPn?=
 =?us-ascii?Q?jGiU4sGss8XcafM4EXMsJmhzp7fTmCQOsdnFWZ1+8DpvHRerqkGI+Wqbn9Ix?=
 =?us-ascii?Q?OHWqOX2enti9cS0eT3rmndXmU+/DDojmMV495EuS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae658b39-fb1b-46e9-9a03-08db55a0a2ca
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 00:01:01.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JOFDJYjd9+xI9BZfSoAerJVzylWXWmoVHcPeKvq0Rp6AnkUzwVzTNi//2oB1FG4t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6786
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
Cc: Niklas Schnelle <schnelle@linux.ibm.com>, Steven Price <steven.price@arm.com>, Nicolin Chen <nicolinc@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <treding@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Except for dart every driver returns 0 or IDENTITY from def_domain_type().

The drivers that return IDENTITY have some kind of good reason, typically
that quirky hardware really can't support anything other than IDENTITY.

Arrange things so that if the driver says it needs IDENTITY then
iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
never reject the driver's override to IDENTITY.

The only real functional difference is that the PCI untrusted flag is now
ignored for quirky HW instead of overriding the IOMMU driver.

This makes the next patch cleaner that wants to force IDENTITY always for
ARM_IOMMU because there is no support for DMA.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 66 +++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 3a72859747bae0..8ba90571449cec 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1608,19 +1608,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(fsl_mc_device_group);
 
-static int iommu_get_def_domain_type(struct device *dev)
-{
-	const struct iommu_ops *ops = dev_iommu_ops(dev);
-
-	if (dev_is_pci(dev) && to_pci_dev(dev)->untrusted)
-		return IOMMU_DOMAIN_DMA;
-
-	if (ops->def_domain_type)
-		return ops->def_domain_type(dev);
-
-	return 0;
-}
-
 static struct iommu_domain *
 __iommu_group_alloc_default_domain(const struct bus_type *bus,
 				   struct iommu_group *group, int req_type)
@@ -1761,36 +1748,49 @@ static int iommu_bus_notifier(struct notifier_block *nb,
 static int iommu_get_default_domain_type(struct iommu_group *group,
 					 int target_type)
 {
+	const struct iommu_ops *ops = dev_iommu_ops(
+		list_first_entry(&group->devices, struct group_device, list)
+			->dev);
 	int best_type = target_type;
 	struct group_device *gdev;
 	struct device *last_dev;
+	int type;
 
 	lockdep_assert_held(&group->mutex);
-
 	for_each_group_device(group, gdev) {
-		unsigned int type = iommu_get_def_domain_type(gdev->dev);
-
-		if (best_type && type && best_type != type) {
-			if (target_type) {
-				dev_err_ratelimited(
-					gdev->dev,
-					"Device cannot be in %s domain\n",
-					iommu_domain_type_str(target_type));
-				return -1;
-			}
-
-			dev_warn(
-				gdev->dev,
-				"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
-				iommu_domain_type_str(type), dev_name(last_dev),
-				iommu_domain_type_str(best_type));
-			return 0;
+		type = best_type;
+		if (ops->def_domain_type) {
+			type = ops->def_domain_type(gdev->dev);
+			if (best_type && type && best_type != type)
+				goto err;
 		}
-		if (!best_type)
-			best_type = type;
+
+		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
+			type = IOMMU_DOMAIN_DMA;
+			if (best_type && type && best_type != type)
+				goto err;
+		}
+		best_type = type;
 		last_dev = gdev->dev;
 	}
 	return best_type;
+
+err:
+	if (target_type) {
+		dev_err_ratelimited(
+			gdev->dev,
+			"Device cannot be in %s domain - it is forcing %s\n",
+			iommu_domain_type_str(target_type),
+			iommu_domain_type_str(type));
+		return -1;
+	}
+
+	dev_warn(
+		gdev->dev,
+		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
+		iommu_domain_type_str(type), dev_name(last_dev),
+		iommu_domain_type_str(best_type));
+	return 0;
 }
 
 static void iommu_group_do_probe_finalize(struct device *dev)
-- 
2.40.1

