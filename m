Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8112970F5A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 13:49:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR8cC30t6z3fBN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 21:49:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=olf3r7/v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eaa::616; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=olf3r7/v;
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR8bM2Cmbz3cJn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 21:48:44 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiP9zb4kXvNP5MZOjAWLD/udPgmgj5suLXGjAKCmqjkhcq0XTQkHCW9QZJM01p3S3SDeAlkwMLBr+xCDAtLwb4yHDvgHC+W3Pl/ZRf4vG2fq9wR+qZVhsM15G4sgObIgKy7HJjq9dV8L7y8rTiMR1nqbYknutO5xjrA70mYWmrY3jcvH1qtzqE0mDmuAIIkhiDfHSF4KeIXBPcj61F7KqmztP5NOcI2oeuyFRuSxLKn3kfKyg959vD41oTGsJMe/sywAAPEhZMAUGhTNFAkuWlWedQhoY9plY6w+S+HGR2YY9HsAkNQUchm3WdWbrYgXvTI2U4uUDmeq76kCH+xr1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYM0iOM1AuyPnfikZZGdw3XgQbjuhqJ9wiH/NzQFmAY=;
 b=RSpS4LozMjExDr+qqkgwrrVDz1ki9786XvgwZU/cSCdL2Ic/jKqj685Sb4/y/K3lGwh3Pw7Yirb2cc6/55EKDa0sT9WZf5UyhY1lMaElR9l11M3m4BcvWeV5tU2BN3XJzxkhWEDnlTcGAssHl/snujnXvNsQyaZD7pyL+V+dPNIElWkQRIxKBhr5vf89JyERsnS1tfn6pBUjvIQK5jLTfEO+V9ZJ6TJwp9JXPcJAl+hmBmc8Pz3zTG8sgFMkI1dWIaMMIlJPWYjH1yWAlffdGpz9txZkPUT1wZaXqg3Jh3rXedY7ZCfSjdEAV5TN68jtGOemjH6b3DzsOSbxfOibsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYM0iOM1AuyPnfikZZGdw3XgQbjuhqJ9wiH/NzQFmAY=;
 b=olf3r7/v/hsFYaLvAc9Tkja1TA/JdaGW+hS26k7ireLKhXfhaqmNoziv6k10rWJUORYs2td8fWenPhJvXK8ebLwzboGh/8LrYexaJpH1pMGGxO0Ia6xYABIyIN6LtlyCxZByIU/oNYmWsfpZBIAS6oIAWBHobLxBGSNqxLfUMymlF0xaaSXb6df9NWpm9STTaj++ET9s9mZX0MsTytvfrCNAEQNl/QmruOSqsulTTerOoAaiFWamT0GRjnbkkai4HHTKH+Za768iHx7TN2qF5LvRFMnjabT/HbjDLWWh6YLHkDzn4fZ1yURDCETGQY7njkkcMlrVpHOVU6UYL5WrOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 IA0PR12MB8983.namprd12.prod.outlook.com (2603:10b6:208:490::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 11:48:24 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::847b:988d:86fe:a0f8]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::847b:988d:86fe:a0f8%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 11:48:24 +0000
From: Zi Yan <ziy@nvidia.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Date: Wed, 24 May 2023 07:48:21 -0400
X-Mailer: MailMate (1.14r5964)
Message-ID: <D0217FEF-6E59-4458-BC34-A5FDB3097176@nvidia.com>
In-Reply-To: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
Content-Type: multipart/signed;
 boundary="=_MailMate_6BECA252-51F8-4F56-A924-E26362AA67F0_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BLAPR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:208:32d::22) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|IA0PR12MB8983:EE_
