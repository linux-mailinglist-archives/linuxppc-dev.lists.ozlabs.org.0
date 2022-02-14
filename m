Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E50D4B5952
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 19:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyBxC197Gz3cN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 05:06:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=saj6/OYr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5b::600;
 helo=nam12-bn8-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=saj6/OYr; 
 dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5b::600])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyBwN5D7Gz3bbG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 05:05:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRjVLdQcb4bIvJoDONPtohzy/Lg8LS8oAuVpu/jJTAa5qUDO1dAKwcaz1jt6rbUiURz2kH77cugUTUW2NBnKKOoBtJWy2E3BgIOL3Em0kBHgY41exsUDWUgVmKd+1CUm/FwBCAVo6gRSW1v8KfXtCu9+81lT/v/W6QSnAZNP3lbMskCb7OuK3NHTV2Pq14koec/V6Adfl8mWaco8jxR6moZ2rXMzUEMQNJy2BgPb8uM4w2Lfybaxlyqs7PKjw7f9Rxos607ovGqApUILi7tmjks9hjRgk5MJsDL2blmQItq1M/lusKDigXH1vqYHtlKErjJIxhrepqC34caqCTr5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDqRPe5JWIosiyBGJnr9jCAfa96tzCK2FopIl7wEoc4=;
 b=bEllzGDXw+65YATMgeBi1hatrybl+qHed5puLRleeGlsMglw2CYNReG1MSFA21WLkSLSAFMSrfoRBZUGYHVt6Og3HGUAyO2OgruhaBzDbi4Y1tD+vbacWkIaHwJEbU4E7qc44vBKjG0wqPWniLmiP1XupJ8rYqruOF3wHcn5oXpMHDtnXuQW69QmN/+iD9edce7jEPPEq/sqCQ+3L/EH8YOdV88P5mwpo0Q/6NpD5uAlZFA/WTjYRWSZh383hNVKRwGZYiJvohy19wRNvZqQYVacA7ynfeYmAm6NFS+KdfUHVE5IfTlpcMIN9wqXFI1BTFEqm9eUZ9Hr+QVvf18OXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oDqRPe5JWIosiyBGJnr9jCAfa96tzCK2FopIl7wEoc4=;
 b=saj6/OYr99s37MEk4dZw/ve8RRKB2WZxJ73vhvFK8giAH07YUBj2d42CvShnGN4/YicSrjs/e/hFaBTr/VWW+V2fA5/icrEw6DlvsPf/WzFyXjLii5eTHXHBzLqqPcFTH8HYp60E0Q9dNTZYayYUAy48WP+xCpj4/5HZOSnQAL6zPGQoNMNhFNbgGyVSr/2ow5RZ2lmCZRP/BOrvhfCaSGgZzBV3PGleygw7lpFQHnBta2sfEfW5SOEJjwlf85OIf/mHIUows85KR7OWWufhBxDvWw5DuPPQ8IjEZ6bXoGWTNlA14KqDMy3UdDSEPPhs1yDnEKs+RjIO2we4KrgsGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by DM6PR12MB3803.namprd12.prod.outlook.com (2603:10b6:5:1ce::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 18:05:18 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 18:05:18 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] mm: enforce pageblock_order < MAX_ORDER
Date: Mon, 14 Feb 2022 13:05:16 -0500
X-Mailer: MailMate (1.14r5869)
Message-ID: <CBC1765F-6E95-45BB-8071-3574ED2E6EF4@nvidia.com>
In-Reply-To: <20220214174132.219303-3-david@redhat.com>
References: <20220214174132.219303-1-david@redhat.com>
 <20220214174132.219303-3-david@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_52C0766F-C3EF-48B0-B542-8703D600332F_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR08CA0017.namprd08.prod.outlook.com
 (2603:10b6:208:239::22) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1bedac8c-7c7e-45d7-c932-08d9efe48f51
