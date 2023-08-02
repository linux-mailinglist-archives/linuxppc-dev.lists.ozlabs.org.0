Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D9D76DBD7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 01:51:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F8yuHxtP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGTK95wZwz3bNq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 09:51:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=F8yuHxtP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::625; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20625.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGTJF62J4z2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 09:50:51 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L1lBrJzGkf7JPp08MlTjQO1VEuW/OCoMPb4HDZmnb2F7xZdne0RrrgMiiZwW2hqJnrN1TDXK8WOe9KU5ULDLDPRsYzBVF/1FsCjT7Ckt4Lx0U/KfA06/jKvRbXLBGYDaDGAVd2RU1i4RvtRtY4b2ihMLtrpXT7E02eEjZeuOaqmQGwlxhvP1qPIJIGy/tTUxsffBxl94gqSlCXtS7YDY6dpQHEgEZzWnb6iXhVAgYDEc4C8PHfhFrtxPn0qXSni/gFe6uTDfLs5VQID9mpwfeAbS8nbA9yyJFYJ5mVc/bXcruBRtt2S9B8uJwUR7gXzVfa5hJjpsRwZgXhE9J3jLWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHN3lxbUhZe5dlztn3JAaGIbSyJWd59/f8Amea8VZ88=;
 b=bb/uz8F49+S+oNrqSpnmxHKdCssjU2VtKIWwW6SjM6LL3DGp8CEGG5DrJ7MNkr1xGUoAnzTTAQvfilKl4UykS1BCdIKnLL5NmkKPwA3Ncrs3ReygSieghR4l/OQj016lLXZIXQMdRfZKyXIOEE4pLcfp/nECdNfF/na/Rf2t4S3ygWRamZ7icxmw+xu/MOCKvfZps8JEUPjdrdMD2VkE09lFDSbgI4jHM6wcVf2IBxS63X2EdNGcZvjGW3kjfTN7kfbKYOKmL7+btw76OeLTzUY/lNuKI1icmDOrK53A4+wHYWSvBmdhwIYtw1TTwYARxK53J/pKi2gVnX1hL4HKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHN3lxbUhZe5dlztn3JAaGIbSyJWd59/f8Amea8VZ88=;
 b=F8yuHxtPXSemhi9ySIq0801zRJfYny0s2hEYI7FenC7jq/MX2oJOVlIQB4FCbCn0vy1cpEXIqG+QyjvSVXFuVBqd7aRSR0r2dG2H60PEV77oVSqF836RhEv4TtWzOH75+D8g/P31e5D+XdjxzBY7JHn411h56fgCsDGV2j/6tghCY3FfHykVeqy0HXND9YunjKdY67mfaXtmx+++xQkm7M1d2PguCeohmIapLRqkvfkbjzk/YlvFZe/El/iowiDN/zGr3V5F4lEh+L/A7yxsHPN+bYk/Fin0Wng8L1oTl1SjYDiVYLa8vz/24d5Ruxd++9oRaGFq3DbYwrf6KoCrjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DM6PR12MB4941.namprd12.prod.outlook.com (2603:10b6:5:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 23:50:27 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::5111:16e8:5afe:1da1%6]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 23:50:27 +0000
Date: Wed, 2 Aug 2023 20:50:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linuxppc-dev@lists.ozlabs.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH v5 15/25] iommufd/selftest: Make the mock iommu driver
 into a real driver
Message-ID: <ZMrrwBTt5zHLwWoF@nvidia.com>
References: <0-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
 <15-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <15-v5-d0a204c678c7+3d16a-iommu_all_defdom_jgg@nvidia.com>
