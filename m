Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8E038DBCD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 18:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fp4wd24HKz308T
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 02:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fp4wF4fhjz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 02:06:34 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fp4w710KqzB6nY;
 Sun, 23 May 2021 18:06:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Skq_akrOTQYD; Sun, 23 May 2021 18:06:31 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fp4w705qFzB6nW;
 Sun, 23 May 2021 18:06:31 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id C62A359; Sun, 23 May 2021 18:10:54 +0200 (CEST)
Received: from 37-164-13-85.coucou-networks.fr
 (37-164-13-85.coucou-networks.fr [37.164.13.85]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Sun, 23 May 2021 18:10:54 +0200
Date: Sun, 23 May 2021 18:10:54 +0200
Message-ID: <20210523181054.Horde.1K8Ldhm0aj339_vHlUQCkQ1@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Fix reverse map real-mode address
 lookup with huge vmalloc
In-Reply-To: <20210523155338.3254465-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> a =C3=A9crit=C2=A0:

> real_vmalloc_addr() does not currently work for huge vmalloc, which is
> what the reverse map can be allocated with for radix host, hash guest.
>
> Add huge page awareness to the function.
>
> Fixes: 8abddd968a30 ("powerpc/64s/radix: Enable huge vmalloc mappings")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rm_mmu.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_rm_mmu.c=20=20
>=20b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> index 7af7c70f1468..5f68cb5cc009 100644
> --- a/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_rm_mmu.c
> @@ -26,16 +26,23 @@
>  static void *real_vmalloc_addr(void *x)
>  {
>  	unsigned long addr =3D (unsigned long) x;
> +	unsigned long mask;
> +	int shift;
>  	pte_t *p;
> +
>  	/*
> -	 * assume we don't have huge pages in vmalloc space...
> -	 * So don't worry about THP collapse/split. Called
> -	 * Only in realmode with MSR_EE =3D 0, hence won't need irq_save/restor=
e.
> +	 * This is called only in realmode with MSR_EE =3D 0, hence won't need
> +	 * irq_save/restore around find_init_mm_pte.
>  	 */
> -	p =3D find_init_mm_pte(addr, NULL);
> +	p =3D find_init_mm_pte(addr, &shift);
>  	if (!p || !pte_present(*p))
>  		return NULL;
> -	addr =3D (pte_pfn(*p) << PAGE_SHIFT) | (addr & ~PAGE_MASK);
> +	if (!shift)
> +		shift =3D PAGE_SHIFT;
> +
> +	mask =3D (1UL << shift) - 1;
> +	addr =3D (pte_pfn(*p) << PAGE_SHIFT) | (addr & mask);

Looks strange, before we have ~MASK now we have mask without the ~

Also use PFN_PHYS() instead of open coding ?




> +
>  	return __va(addr);
>  }
>
> --
> 2.23.0


