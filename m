Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC15705C03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 02:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLZ2y4xWPz3fd0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 10:38:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ImAs/6j+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::611; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ImAs/6j+;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLZ0G1lWHz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 10:35:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULA3H57rhMJ6XxHRB1YNZek9WBM5kQ8ArJfO7X6/RZ3lhijGChLwpy5KMkQi0XC7PSBIM4Qxb4mX01zmfapnQ5gzNxNnxHzYiX9gIrr7JLlNeGDY3IQDYEsrPjI6/LXrqCNRYDzIAxcvZMmDcfHvmotXxZUfG1JqZHK06hRBE3Fvls5ZXnN0pfTw9mx4a1WxCQeZ6DgDSxY+hpTR/DIVukFnAanVS2azgLBfDuJ03Ys09xJe6fzRa3PKio46AduLFMK8FDwHvocbegdkP9MCTX9Un/TdVY47Zfc39SroEshbQ3UQnZYpa0nR46YbdoO/aL7jMFZiXbdkvIHWd2ngLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1grXNH2WTo6svhBZub7+HJWR0HFa5jycrBbUwxbbwXg=;
 b=C07M0fISYWkKLGmrtarL17MS9VVDYIMwUYRGtJzdq/yl+Q9XAui64DVSaNhKCW1pUn8SITk8FQjDlVu380W0m/G5sbovAvwE+WyE5xFfbpv1iJFYD//juTjNcHIn1wC9K5qIC8xyy4Wr0kqi92oh7nCo2pnjuILFtDSWQLJWfaCA6QRy//B/XuhXIvNrbv2jG5eFzdTsks6RWyIhnvA7a2vU0KhBE/uP8bgMbjReukrX87xlaX76v+yE8a7Gy+oXX4hAi01ZlMS6C46Mwnq0ohG9uU/ZPtgjfO7kwJW0Hvau8tHLQumEsfkPd3WnChz+0gQBJDP7jy8d2XIN8ZY0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1grXNH2WTo6svhBZub7+HJWR0HFa5jycrBbUwxbbwXg=;
 b=ImAs/6j+oc8DraypW8TXLstEDhGH+IGVnYGBZdGk0CNoH/zlSBiu/00Jc1XWLbb8ZY+MKL7e4vgzsqbJxOIuhExd/Fp22SNPUWEJDHft38fj2+HF+srE1Obba0fTtWqwAxWajIq2B/HkKLjrFiqbDxKz243NS74xY72VfoAOuWn7h2YPS6T9sdRcB0Ww8RO9nUWj/wCFnE9EvWZopfNg6B70I5eohOWK7yXVeNu3m0W1xatw9SPzLKvXRXK+bnRqQSCqOku32rxWStYL6Hfs7KPVZy5nAbbdLLk8g1+lYJ1okbOi2M98TljA9K7olSJU2aVWg4kXUOKc3mgfzpcGBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 00:35:30 +0000
