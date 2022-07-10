Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC8E56CD59
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 08:31:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lgcbb0TM0z3c6N
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 16:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rX7UN7Re;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.102.51; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rX7UN7Re;
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgcZp2lzhz3blB
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 16:30:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hib+mPWE2qSbsnJLXx/ltIo3OBnsquKgsFRAFtXqrJfWdfnMPI4NWjgbkrAycwpu1bS0AgFppmxZ7+U3QfVBv2mUjWNrZSGQxZSqaunFcZj8X8KH4T19SJ5Pz14hfJv3jdCov7BC0SzuT/OZaRubOfXKOyL9bCUFd/0A5Yv7SPzR0Mg+283a0GPjELbkkAEUtT8NrFiFldXuFNLRJJuu6qff1PgfpJundnZStjOAFy8Z4vJV4rNEauoswAtNdKoFoxaZTTOUWp7hAK+UTT/Kvh3nM+0MYuy6ajxElexoWiv5c71F8oDEvt2vSiulhxcJWUahmGRcijqr2sgzL0D2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uqXXNcEYekQhIr6H9A4wWUrvhp3hoflvJbcw6Z8iBos=;
 b=HhZdV7w6a4XyySwyA5O/lZLUKGbS2j1K22NmLTT6VkhGeUwhCIu/UgAvrI9IucUuhQDM1tFMwndOPnqlh1DOOgnkbia3oUyxx6uyUlPO+Ya1CCzgt7wosKzyf8mWvgPmnCjiAOZRO+JyaKds0bonRtPEj5NNHLX2i6ueJRtq9GoqTA8GLcTyBqTl+mUVUhts+NjsyH7Eun++UPW/aXI7lesZs66+9cQGTznPQRROvGfGjLRlSu1P9DGGemnYBhytAkRIuOIQo1hPhijmNRJedOXPys/mRGoRu/CuYNnFvAKc+RYFBzyI0WWVAu2DAIcCPQ3wzWMpXdnGaYLza5QUVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uqXXNcEYekQhIr6H9A4wWUrvhp3hoflvJbcw6Z8iBos=;
 b=rX7UN7ReqO9BKc6QzLnGK2Zsxlt3UcvWo8YNEJjjQpzmivc8qnwbBJ6iCj1r1O8onsyDko8YR9xXIDUtsl5Z/YbWUFLEh32mDMji/o3nQLLb20WLoifjSgR7hC6NdxQ2FR0y570z57C0yRiNrAnNmq6u0uFxVviJl9kC9DmUXKN8DAfLGaqtv0h1XmrZa1cVM9rpZ0pmbxwpxkNbh8rJwhncDOt5pCtWDJn/WnzGCd+mi2DJpKokDkRAzbRH/9WC+QcikfZCsoWu+fur5QJQp7pAVdexptliYG/8N5e+X7X+6an8IAxXUYbU07qSU8kMubvoLPM6+Z3fZr6ZeLKffA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by BY5PR12MB5527.namprd12.prod.outlook.com (2603:10b6:a03:1d5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Sun, 10 Jul
 2022 06:30:02 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.025; Sun, 10 Jul 2022
 06:29:56 +0000
Date: Sun, 10 Jul 2022 03:29:51 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <Yspx307fxRXT67XG@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
 <20220708115522.GD1705032@nvidia.com>
 <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8329c51a-601e-0d93-41b4-2eb8524c9bcb@ozlabs.ru>
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a37001f-bb6e-4a21-82f0-08da623d9add
X-MS-TrafficTypeDiagnostic: BY5PR12MB5527:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	EdnMGswhCMXoT1+e1byA4zvqADIRGr0ri2HVM71H4kqKoBiAzDsiqI5vN+5Wwm/itkq08pj4WX9VyJhrK2IqTp/4uuBk/wpOneoJ/5f+aLr2L9vswrAsYKZJr2/TbND3Sk5pzmG5XkCckoYoROxb2+cuWVlCixr8P5CKUNlVnK7rWqsPORgX+0RZOA2jA854PXeeYc6QZRZjkm6J1zAWKS3u7+xOfre7TYDpjGqwe8Rhgp7tHSNMjLqfBFL3vK9718pqx/yMAOeTuQ830GivpkcSEk5AmPpr43l6e1QFK2l41nfgeLu+irsYkewVOt+sloGuFKUPuMjQbeazOZcgpHvbjcGavNEM67UeI6RYZVQkaHI7a0T70R1TiUAx7glVQVpg6TzBm7rS9kuscehfI2EWtiOSwXVBnjUADKRYvh58/1IzY4E6YZoKQnw89FmQdMSkc+IFLwFsWWSIajNFmzdKUHDTPbD9u7hlDwd9RnhYh+n5gpsAUCZY927xSLZNWS2/osGKqQb/SqcLg54w2JgzWhmKWqQtcCaq5mU8CK/TF18qoiuH+DRE0VziTk5dZXZgLlE/ndVAemxiccaahWc3dBX6pd0ciimlr4gtW8IUM5XhLVPPa+2XZH1xxZ9qQxS0rlBAFTNLucbx+Mmlm6tLiACRnEdBNZrsgHBHB5XpPcOZw87QL96qSamysML3AuwnzXKEf4xGV25ehC7LYZ099nCfug4dbpisa37toTn/Hbbkqc+3d9ercWSuC6Yw
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(366004)(86362001)(36756003)(478600001)(38100700002)(7416002)(6666004)(41300700001)(83380400001)(6512007)(6486002)(6916009)(5660300002)(2616005)(186003)(6506007)(26005)(8936002)(54906003)(2906002)(316002)(66556008)(8676002)(4326008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?06XpSEvfbiujRhCSN0425cj+NETJblmNt3UpaYfg+x6X1NwiMQLb9k5pKNpM?=
 =?us-ascii?Q?PF0tJX7T/APh6zCp9472fv/4D9QnrZe0tSqDAr9ZDgE2fi2IkKlwDapAJDo4?=
 =?us-ascii?Q?sam6YLOY2FoCrdU7sdzpJFpk1y4xs5uYtHxwRc0UhhTbk+XQX7ay/0LIMaJY?=
 =?us-ascii?Q?C5AZep1pem/f5TxfqbzQvWMsV8D6SOaIw/c14de7Ez1rvak51zn8X+YSCahE?=
 =?us-ascii?Q?kQrgWYQrjnJYgBscuFeEyI3HwHH4/vVa6My/C4Oe+deYIQVbcwXwY/clyi5P?=
 =?us-ascii?Q?1Av6piqBqqRN/lwhxzGJ5bNOn4NvPUYYfApFlT/f2osqF+ULQ5nGIb1n+9Xj?=
 =?us-ascii?Q?T3D/l57/h2IT7P03GpUphB23pmn/3DUcpPVeRGWnha0JqyR0/GxxHaWHudm8?=
 =?us-ascii?Q?8gPw+Qzycm1wJdM6hAj0MwtV3LMNGfaBHTYC+YAy+d9GN5wh2xRkIHAIhH5k?=
 =?us-ascii?Q?J4HjomgIKpC6JTW8w9nsNdqO9k+Fy4o2RRL88HTEbeqFplb6vIO0IBXMeJsW?=
 =?us-ascii?Q?Ypb6l+RCArrWbr+WPrL3iM3QO4c5ivJnF7YYlgv3h8t8KAofdn1239NfDf3I?=
 =?us-ascii?Q?OeN4twqMoHYJtAGdfPYEWNHt13Z7glWeW/W3VzgLmr6wriotP6fd8glULpDg?=
 =?us-ascii?Q?Fwj4Xa9uBeesgDsBexqWcwgRIKd6t89sx1PkBLsgkqxaByX2jMsOm0NJCmm6?=
 =?us-ascii?Q?EdtxHls0couuvRME6mWlyK9LgzlCGJAfgClDmg08yqJhXtpd7eVedRpLDkC1?=
 =?us-ascii?Q?acuYNaFuNDvMIn6LneLU8SBDcOjlu52UGAmdqNALP9NjDPZYG8FDtKeZ1dQq?=
 =?us-ascii?Q?NvMOUMUfiW0fk7VVfXuJ/aV6gTge0yLDhiN15/WXiCGGY/nUZDH6mmE6+FOa?=
 =?us-ascii?Q?za2SbnzqUqtelOpLcD+idaCZxE0m59bh7yRHTV2FW06IgRvqfZ1ejoHeOH/U?=
 =?us-ascii?Q?in47TeEzjBxODFFObRIwtm9NqLp34PtgMzDeCg49NF+lq4I9oDgXQWuybqNU?=
 =?us-ascii?Q?MBV7tfhJKFPxyKPW5W6OgmjQVc8EObDavDoT37wuWLWICi4RtMf0g+1rMl/L?=
 =?us-ascii?Q?TYtDPhQabjtdK/icZRcXI7QAtplwp7r1OS9/ErPqeb/ffDn2GtrtZ021KE4G?=
 =?us-ascii?Q?Q94OG8ryMcS3DDhGw1R24p8Mx6zxXBiUd0ctd8PEmFufQkIOcjWxrcddBVUv?=
 =?us-ascii?Q?3PmtonIxGfIdJp1t2/WMvtgDH5o1bC7evo7aTffashyVv5AFB3Cdw8kyr5ki?=
 =?us-ascii?Q?dOkq0OokWhy9Kf7MmJMYa319xYXAXA00hc0o046K8Gj0KlC9sFjLbLaHvJP3?=
 =?us-ascii?Q?rFNIYTelVpctl7lC0PqjaYZ+ubi5nTcIHerC3HpwYWsaipKbM5OcqsbfhFQy?=
 =?us-ascii?Q?STWmuMpeXvcOGewVCnH+WKUG1i4aTC2oTXugatiJmhfXEYSFHo/002qoiUXs?=
 =?us-ascii?Q?klG4GIwGALzTaRbdmL7RHsTdOxlA7FPndQEuHPep4q/HadcTvP6RZwNl3eJD?=
 =?us-ascii?Q?ehDVMgYgReorexwM63FUIiIQYdDJ/cEip9D/CBYzRzZo/ACUn1OwsEdBu/wj?=
 =?us-ascii?Q?n+Hd3g/EXAFQ/fsMIrL/61bsaosb9FR+vDJ95nU1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a37001f-bb6e-4a21-82f0-08da623d9add
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2022 06:29:55.9267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YBVhyRqXVV5ec/1ERq5zJm5VsVc6HKDKZOWfhbJj+aG8DcpBbqN++vYNuvgIP9jO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5527
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 09, 2022 at 12:58:00PM +1000, Alexey Kardashevskiy wrote:
 
> driver->ops->attach_group on POWER attaches a group so VFIO claims ownership
> over a group, not devices. Underlying API (pnv_ioda2_take_ownership()) does
> not need to keep track of the state, it is one group, one ownership
> transfer, easy.

It should not change, I think you can just map the attach_dev to the group?

> What is exactly the reason why iommu_group_claim_dma_owner() cannot stay
> inside Type1 (sorry if it was explained, I could have missed)?

It has nothing to do with type1 - the ownership system is designed to
exclude other in-kernel drivers from using the group at the same time
vfio is using the group. power still needs this protection regardless
of if is using the formal iommu api or not.

> Also, from another mail, you said iommu_alloc_default_domain() should fail
> on power but at least IOMMU_DOMAIN_BLOCKED must be supported, or the whole
> iommu_group_claim_dma_owner() thing falls apart.

Yes

> And iommu_ops::domain_alloc() is not told if it is asked to create a default
> domain, it only takes a type.

"default domain" refers to the default type pased to domain_alloc(),
it will never be blocking, so it will always fail on power.

"default domain" is better understood as the domain used by the DMA
API

Jason
