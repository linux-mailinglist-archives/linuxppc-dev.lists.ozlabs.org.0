Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A33A56E7F4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 18:13:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1m6f4g8Hz3f5M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 02:13:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uPe+7Eg+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::620; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=uPe+7Eg+;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20620.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1m5m0tlGz3cMj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 02:12:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eb8/2yPeCMG9BNtBwnUxvDXvtc2OyLxLiQBH4CogdtrBLRq5EbXoUJe1E0RI10MTBI2wBMdPK0PgsAxl1J+9F0ohW7uo8zeGg+IOhkkfdvuC/LWhyzKwPX2dQZpSBPJU91CkEypB9AQzZE32ZGLYovQtCio+xVojZe2x2cM6bwpo60H/zKWsRwZ3QjKTMLQlHKxOy163XTw9/4rPSZ/njrs+KaUgV6on00iH8HABCAIhdPZ2twxe4guyVdNixlVIyeKw1UCUdufq8p7HLSipg+w0cB/Sn5iGI8RO0CvoTqXEEIoQZ5lGJFfjHlL9dpLMo+rPODUzL6w+5SxTAE40Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75S+M9Ne7IDnCk2KalAFQ3AKD8oWpYrnc2oQngrvOLA=;
 b=FK8wTXrk1yE24BG04gyDPHLfwAKBiZ8EJf76j6Rjqvpkk63qGmfGQ+5QPDRkWuxQelHWTKTPFmumdpQSKD3PD/3fnvhEgVGpq9cMlkJuOgbcpK31okkaOv6fvyxDAnsVr1xgBZY6c0fzdUK+YlLlqjEhqMgLjipjaDOZ8toZdtvQ/oavxz9Lgayopj0R41gNRBIGhv8Yi4E8+KincXC1GgvkXMJNmI/N+mT/sA+La/MxEuiaFU6FiO15A5wCLmXWVW++FGaDAZwcr8yzGgpXkb7ZVZa5cBFDK8+yTs+K13iqnyTWnBkvJKnKQxFd1JUtCf5UHA+Sbr3IY0e0CNYtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75S+M9Ne7IDnCk2KalAFQ3AKD8oWpYrnc2oQngrvOLA=;
 b=uPe+7Eg+XoF8xLqlnmqKVO3NkeNgA5G+xPO+JP7bnzbGltvdDjnZ7Th+fk4Gxjx7GGjA4LyCfTLtawwEl80z9BvHDd+rsnCR4Ck2dEAZdR9Tot1GgkZ5dl3WClJkWl8Ls7IGSUSJqxqv/cYohbPnlcSjiv4SI9TeOpelIfEVbuUn3Gc+tP9rpypoEEhvtUYXNXBws4R/F8g/H0/4WLkvAJ4LyO+CaOYQWqrgLcdGprnAfprDovPSzqhyUUAw3LiLO/iRzvXxiSoi5D8Y2TRgrqnFTPfxRa8VvuMIM2cK+GDqawge50XmkranpfLnyAXVFMxZvFePaBZGN3LtCXBQZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by DS7PR12MB6046.namprd12.prod.outlook.com (2603:10b6:8:85::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Wed, 19 Apr
 2023 16:12:00 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::f7a7:a561:87e9:5fab%6]) with mapi id 15.20.6319.020; Wed, 19 Apr 2023
 16:12:00 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Lu Baolu <baolu.lu@linux.intel.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH 07/11] iommu: Do not export iommu_device_link/unlink()
