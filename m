Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1918E705BFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 02:36:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLZ170Hb2z3fFZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 10:36:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GNh2oqsP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::611; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=GNh2oqsP;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20611.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLZ0D2l5fz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 10:35:53 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6Cz0GyT1IxZV+pJOj0yrITH7ssslzv+3n1jim2qK/eK0NwFhCdiFYqQlRFD8HYP+0GfL55cr0DwA/1y4+fu6HHpU6IuaRKW6O2GH8njMPxz2cxjQHPl8q3ObA6D3KgcAs2iHWSmvIjErngwq4rB3qpRJTp/M4KiQD9/H8uO56FL0pqIhurVq/JSIdpZai0N7/2JwujyNYYV3seWlPF07YbumjEmwajgwXm0HMoqXeErcC+ikCXy2V96WQ4IJQ1PZHtO5x/WVgoA4+gEEajpU0z7OJevPpDymfxU4UzfwXPr21Pb2MjVnPetuQf02rX/JUW/rURZk8nnV3ijbKMiLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7FMYSlKQ/4NPzNNlxikHF68lUcS5Og7PR7JLicf3caw=;
 b=gWdVKLlh2IbB1VqhHo98CLQKwuEa4YGLTpulqTfuHFkUE/klCGvaVNUhZO80rpXZkUQ8LBnpEkFSAqboazGLFYJdn1UsD2/vC0Qt2mUvp8T9G8Chcq38qpDow7FGIcFLHvx6pVCr39hSS4ilwBnI7VdtjvLe2c4zOpuLYDZXXiWeAj9w840HiySYn2SPP1CeSixeDHHRLSFT1VyZlUFFdxSXszTuyQqIgAORmXFvuOe+FGitoTO0gk3dTX8IOBaxQonRY5v3po8hD/BIYS48scwqhoQlqeiDyyNhd1uuBbHTb/11Ei7W+rRTNabSdJux1IbeTNL2LMr47xu3+Y8+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7FMYSlKQ/4NPzNNlxikHF68lUcS5Og7PR7JLicf3caw=;
 b=GNh2oqsPZp9ZOuQJMOvY7BqckclZIkJmbJdSkuf/jR6JftWT+3lZWYi+bDkBYxLScFdKieJWarVhfBXaX1g6dlzwV+NfOeFF2aE7N12BvYf55fe8cQeFQaMOh1tfXeHleUgka8RPCRBk7nIgC5DQ36AmuX+KcNktO79eZfXSVndyd2in5VlWvJLsBbjd+46oeKXjc7opMhxicvKgJKFwJcz27wr5A31fNpKrIdeGfKiDYPh35HBGkm/vGjdwZRTF0l9pA/Puucnfflgfgo/bqa7cCJ4VG8+NKbEVtC2P+NsEcVEuNJIxeeaNOU0CCqmQShW/0dXL4M7w9OYrjKJnVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN0PR12MB5859.namprd12.prod.outlook.com (2603:10b6:208:37a::17)
 by MW4PR12MB7215.namprd12.prod.outlook.com (2603:10b6:303:228::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 00:35:29 +0000
Received: from MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2]) by MN0PR12MB5859.namprd12.prod.outlook.com
 ([fe80::94b9:a372:438d:94a2%7]) with mapi id 15.20.6387.030; Wed, 17 May 2023
 00:35:29 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/3] Remove iommu_group_remove_device() from fsl
