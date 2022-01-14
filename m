Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC1F48EC62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 16:16:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb4dp4DWmz3bbC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 02:16:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=JO2YlFJm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.92.45;
 helo=nam10-bn7-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=JO2YlFJm; 
 dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2045.outbound.protection.outlook.com [40.107.92.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb4cf2Qchz3bZb
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 02:15:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TA2qNpuU9PuUmqmYrS9kTwgqW5XzYf7y3hWKU6Rtkxehpx5JIxcqO7VQQztI6m3QDHhzBemiyIsIRf/WfyuUNTKadKHdmZNfZztj82bKZ7y5XJnlkFNoppn/fUOykgJq4wHAlX3Qx2QOghLhWjwqMUL3YjMDHseVV8eqHuZJ20M0O7PYj+StyZT7Q3mRqpgWneHZbA7ReMKFc4ubhLnS7+pWw/Wbj3OSllO3CscjRMI6hMB4ZTMHM2HZ1aUnlW9P9sXkWBvQS2PJIvEehRuvUPYgVpr3mT+Up3Gv/Lh7X6SSs4sCj50RO+GPGd8wMa3MXNlzTOZHQhFnrOXzTb2RMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ks5QtkzLF/4RgmW1WDyADIc8xUV6vXyMMmEvuZGqSwc=;
 b=Kd2tuYFLUSsfA5QjX93JAX9htJQPH2j7fgEdr5Dz2e2sb8QJI6SZhVLK5O8L5YuTetYipGyZheaLmD2UIGijyMklHylVXOvxlxj6Gy5BF/bHeKjMhVDb/LQXC0IhayVAY2YlK9W6z9fiaPEFdErO5sIRppHvV++w1zraqi+D6dpPSpgLJEofguuEZOACLNU8F7+C8NRGy8woV4DMTP0AcJ0SlQ69cb3z1nc9nIJNua+X/QAeM6YNg3i6UJ6d3YZBTz9D3CZnxCz5vfyvTSlvmp+08LnxDCb74jnIb99uGlHG9RH/PnYb9Q7GVjxQOaSH8/SqgMb0uMEpQJFdVMoIYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ks5QtkzLF/4RgmW1WDyADIc8xUV6vXyMMmEvuZGqSwc=;
 b=JO2YlFJmlWnILD4EDfrevAb9It8ZYGxjUnWSz45Eg+pNdbMQSqI6Gxm3tqpVR1FLWwNxuzeRd8N89L5N1rvOHW+u2DKq0+5kLavGCy+n9TuJu8FOAzHy/gr9lQtV2S+41kAEHqJ2Eg/w9fiXeSwHqzXc5IpE3S5NhfzGTiBoTMwvbRKaGlYNwY994m3sSEZtvJM/lm6Yx0n1twNTvc2Qf8BrqiaWDZFfyYQgILOC6IMiH8dtpp6hT4VWxm8O+YRihhcMgdJUGZ8V9bL2Ij/2yYJTcBfYnCRE7i/ZTcAH9FIaA5xAR0xp/XK/YT/KrH5eH9OQ0q5ok0ecFI0F1cZ0DQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by BL1PR12MB5078.namprd12.prod.outlook.com (2603:10b6:208:313::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 15:15:27 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 15:15:27 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 7/8] drivers: virtio_mem: use pageblock size as the
 minimum virtio_mem size.
Date: Fri, 14 Jan 2022 10:15:25 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <FC7DE076-4FB5-44ED-9A57-9112136AE2AC@nvidia.com>
In-Reply-To: <60778775-b5f5-0837-092f-9911cec84854@redhat.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-8-zi.yan@sent.com>
 <60778775-b5f5-0837-092f-9911cec84854@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_C438F204-3693-4696-9E76-A1C6EFF005F6_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0426.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::11) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc722e2b-0a17-4ffb-60ea-08d9d770b1f1
