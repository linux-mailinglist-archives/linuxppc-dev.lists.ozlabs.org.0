Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 645A656B8FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 13:56:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LfWvs23Gmz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 21:56:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pm0Qh+ha;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.94.63; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Pm0Qh+ha;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LfWv65PVfz3c1Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 21:55:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VX3SS6J5gKjbz9VAdaciYe3AsJ+BSPcpcZagJFMfytDT7L2FDHRjQ1YidcKxwNJc+Wipay4ORkiCm3pjSb8Z3T22n53ZMpPeynvVYXjlTfDosuWqYj2MHTX/LPWdqkS2RSDbyA9P806I7TRkBZ4YiUt8CWVoV2FGaa9cIviKn12LuB0rkSJ/7AwO/miIrDTBndXbTi2Mdh/LbP9fJ1vdUTjBdNhEhlpbbnbUz5Epd3UNxb1DWYVlqQbT0WMb30jz9EBq7/WnKUiuPFSvrd3BSFAyxMQeuTMNjQSOqhlfDrnTWrre8/bowNyCRzN2ompxTPqrV6vLSQWcC1SXzB6WeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aJ8Di6UMyvfYpnUrsVhYP2vKWk2Hgnr868Q/MV6x/Nc=;
 b=Sh2lADQniEN28UB6hs7RchGxLY1p7CFNON8NUhTdI+TWQq34OdbwYPa7yPQPlhKZY4yU7LkezyJ993q8OA2ZFD++ySkUpHKYSl8gusPCIsuK8RR8axZ2+C2oowLq0rzwZG57T2R2XRaoou0psmcM9jOLcDR3J0UFOvirtc/gwRT4bACtXF72Ass8Vl8Rav6itQbcQSzv6K51/f3qqkdA4cqhotQCSeSvj2SAeD8VZBwzGMp0pbHTrmvpYt3sKvtlB7NpQnI0UpbbdCeWI8zpXpG0ed0RiCR/VC/pXwmHjlYhsFSA10MBK3mHBNqhP/Zlnnry6HKjEh4P2ivvErusGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aJ8Di6UMyvfYpnUrsVhYP2vKWk2Hgnr868Q/MV6x/Nc=;
 b=Pm0Qh+halAPnn1c/w9JIVxCOpSIGqt1mLcsStGUG8QE/8qeQhTIZRCAr8VqgIJTyr1zYrgtiYW5WJoWtBTcyDVHxrTOwKg9R+ZrVgyD0uacw9OrdzAs5jSBnvTeXWolzdHjQX+K1NFqRaOZdWSz/tWJMoP8r9kwSUZ99mPvRYL/h1U2oQK2BpDbuSUyTsEWsieqQ16r+t2krYfEbYUoZJ5yUL/2BUYbfwhL1KAbMPRiOH0QRS1/d0YQp6bIe1tPqJVOuNRIXGvMe8eNhpKxGHntLrkXpTVQj17Q5Ay2QewCnRQ3QbjuTb0wC4B4w/QFHACWJVy7Ff+ie5HX3S4JCHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR1201MB0166.namprd12.prod.outlook.com (2603:10b6:910:24::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.19; Fri, 8 Jul
 2022 11:55:23 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::ac35:7c4b:3282:abfb%3]) with mapi id 15.20.5417.016; Fri, 8 Jul 2022
 11:55:23 +0000
Date: Fri, 8 Jul 2022 08:55:22 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <20220708115522.GD1705032@nvidia.com>
References: <20220707135552.3688927-1-aik@ozlabs.ru>
 <20220707151002.GB1705032@nvidia.com>
 <bb8f4c93-6cbc-0106-d4c1-1f3c0751fbba@ozlabs.ru>
 <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbe29694-66a3-275b-5a79-71237ad7388f@ozlabs.ru>
