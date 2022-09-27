Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B2ED05EB78B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 04:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc3KH44nfz3bvs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 12:21:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KgODYrgc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=40.107.243.40; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=apopple@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KgODYrgc;
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc3JV4S6nz30MT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 12:20:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAy0loKVbnta/nmEIJHJ3r0a7+V8AGvCaTi3BS0wf9tH8oh6AEq+da/mDjdeH1IrWNEIS8A2/S0IUfgnDQVynfu809SQFzzUJkyVrrkmRWk3tvIpabDzAHItuA69m7cVJL4/32AMVE/C+A2rlB45fqRT6TyfT2fdVCc0MNB0JiPTHSrWjrx0K1xHGhy2tmmlF1IZsJHmGLuDRlGRPeFKJCndoVRa8muSmVG6D5fWSJuK824J+O3XiYz/Qfzgyci1lDwBR586dkghsfUte0efWITUWPwIhjr6NZA1vgJIh9BIg5OHpiaeGhySUAekeRX4s2dw9ci1x9iQNfWiicjXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0fNFP1t6ElIZwUU3+jJl9kcQFnQvMD2kRwfBjGRoTQ=;
 b=imSdVc57U0HKg8hFOc3M7sSyfdwqOZdDky5UiaxAIxGBmJsPV4yUXG2HX3Qkb7EcE/bbnXvC6c6FMBRVngOvObsNe4JV5vrciGmgWXfnnUfJcbSFy8SlllSu0+/piFsJ7AbBaIktQPtnn1N34zgdJLXf7YhW5ljtYpUAnC+y4rHl3TeDks9cYDKD2iLhYyVB7PtcHRGz08Noz/C5C06sdNhE98pgZbJm5/DFa6jDM0RoK58bvQEAFhlDh048GX/cxpQMtFzPXOpwzrkEB2KUOFPPdyUXddDtx9MFVVeIUrlfPdczNXw010Vyl9XFIFFs7SPPhgb8AtevVVdLZbAYsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0fNFP1t6ElIZwUU3+jJl9kcQFnQvMD2kRwfBjGRoTQ=;
 b=KgODYrgcPLCPHRc4HfIuzi/HWoEkGsX0Fd/VqPGxaiGPf+01qyzQDZaWXdBG0Zr93CIEYD7MLCmE48hRKlUjTTdeyw11KCy8A/jkxZmPNOX+qilCO71/HVSRdAA3ansOSnaVRIxbpJzT9fjOkl2KU1+qGXdJuJ4+CEcnBoTTBLJQKzSujRYnj9d6H5miUrx3raVc0w2XErofU7Kin3K4/XsoADp/F1PIr7kvk2TZrrUwiloxorZzoymU+XLkWs5rdoapGuS8wP8GVK4u6gLT58VlnqslhRuSo1QrYDMNzjIEzj2gS8q+WmveFdn8nSiok9iRRQ4hbQpPPjLkSYpgTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Tue, 27 Sep
 2022 02:20:35 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::4064:6c13:72e5:a936%5]) with mapi id 15.20.5654.026; Tue, 27 Sep 2022
 02:20:35 +0000
References: <cover.f15b25597fc3afd45b144df863eeca3b2c13f9f4.1664171943.git-series.apopple@nvidia.com>
 <3d74bb439723c7e46cbe47d1711795308aee4ae3.1664171943.git-series.apopple@nvidia.com>
 <YzG42766BJSxro0R@nvidia.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 2/7] mm: Free device private pages have zero refcount
