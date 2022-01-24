Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018E49864D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 18:18:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjGsg0Xl4z3bVc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:18:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=N3omPLSw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.102.81;
 helo=nam04-dm6-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=N3omPLSw; 
 dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2081.outbound.protection.outlook.com [40.107.102.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjGrs2nG2z2xrc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 04:17:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVh5YZEBcZGWwJFsCScjwlZYxqhnAKlB8eMNspGbpJKHel3OKaESue00a75nhzrNdOuTnG3wL8Er0vTjP4YCKvUZcJfWYqok3CPSewBh+7AVWYegOJVHKqT+xLqqi70V5ycShTDV6KbJJg6lrb6ae+82l9X6MkgHAjLZolmZQQFZodRlNXDi27JLd42FldMH/dK8UmbtJfBy1n13VwZ8dgMJczHSuVxN7FtbwPqZJjY164qWo2UUc6LOx3S74r6WU4z5OlqMcjQGLMhuZIBeHrJXFEjD/baOK1rHNmrIJ9lI0LEXYkJql+vBQSRhqlSDawhllot2rKrQS9j4Mq+Brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0Eu+2xVKWm+ZczEQK2WBjqID4KJe0aXtKlMgoZ3AYw=;
 b=a1Pwqudq/3yOG0c/xXdmSS9p/bkBvmue1vKTpJ52AjaDsMG/P5wB/xDp7c+WagUos1whS50e+roUCOVS22F6hyk+ay4jt24j23z6tutFiGK6FwwYT6bS0IwEYVXq4vwpEonyZ2rv+x1TOn39otdpNZhmW/+YcGW4HCnMRQzmyFIy37AzF06Nwsj70e3zXctu9UmISUIAuJygNw3cPE9MV6HyQW1y1J2G+NYXN8sUfr5V8lZwdaybXu/vXuGZ1nJggA8yDGGq5RFZ4MxoG/XynXSiLLlX28kzmx1SFw/OALdW4r70Hl4+aY9dWT3ukbw8MuUw+hMCEWy3yhuSF6595Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0Eu+2xVKWm+ZczEQK2WBjqID4KJe0aXtKlMgoZ3AYw=;
 b=N3omPLSwPNzJWmRnfKtDS0L0qdou1v97P9P5St5CPAL9oYru5JR5t3y/2ltwjIyQb3KWTtoBptruM07qXSUJCKMh9GgHe7x6vGE73vp4oxZoJXenpJN29MkQ7RIdyqpMjkCd816H56Uk2cL3tNvVEaK26glHRlA5o5ZtPCIP/YPsT5zOS0Mo3YGTT57k8zOUF6dE9LBR5BrUyQ95MRqPf4FdmmLEpeywXWDFRX/fA9Z+XP0X46DwGj7QmER64nc6ijC2rbuTtSjuVknkvAE/aEew6LB/Y1WijpRCl0DyDS4XxUqzpUZu/LPqxqnPBpbCQh26TNo1ZmMGw2IaJOAV/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB4423.namprd12.prod.outlook.com (2603:10b6:208:24f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Mon, 24 Jan
 2022 17:17:26 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 17:17:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
Date: Mon, 24 Jan 2022 12:17:23 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <6AEF32AC-4E0D-41E0-8850-33B8BD955920@nvidia.com>
In-Reply-To: <b7c311d4b2cd377cdc4f92bc9ccf6af1@suse.de>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-4-zi.yan@sent.com>
 <b7c311d4b2cd377cdc4f92bc9ccf6af1@suse.de>
Content-Type: multipart/signed;
 boundary="=_MailMate_27B943FC-F449-4004-9416-0A7B85F9E6EB_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:208:2d::33) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ebb096-c9d4-48d2-e6d1-08d9df5d6467
X-MS-TrafficTypeDiagnostic: MN2PR12MB4423:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4423A4B08EF777B09B2D63C6C25E9@MN2PR12MB4423.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8baTpuSEhHP2JgmRnTwWh8eFsiHH0YtAxRu7G/fpAzo2ST40Wl+urFRSkpwvKxAxY+LdUpar8aTtuxjk7Iw/q6bp45s7gSyOTnIwNN3Uem2l3Y7oeACLus9GNnANkOmhEBr55xeZlz4Mb59n7DANR28KmTw8veUZnCjg+b/MXPhxyDuqtanQBqR8n2dRVIQDLhAdEzCYx+AWeD1pIxxwolMEKNUWb3TYH2Qs/YKxLB7njNnxRUBl2JaM2FvfpPKNmiQl8BWGnfs/f5pAC2tmnCa9fVdyl/pbvvh+hPgFrJbgaBkOBF4jWi9LxtDjy8EbsiSUYZIuqpeTwc78bE0dpMMiNPztRPc6D0mRdLKnWmcyMh2JMSl+9U0C2xJDQzPSoCeHcEo8tmC9eVkePuPDOk633aNbQJ9JbiC4i/0N3UnJhsJU1zEPjZx79rA1YVBZuULHDXQikHaxPN+Oz08PKQxuUd0VsXtptEX/gc4+MT7aXQQpERH6DohmqbSSlzqmMXz03X9ppQV0Eda54jO6uOMw3xnne1crTkiDK7kU1wCxY5vjmobYO/TOoaMXipEd4DWNAQvIq9YwKZ8OyytTBCquYBIqbJvle/ONKex+vfeXILCotc3Xxhign5HiVtlMfCbfwMX/FrOFy1Gjll7ciQYQqxAyNgb1SNFED/NRdPBUKlIlaDQc76LjCDjakaVoXoA103Cu96h0QeWF8VkZjaD8eIHYz8vCKSpiCpjo7ow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(54906003)(21480400003)(38100700002)(7416002)(235185007)(66946007)(5660300002)(6916009)(83380400001)(36756003)(2616005)(6512007)(6486002)(2906002)(26005)(8936002)(53546011)(316002)(4326008)(86362001)(6666004)(33964004)(6506007)(66556008)(508600001)(66476007)(186003)(8676002)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3NuL0JMZkVML1pkS0dCdVF3M2pGaXBoYTExY2RBd2lZWHNBWnl3NVBRSzBH?=
 =?utf-8?B?M0poUENnRUR0dU5Wd253ZUhkTWFjRVdIT3N1Vk1RYk9yS2MrcE5STnpDalAz?=
 =?utf-8?B?M2xFYjZqK1Z4Q0RBMEF6dGQ3Q2NRaGVyWm5VRzdhTURKelRMUFBYaWJVVUZV?=
 =?utf-8?B?R3FmbStWM1cra1ZtVnF3eWtQbjN6S1lMVFlHeEdIM1l5NVVnSjdTZ3doZy91?=
 =?utf-8?B?SndzYTE0alZ3a3p2bzRQVDJRemJvNEF5NEI2bGU0TysyZDl0Ymh0RzBWcTRR?=
 =?utf-8?B?cjlBaEdCMkE5cHBGN0ZxeDR5Z2psQ204VDRvQldmWjhMUHpVMVJwMHJWTWZw?=
 =?utf-8?B?RTBLekthQ05Pc2l4MWwxNjdQcEwrTUh3eVNwVlhpaHRmeVZ1VkszV0pHdVV4?=
 =?utf-8?B?TytvL1EvSk5vZDFVck5FSWd2L011SUpjeE1nZ0dtc3NSc1lyd3REdVJJNlZr?=
 =?utf-8?B?eFBFMTlVendSNWJPMEgzM1Bwc0R6aEh3dEkvS29yV01BaWtaMEdlME1JVUpJ?=
 =?utf-8?B?UjBoelI3QVd1WjdwV1I4eHJRN0lnYXpSYk9uK3R2QldJQU9SRzZCRUY4NmZO?=
 =?utf-8?B?VWpaOWNUQ2tRV1F3ck5sNXBxd3BMMkZ3cFNrVlRDWDkya2FwWXlqUXhZc1JI?=
 =?utf-8?B?czc2K2dmZU5IL1lXNGpFVkplUDQ2cU04TkVFY3JRMUJSYUhpb3pmK3JESkhm?=
 =?utf-8?B?WVh0N2xOUHRYenAvUzI0VW42ajVzMTc5ZlRhd0VoUitzSExVdzJHYmZKTDYr?=
 =?utf-8?B?MHJPL3h1cEw4ZTNSby9mT2hOZVhEQ1pHdWl1R0NXVmZocFlCdUgwQ20xbEN0?=
 =?utf-8?B?TXAxQ2NHcnpacThzb3h4TTRtV2lpL0ZGb3dKaTJJUUdRL0hDUWdDcGJhMERT?=
 =?utf-8?B?RTlUOTYrTWlXVFlIVGNYVVBVR0N6NTlYQ3Z0NERhZ1M1TGJScE51c2QrWVZZ?=
 =?utf-8?B?K0pqMTFNZkpTMk9nTWZFYmJ4SXoyd3lVTWxqcVpiOCtkRzBWbXNKeXk0U3dU?=
 =?utf-8?B?akxIVDNpKzd1Yll3TDlYY0cyNFhZUXBDL0V1ZDlWN1RtYjJBK0dUQ1VFd2dk?=
 =?utf-8?B?TGNCYVVmOS9hRC95QmZPRzJRK25DQ2lRN09tYXlJRTdEajhxSHEvZnRydzFT?=
 =?utf-8?B?cnhrbFJscjJDeURiTUxvZnNRaXpFZUpDamxPNXYxUThaY2pYQTVhSEd1UEIx?=
 =?utf-8?B?OGMvRFkxYnZ6Q0RmOFVUNmpNam9rWWpHajFyaEJzTHFaOWloeDJQKzA0WFZY?=
 =?utf-8?B?R2ViVStrNFNhWGkrdnQyQjFhdlFYdklUUE03eHFFM2hmZzUxS1VxbXU2bWJD?=
 =?utf-8?B?M3ZLSmRja2RLakkwTHJwa0ZlMVVVc2J0MUF2VzhMYjZHV1VCTnBoT2lkcFFF?=
 =?utf-8?B?T2pHTDdSUkdLMTdPdFNpeDBuMnFVN1llK0llM2UvZVcwMmVaMlZWSERaNXRQ?=
 =?utf-8?B?TDQ5L3dPZG1BcitNTUVGU2lxTVlyR2p3U0hRV0pNZ2VDQ3dqcTdtenJzWlpz?=
 =?utf-8?B?OUd0d2ZiNldWVjBJQ0t1U1RyOVRQMFBKSmNrRXlsWXFPcGtqdDh2MWNDcjFl?=
 =?utf-8?B?di8wN2h2MThhNFN3U1REU0NaV3RsOHNKbXltaDA0ZVlDZmJhS2VyblVVQ2Ex?=
 =?utf-8?B?YjJEaXF2Vm9SR1BGMlJnc1VzKzdWUTdyQkNja0daL2EvYXYzdzN4dnZxQStv?=
 =?utf-8?B?VUVyWm1xYmZVa1RTSnZKN2F5SjlrcWc5UnM5TWYzUms0Ym5pV3BsbHdUeW5G?=
 =?utf-8?B?cXp2OFkyZm91MzBITWI2NUwzNUNpYXJEaTNiTmZnZzA4VGttT3oyTWVlV3hE?=
 =?utf-8?B?TXFtWnZXS0xMc3VMRllpSVNpbUsreVN4UjQwTW9SdWpzcFM5WTRBOFFDNnE5?=
 =?utf-8?B?aXUxakZSU0VYY3lnLzBwbVB1dU1HM3B2Y3JNczNURWZ1emp1d3NobEVnWmxT?=
 =?utf-8?B?ZUVUYlJqcVN3U1MrSHk1TXFzbzhyUFJHNGh2L2ZYaGpwTVdma3MwdXhrQmpq?=
 =?utf-8?B?dWVONzFhR05TcUgzSHptenZqR09qaW9GVlp5NWhqb0VnK0N0N05WODhZcU4w?=
 =?utf-8?B?WU83clllTjc3TDJIYkNjZmM5Wkx6eVIwZmMxR2o2N0NqQXkwTXpnbkNMYlE3?=
 =?utf-8?Q?q5E4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ebb096-c9d4-48d2-e6d1-08d9df5d6467
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2022 17:17:26.0994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZV2Ck8IrHNIS3WiNssSouOsKetTzoHJNCZthFfbnxRpdDnTTs4OH3vAOLVt7CkGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4423
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

--=_MailMate_27B943FC-F449-4004-9416-0A7B85F9E6EB_=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 Jan 2022, at 4:55, Oscar Salvador wrote:

> On 2022-01-19 20:06, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Enable set_migratetype_isolate() to check specified sub-range for
>> unmovable pages during isolation. Page isolation is done
>> at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not al=
l
>> pages within that granularity are intended to be isolated. For example=
,
>> alloc_contig_range(), which uses page isolation, allows ranges without=

>> alignment. This commit makes unmovable page check only look for
>> interesting pages, so that page isolation can succeed for any
>> non-overlapping ranges.
>
> Hi Zi Yan,
>
> I had to re-read this several times as I found this a bit misleading.
> I was mainly confused by the fact that memory_hotplug does isolation on=
 PAGES_PER_SECTION granularity, and reading the above seems to indicate t=
hat either do it at MAX_ORDER_NR_PAGES or at pageblock_nr_pages granulari=
ty.

You are right. Sorry for the confusion. I think it should be
=E2=80=9CPage isolation is done at least on max(MAX_ORDER_NR_PAEGS,
pageblock_nr_pages) granularity.=E2=80=9D

memory_hotplug uses PAGES_PER_SECTION. It is greater than that.


>
> True is that start_isolate_page_range() expects the range to be pageblo=
ck aligned and works in pageblock_nr_pages chunks, but I do not think tha=
t is what you meant to say here.

Actually, start_isolate_page_range() should expect max(MAX_ORDER_NR_PAEGS=
,
pageblock_nr_pages) alignment instead of pageblock alignment. It seems to=

be an uncovered bug in the current code, since all callers uses at least
max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) alignment.

The reason is that if start_isolate_page_range() is only pageblock aligne=
d
and a caller wants to isolate one pageblock from a MAX_ORDER-1
(2 pageblocks on x84_64 systems) free page, this will lead to MIGRATE_ISO=
LATE
accounting error. To avoid it, start_isolate_page_range() needs to isolat=
e
the max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) aligned range.


