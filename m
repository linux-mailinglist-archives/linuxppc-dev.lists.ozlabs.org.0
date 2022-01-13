Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890848DAFE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 16:47:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZTMz1yj8z3bVy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 02:47:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ks2+nvB2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.237.62;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=Ks2+nvB2; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZTM9285zz2yfb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 02:46:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKXYqdDTUxbY1bvTINS5z5eaQAKIY0W7ZeX6P2tBUaB0zHYAmkbu6N8o4+OCmsNlNHZHyxvjgZbb04imtKnNa+6pZ+Wf8936Wov54z5Z1kVM9XyKwIX39ZoU/5onK9UDbcVeqj83XxuQnbfdeTJbrtLCoeuxqM0d1eudAAuoHtSzf2S8oB9io1e5j5WVI6y9+n57KR7tqe09mNth6g68Apx4fwvLvAU/29ZH1Oohe33DI10snZ6E1Vylb3woq7uwtP0nOBwxL+IcINfmJIuem1qxjwQeZEvmSa2TSvR20KW/cSwBxFCn6cuAqZ05muVomyW2xLVrJcyucoLIQkn5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70DPamRWjOF1P5Kl2EabGD/nCcKB22XapBOzCDevrqc=;
 b=C7pooYZay3KdczqSz2bev8dVmulkFW3de+EUDd+wKjBTTPHNUvN4TtMuD0DqvS87j5D66Tktb2uhqilgtwHe/QG6y761pZWZU44SjpPDzwqWrlf5rAmT/vx9QX9vgP+2M6594S/kaKjSUo5CQzigGpFJqPOu2qHaXTP6f6IEArhclzloFDw5oanbe7wvMkMvOSSgJOjjE84F9OI4iQwdKYfJoKgME0SGzUaDAmvc7GphbfHfuEdI+9n1Lr7nBUr7JJrrlxQ22EarQDDMEygv5YX9b17EtgFblf3HhvWVLtQEmooVjKUsW8IOTCib5WbjMX7iaeK2zITywoZ/FOAhCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70DPamRWjOF1P5Kl2EabGD/nCcKB22XapBOzCDevrqc=;
 b=Ks2+nvB2YJAT9WZ8crfkAODSRv8o6wUE6/y8dW8Gi52ANyyyL2s8u22FTKonHYlnZV24aa22qYWFakIJU0v52N0OMA6QSyOrlEpnm+xfwrlWT3DhtsFDhVSYFlVCiptkr6f5B66L0f8jNGpCx+OciexfJyAPuby2xBBGdACaRlxB1k1HOX58dWVSrTkZXwQy69E0zs6uYgevgMH7vXRjSbT89UbNQn6mSXNITNdfynIG8tNVrdiebhdCR1cV0Z0vc5Q18XRr6hhJuNNKlbNPmutXgTaDVVWMTQidqPcbyxuJpJrlRZb9eclHCza4hjYl7mMoeT4ni+Rku77reBR7pA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by DM6PR12MB4313.namprd12.prod.outlook.com (2603:10b6:5:21e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 13 Jan
 2022 15:46:38 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 15:46:38 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 3/8] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
Date: Thu, 13 Jan 2022 10:46:36 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <15E26B9B-8AE2-4916-94E7-D0BBB2491B1B@nvidia.com>
In-Reply-To: <970ca2a4-416d-7e8f-37c7-510c5b050f4b@redhat.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-4-zi.yan@sent.com>
 <970ca2a4-416d-7e8f-37c7-510c5b050f4b@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_5420A153-EBD2-46E0-8FD8-CEB2FF89CBBF_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0239.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::34) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 072c39cd-f454-43d1-b7bd-08d9d6abe2e0