Date: Tue, 27 Sep 2022 12:06:24 +1000
In-reply-to: <YzG42766BJSxro0R@nvidia.com>
Message-ID: <877d1plfrm.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SYXPR01CA0124.ausprd01.prod.outlook.com
 (2603:10c6:0:2d::33) To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3176:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: a38e010b-54fa-419f-962e-08daa02edc3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	FuZxz3pjuBqeq09mPlJcg3ApcX7R+crmtv9/yFmOIAq5cDifyAaE8Pb3pEONMo8wxzw9Fk1ytNr0Q3gkHkEPb2W/hmWaOmwjn/4tK8oYt0v2io9xYcN3XHdQ2q2bjoFLbjH4Lz7uZN0GgUyVq65Q0vpNuLbB0JNfNUtlM3CRVTURYLea+KSIl/TSeHK7noqIv8TJ2KyiVICMY3qR6qS5nF/YBddk4t+9kuxeLEatcO5fk9huG0asttelUmwZ9L5ukj+EydUPO/VmKJGdqmmtWRoDjuvo8HAXMeQytwX8Hk3aY/ts25jIbJz+QWWBzNLdkjRNJa1DbGOAukhvP2BaGyEfdjwh3UlDZZunqpWAFsAfSYUQ5Dir2EXZ4zL13Dvo6In/a73jYzEtNQ/ywjm9j9jM9fepWRxcz1F3wi+7e+P2uZZPyOF5N/q9uLCjrCH/offlIRXOyfxm4fHEP4sbFvW/bxrNKzqz+HmJOpaQK3sIdntccc+k/rB/ndnbsPgS3UwqUdogrk9/vrljqUqlUSKfp8oVEygoq1gwmkvdT3Qpq5LVWsIPmsFinklzEKxtoF/HyOmPXISm5qe1zsaGqJg9iyjTv50/29cZx4M1+Fmr+6VqJEvL4uFPmTjxKQmF4iTjaHHkzSn1O+zhpbVyi5syBKTko2PhBOiY3wd1CeNjbmZ132N8r14GY8u1PSznqh+vSsvj35URULfRKkLhTQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB3176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199015)(86362001)(38100700002)(2906002)(7416002)(186003)(6666004)(9686003)(5660300002)(6486002)(41300700001)(6506007)(26005)(83380400001)(478600001)(6512007)(316002)(6636002)(54906003)(66556008)(8676002)(6862004)(4326008)(8936002)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?nvLEt30MP1i0pkcCWXovXrYkCFXY+DWN1bNo+BNGrjO/AeVGADHaYoRcBHFg?=
 =?us-ascii?Q?pljoy5XPHPwYP8lE9Mh2LJgso5ZTKT/Nblo5UpvGzVej2IkWE89WAhdSE7UG?=
 =?us-ascii?Q?LXkT+zvucjNivw8JGKx80j/EKsQ1yXp0o1mGMNsRZOx+oYytRYk54YabO8Nk?=
 =?us-ascii?Q?9gaspqHtQkBfz2Ob6+Iq9yz8ifpwpUcqaumBztUQ1CUtXc2jZ/YwK3Qwao7A?=
 =?us-ascii?Q?J7TeDvjGT52RZmjmXwabxUaHu8+/qmDCwhBG3GNVl3cgAUvJF2Nv4cmrBK88?=
 =?us-ascii?Q?285Ji5lIPJ52JircKGW1gd7McT8KaBsA4OSNxISPQJBgJz2uJW/txcRJDrSX?=
 =?us-ascii?Q?lnzcAZcodQ2zyP5Kiy+ucyPMDBeSkMXvqZEh+d0hKnojax3YBvcik4VlIxml?=
 =?us-ascii?Q?iO3hieOI+Yg9ZbZNkLfQVVUAvndXgUFCPw87xl2JvgNIG2Aeewe6lRy6RmYl?=
 =?us-ascii?Q?PQ72BWtdSJm5kUkQ208+2EgW3WjYUogFU+tYtJfqX9azJmnBkaI4a2K9wXjG?=
 =?us-ascii?Q?DipMl2D3AsnLm7xtjZiqM5kUvp8/aAkn83U9E63HXv9aDuIQzCm9KME9ptnk?=
 =?us-ascii?Q?2jYmACPqkrtsq18NM8a+kNrySvISr41NxxMmF/Q4SSZRgtn9dVloDeODk8LT?=
 =?us-ascii?Q?LHKeptRHmz/sr5RQ5JWZUng8u90Tk75LLSt+1iUekiYmSaF4XJSlut3AnWpF?=
 =?us-ascii?Q?rygrBo5SiAA5/0uGlorqvwFVbKM/dstTqvfJtaBYp30/K8odVz9cwSxTDtLk?=
 =?us-ascii?Q?gCs8NYnq5xGnotFLj/udkUCd06SCehMg7eg64r8Cbo6Tr/4xikKGtv2PXl7O?=
 =?us-ascii?Q?rfQiYtJblUwHfl1wakhmxwlG/Crpqjfp0sk54XshOZPTC+Zic703bchiT8rf?=
 =?us-ascii?Q?PsmwKuC/LVaFqoy67snaKYpcMbEtj+9qQDtX5vT3p2by1TSvKFO3JSp+EyeC?=
 =?us-ascii?Q?b/+adB/sTxsJfOtZi8NBjgVm0ev3dNN82UNkEC9/IE0+sBEF1xr8493vN3CW?=
 =?us-ascii?Q?+sibQEaOOlEXFgEMOhS1VSbaA2UlzwvWY331RiNhLajH0E5JV+pFextvYt5N?=
 =?us-ascii?Q?Lyo+fzmp/jF0iM8aHkjMSEe2VwuCzLjy4ek/u0epZxL1g/SPrcTj1Sz3ctNP?=
 =?us-ascii?Q?b8AFBhBrzNBuk3G+ianVwT8WzjGm5fuqUlwsPeDhhX8AE7sKPQAvEnt4NKfj?=
 =?us-ascii?Q?+u/Zrg7gQn59481EMJfEG34nB5i1Lwa6F4KVRqSLGqBbgi4EicrH20o3lMW2?=
 =?us-ascii?Q?21pN3HpGEwauckU7xYOZBdukA+GsQYdcVtg14IKrua0i0L/rVXB6vnyUYPOP?=
 =?us-ascii?Q?139LAqXxnG53F6W/oBBWotZy7w3Ye2XPICcwmB0F7zzw/ujLOnlf0+R2iSRu?=
 =?us-ascii?Q?jqquEd9MSi60kcYjvKUATk28F26LVhmGHfukB+FR72+hvzLLCf7lMeTqaU2h?=
 =?us-ascii?Q?Xd0AC/my2h06BHpRk8W35XzZFMwUIN8wpvk3mmE7O8fdZz9v9fddqHsfry9m?=
 =?us-ascii?Q?vtnO+al574qSUhmsdkqMh2fQhs3HCMWbHgGu+CtqK4ugiPb3NvVoVHUyKm3J?=
 =?us-ascii?Q?ZGCs9Pm+hFTXsNWUm6U8LhSIrlitbSx9FMngkRcg?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38e010b-54fa-419f-962e-08daa02edc3e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 02:20:35.1625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9HgsWVPSBNfUn4iByaqyzDIT/EN0tRXfmKhDQlIc36I2iwjG4sCVHHzAmJzsR0GHWsbdNeZiX8CD94p4CGZgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994
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
Cc: Alex Sierra <alex.sierra@amd.com>, Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org, amd-gfx@lists.freedesktop.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Dan Williams <dan.j.williams@intel.com>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Jason Gunthorpe <jgg@nvidia.com> writes:

