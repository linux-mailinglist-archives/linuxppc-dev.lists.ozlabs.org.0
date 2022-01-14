Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F248548EC5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 16:15:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jb4cq6Rdjz3bPB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jan 2022 02:15:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=iNn8gsih;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=40.107.212.86;
 helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=iNn8gsih; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2086.outbound.protection.outlook.com [40.107.212.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jb4c20W7Kz30Cf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jan 2022 02:15:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fUiSyOeBqhUAQNhe3gAfas9oHf1551K7Hcur+ueLTdepGESPU7r92zI3HpyCY0pOI+X0Nfhc5NEQ3x125FJAKChRx/JZ6ETy/1xZ+/Nd4wkAO8a749S2yNi3tr5ZEwjpSZcHiRndaDKzIqPWguwoBIXZD56UZ63MObCacPIx9dTuw7qEN70ax4p8QvpkwjJaWqWRWo6A44au/2NFYeHYKP0BEjkkkDOHlev/Q0a5CBwc9V5AKOHQGGTHAT6r4NETZxRiGEfr/BsVCX1H+QgSzcA203xG3Z8jB97eE2oweqS50P8gQP7iQmO7uXaHfkIm5Suuu8u/JLDjE9RmiTYXtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zy+kTsTEy+0S7nHv/8wZECM8wxZHiCXWhCVJGLbrWvE=;
 b=TwU21DMtpmt3ZjhKXstP5yZSimyMM4/JJOrlsMMJ53/K+gGSWurP51AoRCArgBXmOS/mGDxqCoKySZwSxPuwPocgrrcr/tRVFC2i/+QB2NfLhMRlQpsVmKgFJLgkakAEMEGt+jYdIBNm7XvLbe/DINGDGmwWcubOGkBInMJm914yRHC4ZccxJgWrZOhvHzPjZ2r492SRu/+J1EguFgVBMiexMcOL5KMxANqP5SnCqUfdU9DksicPbQIxSyq/a+/A1rapdKua8xIY6VdS8+n+i7mSwlGp1CRXEz7qKR8KVz9NSCPnHVt8jiF7mVfPv8uO83d5wrTyhpUIJYW2ZxT+Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zy+kTsTEy+0S7nHv/8wZECM8wxZHiCXWhCVJGLbrWvE=;
 b=iNn8gsihZrBB0uLRfXFzIzXqRE5kG8Qb6rdbSdNBnhXntCuL6qkSXfgqWBgcS6kRBNZFBWWwVv++gqshM2lrz8WEFdkARbY8cbyyHVu+X68jWtuSiUmmSyyu7Bm5t1bgVI/OcxeE3rHq7DOm3LZGZaRXiq8HR6v+J/hwdeU0VW2K+sfu/BLQGYoBFSoneGXEhhuNTmF/I2bVG2woJbGQt3IeS7saWySaN4FS0bi5l+w7M5xMpWJZ5YzSBeE6K0C7yEfyLRRkGc+5YACc2nw/GrkT6Ubkt3xTCh8cGwqNVRe04KRS106EirsaCArywdezu7GtG/G2E25a9wYgqjjW8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3823.namprd12.prod.outlook.com (2603:10b6:208:168::26)
 by MN2PR12MB3472.namprd12.prod.outlook.com (2603:10b6:208:d2::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 15:14:53 +0000
Received: from MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213]) by MN2PR12MB3823.namprd12.prod.outlook.com
 ([fe80::a9db:9c46:183e:c213%3]) with mapi id 15.20.4888.012; Fri, 14 Jan 2022
 15:14:53 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [RFC PATCH v3 5/8] mm: page_isolation: check specified range for
 unmovable pages during isolation.
