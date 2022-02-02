Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A1E4A75BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 17:26:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpnHm6NNTz3cBr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Feb 2022 03:26:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=e5OIL9lc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.244.88;
 helo=nam12-mw2-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=e5OIL9lc; 
 dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JpnGw6SfNz3bVb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Feb 2022 03:25:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRlilx5qEmQVjFiz4Z12Xg3Mfloey4NVLQ3x1vDxTb+ALJqmtnYjLRst7R72biBzZNjtR7K8ovCa/yDpp7rjyVsPYReltOoUeecMvdcWz3STdr40eJ+TlqRcA3HPHHXUU83JU0HzbZjzX45LxrUFazYgUdKGjRK0mZzkFKdCws8tTi3zSJIyFh150rg9EG/ON/ka2AMMIgEUzlXET6W+H0W/rWhQwqiHhku2im2jREkDmQOD9tkSXBaYBK2yS6B+ef5StPDzu9RdMzpMsdNZrV5uy+vMJvlhtWsuWjieB40AmWrpvxhtmxBL3VLkIFupi9wGM7oVlHB1Ub/9kwCKdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oOFANyY7rEc+TDIcsKTdvLjfLK3nYfKRWVxY+I3ztNU=;
 b=WpDSf18RGfPL/+eigJW4/mCnVaggDxq+/uq3AzJvrGXqMZ77B21qrTGf9FnSTVEHrboaoyDookVTNKPWcN9nFlqq++DAjR8LmyBIiw8JXeDFcdGFhyZHskBRv/EkhBwdsRNlx9s6SUPzWXTAMc1KIgqwko0bkk7HkKZMepo27tKaL99bGqgNeZmcJNDezF/MD17m31wsxZ51A+RtHE0CwIE24d9sof1eDFqUkmpsZa6DsRxKo7gIGXX13yNVSOt+S+ePqlOnFbhd1R+ZS/3aT8NPx0ycDFBGyAWQV3ZmNCSVENxzRPUwJQqhphmHf0DrOv0Z0l3dZ9IfvYOAJ9n+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oOFANyY7rEc+TDIcsKTdvLjfLK3nYfKRWVxY+I3ztNU=;
 b=e5OIL9lcG0nD/XLtqAWR/JVfhInJgrwT4mHoEDeBqQmkjIOcdq4rCBGU8rLTgrn4fWZfyVwmsHh7qcPek/zIJVRU7i4odH82bMpZ50AribPQmhf9dkteCAvFs2/4ULmPfjQOmqBJZf737KpYWNpVEadV9lT0hco5pz6jcQ0s61+pOgFtc06oDKfoEiCaBCybhGWC59OqBZCe5tmyOwSUhEXrkJr6keAPAzVMODS2tjakKnMY0Yw+LzzSiBehxutIpQYll2uRWN/ZX1eNIk3pn1dNcAZnSu+8X5Fsq7fskNVnq+oclJxyUAAdVHgx6cYJ0oje6z4KM0fahzs20xCbeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL0PR12MB4914.namprd12.prod.outlook.com (2603:10b6:208:1c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 16:25:37 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4930.022; Wed, 2 Feb 2022
 16:25:37 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
Date: Wed, 02 Feb 2022 11:25:35 -0500
X-Mailer: MailMate (1.14r5864)
Message-ID: <ED2CBE9C-EC92-44BE-87B6-5FF594415FF1@nvidia.com>
In-Reply-To: <21c196f8-18ca-d720-4241-00c9461854d3@redhat.com>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-4-zi.yan@sent.com>
 <Yfp2rv0K6d3cNmwg@localhost.localdomain>
 <21c196f8-18ca-d720-4241-00c9461854d3@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_DDA32845-4AED-435A-8D84-6088D52B516B_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR15CA0041.namprd15.prod.outlook.com
 (2603:10b6:208:237::10) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78537ba2-54e7-4818-6a68-08d9e668a541
X-MS-TrafficTypeDiagnostic: BL0PR12MB4914:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB49149B9DC33735213180E455C2279@BL0PR12MB4914.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J3QKMF8fgNEMm9Z6Sd6GCrLaxFJDsOZ5IgqUTNy0n4yRtn8Jb4B+AAF/NPHxYeu9eYzA5cC0FRqon+xrL1BYUMBCBylLNSXDs29TBGoOB+A98swr1k6hZ3r5YySc2ytd1yJpKBapMdoyvOE0iFZCU4m4GrzTo4BI3tB66ziPfEuhcgVExoAb8iEml8a/8qT3KDg2GLVXBb6k09H9W5HAazCPp/oYVog8q1X44ox+jWnqVjHjmzNZIoiMOC0ZNmNlbrKW+cFZXpkVjdy8OXiPSzCmDBhe8Vz91k1RRbeO1i9f0ZHFlyZax99MMxtk8xd2asX4RhvXq9XQ3DyS84B5wvDvA94JrgLyQ9FgQaUj9j1DNkyszNb2VRopXAGy0x6pDcv/Xmp0zvzJwimS4yIuZGONDy5io7WRAwPxhumowk5mAmbgSeZE9qONqwfXcz4H2YSpD3Wd5HrW1C5Kr+ewWuBDr5A7aYH2RCnG+liCh6JsH0dahCsbfBQSQLwTj8Uqf0cpwoqEJTki8Rw3Xz+dYrpTnOT/ggxYxDVYbDAPlNwHlHI77u6HMqcoo7ZLIV655T0ZIgi3pmfTuM/vYnxiJI8zI6IGKwJegzBDoFGEpKibTWMjh6X/buqc/dgpUt4N7AuOwbc1uiLcqsdZsOctNk29RLyB5o0Pcsl/SmKECGbk8CO0+E8N1g68fq0Ae/swHraV5QkStrSczyhhWmuNf/53PjOxkVB3BYbct2R6558=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66946007)(508600001)(26005)(53546011)(86362001)(6486002)(8676002)(7416002)(4326008)(2906002)(2616005)(83380400001)(5660300002)(8936002)(235185007)(66476007)(36756003)(66556008)(186003)(54906003)(6916009)(38100700002)(33656002)(21480400003)(6506007)(6512007)(316002)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nc/UpiSYzA9tXGcSRJ5pKL4+CLDPGG48cNOyVkVQgVUjHm+9XOvbUJCt5MEI?=
 =?us-ascii?Q?gJDVVKErBc6Lx3H/psIP19R8+zkU6t2yC1qbogkRb4x78CDJziTL4DCQZ7ko?=
 =?us-ascii?Q?nLN+ouAoMbrZjlG1gY3p0pEZ9hE/2+au07DcxUiYESH6ixhVU9/lLkQKhCSZ?=
 =?us-ascii?Q?pZATk/KQd8UmRSaucwJVnQhvEVYF4J9WEC6A0TkwDm/OfC4t4Rrd1ODCstzh?=
 =?us-ascii?Q?FgJhGYfR2el86eSlaaOk48IugbWe8u1lcS7ItRHb6+ElU/V918J/vByks8gf?=
 =?us-ascii?Q?hgk9yjh7En40vnlJN4LPPc9KT3NsUClgKXcsezI4HtSl1ivrKzCc4/FQHXKe?=
 =?us-ascii?Q?88gmufCYWyKHkfkp5ubUHWUoYCl8GW/I1XD7cwLll1CVqiAkQceH8ZIUUoLG?=
 =?us-ascii?Q?fSoOCk9jh0wITduPmwvc6blwYY7JY3mLndN6NBKWO77O9Z+pwEk60jVcQGSB?=
 =?us-ascii?Q?9hIpOeipZiKBSiM2aki6guhMPcV+w/9uXofbI7i1P1f+zJkAEzIDkJg3JvXZ?=
 =?us-ascii?Q?Aq+fXwQEkB/CIA7HlTfoK5W0XcOrn7HAoULpWV16U/xnW7U31M8a9uWFAGO+?=
 =?us-ascii?Q?1BX4kPqVVvsemWCl9satUxZVEgjp6y1j6BEFcKWOy/dvQaJPtSxBJjJnHoJN?=
 =?us-ascii?Q?bq+Mu1GR/XvKGOKYftF8yFuBLwww9Dfwl3dNBQt1ESZbNBVY8swkglFjelaB?=
 =?us-ascii?Q?jjn3hQgzqo4uaQYcUspKV03EF06mCncccWjbq8HmNbFbAGsLwzRgu3tau1Q7?=
 =?us-ascii?Q?BreZrfg17NVuHBJ+vMaHfeMPAsGFabhw5DjgWbePDNV90qTBLOgWTEGQ7TIs?=
 =?us-ascii?Q?ew79hRqxgImgsJUKF7rOEct0uOhUKSC2to77DPzVttSyzGVRaTNHktj560SB?=
 =?us-ascii?Q?H2nzFXDfEE4/RiHd53n4uaQWl85bE/otKESzxfOzSzehOIGUGiPG9l8whmVo?=
 =?us-ascii?Q?Un1KwpMWTckYq13V1+DjCnoG7xA8tKFQRwQAQrbKrOng1Xb0VN7lsTe0WtX8?=
 =?us-ascii?Q?lDJueg1Hs7VtxU1j9tcpdRPvNio3d64Ez6WFzML43cgc3HS/8EGs6ig8j9v4?=
 =?us-ascii?Q?1ujHapkolhF0DQIvVrckTd/2CSusbj97wHl28edRhh/pglgBMkCT9sZmTR4M?=
 =?us-ascii?Q?A394RZ8Z/bEP9T/1bPUaulsEKqpIPVPMDLDHtNJrLbKnnlD7Ml3dCl4U60sy?=
 =?us-ascii?Q?TaEgjvTfiOEI9SbLSC1Ip2+Gk8rBC3p/XYQBRkR8vYSyIN2zJ7YKx9/Pqqll?=
 =?us-ascii?Q?b44+IMI2sAbBQ1uvaMtlJeaeK1CPyxpgOa6lj0ty43omLeLSLTuFgtUSgEAT?=
 =?us-ascii?Q?F+4egI7dtRBqwd4Wv1l8ecUzDIe3o/Xl8rn9cXWNi4iYHIqyxCuBaug85ZXX?=
 =?us-ascii?Q?rpwYGPAt7LXNBE1emgBwhpiD2pCBy6ivj6ClNelS1BBrH6RFPY6H06K2nXuw?=
 =?us-ascii?Q?HIKBD1q1Tm7l2XnSj80kVOafbtQWJRnaqZKulNBQXkzzyH7Mf0HaKqRavesw?=
 =?us-ascii?Q?v7HjKGMLleX4+XelRvNv2iZvQJMjI7oMnUmx7JJNvrCcgHP/ep81TGK8R++M?=
 =?us-ascii?Q?vWT7S19E9P36MEqCJjI=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78537ba2-54e7-4818-6a68-08d9e668a541
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 16:25:37.5338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8ULqr6yukvOOwJX4KOc4zUSUrldSWKPkAWc6f8tgrXMIwxbRvM0MvQmGUaVyNdQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4914
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
 Eric Ren <renzhengeek@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_DDA32845-4AED-435A-8D84-6088D52B516B_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 2 Feb 2022, at 7:25, David Hildenbrand wrote:

> On 02.02.22 13:18, Oscar Salvador wrote:
>> On Wed, Jan 19, 2022 at 02:06:19PM -0500, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> Enable set_migratetype_isolate() to check specified sub-range for
>>> unmovable pages during isolation. Page isolation is done
>>> at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not a=
ll
>>> pages within that granularity are intended to be isolated. For exampl=
e,
>>> alloc_contig_range(), which uses page isolation, allows ranges withou=
t
>>> alignment. This commit makes unmovable page check only look for
>>> interesting pages, so that page isolation can succeed for any
>>> non-overlapping ranges.
>>
>> Another thing that came to my mind.
>> Prior to this patch, has_unmovable_pages() was checking on pageblock
>> granularity, starting at pfn#0 of the pageblock.
>> With this patch, you no longer check on pageblock granularity, which
>> means you might isolate a pageblock, but some pages that sneaked in
>> might actually be unmovable.
>>
>> E.g:
>>
>> Let's say you have a pageblock that spans (pfn#512,pfn#1024),
>> and you pass alloc_contig_range() (pfn#514,pfn#1024).
>> has_unmovable_pages() will start checking the pageblock at pfn#514,
>> and so it will mis pfn#512 and pfn#513. Isn't that a problem, if those=

>> pfn turn out to be actually unmovable?
>
> That's the whole idea for being able to allocate parts of an unmovable
> pageblock that are movable.
>
> If the first part is unmovable but the second part is movable, nothing
> should stop us from trying to allocate the second part.
>
> Of course, we want to remember the original migratetype of the
> pageblock, to restore that after isolation -- otherwise we'll end up
> converting all such pageblocks to MIGRATE_MOVABLE. The next patch does
> that IIRC.

Yes. A desirable optimization is to make MIGRATE_ISOLATE a standalone bit=
,
so isolating a pageblock will not remove its original migratetype. It is
on my todo list.

>
> However, devil is in the detail, and I still have to review those parts=

> of this series.

Thanks. You can wait for my next version. I am planning to make
start_isolate_page_range() accept any address range and move migratetype
save and restore into it, so that the caller do not need to worry about
alignment.

Basically, start_isolate_page_range() will need to migrate compound pages=

at the beginning and/or the end of the given range [start_pfn, end_pfn) i=
f
start_pfn and/or end_pfn-1 is in the middle of a compound page.
If start_pfn and/or end_pfn-1 is in the middle of a free page, the free
page will need to be split and put into separate migratetype lists.

>
>
> Note that there are no current users of alloc_contig_range() that
> allocate < MAX_ORDER - 1 -- except CMA, but for CMA we immediately exit=

> has_unmovable_pages() either way.
>
> -- =

> Thanks,
>
> David / dhildenb


--
Best Regards,
Yan, Zi

--=_MailMate_DDA32845-4AED-435A-8D84-6088D52B516B_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmH6sH8PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKJmYP/iXmUcS1xeOlSjoCiof9XQMxBvznUPT2Ut/h
uhbd8ZZGGShbY2c+6Eko0/00RwXCfuJx0zmSpBaxHv6dHiJ3dTCg0EAbV0EIjXm4
AcWVsKx4aIeF+PT+DOih1jjku9+Iypq7knEcnmT5uCmqcgbTK4cCNV4agPKU5H9J
oi2OqpmbJ8A6fe78sVZgQx94VKXfQ8EZSNkJpMqZOrdv0nsqLlTgnBq5JsEbi/t8
PMBWYHuqAla+S050tqmK0leiHjbfxxXYb9xq6nYM1f58JV+QnTz+b5wkTj7B7Muh
sqTLrfRXI0CW0uh0shKfJbTDnqIYcD3Dand+iZDXfwo4kIDrihn7Yvyi+z4Kc7TY
X8u6xLXDqUH3c4c+a/uRcDwt/3hnVKVntQUBX10ksuE8bXeQOFEWSV0rFDuSgHPB
1Luw6YOSPBO+WuIayG6YeQ4KaCzg0UjMbWKnrbyqpEIKxBCW7/Ugy2Rjk/97yI7w
ZNo2lK22QETIeDUjRtQ5BYQ4xDAJF8Y+q4Lyh0ETQyfgsGn1WNiWc+AJvCz9yJgL
UkKkjfmwdFyEa3tdQntJIE+1g3C6EA+HxqK3L1LuwysYJRinYDAWYKkNyX/kLScC
dkZt/CenurWv0uMeu0bdhKFdRu7z0w8YQ+1ZhEIkxaNAQ7uLqafmGsdWaQnIrGlM
8XIMpAeK
=CvVD
-----END PGP SIGNATURE-----

--=_MailMate_DDA32845-4AED-435A-8D84-6088D52B516B_=--