X-MS-TrafficTypeDiagnostic: DM6PR12MB3803:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3803CD75B1B34562D75EFFB8C2339@DM6PR12MB3803.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sy1xdGBZQNi90JtNXQCBBrSz4Zp1xnaa5FNpv0/b0Wv+Oa5PyZ65kG8soDmzZToQ/0U503dvkZpYYGV60mZb1zaHgao+XNCa9V5KTG9VdHwI/3Hh/g5QIg0EEWw/ffcR38wtwjcgy2zq+riC6SGQkI5A5WGJPOF24ATDaeZMVl8pWTHZcSNesCZaNp5swdXc8WWSf7TsNn1SoK5vYz1O4qs4+8VLAw3HkiZJzDmx18iGSOKItl8ChCBejn7Rqm375yJ8aEFIu1tSJYYM0Qt2t+/tbVPUEZA4SSQRPEYUCOwXuPu2uz5y9A1BZ0ncu8R8tb0orTzcKxRmmuZQS95Ttjcw6d+CTW88UAtMJ79+BCSxfH65uW69hdVO521oHc+Yr2omZTad8fNhOX/Jyr3LLPqWRkAXbFKHMaRV4ZWqPsQor+866C9K+W5APLhCjP1ODt8NwXuqJXYGneWmD5DI0kh+lIzM//X3HImS4o5NfYrlElQIeakghn95GTmxPeFTgbAS399cgST59vzj5dhJu/PqjV05MAJqHNhugavN1o513BQC9ZJlqdjdmDFSVFjYFTS2byDWkgdPh85Dy8riTgC3o4eJCEVZsKJ8uaa+qFzoHf21FP0r/jas/l1UdQTFfoqyiWJ2LjlE8+CmfiOheN7V7OzG4w223lquV6nyfHj4UKQye7ffNH233pngY8ivmVOJGxjNrw0z80hfMtvG3oMHxGx5+NItQIvDz/bf4/b9O87tEm8wb+ESOnAac4k8HiloGkDBw10bft673fOzUFNaS5Srz+sdS/kUi0TW86pKFyF7n3TDQFEvrA3zPBgF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(26005)(2906002)(7416002)(186003)(5660300002)(316002)(235185007)(86362001)(33656002)(966005)(6916009)(2616005)(83380400001)(4326008)(54906003)(6486002)(8676002)(8936002)(66476007)(66946007)(66556008)(508600001)(6506007)(38100700002)(6512007)(21480400003)(36756003)(53546011)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6xLw9nbY2R8W8ftb+YVl56Agx3I8AH9vAs3SWqSE6+y4aMGWSAn5Enbm1EH?=
 =?us-ascii?Q?3OcASxnYYtpWTsaaN5FhSMkVDatuHKv6NPdFCthcY5bmQfsgnwHlO2T2NGYU?=
 =?us-ascii?Q?F7YPsfNyNqY0V/7IBQlyvNthl4N29SiM+uEEu+gp0wiJVRWbGq6JSZB7HIK2?=
 =?us-ascii?Q?pdEe9o18cdHulz5xTCs7VQppxDCsntoVkczMF5KbtwHzaryT1pVm4JV/kYMT?=
 =?us-ascii?Q?EQZ8CtNVbORPiCRTwV7Z5ZJfiha1iGsTNjkHhnb3ZPgH6WLjbzBtC9Ajcy6Z?=
 =?us-ascii?Q?wIJPKkbe9uqyEFhP05sRpocTgT+FYYeZYxuu8u3n4Kf2LqBnXwoBG320YpOS?=
 =?us-ascii?Q?luTStwvAHEpi1VNO2V/XYSRgDLdIcex5k2/jc38pca/W4EDJeMUZHCZelTJy?=
 =?us-ascii?Q?mx2gPqUhOV6G/gjfiGZRgOdc7aUrU2oIGTrPx4RqE3RCCp9JEpLikkqSQJ6o?=
 =?us-ascii?Q?5Dnxy6j0OUa5eBoc2eywin+4K8xmt1ygyynEjDGUi0byVYQjSTM7TdJYzJGV?=
 =?us-ascii?Q?K5EtrO9YQNlz2sVfLGAFdKYPy2EYmrrZ8BJogs/XrqQLq7iRfIFkYGAZvchg?=
 =?us-ascii?Q?C3PX+cjNTyEBF5HXvxNnAm424B6mPrl/aB4u8/k671MgsKpEdSdld5hBtf3C?=
 =?us-ascii?Q?oficyRRbV+8VTMRNx9zM+7hMTMgB8eAW3uBu9D2HBZYVmYEgDOW5nEf2jEHN?=
 =?us-ascii?Q?xohCuLIRSrK39MaX+FGoqJzYlfrBuF5F4jVs6YnZzLAQx/JRFXAmhUVNRlFt?=
 =?us-ascii?Q?z7UXe39I2Pya9ygNXj7fqYcS+jcjv8ug36Qgs9eu/iXJ+ViG2pYxWEQ/VdLW?=
 =?us-ascii?Q?xx57BUpLoMCpVoiEcvCxENSW2yuCaVXfVY6EojBGEa4AsKgLmJtUp2BeTPru?=
 =?us-ascii?Q?nzbcQdIZDNNhPTrmKw16F6hMITg5KVOlp3kyT/qyZTdinjc+xYQJAs9qWYNU?=
 =?us-ascii?Q?LP3Z5Btd0cLrH2Xzy0Bhg5xZFa08Zo0CQAyPOetsThU8opHoIxBlR4JGSdM0?=
 =?us-ascii?Q?2PoVpGJc9ECNTyyGKTAZ88hyLK7g1xw5lKgOizLKuqO9FNkI5IQrdj9zBc2o?=
 =?us-ascii?Q?lThMIgOZHBvXPfFW3T7dZHUYOQ/zMiCvUNXOQjRjzoFDWIV5Qd622rQ1FYKM?=
 =?us-ascii?Q?qPJ5/5iN/il5YZ9oNIrGaHU7C4Yrv4EyeoXX1pYFVFvi3N0oX774VS1Py0Xo?=
 =?us-ascii?Q?J9Oc1FJtR7bfEkoB1mG9Q9akV7Nq1gZOCMFfKmkB9yJDizPuHc9AjiKSJst8?=
 =?us-ascii?Q?M4S75f4Q7kLsIc/igYkcb5FhvHrT+vjw/bGvkn4A0KcU0t6f6WmdKB9kEtTi?=
 =?us-ascii?Q?/VYmwfMiJgEnGJsoHhd/D5JVssKquI/sj0zEzrcLUnzqcg95ntP0KZc1nLPy?=
 =?us-ascii?Q?IvkJsONA+oNNkKYhUal00JW6ZywgJhYtG1e5ygUfRNCQltCBwyVD4vAvPUku?=
 =?us-ascii?Q?XpllD4HYy3CNhD4hYcrifz9Zkry2679qcNEGi/BTCQ4Kil5J2szaI9Vv6X0j?=
 =?us-ascii?Q?bmUo3SYNCECNK4afOGFd/e+FHBVx7MqTO7YBCe2nuwa6uNAOd8s72aoFytz2?=
 =?us-ascii?Q?CYxz+JrAf6sASkCmyA8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bedac8c-7c7e-45d7-c932-08d9efe48f51
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 18:05:18.7125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 37zSVIGHd3M6bTHy67CMXdOvsNscyJW2RyrfG6dpvKmq11mADqnYDTNIOdA4ycK7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3803
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
Cc: devicetree@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Robin Murphy <robin.murphy@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Frank Rowand <frowand.list@gmail.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_52C0766F-C3EF-48B0-B542-8703D600332F_=
Content-Type: text/plain