> On Mon, Sep 26, 2022 at 04:03:06PM +1000, Alistair Popple wrote:
>> Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
>> refcount") device private pages have no longer had an extra reference
>> count when the page is in use. However before handing them back to the
>> owning device driver we add an extra reference count such that free
>> pages have a reference count of one.
>>
>> This makes it difficult to tell if a page is free or not because both
>> free and in use pages will have a non-zero refcount. Instead we should
>> return pages to the drivers page allocator with a zero reference count.
>> Kernel code can then safely use kernel functions such as
>> get_page_unless_zero().
>>
>> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_uvmem.c       | 1 +
>>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 1 +
>>  drivers/gpu/drm/nouveau/nouveau_dmem.c   | 1 +
>>  lib/test_hmm.c                           | 1 +
>>  mm/memremap.c                            | 5 -----
>>  mm/page_alloc.c                          | 6 ++++++
>>  6 files changed, 10 insertions(+), 5 deletions(-)
>
> I think this is a great idea, but I'm surprised no dax stuff is
> touched here?

free_zone_device_page() shouldn't be called for pgmap->type ==
MEMORY_DEVICE_FS_DAX so I don't think we should have to worry about DAX
there. Except that the folio code looks like it might have introduced a
bug. AFAICT put_page() always calls
put_devmap_managed_page(&folio->page) but folio_put() does not (although
folios_put() does!). So it seems folio_put() won't end up calling
__put_devmap_managed_page_refs() as I think it should.

I think you're right about the change to __init_zone_device_page() - I
should limit it to DEVICE_PRIVATE/COHERENT pages only. But I need to
look at Dan's patch series more closely as I suspect it might be better
to rebase this patch on top of that.

> Jason
