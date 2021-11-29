Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 152D54623FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2zzl0Dg5z3bXj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 09:09:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Fib1Lp1x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.95.69;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Fib1Lp1x; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2069.outbound.protection.outlook.com [40.107.95.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2zyt4lSYz2xCX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 09:09:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIMOJQ3k/Jx3Gxb3BcTDYTqrojjKOBTI2EanJFhZYLwcAFHcBotXaa4KpJVuzHwWcJcGRstkOuA971n6UoMv1D5Y/B7HrPAQ31hpdBOMkKzSz4k8CGw0tgXPOHsXZjxeRxz3uziaDKcFmn82BtR6qgs4jfQqQsxF78JNTp4NlABCUQeSIvvrBuBpLwKtiJlYnU9OxqwbljD/bmS5a5efCCU7lKQjYdHonjnmWZcEc7WvK7K27OFgQc5dkl+zbAk/3P6DWEyTo1evwtAMPjbR3nLPZyJb+lzmGDd7lZnWUeDeJX5rSm+GAV7WUJF28kXj77tiZ2XHChGwzfXrp7k3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8zwazSGCLjIMi3AqEDquB0s4llI/Xb/R+68c/to+kpI=;
 b=ayq0DxD8Dv30VnBSeHTtN7iZbEjtTI/etuWBYDDQx8tuzdHOiLDOgUZNwOE5eq5ilLcgb2kNZ9cch+6TkOTGIwyQGXlhfNjSvFnypRXp/vxcIIVjCzjhc+7epcoKzIcZnZ9q6KKHVos92WvEi4s6LcQQrVXOx1PD5+0B4kk3OfR2Wmy6ZISxeE2IHKPyQ3gKQM97LkA6JtcAgflwX3y4s4HWNO4HSyv75wp0BjD6dvb25C04N3PUYCKxrUHrJCCDKBw8mOg+oNqU3yNev3IrPwkcpOVzxQWNG8zFF14B+wGYXPI5UFEqfq/i4FHZAJKAGkboduEHSRbx8t+Ckng+XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zwazSGCLjIMi3AqEDquB0s4llI/Xb/R+68c/to+kpI=;
 b=Fib1Lp1xkXUoDEg/NZZGQY7j9UHkpiOgKfx6OaQI5H2AjwPYIizmwvSU1DYRIV7vCkw5uYHoXPxtGC7LJltvOUV6I02kl5VgE0owp4/YcpfXxlfb8jVu8n+iiDOuphmoA7RrBF26i/l13hKevhsQYW1cmqz2Jdh2GmqOJI/hr1kPQ0Sz0txXoVN09sJnlqU/Wxe1/NdlVNU7Co6++JS3F5Ip0ZDJYtO88gB+I29qJ5DN2jZfaChg/OzVVt8Ai3lsbdlvCrNLrKzh/hXpOS/RgthS5jKLywi2yGNtKpXxDOFd1wL6Dwkt9fGW++8i14XLmRsjS3nl4Ndcu2uqFGMTVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3983.namprd12.prod.outlook.com (2603:10b6:208:169::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 22:09:00 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::2dea:e478:592:6d66]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::2dea:e478:592:6d66%3]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 22:09:00 +0000
From: Zi Yan <ziy@nvidia.com>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
Date: Mon, 29 Nov 2021 17:08:57 -0500
X-Mailer: MailMate (1.14r5850)
Message-ID: <35A20739-152A-450E-8535-2236D2B28748@nvidia.com>
In-Reply-To: <52dbf824-76be-cc34-3983-d45510b1b618@suse.cz>
References: <20211115193725.737539-1-zi.yan@sent.com>
 <3083463d-978b-fbe6-dadf-670d400ed437@suse.cz>
 <AEFF28CF-0ED8-450F-96A4-A6CD59CB1F3D@nvidia.com>
 <BF8FB68A-6E1D-4465-8A2B-884FC034660B@nvidia.com>
 <52dbf824-76be-cc34-3983-d45510b1b618@suse.cz>
