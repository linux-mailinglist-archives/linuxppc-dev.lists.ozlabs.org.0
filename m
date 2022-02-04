Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9774A9BE2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 16:21:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqzl44q4Gz3bbk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Feb 2022 02:21:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WutRBAP9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.243.79;
 helo=nam12-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=WutRBAP9; 
 dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqzkH0WB4z301M
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Feb 2022 02:20:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIQArKcE9K6OOeKec7YaAK3XsHtLJX1KHWMCBZE1I3i89hW+Ox6s2HqXaRIB3Glvjn4qppCafBDquxQVRKAbJWxPyd9dDgHRcAf/Hq7x9s6hpqp8B0869ZWyyFg+qLPcz/SwfWB6aGOBJNqMJJa/AK4H6yw+sF/wUKhVpSz7HWkz+3I40rR2kXjio3b+DwvFSkVDun4eZ3ByPX4HYcXZhc1JOrA9vNRBeWy60G8JXO1HICn9gEAcPo8nf0x1ZiQT2CQAqOxZWmZpCxd7dgSGMWXdtjX3/ON/QioiF7g1VbRHYyj/lLUA5ciLhksloMGkG7gSyhTR+rH3kc8L+lztdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekXNT8lunx+gBOV+4Jki9W2bD0fXZ0Gk8p913AYzjQw=;
 b=mQXbcjgMbcAGiGg1g14rCglIfQy0c17hc0Pxy7RAiHVk3+eB15Kz51nhnmiTMWL/bYhB0JlrgygyDwzL3aTB5SGf0AXCuvhXAuDcJRL6CW9sqtJw2QixzTQ2i54y3pkSkMJUfuFndLsJLOmNGX2B3UNBS9rBWP/UiCVPNZaDBysJugMDtKgMulB3GAv4PDVYxg3DcjDpKfzjtzPc9602p/Vp97JCtLZoEuF3qTIHfq5g6kDZ2bZt06bzzsIB8G96kpMhs26pfISEU8KnwnOW/EFu7d9KXjN1uoemyxv4MGH1HkMnLsg3rzgxX9sBOl5lgwyqKr3KIANjo2qzLoEARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekXNT8lunx+gBOV+4Jki9W2bD0fXZ0Gk8p913AYzjQw=;
 b=WutRBAP9uRzJkKAE5Q2AhFe0qxAzBHtMsjoQ+wObbDipVslOU7gRlLxipX9BKpdBRXQE7NyKBb+7z8DyBCO/mGTUB30YFH2Cku5h5t5h7mMBPr8aODcfwCDJcjXuBim56yN30EZ5M0Bimv3e6YOGAmIOXD48gvM+1Rh5KRN01oZbME0l2aAhooIF0YtxTYJeHzbpphGje+bxJflBrD1fINv6z7SLnjik/5dVN5d5xAorEW0L31C3fjmyj4Nqj48fsjZKci5/DiljRFcVbocNgL0COuA0A1u2+C7LmrtuEcWWWBmEIJkffSxk7GZ3lN0Ou4gB5urwynCEXOag8cQqTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3819.namprd12.prod.outlook.com (2603:10b6:5:1c6::20)
 by DM6PR12MB4371.namprd12.prod.outlook.com (2603:10b6:5:2a3::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 15:19:59 +0000
Received: from DM6PR12MB3819.namprd12.prod.outlook.com
 ([fe80::2c15:bf53:f03b:eb7e]) by DM6PR12MB3819.namprd12.prod.outlook.com
 ([fe80::2c15:bf53:f03b:eb7e%4]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 15:19:59 +0000
From: Zi Yan <ziy@nvidia.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 4/7] mm: make alloc_contig_range work at pageblock
 granularity
Date: Fri, 04 Feb 2022 10:19:55 -0500
X-Mailer: MailMate (1.14r5866)
Message-ID: <E188FF7F-F52E-4DB6-B258-B9CCD7058E56@nvidia.com>
In-Reply-To: <Yf0wpFmtckRRzLFg@localhost.localdomain>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-5-zi.yan@sent.com>
 <Yf0wpFmtckRRzLFg@localhost.localdomain>
Content-Type: multipart/signed;
 boundary="=_MailMate_CF6EF116-A822-4563-B0A1-701D7A4A3D2E_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR11CA0008.namprd11.prod.outlook.com
 (2603:10b6:208:23b::13) To DM6PR12MB3819.namprd12.prod.outlook.com
 (2603:10b6:5:1c6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a956559-b64f-4979-77b1-08d9e7f1ce66
X-MS-TrafficTypeDiagnostic: DM6PR12MB4371:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4371E085091F268911371E12C2299@DM6PR12MB4371.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kvcgHuqwIEgp/xWxCfMTRfPFLd1pp4vYDgbtUECstG4CYKwCTzhclZXthHYlw+FDTxsRKvmp1mYGFgDkTqL1fH0bS8Hy9mD3A36l56wmNYp+GzFVVXnrKblJlfDVmJ2D96OvOFl4omDmoUVD1j/5b2QsQnjkuvJirDo/YconOiZZafY0NcfMBnXHJCS/rSwjFlPTiuVBVBFP02BpGqeE1zBRaipCNil4jBTK10JwM1dL6Lp/0MX8xYK3PNGs1Lc7XKk1WIiknlPI2BxhbUxy7neUt/N2vBuOS+PI1+01u13TIPgiVbOuNbgEmHdRgFFsydcLjAZSsh9ZQ1y/uafAVGShpJls8+g6oztRbbhS527Z1mEMhnuhBLGFWjHR0DbA7l7FMlsL8585x1VFnYv2OoNL1nl9XC08xXmMnp1s6/XT5jyM5X6XoinUD9Axm9x06k+1xrQB2cRf+N2xacZcm1yTy+zNzL/55E+vb1VM1V/It03dAyGpIwDepxbs57TyH+aO3HsG8PfwCwz70Ujy1Yle7OTUpfEmcDQBaD+M1HBHpMXwId03Yy8v5ULC14vo9GZHTNhzdXSdcJ6TODVf8vH5dxBArphPMUCHb/VErI9XHu4NZg+T323VYuHOhx+owFbzwOFpqdS54+wwD3TyCNozUCWZ7g+5YafEiJp0PuBbN4qkKpmVLdnKoI6ynGu6YXWPU0gWwV4Nfo5TulS4q6VRmrGzzvqGCG5Scf7+9F4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3819.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(2616005)(6486002)(33656002)(6512007)(26005)(186003)(54906003)(53546011)(6666004)(6506007)(6916009)(316002)(21480400003)(83380400001)(66476007)(66946007)(66556008)(8936002)(7416002)(2906002)(36756003)(5660300002)(235185007)(86362001)(38100700002)(4326008)(8676002)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MYlY9vtc4LkesFFmrBpKU3ppZcwYFoj0OjO6/a6TQJc/jqg0v6Aihys5YQN2?=
 =?us-ascii?Q?N5EEe5s/RI0bUy/7lFLlchrgw1RWlJaXI+Rm9NpaQJyAtrGo5EbOgA5nzQVC?=
 =?us-ascii?Q?VVWe/ZuOSxT9QZtabXfyQUclHxF1Z0fkripE4r4o0gd5JAsWJwdG2kKmJZSY?=
 =?us-ascii?Q?kTouZHhcQlWP2n60NhGEPY73Qn9d8l6durpCLCmiQx7tnPlH5+6hqh7ogu1H?=
 =?us-ascii?Q?5+HgzcB56lVZTdjbu6XAJJslLvnq2oRN4pjvndPJqar/uxlOPDlTTVU3tipU?=
 =?us-ascii?Q?Y/C1AiFzNlD1DEBB09oIbupZesQJAVeSJeGaXdstnlN7AYVk4wF+w2LtqkE2?=
 =?us-ascii?Q?yNEryFZmVbCnnUMsAGJ3GdqeDvUXXdbgIewapXGC9u9B7sTLbjZGbyNQ+i7j?=
 =?us-ascii?Q?nWiYyKQzzjiljeJLVmhmJeftrlLK8K4VuoeAJ++1WyXbTT8o705cYLeNd3lZ?=
 =?us-ascii?Q?mMC+5HT0M5hNQeOA4mTLi+Dson0zxBXVoYTA+ES9+cptaXM8qP+T54qQ3FIu?=
 =?us-ascii?Q?U+jg4Ja7XQE9DPoNPsoCgBtaFx79fhv/bp+TOXc2b14COF4tZoK5g55evUX7?=
 =?us-ascii?Q?GQXW9/gaxOTxzei1POG+SLzNO8urJ4WTvav91N2edm/plTskHnDP2kK7nFaB?=
 =?us-ascii?Q?AehiqZGJKJ5esbWAguHc8wzFZHWDyMVdnN9iFs3JG7ByULwXVEQFda1d5IKf?=
 =?us-ascii?Q?S8E6c4gkDOtMyg+zac1utySHgjd8KrJEVT0aq1e/w+ck2htO/MCQ7ORCOPfj?=
 =?us-ascii?Q?QgM57BfhPwvp3eTSmpRc3GPnFdWIS/skxcIAsFUnn9kQQ3bPRiexZP4+xx8P?=
 =?us-ascii?Q?VmIlaHUzR1ix0G0TK5ObQrS8LywHwmryLvO0Uai8iK4CgndqzButguYPcfE9?=
 =?us-ascii?Q?NA6KSa/qr/IBbViGBWPZqMkjSlOF1I3R/rTD8a3MpNzuLPqrVJ7uOMQVLdgC?=
 =?us-ascii?Q?/fxxLIaTlbeubAG+/szU126fz7dAmUU+OWvDA258Sawy0bAtqlpi+eXbMPj8?=
 =?us-ascii?Q?pzl7NZ3jXCHrhINDAYnk8VYWfSfCS6LyotKOiR8FMmAgJGzZ6QutNZv5Du9+?=
 =?us-ascii?Q?w0RYQcsDwlea8ZB87snMKqYHD3htn5u3bNbUwab6MSkWhjWraaL7Y/bYR6rs?=
 =?us-ascii?Q?sH8iQzb6mJAPlDBDmB3i6u+6iVwsPlaDzUOFFdc+TUuOx/zYTwqvXqgVksAx?=
 =?us-ascii?Q?EupdCnOlfaPm0SSHFvKkJPLOlxd8fHiT8t0bu0tzD/Nxr73Tf2jEm/4sxqMh?=
 =?us-ascii?Q?5aPu8p2/29C4sG5kCElgX9Ds6rTcsoLR51U9Zcb45ZlyyN3uREOlzVda8BZR?=
 =?us-ascii?Q?4Q7UFdbt0U1lCFmldWkyLaSoBsntT4Be6l1Vz7uQLdNJPCYFE4M1K6LVYxbk?=
 =?us-ascii?Q?UDkAEzlTEPrHk+njqOhiZPWmKGuw9EJvYuuR71jmM+eQ9BTE98Uu+C7/uw8c?=
 =?us-ascii?Q?+nf6Qsauc0FM6cJh5mXawh6Vfk3VdbH5gVeeXYhRYrKk63fgTIpETIegBLn1?=
 =?us-ascii?Q?d4UCwPIx8VZsg824T3rGLqrF5cpkftL3P2GNvhqwwysLUglqttC0l8PRcsK+?=
 =?us-ascii?Q?xOF2RSc/cstIYJAJeRQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a956559-b64f-4979-77b1-08d9e7f1ce66
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3819.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2022 15:19:59.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppPayiSDGijsFFjIbEGTWSVzWfJCsvtDoDoI1Xeid+1AyAHAIEWnH1hIxD3hl+B8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4371
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_CF6EF116-A822-4563-B0A1-701D7A4A3D2E_=
Content-Type: text/plain

On 4 Feb 2022, at 8:56, Oscar Salvador wrote:

> On Wed, Jan 19, 2022 at 02:06:20PM -0500, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> alloc_contig_range() worked at MAX_ORDER-1 granularity to avoid merging
>> pageblocks with different migratetypes. It might unnecessarily convert
>> extra pageblocks at the beginning and at the end of the range. Change
>> alloc_contig_range() to work at pageblock granularity.
>>
>> It is done by restoring pageblock types and split >pageblock_order free
>> pages after isolating at MAX_ORDER-1 granularity and migrating pages
>> away at pageblock granularity. The reason for this process is that
>> during isolation, some pages, either free or in-use, might have >pageblock
>> sizes and isolating part of them can cause free accounting issues.
>> Restoring the migratetypes of the pageblocks not in the interesting
>> range later is much easier.
>
> Hi Zi Yan,
>
> Due to time constraints I only glanced over, so some comments below
> about stuff that caught my eye:

Thanks for looking at the patches!

>
>> +static inline void split_free_page_into_pageblocks(struct page *free_page,
>> +				int order, struct zone *zone)
>> +{
>> +	unsigned long pfn;
>> +
>> +	spin_lock(&zone->lock);
>> +	del_page_from_free_list(free_page, zone, order);
>> +	for (pfn = page_to_pfn(free_page);
>> +	     pfn < page_to_pfn(free_page) + (1UL << order);
>
> It migt make sense to have a end_pfn variable so that does not have to
> be constantly evaluated. Or maybe the compiler is clever enough to only
> evualuate it once.

Sure. Will add end_pfn.

>
>> +	     pfn += pageblock_nr_pages) {
>> +		int mt = get_pfnblock_migratetype(pfn_to_page(pfn), pfn);
>> +
>> +		__free_one_page(pfn_to_page(pfn), pfn, zone, pageblock_order,
>> +				mt, FPI_NONE);
>> +	}
>> +	spin_unlock(&zone->lock);
>
> It is possible that free_page's order is already pageblock_order, so I
> would add a one-liner upfront to catch that case and return, otherwise
> we do the delete_from_freelist-and-free_it_again dance.

Make sense. Will do.

>
>> +	/* Save the migratepages of the pageblocks before start and after end */
>> +	num_pageblock_to_save = (alloc_start - isolate_start) / pageblock_nr_pages
>> +				+ (isolate_end - alloc_end) / pageblock_nr_pages;
>> +	saved_mt =
>> +		kmalloc_array(num_pageblock_to_save,
>> +			      sizeof(unsigned char), GFP_KERNEL);
>> +	if (!saved_mt)
>> +		return -ENOMEM;
>> +
>> +	num = save_migratetypes(saved_mt, isolate_start, alloc_start);
>> +
>> +	num = save_migratetypes(&saved_mt[num], alloc_end, isolate_end);
>
> I really hope we can put all this magic within start_isolate_page_range,
> and the counterparts in undo_isolate_page_range.
>

That is my plan too.

> Also, I kinda dislike the &saved_mt thing. I thought about some other
> approaches but nothing that wasn't too specific for this case, and I
> guess we want that function to be as generic as possible.
>
I do not like it either. This whole save and restore thing should go away
once I make MIGRATE_ISOLATE a standalone bit, so that the original
migrateypes will not be overwritten during isolation. Hopefully, I can
work on it soon to get rid of this hunk completely.

>> +	/*
>> +	 * Split free page spanning [alloc_end, isolate_end) and put the
>> +	 * pageblocks in the right migratetype list
>> +	 */
>> +	for (outer_end = alloc_end; outer_end < isolate_end;) {
>> +		unsigned long begin_pfn = outer_end;
>> +
>> +		order = 0;
>> +		while (!PageBuddy(pfn_to_page(outer_end))) {
>> +			if (++order >= MAX_ORDER) {
>> +				outer_end = begin_pfn;
>> +				break;
>> +			}
>> +			outer_end &= ~0UL << order;
>> +		}
>> +
>> +		if (outer_end != begin_pfn) {
>> +			order = buddy_order(pfn_to_page(outer_end));
>> +
>> +			/*
>> +			 * split the free page has start page and put the pageblocks
>> +			 * in the right migratetype list
>> +			 */
>> +			VM_BUG_ON(outer_end + (1UL << order) <= begin_pfn);
>
> How could this possibily happen?

Right. It is not possible. Will remove it.

>
>> +			{
>> +				struct page *free_page = pfn_to_page(outer_end);
>> +
>> +				split_free_page_into_pageblocks(free_page, order, cc.zone);
>> +			}
>> +			outer_end += 1UL << order;
>> +		} else
>> +			outer_end = begin_pfn + 1;
>>  	}
>
> I think there are cases could optimize for. If the page has already been
> split in pageblock by the outer_start loop, we could skip this outer_end
> logic altogether.
>
> E.g: An order-10 page is split in two pageblocks. There's nothing else
> to be done, right? We could skip this.

Yes. I will think about it more and do some optimization.


--
Best Regards,
Yan, Zi

--=_MailMate_CF6EF116-A822-4563-B0A1-701D7A4A3D2E_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmH9RBwPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKnOsQAIU3r16Lp8RxLENu2TSxCPl2+fMmwEqS20CT
MDPYfQUBORoFxakM+qGSMT/0LRZlTVq7JjTH2DDKdX+bMeRGDYlKZa84Gx5HTNEf
/QUmSywcK/tkrnBG1L+HpG0URjo2P76E7yosayOqqpzekEK+8D8oD22/APg2uLl8
s5jI5IZ0cKHj2HCRwYl17CxkK0SP3WrvG/opxslk4VM0zhM9ROoEA2RmaUCeQops
5VWEY5njlLjvTxRbYfe8LgP59Scr1eqz11DHloUE4WvjJVCkwcJwUaBOrtMPHwIn
0WDK4hpODePaMoDt/RLZDZOu+jj2cTVbmwz0cPvmxN9lClifvgWi0AkzbNuZiExF
WNbArON/QOT2E7DSFIi7rrmikRC1VuVlU+mh6BWel9cnZ4hIuVmNdDZDrzQ7Obn8
FUNYDrsx9moo/hDML0KpBtswUCD65aMEiX/CpNOyihFOE1EY967sl5OXps2QdZHP
s3WDb/vpwupvLqHJ7qi8Pw8PN7T3gQWPX2bBcqMnK/H8LVbqs4K0tkVQBQsZUhgR
n82NTVw5E5gw1wGwLA2YbK6Teq9DKYShU+HZ0tUwUbXSQkRzm/6h5dISWG2FtBfu
O/fUi8vzKe9kNrjzhca/q+L5V4iBDzp9F+4x7KUdwyo8XZ90VM9HngIrHGVhK4Hx
CDifByzk
=9+3R
-----END PGP SIGNATURE-----

--=_MailMate_CF6EF116-A822-4563-B0A1-701D7A4A3D2E_=--
