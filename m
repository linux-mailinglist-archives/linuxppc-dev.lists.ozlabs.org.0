Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B927B0FB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 01:55:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=goYMRxne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rwtlh51gSz3cn5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 09:55:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=goYMRxne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eae::600; helo=nam11-bn8-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eae::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RwtbD4SSNz3bwb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 09:48:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwCBRuSxiY/MhK61AR8Ie8v8r9M/mYZYMZWu9c++4S7tyqU0HfqEo+5qjmuwrnrvaxc+fI6/5Jx9jYKqBd559Cy5n5o9Lve5qzoQ/TmAUkiOR5l5IIknw8u6AF/yEQjcPeTyVBrlHc0kU3BkIANhXO3hsSbz32r4/IAsokA2zfqysC+61PGUghQtgiizTAC46kdGjdEnD2Vw4Y7RL3gJmSvax4IhXYYgdsCmmTFvk0nUV1xh58DT5s7dOU+yLLkA0NnPawDTHsGywfdPiFymos2m5bEtydKEFLmWqm9MHTRCCxCCmE7dACUHJqYH6wV04VUWzkT2DjtxZygttAacQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vW3d8y661TLsDD72mzSlrS3P1kiCZQTAh1Ai9T+z+Fs=;
 b=idw1s/mQh3kl94LjP9New7PFjSKf0Ox3pJ3ZUxuIsK1/3QcDLH6H+A9voDz1R8Dw7tasRUDNSGYloZRVEStMBbsVdmQMpYfhFThgwMbN/crVjxOtZl+iCaWlny/YkGkfPEA/0qKd4vVm1SX+wq/F0Nev3Mw9gKAWhaBsXM/p6paB4yNrT3ZS78kuzQaFSTvTWC17pJChVA5XHyrzU/jP/2R/bLIVtUvtORqyd/TUhFxf25ReNO6CQ4HuL5PIrpChDckFfpTuFUwH+6Z9+u//Ihffpbgjbu3Qv38/PMzj8bacpPaS5wToKIJrXRSDMQQWh33ULCpLAij1rudIX+6qMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vW3d8y661TLsDD72mzSlrS3P1kiCZQTAh1Ai9T+z+Fs=;
 b=goYMRxneTyQ4+3CuAlnuDVvosiGEG456WPXA22eLwldKOD+98IXqAWEuuaT2aIJxwei8IQ3iWmxfH6xmEurXiNRTANu2SP7YVd3UnAw2LTvau5bit5rNPuWfI8YlcYeS/4vo4lgXKYPUcb4A4I/l8KMMcYpT7341TVwyCg7IRoFaG+2/qBAZdE34WXz9EMdhN7DmFfcr8+bazOQl04FBU0BNBgON6d4MlcXgn2G5g0/mb7xVfaEWEHxAQpkBaAUUR60SjT/SEHjG/EUG2DQx9ujS4tC7idpayeroojsWDjbM31H0MCSb4biipjsNWRjgPdGL+ZNKFJ0BaNhdUf+4gQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.19; Wed, 27 Sep
 2023 23:47:45 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::3f66:c2b6:59eb:78c2%5]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 23:47:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	David Woodhouse <dwmw2@infradead.org>,
	iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Hector Martin <marcan@marcan.st>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v2 0/9] iommu: Convert dart & iommufd to the new domain_alloc_paging()
