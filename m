Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 826856C7F17
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 14:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjk9Q31r2z3fTD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 00:50:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eIWSxbDH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e88::610; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=eIWSxbDH;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e88::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pjk8V41xMz3fJ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 00:49:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AO5fgiiKvbp+FtIz+XFTVQzS6GCllakEdsOQbxBxNIb6QmPSWXZQvUuDQGuaW1oi9+zQxB0EySNnxs07rqEMv1zs3EBs1Zxgd5gu14XLcHpTGIGSdHHbVuCDfJUnn65nkO6EdcKaFyLnKY9gVb2g7322LoAk+i5Jq/kOX953DgqvJk/0AfFIMJTl3SukFiJMrVW2usZKFOHFUPBKJrXaxO7KjbIswClEeNGnGHpRZ5rSMw5XPoWYoZ+VmfLWXvPq1mZcr3yUI5Z+C6NslOVHURcbcMYMISUBfXtgUKvpVxMTzJwSs40dT5u2NwZ93FgiIadTVf1axKXI3cEsvrn/WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvg8lROentx0LnNhx0Hl0Ztws+5206tkx9RwjxNZ68c=;
 b=bwUA7M8CY5khuFFL14CVIwimQoykYEHkBcte/TZ4AxOdsk3i8kaQMANq30LTf2bVEuuWQ0LyHC+33GJXJkF6Z4N/fArY+eIfC1L5z9NBhZrpGZ8SoeJdQmHJFwSbjOMnHcXQIY6vgmNgVwaKMnWv86NPzGR6nlgdB1EfUjKzL2iVodqrPAE2SVZBAzax/d18twzzxIWWpg5L7IEig6211BAEJSFFTxgmoxXLg9x0FRHxEvbsbb8g+A9zLu3vEDhpuNeSGBtTPpJaU3Mit2RXqURZYSMcZ8XxHF/FyNCSNSnhGuCBTuZkIjsmWhEHSOjgssbHsqgHBVamvDSTxE7oWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kvg8lROentx0LnNhx0Hl0Ztws+5206tkx9RwjxNZ68c=;
 b=eIWSxbDHdFqyct2CqaDA80iH6ru60iYWGbhXHFicSXBLBuOvItzoF3/MGjKOSwUOIuj07jo62NkRnq6a6y0IN8PW7+QQf0XAOGaQ+ebycFTBYQSJpp2O0aD2z6iizsNttHX2aRyh58jsbZHBgOSnAjIQmRkVfbuir2LNQf3+C9guuKTR0TtMe2M1hdDBoLaFBW+nqR2lPu+NyP/NzSdoiqXes4Q4rXz8zZPW382RdXdjcAztM1ikX+XnPCgg30VS8X2ALJSSsnrBWyi6qFL5hVUcYTboHwqrkevp11rm96JbbdUS8T4bO1v0anTH1mv/oxefHKP2XOAL0kLeAdY5JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 SA0PR12MB4382.namprd12.prod.outlook.com (2603:10b6:806:9a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.38; Fri, 24 Mar 2023 13:48:53 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::bb0b:f14a:c49a:9cd7%4]) with mapi id 15.20.6178.037; Fri, 24 Mar 2023
 13:48:52 +0000
From: Zi Yan <ziy@nvidia.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 03/14] arm64: reword ARCH_FORCE_MAX_ORDER prompt and
 help text
Date: Fri, 24 Mar 2023 09:48:49 -0400
X-Mailer: MailMate (1.14r5937)
Message-ID: <0D106E04-A043-45B0-8629-11DC10127FD8@nvidia.com>
In-Reply-To: <20230324052233.2654090-4-rppt@kernel.org>
References: <20230324052233.2654090-1-rppt@kernel.org>
 <20230324052233.2654090-4-rppt@kernel.org>
Content-Type: multipart/signed;
 boundary="=_MailMate_C127E265-4DDB-40BB-87AD-DB2006154019_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: MN2PR14CA0010.namprd14.prod.outlook.com
 (2603:10b6:208:23e::15) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5744:EE_|SA0PR12MB4382:EE_