Date: Wed, 19 Apr 2023 13:11:53 -0300
Message-Id: <7-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
In-Reply-To: <0-v1-8aecc628b904+2f42-iommu_probe_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:180::37) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|DS7PR12MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: a849e023-7022-4629-03dc-08db40f0ce48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jQ9yjkMKWaxvK7GgvPne8YQ6GVwHxk4Zywycy1BTgHIy0dbH9yl1pI0mpjprikICPhgdRzkfF+hXAbw8VY804SREqtaELBsufaz9K7AiMI4n115e5KopKnsqIWcFiOPFL0ZL0HKwbV1C4XB1SLDQ/VrSe8EOrheHepeSrqZdqrCRFaZTsvbk2u3LYWAxoKzdh+Yjk+D1gaO21VO4f5xhVitYTl7CCQGh5mgmkocWaRHd6As3HKCDF3kVCR2y86EcQ/8HJDCr0K18Z5z30zupjmoEpPShCTtBoAafMlxenfraPrmH4CRKfRW3lfoV+WKJ2JfNksNXus/y9EjIkbEwrmbHLBcsOsTvD4itIjTSrbE0cAedBYJuMGNG/DCrWeCbJm/ITsoAuS3WX40FOm+VS6dmjD3lBiOBtaJgxvAu0HhXWFcb7pjY78cyhclz2HSrLfD5Uyphe91ilYNV0U/s1A50OhZhOYSO8oKnF3Ax/G86PsQnh2I++O4TbyayPK+e45l+Xqae7Kb8OpJelwTx+6cQ/Wc1oP8qpRaZKdUnic9pzxpPYvp7KkH+de1K7A8sgtyb2Z7wIXcAZoUAVmRpPb7jbCbjywnpAGhVMcZL4zYmba6hqubAxLXCzwNru8NE
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199021)(2906002)(4744005)(8936002)(38100700002)(8676002)(7416002)(5660300002)(36756003)(86362001)(6486002)(6666004)(107886003)(6512007)(6506007)(26005)(110136005)(54906003)(478600001)(2616005)(83380400001)(186003)(316002)(4326008)(66556008)(66476007)(66946007)(921005)(41300700001)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?o0G7fL3YQYTpjmNoYpwoOTmoG4o8Q/6ynFCAWGO4bFD5npvpIvJqryFWV6eW?=
 =?us-ascii?Q?guglYBbXV3+idQOXy2Iukdr+T03W3YyQUaYtmPzonybglZBa54ftBD9Rf9y3?=
 =?us-ascii?Q?43sDtmBqwbHT20JWZrYa+1d77cI516LGHWiwsh7c0AhQwK35UjETmQRIaZnr?=
 =?us-ascii?Q?bu9b14+6p1T0r/O9nGyQTyBcTgA1iYSmmf6hGhMPYpBTvJzm3RyFffg/xjVL?=
 =?us-ascii?Q?WqaufZN54CKYHaKWypn5/EaPmgzLfGaklRlclfEv2xiXsPBZP6A/XxCX+zST?=
 =?us-ascii?Q?xO+TVENCUXgrnGReOqmcmpItrfKdSpXF/iP1QcU4N39ockTlnnpY9O59+dou?=
 =?us-ascii?Q?NpmJDyGs0KU6vPOnWaTzrkFFj30lcIPWujLVHF76lBs1mZcb5L4yXA6dnk0+?=
 =?us-ascii?Q?4M8N5udnsYu9IuIElcbVzjR8XwNwgRgUNcq4YIRBiaHAy4+ihBaMJWA+B+eC?=
 =?us-ascii?Q?LFq3CJzC/z32GtgpLwqQnI9AVFCSmfsLe8lcGipM4ZNX33IWVnYUxIBN+ZwH?=
 =?us-ascii?Q?ioHnqKaNLJtnNmGuuop285jsl5xKcDplhXIBPhF2MUjr8NnN81k3ZBqTeE59?=
 =?us-ascii?Q?vosIh/vX5Q3f+yTmDnfmx3cZyWOp+2bVHBLDI6szPv+Z1zGJ78RVR4QzywTa?=
 =?us-ascii?Q?GtMkemnQyV4YszYL6QZVCAbFfrWzhwkk5jAoIOPUOFnEZ2rk4m2buQ/TpFX8?=
 =?us-ascii?Q?lwFBt4LKG6+f9B32qxVaT5fRXBSgotsBxHztFsn0X0dUboIIBE+guRl38N7f?=
 =?us-ascii?Q?qGDOYdBbLQfCIqyrOhDL4Q332MsPP0NsPbxAkfgit1klA57dLKtxuUpuweZt?=
 =?us-ascii?Q?ApE0uTHIJB+XyboPPQ6mYPBpoywcgNGaJCsle5os0btubcEsDMLGVphY9ute?=
 =?us-ascii?Q?+624DKINplkXZYqlNuP/8NO0eM20gjJTMVydGPfxbzZ+DqyfHkE6rknrOEDt?=
 =?us-ascii?Q?pYlg1Q8y/OpfafviGb8IZQjjLuMwTCL9Y/4ec5Hnq+n4aRHj8eEvhKVnVdI9?=
 =?us-ascii?Q?lnSs1Bcfbx5gRuq7ANi4SM+wPqGBG2g6KRLWqfq2iqzGGu67htRjaXkSZ35v?=
 =?us-ascii?Q?nsrfK86iGevOk05u/tDe3O88oLJ69XUDEO0fUFpk87Ro3izEIifcO2d5pdgB?=
 =?us-ascii?Q?d4ffCil1NUtNMIn6sKwf3x8EwOM5ZSUWjRKxG7Y1wjruMH/T0kuUM4VRSpMQ?=
 =?us-ascii?Q?W1is0MBZ0yvY1DJlSeAnGivm29W1vAW4Uan2jXKYJGtUCBf1EilP+WksoTIZ?=
 =?us-ascii?Q?wbBPdyu7sBmmH7r0bw7puy4BKwWUAsbCaVdZpMtEI0cbDkm/A5FOi3LL5Koe?=
 =?us-ascii?Q?Vsx7UBwZ/QZSvgQ8ErlEK4IzaGua7rI8JrDFMoyF9d7GHGzy1s7IaIueHVB+?=
 =?us-ascii?Q?x58riY9Z8ztjEIp7eOWggiPcygsf2J1FWr9P+3ho+QZzsJvB7mtgUgKQezM0?=
 =?us-ascii?Q?m42ydCuDwg4dEWC/5o3m1EZYzK786PeGXrIhj/FBNBYOt6lINCK29bQXSQ42?=
 =?us-ascii?Q?r7vPSVN1MdtWd9uYX03KsCrKwRuOuN9uOcT5eGgV8isHmtb27SPWn4yoXBGG?=
 =?us-ascii?Q?y74rJ6rNDCaVOE3g1r26Klxqbf/zz3RZeJODhhW0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a849e023-7022-4629-03dc-08db40f0ce48
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 16:12:00.1642
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ykdqqNC0fQ0C9b/n0u3BxFs8lNUWQeZ3hiGwax0qfBBdV2BI0hEJE/IceGJGWfQS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6046
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
Cc: Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are not used outside iommu.c, they should not be available to
modular code.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu-sysfs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/iommu/iommu-sysfs.c b/drivers/iommu/iommu-sysfs.c
index c8aba0e2a30d70..cbe378c34ba3eb 100644
--- a/drivers/iommu/iommu-sysfs.c
+++ b/drivers/iommu/iommu-sysfs.c
@@ -119,11 +119,9 @@ int iommu_device_link(struct iommu_device *iommu, struct device *link)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(iommu_device_link);
 
 void iommu_device_unlink(struct iommu_device *iommu, struct device *link)
 {
 	sysfs_remove_link(&link->kobj, "iommu");
 	sysfs_remove_link_from_group(&iommu->dev->kobj, "devices", dev_name(link));
 }
-EXPORT_SYMBOL_GPL(iommu_device_unlink);
-- 
2.40.0