Date: Wed, 27 Sep 2023 20:47:30 -0300
Message-ID: <0-v2-bff223cf6409+282-dart_paging_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0013.namprd22.prod.outlook.com
 (2603:10b6:208:238::18) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW4PR12MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 1172192c-e45a-4083-818a-08dbbfb42372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2Ybi/6F/SHE1bGHVM0eokf52Ty+68rL9nZ5Pt3fuwEJ0Bk+sU8nVnU7D3/wji8mrO5Rapm7+bwfDdEnwlcm0sYQvZtDff+UQknx49Pdi82b7IOAaacEmfkq2qCcNcGM4+xVQiIRNUXi+yNtouEqbcYac9qec69eNJuyoe+ckKXhoCXyfsxNDCVBMUkwCHd7gUYFKnUwsYO/M/brSnVyO4rf3sUmfvw4R355b53JTck4uXgv0qTIMBCxAFwIjzdSlayXH9g+aznck+Zs8raJ8zhSXExsZSVsckiRVIKVOPPMUtl5frA3buW+r6uuoYJhRtaeD/qRM2Ln4w4S4tgKWzp6Evq+6J8luTmLkcBIUKLvuTcUiN6+ZBsMhMgW9LpimoiCAZwLxUoSJ7hlVud6NVE/DUK+N9tJxgDBQ4AAVBCPOVDMLExvzfp8HF0FpQNPtPhhutVS1VbCxU9/6/i799Bj+lvjBVWM+ltirCMuI4cQKcd5CiNcghvTd3QGATeWje1iwyZcfJmvYeBvidAEk0L44zI0XAe9e0pj9rKganzG//UAbtT+AwvhjmN2dNZvUornFzjMUjP+KaaQA2mZOrK2p+eQUlZLuH7BTDuJYgQSEcddr1DViUECE9dpSVFHNrMxn8B7DBmqgQ8zMOgImp5Q0uHbE8QnSLsjB+Hp/0ss=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5869.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(396003)(346002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(6506007)(6486002)(6666004)(478600001)(966005)(921005)(38100700002)(86362001)(2906002)(7416002)(41300700001)(83380400001)(6512007)(26005)(2616005)(36756003)(54906003)(5660300002)(66556008)(66946007)(316002)(110136005)(66476007)(4326008)(8676002)(8936002)(4216001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?I63aZK5D8DyTRcdyEVCqylU+gxt4SE2EE0YEjuNzQtdmesCQwn3PBLgVdz1Q?=
 =?us-ascii?Q?IsitklvG++Fb5+HD7ex3ktn4sn6lcZcUEXKZT9AwZfPEzVa1LXTJ0KvBoFre?=
 =?us-ascii?Q?EXHoJPnlkkVsclumyW0yc5+fXREFcEvRc4hwt9X6od9J18pvZQd1L2pKPZ/F?=
 =?us-ascii?Q?kDucLvb1F3rWl88z/Ix1QUJK5SVOEUHbgvwm6rb07w43F+BdrdSTRic90ZI8?=
 =?us-ascii?Q?mFqPV2D6Ee1dh4qoVUcfGk6oAMRIYrjut5+FRTZ+TuvLTEisbv1Aq9rEsFsN?=
 =?us-ascii?Q?skf6XPYjdB1tjBWNsRjZL6d/fDloztJoUnm1/6bZwpdmk26FI8OS6YvY7k5E?=
 =?us-ascii?Q?LWp/Pg80hGnfK3VR0MGCfuDw4VlyKwA3ylQ3wiPkf83GEP9jQEVS7LkNtGzS?=
 =?us-ascii?Q?XVdAWHJkCV9DUfY9MuoQUN0rJDbMDVrL8QU3vUMRiB6KIhmLjIBQkkTVXzsK?=
 =?us-ascii?Q?/T+U/dks5H/VEV+K4YszQ+fKlvL+VxHqjD/4RvyTwvegOSl82w6abJsoHlTj?=
 =?us-ascii?Q?s00fxEkuuIi9wYnTh5U6ywYSSRK5KmBYF7OL8kZjAX3gzbIr9vnxgo+BG4bY?=
 =?us-ascii?Q?80sqVJ6ga4Vb3J5H+QI2I+TRQBBWVM+9Bm8Jeh3iIoJTtkiQtVfaUkaDKuVw?=
 =?us-ascii?Q?jNrdwo+H1pzCgeskbViyL+WxNdFmdwDsyoma6iW4L3X6wDPiNgybD1fm01e2?=
 =?us-ascii?Q?4BqVD4pncJcp9Wy9HXG0a45siPcSvBqXazfj5n5dxCdyAraeW7AyQUe6H+aB?=
 =?us-ascii?Q?+LxL0FZsTQkNtYWgAzwk91PRVvlOM/tf3E8gMTZlDf8QyR4ry9c+uuWHEkde?=
 =?us-ascii?Q?tpO+baI6JDsv8QhU2sFgbZEPjgLxLa0zgm/iibkZ6HSHQ0oSSTCJY1Jku4W4?=
 =?us-ascii?Q?iwunOvg36IQi6Q3fxSDITV/FbCetyDvwvEuqEGwL2gdv2Xx5yYl/EI0goMho?=
 =?us-ascii?Q?OGJiiAm7yj2U2I/UDYUOuqFreYoC5miaN3nq0/ffoufp5j4axansoelbrosW?=
 =?us-ascii?Q?o0EHm3fs/ts7yPuLSGtmTMUFocsi9gpIL1oF/wtRDiGa0iH6rT8LfgcUdqW3?=
 =?us-ascii?Q?UN0HeJit40mVpW2rLubjxEHX54dtnUgDyQI1dyyNkLoD0sORuOKe9G1aA1Eq?=
 =?us-ascii?Q?Sg2PW2E9XXOf3I++iT+IC7pOWojdCt+bXrBRokbs51tEbk/UBRJifbMtearR?=
 =?us-ascii?Q?Np4jrkTkSX3LSuH2AaoIOKNKwTUGD3fFd8aA2IjRquj9xxIZIAVONU1jpUzn?=
 =?us-ascii?Q?j51sVVS7EWM4s/RZl45wZT/tUlYi+ybzUkWOiPLbb3KMQfrTvOKotFO1hJv7?=
 =?us-ascii?Q?ORHNf4RevaC1VzYTazrIFs6a6PC38Pk3bzkEf3cNlV8fp0KyxKg88xrqvHUV?=
 =?us-ascii?Q?9Xuv6e0msQVgNaZozoBEoAHrjvPqukcce7UmhswnK7cD7SaVVTE38iC//pim?=
 =?us-ascii?Q?+orqQncqHzwNEQGtqyzR2L8LBHG+M8yFl+Vww2Cw+XbBXr1lBoPIO5tXqUf3?=
 =?us-ascii?Q?c9T8ExNDxlSwRcexPkdH/x90CioPl5Id2c68UETEQ9EBYmoHLPxtd54z2Nrn?=
 =?us-ascii?Q?pUbuNkWLX5fGXMQhUgE0vtPuom9ZnX63b79o8xU5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1172192c-e45a-4083-818a-08dbbfb42372
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 23:47:41.4001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5UMSmMGKWF8upN0FJ/m3xub8xrVC6mrz5J/jF3jdVj91lrXfy9vyULaP23YN6n6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
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
Cc: Janne Grunau <j@jannau.net>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Continue converting drivers to the new interface. Introduce
ops->blocked_domain to hold the global static BLOCKED domain and convert
all drivers supporting BLOCKED to use it.