>
> Now, to the change itself, below:
>
>
>> @@ -47,8 +51,8 @@ static struct page *has_unmovable_pages(struct zone
>> *zone, struct page *page,
>>  		return page;
>>  	}
>>
>> -	for (; iter < pageblock_nr_pages - offset; iter++) {
>> -		page =3D pfn_to_page(pfn + iter);
>> +	for (pfn =3D first_pfn; pfn < last_pfn; pfn++) {
>
> You already did pfn =3D first_pfn before.

Got it. Will remove the redundant code.

>
>>  /**
>>   * start_isolate_page_range() - make page-allocation-type of range of=
 pages to
>>   * be MIGRATE_ISOLATE.
>> - * @start_pfn:		The lower PFN of the range to be isolated.
>> - * @end_pfn:		The upper PFN of the range to be isolated.
>> + * @start_pfn:		The lower PFN of the range to be checked for
>> + *			possibility of isolation.
>> + * @end_pfn:		The upper PFN of the range to be checked for
>> + *			possibility of isolation.
>> + * @isolate_start:		The lower PFN of the range to be isolated.
>> + * @isolate_end:		The upper PFN of the range to be isolated.
>
> So, what does "possibility" means here. I think this need to be clarifi=
ed a bit better.

start_isolate_page_range() needs to check if unmovable pages exist in the=

range [start_pfn, end_pfn) but mark all pageblocks within [isolate_start,=

isolate_end) MIGRATE_ISOLATE (isolate_* need to be max(MAX_ORDER_NR_PAEGS=
,
pageblock_nr_pages) aligned). But now I realize =E2=80=9Cpossibility=E2=80=
=9D here is very
confusing, since both ranges decide whether the isolation can succeed.

>
> From what you pointed out in the commit message I think what you are do=
ing is:
>
> - alloc_contig_range() gets a range to be isolated.
> - then you pass two ranges to start_isolate_page_range()
>   (start_pfn, end_pfn]: which is the unaligned range you got in alloc_c=
ontig_range()
>   (isolate_start, isolate_end]: which got aligned to, let's say, to MAX=
_ORDER_NR_PAGES
>
> Now, most likely, (start_pfn, end_pfn] only covers a sub-range of (isol=
ate_start, isolate_end], and that
> sub-range is what you really want to isolate (so (start_pfn, end_pfn])?=


Correct.

I agree that isolate_start and isolate_end are pretty confusing here.
They are implementation details of start_isolate_page_range() and should
not be exposed. I will remove them from the parameter list and produce
them inside start_isolate_page_range(). They are pfn_max_align_down()
and pfn_max_align_up() of start_pfn and end_pfn, respectively.

In alloc_contig_range(), the code is still needed to save and restore
migrateypes for [isolate_start, start_pfn) and (end_pfn, isolate_end],
because [start_pfn, end_pfn) is not required to be max(MAX_ORDER_NR_PAEGS=
,
pageblock_nr_pages) aligned. Like I said in the patch, the code will
go away once MIGRATE_ISOLATE becomes a standalone bit without overwriting=

existing migratetypes during page isolation. And then isolate_start
and isolate_end here will be completely transparent to callers of
start_isolate_page_range().

Thanks for your review and comment.

--
Best Regards,
Yan, Zi

--=_MailMate_27B943FC-F449-4004-9416-0A7B85F9E6EB_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHu3yMPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKBkQP/1kYZhT3tIQI2CiaLQSdKeUXoiGIQMlMBkjG
VMD8kwhRSSgi818FbCdRxLenBvQ94JkcO3LK2eARzdbhIAnZTPeSLPbrVaFSykI2
GvW5YW8NZTF0K5lxoAkibZsejp1bVn1Vzjn2VkyDAmCgg6izwEi8pR8P0cNVmSZL
Z108M158C3b7bAKXvwBo313TlykFpKGuJAhQWUR2wJ6vNb0FlqdxwF/Y51LLbatA
WhhREntkA6tb1V4YOKPNSslPwOBOVWxT48DFE6KszqBRpqUbdFVAUErotJ81F9bO
h/Y16HNpy7N3qyn2FMJHTYWuw7SlZia6TJof93CiuHlrsE9OFKVSmJyG5dtWMU28
CDuFVWW7APNh8zbQkkJE/nz0hfWNnIo86ZwsL0b+j6fhlVONZtaxqzsUtS2kIweM
A6caSjB5s0oWeImDD+CQxnhrozRWtSyTOqpya4ZR6VYm/BZnbB/zDFh323TJ+OvT
Stlvt7xWzLk4mWek2i2s85QLfZiRvFh7NMBlJobWJHM4J10/FF+oxTOd3rfZKEnj
iLIu06fX4FXKMqsRPArEaU2HOMYYZGhz4nZp3l0eUu4Cy2yDkWNHz2r1btL4JHLU
O7JXKiA0+8ZA+OpfCUd6GBKdFYGA9JmNPJrxiSEi9TeQ6ztdX9IPqn++EP2nq36V
DnBpRPB6
=CVEt
-----END PGP SIGNATURE-----

--=_MailMate_27B943FC-F449-4004-9416-0A7B85F9E6EB_=--
