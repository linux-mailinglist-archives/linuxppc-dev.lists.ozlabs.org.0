Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1E96C7FDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 15:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjl3T38thz3fSv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 01:29:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gLTvotLs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eab::60a; helo=nam11-co1-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=gLTvotLs;
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eab::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjl2V4vGsz3fFM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 01:29:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l53PZm8uLUXpgLnSqfoFBz4NYIsqweuPa/tnfRrgA3JhynqraJOWUrZAC8BnlHDOGVJFHNAzyWAbKj+Z3jw30dE94ulz6iLt89GYspvbmrgIpPjxAT61m6ct0am0gXEPBWChX4I4XwDArldr/Op9PE+sHP7j1XJC0eo2mTCdzwI0DnFkeTl9u36oxmafTjYbG47AWgziwGruwQOsYoYNer8pHGysLfbXF8FVQpflJRWddIyFwReBNBWEKlhrkU6joxzuu2RwvWoVfn32lv5phUsYgaEbO9wbGvygdHOWsJVU2uoZGthUAcdWuOpBV4eD5JSb/Cn1sz2UiIjcGj+zQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xF6JSlAwgBIteejK3S79gczO+H6a5Hbiphi2LN1OgGs=;
 b=ijL45wtkJgq4eYWS5oaVAzoXyGtWsdbl4DjfIsyBpP4HAHogC6DsdN8/WGdR4MTzck9FFulL7lHYQIjMxXKxg/SlV2U2X40ZgsjUfMMExPo/0EzHI3UzWJI0HJunrcCwn4dqEUo3rhTm4ad23BjdGrXPpDM/hlULyiuu/VoUZ0Bkp3aiLLnDVpGLDmbbLsQ9rwiGUzEa/Hl21aEZM/pHoT/bFB05z/sTkeOEKJ4iu5X7ZXKZGpOV4Uh2TlALR/EzGbHzWU68riIRoz+UNtQJ/bTEI0JH09sKqKLdZJsJ0pfX2GpNwCp+e5s1bihJt7MPilljNcM6aAZvLZZGQd1YSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xF6JSlAwgBIteejK3S79gczO+H6a5Hbiphi2LN1OgGs=;
 b=gLTvotLs+alF4QPZRN+5bDyWm4i9408wj6gQ3a7SRhvXNxH4QVgbvYM05p4CvzTbmXvent7Sp7uIhw1LlOvOgDYJS9kwgbf1hvQsSYASkrox5Ck414VXP7ToG0B2HA/geuWubtx8zcdTNYRFqi2/2FdeYBvgIeGBKNLgC17BKcKQKYWBY6dgkJDo/FQahZElt5lRqzhcc2Cc19zRhzCUCcrpzki8i3k5zaoMcwkf+M3iSQP4MeTkoKQc7uEb6qVDlZKVo3EGKqeQW2TlgJSoiXc2dkW3Xw35Ey3LvsNOewV8o6m+/fOYuh3etYId40nPTBGspKW3sO3BxEBZVDL6tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 DM6PR12MB4185.namprd12.prod.outlook.com (2603:10b6:5:216::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Fri, 24 Mar 2023 14:28:40 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7%4]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 14:28:40 +0000
From: Zi Yan <ziy@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 11/14] sh: reword ARCH_FORCE_MAX_ORDER prompt and help
 text
Date: Fri, 24 Mar 2023 10:28:36 -0400
X-Mailer: MailMate (1.14r5937)
Message-ID: <FD865F1A-3878-4829-ADD7-AE4C5E347A9B@nvidia.com>
In-Reply-To: <20230324052233.2654090-12-rppt@kernel.org>
References: <20230324052233.2654090-1-rppt@kernel.org>
 <20230324052233.2654090-12-rppt@kernel.org>