This makes it trivial for dart and iommufd to convert over to
domain_alloc_paging().

There are six drivers remaining:

drivers/iommu/amd/iommu.c:      .domain_alloc = amd_iommu_domain_alloc,
drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:    .domain_alloc           = arm_smmu_domain_alloc,
drivers/iommu/arm/arm-smmu/arm-smmu.c:  .domain_alloc           = arm_smmu_domain_alloc,
drivers/iommu/fsl_pamu_domain.c:        .domain_alloc   = fsl_pamu_domain_alloc,
drivers/iommu/intel/iommu.c:    .domain_alloc           = intel_iommu_domain_alloc,
drivers/iommu/virtio-iommu.c:   .domain_alloc           = viommu_domain_alloc,

v2:
 - Rebase to Joerg's for-next
 - New patch to remove force_bypass, as discussed with Janne
 - Move some hunks between patches to accommodate Robin's change to the
   attach_dev switch
v1: https://lore.kernel.org/r/0-v1-8060f06462cc+c0a39-dart_paging_jgg@nvidia.com

Jason Gunthorpe (9):
  iommu: Move IOMMU_DOMAIN_BLOCKED global statics to ops->blocked_domain
  iommu/vt-d: Update the definition of the blocking domain
  iommu/vt-d: Use ops->blocked_domain
  iommufd: Convert to alloc_domain_paging()
  iommu/dart: Use static global identity domains
  iommu/dart: Move the blocked domain support to a global static
  iommu/dart: Convert to domain_alloc_paging()
  iommu/dart: Call apple_dart_finalize_domain() as part of
    alloc_paging()
  iommu/dart: Remove the force_bypass variable

 arch/powerpc/kernel/iommu.c      |   9 +-
 drivers/iommu/apple-dart.c       | 137 ++++++++++++++++++-------------
 drivers/iommu/intel/iommu.c      |   7 +-
 drivers/iommu/iommu.c            |   2 +
 drivers/iommu/iommufd/selftest.c |  11 +--
 include/linux/iommu.h            |   3 +
 6 files changed, 94 insertions(+), 75 deletions(-)


base-commit: 83653d8508051af13f74905fc3f6c2fa2e59dbee
-- 
2.42.0

