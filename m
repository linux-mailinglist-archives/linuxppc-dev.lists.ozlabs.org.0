Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6337BB688
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 13:37:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O8RYZgc5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S25yY22qJz3vXc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 22:37:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=O8RYZgc5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::60d; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2060d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5b::60d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S25xd2nSzz3cRv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 22:37:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD5btIUv7muxLEyIY4YNasMU0VHU5BDW4aZmBMsZYJU3oQNnboiCUN5Gxf4MZpMYAcy3jZyx1k0/Lp+gbfADeoL3ahVzG87jW5sN3bbsOij3+Tr4lcHeuC290LwNnyV3PHrA0infLWKC0c2mFV4Tfjj35IysAd1GHL9o3ztsUlwsbQngUV//76ymfTzVK5yqxNfzozI/Q5j0wi5H2QU5m4WCshDLbTSpRhhCH3nD9WTqRLClrvMMf0IuOFYfSGOTweFMKaZWQ2SgN8/OfY1sGtiKReBd9+XP0oQfhMjIXMNUNWxV+XSY9fjARsUpwSXzi5NLpxnzhRUZX4grnWU/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YS4GKvPWR+qtNIH0/VPfhhrwct9zM/hGetdmYRwC6Y=;
 b=i9drSmA6hwaV0MMbuHFtBNu7fc6h36QA+3Sfj3du1XWdz3i65ELJBPdAeLp1Ihq7RPfkm00HF+Fj1EbxazLbCeNtBn/NLhJHqfS5I/J4xSBGnzXS52XZ/YTnQgMApmiOq7zgApG9ol74/krzWTgJE5QlJSJCiQ+Q31vUjcgY2P9Qo95NVMkumtU23pLKQpeSNbeIyhPPCqkcKWDOiKr/udgbuiGsn8PbOEmzdivs+a7wLwRFE3TfEkL2dsVU5HWPxl8/t7UNimjsCu6GbTMnj4MmCafQi+vWkKcMh/63DvgwyhAH36wRDF22yeWwSaGCD+dsKqpnc7lU1WJPZ6IdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YS4GKvPWR+qtNIH0/VPfhhrwct9zM/hGetdmYRwC6Y=;
 b=O8RYZgc5QVi59yDYMK9wJj3eE1maamFl3+zEXmCjdN2iffaJYSJ1wa4W9MeB4V42mQabzyvXt81iY+ckVNfJPBbHZ/r8FufiCxf6eLgrzrnuoRl9/i8huO2UOOYnqFlwNRZry3QZxAYl1UYaA7A6LweX/HzInUOFryVdyRqBw/TeguVlH/wqtF3yA+FE8zsugLHQgWYILcSyrSqQgyQ2FAUlXlylNGgRxQPyEzgoLSlip4lASSvHA/KaSe2ssJKvNnP4UWi+48ncftRyGET9941fbpF+d8toVVsrOTp264PwNKbPJJMok3MCPGiwFiB8aRMRtRn6jADJ1Z7TApo0pQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MN0PR12MB5833.namprd12.prod.outlook.com (2603:10b6:208:378::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Fri, 6 Oct
 2023 11:36:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%6]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 11:36:45 +0000
Date: Fri, 6 Oct 2023 08:36:44 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Tasmiya Nalatwad <tasmiya@linux.vnet.ibm.com>
Subject: Re: [Bisected] [commit 2ad56efa80db] [Hotplug] WARNING while
 performing hotplug operation on 6.6-rc3-next
Message-ID: <20231006113644.GN682044@nvidia.com>
References: <92db426f-4a31-9c2c-e23a-85a8d353fbae@linux.vnet.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92db426f-4a31-9c2c-e23a-85a8d353fbae@linux.vnet.ibm.com>
X-ClientProxiedBy: MN2PR20CA0040.namprd20.prod.outlook.com
 (2603:10b6:208:235::9) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MN0PR12MB5833:EE_