X-MS-Office365-Filtering-Correlation-Id: 3902b260-92fc-4b4b-80aa-08db5c4cc7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2fZlfIK+IFIdNVvD7+gI05mdPYDfHjZMLMqFW6orC5G0x3treqX3ZGEKDqsIG0ae6fYSZtXbASiBapgsqeUGWdRp2bC4h9L8DsFhSJKH/hjt0nT3yAMsMl3rrMR+APK+TyC2GRfs+qy7lvT5odB2wvS97S8BWoF/PLDotd4fpIpMLLignulUK6H3d+uMW94k22ClB7F9+o2fZnvgCT67SJMF4x5cjIkkB9AdUVS3/4tSP7KKWrU50dHNQCs5fyamdZW667hI6OQnDjP9OGdnk6jocYNrsUc6UpYzokQdBl9KM+niDh1ZaUM8XiDvTYPGub0GsnLQywVSMN91qeEq5a79/AxtqoLTgHkPdOptKMoLgUGcgpsxoDpHAdncnSbH4hrt1R12RUXJAQB6qrknjVmeu8X5/b1jDoueS2T3kG9P+KfWhjito9F6jZNWRmfESQFAMxH8m0RIs2uh9n4ShP91yAJtMmTiVt0MrewgQuyGWPtzmsPsGv1fIjzDDfP5tQCbk9PupzGu0m+Hxo11cCgPPTHYvToX/LfAvNaGhbeyWu38n93hie2tIIT+lUJjeJSVByQ5EX/FUsjt1HfEQzLTS3oMwKjKdamrowiv4xK0uFO0x2eAsfNdgtkbJvnShwKaIyHyKLGpj0WUd6uJYSZK+mIL5SCku9V3O59d2ORI8Cq7HZJEJNae+v3WXAjZ
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(38100700002)(6486002)(54906003)(41300700001)(966005)(478600001)(316002)(4326008)(6916009)(86362001)(6666004)(66946007)(66556008)(66476007)(235185007)(5660300002)(8936002)(8676002)(2906002)(26005)(6512007)(6506007)(33656002)(186003)(53546011)(7416002)(83380400001)(2616005)(36756003)(45980500001)(72826004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?2T/7WMClc3vydjuMIMHPVchUiOcsfiJ+fkhXM5Hxeuc1wNBid4ubghFOjo1N?=
 =?us-ascii?Q?wNImqFeR4wy9mEeIYUmaZCNTnLNtbnWkhAttKg1owCDIly8DfdfgIZPy+FK6?=
 =?us-ascii?Q?lcf6gcTRtbbEnY04Ve49/KPb+UGpYnQyN7Vtsf3c1tWjHinSBVvC/jhAmkZ+?=
 =?us-ascii?Q?MUYklaXng+1gMUO+Sb9q7L+Dkp3BvBNcJoArxtB6aJiAZiACQIj7UYVAyrD8?=
 =?us-ascii?Q?GzO4DKZsRGMXs1eiKyBXwJgkIY2LuE6kUhNxe3/r8B05N0CVWxv6TpQpqIa+?=
 =?us-ascii?Q?eiXPtFQPt8qYEl3yCqgKxKq6LSqfZIk2olFAcyWiISlBkOyMXB0VZXaOc94Y?=
 =?us-ascii?Q?0XsLHLnWOm9RNu+xYo1GytqLx8Q6gVLEZVDKjfzErtF+7NRaKrJS4LtuoC9d?=
 =?us-ascii?Q?OI3P4/Gj2nWOiag918HOXUtEBJc6YWvJUeARXVgEwgHq0a2PZ251XRDbNFVv?=
 =?us-ascii?Q?USxaFl2MjFlnXGljUpFkKf/o8jiujULEWAu0KeKabhNLPAfkF54frs3rLnxR?=
 =?us-ascii?Q?U2CP7HEXAc57h0zWoaEoJvDpP4rqO7b+lvfLXitEUgWyU0DQCr9/h7wYD0we?=
 =?us-ascii?Q?DM+gc4L+qTw9lAMq12gwJAVmz7lUhBZkGUim2uexupUfMtlOi9DnTKR9ct6U?=
 =?us-ascii?Q?c0r/ScfzlvoPaf3bAgg4xYwj5h8LJRNu7UptiqyITH20oiuXOOUPWJjS+Oo0?=
 =?us-ascii?Q?mnaGGp1yVVds5ywKbHhN+8VlNB509z1oe5l0mufHGxghbY9NpeixejZr94Ap?=
 =?us-ascii?Q?dVmUkFAcIHwU2rONryVcz6hDDHIuQz0V+Fi0twDsKSbwneyaTpfPDhLNnpKy?=
 =?us-ascii?Q?D/hkWTfmux2okwOSMUlM2JCZ+wqGEuEWVEodSQROLilShyZ/Cig2VuGxI4W3?=
 =?us-ascii?Q?zTtLBES7CKXfDotk26QJYvkS2KrP51iJGll53Xs290w2jKAmlceWQhWRnbn0?=
 =?us-ascii?Q?VB2j/modtiTaK5303cbPBozbd4UwCCyNRpZJt+9B6Dh4n7z1ZSECTyggVAxT?=
 =?us-ascii?Q?k0PtY4atQXMGkRVHohFSSRTU0QUx/ibWje0CojXCU4zO4xuISlrm1rctqHl+?=
 =?us-ascii?Q?SI9lQ83V/9FiLQg+UqoHVDj+DUt0jWAuKDLtnMtuI5nunVLQhJz+8R9KbLnn?=
 =?us-ascii?Q?pAl8NX7j0nFKkAhBXeSOQ0CsDwyZo0R7bAk0I75g5RgAhvz1qFXsTRG59IYd?=
 =?us-ascii?Q?OKP9q9P6yyES0aF/pOcpS7HcaFnxcsNi2OdRCFU7RGbFQ7ZWj0mZ8fSAYPTr?=
 =?us-ascii?Q?HxECcdLX/XzcExiAE0Vn29ZN/O0JFNu8XMH8ySnOWAXPyHXPULW6hda1JUZ7?=
 =?us-ascii?Q?m1VNun/ihK16ew2k7Gryh6tyS2iPrBwuY6Z95oFZ53nh5iT2BoWmLXUEQ0jS?=
 =?us-ascii?Q?l+UHIuZV007U5gQgpI3t65sPEWKdbgbS9GNKEHHJpTTJprX8VpuYyPHUlXsm?=
 =?us-ascii?Q?bN2RgLg9LduXwBuIyxHXImqKG9YKjiFsQ8MvWLYK8TJ4o7UhAljFPE4UG2kH?=
 =?us-ascii?Q?BIAogBzUehj3Cn3qu+AXXOoERv1xeHQ2IqBYTeCNnEwOXyqp2JHqhwMhjGkJ?=
 =?us-ascii?Q?wzfnr4Z3JXbyhmOpD3I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3902b260-92fc-4b4b-80aa-08db5c4cc7bd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 11:48:24.3194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XC1ns+UdL96cK8rcgiFBNIhaR7cdxbDkCqM9NNx53bbjBzjEhi1gnBimEV3pjMgc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8983
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
Cc: doru iorgulescu <doru.iorgulescu1@gmail.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Linux Regressions <regressions@lists.linux.dev>, Fabiano Rosas <farosas@linux.ibm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, Disha Goel <disgoel@linux.vnet.ibm.com>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_6BECA252-51F8-4F56-A924-E26362AA67F0_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 24 May 2023, at 6:58, Bagas Sanjaya wrote:

> Hi,
>
> I notice a powerpc[64?] build regression on Bugzilla [1]. Quoting from =
it:
>
>>  CC      arch/powerpc/kernel/asm-offsets.s
>> In file included from ./include/linux/gfp.h:7,
>>                 from ./include/linux/xarray.h:15,
>>                 from ./include/linux/list_lru.h:14,
>>                 from ./include/linux/fs.h:13,
>>                 from ./include/linux/compat.h:17,
>>                 from arch/powerpc/kernel/asm-offsets.c:12:
>> ./include/linux/mmzone.h:1735:2: error: #error Allocator MAX_ORDER exc=
eeds SECTION_SIZE
>> 1735 | #error Allocator MAX_ORDER exceeds SECTION_SIZE
>>      |  ^~~~~
>> make[5]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offs=
ets.s] Error 1

