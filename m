Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DBB54E207
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 15:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LP37F5svPz3bq3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 23:34:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jehQENx4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7e89::606; helo=nam10-mw2-obe.outbound.protection.outlook.com; envelope-from=ziy@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=jehQENx4;
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LP36Q5NzHz307n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 23:33:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EqQSUMxIb+VRZUH6wkvzsLi/BwyfsPdqIlaRBMxKma2odF1D4+gZhMnLamYH4joze7sCSYPFXxZItUN4tohAuri0AIzWWlZjT6uXQ+1q5PziDwnzDgBo4mCIKZYFVo5PiXb3Vr58nPaoa6BHiDUQGKKxQSCB3q401lpunl7JKMKg61wZvZY5k5Rn/hQdN4AUrFT6kZ4knUefwhR/OM17rkmKMtWYmaap4IwZIIF9KVaO8IF839qxXmX+fSF9Wl4h5qWDvueoEWjCCBl2bOepw0X4jsBfc1mfeYX+ppyAyADLiGGmHglpCl0ECv+pvR7rw2U/+tj2qsRngdmPrZqeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yXswTFGbLfy9R8bGqy5/RtUQiowTEp/QSX16vveoWU=;
 b=k5gzEoGHFSvm1yeDH1j9GJiMsQ/wSift3E/TvzA1Rgt+XeLGlt5fCTFxMSJ33pbJVJCH6K8Bd1Tbh+Colc2XSpu0u/WFKi36Dj6uNnxETUcCJA0FlUVVKP7MsopkbWyp/mbSbQ3HDZ+OtA6HrnzzdBT8rMnsEcbMNi73aypciEWGC0RV7xMDaUo8kzMxOUMh4lZkvIGqQXJiRWZUm5LtI30U0WpWXYxKULaB/MnlzmpQG5VKI+KgHoo5NA2fwjJrW/lRsL0cze+k0/mUv4JLY6iwZWLxDjyaqPNeWGhrtotKas/vbNwgWdSrr2Qu5NH12Zc8ifmD+Rro7b5+u2mDsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yXswTFGbLfy9R8bGqy5/RtUQiowTEp/QSX16vveoWU=;
 b=jehQENx4dIUl8C1YuoHzI1YR7PyDVzU7U+APQ0MTjNTq9uui5S3Uf2dUvkJKMvDpupBYJ56Zzas+SQHAU64Yv+KoRmbgG0hB6Yoo+4Jh+XaGLSjtt9rtAGAsyzOJFPWn3luS8mSz0lOVi62d/MXwX+qG9T2Vhad06/PiHREVqRZ9Nbb6YUWKA/92BxwgTv7XIME/nYzbP/V7qvRIbg7rppISW5aH3OBa0x+z+xolOhwtD8+xa18N8Yi3XclQGP4dFV4+R+FluGQgx88iCie1xPWB9cDSzYS6ufB8JGO0LonptE61ArNSMYp2VGlUnT1+W4XoiOwFReqIo+tm7I4xng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB5744.namprd12.prod.outlook.com (2603:10b6:8:73::18) by
 DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5332.15; Thu, 16 Jun 2022 13:33:26 +0000
Received: from DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::2030:d898:6e2f:3471]) by DS7PR12MB5744.namprd12.prod.outlook.com
 ([fe80::2030:d898:6e2f:3471%9]) with mapi id 15.20.5332.022; Thu, 16 Jun 2022
 13:33:25 +0000
From: Zi Yan <ziy@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/mm: Move CMA reservations after initmem_init()
Date: Thu, 16 Jun 2022 09:33:24 -0400
X-Mailer: MailMate (1.14r5898)
Message-ID: <4D0D6014-8CA5-4B04-BD84-DA7D89716AE1@nvidia.com>
In-Reply-To: <20220616120033.1976732-1-mpe@ellerman.id.au>
References: <20220616120033.1976732-1-mpe@ellerman.id.au>
Content-Type: multipart/signed;
 boundary="=_MailMate_B4EA0124-BF54-454A-BF07-8038F0D1C9C6_=";
 micalg=pgp-sha512; protocol="application/pgp-signature"