Date: Fri, 14 Jan 2022 10:14:51 -0500
X-Mailer: MailMate (1.14r5853)
Message-ID: <0A46DD38-CEB2-43BE-8ED0-71BDD8B87479@nvidia.com>
In-Reply-To: <ead90b32-da2b-4d66-f103-6fbec0937e93@redhat.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-6-zi.yan@sent.com>
 <ead90b32-da2b-4d66-f103-6fbec0937e93@redhat.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_EFD96380-E8E7-433E-93B8-B1EB40D69348_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:208:d4::32) To MN2PR12MB3823.namprd12.prod.outlook.com
 (2603:10b6:208:168::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d365d00f-454b-49fd-8757-08d9d7709d93
X-MS-TrafficTypeDiagnostic: MN2PR12MB3472:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB34723CFE1A64E10A8B273A4AC2549@MN2PR12MB3472.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOblVkDBCJYmh8v5sGwew9+n0Y5KaBSuZRekBSMSleEZHvyAjnEv34+TGlA96gwzN+j9/ab34Nx4lyFylfsBjN3MhKmhvcFEw8Vdo8zJdBdyuSvReB3/0KA4Np6pL4//TS6s+dt2TcnaldmIB22f7hAgmDN3oR/sxPs9LZYtr+O/PN4/gGHKHwwdrQwqMUCdkbl654kSmckvGvJ8fyUN3QB37asZvtzspOSY8MVmD6m4j1VSJRBMYzD9zj5jUpW7PG8CG+yMuwVn6s7kT8hgGBCO+SSvxOp5xN1sMvwLezn6DXhFJXoMX5iQjiCtg9BDjpA92ZR/O5FETsDMG+KpOSZ2cX13OL8Ijgj99Vnviich2LRUQYyC42PAuRyiyflf6Hfoe4Si98R6BxUH/er7OelAl+CxD7XJZs1+g2Hy7AewNlrSQ8oNSXMHLMj+xcG934OwaW0tKQE+PxgXAjZqxQjPiCM1ouVGA3Sx0SpQ/G+D0izHxGb+n0zdpCus4PjdY5viIeGoRy9ztXjLOIhpWGfy2QjwT3HgGIhJIZf4dQ/ra/UoIrXdgxofYvl8zzPKvAwNA9mrNXk4c4jRmZvX1vIOomVNz8p9GX/BZF4dfuEClwDANyLwvgS1rPPIqrrLj6RpeJjgkWgnLi/82UVlxRWSm/NBbcUndNU+Swfh8ine0Eyw+wASAKCVMRE5yi2Szk/iNq8Bdpvqy+IONnATsg78rXOzb035CApzfys6b/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3823.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(4326008)(33656002)(7416002)(66556008)(66476007)(53546011)(6916009)(235185007)(36756003)(2906002)(54906003)(86362001)(66946007)(5660300002)(83380400001)(6512007)(186003)(8936002)(21480400003)(316002)(38100700002)(6486002)(8676002)(2616005)(6506007)(26005)(72826004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KwZS9TDSkabn+MDZssohHT+OVdfBroyoni3/5mgMmKMbCbzh5oboXnx9nmte?=
 =?us-ascii?Q?Xt7aGeyyzkuTqcP9IKGsKvI8mLL5wZ7VN9Tk+qC/LuI5Xd6l7J5a85wWpqig?=
 =?us-ascii?Q?sK3FW4/pIjnXRO/T0c3MN2CFme/VAl5Tr33hqAa8y1jSefStP+453/JQoG71?=
 =?us-ascii?Q?oXbW93aT3y4PmEsX/PJqEzJQbRckr/vKoKRnNmYicxUrjmMbp08cF8GVmBFo?=
 =?us-ascii?Q?+AL3zCNZGenr8lKrbzSd2dofUmpA1KjkD8E9SUAB+V8oL7RKMdu7/FmedSEX?=
 =?us-ascii?Q?wU3kRKjTyQ/k8uRGElqgSeGk2JgBH9LJMO7IFJrw6ykFC/KvnEix/KurS3FP?=
 =?us-ascii?Q?yvG56Rdpur9wAKwnlaXbKoIo28sbs8kmgQe2YKDfhMc3zd3kfIxUqdUxG0hH?=
 =?us-ascii?Q?XG6Sg6sG4pKOns43gGWiCS0ILxa3uqhPJPdQ6mkBgzxbr2y3tKbG1VMwfTzv?=
 =?us-ascii?Q?Hcz1eDnegjdBatowHv/FmW5SXjaPxABYlxG5vo/MR4la9Wu2S8uFOI+COMUS?=
 =?us-ascii?Q?EkqC72UL1I+sDUCqKJV5Sog7xvP2VLGT78Vx2B5V2U0k1Ld5q4VA387b6buV?=
 =?us-ascii?Q?xfFfLZicPCzX/XyH7JqIfy9oXZu2Qrhe4Z/aAaton0pf/qEzH5Wr0DieTTj2?=
 =?us-ascii?Q?mIQb55bhrrxEG0vl0hk0UFqu7kj8+N+2cqKBsNs7pj1pNQZozILeYfQLLjg4?=
 =?us-ascii?Q?okJMchtoy3pY6lc1e0zXSQ86nwsk4qC6RLl3fE3FRiqV00Hne4an8LbVe4YP?=
 =?us-ascii?Q?0M2LWsw5uAn0++c0wPZmwpO4HT1MYdZAM1+U1W0SGTTnRG2wT1XKwxOXB+mO?=
 =?us-ascii?Q?NJDNUCnSQsR+r2tn9dWsyxg8AsMX7H5kuEnnuPSrpV6dtVRTJn0Z66NW8mej?=
 =?us-ascii?Q?rDGT6dAbg246eoEc3gwlVctg7B0ydyqxyaZClXl98hnFSrBPyDkQGnTx1wSo?=
 =?us-ascii?Q?559fpe9kPe5fRMkaxPyScNqadpCK5NoS34/JzkeForeBWtAjk2UMbPqFqrhr?=
 =?us-ascii?Q?8PldcJD4zMcD8JSq1s5gZ/ou1jpbnwtSlLKbl0aU4bIU6cjqdZiLH0IAeZL7?=
 =?us-ascii?Q?6HKqNwTjI8QQhO2Ztn7qrWmvh4RBzFTAjLIBpHfILTRJSlSmAQU+HFJcjeRR?=
 =?us-ascii?Q?FaSPqtcAhwUpCCytOlEGltYXfJj7vc7LB9216tGffOTHI8J4iwg9Qy1RO7fD?=
 =?us-ascii?Q?ziuMvOYM2ZVk5ArIgWUdHwUVUXvA4fCPd0caXz8u9scCTqbz4H4QHyGXmqT1?=
 =?us-ascii?Q?XuaygxX/uPa4EQWO7jO/UZHiNBqxZzQOT/6EQqU2/GDdOdwSwRkqHqqeM1sg?=
 =?us-ascii?Q?jjlcQXvzOM2grHo+3TS3R/PHTn1+Li+RWNLFZ1xRTAGYjZeEtZnfH4jwCsVG?=
 =?us-ascii?Q?XjZM8JTlFUo1tjM7NUtHkaEUYMnJkRU5BkrBqrYZM93RMkN84A8XVRNP9Zpq?=
 =?us-ascii?Q?6hNua4MdeIEIHuFo9zXtSIykWYWJ7dxxdxQHaQBgT2doOx7Y5eGEaJ/VhSGq?=
 =?us-ascii?Q?FfdmxwHH5UTybI9pJuzFmVPYrc4qKuVNouddMpkM6+f8xIx+kSfDCmDkqwXh?=
 =?us-ascii?Q?0wTrORTbFZhlk6E6eQ8=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d365d00f-454b-49fd-8757-08d9d7709d93
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3823.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:14:53.2292 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6m0gp/dPvJ/AYWD5J2H/q8GqCO1a239TQ0fMT0SsAfsO2JqLtEuHjdINM8iM1+2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3472
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

--=_MailMate_EFD96380-E8E7-433E-93B8-B1EB40D69348_=
Content-Type: text/plain

On 14 Jan 2022, at 8:38, David Hildenbrand wrote:

> On 05.01.22 22:47, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Enable set_migratetype_isolate() to check specified sub-range for
>> unmovable pages during isolation. Page isolation is done
>> at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not all
>> pages within that granularity are intended to be isolated. For example,
>> alloc_contig_range(), which uses page isolation, allows ranges without
>> alignment. This commit makes unmovable page check only look for
>> interesting pages, so that page isolation can succeed for any
>> non-overlapping ranges.
>
> Are you handling if we start checking in the middle of a compound page
> and actually have to lookup the head to figure out if movable or not?
>

Yes. has_unmovable_pages() has that check already.


>>
>> has_unmovable_pages() is moved to mm/page_isolation.c since it is only
>> used by page isolation.
>
> Please move that into a separate patch upfront, makes this patch much
> easier to review.

Sure. Will do.

Thanks.

--
Best Regards,
Yan, Zi

--=_MailMate_EFD96380-E8E7-433E-93B8-B1EB40D69348_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEEh7yFAW3gwjwQ4C9anbJR82th+ooFAmHhk2sPHHppeUBudmlk
aWEuY29tAAoJEJ2yUfNrYfqKHVAP+wQLmekSmaBLUZyqE6BmgXMxqAuKfHDisuju
sQ+K1TITi4vp/Fgyb3qrGtxbEsYSLoTCJ7MrO/hg/oRC4zW3UFtq9jhfX9E/jBnN
g616RnbCfmuhRzWAbegxLx7irdhlntNgvrjo/OjOwWRZtdJgF82VZyZYmjoKjCZt
kycSHdtVwVF0Ndq6KFuSct8yRXAOug2cNwCnPV/q0Dy6iQG9efK1/r8Q2TOBUcBR
QbmSrufndFopmFsbh16slJlH41SbkaChz8lHUUlmganHvRakoFxxQjg4KKcyumTG
k28DSYqGeOdhWKu/CgLkdEgB75twNx9aSJ6aFKrxxc1q4P7w9tvPUAOx4cMEZhRW
ReV8wSACAj53/oihEt6i9lRDax6Sf+JU4hZjtaQr+Vm/TRmzuttRvtP7EQiA/97d
nTazMzHcBgeXB/eSko6GqLkV8VWbvxcnAQkt7XcAQJ+pcRDktym2as3P1Tu4kSrj
V1EO6QJtqSD9RRAPWGoZG8XrHcm6O7/knkFil2a0IoFmwW0tTWcz8v2fuct07j+u
LR18iJgLhtPwJuKQ5pGcex8iLaeSaTqrX7RJlgcbN/sTuSuiTHwFxYnvPxK03dy6
Ig6pwIHSDmclpRnLFOK0TfoxruMnnj6a5yE3MkTBeG2M/xCJw8CXHAnXmxlrc+mV
llVORpAe
=emuQ
-----END PGP SIGNATURE-----

--=_MailMate_EFD96380-E8E7-433E-93B8-B1EB40D69348_=--
