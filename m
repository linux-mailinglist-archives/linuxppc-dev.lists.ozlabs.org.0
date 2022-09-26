Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AE5EA890
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MblhS44BWz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:37:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SkpdPRNP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.212.49; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=SkpdPRNP;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2049.outbound.protection.outlook.com [40.107.212.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mblgj69C4z2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 00:36:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTeOR7XaHuClWpgW35y78LNOnYC3VOkdlebOo0qAV+uJHk6mBAxWKy+vMY31WAUD/f7ST9+mz2MGTqtrddpQpz/tR8x2YOybaD2C039DpHkor5wtRWvCe7TsKvg1HirTfAfSoI1QvZ9hDLxHLFp6E9t5tmMB7xRkpfCfSD/p0zJcQ3mXtSr0LPcBVaz57Fq27mUb2x4u8FcuV2MZqv5hXUmXO9nt64skEwXIc1D4+YfZxLdbpq+ynmfiCjKMj5jzxk55rK0zRq9wYblg7FmKWT9HFKe0BqevKJs7mo1XJQxc4RDYYnG1HFaW/VOH4I1KbFlzwovFYALYW7w3wrbBWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMmBKbfeNs1hw9UZQVm/pUxCUYFzVOLZ4v7rOEjbTbA=;
 b=Irbu91I+PJn13l5552pOlSIq53VnyvVnmdbPo1Yin6+SCMX+ZWQV+6nnDYr84ndNnZ840owyJ0Db7mYFEjoPqTgShculJmprPNH2+310lyxozdpgO2azpZT4fZra5SYxntRdFv2jD40Hz4qilK4re3HokwGF/k6adKijBggWIeDuxRTlm1uWulU+9wgvPwRVB+kK7EsNpio+IaZG+InEUozCNZmlxrJNxGSBzIo2JnBgmXRjrd08+DEklHJjyzBNWwMxjcCGbH0aZCgLkEHhUsEvGJfmyVJ+TTByeSGQXYT85ab9pZTnKIBpPPJ5KTQDOu8gdtJhtOCs3JHMdWq5uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMmBKbfeNs1hw9UZQVm/pUxCUYFzVOLZ4v7rOEjbTbA=;
 b=SkpdPRNPl1tE+kFJsFGZUE62vfXCdpfIiEVK2Qsp1MHsCw+ch3y/M7k1MvIxUIS1hG/aVHcd3E8cr8qeqlEzfvVZEvmA5pUii8x4hYublFui3yUFtCmQpzfVNdeTlsCw+BLPF3rHKlmn4LoRoiOCBOlAGGdW+hT8LHG5URIZajuX4lbdO6rx3PkAd/enbJaODPraiYC+y/wZfXE4d12StF9jrEfZfGXXTx+rz+jlexsLtCRZXh7kbLcA6zyZhA6oFvudkcdsS36uaH1uFtDqncSdgU2CiCX4iQLIVNjDRyuaXIMU6rq2RXYp/HkgGkom6/ptdQ8IxcJNXe9+4jjwvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by SJ0PR12MB6735.namprd12.prod.outlook.com (2603:10b6:a03:479::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19; Mon, 26 Sep
 2022 14:36:12 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%8]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 14:36:12 +0000
Date: Mon, 26 Sep 2022 11:36:11 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 2/7] mm: Free device private pages have zero refcount
Message-ID: <YzG42766BJSxro0R@nvidia.com>
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
X-ClientProxiedBy: MN2PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:208:fc::24) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4192:EE_|SJ0PR12MB6735:EE_
X-MS-Office365-Filtering-Correlation-Id: 43ed8a99-ce9b-4a18-8b18-08da9fcc758f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+4aaWTLp/K4X8/bI5mRxDcgM05Ut3ixbT8NtsngRDPL0x31c4JnWqcrHY1xm3PFKC3syAVeJzd+hEOOjubjKe+Sf3FO1AAJqUkxqzchPng7fWgzyZsyPg6iqJFvkFXjGTfFBvHuMOuY+nKUZshuw+iQgkByK1SQ3oifLZZJVvn8Q+Og+9EO96lSuXINOvB2xJEO1yy09jLu4NuCURPtN5vnKgIEV4iryJfXKEHZ8jcSMhVRALmjT8r8LEwVUNQ93weYN19NapEfuw0Rn2p/TFQ5bC69pbdhAeGp3IkK9DJp45oueU2t39mtiRgPFkiMDCV+3wg00CJSeFEvoP+zs3I+Zx+MDRzXDtkGr7M/fEQOtwzSUIjvNhyDD6OusFrInScL4T7hdVSODWofne5RztJBdX9JGvPRQV/amxiaPlkK9OCg54kROgX/lSl/iv4BP0IMv8z9myi7cXBEm1iDcuXJgyndosuzGDW1Mvx66HdAiZASLuJiGH9/z8PInO07zQ9/SQMWo6tM/X1V//gEzAlrEBY3rOWCyzyT9GeF00Q9Bfybww+Av3eYbwKukqh9S3Pizti0nkn0nUaH1Bg23UWnkiJCVFj9EeX23JF9LP913dsWLGiMdTWn/7VSsBuPI8iBAIgQaUxK/ISdoXw+ZOSBbWeSBgZp+Ojs9eNissJKANcFTi4YOQY1/3MH7U2eFXeIbDSqLOb2BFprDQ8+nVA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB4192.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(451199015)(41300700001)(6862004)(478600001)(6486002)(8676002)(26005)(66556008)(66476007)(6506007)(4326008)(6512007)(66946007)(2616005)(36756003)(7416002)(37006003)(5660300002)(8936002)(186003)(2906002)(6636002)(54906003)(86362001)(38100700002)(316002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?IAJYxzUDh7DbemX32432fEqn4dU79g2DXhTItTTZTv7dAbzsOFPP90H2ul7R?=
 =?us-ascii?Q?bMj0AluIoeasduIl48eCwPqgp6JIZlNhL06lfWaoRVJi1OIB6sM9NeF5REbD?=
 =?us-ascii?Q?SXiSyVQS9iVuzPoCTo3AXQVdqO1NkU5XLQiNItbh0AE4sQzVAH2JfMGjqt11?=
 =?us-ascii?Q?lrWy0tukTfGF3BFCLEf4kRSpX9MZfeLhP/CFUdYG4/IK//dn4kA2JJCVkyoP?=
 =?us-ascii?Q?p6JPuRsNBvOvKNCoJq9iIvMlsowwj0pXYQ80lMnctFmATp0nolaG49rDkcit?=
 =?us-ascii?Q?o38U0VRjxHHwWupooVf3XlXy8zj12mutn7DHkJr3KrgarzxS0iT2C137LyKt?=
 =?us-ascii?Q?wwi2tjERg9OYDkiiWA91E4ug9Ppq8iZsv9fIHsM48v25Q+AhhJprQY5VvF03?=
 =?us-ascii?Q?LCG93QGDCm/AI/+RxDe7thUbjCHzQJN48OxJ1MH+OD8KqmJpInsMs52q0ztE?=
 =?us-ascii?Q?J3PxHti42ZihVwzBl2tJ7P4x9aA4IbQq9i+S4tsLQB7n2OqOzwxwJ34/zoqc?=
 =?us-ascii?Q?GLpTLlR3ZnWF3obrGRbB2jWbrmn4DS3bR7NeTR6cOzxKxgDMzvIlq3GhR7mW?=
 =?us-ascii?Q?uaTCFJcQ5USBOFuQ3om1ohM23YE50ICRJHGm4FjOxVJUR/Ncq+PZAKIKQbq5?=
 =?us-ascii?Q?UmRizvXTRTkvSYQAokwymIAHcd8ufpUVI7S2X4u/Yqe011MfaooagG5Imgiz?=
 =?us-ascii?Q?ULe0pvYuMFquv2I2Q+dQcCrlK/eOCvw176w60FsEuVNuXRJL/q6tO48/9bMa?=
 =?us-ascii?Q?tjqs+CdZNVLNIkuyDIpFlstBasFS5Zn8S0q3LuziFJbsswDrN3nniZLJAJqz?=
 =?us-ascii?Q?/IALsswOej/ShcrlOJGdWjln5euUS9tZG+Hukj9WutPl7WsCaLIfOQj6gdVo?=
 =?us-ascii?Q?FOcxFBJyN92ac0pTuZjBm0YnyyVIPV//1CpR4+T7AtJuW5o05Lnep5Ogfgq5?=
 =?us-ascii?Q?UkiOhwpFrzoLS8SjDGsCb9iEj5f6p1aWenLIqW4kQ+/joy8+lZRtpASuFIO2?=
 =?us-ascii?Q?g6WPIyNc1YZflFhkmj7talbrH/ZZ2yOG9KE/NBhh/z9QqaUaSn1zIaXJoDQu?=
 =?us-ascii?Q?EbJasYXcJQ5hk5XGq/dodGFwIiF0xFNx7KyHNmU00NDCJxPhzJmP18AOqGF4?=
 =?us-ascii?Q?vAGAd6b0hvJRsNCCz4E/GGq6bJX9wr+mrPocJ5T6yr2598Z3JVncOq2R+4W9?=
 =?us-ascii?Q?aehRe1GmAo0yPz+wWiOTHsLKX1XcWrSehZuS0/kQWCdisM4cKZ+K3c/u9UYz?=
 =?us-ascii?Q?gVC0SLInVfuNtlpS/FXSkW1UWgOKsVp2IX1D3Wymw9JHmZvyQRHad0KzvTTH?=
 =?us-ascii?Q?Nde+IoBaQE+oij/7ZMDRdbVFxI8+xNemL3eL1bosyUIRBlBcBpciQCE4V6TO?=
 =?us-ascii?Q?egAheHkUkeywZduPKr9JBz7fa1tMcnpcO5/2HBs1a85c+WZkRTJDW7sYHGtk?=
 =?us-ascii?Q?7uYJIgNcUnhLl3i2ZDb18ExmLstqcIDaA0y2EvW4X/N5Z2D71D/r+zuLQAwo?=
 =?us-ascii?Q?qTncLVM/B1jy5JaiSoIb5cDztEMNkY/KoO7n6UAHrmr0mFdAXCgZFAeCjlKu?=
 =?us-ascii?Q?aFbDvxSpbHN/Up7Cn6Q=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43ed8a99-ce9b-4a18-8b18-08da9fcc758f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:36:12.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cCC/PDeNxAXtrHoF+y1GcJJpfmsjfQz8q1qAz8WsBg74f9SPoCYsuerBN10Vmvj2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6735
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 04:03:06PM +1000, Alistair Popple wrote:
> Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
> refcount") device private pages have no longer had an extra reference
> count when the page is in use. However before handing them back to the
> owning device driver we add an extra reference count such that free
> pages have a reference count of one.
> 
> This makes it difficult to tell if a page is free or not because both
> free and in use pages will have a non-zero refcount. Instead we should
> return pages to the drivers page allocator with a zero reference count.
> Kernel code can then safely use kernel functions such as
> get_page_unless_zero().
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
>  lib/test_hmm.c                           | 1 +
>  mm/memremap.c                            | 5 -----
>  mm/page_alloc.c                          | 6 ++++++
>  6 files changed, 10 insertions(+), 5 deletions(-)

I think this is a great idea, but I'm surprised no dax stuff is
touched here?

Jason