X-MS-Office365-Filtering-Correlation-Id: c7fcbc66-99bc-4b2f-6ca3-08dbc66084bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nf4KgmNb+mRs9Bl/BCJYCEEhIR8KAVdvUM7YIklGK5MDHUJxmUaUL7AbLfnz1xxbpYN+N0Vq3vH6VmZPHXkzwX3knlKWZNJS2Blvl3kDVdgQFYnhEMftKOpcDuneYUDCRQiZvtUR3wiR+KXwJlMEmL8w+p6qhSBEGcN4Q9ov8pSre0Yb/Q+y/sO7c0z+E45gD7hcFGj+EcnqVn3HBff4zbmmSce0eLttI6elcQve3qlRChGH8XZFnPmqEyAwmWtpU7fWTChuPUyYmBPsfIFtnQdg6AXN2sRh4ItxvrAP+g3iHEPF7/m/qlZjpVCr4WMAGfh1FNe0GmtitzqbPYVhSx3HvPuA636Zk9Ej0SAZnU2oDO+NWlGWy+0134xp1uOB6ufKfV7y4jYs4rqdkV2zXXqBMMBAZ/zQRdGfApiq3NxNdXvlLqL52Qjkm0WSM0pI6A3haHV/910M0s5dGdLebhdWBc6Pgx7SBwGHdNLet1MjwZRer9sbVyYusTkM0fKpC3cyEnpSZ5GpxtI+JCBmD9NZRpUKv49M5t+XWC0ZaERJT++P3IYEWgIJlXFc1Fay2nyo+mMKp3hZYfFlKUahDYjLyyLitKL8/VUcgDuduM1l7bH6OPJ4kfMmuCnowGcUwW9UHhZun7IPb4nRmHM/XQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(396003)(39860400002)(376002)(230922051799003)(451199024)(64100799003)(1800799009)(186009)(83380400001)(6506007)(6512007)(6486002)(966005)(478600001)(86362001)(38100700002)(33656002)(4744005)(7416002)(41300700001)(316002)(2616005)(1076003)(26005)(2906002)(36756003)(66946007)(66556008)(66476007)(5660300002)(6916009)(4326008)(8936002)(8676002)(27376004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YdLpxw1kx+SBdY3HvKQulg6ARz0d4JBX5Akpvra7hYMkVzZeNkE71dAVEQqL?=
 =?us-ascii?Q?eSO+rUpJIe3MMhez+ngEJViaIbq/LsccY/l2RjfVFoZCqw8uZ5Qair5V+lAY?=
 =?us-ascii?Q?nn5shW1vw2Ahep501euCLm8NPm6PVeWJ8PCqPveTqvmgf6dfIprUo9bW/LFs?=
 =?us-ascii?Q?PgDLD5RITvTOazxS5g9n3IFYvsoKhw/dzRndNzOMotVZisGcBkLxDEZoHZEy?=
 =?us-ascii?Q?aoNkEdDO8f4JcqUEv+7PzGGadx4w/7eRBjjARwDBFtoZvAA5ROjtliIQqbbG?=
 =?us-ascii?Q?Q1yro/pGGZWMnzWWXahvfYYjtgrMcW/d8dA+guy+1gl5M+I8rfXoFH+Rj2hs?=
 =?us-ascii?Q?oD6b63nlz+XLTxtgLPBIEcoEHRm09YEppqNztvfavMrgq6rI5xXimsApLRr0?=
 =?us-ascii?Q?G7x9qNWp9VTvpTCY/dkUPMwDklhBB6RvU6jSo17iEPWsZVqmwYZB/Vnl/dSa?=
 =?us-ascii?Q?9SLQ2WP20mVhuX+3IN+HJj2tc4Uwv6thmqEau/TCQD9FhjDquyElSz6loNTN?=
 =?us-ascii?Q?pLKs7gRN11m44BP71pQqZki4loE1xkpnhIz89fus8P3P030W6q6+e9hLNKGP?=
 =?us-ascii?Q?xfiKqJdl/VCX8jIg/JxlpixnxroyBbiCKnUTw2iojsrurb6xOIxGDIA05eZU?=
 =?us-ascii?Q?gWGSg2tJFq9TJO5p4//YMeV/F1TS5zbLLaqkcIan6yNCujRJ+72+QO0wBUld?=
 =?us-ascii?Q?2z4FwuEc3zobyRudXlC6aWEA/bbGBkZ4t7usrlMsj/Ooaw7uk9cgS4YlsPcP?=
 =?us-ascii?Q?vB8h3MQb2D4m5LkesiuGMtpkK+Lu2jwj5x0LIJ/EipyWd6eDH7BqMWaxiupV?=
 =?us-ascii?Q?4SJb6MwkcUoIvkwxInvuaWgooQY3cIYZUdDI++hHfLpXjDjxCFPebVj/fHyS?=
 =?us-ascii?Q?QjuEGcrhXVC1KcaxxHqb6gRTgi/aY9LTHr/1Z8aXMU/UnZXAHLH5xufsfuXf?=
 =?us-ascii?Q?ly2GDKHaDBVUUm45yWjAU3+6tkLud23ZLUnnqmdqha+6jYSJhn+hze5So/br?=
 =?us-ascii?Q?/eLBlYNgnMI2ncyyPwKJAt2aS2Xv26fzpgb3afl2aiHI78StZ1F8ieTqcFt8?=
 =?us-ascii?Q?uJQ2dEFDLIVtrEobW9iUaWUHev1PaTdO9HwGC15frdvp1dc1kGOVRyKXGnLI?=
 =?us-ascii?Q?DW3/+DbJINgMmyUKGs/z+T8tP3G/OIp6PvXjteKyTCICJGxrq7b8lFt6lwQG?=
 =?us-ascii?Q?AIMSIYRdReZPkxhkDKHmH99j9EJFvbn0VXiX1eLoeHQvU3VbeVuXLsuH47It?=
 =?us-ascii?Q?/WX36kJC03o6HuI/UN5JzOglaLrjP7aKWCHmivN2IbouYwrDOJURvr4A+DEu?=
 =?us-ascii?Q?WgzYSAt6UEcwET4bCLN88KgHkK1KhZuLtTyS07ZZesSF0EAEh8o90Arj7etm?=
 =?us-ascii?Q?Y/wstnclToCaos+BZ1zfa8c6chKWoaXsEkaSOS0VO9ehwcI8VGSzby3k/SvD?=
 =?us-ascii?Q?MWPa6vLb7wfxL4PhM+w/CDFbb3y0MtPBS+QKJgSqoHc3jul/rqwqzyC//zJ0?=
 =?us-ascii?Q?ekl0uO86brma9hXE+YU8cN5T4xjhIXnyC45KR+cVzP8YMKZT0xaiY4jkN61w?=
 =?us-ascii?Q?SnxB4sZ0v2nHaqYYRVxdOtqhQV+t/ljDWbD+9b2g?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7fcbc66-99bc-4b2f-6ca3-08dbc66084bd
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 11:36:45.0619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ks6EBsKGpMO5mdtOSOgPATMjKKLjoz5WNqcvSJQ8OCjntHX1s6toE9kIdPot7kEb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5833
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
Cc: sachinp@linux.vnet.com, jroedel@suse.de, will@kernel.org, linux-arm-msm@vger.kernel.org, joro@8bytes.org, jsnitsel@redhat.com, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, abdhalee@linux.vnet.ibm.com, iommu@lists.linux.dev, linux-next@vger.kernel.org, mputtash@linux.vnet.com, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, baolu.lu@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 06, 2023 at 01:20:17PM +0530, Tasmiya Nalatwad wrote:
> Greetings,
> 
> [linux-next] [6.6.0-rc3-next-20230929] WARNING: CPU: 5 PID: 185612 at
> drivers/iommu/iommu.c:3049 iommu_setup_default_domain+0x410/0x680
> 
> --- Traces ---
> 
> [ 6296.425934] WARNING: CPU: 5 PID: 185612 at drivers/iommu/iommu.c:3049
> iommu_setup_default_domain+0x410/0x680

Does this fix it too? I think it should?

https://lore.kernel.org/r/0-v1-2b52423411b9+164fc-iommu_ppc_defdomain_jgg@nvidia.com

Jason