X-MS-TrafficTypeDiagnostic: DM6PR12MB4313:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB43136BC786599A3A66A50AD8C2539@DM6PR12MB4313.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i36vebSvXto5zQcpmRzldaNeStxznpdCk+FQyX7bItmWfyKb/tzdNUHzhoi2MTjTXXto1Zbwxcgox+CmIu+qYhhIfEw9S6LaHGcWJ9Cu1hJ+MhWmQ+0hAnsVV7DXJ9+DdRwCRElWXSDMAWByj29JVlkqpNJ1DO2oNA9wEgOjJkWPvg3GmSkjPNgRcwwzIwHxiSP+rFdu+UIZ7rgQb+n2TcM48xxso2k+kYuOu7ovHC01dH9/VZWDyKWM5Uiq60yB7LT4iwRGAm8sRn6pnThsfFw54SwwF//uecG37vnt43HfpQpp6gRPgeCtWNjfug/FMDDU5XzTtfl2uM5SaEqFjD5VwDVLGwodMFaQ+3fqfuMMyFYyPztRMDZV8rYhieyoqf0iOK1tq2ggGP+BrZ9zO3wDxNdJGAY+oJZrxI/Gz5IrQaK2ybwNNGdd9vdjV4sem/jHZ3cC+zpjFipLOt2LlXKGZzcC6UzkHf65hnsZcZUYJT5rqheM2eK5e3sf6xIKvuf4kNIBiSqol855XLVylfvPwiOK+2RBcO5MoQIjSmhn/5IE16qHEfEhEF4jNEApsLk0qiWoaykuzR7I3uJNgJdUz7pESXbGTzvf3PsLxnIcF8K9T7lYF6LX7Cogj9yffHLryDDl4e8sLv1MJ3q3gzdIVUplvdPAYXbPAsghkYTRGQF32WjPh5vOyWmCck7/8ZeDUCoOTdkPcEibJQgGMgmP51kg5FP1XQ09+N053HFwP0aF5sWTJRSJiIZ7CVgV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(6916009)(6486002)(7416002)(2906002)(54906003)(6506007)(86362001)(53546011)(66556008)(8936002)(235185007)(5660300002)(8676002)(6512007)(4326008)(21480400003)(316002)(26005)(186003)(83380400001)(508600001)(38100700002)(36756003)(33656002)(2616005)(185883001)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?38BOq3HxhoeYS/wqJcyDsn/qk8ONqHSqCmsz2s6hn1O9aj1NiqQYQ49gBFtD?=
 =?us-ascii?Q?TYeKuukXmDubP9LoLSoSznXv3t70WZ8hlE4ZUchx8R/GIo/Yd2SN11HppvJs?=
 =?us-ascii?Q?VLBZXDAl2ssV4zCHUkAyoOIN/VL+ZjQE62fArYX1Y+Cw+cPnx5jaSYTC+USw?=
 =?us-ascii?Q?gKXqWok7VPQN9Wj93db4BLEMSgHgyNiSpq53MW1ZyOhoVGOAAwAnMXYWkPVJ?=
 =?us-ascii?Q?XsFxz3zRabF46JXKY/iAWTMg9++mprdpev0w/8GledlYWEXbkvtoLrGUMsTf?=
 =?us-ascii?Q?s7/onnNTaTYYChU2gLL3QksBoeU0ykMb/nZYFkJTf0pq5Xh9BL2YnkmRbUYs?=
 =?us-ascii?Q?07kya8wvSHePeX2/Lh/bxZZ4E41Drb7GvVLrNA0p3qlV1k7d6lMO9qJPptMK?=
 =?us-ascii?Q?jCuR8s7TaJOpSrKZoFwgzaOK+QPt1wG0j2ZNeVVClA6Vq9q4UucK+vA1K31S?=
 =?us-ascii?Q?ZUWHGvsjhMoBbSNtmcxBU8esHaYaY3SY2++YEPJ4Vj3W6raU9vuLhXOUUA1G?=
 =?us-ascii?Q?HNiQaAABRbfbSILGGKgvxwct+VZ6BINVcsUM60P58RipYKLBs6sd0qBRH2HU?=
 =?us-ascii?Q?G0iAEGWHnY+1AJxaSlP1HCDw5IaFBlNFr8CFgJtPStZK+Av9gF4T3nfdBFQX?=
 =?us-ascii?Q?3bwJ1sJ0zTvl1ovjQcwKTZoJqevLSLOIKbQbWsjoJ8AmhwYu3VZn5zlEWUww?=
 =?us-ascii?Q?MIYKqkwc/M8BA5a3+nbGzrMAZfzHFRiLubH1XqaIj7d4bzo4gCChaspukwbh?=
 =?us-ascii?Q?df2stO/rhoxcMhf7zF1AJeDt/xkmQZ5PKNTFXpSaljBIEBKedhzaqYz2dU21?=
 =?us-ascii?Q?CE2EEXpDlZjjB969dT0rFFk55qLW8i5y1CKmlyWg5AcXzbLbF76OQ0D3m65S?=
 =?us-ascii?Q?/HbsELKdDxDYIPznA9W6wSUJ2JUS65/Owcz8z5W73BBpUUaoLGDVQHFfLAU/?=
 =?us-ascii?Q?6mqXYmDlkwnPLHXituWRAlh/6r+wNKcRBgXeeZdWQxDE60JPq4C5iTOzQa+z?=
 =?us-ascii?Q?I04kr5SQJM8Ujbuip3hvlVnXh+rbQClt0fwUoNs2+SgSAGQQ2dYfyiuSxbhL?=
 =?us-ascii?Q?ez1dkd/G3UeUZTj6wkL/4WFfL3SY+C4p0AyMq/DzTOw6PB4s4a+WSx91B+fT?=
 =?us-ascii?Q?6jVo8JQM8PCZeuUgs3GZvSCUM7OwIldJ6TuLRQh+SIJ/TkpGoExgZUvLZiDH?=
 =?us-ascii?Q?R2Kob6RfbRNHlB0h/m4FqKczyCNT+T99EwDk8vU/046sKBUXNffxrDMZmmOi?=
 =?us-ascii?Q?2kCuvr8gg1sqduyLCQbx3wDqOqans0Y33GPNoq8uCMFJLnsgDNSDNdLc2Bu6?=
 =?us-ascii?Q?N4h9b9hmsQShaUN9G4KhvJjrB1VcGVd9LVBhm98qSjIoFXP1bbP9fmRZv2Pe?=
 =?us-ascii?Q?JoiCANLh1wXGyx2Vt/tCbTfDi7krj6MJwKoYi7+iFJSXk6Ft1fBIoJK1R9uF?=
 =?us-ascii?Q?8jzktvaOw+XQjPoSdK2kjWyM6U7Cbu289GIqcwtPiWrDsyGPhurtmusspsdg?=
 =?us-ascii?Q?HqYlcSDgYuYyZCMbOGZ3iZDtAkKnZEMKi/ju7zZrw6Pdy5XYHpjqVVLrVJoX?=
 =?us-ascii?Q?KoNMNjb1YbY5zeSGMCc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072c39cd-f454-43d1-b7bd-08d9d6abe2e0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 15:46:38.6109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7EeWeN4Spfm19JCdZt2swkprcW4NUS7S4FAqDJxNa9/rfw4Vg05QNULKHNGl7m7S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4313
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

