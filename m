Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 802B66C7FE6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 15:31:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjl552Wbkz3fSK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 01:31:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dCaSX4uH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:fe5a::607; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=dCaSX4uH;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20607.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjl482GjNz3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 01:30:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dEf0FCfjvLw0PRbHcHnR0rSGWOwlWDEJqIG3dyfjaU802AL4UMqWm0eglKfCCVYNzV7CE8mLwFDDMwRuTsR7nwxfffH4bNMEPzn2bfmzVQh6trWKHI2spp1WGVZ6VOToNR9F38/K47nKoMCHa1410MIbwx/TAamhxQ8isWICNqxMfqBKgYRhLcLHyhWenskQxB/q10Cu6qL3Xj1NK47WRw5sqgkm/25qkbYLI/SunieSwtVa/OFOnip9ya26IVG96g11sLdfRSbKOVvZkZ6HfNQBJIGRDu1gnqW5ThbmD74VfbzAGY43TKpSXCnU3R9OSHUeDmqXpjd1wh7F5L5Ttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MC96irUs964PT9H2cqH/KwSuME4upN7qsDF7x15xaw=;
 b=YRh3lAGmIUrxdHh/LTKQAbBLh8voadAHfbMsJ2QnqzGwBrma3eGMz1a4ZIwBc8szUJ+hGTTAEbjK8sUvSwp70CXNo4WvrXnKvg7LEGBu6AXnPiCgQSl+Nud6hoeEeLs4K2A0BvcC/r3sEaZNCYv//Kgdc9EOXlD4cMqvUvoJihpdUPJOlNGQzkgjawEwbCMxr0rGZLy/FktLXMoaUg+Uypd2B9rHDtdbj1OF8VSAXj9IFMqhaFUlkNh7IKPlEnDKXTm/peU8uus6HrK0/QLknusvbK0LYHyGSMMPTk2SpKcJEWuAoByqBLAoXZ/PbGNcLzC3Tggx0vjoRepowtC4ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MC96irUs964PT9H2cqH/KwSuME4upN7qsDF7x15xaw=;
 b=dCaSX4uH0TpqCp1MgNUCNh/zxgaghZhSveMsBkZ8miowmRxuXKow+38O7Sx2aT2qrhcEDbXpJYW+tta0v18k62McEJmKmv+9VADDPRuPgTRoYFq+AtIYc+cX9ZgToPreV+N+T5FNIVBU/KqcbNgM8+N+kwuWCc80l0eRdRvfaW60HB4t/0G+iCDiorvdOxneCc1p1dJELXshNmwQoFhW49QaeyiLqOzIkMlSS7GvQhJFBePfKnuqPDe4IOnV15r10odXc7w7+CRa44NA72rkSTzGh5tHM9bx+BsosqbGiIE4HJpOdh9hJIpeHDdG1MMUyvhlQFjf8wU6VUe7zBVwew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 LV2PR12MB5965.namprd12.prod.outlook.com (2603:10b6:408:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Fri, 24 Mar
 2023 14:30:10 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7%4]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 14:30:10 +0000
From: Zi Yan <ziy@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 00/14] arch,mm: cleanup Kconfig entries for
 ARCH_FORCE_MAX_ORDER
Date: Fri, 24 Mar 2023 10:30:07 -0400
X-Mailer: MailMate (1.14r5937)
Message-ID: <F98008AC-F79C-4712-A262-4EC85BBC0B29@nvidia.com>
In-Reply-To: <20230324052233.2654090-1-rppt@kernel.org>
References: <20230324052233.2654090-1-rppt@kernel.org>
Content-Type: multipart/signed;
 boundary="=_MailMate_AF9C9367-B7B0-44B4-9E33-FE5909F259F6_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL1P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::23) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|LV2PR12MB5965:EE_
