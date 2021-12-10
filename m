Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 027664704EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 16:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9b1y6DLGz3cN2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 02:49:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ldHTNeWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::60a;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ldHTNeWK; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060a.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::60a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9b1B5zNBz2xv5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 02:48:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hf/Y6W+eLe/KfhlEKIazHRFCJ8V8/UBihZOZNjXNETfULOlevroSSFLP/7LMlcgwQfnkE6LXSdaM10P6V295G8IUCgeXjVPvbcK6yiuhttHDKo0DiDoC+PmmjUWqAvaEqwf4VEVCvxqe71Ze5OpDaUF667wNnnVhmKdSB0W3Zhy2ZyVoMyyqPux3llRw8xnH2iYcEkG41lzTEqan4/eHqWRobUOJjc99XoRwvr/ZkFSjIqC9zur5sxB52n7lpEZ/bql1wlqNJUPIBMP7MLzhF2+DhcLoTlZF8QGu/MUbCTtniG6QMHPj0wqLe+dunQdNCJL9CkL0x1CAVu38XuFjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98oitruaBplIIVyYIjlSgufwgNMByXS6Xqu/76OfvTA=;
 b=Zx8MkXpyUEWD6QZ4ghHnq65IS6u+S5OG/SX6VwGEJ4W6DaAjV1q3oMboIIylDPcfpvlee+GQU62C31Wn982BrvZdcMUwxIXU0W2bLSH+mMn0a/ErxnkuLRL7Dkn4kX/HEKkYHJugpkbdYVz4TvGLJvXeqJDtWTYFyVtovQi2Tkc1UYjwbhZ0uLu3clLpeqrWGToQN6OBtfkW7XvugvAQbMnxE6RpgaDm0uICrai9dR8eHUmeAUnBfaR4wPNJvahXnGHEoT/BUfW0MCETzvfECG49hrWoelpIqvGL4WRyAXNSWMPaGBweJ3NIR8j1cQYYR22nGghd+4y0EXgPJH2FIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98oitruaBplIIVyYIjlSgufwgNMByXS6Xqu/76OfvTA=;
 b=ldHTNeWK5avieqAy5ISEJZBnJWTcqUdStoxkwrGLmE3DkohaqPbwEHZ90QS4/IIO4qa3Hm9qi+UjQHmuYmeBVC+GsxzzbarMX80IXdOl3hBHm7/f0QntonZqDBwPAyPGxXnkA6Wvm5Rxo2J2W6QLmlwOG1csIuLLTNxm8+NMeUhvB5DIrPX+0dVpx5I4dyXsBMrcJWhjKqAhyTWLj4vNUY7QJulrrTaNpE303Un/Cu02snLXLZBFRrX/7QIFiHjFUH3AWIfoicdf00I6YMurxNEYD8J4E+5BngUA/gcTtcM+CA2rpWQskeEyImqZkfRLkpqk8LoCT26TnT4gx9ez0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Fri, 10 Dec
 2021 15:48:37 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 15:48:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: Eric Ren <renzhengeek@gmail.com>
