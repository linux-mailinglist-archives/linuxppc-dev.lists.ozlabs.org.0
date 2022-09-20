Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 417135BE76E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 15:44:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX2pG4J7sz3bgR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 23:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DQLRZNtB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.220.47; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=DQLRZNtB;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2047.outbound.protection.outlook.com [40.107.220.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX2nT0Jk0z302k
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 23:43:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TOa9Y0QlLWY4zhwn376VOtFlxHn9Bl88vIwYAm6XO1L4l40iiYA85sPceNuOaCxUwSV1QVYNsOC0KZYzwBuWZScbuWWOrKl/l0yS/FUgRmBKSjHHZDh8IMZ8vxFeQlSc7y14+cXxfpzNGRg4ZvG+yBJb1rv4ASCVsJYZVtwghPu0rjNrph8ZwsbGbqHsBaUS8W+lqyTtUaqFx7oyJMVjRpqqhF2uSbZ0gLwSplqjIe6ikKeIMoEgbvIZ85X7IxBpWo0Y9s43+wTEfKujQHNcZwvnTWXSXi/CQB1Qz9q8ETCGtjLVU+X7uvQQaZBPWltZ9vZHxa3hQfHYC2g7AcTKtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sIQpvw0fcqP/hw6v52sf0f2Tf2S5I2VAilsngtVae+k=;
 b=hhfrp/RbTool/yJ4cdoJdUSWJNCH1apM7qf/TtVWydUtDE6QKX+nBtFSbna/Q2v1F9bSitzOm8Ajts4yigMaHqMBldZNJlH8rKStrsr33UdA1Xc4UkiTQ5tma0Z9n2t6DAjtOB+Td07h7EEC5dnEpTOrmd1gu0gAF1klZYbrixSO27QyB2iQo72WgxIskQpcb4D4ZBuCfxGwCBT8OgHet9hj83NmClGULdhLDU0KUVEpVnRJftrxqSBxb/SdX0w/q53op80R/2WHeVw1CEWZNGYroe+Di5ib/P1r9yX25VKrf5beHFCCi/5b+SWwxU59h6KStxuJFpRsCvriN3Bhhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sIQpvw0fcqP/hw6v52sf0f2Tf2S5I2VAilsngtVae+k=;
 b=DQLRZNtBrbRtUnUPSonwp37ryLAV+v2DuqcZUBfxxz1ym4N+Lpq3DDgUP0GghL+W830kwfL1BrS52xW23+NKCd/y3JpkLfWzRVXs40ZknTdPM+dd6fkL2zhz1LJ6c7rSJNBFXKUsA8jCUgpp13n7ZVyJ2yvJ+Shf+5dwyjo3mECxPfOkPGObkEZgZy9OyC0XgXQd/SM5I+MoITJBZHp5I2YYJK3jLKkc2sbaddMOn4w5XZW95nBtDzbeYz9VIlQEcFN8jZiuCS6pp8ZasWUJix0+RDsO6CvNFsd/v9N0XHFvBxzhkS4XW44cZmh9WjGvoubtFo5EuNBHKWnnSpRjvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DM4PR12MB5118.namprd12.prod.outlook.com (2603:10b6:5:391::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 13:43:17 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 13:43:17 +0000
Date: Tue, 20 Sep 2022 10:43:16 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2 3/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <YynDdJRr6fCBCm7Z@nvidia.com>
References: <20220920130457.29742-1-aik@ozlabs.ru>
 <20220920130457.29742-4-aik@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220920130457.29742-4-aik@ozlabs.ru>
X-ClientProxiedBy: BLAPR03CA0143.namprd03.prod.outlook.com
 (2603:10b6:208:32e::28) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:EE_|DM4PR12MB5118:EE_
X-MS-Office365-Filtering-Correlation-Id: 85a7d65f-5c14-4dee-a4fa-08da9b0e12a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aNlG6rA0dXdgr49W+3vsbZVW8TVVklbNyKnKSiQyN92kfYqqqtaQ55U3Eehs7gwqfuk4G00cNf2XOqbUTXxGocHkYOTRD0enzPJ3dlEr4hy2AKmayKIyHz6QrIAt6B02Ywm4tnpI+4zaVnLb+99fSmnvFbbNiSrjqeYEWIqRDtD8/qU/BY90TrwKn+rfqGwBCf1xvHQCn1DfvrgnsUl86iNARuIyiDqMcUc0FFJ84vp5lvrB4Dzd5k11Qh+2tziKdUEy/tVnPoCODqWiiOFYccrijDzcO15riDeMwkwzyHL6RokJ/3KHuKUaiIJbWC6GN/6bp8ysbUQf2AA5iv8KtKGjuSCBesrKPi2fV73bcTb/50dSEMrIohcWdpWJfMkGgAnkmdVR8udmAzJeRW/lFeXKqQJXOjdFJNyFo6/2fMSgCwm4GObdB9QD5Cv1OoyVfMYoR/KXrIiiLWewSsu0xGuodVChlpid8Bwwaz4XEpIcbqTO3naJgpMSGVl4kefK7jCHJUGoH/0DNCp0tMAoMNijF2BnufZXqtl0G9Q1Gd92igQh+P9nXyzXuGg6JBwxF7J+tqVvTjI4BdNtSyndKUj3x5KrJkXIFgPXdw8lBkcPdHfJSiCnZks00uztXihhdG2v1URjvXTBLMgXoOn3qhh85zrOfRGBwjfbD7wvKTH0byU/+gDYNQ5Ixp6k02sCs+T3o4/eMuDqKSk7dHcxGw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199015)(38100700002)(8936002)(186003)(2616005)(6512007)(2906002)(54906003)(26005)(478600001)(6486002)(6916009)(316002)(36756003)(66946007)(66476007)(66556008)(4326008)(6506007)(8676002)(41300700001)(86362001)(7416002)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DVnT7Fws2onFMMMii77ZWI4CRA2QnyJpcUqyqrwzsMarBn1x5ZQdOWRXCETc?=
 =?us-ascii?Q?kinxNBJtuK+1KttnX0AWoOVMg47RPZUMsoaeGTsbvuzWGpXCJKYbcF0eGRHq?=
 =?us-ascii?Q?Ki8kN0vePlbgFEgzshj6At+efBofB1T2ZRFEd1JlBFuT5bME7u9EZGfax9x7?=
 =?us-ascii?Q?jUTs5eCKiwW51n4jKPIc2dlc53hdNqyKojL3NlDCN1r2/a2nsMjollcAKLwk?=
 =?us-ascii?Q?E+/qek6a2TcAOGjh5jDPTfCDRKpH8Ihwuu81SjKID4H4NTiBo52c1QZLILnt?=
 =?us-ascii?Q?fhj2u+POU2k9A8ql02RktgnZ0jPRS3COTURs0WzdKKUCXUxMMr3Hei8aoRoB?=
 =?us-ascii?Q?ZyjcyVOmS60VtRF7Qq6u3+0g6ew73pWef1mb6j5uylzRTpUEyyQ1E4zgJc2J?=
 =?us-ascii?Q?W6t0ADrST6IvK1EtN0OHp925EgacPsnP4w3bQU5G6cej4vzBgA1TzuBmVx9i?=
 =?us-ascii?Q?M17gW+w6vbHgI6MfrSK+yoNXHh5NNsMd+6qrmyoNXT4s/Ji4btY/F9tfWZ9D?=
 =?us-ascii?Q?WuBYx1Pd/9R+vWMIDJmQXHwqv1ks6/ecqzo+kj1qu3pUa2OmO1Ge5cgjj3Y6?=
 =?us-ascii?Q?9PO4z52CgGlbc3/K3qhTQ+7d0vTa/8L68UDZlVu914twJ5Ljeszjqi4Zjm1K?=
 =?us-ascii?Q?79fW5tH2MkzmJdTrocMi8zacCsqGSC/7NohyvnGiy20s2kcerYzsakBFA5Cd?=
 =?us-ascii?Q?ii850hRK6bmbRbaSR929kUwEuLY+W18RkaGqtmMhjSBSUKFoczmyEqab1ADq?=
 =?us-ascii?Q?v5xAi/C3GGcmgy7/t8L6VpeysQm97FeSWeTxWv1sT20IxGnl0dDDuRovc7h7?=
 =?us-ascii?Q?T0/Icnjt+6jv5f9Byg3txYQwifHcS2Z36ecDnX/O6mogWs5SrEDQW7TiFZGc?=
 =?us-ascii?Q?OUO1fsUIoZTiJNMyzW/Z1b+EE5I/qGsVcy5Igo5QmoO3rDJCwaD1yV/xtatJ?=
 =?us-ascii?Q?XS4xhbPtpYthOuzdQlAIokjHpXx1sZetHGBf6moiCVFupHeNHdz3dUCiBHbL?=
 =?us-ascii?Q?JS/E8NVr977Nr/BSXoibXScL0AGdvEqSf72zLpHFZ2NTtyvzGGgiIAK4tELN?=
 =?us-ascii?Q?YbJHpgljgN3W416dSkvuQ09iIM6zGp4Umr29H9+hfX2lrDOnlOjvGwc3kbfb?=
 =?us-ascii?Q?gYQRDJlXfcUwYjD42igA114I5vbsE0jK8baJS+oOLwt44I8DHymYCq/Q7q6j?=
 =?us-ascii?Q?cjGv8Zug/IDjKCwC9oDDx2VAr07ucW0Iqu+hAtRxheMeoqpyd+TUH5/uxQAq?=
 =?us-ascii?Q?Ip65RwQUfZtAXDcd+YLOJizJ/MV7f1uonOoSC0MfSp+GoTuXasBxjHyueSEm?=
 =?us-ascii?Q?ZbT99wUvMi73nsTxhFMs4MWmZveReE3y3CkcVl0bwJJVWhWlv9TU5TruC6Ej?=
 =?us-ascii?Q?oqQs9kZ6qpZT2MLm0LpxxDdUyP4ATcq9R62bc+5uqu2BXl1jcE0AK+82mJhY?=
 =?us-ascii?Q?UwKXnIsHinlFifMSqqh83Wq4szm2LYugWFPFJvl7tZE9vz9ff8Rd8LtWTFHs?=
 =?us-ascii?Q?qYYWvJD8zPHG0IswbF+9RrVVBtuLokMbpGRa8cZElYdNmUZ3iBazCzMVbNmG?=
 =?us-ascii?Q?lW14y+LHYraHBbva0DEwDG32oVpsezesWhBIl9kw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a7d65f-5c14-4dee-a4fa-08da9b0e12a2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 13:43:17.2248
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WNVDOrw63NTaVJ7AVD4N+c6G/wxWJxJSdMPUY+cm/dT1oFRwxGm5qE/x+ZGeAmW2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5118
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, Robin Murphy <robin.murphy@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Alex Williamson <alex.williamson@redhat.com>, kvm-ppc@vger.kernel.org, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 20, 2022 at 11:04:57PM +1000, Alexey Kardashevskiy wrote:
> Up until now PPC64 managed to avoid using iommu_ops. The VFIO driver
> uses a SPAPR TCE sub-driver and all iommu_ops uses were kept in
> the Type1 VFIO driver. Recent development added 2 uses of iommu_ops to
> the generic VFIO which broke POWER:
> - a coherency capability check;
> - blocking IOMMU domain - iommu_group_dma_owner_claimed()/...
> 
> This adds a simple iommu_ops which reports support for cache
> coherency and provides a basic support for blocking domains. No other
> domain types are implemented so the default domain is NULL.
> 
> Since now iommu_ops controls the group ownership, this takes it out of
> VFIO.
> 
> This adds an IOMMU device into a pci_controller (=PHB) and registers it
> in the IOMMU subsystem, iommu_ops is registered at this point.
> This setup is done in postcore_initcall_sync.
> 
> This replaces iommu_group_add_device() with iommu_probe_device() as
> the former misses necessary steps in connecting PCI devices to IOMMU
> devices. This adds a comment about why explicit iommu_probe_device()
> is still needed.
> 
> Fixes: e8ae0e140c05 ("vfio: Require that devices support DMA cache coherence")
> Fixes: 70693f470848 ("vfio: Set DMA ownership for VFIO devices")
> Cc: Deming Wang <wangdeming@inspur.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Fabiano Rosas <farosas@linux.ibm.com>
> Cc: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> Changes:
> v2:
> * replaced a default domain with blocked

Code wise this is much better..

But it is a bit unsettling to see the blocked domain co-opted to mean
'some platform specific VFIO behavior' - don't have a better idea for
this series though.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