X-ClientProxiedBy: MN2PR15CA0051.namprd15.prod.outlook.com
 (2603:10b6:208:237::20) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DM6PR12MB4941:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e969a22-8258-4b1f-a50b-08db93b33ebe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xFlIwAP18pcxCg3Z4pQDw7Whi02dFi1bfCs0lJfAkjwKy9OlwiMWuqNOnV6VtVAlxMHVEoGPTrtdiZZShxN7V04kHcCeXgRgPdBXTyxhXHopREDroW9Rnk0RJsUqbC87hDMCvvbSdM7FI1568qeoageJL08vFOqi4V+WqWWnhheznjTQaT4NYRHRLU3fYH62E8K2dK9Jvq1M0f3nwGTMByYLUAmu10fZ5XODAz5yuJ9+TMbwOJ0Tvt0539u1R+z1KBkAvctT5Rijxv+tZ2Mdrr2zWCzCepZkwtxxb4dcQcc426w8T5oJ9aziCDFyizkWh7PCAjNvbtj659MGBOGC/26nw9PX2WHixtqR7Psyt4rHW4/KQQNf/2pVUNEl56tTZnnYmzujU7nR81WLED2kS28fKEO8ZkiXJPxwVfItExrnxJpIoDA7SxsEsZdXPjD+oravq26E0cexLeo3WHff/2ijr9fNRGuDtUZrnPj1LVGt/hc8P9rr1pIMNd8YTqZnN2xVJSvNcp6kY7g0aa3Fgv7wKq5wX01ZKL0pbxFWqKnPfShnEm0BIOXTgoLJdK9TwFc4ycaYqMMNsJ9ZZQ8QWioaI5NjjXYLrCDZoXZn8g0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(366004)(136003)(376002)(396003)(451199021)(186003)(2616005)(36756003)(6512007)(316002)(478600001)(86362001)(54906003)(110136005)(66946007)(6666004)(66476007)(66556008)(921005)(38100700002)(4326008)(6486002)(6506007)(26005)(41300700001)(107886003)(8936002)(8676002)(7416002)(7406005)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oI3N+pzrI64bLLvzAJoCCHKzrgLOnE/Ddg9aX2NYH7lD1aC8E2M5ouIaSMTr?=
 =?us-ascii?Q?5qWSJZDyrxX+ZivnipkKOMKD0eF+QzKH4kI3FF6XPwJk8CGC+sDKcICeowA9?=
 =?us-ascii?Q?60FUADf7uDcWpNGAQ8d9Mu8JcFq7Hlr5kVvDyA3Fn8FtICcYfRVD+y7m5K/d?=
 =?us-ascii?Q?U5ZaUJvJxj9DU60ZnJqQIG2zKhQuuKzuX8d0kC5NYiN9i1cFxYC5bWCMwHef?=
 =?us-ascii?Q?q7PkuZB/4U8vkZsKAioukgxdlGqpWhuCC+EZ5CqJkKAp5qUixh1zoJrm+N45?=
 =?us-ascii?Q?5mQYAdCvNr7M9XulGIMNGa4x2O7F42ZeDyue3j6/D/PN5Hs4rpVGm7ewI2ow?=
 =?us-ascii?Q?CBnfC5S9PE0DIkefTTBDWgYMTJHczhMPwYxNwtuoC8LBjwkQ8OjWPJvLPg+1?=
 =?us-ascii?Q?IaUaFZYFVGp0JICzGmGQ/cXeAsArnTyHPMyCIractN26jmwJJIevqrE7EIEz?=
 =?us-ascii?Q?LKn3xwD66wwKILIe/H2/f7hntpvYIOFDxhfeSXMTVDsPBMALBkCNBiaNvr8d?=
 =?us-ascii?Q?2OpckqteZrHXNJx/2ANNVqtSkbMQSCkOF+4mJYVsds4KBuJWDtu10AawNIDi?=
 =?us-ascii?Q?G+tlf6GN0YJy3xTZ+279oG9bB3sWu4Af5km3/6ZtVViJlq0o4WqBm+breP8K?=
 =?us-ascii?Q?G/wYR44S17stTC1a/uV7kY4ZeV1fT6Aqcr386Zr0TWVGAXcY5PDrfWWFaz7n?=
 =?us-ascii?Q?4JEvI8UsnXDCwvjkxD4DFhU6yiByTFrQAaANxfMMVteCjt6WGMu1bfDIQsKH?=
 =?us-ascii?Q?j5axXyM8XV7yc7W+JK/M652H+U8WzRDnR4516M4j214fkcMq1aqCO8XCA+uO?=
 =?us-ascii?Q?SXoyvuGxcDf/2vM+ej8CtNRKy3ALi1VaZkmORbBeNgSpdS+NqmeMTkEFq9zm?=
 =?us-ascii?Q?6O6boRf7SlW4kr1joa5ZNDF9fHIcWg6sUIEytbfXlI8gz1WHUPYarTzhDTbZ?=
 =?us-ascii?Q?MtjnGPRtnhbFWSQ/7SwVflJVsBfwuqin1BTu5gPh5CG4NstgtaDgdl4JS/+Y?=
 =?us-ascii?Q?JoTiRgvNVpbeOYhlOmJGF0FKT79pdcNKI+qLRkdBYhom4C38QOmireLOp6Ip?=
 =?us-ascii?Q?n9xCqH/LwI50x4EW351xZTtrSuoiB1AVgsaPgekx8MmBa70/HyPYqNYDAo5Q?=
 =?us-ascii?Q?+Zlc2CpSnSlBuZH4vGRFreaTr/0VXgcW8j0ZVlwTquF4O12/UJGobdcYepZr?=
 =?us-ascii?Q?HebZ6eFb2kQZWmqadVh9+li8r+sAyl2Upx8N/Tdb2yPkI2IYePfGWzKH7osg?=
 =?us-ascii?Q?kV11AUdlBsSyfUPQ1WS81544bV8+uY6fAUB4hFqtH/s28MSzpKum1wGrIqTe?=
 =?us-ascii?Q?grXaR77VtPvzEeMeJ40rUgKINuSR6k+3WWreCwxujKGkTcYs/SdH/4kjxLwT?=
 =?us-ascii?Q?AyZqEoDpIT6lyGU2ZlL8JhyitxFavpDC8t2sbC9V4vCLl/SOTDlRdmovpD3R?=
 =?us-ascii?Q?2MwZtAC1B0S9wvFBNR37ieSk/vidSqyfbmMNbQZdD95h2iLdA1bxI4lQ2zV/?=
 =?us-ascii?Q?ZBindd0JaHI2criBAMQcdccexryXBPmLUJZrOWJq0gLWvvByCGy3JzYaI02E?=
 =?us-ascii?Q?Tf02KswTq1C2qj5SveCzCwPxt2fUmxLl0R27YkO2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e969a22-8258-4b1f-a50b-08db93b33ebe
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 23:50:27.0221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XmXyZjnaALR/E6RlXvsBBSGsw0U6OizKqNDcduEUNdIqu+YBucipah1VaMqb3gyW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4941
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