Subject: Re: [RFC PATCH v2 3/7] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
Date: Fri, 10 Dec 2021 10:48:36 -0500
X-Mailer: MailMate (1.14r5852)
Message-ID: <971750C3-DAEC-4EE8-B838-2DD3CBC29781@nvidia.com>
In-Reply-To: <84807a03-f7d1-83cb-16df-bacc58de4529@gmail.com>
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <20211209230414.2766515-4-zi.yan@sent.com>
 <84807a03-f7d1-83cb-16df-bacc58de4529@gmail.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_BA365FBB-6E3D-4C74-AD07-06D52C16CD4C_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:208:fc::22) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.53.3] (130.44.175.231) by
 MN2PR02CA0009.namprd02.prod.outlook.com (2603:10b6:208:fc::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 15:48:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34be2c4d-9bbd-4806-f254-08d9bbf487e5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4272:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB427285BA9C2E536B5A77CB17C2719@MN2PR12MB4272.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Aq61mUsVCJkw5IJBZUoPh4FWXMVC3kQUv1GLfZOZ+fh342MOOmTeSxnMVVLSaoVJmMB3m3tomyvw2PZ7Esf0wphybWfR0Y9tV+gnJM843/piND1v8ArjWudpqE2sgD0A8lEjwaOexm9SoL4jsaaC5mQtlZeO6PWxwbgc0OlC0RfkgRSItEAh/D5tG25LBprMYip9nzp0S/5LXZULKxvZzpVQvKZH85wUFoe/MQiFQUA3uRdO3fkUSMd3wuSm/f5YnFt2hgPW2g0g2YaEM50xHZin9/rLVB0Eew0r5ScVB3w1vKaZJlCPnuPU0M/fLEPpbQgleVAaEe7mzw6XIPyBIu5OMsGMz6DIfkOo6aRHkXEwg9hOKCogCjW3NnxBQeBgo/Nm4Zfw/VZn8auDefhsOI5Rk5GE1T+ZxXKjGxs7Vh8O3ax0GEnMJqwWsMD+JB/G0kyhB1RJWmuXYaND1GY/jhXSaKMD3lTlC9rIqve8uPbFeJH0+8gfb1be2DDFMGTQc3nslNaYqb343euF+14iGhWZd8LNbj26s6hVJZQB9CLg8zFmihliKAJjDpvxLUQT2FuQQsPw5/VMxo24NTAKQrXGQ1AyBx/RbtzP11+tr0I9GdIFRPNjapLcPZtGgb7sZtQbV7HNDFKsPzFWto2S97AYIRFHnirGW1mdrovdgyz1x6JTOzAqGfeJCiTPqF0fMov4KvuoAtKJVoASPt8PbA9Ya56uT8rynv6cnTzLSq8I8pw3TZEgquQTmD90ebRk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(8676002)(54906003)(235185007)(6486002)(38100700002)(316002)(16576012)(7416002)(83380400001)(5660300002)(66556008)(66476007)(66946007)(86362001)(6916009)(53546011)(2906002)(33656002)(956004)(21480400003)(2616005)(4326008)(186003)(508600001)(33964004)(36756003)(26005)(185883001)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWJnRjU2alRvTFhZb1ZUOFVqaDFRdVE3dFRRTm1FQTE3bm00Yy9nd3NQbktY?=
 =?utf-8?B?bGptMGRlUDBFQ3NLVWluZDdkWVdRVkhoK0NpL3MzbG1ySzIvY1JCbjlBQXph?=
 =?utf-8?B?VEU0UEpLRVlyRmkyc21TZEJxZ0crRnNSckpsUjI3bXN5ZTZrdFVESm5CaHU4?=
 =?utf-8?B?L3kzMTdmaStmVGc0Z1V0RGtGY3krUkVWT29yZTdtTTB0MTRMem1BdC9xK3VG?=
 =?utf-8?B?Q1JXaC9WSndGdkdmWVZCdDF3NktubjRtaEwrOFQ3aVo1R0hNYXdVbm9aU2E5?=
 =?utf-8?B?T1NZSHp4c3Y0WWVOaitvZGRnMjZhKzU1eU1hdy96NVNhemhXOXd6OE9vSi8y?=
 =?utf-8?B?ckk1TjFLbFRkVm5TbkdKcHhQajFmaVJ5U0hBTzZaMFY3NnZWcmdKVnhmdEFB?=
 =?utf-8?B?bG5USS8xMWUvbkVJSFNHeDJhVllLck5haC8wSndWZE1nMkpQQ2pIOHprSm8y?=
 =?utf-8?B?K1lOZmczNm9HOTlLd0JmMENmRGpWYjRIaXdVeGlRSXVKMlNmRFhJc3Izb0k2?=
 =?utf-8?B?Zm00dm1XTHNNZmlhRkxTSWRhMjJUdEZNN1c3aTBYRjNuQy9qYmpiZWcxdDdG?=
 =?utf-8?B?eGs3OWpSMWpwRW1iRHBic2dPL3FDUk85Rjl5S0R6andGVlhRaU4ySHlvODFO?=
 =?utf-8?B?d0oxVVMzK2o1eS9TaFpPNjlKYXVBVWJ0OU16Slh1cCtWcnprVHRpUEFGa3hM?=
 =?utf-8?B?U3FYc0oxUFNYVGZramVFSXc2ZDN5UHZMbGN0aTNNczhzZ0wrMEgwamNCV2Qy?=
 =?utf-8?B?V2M0ZFI4bHBvVlRybkxVb1ZlTitrM3QyQTIzR0hzdFRDR0xabDB0OGRhdlRF?=
 =?utf-8?B?MVoxOTdJZnJzR0V3eDVVMy9XWWRseFlOQWVTakxyUXR5bXFvVWlwREplcysx?=
 =?utf-8?B?aGI3NFhnNk56T1NCSFJWcmdCblJDY0FMVWcxWVZPd1dlbXVDdWFKWUh5c2lK?=
 =?utf-8?B?QVQ0MWlrVDhSZHJzalpBWjB4eHN3UGFJOHdSYWlhU1RFM1FSbUcwR0hVdHJP?=
 =?utf-8?B?ZWZZOWJxaUVRMEdTd2V0RjZFd1FMaDYrSU5mRmhyZmgzaUpIYlNiOWZzRkVu?=
 =?utf-8?B?ZDd1QThlZkEyYTZpZ25hbk5SMFJXTkFXdkljNzFWVm9JVGk5WEwzTmtyRUN1?=
 =?utf-8?B?bTI5ZEd3Nnp1RHRmVmpLNk5VYytSSGNLSDBpcjJaY05pZnFGK2tvMThrT000?=
 =?utf-8?B?czJYSDk4QjZZY0dNTWtKSk4wbjk4a1FlRXlJa1FyY3Z3YjhORG9HdUpIYU9F?=
 =?utf-8?B?U2VaSXBvWXZhT1ZxMmJ5aVFvKzRQNVdsckg4M21VdDU3NnRiQmhCK2EwM0th?=
 =?utf-8?B?WTNFSCtBcEhGWTV5TFZ0T0kvVU5RbVgySGh1RTFKU0hNMG5EVyt2SWJLYzBT?=
 =?utf-8?B?QUV5OFMyU0hsOC9DWXZXbTA3cWV1OUdsblgvRG5JREtyM3VycDBkdnkzMVZF?=
 =?utf-8?B?S0tlSkJyR3UyWmhvaVg3Z0tCb1AzNEhyd2p6NGtwMDdpb1l6WlFHL21VQWgz?=
 =?utf-8?B?VHZrSzlEQnBseFA5azVka2Q2RmdxU2hMdDF6NnpiN01TU1hLQ0VLbWZMNTFV?=
 =?utf-8?B?Wmg2Z3BmRGNIYjZFc2VxUGhtM2VHNFE4UmFzR3NSaFVoakFRUTFSRUlDNE9l?=
 =?utf-8?B?WGlqK1c4aER5Q1NFdU1UbXdEWGFQUFF6LzZJem5BSDVBZGo4Slk4ODNtTGdU?=
 =?utf-8?B?dSt1MzVWRmxqQWlJN1kwQVFLdENaaUpCV2NEWFR2WHF4TUgyZmN4NFpnNlBh?=
 =?utf-8?B?REpzdGxOdjN5Y3ZwcWFRbG5LUk01dlVUL2lOTXRFOUd4UmFySHU1d0hvOGpZ?=
 =?utf-8?B?ZW1Sa3lBTU1QV1E5VnNxTGdVUHJ3cTRJbTNVZ0RDbHFUYnFBZVlpQW4wQ1Ns?=
 =?utf-8?B?NUNzMVpIQmd5YittL0dJcTZzUlZ2TmxiRTBYSkNDMW80UWVNN2wyMTNQNUJQ?=
 =?utf-8?B?dm55VHZPRUxsV3FVZStTb2xhd0xvTXJnS0RWNCtobUYrRkJLUUxCS21uUy91?=
 =?utf-8?B?b2V4ZTdWUHl6c0FKWGMvNUp0dEpyb0MyZnFGMnFGU0Q3djNJNlBHbWVhU0hh?=
 =?utf-8?B?YTNCaGFkaG90WkJjZ3lJRjVrTzl1a3RtbVExb3E5ZUUreTVMK3RHa2NrV3Bj?=
 =?utf-8?Q?zUUw=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34be2c4d-9bbd-4806-f254-08d9bbf487e5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 15:48:37.7762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AWMkjnyq1BG5WEPhoUnhP7fimMQY31VWwIzqVeX1v7K4xrMbWFixGc+TBR8UrAlV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272
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
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_BA365FBB-6E3D-4C74-AD07-06D52C16CD4C_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 Dec 2021, at 2:53, Eric Ren wrote:

> Hi,
>
> On 2021/12/10 07:04, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> alloc_migration_target() is used by alloc_contig_range() and non-LRU
>> movable compound pages can be migrated. Current code does not allocate=
 the
>> right page size for such pages. Check THP precisely using
>> is_transparent_huge() and add allocation support for non-LRU compound
>> pages.
> Could you elaborate on why the current code doesn't get the right size?=
=C2=A0 how this patch fixes it.

The current code only check PageHuge() and PageTransHuge(). Non-LRU compo=
und
pages will be regarded as PageTransHuge() and an order-9 page is always a=
llocated
regardless of the actual page order. This patch makes the exact check for=

THPs using is_transparent_huge() instead of PageTransHuge() and checks Pa=
geCompound()
after PageHuge() and is_transparent_huge() for non-LRU compound pages.

>
> The description sounds like it's an existing bug, if so, the patch subj=
ect should be changed to
> "Fixes ..."?

I have not seen any related bug report.

>
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>   mm/migrate.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index d487a399253b..2ce3c771b1de 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -1563,7 +1563,7 @@ struct page *alloc_migration_target(struct page =
*page, unsigned long private)
>>   		return alloc_huge_page_nodemask(h, nid, mtc->nmask, gfp_mask);
>>   	}
>>  -	if (PageTransHuge(page)) {
>> +	if (is_transparent_hugepage(page)) {
>>   		/*
>>   		 * clear __GFP_RECLAIM to make the migration callback
>>   		 * consistent with regular THP allocations.
>> @@ -1572,13 +1572,17 @@ struct page *alloc_migration_target(struct pag=
e *page, unsigned long private)
> if (PageTransHuge(page)) {=C2=A0 // just give more code context
> ...
>>   		gfp_mask |=3D GFP_TRANSHUGE;
>>   		order =3D HPAGE_PMD_ORDER;
> order assigned here
>>   	}
>> +	if (PageCompound(page)) {
>> +		gfp_mask |=3D __GFP_COMP;
>> +		order =3D compound_order(page);
> re-assinged again as THP is a compound page?

Ah, you are right. Will use else if instead. Thanks.

> Thanks,
> Eric
>> +	}
>>   	zidx =3D zone_idx(page_zone(page));
>>   	if (is_highmem_idx(zidx) || zidx =3D=3D ZONE_MOVABLE)
>>   		gfp_mask |=3D __GFP_HIGHMEM;
>>    	new_page =3D __alloc_pages(gfp_mask, order, nid, mtc->nmask);
>>  -	if (new_page && PageTransHuge(new_page))
>> +	if (new_page && is_transparent_hugepage(page))
>>   		prep_transhuge_page(new_page);
>>    	return new_page;


--
Best Regards,
Yan, Zi

--=_MailMate_BA365FBB-6E3D-4C74-AD07-06D52C16CD4C_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGzdtQPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK0G8QAI7CY6NLXAee8CtKYL7dPjE77HLRaD9uQJL+
4dgP4xOrredgYJixZOKx7XzZTHMoonzVTFF7px+w8zRClPASuOg5GGSVzuZ9M3ns
MLfyqjF4TCpJO/P2L28raGfxzsBcfnMEbEA54G7i6Axysjhy8UU6SLEipPGRc4xz
jG8P+YM6ZS9guoz6vwLsT3jxZ7JKb0D1B7uWP+PSfR06wMrb8/xXGlhkazCqohLy
/whb2RAxh8wLnX1Ks4iidKrrSerxBgXvna/MjicD96TV56x5UlwQwTCWfqFzqiXx
Ynz3l2iM4ogwdC6uGyqhNSEk0PEo371F6ZZi02xg6gRFkpJvFeY6n+/K/1hAv6ch
DF/E3kbl59akOUd4O4wdJVp6NWfSa19nTKnvMSqtkQiscf+ehdMMD4tn0EeTHPK9
YJijB4HVMSJdh7KWNwKNvFxORIMLl72IyJ473fHlWl0ibBtfimi4O3dHYmNrgc5Y
pscA4twxZ/FeIJPQlMfrEGC3hCfDxwYNqSKoI3L1+CZRF390uiK06lZG23gVAKtm
hf2oX8Wf/j4IbXtZC4J4hnY2y76QLG5dbhUsFM8XsQaKOcuq1UGcfoYXfPZ8AYvP
eQHluN+7TIsNDRAihyzwiiMtZiaB7s6t+QTh8olEm5ussvAxDiMSun598Po23Ub4
gHCyxr/d
=S+9o
-----END PGP SIGNATURE-----

--=_MailMate_BA365FBB-6E3D-4C74-AD07-06D52C16CD4C_=--