X-MS-TrafficTypeDiagnostic: BL1PR12MB5078:EE_
X-Microsoft-Antispam-PRVS: <BL1PR12MB5078021DF4A0EF94C652634BC2549@BL1PR12MB5078.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cpdx5Y9PBg8fnb+wqAnL3kUd1q4Xl33sMWFzlZFc9+WJGxAWWFgobINeif0zL7saCuD7EerJAFNLChd7xLU6jxrlUlpnMUQpCCaUJElTbbXYSsVpffSg0SNifrn+cuGCAIYbCUm0XRGfT9CgrRLc9/DB/FPXb4lf+7DORx5oDKhJ7N2kQJ5Cww8owgiGnpX5wyYHSs6LqDgm0lhBtKdkf5NmU+us1PVh+N2n79vzFtNZOyCAUXxJWSznuuNqd4wrPVzNYh/kHoySaegw+V0/+i2vtuYmgoPo2hNC6bud4QDpNpYuR5zfIekOQbPsaU2Fm/XoRVQ2nUoz6lndvIPy1ijbsaDYK4VeWvZYX5Ip9vSQjR6vZrBtLpLoQ39sA8PE4Spg7gGGxcY0cnieWdAvEyBprpUCA2wlrKmnQAG+ADZuADfYSrJ5nEHLtTQSsrwHjDiJkfn0pH1Bgm2z9Nr9ePdXuUOR8hfRav+HWgQG4jVGrp+WkVFBK6Fo1sAK8zDiNklwjGGQHxAU908+pNT+pxOty3ewT987okn+9QfOmbkMEO4nD6x04+Oui+haJ+FfxzXhjbufWh130xVgiOoc0U04yKUChoI9yNEe5RZrFFFyzsH9KBFv/wrdZmp60sS8EvP7/eQkdSZVUauoS/ktaVoPJ36OYDaSIMvHBc6XFhM1A2i+QacF1TFQvO3jNiFJXs+zod37musz2AzgRtAMiw58+YoPY7sMZg5aPsvZJs8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66946007)(66556008)(7416002)(508600001)(316002)(235185007)(6916009)(2616005)(8676002)(8936002)(54906003)(5660300002)(66476007)(36756003)(26005)(38100700002)(21480400003)(83380400001)(2906002)(86362001)(33656002)(6506007)(53546011)(4326008)(186003)(6512007)(6486002)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/FUHBoOzcZ59htlqJc/G+sDElTtrz8gX5pCDUP0Kmt2HAYIO72B6z+pkNVc9?=
 =?us-ascii?Q?H2WRcIN6PqT4j2/N4l5GDiN4KDrzlIzLcM5+Om1bgmetPmgjxrmdmCCSZlcS?=
 =?us-ascii?Q?QEih8q7SCMi0MZl8O9L7IfuZOsRqpNTzqi7m9BXzL6Y4uwMguyPDc2NV4apw?=
 =?us-ascii?Q?EumtDVUuUB6h/ihPU/B+BF7L2OXcI2wgm6V+xWPYtx/X+V1n9YNYcbk95M8Q?=
 =?us-ascii?Q?ItpKcySTqG1hbqzfcaxoC59ejZh2ED0mosmOZMzlUEjLJkGjyvz7PGPyS5mw?=
 =?us-ascii?Q?82Eb9AjYVCaIqqzfouZ9kRpbm+h1RqTVV5ExxbAtrjkOL/RDYjuzGdbftvWL?=
 =?us-ascii?Q?i+qXZwO/e199TlfNHV7go+aqnAfHHvt1+Ze3H9YSWYF2zhBTcJR32cGvcnju?=
 =?us-ascii?Q?FGEmHH/7zBj+NGX4LYRUJTFdhCtkiSFnyynNbxGcd1NI6a4zVGrwBm566U/7?=
 =?us-ascii?Q?j2G1yPrz9u3NX6iw0uUb3ZlJ77dAyYEmHKxCKgGpT46T9ZD7E9OzsKbPBjWu?=
 =?us-ascii?Q?3vmMclXCWjHToHX1/Pw7yeI/th/YVjKkSLKhvq8c3FP3NJ0mpte5XFnc49cy?=
 =?us-ascii?Q?k5203+Zbd8sHFlvVZ9i4VWxoiSutzVcfmozNaEbMtfpoVn7yDX9TWW47L0hl?=
 =?us-ascii?Q?m4WxPGcWVjfT+/M/7iVxfMu2u1I6emoholoEN0WurpFaEaBPx19LGAFzHm/l?=
 =?us-ascii?Q?07W+pPmLvzJ8Je9swSXIYQpCp6uaXtvXpO0YDG3sN3MUUBMlnAnSE99YHJc2?=
 =?us-ascii?Q?4G2UL4NxlQWmE5oNZctJEDqYVXya/At6hCr/pJPJOZlv/lRO/ajI9mCSUePw?=
 =?us-ascii?Q?3CUOXEkLr2cbqUefwjpUHktER6FGbIq35WymmL8wP1sg1Qzogo4mE71v8YtP?=
 =?us-ascii?Q?9ivzkDQaB/2s3vMYU5NiHwDCUy6r0/sS/Y9E7diVkMVGky9KoqxJW8bnJu66?=
 =?us-ascii?Q?RRlzwuN/zGAhJUk/bXykQsYxqxN0d/WYgAORk3p8Ga37ozGLEjhJ4PllecrE?=
 =?us-ascii?Q?sTFU0/3OPkYh+pr0VBXGNjvDNhwmDEtghTMaXkO5vCGpSdk1kEcNzScAkzS3?=
 =?us-ascii?Q?w8rPdqEXb+nb09RQnehGR7S5lyD+Ei/7MYptA8T3hIPNY5CDef+6S1HpllyW?=
 =?us-ascii?Q?BULgdcsM8AYtVXi5x0T0SnOE/2v8CLx9ZLRN6AbvDKxkiQp1fbxbXfyz43JS?=
 =?us-ascii?Q?em5dTEGZgdfpSVd9FkvCO4pWJvra3MTN83Y0hlvCDj+OX8U6bLHmtMb0Ew91?=
 =?us-ascii?Q?BiInNGx16uHkgmIfmStQz35dylggaMmZTDFWP49VOdl9ZyHnEwldRgYE3TL6?=
 =?us-ascii?Q?MfbZp79ibQvg8VyYyvavIT7z5LldCG1h+TydlF1wK01J3jpXsH/FU2MrXPAQ?=
 =?us-ascii?Q?xpXQ5Ro1wyQk3Kh8ZxhA8znNahSX+W8uebjPfCPkTV+JiCOdbN35g60tY9qv?=
 =?us-ascii?Q?Z2zYmSogTsU6TwvQYWKlZ2Ze1kY7sceYjG00jAVliXI24dKY0Qnx3ekITtqC?=
 =?us-ascii?Q?VAAj5ZgrmCr+F0/PQ0Z34ci9AqAArD/+0J5q5daS+oAet/THx0MbbxKGTMCV?=
 =?us-ascii?Q?dvb0H2uJaTOb9QZlKrY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc722e2b-0a17-4ffb-60ea-08d9d770b1f1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:15:27.2737 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EIGrIAwuQRBHYKoxZn8zJ6QaeR2lWQdZT9SvpqzAjh1/N28jjouGBEjHQhXz5/qU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5078
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

