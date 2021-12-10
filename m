Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 808A1470BBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 21:18:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9j0d17PYz3cQZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 07:18:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=h1L6yf7o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.101.70;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=h1L6yf7o; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2070.outbound.protection.outlook.com [40.107.101.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9hzp6Mvyz2xrl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 07:18:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CbYvYc7iTIjsobCpx2S0FgMX38tKyHRVORpEktGjE5np9IZzPSUgm8rU1XHCmGs2Ok+YNfVqu4R5Vwn9dbBL3joVWS+58rwKTyk0KM3+5954pDDftcC1W1B9ondYrctXnx+cRV/A+lQ4FBA9E3VgpqSdqnp6n6la5p5B57UZzHHxsmCJFvXWEVKmfA9oTyH228cOs8TtI0Wgopnvt+4tEpJVVCLlVgNtNpmJxeQV0HSwDQIN16sWlhfsWdUZLIELbzVoDOJ6NkNtSfAv5SKCzVFiArm5Lvd1SREI8FziE1jLsu2oCwcajten7ibAqaycNjSs4aEAsY/4+TdBejXt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SokwhU4d7BpKF4vHwXs0YVFnysXC8lVmxK2OwOxIdQ=;
 b=h4KwYbjU/u2uFhJLpP5a144ya60RqUv7wrhKFmm6rrcF6yVUHL0yRby+PJB72lHLBaHNynnrvsT1PZKB0I9fwF7CdSDNWqXQoO6JT/4JT6cwdXdRMEZ3jUgtYCTzFDS8tjTHrEc/xfeMttOevL7vCSrP1J7HWllmoUp6t7uaTxuVCO+UzNl4NAzDQvzil/QoJv4RnLxyqkEWVdTMf0H6EDMi2jqTWdF9PjvU+Qy/iRRzlW5281y1sOdwBO0LHtXbGpFvA8GwkV2Gnwk7RJy8ZaGfL1kuCHlhmKsJTGBXGRinE4udee3lZeT9lZLy+wt3+7voisHFY8zpyu3DikxshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1SokwhU4d7BpKF4vHwXs0YVFnysXC8lVmxK2OwOxIdQ=;
 b=h1L6yf7okLNBulvXiJW78v0VOL0mwvFJxygSmn9HEHZh2IFasD0WS5a5ZvUvQuTncOGIKSj3MEjjAD5L/bNKYlv1/TnqYSt4dyF8ambpqdF7BNiRoCeNz9c3D9MLkmfpcGlrrQ9NO0oQsZBnwXSv+nu8kqZEmD6ziZOoskF4A7c/BKkhSC2BG0pjotYX2Nlp8SLct4/WURBihWzvLHiEqBA2p3jkDA6Rfr1SYvZIGKdzplba3n0vjX9bAwaGbyJ8+kafipz3TAtOfoKrVIK1hjMNuOWogV+SQ/AJgSHyQZ7ApBB0ofbq6lgC8twdFNeaMGxTX2MrNdZ5o7zdh+Hqjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Fri, 10 Dec
 2021 20:17:53 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 20:17:53 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v2 0/7] Use pageblock_order for cma and
 alloc_contig_range alignment.
Date: Fri, 10 Dec 2021 15:17:51 -0500
X-Mailer: MailMate (1.14r5852)
Message-ID: <535079B9-D284-4A6F-9ABE-A85287697921@nvidia.com>
In-Reply-To: <19404189-3bee-c02a-a596-2e5564e0f8f5@redhat.com>
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <19404189-3bee-c02a-a596-2e5564e0f8f5@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_7DBDBA8D-1217-4A06-8FC2-209CFAFFFA5D_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0171.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::26) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.54.79] (130.44.175.231) by
 BL1PR13CA0171.namprd13.prod.outlook.com (2603:10b6:208:2bd::26) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 20:17:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9cb3a282-c459-43b1-9d91-08d9bc1a251e