X-ClientProxiedBy: BL0PR1501CA0024.namprd15.prod.outlook.com
 (2603:10b6:207:17::37) To DS7PR12MB5744.namprd12.prod.outlook.com
 (2603:10b6:8:73::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e813b7d-cce6-4791-99bd-08da4f9cca7f
X-MS-TrafficTypeDiagnostic: DS0PR12MB6533:EE_
X-Microsoft-Antispam-PRVS: 	<DS0PR12MB65330EB152F31078021957C2C2AC9@DS0PR12MB6533.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HcHM4K00Q3fzrmde0TBITISUPXGT+Z6wvj1vFDHOO8GJRzig7+EGU5cshXJWceumJppX23U5ohADrkc29xyykvOYIA8kN5i8yXlEkZUC7zkrDhYfVihWM38rWTBb5YQcdUJto6/T8c1h62mBljEELGEvaFzd7/xuipTBuHSStcDRbXXDNZ9Z6tQRshVsxyTsdBdxJLWIcYNrQ5C8VwCPuj0zwHh3p/coo1HhFVUHkz93i/4BNI5XMf1PkhNKUu5mNbueLXe6rSHjG3yvKZ54XBdgbrglb/vBCo309ssJek17/2utYAhQiRaugcWHGs7gWJn3k4gZ4lQskYa2PoCf+Wl65Lh1bjKY9Gj7o9ZdNwL/CiG9pw08xCMwtIESH5O+dV7zDSHa2hLFtZcBpZqxtl3J8jGzVbu0fXd9+xB1Ki9GIm5MmdSxKnS1py6FdwX0lLt7t6AlboSLkHEIPf954pjG7bSUa4vrNwtMWrzZkIXkXTTzDKIrILmTq/iVqJZYt6POOujuAdR9zgPp4jtM42pJUCjJphb2+P6B6I1uMs4hepmUTsr6XXvGZZmscV2vGSTg2pGQnGRjfIemntDSpTdFtnH5G2ReNSNoU9fPEU0ljB3Bphf+AjWvODPpOzQOVB7g/4B+hWMORujPDOoX2pWUYrOaVwEzm1RlNxkcnarV1wGBxCr4riSNIBnzQ3JCvqFGa+U62FzhD4pD82ks7h8XEDf2fwv5xs/kqnaiIwI=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB5744.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(8936002)(66556008)(66476007)(21480400003)(6512007)(66946007)(235185007)(5660300002)(6486002)(33656002)(2906002)(53546011)(2616005)(508600001)(86362001)(6506007)(26005)(6916009)(4326008)(316002)(186003)(38100700002)(36756003)(8676002)(83380400001)(45980500001)(72826004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6A+JEkaQeHjzv/OX9/5/xa/2N9ilGZZ33BNMyq3/RUJvVC+PNwxS6lPHBY1x?=
 =?us-ascii?Q?MICRQkCyt2vPAX4e1KJagQ7cuwmBBEcDuTfl3DszHw0fK91Ddnsr/BW+Kn3J?=
 =?us-ascii?Q?TtAXXOTDBnO5G313oqm+JKcdgW++wKEMXHUHsynuGd1EhA8D3q9apqojZr9a?=
 =?us-ascii?Q?WoAaJysWxCI7A7sy8vjaCRO5+FJz0AIJgPApXUJyL+rGUwt2lpfVrRLFyLvO?=
 =?us-ascii?Q?o8Sj0i0qJ2zb9nlgqsbXpp4zdJjgFGE0Qmc0oZTW/Ql6W41zuHA2laO4w5P1?=
 =?us-ascii?Q?5OEZAjE/LEf38GpXctA/0LKkvkkwWFJxqgm+J8zd+42giXtT5mSCK4FEtR3q?=
 =?us-ascii?Q?THcB6iDgDLlilZqWWUdkjAn8F3vUq7r13K1r4sqaOvJ91/PLhiqaHFV2qKyM?=
 =?us-ascii?Q?HIf1WsfyuHAhSrzNN8DOSB5SYCII6WwEWDcBM4NYB9V+OHvM/MfPD7ElXv60?=
 =?us-ascii?Q?Dj7I4/LgeNnK+nooiGCmgylN3wpX2euAUsNC/ISvZ8Y+/dqwysrE+NSA+Hsb?=
 =?us-ascii?Q?FiM+B6eZ8LS/C4ZpQR4D8PGQAXbT5IxCfhJ2O++T1PRhs3AimiNceHqpDmvp?=
 =?us-ascii?Q?qRV5KT4PCTaVG5G7Cv6nVwbkxr3NLCAiFOPATqiCTGjV6L12kFlCWb48kmxJ?=
 =?us-ascii?Q?whFiTnv0ZfFgDhv0iTJaagyczSkB/LO2B8HGg+AADkpZr/dAzV62zY1kmiw5?=
 =?us-ascii?Q?vW5JN7r7ZlebxkMbb/0uCdAunZELg4QV1P5xWz0m8hKIQiRP3BWrOZcF9tkX?=
 =?us-ascii?Q?QYYkDdyuayPKOPhjHBNsauCgLcehVNRNVUMe4AorbVN4FmnnmIGNS4L2SVUC?=
 =?us-ascii?Q?oBgbK6lr9rnv6ELPaXsXsOkHpDbHV+qUbZ/uxENh4wXCQUgwJCRV6tkhIjLb?=
 =?us-ascii?Q?gx0iM1tvHO7sQWZO/RJkz+waJ3WZ4G+mHmcTnu5Sb7KjLAoAvpsVz7tz2rvl?=
 =?us-ascii?Q?qQdkBFLJ2vrq8Y4QhjhsNYNBtOGZ1lZXKlr1jOEQuVpM/HMz7YeC9cJwSwhF?=
 =?us-ascii?Q?twt+lDjpcJTGwkh7UMVLY29+KkWjioidpF0vhPpZ3Tns6IYvNaHDnQcF4Cci?=
 =?us-ascii?Q?lQiydaMUsYbPz2z1bMTQ73GMhgc0l1DaiLHYSPHCKiBF+/BZMNAu9v3wMku2?=
 =?us-ascii?Q?x5R1YMGbVTRus4KBrhocVJ+CqTnL0iRBGy9WsLdEEBAiGJzdpyAmDdJHeB2z?=
 =?us-ascii?Q?rXWfudYNZYbHQVBKTFFoosomkWaYnuQ5Qz44XAObjCbHBKWY05H5wZDDMasm?=
 =?us-ascii?Q?yVEd0mBOmPznlk69eQeZgXY5uxdXQzVUdVfQqdnhFTxZf4YerOE2VBC+wP/e?=
 =?us-ascii?Q?uAk3CN5R37nQthZCt0i7WGTS2Xv9FwAqDIaVa0g4v1P55zk+j4jjqx6sFgqj?=
 =?us-ascii?Q?U26HjBJh+VKCU+saP/5yepJnwtFrmfQADqQgbNs3Rb8DndKq9pi3Wf6uKI+M?=
 =?us-ascii?Q?hBLKv0KeLxRtXI5J6w1CXFTavFnzaruuhOrAjXOH3tXGAdzd8Zs2cJzru2V/?=
 =?us-ascii?Q?Tkk92y0xzkX7wMQp04iERsrsiGMi0m7IeasXf4pvmldG0nocBQbTIZos1E3N?=
 =?us-ascii?Q?3LekNqXGvWdUpm2I8sbfUFSUH5C9YQcTWvr8PkUTOlIoqw/DnHDw92iGMplt?=
 =?us-ascii?Q?FuHGsQog6GQ5PbsjYrhzk7xEFwAkj5U8WmBD54XOsOccrzFT9TTUqya9K9wF?=
 =?us-ascii?Q?ylwooN4IOkzcUEyQqqK5P7Fm4nO/NbfFfg31CWFYO663w24Yjym67vkChE1b?=
 =?us-ascii?Q?gYb2+e3eYA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e813b7d-cce6-4791-99bd-08da4f9cca7f
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5744.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2022 13:33:25.8292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5zbtyujjMf1flY2FEYFKKa9E9SzJFVBacE5K25nlIJG5r+2o8IAiT2mQKWT1G8HC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533
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
Cc: aneesh.kumar@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--=_MailMate_B4EA0124-BF54-454A-BF07-8038F0D1C9C6_=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable



On 16 Jun 2022, at 8:00, Michael Ellerman wrote:

> After commit 11ac3e87ce09 ("mm: cma: use pageblock_order as the single
> alignment") there is an error at boot about the KVM CMA reservation
> failing, eg:
>
>   kvm_cma_reserve: reserving 6553 MiB for global area
>   cma: Failed to reserve 6553 MiB
>
> That makes it impossible to start KVM guests using the hash MMU with
> more than 2G of memory, because the VM is unable to allocate a large
> enough region for the hash page table, eg:
>
>   $ qemu-system-ppc64 -enable-kvm -M pseries -m 4G ...
>   qemu-system-ppc64: Failed to allocate KVM HPT of order 25: Cannot all=
ocate memory
>
> Aneesh pointed out that this happens because when kvm_cma_reserve() is
> called, pageblock_order has not been initialised yet, and is still zero=
,
> causing the checks in cma_init_reserved_mem() against
> CMA_MIN_ALIGNMENT_PAGES to fail.
>
> Fix it by moving the call to kvm_cma_reserve() after initmem_init(). Th=
e
> pageblock_order is initialised in sparse_init() which is called from
> initmem_init().
>
> Also move the hugetlb CMA reservation.
>
> Fixes: 11ac3e87ce09 ("mm: cma: use pageblock_order as the single alignm=
ent")
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/setup-common.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/s=
etup-common.c
> index eb0077b302e2..1a02629ec70b 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -935,12 +935,6 @@ void __init setup_arch(char **cmdline_p)
>  	/* Print various info about the machine that has been gathered so far=
=2E */
>  	print_system_info();
>
> -	/* Reserve large chunks of memory for use by CMA for KVM. */
> -	kvm_cma_reserve();
> -
> -	/*  Reserve large chunks of memory for us by CMA for hugetlb */
> -	gigantic_hugetlb_cma_reserve();
> -
>  	klp_init_thread_info(&init_task);
>
>  	setup_initial_init_mm(_stext, _etext, _edata, _end);
> @@ -955,6 +949,13 @@ void __init setup_arch(char **cmdline_p)
>
>  	initmem_init();
>
> +	/*
> +	 * Reserve large chunks of memory for use by CMA for KVM and hugetlb.=
 These must
> +	 * be called after initmem_init(), so that pageblock_order is initial=
ised.
> +	 */
> +	kvm_cma_reserve();
> +	gigantic_hugetlb_cma_reserve();
> +
>  	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>
>  	if (ppc_md.setup_arch)
> -- =

> 2.35.3

Thank you for the fix.

Reviewed-by: Zi Yan <ziy@nvidia.com>


--
Best Regards,
Yan, Zi

--=_MailMate_B4EA0124-BF54-454A-BF07-8038F0D1C9C6_=
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJDBAEBCgAtFiEE6rR4j8RuQ2XmaZol4n+egRQHKFQFAmKrMSQPHHppeUBudmlk
aWEuY29tAAoJEOJ/noEUByhUsUQP/it+++KzJYKv2z6EMDuVfiZlECJx4X+CD9Aq
noDI2Z8SabM3UlDLhIDebe1D4D8+OfLBIpEvfho7/BeCH/MBL1+193nODsvSIjhM
0Eg05trk7rW96abDcr+RmJjWlHq1WhdS/AEXI95vEfYVe+Wv57qg6DDcym7z4RKc
OauQfY/RDZAvF7+VzWYKcA2FxzOVtikxRpqQtMW2jMQ+V+K3Gb96XEwwUkjeVNSz
GMHiLIJ5JLJSXX2EZdAHQVCp5zqPjDT8isryGoJc8RS9dkrgvtibFd0smEolkWtp
v7qqxWqhg1ae3tWEV3iCinGoJ/KrLMChFiFdITYVaJaGzVbvHjHx+25lEXF4Yn9x
N+OMLUGtK3QU0et57YHHo7dJgT66yFRCcTRC+VFnGjkd4TTv9djvJbEIjGmnxc5A
eq1xWtn3oskvIqV1usJ9z5jb/8MgsNJttdA/KqwgGZMoDnlrd55Xhr4E133gmPQV
gS5SjRN0/mHyQbF5qyvSWkQ+hfESnru8xYneJFWqkCOvkgpMMrttzaxS9COL2Sjm
eQUmjJzVsyprtt83/1tTMbfv83BdDaznP+mymgm1GrUzB4TH2Bpv7+VJRCse+OSr
z04/sMClOxKzhCVFJiW3JVmYgjMnK5A3y+RAhDVWUrg822GYpntzlAePW+sb9KDi
jOHvl8ri
=/xve
-----END PGP SIGNATURE-----

--=_MailMate_B4EA0124-BF54-454A-BF07-8038F0D1C9C6_=--