On 14 Feb 2022, at 12:41, David Hildenbrand wrote:

> Some places in the kernel don't really expect pageblock_order >=
> MAX_ORDER, and it looks like this is only possible in corner cases:
>
> 1) CONFIG_DEFERRED_STRUCT_PAGE_INIT we'll end up freeing pageblock_order
>    pages via __free_pages_core(), which cannot possibly work.
>
> 2) find_zone_movable_pfns_for_nodes() will roundup the ZONE_MOVABLE
>    start PFN to MAX_ORDER_NR_PAGES. Consequently with a bigger
>    pageblock_order, we could have a single pageblock partially managed by
>    two zones.
>
> 3) compaction code runs into __fragmentation_index() with order
>    >= MAX_ORDER, when checking WARN_ON_ONCE(order >= MAX_ORDER). [1]
>
> 4) mm/page_reporting.c won't be reporting any pages with default
>    page_reporting_order == pageblock_order, as we'll be skipping the
>    reporting loop inside page_reporting_process_zone().
>
> 5) __rmqueue_fallback() will never be able to steal with
>    ALLOC_NOFRAGMENT.
>
> pageblock_order >= MAX_ORDER is weird either way: it's a pure
> optimization for making alloc_contig_range(), as used for allcoation of
> gigantic pages, a little more reliable to succeed. However, if there is
> demand for somewhat reliable allocation of gigantic pages, affected setups
> should be using CMA or boottime allocations instead.
>
> So let's make sure that pageblock_order < MAX_ORDER and simplify.
>
> [1] https://lkml.kernel.org/r/87r189a2ks.fsf@linux.ibm.com
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/virtio/virtio_mem.c     |  9 +++------
>  include/linux/cma.h             |  3 +--
>  include/linux/pageblock-flags.h |  7 +++++--
>  mm/Kconfig                      |  3 +++
>  mm/page_alloc.c                 | 32 ++++++++------------------------
>  5 files changed, 20 insertions(+), 34 deletions(-)