Received: from MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2]) by MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2%7]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 00:35:30 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 2/3] iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
Date: Tue, 16 May 2023 21:35:27 -0300
Message-Id: <2-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
In-Reply-To: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::22) To MN0PR12MB5859.namprd12.prod.outlook.com
 (2603:10b6:208:37a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5859:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ead6584-1a8d-4544-e635-08db566e9ddb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UMLpLVlTkxvuaNvatwcnx3i59g7JzPESYE4nbYwlw+jU2XDVKgtlmpnF6YQ+c03sfpCp4Cx/vSesSUxqCX4xjdXeYrRs1Pia0pgiKJTtmjWhiNqsyxYlRZdV6KlEJuchwc4atC/5YEXVVLi7Q7Dw+v/RdcAPc7GCX09nR9Uzd6iUCThjJz4ax4xie6EcCN8+C/F9Bwk5dMv/uTwHOoci+8kBO98Yr03+C5/lU6nuq0TSlVROr1jYk+8FUSa6s+n7zFcYVyJd/9ypVqnxFx+q1GwzYz4UHDcGMF1ehcgrO+R0c1LHaNZMqYxB4sSyEfa8JvSGabnGTIJmz+oK4AO71n6EErBSPq2EDqY/c1Bd6sLFPPXD04Re03RKKh7BJwtqSqf7raO7CM3CPZeqxbEXymDCZAGjzdsuXzt7IKtsvBRStLs4UP3/mXAA6J6stZgcPYNVVziNRijkrrpCjCAk2fJwofvu6gV0BtEkIKQuH7R2UzYtMC23oAE998vvb9dVHL8fuck4k5d54jmPxNexnrGcxr0qyX74NnMkPwfL85ZHBcOx2yposSqDOOaXuiTk3XSufF1B1KooSGgr8zN5AN1RhJRpzeeeODmyHbuNH4Y=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5859.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(6486002)(2616005)(36756003)(83380400001)(6512007)(38100700002)(26005)(6506007)(186003)(86362001)(110136005)(2906002)(41300700001)(8676002)(5660300002)(316002)(8936002)(4326008)(66556008)(66476007)(66946007)(478600001)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3Nik1RYOQ3udbKC/a5i6CAXAZY/+rC/9qG5ZPzeX41sY+7k69As/FwriqdwQ?=
 =?us-ascii?Q?StBaRPbMDkTKChzga1PCSznkLZgzMeXAIiD1vTw+03GIZe/AOhS1iBivoHv0?=
 =?us-ascii?Q?6GmzMONs2JXVSXlEyu3O1ePyQVUJcJjOwFGQo0WIErm6zfXRSkD3r9HNw0y/?=
 =?us-ascii?Q?suaaehKIroFMY0BCnG5UbF7o4appg3rgeTzDst/vwPN2bb8nEcNWO/gZHH8J?=
 =?us-ascii?Q?qcyMwlgexFUtUu6Grfkkz1AZDhbLtKm9PEUxgftvhddblhOkCPB9SrSKv25R?=
 =?us-ascii?Q?JGn4tqF5/44m0B08vck8pyZF1tYSzAwonwTWgEDSbxkGMU7YL2LzD08uNGWm?=
 =?us-ascii?Q?MQGSwKcpYCQMvdwQwENFZe2otkuIYBq7vf0f4+gkpZX0SNn3L+p18P+o6nEw?=
 =?us-ascii?Q?KyKrv76J8NSj0j2AXNM0esGx2AKfNI0NdTq4yk6ZUb2fFh6PJ9wzHqcl3I15?=
 =?us-ascii?Q?V4qYwtTVhuvOrezeHOD2IIHLv3p+2Sh6EuYIxYeYv5FVym1DvfTCOx8/I+bi?=
 =?us-ascii?Q?Bg7XDUm12Nc4uFgaDlzU+GzMetZTxpCu949ReAlB9g45N3QyHhWE7r0aC14s?=
 =?us-ascii?Q?tUqKHNk1vKfyIdGPgqUaFDELWDe0bk3RNsaAbfqVpu23vaJUCQTAsez4/PcM?=
 =?us-ascii?Q?bAPwLTnI4Eq07JRL1k4U0h4FhVN8nORsmvXd5mJnsTjMDWZKSBxoo/eiKsBH?=
 =?us-ascii?Q?qfSXiBwk8c90Axi4TLL/ThlxCDLTlJJdSnWyMHur3+IHjDo8lQg3y0cQ1Thl?=
 =?us-ascii?Q?m2jO1FcMQKw9tu7Zn4Om4ROB4fonuFEmv3XkQggnlQXfjIfg5K0v/2OXC2mq?=
 =?us-ascii?Q?KOFS2SIQQVhjqG4w/ltzjJbvsrsfOyUnCHEuldMFUN6X1NWhVk4WKZVcOP3F?=
 =?us-ascii?Q?gyMumcI4XW738E0PIrwfEKUFEUQxEItWVCa2Vr5ey3Iin977ifKLgHeI+fIc?=
 =?us-ascii?Q?TcHLLPkTrVRdaa8yr5pQGrWvU2lbyQn8JSe3oNXryW4o9zZBztk9PceXiWIy?=
 =?us-ascii?Q?KUWRYfmhxsV8trmsRrdYVX4QcBi8CcE7JIWmM/BATYSwh7zGUV0g4fluoyjy?=
 =?us-ascii?Q?W8a9BgHaoYb0q2T2ltwknxvooCv0FrdTtfsvzW7ZCGorVs4+uEih7gS+gKIu?=
 =?us-ascii?Q?cJkrqrVwEfJHZ3E14wy6ndW6bubtNdFz025mqRUBUcsGBc4oPnKVetexb9gt?=
 =?us-ascii?Q?YCzSPAZ47gKVSg3N0t7OmjWugMSkTRf0WgJFayKaPIL88xUHRdiIEhG/CfT2?=
 =?us-ascii?Q?K8GcddvD1zH0cxpzqbf9GV7ra3oKo27jGaMI7ktP7dcjCzX3bcUBhgsMQh+a?=
 =?us-ascii?Q?uS3frj65uMqrIe7kyUcVMarrAyMOUpjHGOuDviRwaV8S6bNEKa/lH3/C/DwF?=
 =?us-ascii?Q?7jcwsVqryJOMxRPsCdw+6wnbyXSmr3maWnBmStJVKW2HMiok8e6GnaJbCZ5U?=
 =?us-ascii?Q?XWO7zxhJxtWY0okclIqreROuRePXyVY1oVCWGjsIw8Bl8PJWclsKMlpv1J8x?=
 =?us-ascii?Q?RbcKXReE2wWRQugVN4dLNdurPZyZKQ0pJqxv0EHm0IP87C60BZXHu6Z9+TGM?=
 =?us-ascii?Q?YzhrgFlsaancgSLGl51L94MHuTOC2gf9ZiMpj1c7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ead6584-1a8d-4544-e635-08db566e9ddb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5859.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 00:35:29.9491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: quwaq1n7Do6Wzki1KEYs1BzmvuYKx2NjpKlDcWOwqkc7ZDfuHG5DfDBVjoKl3eaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7215
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
Cc: Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The expectation is for the probe op to return ENODEV if the iommu is not
able to support the device. Move the check for fsl,liodn to
fsl_pamu_probe_device() simplify fsl_pamu_device_group()

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/fsl_pamu_domain.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/fsl_pamu_domain.c b/drivers/iommu/fsl_pamu_domain.c
index cd0c60b402154f..d0683daa900fa5 100644
--- a/drivers/iommu/fsl_pamu_domain.c
+++ b/drivers/iommu/fsl_pamu_domain.c
@@ -427,23 +427,28 @@ static struct iommu_group *get_pci_device_group(struct pci_dev *pdev)
 
 static struct iommu_group *fsl_pamu_device_group(struct device *dev)
 {
-	struct iommu_group *group = ERR_PTR(-ENODEV);
-	int len;
-
 	/*
 	 * For platform devices we allocate a separate group for
 	 * each of the devices.
 	 */
-	if (dev_is_pci(dev))
-		group = get_pci_device_group(to_pci_dev(dev));
-	else if (of_get_property(dev->of_node, "fsl,liodn", &len))
+	if (!dev_is_pci(dev))
 		return generic_device_group(dev);
 
-	return group;
+	return get_pci_device_group(to_pci_dev(dev));
 }
 
 static struct iommu_device *fsl_pamu_probe_device(struct device *dev)
 {
+	int len;
+
+	/*
+	 * uboot must fill the fsl,liodn for platform devices to be supported by
+	 * the iommu.
+	 */
+	if (!dev_is_pci(dev) &&
+	    !of_get_property(dev->of_node, "fsl,liodn", &len))
+		return ERR_PTR(-ENODEV);
+
 	return &pamu_iommu;
 }
 
-- 
2.40.1

