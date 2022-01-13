Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1364648DA21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 15:51:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZS6l6TFtz3cGq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 01:51:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=WWkWp5f5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.223.62;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=WWkWp5f5; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062.outbound.protection.outlook.com [40.107.223.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZS603fkMz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 01:50:30 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMtLaLYKDQJxHl9l3xuuDFibXnHkPrisnoAlNbK20OGx4tTmaSMZJymGshZ00tBVAokQr5qLGRu5BCd3pf+XrWiCH8w4prvQQku1r6P6CMhSe0Fod6zEfSLniyk/p+tuNpAL+xWpxsjGEXFFzaK2KLvH5b2vQ7MAfUhlGQHR2H9NGfrmWB6PC8KTFlpAKfxUpxC2KXo7W375xG+lry8PNmG8CK4M4r9IVIRDbCKAf0Fm5WHmig69vjsh9I52KkPILHPUS/Po2bImLcBJTvmU9tcjIVlWs5WfW1XowNqjXYlZmwndOCKsd8ql8WXxsZR/gwuEDKK0VZSjpRgedLktdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq5tkmJ85F23VIwsd8w9/VT76D8l76SpY2mbLan1qc0=;
 b=Jirx5aE83H5j9P1GBsRKFLmQcFR0H6yLL5fZ2CFXEFbtgc0RHokrRYpDC+3JbxGlmH4f3Pp+9aA5ChID29mrHxy3kxBPfLBGc2WX5YvTKmFAEruBPGHyb/9KiZH5G9Yy23L4b8+1xGIAX1SkCAce66kwY4M4MvtcLFRJjVMvIXbcEuu2JeRhF6VeBAa0M7ByUTVH+qdUIidjrDX0O3GJzRtSE2ZCOPigeJlnpsEuleH4hZ6/vb6FRxsWu+qe8L07tl61cbNDOJxOoHlI1DS8Qpz6jDTQxII+2AvdIL+sJszP89f7Bviews79d76YzXbmySmi9loglTwDweDgie7cDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq5tkmJ85F23VIwsd8w9/VT76D8l76SpY2mbLan1qc0=;
 b=WWkWp5f5ukgDAzoWpETrQj90THnEm5Gu0KfUfGEPU/si/SB2Nok1yHh0EXcOkcrslph4C/Rx1jK0TVYnKpdT3yV39psJiPEwPm8TcrOht5RXbYMGu4uKUTGhcMlEy+2SGi4jK8AOTHdDF/vKz72/1JHBifHdb4fR35YBsVTYSjbbQh0eD6J61TPRpnk5qZeQWlhxIpaakR6a8LDirgvmtqi9EN28mTBi4ylfosCjIAmZ4VteNpCPNMNyrGCJEB/nDCqeGXkioNn90LYm/C5o6uFDvWQcmRDNkn70/fMwI+biymx7Qqz40X2JZ7EY6hkGGbb0L1CRtm13GfoE/0errQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by DM6PR12MB4577.namprd12.prod.outlook.com (2603:10b6:5:2aa::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 13 Jan
 2022 14:50:12 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 14:50:12 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 1/8] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
Date: Thu, 13 Jan 2022 09:50:10 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <AF721DC0-B618-4ECC-8752-87D413E203A7@nvidia.com>
In-Reply-To: <ae2862a0-c39c-ed2f-23fe-510c6c2fad5c@redhat.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-2-zi.yan@sent.com>
 <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
 <YeAO0vtyjWWMRliF@kernel.org>
 <ae2862a0-c39c-ed2f-23fe-510c6c2fad5c@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_B6476F45-E5BF-42AC-977B-6865155E7EC6_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:208:120::43) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a35e1061-e192-48e8-075d-08d9d6a4006f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4577:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4577BB429C87E397D35DAF0CC2539@DM6PR12MB4577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5ZhOJmx3dSoSv9LPUo5jjLItY+uNK+uu1QXp/KI0oUSqXGY9CIACJcnWSvupIFQvmP7bkEFxcGC3a2ecXhFVJW94tFYk9LqGCsPBpnWs2W2A21zme1AupETpli68/P65E8jbfOC+EZRPoiqKiokzBKqe5O5dUJMQvBTHv1wwrxfujO/IbWfl0j2Iv/k9/Nzdx6SwabLAy8fQrJ54F34EGJXAcBORu/B/Q5L5EC/XgeXoCE4LX065WF62dRwHarvvK91jh0UZdp/eMxgPCmdItXIR28HZPZC9j6UlfYHvS5y9HlXuAze6M5LXOXZ2AwTUsAb/yRr3GxcxBOorU0kZtDU1wfeC+vIVTUNNyOZFUXqYmaPg0K8ip0bHmxIaDv14cBEXE44DIRYU/y4eL/tTJQRP0gzTICprbM/wv1U9JFQ6x5lguHWrHtyH3gWEZa8xuZPFp0Vmu+dnvqPbC9LNOGpS5TfND/Xb2QmStf+e592dZFIT1TRsWEAK+TWrHPVpihEdAT+4DTTWIV25OlNTlwQobySuCETZDzGvEJy7dzpS9JrzXIy7w8rcQvyUG6lSdhBy1PE3XHesy9Le6I8ZEQLG1yTPun5DF/pJqFPhag9tbk8YIpuJI+tREDjxV/DxbcvxQET8ggEQRQcUsSkqJgj3YkRZjKAUMz6nk5BjYcKXy5UCOO1yFgo9EOV8eFkw1vB70G4VXLXcUq2cT8B3YGOD82K/P0n6Vzb50b8PUtBYBmUpErP3J/glbfz5R1Bv3bsOY/7OSW7JwQ1PDNBWJMg8zUEYt8aLX34mh67XvmmP70goa8KYyZPlvYonYUYY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(316002)(66476007)(66946007)(86362001)(66556008)(966005)(7416002)(6506007)(26005)(186003)(36756003)(6916009)(2906002)(6512007)(4326008)(33656002)(6486002)(8676002)(8936002)(38100700002)(83380400001)(508600001)(2616005)(21480400003)(54906003)(235185007)(5660300002)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bRc2NSXTAINEwQVXKNEtmSpPqIVpVBzhuMR+/A26tXFQJ33ub6dhW6yjd4Dq?=
 =?us-ascii?Q?yzaEyD1oaR4s4IUmzIBffjuXtQsoJmcu65QM/gwLhOltNYWRhuxeR2TmcE/9?=
 =?us-ascii?Q?syc2IQq7+kq07INF+gKmQcE95wO1n6dTyZTvn1OoopwSsZZbw1mGW+BSKk3N?=
 =?us-ascii?Q?q1K/BdnqxTlg1t8fA41eqvgM1dX9iOu6SAPHIHaxgMUPiYwavuDV0R8o1sLQ?=
 =?us-ascii?Q?rEz6tUWB6+dv6XatwwdGfN4RrvR6zuucoRXxiG1ENWc13Uv3r/k8Kk+wnYIw?=
 =?us-ascii?Q?ygNloQ+k9px5IyJqQh1hZ8xs4zNoV15NT/mKeaVLA5SCpv9qY/17df+BM5RE?=
 =?us-ascii?Q?tnG8iUhmy411xokiqx/iZKwKxUET3O2pDhZPbO3UbOhQco9uUXuLt9vk/rgV?=
 =?us-ascii?Q?zJLhZ1fquQ3WnR+4e3sgEAfnHQtf7olz5/FdNbEl4GQY9ObC9EpviavNDBCD?=
 =?us-ascii?Q?+cLl7VurAUratsR7xXxOuGZH3f+uM5nQGDWSdewlzJwBt1pNybdIIFXeNN8S?=
 =?us-ascii?Q?cb3f1d4HwEOYQnanVU8XMo7YKMKtEUreKsHoD36Gtw2LTQCQp+cKzn4ipcFW?=
 =?us-ascii?Q?UDHxSs6gX8i1/nUEFaeusfowlEaYd5hJMwoPr6Nz2OSycQPHmHmtnX+dPLjG?=
 =?us-ascii?Q?35vjyTvE9FsTr2DvUAnGHg4RsynGy2dAscubYUuCw//hXBeqRKpMiP7EsRia?=
 =?us-ascii?Q?Mbd0G1kZsygTTQvaGB0R9I2WLQNRf2WSyDUKxz5jMmUCuXUpAq57qKzU3QpD?=
 =?us-ascii?Q?90V5DXAMf5PB2vVV2rnLrw3EdCycc4g63JZvVsydqYuMNjXGaivYPDObOyxu?=
 =?us-ascii?Q?WdEKduZQly1z+aaWMqoDgA/wH/OEM9nofYB4HivXtxYvRnWTq4lUYeO89fNx?=
 =?us-ascii?Q?ec3zsYm9cV3jYO/AZIhfpqL5PJfs1GpAOH1LA3EEWNGISriIIEsX64ZD8M4f?=
 =?us-ascii?Q?qYWRUT6VnhMdrghkmq77CjaWgO0Tz02Yx8HQc3ARZz6OhUgN1NgT4/nMZnT1?=
 =?us-ascii?Q?Hs43pd+AIzBUFSMeOAxAFfLreXd95T+pO8h22vmPe6ppfqjRUPY8ObBRq2Rz?=
 =?us-ascii?Q?NU2WxXyR8MAw7Yh4w1qbCrN3CeqgraKFiiFjEY5z9t36APSvfHT42Fl3Xlfp?=
 =?us-ascii?Q?D2tGJPwsoIqf42shirprxRjYhKT43s0V3SAppN3ORyI5CfEeHgK2YasKb04A?=
 =?us-ascii?Q?qk7h2OSNZxcgm6hm8HdZRvUWD3tI5k8O/D78v7KB4S8uQkdbccom1+4z824M?=
 =?us-ascii?Q?Bsqo+zQ9vqRy5CZoLm58TsrA2jDScJOcKF+NzSMDkx1yoNO38uYLvAoWmvlI?=
 =?us-ascii?Q?SldNc3orPHSpy8phbUWc8efa2CkibfmyD7FIlAsYhNXPbhaD7PmjLDQkIuRX?=
 =?us-ascii?Q?EN/IQ982yt+6LxmWrhQ+hu3oNsFHlQfNg/JvYnrOkr7rbtFaNYumQu2tHP1w?=
 =?us-ascii?Q?t14TTooNTTAE3cgO3jNbxR8hNsCAO39+U+48ZeAaUVOS8kx5e/nipMbVCvhc?=
 =?us-ascii?Q?baEfLqfIISTQKuPFST1CpJH7nt4lI+576Zx+Dj+OjkvUiIhv5LkAW7v3EZsX?=
 =?us-ascii?Q?68B0tqlYDlLS+y/Q2S4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a35e1061-e192-48e8-075d-08d9d6a4006f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 14:50:12.1767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YHE84NbNIDWAJbSqFBmatziF2ajGKFThUN7rvNnVVtJBbjMMvKmV9szuWXVTSM8o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4577
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
Cc: Mel Gorman <mgorman@techsingularity.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Vlastimil Babka <vbabka@suse.cz>, Eric Ren <renzhengeek@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Rapoport <rppt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_B6476F45-E5BF-42AC-977B-6865155E7EC6_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 13 Jan 2022, at 7:28, David Hildenbrand wrote:

> On 13.01.22 12:36, Mike Rapoport wrote:
>> On Wed, Jan 12, 2022 at 11:54:49AM +0100, David Hildenbrand wrote:
>>> On 05.01.22 22:47, Zi Yan wrote:
>>>> From: Zi Yan <ziy@nvidia.com>
>>>>
>>>> This is done in addition to MIGRATE_ISOLATE pageblock merge avoidanc=
e.
>>>> It prepares for the upcoming removal of the MAX_ORDER-1 alignment
>>>> requirement for CMA and alloc_contig_range().
>>>>
>>>> MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
>>>> MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that to=
o.
>>>> Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.
>>>>
>>>> [1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingu=
larity.net/
>>>>
>>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>>> ---
>>>>  include/linux/mmzone.h |  6 ++++++
>>>>  mm/page_alloc.c        | 28 ++++++++++++++++++----------
>>>>  2 files changed, 24 insertions(+), 10 deletions(-)
>>>>
>>
>> ...
>>
>>>> @@ -3545,8 +3553,8 @@ int __isolate_free_page(struct page *page, uns=
igned int order)
>>>>  		struct page *endpage =3D page + (1 << order) - 1;
>>>>  		for (; page < endpage; page +=3D pageblock_nr_pages) {
>>>>  			int mt =3D get_pageblock_migratetype(page);
>>>> -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
>>>> -			    && !is_migrate_highatomic(mt))
>>>> +			/* Only change normal pageblock */
>>>> +			if (migratetype_has_fallback(mt))
>>>>  				set_pageblock_migratetype(page,
>>>>  							  MIGRATE_MOVABLE);
>>>>  		}
>>>
>>> That part is a nice cleanup IMHO. Although the "has fallback" part is=
 a