X-ClientProxiedBy: MN2PR08CA0026.namprd08.prod.outlook.com
 (2603:10b6:208:239::31) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff740019-9b06-4cf4-02f0-08da60d8bd63
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0166:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	LeORyceJoBo6WzvmQ1kKzCixHlIHH7PGuoiOBUj+3wZ1R1Gk4NT4du7B2m0PbzKIvlMhhyJVj2QW1QUKXGEuVGz4PLFTydxVZTIA8wXOcjFsXew9sf0rIAfYWWvyFu5lHTYsDVuErwSWT/K+eAZiEUsf8Uf4jm50IuEZuL0e/+tDR5YTDXFgFDheucvWPSa8h9m4ZyH5Qo2og/u00/BmZWdOprcfrzrniyQoDKLrHlPIahZZCi5TsLVi6jE1A3w64FlnLwS4oLPUjSKnzZCnR8+dMO/fdAb5Y7Ph7UU5+x3TF6fbB4lAaETIZws2T7We/qYvbAYDQY+AiuQ8xnXYacBIkA4eNrmvQfwW/7F1ozstbUfNnvNduukbxeyzperEUNcua39ah2Y+iZkicaYnlo7AmEbFgBSBTzMS6mHJ7xBJkxf+iiEWyleeT1gSTngAgA6rh9DCW31GFhTlfv36wNHdyiq0y7jhYB6IrQ1TWrxGp5t5/tyuGcPYz8ur0wZhAkWs6ZZemSBYNsYIg+fD4UqROOTS7PuGM9eMuIv159FOwTaCF+AyXAizBn69CmKpZu2o2ablplZNzulie0ptEoGF2b0p4jKXcVw61Vf+KgGUPXVSrYtACrf26k1nmcbyHq2FtyqwZrrWHVVsMDPt4xxa+VT5+yeVK0loe2x/jvxhorpA8eeQSvijx/wFGUfAArrxuXxEuePBg+VkkiznAanxjME+zmxENLPTb1okQjiLI+rxNDz21BtaCRgrL2TX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(4326008)(66556008)(186003)(66476007)(66946007)(54906003)(8676002)(2906002)(6916009)(26005)(36756003)(6512007)(1076003)(83380400001)(2616005)(6506007)(41300700001)(33656002)(86362001)(5660300002)(6486002)(316002)(4744005)(8936002)(38100700002)(478600001)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?WvYFbIEKxMDnbHEJLvbhPPKiWasniebTwWH7ZLo6U8XjFFu1Taye7SQ879R6?=
 =?us-ascii?Q?vZjxI9WlFvSzFPY0O8qd+ku9r8aYeQbokr9v8Hc7AHf9v83A203TaLfFva3e?=
 =?us-ascii?Q?+B6SL+g9tcCeG8XOqH6ta1PhTxCptrTjEWe+dlMuzBbyF1IWr79fTfYFwTwW?=
 =?us-ascii?Q?2eUTTkoqstT+IKy8i4Jc3S5m5xxp7q8ezSS5eztDuhK+L4Y3yaJLQlvQotvn?=
 =?us-ascii?Q?nCEAjZfKUoMLdADNTc950l+hFc/XpsRUigalWex6R1WYEw/zpSkZxgJ8LyM4?=
 =?us-ascii?Q?u5HyEtEJXbpSGD/GKc4gqnrqsoHFd2mWk/BKq6xAyz9Mq0Qu+GREhEp2oknk?=
 =?us-ascii?Q?7yXY+0/qYsmGkSJLiBWn1sivMtxIIk48b0+RSdhDpac+f2zA9DMKZsnOU1Gu?=
 =?us-ascii?Q?ye7q61451UD1Xu0LFHyf0qroZAC+z1AYQ++xh3tFw6Y1TFOm9lbv23TAfe1q?=
 =?us-ascii?Q?SrJv+Dkuuoiz/Car51iXIyCI90gYFNuoB2rTd3OmBu4T2Kp8lcTYFUCo3/1O?=
 =?us-ascii?Q?b8Fw6ohREmMjoQa6rraD/1AuM7z5NRi5Yj5p1DKf2oakFxmwU5/YWmdp0+NB?=
 =?us-ascii?Q?aM0yA4J93XA4uYAMq99HBjhY5bVvS7KpMXs02fMgd2j/6Q2VwCuQfDW8FANA?=
 =?us-ascii?Q?1NmKhSurkBrre/GrRefCHH2sZ+G9sEyQsU2VhHtfNetVdMURCeEovaznpZyS?=
 =?us-ascii?Q?OmN/40iVumY0bfrHWi9zEerefOefASQFdl119AW1OYUNeHu2bqMysGD1n5CA?=
 =?us-ascii?Q?DyINnunPf+wSnrcaSeNFl5KJXt60pxXOQDtPaIkRNouWxTMWNoydp4zafHCf?=
 =?us-ascii?Q?aapiAtimSE0NFSXZtVuZBBU+02aILShTqWq6eJUiphwRpBjPvHa12DPTAYVW?=
 =?us-ascii?Q?IdJ92LYOClPz3eKPeEyKRP9dNkeISnllXkWK0dttIs2+AnvNoS8zpDDni+Yw?=
 =?us-ascii?Q?Ohv2l9XNtb41Dm3hjLLK1GMpfJeX4xrQZS0JE4U3lw6OI0StmZCte5sjRNSj?=
 =?us-ascii?Q?7PZLiH4dy4GP7XiluSK7Wu0vGPg1T8+OhXvJxqFi6fnewdy0tv/hUP50Db3Z?=
 =?us-ascii?Q?hEdS0TbHrlKnJ5TTWpfUh1KeCvotczWWfzq5njmwQgDQRjWo7r6/iSy9BC5G?=
 =?us-ascii?Q?z6QEgZxnnlmrorAEwWq6pv7cL6yWwDTPggACj9jjFWVfrYRkiqB29lUfp5N1?=
 =?us-ascii?Q?ehHcZDvhbahUZpP9v2J1lU5t+oGkzv81yMr/F7wCqMfT5l+OXcYgiOCms+oo?=
 =?us-ascii?Q?sov3e8M9QfHH+oZvHhLVUGvz9Ws799HjvMoBP+VVodMQmiD8jyWE84qBwQ6+?=
 =?us-ascii?Q?wa7WMVzJvSE9LmOXswmb1SQT6UIb4Fl4nAA/COmFAu45Kjh2Bks4RyBWghp+?=
 =?us-ascii?Q?s08GdIhePQPPOSVNr++Wr0QV6P47KPZrQ9DmXpm9r8yI9/EB4OMzD6tSk9Yh?=
 =?us-ascii?Q?cban07Ck7Xq6U4+UAhF+4lOC1zHXZdkhn+ERpd245yG04qkqLHoTRmjJ2vCB?=
 =?us-ascii?Q?SSmi02Snvh9tH4Xaj7E0LARnZWdC3nvlty9qE3vzYiULLu6fR5myHFSfLhMh?=
 =?us-ascii?Q?CGQ8CpZNCiuMSlVM0jwt/r5tT+VGujNPkDBhNuAq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff740019-9b06-4cf4-02f0-08da60d8bd63
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 11:55:23.4337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1azNz0eqGsLapxi5RoFN+O8xllo/5E27e9wAg6cELlNTqcc9WfHCuSZqlxwRG/mV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0166
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
Cc: Joerg Roedel <jroedel@suse.de>, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Daniel Henrique Barboza <danielhb413@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Oliver O'Halloran <oohall@gmail.com>, Joel Stanley <joel@jms.id.au>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 08, 2022 at 04:34:55PM +1000, Alexey Kardashevskiy wrote:

> For now I'll add a comment in spapr_tce_iommu_attach_dev() that it is fine
> to do nothing as tce_iommu_take_ownership() and
> tce_iommu_take_ownership_ddw() take care of not having active DMA mappings.

That will still cause a security problem because
tce_iommu_take_ownership()/etc are called too late. This is the moment
in the flow when the ownershift must change away from the DMA API that
power implements and to VFIO, not later.

Jason
