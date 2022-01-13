Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F1E48DA42
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 15:58:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZSH30dgRz30Kp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 01:58:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oeEuBSxg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.101.47;
 helo=nam04-mw2-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=oeEuBSxg; 
 dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2047.outbound.protection.outlook.com [40.107.101.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZSGH2pXyz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 01:57:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SFzQ+T2A4jw97G27gDBXBvzIVg0DqveVVkzqRsQmvcf++hFXZi1N8tc+6CfNz2kvWEg0Ch2ug2E8hglKMFZIK+AMlgBdB5Y3QK/JJNgecI16HzYrq2yDd+7iiKzGZBZ4b6ejpk3aSGyWr6aRfOTbZJJtlEnfzpMmLq5DhSzmphIPW0BC4X/Vy+eT+URB2befJxcLE7crZcP9BKVa+J5rRxlVSM3KqpNHArrq2vUcBfS2YfIDuBGaVZeeGQPfHlrw0PAop8RqlSACT5OIhlDmEGI2WPxxL17MIXh//0qQOfc8inm+fGi6FSTSEs3RNZAOtvpDv1rH9CzVok13PlJnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3MDOxmOwdcBx+Q5mcqS+pvsBdqdWAVkku8IKzLKPM8=;
 b=I16zRVz6PKVkFPscFo2eh0GojvF30C30oIz5kI1KxlzXQhIcuWlDmqz9jzTriAV161jewwRtbgpqhdR59wFjpmF8bv1Wp64icX+TqppFg9IlZ69VAh3JL/Bmu688MwAcm/Y78nvCvmhEveSPO/lOYg83I3S/HZRPQWRQRgaY2s5xDYBIcblMCCnvRG9LiTWoZ9Ko6T2KqqrDk5TuyFyYH7T7iHgBRO22huVxO0wS3Q/BL5z82jDp8HtO7CmLdazbn6un69qvyE1UftG6915YwxcbMjd9b725E4QY5PcCyHW7ubosXUMyCeZlvKnhyIsjIma8bDJt/VgPcJEfN5B/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3MDOxmOwdcBx+Q5mcqS+pvsBdqdWAVkku8IKzLKPM8=;
 b=oeEuBSxg0b5QqhgqkpFT+Gn7FXNKb33Ho4wXMde/s9i6n4fHjJVIP/fszdAx28II2YTQx0wZRtTtM8ZB9WfBGrLdSFdcgIxloMeLp6uCDQkjbmWHOPKKpzfceGYw2EA3PtW+28mU0PZK84RGTJP+1oSWiokGiBrQ1P7xuSZHJhKiSZKEd6XdLdgrBrm9RR+EHojOMGhj+n/0hIeQ9TchdpPZIEJrWf7rn9Vp93jqRS6VGfbfaFrbB5+7n2TaXTqvgDv2e2lJ8Pr6AS7v2Ao4oNVpUd67un5HWNhtaLHsN1pbgfpqJ30Zkda8seHTavvDT61hUXNgbRR1LnZHJN/+8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by CH2PR12MB4327.namprd12.prod.outlook.com (2603:10b6:610:7d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Thu, 13 Jan
 2022 14:57:21 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4888.011; Thu, 13 Jan 2022
 14:57:21 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 2/8] mm: compaction: handle non-lru compound pages
 properly in isolate_migratepages_block().
Date: Thu, 13 Jan 2022 09:57:19 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <71108865-5368-4725-AA5A-35A57C350D77@nvidia.com>
In-Reply-To: <a5e029e8-f646-a414-f4f4-ba573171642f@redhat.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-3-zi.yan@sent.com>
 <a5e029e8-f646-a414-f4f4-ba573171642f@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_BA084EF7-8F49-427B-A329-5E14F071473D_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAPR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:208:32a::17) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b95390b-b933-4d19-53b7-08d9d6a5004e