X-MS-Office365-Filtering-Correlation-Id: 51a2cf9b-b8ba-4454-3bf5-08db2c7445c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7YJGhwAeluKg/L/Mim4bj35s0p9xUm6Wdu4hvoab8mhEzSxmWugKUv6lE8DJg/szdZ1tRyFPj+gZWObzTZJtKEtuWuISfUptk7q8DwXSjNtFJCvzQdy9Jzr31u8a7BKFlyD9HSsAxMhwNpV/WPZf73ByzubttT6ABU1Y6rMpGtuOmOkEQHDgVv2Q6yRbjndMO2GYH5byk2qPBC2fHRC9Cn/ghPTdGaM+TIlC2cWrSqJfLamf4C5mjfLCFtPqoxiAg0Ys1N20G1w0gWU609RyeQMdwiqMrQe3ZlWWupfJOjJc2oum4wloUqeU1i9d7+utFeFaIIFwB0/S8fBhCqMA29e7tWrdcOEiSDLGfWDJRaDnDivcBxwLXpmNL5rFd8ZUUhN5sfRMsBCYwiRBrwaLxBwCEMut/OSlsK2moEi5dbCMwMI9m6IqUKr+q/3rz4U4xd6zSqfi/MvE5rWTa0i42/VYI+3BgtAa/769Q4jSkoH3pNMD9Gsbws9P3he8WHHlGqnVAtWMDNkMPijvQJ2nMX+ZCWlqtGyQKy40DGK7MXUf5Z+w7rxtGJDZWL1KWLe4fhBGpq7vI/ob8KBoSfEYpCnUwBzumiutW1RH3DbHjVI2Q8Mi1ype+NI3V7/U43WYJAs6IZgKU1/SZO+qjUK0FeEGR7js54rKMa0iwp8BcwbxU6xDWTrcM+6IIdIvn7bhWRipz4B7Bzx+jE1G6ZMmiqPxXlSGCIctNXDBpBC/5ZDle9NzsAzvtzH90MoNBXocVMzg4UDmdyFRXQS+Gjr9CQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199018)(33656002)(86362001)(36756003)(66476007)(38100700002)(4326008)(41300700001)(2906002)(7416002)(235185007)(5660300002)(8676002)(6916009)(66556008)(83380400001)(8936002)(2616005)(6506007)(186003)(53546011)(6512007)(26005)(54906003)(66946007)(316002)(966005)(6486002)(6666004)(478600001)(45980500001)(72826004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?BD0443Mj+IMQw1vuCfDhGSQNIXlMbkYT9sJx0yhN6KdHGa61vveT3YccXxY6?=
 =?us-ascii?Q?FMfVcctNDRg5WlZm9JHmmRv6e28a90RgDbXMZeirjhKHbmKx0ixwRhd0PtcV?=
 =?us-ascii?Q?WcyFVpMdOYrvHz1KTgvsyJZFh2ffYne9e6saS4lILrVRPsed1WgVS4kv4DuC?=
 =?us-ascii?Q?z2T3K3MBhG9XIRzkM2PthpAzQQBWQLqM6hg9vSnmCutH9Ob9GSW1zVR3Zc3x?=
 =?us-ascii?Q?AOW72rRySpyrO8KifsEeeEwZjuzjeZFe9qrqgSNle4X1DxFwScISBuXrftm4?=
 =?us-ascii?Q?cX1CHM1ZjldWugifubhUzLIEKxC3r1AqWS7DBd9EPzWJElcllqpXLdr6Visj?=
 =?us-ascii?Q?/j1x79r85fL7RIPK7s4U46zxzqhpsKT5MsZo6b/k0M60QBK90LA7TaYJQ13L?=
 =?us-ascii?Q?7qn+gziYdYKRSuDuAfL5vD/QuLmXU6CxGjHA87xMGCTDXsLZD/7MX3SqGj6q?=
 =?us-ascii?Q?FKVVgtJj3C0Om5mr9zk8pbFjb3qkywLysvnd2iEFiCPwm5YzuzyGeyPEVxRl?=
 =?us-ascii?Q?AzTNAyoXw6fgVd8B0jLrLsrsS1Wdj9I+s5jwbSW21+vkKhPeYW6oSFyQeOf7?=
 =?us-ascii?Q?ZDNnznfipj9T71R+8dhdhnusfJNPevcHJLupL1coLZSU/0h3RLZs9ODEO6t+?=
 =?us-ascii?Q?CgT0XO8CML0OLPotJFIlpxxndJ0P2bhnnvsWbSckrZjL0aDUQiKLejepF/v9?=
 =?us-ascii?Q?8SGo6JyvZzBMfX1P6xBi274P8GXxr2fuurRDANDs2uM0GUJYEzR6En2j/xkY?=
 =?us-ascii?Q?0EQH5lSV3cjzOE36SHnq9N12nqpTS9HFejmN/sKawIgyHxICFxplPrFL/suc?=
 =?us-ascii?Q?6s/1FHnp/FwYgTyginNXqWjkzn1tdy8m3a185i2HjH4IbNiQroBfqJIt7b5+?=
 =?us-ascii?Q?B+H5/pkKq3wjkJixx2G1SUQTMBKkVAhDG/EUC4WdB3Y14Nmbh2EwR6ighoQD?=
 =?us-ascii?Q?omcyRVQN4gEqF1yJuFmq05urupQMjwVTowHIo83oLzoKpFYYiQvMseZhRD7Z?=
 =?us-ascii?Q?wnB09eCgh4MLAVQDA7jwG97mU+d/RJ45ZjO2p5OXtvMWqvX/87w2/595bDGM?=
 =?us-ascii?Q?lj+fSvlY72jYqOy8UWASLAv0ftWLxsOjxaefC60VZPuhbqg4YiHZc29Obqrh?=
 =?us-ascii?Q?8En155O9lIshM3x7BY1NK63K0xs6g0oxxOwmUnKBnMVSgOYBgyEn87S8Ibu8?=
 =?us-ascii?Q?8YB6OnfDo3m0FwE7IQs0eKkoo+Ymw7Ng2ThjkAQO8oxn4740Uv54ARXqLvFO?=
 =?us-ascii?Q?610B0cknhkiYBHxTjn0fshJH94hoOdLLMZB04rkVyeqaSdIIJfQ+oOSyktC6?=
 =?us-ascii?Q?5WePp/RXvKgauiydO0NuvXTvYbi0UxG9weGHhf8PrjQtWTuPKP0u628nkDsy?=
 =?us-ascii?Q?pkZL84u4fAW6STz2e1ZaRRKONyXqP9AkIo7h2q3ZX5wZYNVC4gfM2rfjW6Ga?=
 =?us-ascii?Q?CaK72fLSd4BBxbyBDpLoeXmF3YOSE/3xxSiffRsmIP9Iw2YEBv4DQvA9bAR9?=
 =?us-ascii?Q?6po6lo8jr75uash4M6Dcb584sfc6L2efFBKdph1twY2gT8qAV9z87iQw5q5R?=
 =?us-ascii?Q?7L6exNy4xilsuQDYZrTiFYNwpQRgfNq6/89MDcl7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a2cf9b-b8ba-4454-3bf5-08db2c7445c2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 14:30:10.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kgxFhavY1qLHTUMd4Bsbu/iG5yjBUInI7yoK1vgrJDXrZzw2E854PRQRUaCcm/UR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5965
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_AF9C9367-B7B0-44B4-9E33-FE5909F259F6_=
Content-Type: text/plain

On 24 Mar 2023, at 1:22, Mike Rapoport wrote:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> Hi,
>
> Several architectures have ARCH_FORCE_MAX_ORDER in their Kconfig and
> they all have wrong and misleading prompt and help text for this option.
>
> Besides, some define insane limits for possible values of
> ARCH_FORCE_MAX_ORDER, some carefully define ranges only for a subset of
> possible configurations, some make this option configurable by users for no
> good reason.
>
> This set updates the prompt and help text everywhere and does its best to
> update actual definitions of ranges where applicable.
>
> kbuild generated a bunch of false positives because it assigns -1 to
> ARCH_FORCE_MAX_ORDER, hopefully this will be fixed soon.
>
> v2:
> * arm64: show prompt for ARCH_FORCE_MAX_ORDER only if EXPERT (Catalin)
> * Add Acked- and Reviewed-by tags (thanks Geert, Kirill and Max)
>
> v1: https://lore.kernel.org/all/20230323092156.2545741-1-rppt@kernel.org
>
> Mike Rapoport (IBM) (14):
>   arm: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   arm64: drop ranges in definition of ARCH_FORCE_MAX_ORDER
>   arm64: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   csky: drop ARCH_FORCE_MAX_ORDER
>   ia64: don't allow users to override ARCH_FORCE_MAX_ORDER
>   m68k: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   nios2: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   nios2: drop ranges for definition of ARCH_FORCE_MAX_ORDER
>   powerpc: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   powerpc: drop ranges for definition of ARCH_FORCE_MAX_ORDER
>   sh: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   sh: drop ranges for definition of ARCH_FORCE_MAX_ORDER
>   sparc: reword ARCH_FORCE_MAX_ORDER prompt and help text
>   xtensa: reword ARCH_FORCE_MAX_ORDER prompt and help text
>
>  arch/arm/Kconfig      | 16 +++++++++-------
>  arch/arm64/Kconfig    | 27 ++++++++++++---------------
>  arch/csky/Kconfig     |  4 ----
>  arch/ia64/Kconfig     |  3 +--
>  arch/m68k/Kconfig.cpu | 16 +++++++++-------
>  arch/nios2/Kconfig    | 17 +++++++++--------
>  arch/powerpc/Kconfig  | 22 +++++++++-------------
>  arch/sh/mm/Kconfig    | 19 +++++++++----------
>  arch/sparc/Kconfig    | 16 +++++++++-------
>  arch/xtensa/Kconfig   | 16 +++++++++-------
>  10 files changed, 76 insertions(+), 80 deletions(-)
>
>
> base-commit: 51551d71edbc998fd8c8afa7312db3d270f5998e

LGTM, thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi

--=_MailMate_AF9C9367-B7B0-44B4-9E33-FE5909F259F6_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmQds+8PHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUbZ0QAIf7eaNn7XRpICcQu7O+aBGUQFx1nXOLhB8I
TSkamRDGlzKDqh8cx+vZYGD6ggRJZWT6+8EXXppqveIRjSrCqiTn6vHGAJGiEfUt
TerE+ASApf0QaAkmP5A0KE2hrcJGAKpyO5MedWARmo/cIkp4vGkYTJ8QLdF9fqAc
pNbhFCw7hpUl0lPUqeStGzZwP+zIS411CCYt7P6yKxUqXeuCYdvXDO0p5yFXqCsa
uCeq63jtBnL7DekEpXSuAG5DIhr/O7lg+ulTgzHvDq/8DAodycXMg3TsJoUZOf0g
XnvlNrIs6tg4MQ4973H36LwrvmHaiDU5o1L93XnxEtHyhc7IwwvFOP8n2O4iNlCe
x4BnmVhdx+DJrcoHCWWhnetQUtLfohvsfLDqxDnuBiOYPmrcxDqvDoCJVD/u96+i
pe4ZsWeshFwrU1TU02lneEpCQG4zyKHk9V4i8+rWXGT8cGq3WkhseLrWF5lHMMs2
fAWIajYfPBTsdQC65ijd298BLenPMjKsfN0OumehVfI/iJYL7kM+T2ZscX48AN3W
xTzp+c+Hg6xCnOgf1A2mNvEPOHyEGQo5kzyTc68QUxuQzKa+7QkW3Y1aQhdEK48c
GGF7ft+PutsXRdH2OZlieImDo+NZrQ8QSGZAHmblmVEymYmzAAywp1F50XW7WlLe
pFnrtVKo
=o/9x
-----END PGP SIGNATURE-----

--=_MailMate_AF9C9367-B7B0-44B4-9E33-FE5909F259F6_=--