LGTM. Thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

--=_MailMate_52C0766F-C3EF-48B0-B542-8703D600332F_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmIKmd0PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKTQsP/3r4RQN9p3Adw1F3G0GqaM6LEe8yaHYCK2oz
FOut1UAs6kTQh71FZ2jwLKIDt8oc2XQF0+2YecquqI+x8l1oWrymuElKoAjO1Qiy
/xIbLrmnV4GzVFrd802gbQpG/xiIp4GYZMXewwtuJtjyqmF2OL0xyObG61Lp6ZML
u5WUJ7TzWTmwT0zNeGbkZ4Q1twhzE2kQWFRhEV/rwwFwi3Eua3FANtS+ADQXaCZ7
kM57KetvtaWlt7TrHn6camKeC4EDrNVb9LKDj2chGvvfIxl6kMuxgWBKbFtQHF9z
CwkaTZNuAAqWbrVe+6mgKtE+9mtNDpkptgp0zGCuoMnzEm77FiudQoms2gsYDZ9w
KhT9Semmg7KuoIoxa0qWTc7GiB7/y4YIKOB0hPPQYnlpduau4KkysanRoQxsQ5mf
oxCyvS4mu5quPzY0qsvVdMtE81K6tmpzDxYu27Qaj6sRnPy3ct/5b2gakoBoYOk5
wHRXXe+0L0eFfg1C74KFTMJ4j7aWZzKK91CAxuVV9AoiNgu0qeaRebzbgxAPagos
9dp1q/Wt3P/In2kdBK1yIT4TafT6qKLk+9MgpjKRyXYWKJO17x04YbnlGethojzF
YrJR8b2ib9ZsuHye1KLoqKx0LFArqXNapwygekbcjN2wp/nyQuWbNGmzzmsLctrm
H3AT2+DP
=Pxl+
-----END PGP SIGNATURE-----

--=_MailMate_52C0766F-C3EF-48B0-B542-8703D600332F_=--