X-MS-TrafficTypeDiagnostic: CH2PR12MB4327:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB43271AAFCEAE76E1D0F04A02C2539@CH2PR12MB4327.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v23XqVRWlw9uClwBc6OPEzJW5v4BAaaW6FYJhhGEb5B52/Zogn7DmbKN1bzUwrwmGSB5YkROvOtxjUh5MQDYrogEQ7Yd10RlRIeiSbtNJpX9wSzQMgkfiyDaheU5uqZjzktrj9LsuJU/K4Qxtt/QL/T+KN/Vf4NxGHgD+AL37TUxDIARPYMYcfIG8R5E+WPe0YT58rQS+EeZ075LqqSY9tUx/Ki+rudbLG0zAfaSa1axGcx8fHkFy2e/dBf/56oloSbfkPKlo2WE+fpeWdZ7C6jmUTlwMe7S9M3O4KIvmXMX5y6qa4Ew3zn3X3I6IVahuBeSRWHzVlvli4JvD+O0JrCN3wDhA8EHwMJsNy3v0v6vsCpIl9Bwh7O46Qn0Qe+0BYJLnQZCMKYSZlFnrP0TpNXiN9w3jEhsaphqf+qNOlc1F9yieMh7WIG3PC+B4E/63nSl658cozPczdC4GcH7NThdVvNgO55v6NZ5Esydq/SW779HSJr6rnra1IdOvDyRa4XkbWU4sXMEVcVDp/JcHjvoivq2oOebjEVqbTv0nRBKnpHSEK6iSeEsbCylN7l+aMmFPGzL98dlCBwva0WzGyfBazuGo2sLzf95a0j/9YMD7aWh3eF2Tc3KPZ5y7npPPMwNoQ2tycXrdB/6nIxuSXLh6ebPpW+RmCn/s0uOs87lfGLY2bNd1IhsNGvH1MJXkBzqyPzhEPj2D2QNQvXWnAG9ODfxFZtqysKYjBndVh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66946007)(54906003)(316002)(2616005)(2906002)(8676002)(66556008)(26005)(6916009)(235185007)(83380400001)(6486002)(7416002)(508600001)(6506007)(4326008)(86362001)(33656002)(38100700002)(186003)(36756003)(21480400003)(5660300002)(6512007)(53546011)(8936002)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Xoq3LOSxiXXrInazAGK3VZCxganp4HOJOMgxGSDR4uNuTI96KcjsIjSm9Vnu?=
 =?us-ascii?Q?PoEwAXx7VxtfORwiX1cVZUCPdKen7ncFdYKHo6/OfTHWQMc3PjgH8IWH0ro7?=
 =?us-ascii?Q?VJc36ghdyYdfMYrPlX5gSlTk4JXxq1zSCDnzTeGVZR+Marg0kGUP3eY4668M?=
 =?us-ascii?Q?v+9bOlkBIViZppO6R9nLljEjbsFDDRHoQirAm19BWC2PXff7aJbeWj/0eDHX?=
 =?us-ascii?Q?EYXse2VBSG2iOtulTjvUjAIRo9VIsbo6fFb69tkMgbR5xzdnIGDNnweFZ++2?=
 =?us-ascii?Q?UmkeTupU80ICpbcWWF0Gv8bs8sGGBkl8sEZ043dMrSH604i2u5KLZ5rhV4fP?=
 =?us-ascii?Q?8GsJqUJyYHZa3Q1RW62cwyQy83l2J2FdEBKUN/gNEL+2baK7PFixS/mxrXm1?=
 =?us-ascii?Q?y3JcESB4fPbejg3PC07L4ew6Nb+tjia/0qOnjIMA4jD6uA5Aaduhzi6Y0vnD?=
 =?us-ascii?Q?ZOEunNmTb4sU5EdnJ+e0qtte/xjdi4SgkRkL7e6y51KwX12VHGaxsEQ8evnr?=
 =?us-ascii?Q?76mJfQVfaKwg7Numu1u02y4omUj/wdBwiSlpMMgXQg9pBAnPZ6k/2XKgVtqf?=
 =?us-ascii?Q?iuBl67aX+YaTOj69KUvZUTCGc8kujYA9yIYi1ClkwtA0QohclW52KtvCXmuY?=
 =?us-ascii?Q?n+9PAXcURGhDL8AoPbZWR9Y0/rDSlq7B/xuZEjbFCs9xeARcoNhAdntDyYv0?=
 =?us-ascii?Q?frKfQmHHn/ymVhJtyxd9jSFVJ5cIMAdgfn1tnM0e5PzzXFVxvZd54TZ/PcF8?=
 =?us-ascii?Q?8oth5lkEYzo+gfaA80p4VbTM94nPEkBMmcCGpS1x6oYbCXxMNS1lTRuN8w49?=
 =?us-ascii?Q?o2YxponfQXNWeY0L37WQvBGC7DJGB6k+JcCHBj/Cc/Q2ClsHC6/Sx6upRCac?=
 =?us-ascii?Q?1eqc1AGCsu97f9ePFfTzP7v0WYHYuoO0uPV7GJjVb4UHSppuQFDnak70SCnW?=
 =?us-ascii?Q?O5Dbhd4lCktv8wpMopbJIWaFj6sORjrqGpOeHZ7fJZ/AHIm7OH8927HzLM1r?=
 =?us-ascii?Q?TU2dUnNiTheMzwT2Rn/ns20gbmpPwhbVeis1ain+KcB+GfEHwublSxEY2xyo?=
 =?us-ascii?Q?BtUn35tkK0b4RsYmiHacjjZng7Viz8cUQC3iSfdykh4IHtkgJlMSGJJj1MF/?=
 =?us-ascii?Q?QuQCkOtYFGedZ8Hf4CcFuJucYv3vUlQ4/Cvi0KQRKRCz9y8gqlQUJEK2wKE3?=
 =?us-ascii?Q?HxMPXWnAC1CGRj8fI1QuQxBRI3jWdb8a5wxeET4e0VGdkHM9EtCaY44ZAeaE?=
 =?us-ascii?Q?8Cxwz83mGEMQIZa+RJuYggF6B9pUHmbI27jQ3E7xraAbTnC2LIR3Jmmphw7j?=
 =?us-ascii?Q?iu3rF2Nu7/DZM2FqIPfs/oYXPk7c0A4Q/3YiDymEdCSzxmwu23D9R/BzrbWw?=
 =?us-ascii?Q?XVAnxbguK8fn/xR1ZUO1YzLnqxcPWEb/gFeCgTSgx84mBq3iiiTcwQ/xLaM9?=
 =?us-ascii?Q?9kTYjlFJq8fzZbc0SIfyfgyG6gK72H32UcnrlLH5P6nuQT4sf0BM00R16hA5?=
 =?us-ascii?Q?r/Y89iUjhrCUjWrcn1OrFpAWBgr86vnyM0LP7LxE7MA/V9giiR2EwtlISvo1?=
 =?us-ascii?Q?0bfSfLaJZ+Yqt9FmVp0=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b95390b-b933-4d19-53b7-08d9d6a5004e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2022 14:57:21.4279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkqAqCmpDq0SueC42kfB1QBPf3kZ1ZkHXiU/sScXRtdQc4oQ4NoN+/Bj4doIR6BL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4327
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