--=_MailMate_5420A153-EBD2-46E0-8FD8-CEB2FF89CBBF_=
Content-Type: text/plain

On 12 Jan 2022, at 6:04, David Hildenbrand wrote:

> On 05.01.22 22:47, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> alloc_migration_target() is used by alloc_contig_range() and non-LRU
>> movable compound pages can be migrated. Current code does not allocate the
>> right page size for such pages. Check THP precisely using
>> is_transparent_huge() and add allocation support for non-LRU compound
>> pages.
>
> IIRC, we don't have any non-lru migratable pages that are coumpound
> pages. Read: not used and not supported :)

OK, but nothing prevents one writing a driver that allocates compound
pages and provides address_space->migratepage() and address_space->isolate_page().

Actually, to test this series, I write a kernel module that allocates
an order-10 page, gives it a fake address_space with migratepage() and
isolate_page(), __SetPageMovable() on it, then call alloc_contig_range()
on the page range. Apparently, my kernel module is not supported by
the kernel, thus, I added this patch.

Do you have an alternative test to my kernel module, so that I do not
even need this patch myself?

> Why is this required in the context of this series?

It might not be required. I will drop it.

--
Best Regards,
Yan, Zi

--=_MailMate_5420A153-EBD2-46E0-8FD8-CEB2FF89CBBF_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHgSVwPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK7/0QAIF2G2hfuz3+0j6GJkBur3xoybNPFhNg2Gcp
aVj8Fc6IKrDquJMgcXkmDYDjXeKULxLy4oMNIT530rw5v4Rma066fOXE640kijjG
PbvqEp6s9wUooHLvXZRAX2oBnakoBpzFYDrBbi/KMxAoNbMX8Vy+Z/zmM60rNv2Z
Mq7E8p57Y4Ft2GVSzlYxZI6/0MWN5nuE+rSgRdbWmMqzdx87lToii91fVQ7UAVH4
1/5U8fiwAQ+j4vkecnIRN2dH1vDe6MEAw7aXrI6OOIMb/Dx8mzD++bdStAgZuWyx
BLZJ8Y2bcx87DZp8Xo3vzFdxlG5nOz5g+IHCOuHVB/HEMqn3QcISd0URawdWCW5w
5fA9jYexzCT97cLahaexlte5/X8avkC+fkX2bNP2zyKtagH45akI9EkFbpXKt1Rw
PmFjvd6REEBzXlem75XjHT422DwiWqBbuQAkZKTtCpjlmAXT6cbN9T7WjXKuoSDk
OrkxIs6v1DepeZctNBPe69T0QDcF7EGQg5wmxaNQBzRZswPmpP3Dx3XsU7pLKCna
WpGeFtoDsvlZ/baU1lWgCyk9swQdj3Rba0gfls994/Txa5f7L4W8Lz1NhPg+2s6c
2a7eUMenq2KJrYPSCWqJH5wiI7JvrngLszSEBn+HM5Kk4EynfH5uqlD2y/RbUo3v
+iPRYffj
=88aR
-----END PGP SIGNATURE-----

--=_MailMate_5420A153-EBD2-46E0-8FD8-CEB2FF89CBBF_=--
