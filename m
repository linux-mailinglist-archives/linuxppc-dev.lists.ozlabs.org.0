Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A6B2E1BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2019 17:56:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Db1N5VpxzDqQ3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 01:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Db036kvyzDqHw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 01:55:29 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45DZzt0bSPz9tyQt;
 Wed, 29 May 2019 17:55:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xIGpvSYCFY2m; Wed, 29 May 2019 17:55:22 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45DZzs6t4Zz9tyQn;
 Wed, 29 May 2019 17:55:21 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id B1050668; Wed, 29 May 2019 17:55:21 +0200 (CEST)
Received: from 37.170.135.142 ([37.170.135.142]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Wed, 29 May 2019 17:55:21 +0200
Date: Wed, 29 May 2019 17:55:21 +0200
Message-ID: <20190529175521.Horde.-9imEnHzm7NQQEzTci_TuQ2@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Move some of the boot time info print to
 generic file
In-Reply-To: <20190528053513.1966-1-aneesh.kumar@linux.ibm.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> a =C3=A9crit=C2=A0:

> With radix translation enabled we find in dmesg
>
>  hash-mmu: ppc64_pft_size    =3D 0x0
>  hash-mmu: kernel vmalloc start   =3D 0xc008000000000000
>  hash-mmu: kernel IO start        =3D 0xc00a000000000000
>  hash-mmu: kernel vmemmap start   =3D 0xc00c000000000000
>
> This is because these pr_info calls are in hash_utils.c which has
>
>  #define pr_fmt(fmt) "hash-mmu: " fmt
>
> The information printed in generic and hence move that to generic file

Some similarities with Nick's patch=20=20
https://patchwork.ozlabs.org/patch/1100245/=20?

Christophe

>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/kernel/setup-common.c    | 4 ++++
>  arch/powerpc/mm/book3s64/hash_utils.c | 5 -----
>  2 files changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kernel/setup-common.c=20=20
>=20b/arch/powerpc/kernel/setup-common.c
> index aad9f5df6ab6..a73a91f2c21f 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -810,6 +810,10 @@ static __init void print_system_info(void)
>  	pr_info("mmu_features      =3D 0x%08x\n", cur_cpu_spec->mmu_features);
>  #ifdef CONFIG_PPC64
>  	pr_info("firmware_features =3D 0x%016lx\n", powerpc_firmware_features);
> +	pr_info("ppc64_pft_size    =3D 0x%llx\n", ppc64_pft_size);
> +	pr_info("kernel vmalloc start   =3D 0x%lx\n", KERN_VIRT_START);
> +	pr_info("kernel IO start        =3D 0x%lx\n", KERN_IO_START);
> +	pr_info("kernel vmemmap start   =3D 0x%lx\n", (unsigned long)vmemmap);
>  #endif
>
>  	print_system_hash_info();
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c=20=20
>=20b/arch/powerpc/mm/book3s64/hash_utils.c
> index 919a861a8ec0..2f677914bfd2 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1950,11 +1950,6 @@ machine_device_initcall(pseries, hash64_debugfs);
>
>  void __init print_system_hash_info(void)
>  {
> -	pr_info("ppc64_pft_size    =3D 0x%llx\n", ppc64_pft_size);
> -
>  	if (htab_hash_mask)
>  		pr_info("htab_hash_mask    =3D 0x%lx\n", htab_hash_mask);
> -	pr_info("kernel vmalloc start   =3D 0x%lx\n", KERN_VIRT_START);
> -	pr_info("kernel IO start        =3D 0x%lx\n", KERN_IO_START);
> -	pr_info("kernel vmemmap start   =3D 0x%lx\n", (unsigned long)vmemmap);
>  }
> --
> 2.21.0