Content-Type: multipart/signed;
 boundary="=_MailMate_4B5044BF-6C2C-47FF-8D31-06E6118699F1_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
Received: from [10.2.82.121] (130.44.175.231) by
 BL1PR13CA0184.namprd13.prod.outlook.com (2603:10b6:208:2be::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.8 via Frontend Transport; Mon, 29 Nov 2021 22:08:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef4ec0ce-0b24-40a2-1f6d-08d9b384d85f
X-MS-TrafficTypeDiagnostic: MN2PR12MB3983:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3983B7AAE86B10EB38E4613BC2669@MN2PR12MB3983.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WZJ9tAz8A6MJBJ3QUTSg4tCidVPbl15Dts+RpmYDFfe0LNKSkIywoSHRIocl+f5zoGoX99RlQdEfVkPna3PJlJGoXzwN0tm9jWDdM/4j6ELnLnhyoCi1LG898D9c0hYhYg6DYQjRneDtodbld7mxH8KHzBT8SBViAeZClhJqr1khyUEhXVm+MNuf4VMsdbxrTwSCVygB/LZMgnhUL26qwKxWWRzozB2HhqOGHeV7PNcnU8OaDkiIo34L1/5oHgcWflJFHkiZytSA1D3KhTV0+XNyIejrl3ZGnHOg+WLTdVOZseo9SjbPgKV4Vp8BKHVobeQzsFLHY1lK1TTCVtVEa4l/oAtIyZGezsWch0khzV4/c89xguir64ElSEiF4Q/Mh1gfDQoCIZtXkuceRq4gghNPfz27BO1CBnwZWnb1La1gc9QhTt4ncQJNpqOwOnUvKwegD0Psifcbit/y2nrE+eOkCW+jAyt+D+SYb9lvi4EhfLIlbfJpdGNY131y05ihCaqgnslre+EGSLLUr7rA8g8tCnHE7u+8tCNcAK+Vi94BJaw9HEX4XSe0LWzCQYaSxNi69+flH7lVPD4hzFDjdoCnzpVvk6rn2Vq5QoOoh816IwtcII9v8xLcaRfK4ux39sF28z7znFTQQfKoFoGjyPxZqDke+17dJgQUwCDYJbUHAqqo7ERriTPzLtRWkO5SH+DFNrOH4ib+YX0TWv3Lsicq1PTUI22x5nzHr8HkLOU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(16576012)(26005)(2616005)(6916009)(38100700002)(8936002)(53546011)(54906003)(36756003)(2906002)(66946007)(66556008)(956004)(186003)(316002)(83380400001)(33656002)(508600001)(86362001)(8676002)(4326008)(235185007)(5660300002)(21480400003)(66476007)(7416002)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KFivDfphpzyNfU4JRr13Xl4z6stZwmv+etn9zR/VX9AHy+HXuyQaG85Lm0Z0?=
 =?us-ascii?Q?zaz0TK6n3ZNT0hUVUDL0F29Lpn4z8VsmYdfx8UaQTn8kKu3Xx4K5zs9G/wgs?=
 =?us-ascii?Q?/DNDUSSQzNvvSGYsVq1L/7nrrpuimkZawcAJIlU6kM15/Xir2tDnqnlC9jgW?=
 =?us-ascii?Q?bNH6MHIiLYovMNpbHPWISng/f7zro6FTjrGHNWXxSz209zhn5MCkwyewwW6V?=
 =?us-ascii?Q?zoO4DM3UnyQNurmHgIjHl48ZPw2FcrxQ68/OmgS0jkiaDrfAQhF+gYjF1552?=
 =?us-ascii?Q?MvJ2Afp22509JAJlkObLJWCUjNlRY75X/cHlde9MtwNU0jkvbWIO6w5aeFDG?=
 =?us-ascii?Q?7s7aYnILH8DRDb35Wa3uNTTM9dKGOwJ94oTPqU2N5eMsRIWMrVImo3tk9Qt9?=
 =?us-ascii?Q?Ec1ssTMBM810nywI89apRMSUaR6sCIbCuPoHPxmspC4zES0J74h+GoO023du?=
 =?us-ascii?Q?M+Nw8rLSBVIFJNwU3vBkj7uKoAmUfRmNaOFML1vVY1YX8wU4DgLf+U6bk8a7?=
 =?us-ascii?Q?aw1aU8346oej/l5U36J569jKFGo7RlQNNWsNEKGfyqH9a91qLa5SV4scpSyT?=
 =?us-ascii?Q?0dbVykBlOnFjapTR3njXrWCRytVVEtIC41bjnRViXf2TLW7Gp1RC/eYljVJU?=
 =?us-ascii?Q?TUOrlUvn+haZYuMoiEcL7ctUoVizSG7BPeKEHG2WxKgom4hJYsnoR4CId2Pg?=
 =?us-ascii?Q?xAbenPwTPh7qG2A0mdCidff7kXsUhSg6OMuM1Yg/D0P4MWFB3PeRrCgFO/HF?=
 =?us-ascii?Q?5lLve2Eg7nyJL05o/8nmsQIcdc9mYiCLwJQNUuAwbhdCulaA6/Ogjw4dCBQv?=
 =?us-ascii?Q?3Zy2atXdf1fa8QJIITfOFYpn/d12NvcBBHCqgHE5x4GXqnR7x4+KXnsKx0FF?=
 =?us-ascii?Q?XvhcpvJ4IdQY8bVrK8tIlVT/yA9zfrIj19sCFTbPsRjYjdDoDc5t48PEm5KT?=
 =?us-ascii?Q?W80YawPwkRR9/8E+oTCU/ReFKqcjYeZfSXTb429uJ1Q7GtaokDxfIFcMq2Qe?=
 =?us-ascii?Q?3n2oKRyFhRYQwKuzgnL2xCSXK4QWEfTHCCjK+GKXcGlJcA5qNAMIwnSphnO6?=
 =?us-ascii?Q?Z8xdP3BbNTROvR2aTQHNKJ9HG438qt92g9luhP5+ZaDf4WfEXXc1eUgQlEnb?=
 =?us-ascii?Q?WfMdz7qgIAGByJXYJDEV1K5VX71F3kzXIAI6IN3qKxdjuZ8mUbukqRGpiB4I?=
 =?us-ascii?Q?junhmqzrg4nd4tF2E2kSDLVBZOfWtl1Od/gyrdUaIgS5+WJiYdDse0JvCjrC?=
 =?us-ascii?Q?YMZm8mYY78GgiGCtefkdnEU56fpPwrGH7zdd3AjpAA+Dkho1E/O4b7XKLAo+?=
 =?us-ascii?Q?03OF/sFRkK1eZ59/Ykgz+V2xbKlNVCiTs/7tKfI3XMz+iP1NBm/vp8I4A8Er?=
 =?us-ascii?Q?OmixYvP1v0g0kewwxE/IzYYNerx3N1Hy39HJjLoeYHgwAfd8z15I2l787fAd?=
 =?us-ascii?Q?qMc9XIGCZP1p7AhjRYL7Y+8f1/jt6Lqnhw5c12zHryug3PrzTQlo3m8TkXG6?=
 =?us-ascii?Q?kfQiQIv2GzeFce4UrqAEqgY4o117xP8EjqaZpxRJrR+yBMwrpMioAav0NeMU?=
 =?us-ascii?Q?katquDJ7xfSOGzK9/Hk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4ec0ce-0b24-40a2-1f6d-08d9b384d85f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 22:09:00.0281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bklzwKCTclG+BWxJtbSwfaiA+ZwNF6OMSsZAkkBQ+FsXwnTcNz7Zf6S3SJ1zlbY5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3983
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
Cc: David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_4B5044BF-6C2C-47FF-8D31-06E6118699F1_=
Content-Type: text/plain

On 23 Nov 2021, at 12:32, Vlastimil Babka wrote:

> On 11/23/21 17:35, Zi Yan wrote:
>> On 19 Nov 2021, at 10:15, Zi Yan wrote:
>>>>> From what my understanding, cma required alignment of
>>>>> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was introduced,
>>>>> __free_one_page() does not prevent merging two different pageblocks, when
>>>>> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implementation
>>>>> does prevent that.
>>>>
>>>> But it does prevent that only for isolated pageblock, not CMA, and yout
>>>> patchset doesn't seem to expand that to CMA? Or am I missing something.
>>>
>>> Yeah, you are right. Originally, I thought preventing merging isolated pageblock
>>> with other types of pageblocks is sufficient, since MIGRATE_CMA is always
>>> converted from MIGRATE_ISOLATE. But that is not true. I will rework the code.
>>> Thanks for pointing this out.
>>>
>>
>> I find that two pageblocks with different migratetypes, like MIGRATE_RECLAIMABLE
>> and MIGRATE_MOVABLE can be merged into a single free page after I checked
>> __free_one_page() in detail and printed pageblock information during buddy page
>> merging.
>
> Yes, that can happen.
>
> I am not sure what consequence it will cause. Do you have any idea?
>
> For MIGRATE_RECLAIMABLE or MIGRATE_MOVABLE or even MIGRATE_UNMOVABLE it's
> absolutely fine. As long as these pageblocks are fully free (and they are if
> it's a single free page spanning 2 pageblocks), they can be of any of these
> type, as they can be reused as needed without causing fragmentation.
>
> But in case of MIGRATE_CMA and MIGRATE_ISOLATE, uncontrolled merging would
> break the specifics of those types. That's why the code is careful for
> MIGRATE_ISOLATE, and MIGRATE_CMA was until now done in MAX_ORDER granularity.

Thanks for the explanation. Basically migratetypes that can fall back to each
other can be merged into a single free page, right?

How about MIGRATE_HIGHATOMIC? It should not be merged with other migratetypes
from my understanding.


--
Best Regards,
Yan, Zi

--=_MailMate_4B5044BF-6C2C-47FF-8D31-06E6118699F1_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmGlT3kPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK0ToP/3xsHoF15mPR7E4A+wmWq5NufZnqLsDp/BYx
fTspt0RwFFCCYfGmltjtvaR3oJ6ZR/Zq4VGAH4bQqhV3RXW3ln+J10tGEr2P2/c3
jkSlXj4buDI+7M310afqzeTgp4OKZ2Bl5cEg2VcgGfSi4peM3ndSzc/MFwOzh3vH
L7ObLigzaUvuJbD3Rp6xq3GDj+53JUZh8wkjZuRlX2RsGVu/tjS2Or+jtP7+wL50
WkcsyrEfOR8I7C92uArBGifAJQEP9jevsnwN6GJwI/ZEmga0djUBOL5AZcS2HEd4
ikd9vESjZNs7WSO2j7Y84LhPojaHA5v1xlkoNOdTbw3ndg/LP4nwlAMqs6/2fP3Q
7gmDAfOW8iZ9r9inH0HNFn0O+vtc+2X2TCgU0FPjv6osUzRc9SXJmTASPmwAa38C
SUol5lwxsl78vG+A0knxOyusiK1Mb5iouJy/hPmuteobiCXS5PGe4ZL7WAm0Qv0U
VdCBpuxcoB0GahO9KXWBuQ7EqCo2ubYKvsKQBeyByScKecbuKc55KMIUROPWONiB
7jsNUrZ++nQzRQ176Az5Ig69f09f6e4BnphGCkLhhEvmJUu7MDbQT4NPEOjippHY
MbAnuKkUDEF8xY904hlNFcDetthF+ARWVNlx8qWBKqSzfVDodRwNqNBsqoMs1X8o
/QiCLa1r
=neNK
-----END PGP SIGNATURE-----

--=_MailMate_4B5044BF-6C2C-47FF-8D31-06E6118699F1_=--