On Mon, Jul 24, 2023 at 02:22:05PM -0300, Jason Gunthorpe wrote:

> -void __init iommufd_test_init(void)
> +int __init iommufd_test_init(void)
>  {
> +	struct platform_device_info pdevinfo = {
> +		.name = "iommufd_selftest_iommu",
> +	};
> +	int rc;
> +
>  	dbgfs_root =
>  		fault_create_debugfs_attr("fail_iommufd", NULL, &fail_iommufd);
> -	WARN_ON(bus_register(&iommufd_mock_bus_type));
> +
> +	selftest_iommu_dev = platform_device_register_full(&pdevinfo);
> +	if (IS_ERR(selftest_iommu_dev)) {
> +		rc = PTR_ERR(selftest_iommu_dev);
> +		goto err_dbgfs;
> +	}
> +
> +	rc = bus_register(&iommufd_mock_bus_type.bus);
> +	if (rc)
> +		goto err_platform;
> +
> +	mock_iommu_device.dev = &selftest_iommu_dev->dev;
> +	rc = iommu_device_register_bus(&mock_iommu_device, &mock_ops,
> +				  &iommufd_mock_bus_type.bus,
> +				  &iommufd_mock_bus_type.nb);
> +	if (rc)
> +		goto err_bus;
> +	return 0;
> +
> +err_bus:
> +	bus_unregister(&iommufd_mock_bus_type.bus);
> +err_platform:
> +	platform_device_del(selftest_iommu_dev);
> +err_dbgfs:
> +	debugfs_remove_recursive(dbgfs_root);
> +	return rc;
>  }
>  
>  void iommufd_test_exit(void)
>  {
> +	iommu_device_unregister_bus(&mock_iommu_device,
> +				    &iommufd_mock_bus_type.bus,
> +				    &iommufd_mock_bus_type.nb);
> +	bus_unregister(&iommufd_mock_bus_type.bus);
> +	platform_device_del(selftest_iommu_dev);
>  	debugfs_remove_recursive(dbgfs_root);
> -	bus_unregister(&iommufd_mock_bus_type);
>  }


There is a mistake here that started to become visible after one of
the rebases, it needs to call iommu_device_sysfs_add() prior to
iommu_device_register_bus() otherwise the iommu core stuff does not
fully initialize and weird stuff starts happening.

So, it needs this:

diff --git a/drivers/iommu/iommufd/selftest.c b/drivers/iommu/iommufd/selftest.c
index 5433c9c545526d..d2b59a1157441c 100644
--- a/drivers/iommu/iommufd/selftest.c
+++ b/drivers/iommu/iommufd/selftest.c
@@ -987,14 +987,21 @@ int __init iommufd_test_init(void)
 	if (rc)
 		goto err_platform;
 
-	mock_iommu_device.dev = &selftest_iommu_dev->dev;
+	rc = iommu_device_sysfs_add(&mock_iommu_device,
+				    &selftest_iommu_dev->dev, NULL, "%s",
+				    dev_name(&selftest_iommu_dev->dev));
+	if (rc)
+		goto err_bus;
+
 	rc = iommu_device_register_bus(&mock_iommu_device, &mock_ops,
 				  &iommufd_mock_bus_type.bus,
 				  &iommufd_mock_bus_type.nb);
 	if (rc)
-		goto err_bus;
+		goto err_sysfs;
 	return 0;
 
+err_sysfs:
+	iommu_device_sysfs_remove(&mock_iommu_device);
 err_bus:
 	bus_unregister(&iommufd_mock_bus_type.bus);
 err_platform:
@@ -1006,6 +1013,7 @@ int __init iommufd_test_init(void)
 
 void iommufd_test_exit(void)
 {
+	iommu_device_sysfs_remove(&mock_iommu_device);
 	iommu_device_unregister_bus(&mock_iommu_device,
 				    &iommufd_mock_bus_type.bus,
 				    &iommufd_mock_bus_type.nb);