X-MS-Office365-Filtering-Correlation-Id: f3fd835f-1b41-4474-f959-08db2c6e80eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+hSCiZE00w4ECAytzmP8tJCVdKfSq8uDYPsWib/SJq/wRni5V2wGBqABcM8HSDCvUmf+1MJf+5u6KzcZsRLrWAi0PcG0bKOSSSlOY7wcVVI8aduU4Zv6/ndrR3v6htDb7YNUcmSDwTsUd3lQC+EKeIKUrLn2tz3jpGP1SJmLrFXI99+ZlDPMolgHvwRHvttwj5wfwKFIg5ue+878DdKJ1LjO++jckjzt8nZZ7EWfQBOkcxfIi0I4LtL3Mo8+m2R8lNaikEZUb2wT2vRjvPo6EbCxm0bZ3dERtxz/bWLvNAagqtWBpyffJ1La5PDmu4ZwKHsNt4tGx2vTx4tjR7xXtxv5UF7ouwyVsgw0CUkCDDDF3OhFzbBcoIGNMP77/bSTlN0QDdhsO/MvanaX75oCqxgsLhJICq5W2y44LHd8ko06oX8r2BE25c7b8XXVtDxGq7ZO4Ml+i7L+w2hN6MIfgZqBDOwO8UBQP9U3gotE5s4Kr2zgD/MX9zhWbcZz3+zTBzykmXJ6TyQn62f621S3kwRy+Kyee6jPRHeSHeFlQdc4yvfty+POCUj4zGOpU6R9rZ5p7zzdKHbrbpYZpn5psWtZhv8yAMz/LV059fPabOeyHUhBzHi0vICsH3Oq8wFJDoujhU/nBEfwpx4jJaXNGH1KDi1hKNZUsqsKrtqs8xC7/ud8rcOdcjVsZ0Xvd4IJS6ISql84mFRoQ2NJUT08UgRRfuC5U/gPjf/YSaqCr5U=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(451199018)(38100700002)(2906002)(36756003)(66476007)(83380400001)(2616005)(6486002)(186003)(478600001)(86362001)(33656002)(6916009)(66946007)(8676002)(4326008)(54906003)(66556008)(6512007)(53546011)(6666004)(6506007)(8936002)(26005)(7416002)(41300700001)(5660300002)(235185007)(316002)(45980500001)(72826004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ArbZemy+uPmNOGcVQHstQSlQXA6XGuqe6IS/t1ThEe707MTrOgZofo0Yo7I4?=
 =?us-ascii?Q?cLWtJQ9HJnRhRGbP2134cbJPdtybTHxoujVlpbQsVCzsCWFAP9T310lPr3Xk?=
 =?us-ascii?Q?M4PxHL993zLz+qCdurR1gUSa9EtSzLPqOumxh/xxdYV2EqJSDVBb+bo0D0q7?=
 =?us-ascii?Q?6hHrRDmkW5JAEhOyigWAMnvpZvZncmHMbblZBh2JR5ixvp6h+g+ZpovL7FLi?=
 =?us-ascii?Q?DX3rrhN2wNqnqOD0kWoXK88muIA0GNJ3SCRc0N6NtpiXU6uGXrnkwt27ad/d?=
 =?us-ascii?Q?+JrdjNmykBlHv7xPQPXtYTKmEK/w30eGGi6NZ+e/fl4SyLL1IQnIkyq3PVtH?=
 =?us-ascii?Q?p2zgYUcBGHqH+gYRTi4yO+z4bgYoRywlLPQvkbBzMPhLB+KTajQVh8qB1ctb?=
 =?us-ascii?Q?IlkfIem99cYGDvVRFZsc7Kgc7VVPfsOWMsa7BdUtj5YvXXouM0Q2ko2ctsSU?=
 =?us-ascii?Q?Zqrq3fzQjNEJhUG9ghOEIrzpPRg92gNfNM0Dc8BPhZQXCGwUL71y+2p5Chp8?=
 =?us-ascii?Q?bqPli6CGXJAEMB0BCn60ZVuvWz012rM8JX4imeRtNXyBKQQqgrNToo+WL3ft?=
 =?us-ascii?Q?GwQ4OUjdw0zEcc7sSGVZxrviVu6Q8E/Da8pLe8drHByNVWz6dl7myXsLUJ2r?=
 =?us-ascii?Q?kKcPnxUipBgVmuRxpQQ95xzc2h8PMnnPlsAdPdbr0ySmsioYbpt3y8LbcpWO?=
 =?us-ascii?Q?DqaiInOzK7uErk+wgXBFyo1UVXe/Qt8s9VPyJ7FMEJKHPqAenem5whvNGu10?=
 =?us-ascii?Q?yP9oYk7NJCugQWGqhzpsjQv9tJBIUxY0PDQ9x7TUq/THSCoSbbya08WPsEce?=
 =?us-ascii?Q?AUlluL1TdDg6lPREb8SbTJAEM6xTB1K6DoTE31itBnzQp5ePba4vCaxha74u?=
 =?us-ascii?Q?HKE58mR4wbYfdBLnWawFCT98/ujfgqZqiNKMRLEnj5kUT4shNw+FUpcygZZW?=
 =?us-ascii?Q?XtDFQA+hVhh0aA49oUbhCRbcz3g7rUtVrGl6o/xGMHmXWRIO/ESQa+ME/aLL?=
 =?us-ascii?Q?ORbUKrY05BVikoruU9Zc9YQ05tff8eWwCD9zfCC2TVlK8FgVirYkvLZWII69?=
 =?us-ascii?Q?vNnWRU/6ufGcVa8goe3YxO51HF2/4+9Kq8MOEP8YaMZ0IjC74SLVCMD0FC2B?=
 =?us-ascii?Q?3W2tZFCAmE1A4bJKjXqYIBgQx0SKG0Sdze1zBimpXStMyA9b4JKG9KxOnpM7?=
 =?us-ascii?Q?mRnjWoPgUEvm20ecW6roU2iUPJhrHnPqUDV157zphYcpOLwITwyk9EGijGhw?=
 =?us-ascii?Q?Rwx8rhpzUiGGfWZxWIoEgWjL86XOvstgGrjGwejE8ZFztQOlZTXPQIEMqLTs?=
 =?us-ascii?Q?5uSrVaqqlcL/v0UEKMjVUl+7+IpXD+XWA6yxUx9z9rvMSb/ie6jo/3GQu8b1?=
 =?us-ascii?Q?eUF7GOmkB164fToHPT+sHkoD8LctCXPXneazRbdbv3qw4NQBgGljw+ImPyPe?=
 =?us-ascii?Q?9Sp/GEm+1eELXoEonlFOlajN+W3KQ3AUio1CTgOP7gyDYcdI93aSwqaSmzFM?=
 =?us-ascii?Q?zCStBVtJXQCJxzqL5MXQd0nI6/UcOk6Q5TFkORgCygOA01TmnUEYnGxO3DVC?=
 =?us-ascii?Q?RFIs4fZKsx6hurzgK0cB8hAGSSio5IDTNTBq0T+E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3fd835f-1b41-4474-f959-08db2c6e80eb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 13:48:52.6529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: he5SjmLElUsSYpWnnrahnd5fRDu5tt9GSyDjRRkeOO5vs5+/B/cAZ/kQkn5oIYJa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4382
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

--=_MailMate_C127E265-4DDB-40BB-87AD-DB2006154019_=
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
>  arch/arm64/Kconfig | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 7324032af859..cdaf52ac4018 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1487,24 +1487,24 @@ config XEN
>  # 16K |       27          |      14      |       13        |         1=
1         |
>  # 64K |       29          |      16      |       13        |         1=
3         |
>  config ARCH_FORCE_MAX_ORDER
> -	int "Maximum zone order" if EXPERT && (ARM64_4K_PAGES || ARM64_16K_PA=
GES)
> +	int "Order of maximal physically contiguous allocations" if ARM64_4K_=
PAGES || ARM64_16K_PAGES

It seems that "if EXPERT" was dropped by accident here.

>  	default "13" if ARM64_64K_PAGES
>  	default "11" if ARM64_16K_PAGES
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
> -	  We make sure that we can allocate up to a HugePage size for each co=
nfiguration.
> -	  Hence we have :
> -		MAX_ORDER =3D PMD_SHIFT - PAGE_SHIFT  =3D> PAGE_SHIFT - 3
> +	  The maximal size of allocation cannot exceed the size of the
> +	  section, so the value of MAX_ORDER should satisfy
>
> -	  However for 4K, we choose a higher default value, 10 as opposed to =
9, giving us
> -	  4M allocations matching the default size used by generic code.
> +	    MAX_ORDER + PAGE_SHIFT <=3D SECTION_SIZE_BITS
> +
> +	  Don't change if unsure.
>
>  config UNMAP_KERNEL_AT_EL0
>  	bool "Unmap kernel when running in userspace (aka \"KAISER\")" if EXP=
ERT
> -- =

> 2.35.1


--
Best Regards,
Yan, Zi

--=_MailMate_C127E265-4DDB-40BB-87AD-DB2006154019_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename=signature.asc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmQdqkEPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUwaIP/RG0bciGb3wj5HWQeRaRqWKWcktYcPQ7w4Dh
2pGQeKuSL51RphMV2eO9lDSw0fmEyRTvCWVHKaMCD/9leDkY5chAmu7jpb1IUPTp
3jK8kg56Iepg13Gx3EWW1KDE2y/3GarCF6JcVvSuVb0yVsP70XPbMHoS7qgI6WjN
vs14YoCZRPSA5OaCRDmrh7bc4UXkU7Biwsg8DiOsZcnjMFm3HJgafOhLQ57UWtQF
f6g/uls+c+s1BtCGgZ48iygBq1oJeVn30IkXU/+LeEPGj6qLUXJAcXqTHEXmaW8h
tbzaHVog1hMjOYuUoCfH+YAgKQ833P19IST6L2CsGh+LQZC3oPUBA7N2HGVa1RtL
YNkHl4nKsh3yX5TxNadzMdfldoW3oBho0GnxaL93gFknFl+sEudEf7ExRJeXaFjo
rCVelBEyVCfr0k6pngXCCfs/lw4SYqTb+k+ZbxA+WIgaTqOMUe62wThNnfHrENy6
OKX6UltE6o5l5XbF3T12cmWemZzBWwOVGpWSUxoImM1isuYl+6DmAbZdcDBImY80
lLTKlsK7uc9GfQfOmTCicDT9yTR16alIuxP262DfQryqYcwmHqjDwLLyk1JmdRYp
/o94M++puGJfVSMk/3fBkmvVjH/4+J18ZQ/hW4F1pCWz9OSik+y1bOfSovihFeyB
46TBIGnB
=WRnA
-----END PGP SIGNATURE-----

--=_MailMate_C127E265-4DDB-40BB-87AD-DB2006154019_=--