--=_MailMate_BA084EF7-8F49-427B-A329-5E14F071473D_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 12 Jan 2022, at 6:01, David Hildenbrand wrote:

> On 05.01.22 22:47, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> In isolate_migratepages_block(), a !PageLRU tail page can be encounter=
ed
>> when the page is larger than a pageblock. Use compound head page for t=
he
>> checks inside and skip the entire compound page when isolation succeed=
s.
>>
>
> This will currently never happen, due to the way we always isolate
> MAX_ORDER -1 ranges, correct?

You are right.

>
> Better note that in the patch description, because currently it reads
> like it's an actual fix "can be encountered".
>

Will do. This is a preparation patch for the upcoming commits.


>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  mm/compaction.c | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index b4e94cda3019..ad9053fbbe06 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -979,19 +979,23 @@ isolate_migratepages_block(struct compact_contro=
l *cc, unsigned long low_pfn,
>>  		 * Skip any other type of page
>>  		 */
>>  		if (!PageLRU(page)) {
>> +			struct page *head =3D compound_head(page);
>>  			/*
>>  			 * __PageMovable can return false positive so we need
>>  			 * to verify it under page_lock.
>>  			 */
>> -			if (unlikely(__PageMovable(page)) &&
>> -					!PageIsolated(page)) {
>> +			if (unlikely(__PageMovable(head)) &&
>> +					!PageIsolated(head)) {
>>  				if (locked) {
>>  					unlock_page_lruvec_irqrestore(locked, flags);
>>  					locked =3D NULL;
>>  				}
>>
>> -				if (!isolate_movable_page(page, isolate_mode))
>> +				if (!isolate_movable_page(head, isolate_mode)) {
>> +					low_pfn +=3D (1 << compound_order(head)) - 1 - (page - head);
>> +					page =3D head;
>>  					goto isolate_success;
>> +				}
>>  			}
>>
>>  			goto isolate_fail;
>
>
> -- =

> Thanks,
>
> David / dhildenb


--
Best Regards,
Yan, Zi

--=_MailMate_BA084EF7-8F49-427B-A329-5E14F071473D_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHgPc8PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKyHQP/iWvPT4lj+TNQb291Ozfkz7dwHHHfZmK2V0f
08Qhlyn2PGaOHUfkzKeiBi26VSSjhjqnmxux0WVB5Nbkigy7gVhm+tp+Udlk87g2
xut+k/7O8ClA1GE2AQs4u3jK86pr1g5zqc5cf93YUpVP5locItAexGpN9cW4sxNs
vEcwAWftvPTKhE79tW4iwoOPo+glzZulO5B5sBGeLvkZ1XKvbif0s0Z122BuzMPn
2vvkD1cM6Q098wNbGCUriLu5jmUhSxZ9HhKAFTSbQw6Iz2mGrrkhW4zn8/oO1YRS
UfORSAcfqyyfedTm3bJsG8H4U0/FIOXh9fyS+LsiO/H6b89xQzCfGyU3Q9+JW6pT
ZfqW/rih92zzyFz/YoN1LIJez6gy9vrpLI1C9NZ6eM+fkHt9CZStFePpHCnrpM8I
7JmaAbp+jEo/lq3RxvTeyEpEp80XLE45K5eiKEQOwb2O+W142IbfsJ/lTrdCqzQ/
olsbw/O/wQ9kauv0uRYSyfdLKAFrib+TXrVl1OsHNQTxpH+OPdnG8ij+RtixcPw8
F47IcAvirMeOcuizV+mWGIOZ5+FnKfjqKAWSbIJ6mB8Fp59FTagLH7pSW5TrRDEv
ONt/9abtWevRYqLMdyNmkXDZ0yP8tbwz653J8xVaJCnBHPYaHiq96yrYgittogHR
uvofxgp6
=on9X
-----END PGP SIGNATURE-----

--=_MailMate_BA084EF7-8F49-427B-A329-5E14F071473D_=--