X-MS-TrafficTypeDiagnostic: MN2PR12MB4256:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB42567758C6EAC135E2ABD332C2719@MN2PR12MB4256.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9e4aijV1JgJLLjMpc7BgldE1hMKUw2okKqgXni9ulUzWa5TTLz6uAyLX9zuOa+yb9ypDVKTOcXTq7XvQiyGUYtw2ZhU2r+Ql4bUajUBSqFjrdVtUCVsQEvss9wVGgYkkxRU/myFmaQfHoT5M+NgAUaa/n2VO5GCSeayZz2wvnlOa9GYFhDgfBVwDpLG1q0p8EZAiTivXsCvYjN/HEX1pOiWGPV21exZ4a8Cb0z6910X8WNwGGJZ9tZqG+52Mz2GacMFvmXewBLZA+dwWC/Ie2RFBeazXH9hj5sJJSdD3d0XUGFT9TX+/ALUpbMvJteHjjtwG96iOzZAo+Y7+1N/9SYg4bopE/XaACLGbOiICRMlsn/dzn+GAXecj9WhP+n9JTexaMqaW0BzDNj5cN4+BM924XscVQQB7iy82EP6NRmjJW3YkR2tfiMOAUP3pDL9BPUZBEFCG40rnlGWgja6EOVpUS2OskMZ0qn04xk44Gaa9C167hAeGigFcIbNQUX/lfXCbmuzpHUBdpRffEgck5VhWOKtvGZzcUBIanX4yjYywy7A9b8R8hf04fus9SfshOnrgSEvmES8bCTVvgnyx3ePF2zngpCGmIvB90SnYr8lbAMEjNFHvQ7h7oefNIupcljNcyftwzpYqQqo4HivZWx9kbTxNrfOGWN2dcbwJm22C5Z1LbKrS82+C93YyjABc6QEksS2x+oHkI9SQu7jgEwnr+0Rnho7VgaqLEJz2ytU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(2906002)(53546011)(86362001)(508600001)(26005)(6916009)(6486002)(7416002)(36756003)(4326008)(38100700002)(33656002)(2616005)(956004)(5660300002)(21480400003)(235185007)(83380400001)(54906003)(66476007)(66556008)(8676002)(66946007)(8936002)(316002)(16576012)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ivDqoONSePtYOBgu9KVJjw2Vn31jf6gsktHKqqustAtBz8dp0xcATdZBRJdd?=
 =?us-ascii?Q?mkW8ngd9Agw0f6VZKzmudPblKoeCimQIdk0q/9Kpkc0kAM/8S7qeLZicVPis?=
 =?us-ascii?Q?VCD2lL/GOJ4lXky9/n8jsMFB+mbPw2gOtuSQrAdAf2EEQIdeTU0f2JPgyTeK?=
 =?us-ascii?Q?J9B8RWTTFuuQdGIl5ZSG9zLU8s6/UjHDP7BSMCgX5eMceA0L+cfBnojd+X0a?=
 =?us-ascii?Q?0d3UBkiqm05FVjpzK8Bqle6sLPtyfd+UZq6U5NwlTg2UrTiQ0d2mDrP8JOCp?=
 =?us-ascii?Q?9Mw503fzzsTNWyh6fd3jeP+xijISh4hQwVBO4ADPaj1mLKOZRLLtP2w2ljcH?=
 =?us-ascii?Q?Iwyzn+RPNFwZNODKi55fKHA9P5TofNlwZqQp1MoXiAV2LC7cvgmay+4uq5Q1?=
 =?us-ascii?Q?8Zzgp4xtg89wlvoy9Jh5umV5NMDDFDcsl0BwWy8SLFpWIkhCFPrTaZfIAQzR?=
 =?us-ascii?Q?c/dpFxQgVcPA5bThSXDP+bbuYEABvfPCE/KEPnW3iatGwlELp7KtQlMhQ3jD?=
 =?us-ascii?Q?4AhjQEhP+VxrhpSPJKHfyPMxYee/lMNnLm0XsXHR0+9gHtoj25/QrupBzRcA?=
 =?us-ascii?Q?pHRD0U6+utvlQQYRf8xXIybVvopzLQ9Wj2hyaYpBA+mbnWx3zvJJw0JyVKXH?=
 =?us-ascii?Q?2PQ/B1rzpwCws6+2zvEsUUtw/Z7UxY1/otaHRIUIDh3v4nU2bAh0i5GFWWyv?=
 =?us-ascii?Q?kcsu6ircvEc+m4F5YjK3/wSl3XFH1RvR3yseQOACkuzn/eIUop4Kl09zu0A5?=
 =?us-ascii?Q?hG6wOAs4+zvi41Hk0Aq5dVFBIiyod/Ts4WXIhJBrM3Xow2n/vch7FGMIcANO?=
 =?us-ascii?Q?KzlcjGco3YmZyCMVYWR9Y7dkyWCDjMABTxHneb4tY442bfbONbGUTNo1g9UI?=
 =?us-ascii?Q?BcvLx7Y0QiEvAveG4ShB+gX6vhxPP4JUEu+rQlEo5g0JC/5BkA1wfLKU7ew+?=
 =?us-ascii?Q?t2MeLB0qLdlNy092jBpAxLYFLNhoFNKhoTvhwl9Xf/FMo5lVAsvSRH+at2oZ?=
 =?us-ascii?Q?oaG9N6sLMp+t0LPrZ5Jl++89/01XxvGAy+WicjsMh8TVPG83sJYXMCFmjkzB?=
 =?us-ascii?Q?Y3GtMkUMh3pyhZNoyOtUfNUnp0D+eS5mvTZTnmRapeyHGuljOPsztWe8txeU?=
 =?us-ascii?Q?NMWzHdAQ1t4oajEUSwRpnjCD04OAV6e3v5+tJi8eakYkvdSX9G29uwbgYbhl?=
 =?us-ascii?Q?TB9vbgRH9YpMb+TXa4Oyr9sEp123EBoKZYOeHwkueP2/SL6/WyDYHiRSkvUP?=
 =?us-ascii?Q?DSCRVP8gX8xyZyMQBN/zaBS+a7FqLGt8Gm82fGNaNXAjqLqGIDnF25pF781Q?=
 =?us-ascii?Q?VdECV3JEH+629gMeI4b82/bY+9NqV13zooULrfQ9DK2bXG3WZ3pYwhx+mXik?=
 =?us-ascii?Q?/w3lHSxZHUfUc1wMKdm4CQ9RTyCyCV62qDbZPFth5qNu0ZB/yK3WoD/y01n6?=
 =?us-ascii?Q?/eVzeMF6+Qt4ARUXt2PWrBESFtt/IBTrwE0NAasmuFWsr16RRBLSS6vRfmPa?=
 =?us-ascii?Q?9XLf/H/FCIG27ALIl7PTWk3z5nGoicafa2Tb9zH0b17Y5p0r963TBFEqoDAc?=
 =?us-ascii?Q?7paG1wBFOkHBAGW4kAQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cb3a282-c459-43b1-9d91-08d9bc1a251e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 20:17:52.9758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiH9nDK6pEKX9mzRqApD9ksMofkeszEWKYdN2/uZg/eR1CX/6VpTiwAO2s3Sa/YF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
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
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_7DBDBA8D-1217-4A06-8FC2-209CFAFFFA5D_=
Content-Type: text/plain

