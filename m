Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0AB4B5521
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 16:47:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy7sG1RBqz3bcj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 02:47:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ItVeSVN7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e83::622;
 helo=nam02-dm3-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=ItVeSVN7; 
 dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e83::622])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy7rS6S9bz3bXR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 02:47:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMKS2+tlQUrSL2Kj5qZjGxbpwq1zLNEQmMaHfMBcJy2L21Q4NXtqMJ4cDsLMydz65+ChUxkVuuLzhccdzXBc7BQkGE9NxicGve8Of9vYzosLYfxWRis79hLwrOS6ctSpC7N1igSTGJ6/7F89qcqwiFpsKLEqP0DBUg/1ZruCVO/hD54tkJ21Bh9CvsDIlR+KUZ6IugrKQ/ASIjg8QcmaHo45dMeOdmQZKR47kKhImGuzH+g/rFAvpZn2PBnlNyM2iJNudlRIuQjoAZpI8z3vmId6fsOwklEHqxlHcBJtH8TqZeN+hdxVBAceGErNMs6M/jG96CFip4PqYrrumlzATg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bD/r7dQDDGCi56LVUBpUB3spun/5YlvXCT1jS6YL3W4=;
 b=iWxZc6Tn4YJxQn25J7HJvCgxLnQR5USuu9gscYVLsiUHX9Yp9/6iWUg9nJH6bduQ7zrPb4REBl7IQESR2CaphGoZUnqF8RBh8rv28/vEGwzLTIt+gRPXUN+uLil6tlYDlJ8gi5zuABD5oo4bYSA98OifwYNn74nk6RC1ze5N219H4SqU4WttiTXM8hxyWMcrC/ACHOcVHYP4xcgBx5Nhq3hZRZLp5LIhBZvtZLXeiZyxVTir4xo9wHj+t+VzDkggZwBFQbpxYYtOxpS6MLM3BLX+qBqWVqbO1JBWv/GfLFbfxVojD7JQCoADfP+jAncUFvykanFfev1LmD3OJ2izvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bD/r7dQDDGCi56LVUBpUB3spun/5YlvXCT1jS6YL3W4=;
 b=ItVeSVN7ZS62ixbkgGV8XupQHl5ir7Fxn0Mwmx5b8FHZ8/2zGnTZzxFMIFw7jmHydxFYbmdfyJ7K9XMbsjEC8UCS3wFfqiKPnn7w28GQqVViWAVzDZSvu+VKQHY8X9mgl3JeKwIkXVlq3aA7aSNZCnoLPHpXqHrXC/rzkz4WtDK4yJl5htNL52uA/AZaZc8B7mXS4W3NEGy/6ZZjGL5pjYW46ujVC75lfFIqdhB9l2hhXyFcyqqNg1XWypiRSNyLEhCS4tpfcd2ncdfyo1KZNhrYT3xMaSNYvMDd1MeHiDtyxeAhBrOSBupsL4L0gD1WDady3U0unvOU+yIRDbGIgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by DM6PR12MB2970.namprd12.prod.outlook.com (2603:10b6:5:3b::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 15:46:53 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::cb5:94df:b338:9b5e%4]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 15:46:53 +0000
From: Zi Yan <ziy@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v5 3/6] mm: make alloc_contig_range work at pageblock
 granularity
Date: Mon, 14 Feb 2022 10:46:50 -0500
X-Mailer: MailMate (1.14r5869)
Message-ID: <B07EF2EA-A311-48DD-9973-0EAEC95F4074@nvidia.com>
In-Reply-To: <20220214072601.GA17306@lst.de>
References: <20220211164135.1803616-1-zi.yan@sent.com>
 <20220211164135.1803616-4-zi.yan@sent.com> <20220214072601.GA17306@lst.de>
Content-Type: multipart/signed;
 boundary="=_MailMate_2AA612D6-0AD1-40B3-940C-A2AEA3CA3263_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:208:2be::22) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b052ce2a-671f-40c1-52fb-08d9efd13887