>>> bit imprecise. "migratetype_is_mergable()" might be a bit clearer.
>>> ideally "migratetype_is_mergable_with_other_types()". Can we come up
>>> with a nice name for that?
>>
>> migratetype_is_mergable() kinda implies "_with_other_types", no?
>>
>> I like migratetype_is_mergable() more than _has_fallback().
>>
>> My $0.02 to bikeshedding :)
>
> :)
>
> Yeah, for me migratetype_is_mergable() would also be good enough. I
> think I was at first thinking one could mistake it with a dedicated
> migratetype. But such functions are historically called
>
> is_migrate_cma/is_migrate_cma/....
>
> -- =

> Thanks,
>
> David / dhildenb

OK. Will use migratetype_is_mergable() instead.


--
Best Regards,
Yan, Zi

--=_MailMate_B6476F45-E5BF-42AC-977B-6865155E7EC6_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHgPCIPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKNzwQAKcwq2cFFnNvugkk7N/YRv61E1LZSEnqVGH3
UoAT/0Yq/+870HXu5JP7joE9O2tdxNXpMUKxbD/FbTuyMl0iaOB9GDtt1cf0l7z2
quluao4+fbtsaLuOjN12Rkzyb6AjZsCcgLvUy1uJzTA0SmagzJNEaKT/Z3FjQKXi
94nvQkJ3QuQTVR2KxnPbBDBE7edKZ5s7MnlTeiv9jU6J0TJElR/pZHlzwBvYVY9t
9yhUGsKeDGerXLoRFpVN2Yr7VH9t3VaA4KNADv9Ns7bZSWJBtoJlBmzXq0Qq5Sys
/w1wbE4z8BP2/RhZtDvfuWm/ObujjoBT3cv7D2QnXmX3jOgwzLItIGiGmhAyAEPq
2DJWTLDFMQzrDqLvMyR4hNUO+5o5bYYvfIPTc5ajg4aKimfZYxWI+PiOzy9d9Xrf
YIs5vDiBZFtO6LUaUsv30UUqR7j2j1go8uAemO3nFl2VdwrfU9ccWsNFNhNQTZKg
LvIFB+xi75r6GFy1qXQe+ou6aNAVBoBkxO5YQa3kHibz/fu0cHM2poMkalnKqUUU
ndnHeKFuICA9e36dVehbqLyVo4qiF76djhkk41hktMJKzkk6pUdz1+J09ISq60iL
SozH2PeXJtD9bIThPzD0zFaJeVrLjj1F9xKdg64g5ez8bZGm6Dd+ByRl1wYqyWSc
vouSamwp
=KkJj
-----END PGP SIGNATURE-----

--=_MailMate_B6476F45-E5BF-42AC-977B-6865155E7EC6_=--