On 10 Dec 2021, at 13:36, David Hildenbrand wrote:

> On 10.12.21 00:04, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Hi all,
>
> Hi,
>
> thanks for working on that!
>
>>
>> This patchset tries to remove the MAX_ORDER - 1 alignment requirement for CMA
>> and alloc_contig_range(). It prepares for my upcoming changes to make MAX_ORDER
>> adjustable at boot time[1].
>>
>> The MAX_ORDER - 1 alignment requirement comes from that alloc_contig_range()
>> isolates pageblocks to remove free memory from buddy allocator but isolating
>> only a subset of pageblocks within a page spanning across multiple pageblocks
>> causes free page accounting issues. Isolated page might not be put into the
>> right free list, since the code assumes the migratetype of the first pageblock
>> as the whole free page migratetype. This is based on the discussion at [2].
>>
>> To remove the requirement, this patchset:
>> 1. still isolates pageblocks at MAX_ORDER - 1 granularity;
>> 2. but saves the pageblock migratetypes outside the specified range of
>>    alloc_contig_range() and restores them after all pages within the range
>>    become free after __alloc_contig_migrate_range();
>> 3. splits free pages spanning multiple pageblocks at the beginning and the end
>>    of the range and puts the split pages to the right migratetype free lists
>>    based on the pageblock migratetypes;
>> 4. returns pages not in the range as it did before this patch.
>>
>> Isolation needs to happen at MAX_ORDER - 1 granularity, because otherwise
>> 1) extra code is needed to detect pages (free, PageHuge, THP, or PageCompound)
>> to make sure all pageblocks belonging to a single page are isolated together
>> and later pageblocks outside the range need to have their migratetypes restored;
>> or 2) extra logic will need to be added during page free time to split a free
>> page with multi-migratetype pageblocks.
>>
>> Two optimizations might come later:
>> 1. only check unmovable pages within the range instead of MAX_ORDER - 1 aligned
>>    range during isolation to increase successful rate of alloc_contig_range().
>
> The issue with virtio-mem is that we'll need that as soon as we change
> the granularity to pageblocks, because otherwise, you can heavily
> degrade unplug reliably in sane setups:
>
> Previous:
> * Try unplug free 4M range (2 pageblocks): succeeds
>
> Now:
> * Try unplug 2M range (first pageblock): succeeds.
> * Try unplug next 2M range (second pageblock): fails because first
> contains unmovable allcoations.
>