X-MS-TrafficTypeDiagnostic: DM6PR12MB2970:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB297008BC34F889CCA3666FCEC2339@DM6PR12MB2970.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EclHlYzciRFPo5/hESi7dlFN8/ULNacxjAasg3J6iMNMYE68SXzi1S5QLkWoklZ5GokmkP/ulml/8OxHXZZ2uIqZ5qq9oqmb2HV+55hdp04R1l3YCNHvdCWhJZBquczU9pEV+kl7bKM6ULhLImXdiAvdjcIcppYTDBSFcKRH/1m5zS7ld4T7KdiEZQYNBYZ8P5hryW4ahj9nWGUid5ZjfpnPBlkFRMbGV7jhqMHmrSy6zC8+7dXBCwkwRNENVCax6QnUyWY7B+zdT3Q3LiSYiOi2gi1Gbk3YfgeIh2XxdcLXbmEOhXBfyyyoWQk+lDdjKPsKTcPh4dYrTUvpv9YZcPKlbevHnaXm/d96RkMWX9sGHbPB50aErosSIpt1VptjH2Yo4KyZfVBfhfwEng1m8eeJuWdPpaYwvEP9Jjj7qgmQsBYeCCPnhNQXRpVVB+LHNgJXaiLOV/7kYwOXLyd9U88rttEv3XBG/109+VLPrX3V2pEDoKANej1E3n4wvyLZOZi8ElfZQaVmqud+BA7LRGT9/aphRowq01OCLbd3HIjHSqu2r45M4m9HbUWD1KXzZdGSosADw/UHr38nz2I86MKOarRbyxe631aT37Yms0PAVjO/j71HrvGenXyjpgc2mxDgEnhDU8KYdlelKDqRvu5u9pSSJFy3swHGh25tMdMd4ZCTpfnaDIJYVjpP5yhWs1JZY2SyCY9X73Fu+LjMxyzr6gIQwijyVKx4FwF3s/E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(54906003)(316002)(38100700002)(6486002)(508600001)(36756003)(33656002)(26005)(2906002)(186003)(53546011)(6512007)(5660300002)(235185007)(7416002)(86362001)(83380400001)(2616005)(66556008)(21480400003)(66946007)(6506007)(8676002)(4326008)(66476007)(8936002)(45980500001)(72826004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3SVLMthNnnzt6eLxsCxrt23RwLZizaGmzz2+iVcoseIUftPnzML208KyBUoJ?=
 =?us-ascii?Q?0gJMqG1X3sCellFI7dTcyCAaM86cDZDtYb4OmzQErByz2V1uzfRsUdj6TfBX?=
 =?us-ascii?Q?fhaEzaTbF5GxRaLxURWLKnj+/fW9V5NTXR2vkhJWfyyglm3PpHXWpqs3L5F6?=
 =?us-ascii?Q?BTRG7n/yYFVjZ84Qk/0IZQNv6S2oMDiMDW0f7i5n3SN+Lh07hmRFB4sH/i9c?=
 =?us-ascii?Q?djdk0wwGZ2SOWgHVq0t4UsBomiAEJpj19TeFFT3yjJKOqiGjjtpjGsceB2Ve?=
 =?us-ascii?Q?Atd95VQ7zr9415ipgN3/MW9K3CEWfMcBZKjurjDLjnLroveDcOx5bpmXLZPO?=
 =?us-ascii?Q?cNQXfrIBa+1WygB5zQx1zc/5psACukdDKtJe8inUt6c5WnpJ4gy5sTykEh6Q?=
 =?us-ascii?Q?FI+5Bm0Uz5zjE48s2lIFVicX5g1bfdSaRXVB3YJqjBQgN7RKVVNybhPHy4UA?=
 =?us-ascii?Q?t0aBIph16mBa+/Wh9k+YsAjkqGZ/sTvLfD4ykzXGxsMmeNAQx9E+TIgmzdMP?=
 =?us-ascii?Q?2JuLHSQ7p6cvMTv41KuyLR9ef7VaeZVs63OBe172kvnD5Ini6y3YxKvjyjUx?=
 =?us-ascii?Q?kqwCwKwG6GIAB8hK6mNxcxTMnFzYWymR+QFHwdNuIzI71zX1gAlnvQBip6jz?=
 =?us-ascii?Q?EzxK+c13Wi5azz4pEaAv7xqBU0t2qACrbxkBxI1Kaw7QhqOVh3l+89+/awyp?=
 =?us-ascii?Q?Mx7tDG+f0hmOc7uwlFCGC4D/VaD3K5rVVMqrawF2mV2oHT6o5mIi6kjXRvmJ?=
 =?us-ascii?Q?FqnweC+XFNYLZtlIBqIEu5M86PkePG4iOllrk5c0jJwKJywtrBLrOg5tSCBN?=
 =?us-ascii?Q?iaytFgAXkwFZpYnuH7ioLtv+yMj79V9fme2S7LhlHGjHOzJHWePpH0uHzzCG?=
 =?us-ascii?Q?rnFUWjrIfzumu7wVSOlCpDae2rkMdjKcTQkNRZWCnEbBmbYC+GDB7DG+Flvb?=
 =?us-ascii?Q?iOUa5ZaL12wh0tp6B9fcU6qM+G1nk/caVn5rdDVfdZ+6nFFg+CcXGZo4H+wB?=
 =?us-ascii?Q?4XAmNBR9amwh4NZ079XiMYZHpwKkHL4Gqu0kXF16FDae8f7eYWLdtd7tb3yO?=
 =?us-ascii?Q?m9koidB11DmqhYNG/I0rSsXn3G+r6dg5AhYCNy9gatSYnHkLbk6GEKyWwgTH?=
 =?us-ascii?Q?/zPt1mgMH/UQTFp4KNfnAsd7734kPwr9vN9KMU6txE3yzvfqL7ce3Fe/mig4?=
 =?us-ascii?Q?eYMl//3L213tTU2rWxv61p96ZsvHPU+xcAQ53LIGtjjDERykk+ui4AnownV0?=
 =?us-ascii?Q?JSeiKWnyQYFRx8BcrAJWPmGj90IwqDPbU5+1IFTtOvjBXz3xQKsfJketET7j?=
 =?us-ascii?Q?CEq3TGYwp02RSXJdOfiC09wxyPQ5Z14KJzzYUhXzBopOky6L+bykShynXiZj?=
 =?us-ascii?Q?u8KZbW/BYkw66CTX2mQyEKMDcWCSmhI3nBRXNxEWpIFwBIWkw3zfn5HEjR97?=
 =?us-ascii?Q?/wFFywRMSeYLDR+ZByb4I5upTGvhMHal+/+yzgf/cQUtvX/M2WrJVgZAHTUa?=
 =?us-ascii?Q?7in0sRUa3AJ+KSwksoEn0m6fEyTR/fcNZbdmIDJl4h+gAwfJz8HO7+ggrRHz?=
 =?us-ascii?Q?iDtGZPiG2Z1eeuQa6iQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b052ce2a-671f-40c1-52fb-08d9efd13887
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:46:52.9137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqO5VvBNApiNzS8lKNylnf6LiuBSj/+L4YxTCAhVcZxRGZ6aDoKedsYfafaAK/cA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2970
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
 Mike Rapoport <rppt@kernel.org>, Eric Ren <renzhengeek@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Robin Murphy <robin.murphy@arm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_2AA612D6-0AD1-40B3-940C-A2AEA3CA3263_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 14 Feb 2022, at 2:26, Christoph Hellwig wrote:

>> +int
>> +isolate_single_pageblock(unsigned long boundary_pfn, gfp_t gfp_flags,=
 int isolate_before_boundary);
>
> Please avoid the completely unreadably long line. i.e.
>
> int isolate_single_pageblock(unsigned long boundary_pfn, gfp_t gfp_flag=
s,
> 		int isolate_before_boundary);
>
> Same in various other spots.

OK. Thanks for pointing it out. checkpatch.pl did not report any
warning about this. It seems that the column limit has been relaxed
to 100. Anyway, I will make it shorter.

--
Best Regards,
Yan, Zi

--=_MailMate_2AA612D6-0AD1-40B3-940C-A2AEA3CA3263_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmIKeWoPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqK3aYP/3sWaU6QEZYstiqLTQhAShiUR+KjYQgx5WEZ
rXg2fA40Jz1ozDOBwPV+7WhULBNgIuP14HxZdnUFAZtd356R8RTeLIhAB5hak5Q2
M48+kJnm34adOHJ49ePci83t3Q1kAmm2OzSBu8q5wTdjks8ZFooo7nkExz3OAidi
Cb96rvN8E8LUupMXltFrhECsOxb9z8ndl1LYN4UR9t/h3V8Hd4Uzoz57wqzttzNb
YHTxnhCzOwl2uXtULNMc+SvJ/NqYogosKCVc4UpHNCrm1l9QhnDhN+okhV7IPo4c
j+ey7ddNN2zcbI+M0+4P3b0KbwFSVfNcGTvpp4dS61onJ/bjeqF28fa2eaX+R/sa
+rZd+3cz1IR9EOSPDR24Lbx2o9k28yYIluGdvlEpDvdZqTQSrrEdpX+rNXc0fUDv
Bdtlb+TJFiPnN6lVZRZLwjVDIfwYFUtZ2ZxeZeX0y3ncm8/+yyW4aNdra0AlmMKF
Qumm07h96SRPkr3cbE9LOuQWnpw2ifaGsEi/yNgru/SV4QITLTID2bjt28XjroAG
K8VBLS+YuSSZ6Vh4BTcnvyApUFpULyHr/dx0MpDb9wpGjW13Kx1Uq861sYpbnKCz
VWfbpmueTivay01BsrmXu+ZuKbluhlZSW7J6zu6Y+Jy0vV9VZu0Km/PARUAVeeFn
gc8kanmn
=Cmfg
-----END PGP SIGNATURE-----

--=_MailMate_2AA612D6-0AD1-40B3-940C-A2AEA3CA3263_=--