Content-Type: multipart/signed;
 boundary="=_MailMate_EBE470C3-E8AE-4DE1-A309-2E8D4C914274_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR19CA0012.namprd19.prod.outlook.com
 (2603:10b6:208:178::25) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|DM6PR12MB4185:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e009667-840b-49a9-985a-08db2c740fd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wnzz1KkkX7ezNywrPwrsJnufplc9OjVYSkpy93FJvUlfr6Lvg0GqLEMNDABP+hm/HFQNhbiMtPXnsJS4Osn9PvOX7/qJ41EExdablfYVGl0HwCcB+o296Fz4e6Pfeja2ajEIJ7K3+WZ/kGq9FTEtdZasiLrozc2roNUoEbRmHIcLjbx5W1gaBBSik7tq+4MEgnMhaZZ6jl/ts/qNmMAzeescqRwrT9em9OZ6n9oqfiAJoj8GgIqTJAaBV8ir0A9KWONfLHIyGHpGv0EifhGxEPiGe8gaNRTGkFhlHK5lrMNLy11c/N5yPl/Ox6DR5g8DR7o9ncV9Md/dG59hhfessnNAnEI7CMcVLIIQlcp/FfzFZb1hltMzkAF2o8rdWJabMIYfLjZwpq7MZzHShabL9z0B8dn0mXk+touCO0FADJ2r1XJDqF9HHIIZh6UFmxP9NHaVjH+BMO397GCBauXEaM8eWsmIsV/Eng2B2NlS7ZDu6nFfhZOens9ukQ7OA3HJLaCgFRIFGkXKMOOGkOOGhdnPVO1BLNKl785NmxysCPhrS36lp1nzGaFfx/R2OHoCl+2SNDgz17rNP89UwfBvUIylElRioIOzPaLcklCyHihXBCESLRtAWvTU7mGwxx4QRFEH93jMdcY/k8jKEjTsCs4jr7xfYP+4aGnMWoduSl1UrTVrMF6xj52cNxmG99CcOtnnNGFbBX3k9wPTFHW3W7G/3Q9yx8GsmZC2OKzb7iI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(451199018)(66556008)(66476007)(6916009)(53546011)(4326008)(66946007)(54906003)(8676002)(5660300002)(235185007)(7416002)(41300700001)(6506007)(8936002)(26005)(6512007)(186003)(316002)(478600001)(2616005)(6486002)(36756003)(6666004)(33656002)(83380400001)(86362001)(2906002)(38100700002)(45980500001)(72826004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qO96Bwx67OxzFlqzJYhSffUOqqs19Ycmz0sm6ZcL5GnTYlQrRYcGc5NxnL9v?=
 =?us-ascii?Q?tQZAPALEQH2FIA+Q596V3tHCxPHAUqJGzYaI7FriFt6zQM8htkN547pp7vXS?=
 =?us-ascii?Q?RWW0KpShvnGAE1Cztq9THYKovRRIfiCkzkL4lSXUeQd2NhkJg8BH01CZtOKa?=
 =?us-ascii?Q?oyNiJu2RK+u1pmsHrgpKEIg8hjSeiu68085/+wBJrYXcckACIdta5h1Oe7h3?=
 =?us-ascii?Q?+0ChM2m2vTLssXAkwoe71kKRWtrlMt/G8HuId2UVh+kerEjKezysqA/3agM7?=
 =?us-ascii?Q?ySGOVOvmTtZL3L6myrZgwuikp9NFcsDl1T2EKXbpI3YEp8lq0oQstsWTRO3x?=
 =?us-ascii?Q?sTaA89mL8eovD6JgG/aov4jDmlqk2r/dVsidfcnCWxT3YeWMbye4rkEOGseT?=
 =?us-ascii?Q?0CfOERDXiF7C95LwJ013+kGmMztJ+e0nqgNWHcO0XutNUlYqc9DtBriLNS6F?=
 =?us-ascii?Q?rhPSH81SWIOZqDxcqgSi8Arox2wSbZEpdPRcSgs2NIhsps1fPUFh18Gatp/3?=
 =?us-ascii?Q?ruXrYrTTJKgARMDXF7Bv+lWM0r8Tjcj3jEVYWc9rBh8j9/MwYjGSKXtKDT6b?=
 =?us-ascii?Q?B2W0RllkJ55Gl+uF6RrKHIMQeaMHQrK89L9s/lOESuWVNzaqSf3tkw65Unlk?=
 =?us-ascii?Q?Xa5KpLL7aLTWKxugIRa5Xbq6RkJUZGZXyk/wLzrWHHFi5LDvr/WapfJjsdcf?=
 =?us-ascii?Q?ZUhvAU8h/FP7w5fqUq/KXoD4TU33YPqk3BIy1xHi8QC7l33oWh8cWxrw03es?=
 =?us-ascii?Q?ue6y9l2mMawOGoqDQ395u5XAFkb+s3ygIyoAPPnHa8Luc8XlqHTzFFUEUhE0?=
 =?us-ascii?Q?nLFGST0raqzdNFhxGLY6zZulysaOhJaPDS3f6tiY2AkwQm/5yOSQEMQn/nUP?=
 =?us-ascii?Q?3z+JgzBCXHrHCM4oNUSzAWWarxIcM+3rvi5ywzOAHQp8uc9LVupeJCo4oyOP?=
 =?us-ascii?Q?1uPc3SlD7rFOFelqHbZ52IUAepbJjk1T09MpTb+18qqMTJBj8oPmnofjK6ov?=
 =?us-ascii?Q?MDpotbKp5UBukHkpmSNh3FmnYn308zIqXY+DY89UKhk5ImXxUfbRn4smBUT5?=
 =?us-ascii?Q?gJiq3wkgbtome16M9cxWnL7FYpOLPuyqlTZtY5yFeoDm/5PwvTS2iqJA980g?=
 =?us-ascii?Q?B2Ra899dHEFgYm0R5qZs9wUwewCTAylnk9+fzlUZI9qFaHlZVkm8DKu+PkJP?=
 =?us-ascii?Q?UD+npX7M6pyhX8ZCuQSbY2S3z6T+JWqlXiAlR+u3kt4xc5w9nwsKSv4psNdl?=
 =?us-ascii?Q?sCQ3BMTySUmvY6KvDjWhprr8risaStVy6KqN2o83EDBNXEwJObg0qfU8V/fY?=
 =?us-ascii?Q?uActpnJ2Tz/zezkVR4mjFZgIlSHc/IsLnwVZxCPwHA8HmH2rQyJnghT/TF2j?=
 =?us-ascii?Q?2x8l7AUuUZd4+ipszmPAJM1kq+2u7CPFF5PcZBmXM1/ZleKtK/KrmAysT7fw?=
 =?us-ascii?Q?Th2sMs0w1OAs5FQ8o5DxnKR0Se54Hsitih2JHhQqM4SX/bWP8o3jMO/A0PnB?=
 =?us-ascii?Q?pHCajneX8vX2REZt+UsDtuweKwaCyFqIs0OyH5nOel/pZmZAZh1F5eVxENqX?=
 =?us-ascii?Q?oU8V4mEQBx2X4/jN6vfFP9Mflq6Ab4OPJUfU+qvb?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e009667-840b-49a9-985a-08db2c740fd9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 14:28:39.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7TR2a0CMS2iXN8ww/XWYbg4ZQXOVo/gUQj0a0Tw8ox4dBvgSZUQm43uLN7j5eg0K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4185
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

--=_MailMate_EBE470C3-E8AE-4DE1-A309-2E8D4C914274_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On 24 Mar 2023, at 1:22, Mike Rapoport wrote:

> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
>
> The prompt and help text of ARCH_FORCE_MAX_ORDER are not even close to
> describe this configuration option.
>
> Update both to actually describe what this option does.
>
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> ---
>  arch/sh/mm/Kconfig | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/arch/sh/mm/Kconfig b/arch/sh/mm/Kconfig
> index 40271090bd7d..fb15ba1052ba 100644
> --- a/arch/sh/mm/Kconfig
> +++ b/arch/sh/mm/Kconfig
> @@ -19,8 +19,7 @@ config PAGE_OFFSET
>  	default "0x00000000"
>
>  config ARCH_FORCE_MAX_ORDER
> -	int "Maximum zone order"
> -	range 8 63 if PAGE_SIZE_16KB

This range is dropped in current patch, but the other ranges are dropped =
in
the next patch. But feel free to ignore this since ultimately the ranges
are all dropped.

> +	int "Order of maximal physically contiguous allocations"
>  	default "8" if PAGE_SIZE_16KB
>  	range 6 63 if PAGE_SIZE_64KB
>  	default "6" if PAGE_SIZE_64KB
> @@ -28,16 +27,18 @@ config ARCH_FORCE_MAX_ORDER
>  	default "13" if !MMU
>  	default "10"
>  	help
> -	  The kernel memory allocator divides physically contiguous memory
> -	  blocks into "zones", where each zone is a power of two number of
> -	  pages.  This option selects the largest power of two that the kerne=
l
> -	  keeps in the memory allocator.  If you need to allocate very large
> -	  blocks of physically contiguous memory, then you may need to
> -	  increase this value.
> +	  The kernel page allocator limits the size of maximal physically
> +	  contiguous allocations. The limit is called MAX_ORDER and it
> +	  defines the maximal power of two of number of pages that can be
> +	  allocated as a single contiguous block. This option allows
> +	  overriding the default setting when ability to allocate very
> +	  large blocks of physically contiguous memory is required.
>
>  	  The page size is not necessarily 4KB. Keep this in mind when
>  	  choosing a value for this option.
>
> +	  Don't change if unsure.
> +
>  config MEMORY_START
>  	hex "Physical memory start address"
>  	default "0x08000000"
> -- =

> 2.35.1


--
Best Regards,
Yan, Zi

--=_MailMate_EBE470C3-E8AE-4DE1-A309-2E8D4C914274_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmQds5QPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhU6+sQAJM0BaoLQ3JYR+tN4yC8YqhEBdUlGAiar2eu
amh3KB7M4ygrGx4ivtA/P7dJtCyBDC7LQcpamgwUUGLEeUbxD0O5SPmctZz7Z+ER
awE6TdkjuecDXdm2G5WB4OC/FUFWJ/kHar6eaGSybjQzg31LiU0pOAJus8l0l9v/
PTlEdBnB+XVp6E6TVHafnNai3twlKguqamkAjDpaINar97BtNMuXPDBcBKXeS+RK
9FvK/kWOO8ZpLu1N0RMAYaBEmBtZKedErzKTOzRzM0WwpqTVzWy1gwUmiqKxWr15
OrGrLLzjGcekWkyfRXOC48H/CLWDGZJNE+kElE8vW/cKl2tFhw0aS2RjxvKspYDF
sEdf3jiO9eq4u5nxIgkxc+7Ub+NFruZhPEnfcN5b8yK0I+n6rvdA9+HtQKqDqTAz
VC2HtBqKZKvV5q6hBJFSwBaOKkc7r9/3byaOJsJB50+kNpJkL4O643MUCZlXlf1q
3/X5yMLNC6HtFWfLNUz3TjaJnEuVmqhzulFi1ejm1eN7hJV65xZBgSTpOAA62X2J
hjGWuTQIXclo15ysx94I+oDW9KlIT+Uj4GMY/6sGUNvhPvwXIuKgvvSOsG7YubF2
/IUUoi0yQCXK+NpcdG3nYMosWesxpGrT2Q6Ou0hTbfylUIlnWUput4ARcFqwt5uQ
MLJrryCO
=cDus
-----END PGP SIGNATURE-----

--=_MailMate_EBE470C3-E8AE-4DE1-A309-2E8D4C914274_=--