--=_MailMate_C438F204-3693-4696-9E76-A1C6EFF005F6_=
Content-Type: text/plain

On 14 Jan 2022, at 8:44, David Hildenbrand wrote:

> On 05.01.22 22:47, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> alloc_contig_range() now only needs to be aligned to pageblock_order,
>> drop virtio_mem size requirement that it needs to be the max of
>> pageblock_order and MAX_ORDER.
>>
>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>> ---
>>  drivers/virtio/virtio_mem.c | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
>> index a6a78685cfbe..2664dc16d0f9 100644
>> --- a/drivers/virtio/virtio_mem.c
>> +++ b/drivers/virtio/virtio_mem.c
>> @@ -2481,8 +2481,7 @@ static int virtio_mem_init_hotplug(struct virtio_mem *vm)
>>  	 * - Is required for now for alloc_contig_range() to work reliably -
>>  	 *   it doesn't properly handle smaller granularity on ZONE_NORMAL.
>>  	 */
>
> Please also update this comment.

No problem. Thanks for pointing this out.


--
Best Regards,
Yan, Zi

--=_MailMate_C438F204-3693-4696-9E76-A1C6EFF005F6_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHhk40PHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKSkEP/jaAvAcYFO5gI5Q7dXBn9mlVUbq0RjRXMjbq
FPo6FfBH+UZjHfjq3MrkPdlPjBOMc0Tgat5mQJRWPI4sKn2FuycNv1cy5H+jA/0+
P28LCSaYfKzBIW8BOeBtNvCeYkpKEudmzNacWH9TFkZUyB4ML9Ny3VqqNbHWDXXQ
saQ+ICJ4m1S9AfcaWI+6j8zR1JL6BKhzcb1qzvwgAbjeggd2D6IgDBESUn3FA8u6
HVCWcdyoIbaH7/mJYhRwoBY1Kce8fQBfhPwcylJqWQQDg/aWeDFYAG46x8VlX/y1
F/vrvziyB5VhSKYdYMV9Zwe2p2IP0cfJ09+zjqMLMfAey7fx8vDqr3OJ2n+AvNQ1
+wM7pLvWr/gMoHcbjan0Mve72ZjNMc/531gXzGLitfZoFMGD3L64hQbvoNb4fUJt
ulrNQWvLpRNxRSUo6EqpGeClQKyeQYyenCO/nESKTuEwLAJbtAvQ3TE0wxRcWYAW
XgsGVchFB3bzOXRlJ6lFLKvjbXeDh7Xw+lbUp5+eKeMzsdEi25ekGYNtLyRH4koC
C7xlY67JMTlnoG0LW94+QKm3PS4n4QuyLjYEvQe0j7FQGZuWlF+FxT/kIGiCG5CS
K3Tw5j3OuxDGE6Ywlw3gpJbi7zTvlnQh75zU4XWcEJg6RNxb0C9R+G2v++Fr2qdv
I+5DtVna
=xKpA
-----END PGP SIGNATURE-----

--=_MailMate_C438F204-3693-4696-9E76-A1C6EFF005F6_=--