By checking the config file from the bugzilla, ARCH_FORCE_MAX_ORDER is se=
t to 9,
(SECTION_SIZE is 24 and 64KB page is used, so 9+16=3D25>24) but it should=
 be 8
after recent MAX_ORDER changes. I guess the user was using an old config =
file.

Changing ARCH_FORCE_MAX_ORDER to 8 in the config should fix the issue.

>
> Apparently removing the errored line solves the problem for the reporte=
r
> (the attached dmesg on [2] looks fine at a glance).
>
> Anyway, I'm adding it to regzbot:
>
> #regzbot introduced: 23baf831a32c04f https://bugzilla.kernel.org/show_b=
ug.cgi?id=3D217477
> #regzbot title: Allocator MAX_ORDER exceeds SECTION_SIZE caused by MAX_=
ORDER redefinition
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217477
> [2]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217477#c1
>
> -- =

> An old man doll... just what I always wanted! - Clara

--
Best Regards,
Yan, Zi

--=_MailMate_6BECA252-51F8-4F56-A924-E26362AA67F0_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmRt+YYPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhU7G8QAJOGYRCE4YMQwhMeW2+N/KMD+JdFub8OIoCB
P8HgjWXlv1vFZ7jOnQfx1EPXFkfImwjIUdPwajGzCaBFI2AkILjAzYuhb0TVGJyJ
1ivu2DzXAsSjR2w849kgSEjDQRm1QM9qcfktVULJfURS9ZbX1wa21xAvmicDu3ho
aegFDnzcn2Sb8Ct15CiWe1IerAL8zSlDHjGnZM07j7m2wJrtif2940eR2ZKyaS6D
JcEtzPwkF0JpHi+JFnhwdYKbQxzuPMrGm9DJm9JK+1EeqfAC6gBt46kkrKuhBBVV
qj2QMukcFRIxxJttaPXcm3SnRB+mQ9mKRDE7czhUGyHai8yZiGiIJYGS6DR7XLzb
OjXUdSz7OUxBwND1g4D8vP0u0s7k2Z/1Vpq16Kkag3ePtO3fVXWfoH2Bef3/PWLs
F0IqHO7eX7ZF/CTNSP854pFcl7/NmqBlu3JLkrklWFsFod0oMyev153XIVyJK8Up
hnHeT7fg0fiBKlr9Cn4XQIbtF5a1Bhq6ukQJJ0cbiu2Tbo8ws5EWrcWamsEQU9H7
Objge4EB3S2oEUpMIEeF34xMCxcLvRU1bpSZtNXdXSPCq+AL+FUHvtR6XCAFxHee
5+GHTAIBistEEvB2bMQK3ounSvn+56+dbKoaroSs3sijuBHXjQZdaRJjDVxvL7Ev
bO2Evk2g
=t3bz
-----END PGP SIGNATURE-----

--=_MailMate_6BECA252-51F8-4F56-A924-E26362AA67F0_=--