Date: Tue, 16 May 2023 21:35:25 -0300
Message-Id: <0-v2-ce71068deeec+4cf6-fsl_rm_groups_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0006.namprd08.prod.outlook.com
 (2603:10b6:208:239::11) To MN0PR12MB5859.namprd12.prod.outlook.com
 (2603:10b6:208:37a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB5859:EE_|MW4PR12MB7215:EE_
X-MS-Office365-Filtering-Correlation-Id: 40229c3f-db71-4a0d-89be-08db566e9d9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	dSRPf7l9kiOfsI7XMyphgZIzPj0unHMZcnrEXwAIiJ7ZQ4vmyWTNxhOdaIWy60u9H4zGtvTimx04WlF8R+iNxUYC6nGqA9X2ZQ3PQnsR4nP4ykdYWhw6/e7eJsphxNAzadMadhIAnHgTb3qqfTan4xufK1djLQnED5ScGez8E3rcJDYP2vmntOu0PWZO9Ih+UlHoYy7eJADHiljqbCjluaKu0Q/wIwEbBxfnkWE1Bvv7F9b+mH5WbY4qn+sHqNRZUL16svZb1df+AwYQ48SMthsNo5+CD9DU6LvXy9/Vkbcj0C4eV7AxFgXWb7fSxEEfUtH0GLPOo9Jc8FmQLA7EdMnx65IuzB72tsnvXirahOko7hX7K+Cw0GGEnYq6GOBp029gR30W1dZe/AE0cU3ZR9Lhyi+B4qJgpidD20kYMHjNnoVaZkFexVa/bXluG8UleyVIKlXj3gxHBpoMeyDDZ/ukFnUG20BrJh5XxFgIX0iQeCMHA9iTUJib8O4f1nsNF5rNzdoheRcq70oQvHnMuatSViN2RpCCndU8fleZnft+b8Z3x75Utzre9N1CPRpkpHQO6vQY1bHi9crd91JCoJpPKqRKJXLYWMBv2g/+ZqnfKK9cx84tiAUmy4a7/YJGBHEhlfIsOO9RfrRA8ikGRw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR12MB5859.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(451199021)(6486002)(966005)(2616005)(36756003)(83380400001)(6512007)(38100700002)(26005)(6506007)(186003)(86362001)(110136005)(2906002)(41300700001)(8676002)(5660300002)(316002)(8936002)(4326008)(66556008)(66476007)(66946007)(478600001)(6666004)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YbA4ALk3rp+sLsnqIHX+OMKV7IYpn3A4XBlPExHkY8gBam39h9mVa9/UQRNr?=
 =?us-ascii?Q?UdJL8ad9l/nCGgragkNwizyApkzy3FdCwqLP1uhnmI21pkLf7/U7y9IGlJ+c?=
 =?us-ascii?Q?VAuzH9YEjOOVeklZKsCRtZJYPFup8nkl5CfLS+tKkv6s/ubJOPW7/HzsSJ3n?=
 =?us-ascii?Q?kf3Rs8L5NCviEYIQ7e3dml8Fy/nQEKVW4Jok8vqfGvAbREgqxpkX630nFzxL?=
 =?us-ascii?Q?92dqDHc0lRqnJzL9RAx9Pa5uspJDe6xz58C7q6aD9143i8tpPHRXdTvdRA5H?=
 =?us-ascii?Q?k+i9ZdPlOIylhgpkVJvI/DdtnWZ7RQn4Yi0CAlQtpr5P4TZgBQlC4Wt2ce4G?=
 =?us-ascii?Q?ouYjZgM8VLd++Ryn/no0FOvsY0UvTGv/ho+hP4saEuw6o8vxr9CRe+ZMFIXJ?=
 =?us-ascii?Q?iOJBerjscRqrfVVrqXc6UiDz/a+PuXvgZkf1QvlVkJpv0XT0KgDx12d0To6n?=
 =?us-ascii?Q?vVInYovh6QisG+K/ELg4LlRZv/1IamLhu86h6DLwvgPs6V+uMKbxFEyhs8Q8?=
 =?us-ascii?Q?t8BtmCBDCcuMlzq/XYJIRqoDcUS7gcVSnAK0KgCeMZ2IAMIK3EqSc5KWIr44?=
 =?us-ascii?Q?B8GGxEpoIx5pft7eA3JxwDGu8Rhb662yZ0Ef3elpFq91VwbT4a+Ig/nACLis?=
 =?us-ascii?Q?qHuGvUaJe6MZFy6KXKZHGKFryC7WT8fHxG5Ite0Gc8GsT71uy8yYmsooW+jh?=
 =?us-ascii?Q?rWz4GlL+1kBhSbjPwD+K/zDCuLDtYBWyZF1CjB6SAXA/HXZVjhfQGuIkXjJ2?=
 =?us-ascii?Q?1+h4d02+OVl9/G9i4rhLTmFZdVlGeKAPjo6TFyy0jGwRd+Zf5bZl3bJhDVuW?=
 =?us-ascii?Q?fxS2Hkq7/bQDXEHK/6NnbIzaf5b5+hn6T5NXn/Yj5k/KK8t3RXDd4YaLcIN0?=
 =?us-ascii?Q?ROjjE1yfEPj8ttfJ4aJyC7QVUoxUnrVnIpOtwDuhwNgOWke2/uTNRqohmb/U?=
 =?us-ascii?Q?rvkqxWZ+uiJquxZdrs18VyHlvOAxL2EEXf6/mZG0gU7RjNdV2r4jOiPciJSd?=
 =?us-ascii?Q?fCMx3zLn4LoRmIdFAfPrbSRnPNIe8QXHOfQAKoyCeY5yrFlpl8yHvh503cRa?=
 =?us-ascii?Q?8W9Q3Vb+SCcLD6DkoHiQmH9hDkqYrPqJzgqazb7i5OZjmZGCA8NEBXWwyzQg?=
 =?us-ascii?Q?zB/EVDPm8VAd1EYZqFh4+ig9Es1IrkC+ilMhC50v4yx/LDiZfv8VTOYGpiOF?=
 =?us-ascii?Q?5FG1WhlyCVpA/nrYO2CN3+Qrg+jQ4f0Jvo9qRzUXjuhZMBsrS3RaGcgzHcPn?=
 =?us-ascii?Q?VhA8Kt0y9uJWdX9vEC+jbo3WM6Qf21qIzaymulNmLA2eOFRHkQvRHtQOds2N?=
 =?us-ascii?Q?4fVOa/OASUqNHh9IqQYss0xHs1y/gHnfgNYZeO9afpmxT5I6vN1fAt5JWw9Y?=
 =?us-ascii?Q?zVvkWELFtfx13b8FdacJLOivSkS14GGXBjtbOueSYLAZX53nC3ES4awAiTq2?=
 =?us-ascii?Q?A9SiREx8cxw+8pWQqLR+Zl6EjRMBzrCqOaJw81e9Rjlwanvpro+SrMdhQEGt?=
 =?us-ascii?Q?jMqwBbUSCJmVhNSHpnHEIFj0omwTbxdevGTlD3qdiAZoyCo1M8Er4P2pAJpf?=
 =?us-ascii?Q?IVpIX2GsbTuInpplGXJ/w/YHE/ooEVUtdinEMbiP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40229c3f-db71-4a0d-89be-08db566e9d9b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB5859.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 00:35:29.5419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w5D1qCMw/1qcgQqntG+xuf/x3DwW0uhNZb+uCYU3o2kmGpntNbOTdYituUSxvNqX
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

With POWER SPAPR now having a real iommu driver and using the normal group
lifecycle stuff fixing FSL will leave only VFIO's no-iommu support as a
user for the iommu_group_add/remove_device() calls. This will help
simplify the understanding of what the core code should be doing for these
functions.

Fix FSL to not need to call iommu_group_remove_device() at all.

v2:
 - Change the approach to use driver_managed_dma
 - Really simplify fsl_pamu_device_group() and just put everything in one
   function
 - New patch to make missing OF properties a probe failure
v1: https://lore.kernel.org/r/0-v1-1421774b874b+167-ppc_device_group_jgg@nvidia.com

Jason Gunthorpe (3):
  iommu/fsl: Always allocate a group for non-pci devices
  iommu/fsl: Move ENODEV to fsl_pamu_probe_device()
  iommu/fsl: Use driver_managed_dma to allow VFIO to work

 arch/powerpc/sysdev/fsl_pci.c   |   1 +
 drivers/iommu/fsl_pamu_domain.c | 123 +++++++++-----------------------
 2 files changed, 36 insertions(+), 88 deletions(-)


base-commit: 1421774b874bfd5fd1b2b05b59b67c0c5e0d513e
-- 
2.40.1