OK. Make sense. I will add it in the next version.


--
Best Regards,
Yan, Zi

--=_MailMate_7DBDBA8D-1217-4A06-8FC2-209CFAFFFA5D_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGzte8PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKgZMP/3tUjopJZwSAjnbkyluDjYvGsNB3I1qVGH+o
SfzNETll0wimCsKbrRMUhh0tx3E3TLgF79FuigVaoPLnfbgEdJwPyMRyArQep4ti
hyZnKN7zhCvYzHpVK/BDiI78JC96GZusKSU1hYOUcaLNtx4EaAttk+EXYyE/TP+D
Qdtox83CjKX/FtwJH/P0XSn4XhBl52KnHgARC4YDVEJorv+VmImHcQFfO+rxQKEw
VnpevGuWetgc7m4GrPm+4rCZNzv5/voCOhtriLyn1xlBt4LvmmgSqAIIT8Kk0mWz
rPVwPSQF9qexiOR8juR7JmO739ODjKpyqFEtG6xpQ7cJdBz0voOXxexZGKJ3X9XM
aIpgvgWRygJYkiivTRKfcHakjHekQ4ZYcPqeNrVnQ6Feq6j7LChg127YpK0mBsru
FxWxB9Ekb4mYulDEfeyiMz66CziaDgqQDT/AcilMtNzvpfXN/WmoSU8erBvPvVkl
ZF2X+bvXdYtinVSSYM/XE9mdltfvlnIZcK8FA60pRVv6xDBKPMyzE9Pzq7+o+Aho
9Zrfe6VqzsqKTJ3r/Joy6QWlcKmjPkzMRnGyzjO/P+JIyX3pTZ2j6Ae7pmOhwwHT
fQ6zONI/o2JkUxZEqOTl9yGga6qOgBTchNhbNHX67Ww5HpBZhwKkZbWWo6QgdvSe
eEnH9Z76
=k/t4
-----END PGP SIGNATURE-----

--=_MailMate_7DBDBA8D-1217-4A06-8FC2-209CFAFFFA5D_=--
