Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F29E95AFB49
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:27:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMq3j6VPdz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:27:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LLqdZRNb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LLqdZRNb;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMq3711blz2xG7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:26:59 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so17002264pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 21:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=cXhJSf26Omj6YqBwlBrLWqb5IEe+4uyjC0Z2+GyF+JE=;
        b=LLqdZRNbbogTpY6xrQfnv26Iz09EGQs73f3oyKkfhUcxP5tVJ0Ns9FUvx0TZWQFPke
         SAXnlkgS+7VsfZQM1MLx5/8R0y9UCAHXz5u2xtnuIy3Cmdh6zPP5dPdix4VlcxRqxNFJ
         6ALpUIGnsQkMEdcSARHODdxEU9JfaEA9BUA8yPZ2JSqtXQc/8FuWPFOOunw12YeT2uoS
         IijwAmDtnkr8WIjb4Iok3HSMnrXdGZSReDMbGYj5DUaH/8z5MlQG0ANHuWXONxo9Z05e
         swHr+y1xnmjon2pe4b4E7ybFy15dyRcaAJZamXQE7LaHt+gUTLI77TqvRCP0obyeZ2GO
         KLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=cXhJSf26Omj6YqBwlBrLWqb5IEe+4uyjC0Z2+GyF+JE=;
        b=Ib70Y2B2JfWtuYLO7K4TRG6juqBPTOd53m+ldpJWRj7rT0T8l+p6lYEw5jWUxbcJNE
         uITaAdQGiJ1ne22hx+cFok6wGmxZ0EChvxGfMxsoxKadzxSun9xGeZTrklSIPbKabABd
         TrnhIe6+auXEzpJ7yIA8e9Kbgk49FvzjlhMa00XtSer9mP5xVt5wnNLAxqkHhYVEe6t3
         zUImJ2+6+HUu3vmhxJzt3GT5WO4f6pRT9gYHIfi4+065B+uoQfsBE/J0bQ/mRZuolzVP
         UspsrByMl13IUC6haEnS7Z1sbX6CYFL98I525qrfv437+bsoyNVtoSVUQ+XtobZK3KJz
         Ti1Q==
X-Gm-Message-State: ACgBeo1aEF7+N4Bg39W9+ck5CeYROdwVy0Qqg4k6AORzwr3Jp6CYbHsJ
	+e5fxCDIgQ/aLzbRcCM3FIs=
X-Google-Smtp-Source: AA6agR4q3Jmz0AxKC8O9M45aptmE9bGoIs1sVgJyRLxr/baXjm3Are+b1Kr9GjvhX22yAjUyfue3aA==
X-Received: by 2002:a17:902:e549:b0:174:d234:6116 with SMTP id n9-20020a170902e54900b00174d2346116mr1875013plf.131.1662524817156;
        Tue, 06 Sep 2022 21:26:57 -0700 (PDT)
Received: from localhost ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id a2-20020a17090a6d8200b001f5513f6fb9sm9922063pjk.14.2022.09.06.21.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 21:26:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Sep 2022 14:26:52 +1000
Message-Id: <CMPVUZ3AI9Z5.3QHIUCJE5KOF@bobo>
Subject: Re: [PATCH] powerpc/book3s: Inline first level of
 update_mmu_cache()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <bea5ad0de7f83eff256116816d46c84fa0a444de.1662370698.git.christophe.leroy@csgroup.eu>
In-Reply-To: <bea5ad0de7f83eff256116816d46c84fa0a444de.1662370698.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Sep 5, 2022 at 7:38 PM AEST, Christophe Leroy wrote:
> update_mmu_cache() voids when hash page tables are not used.
> On PPC32 that means when MMU_FTR_HPTE_TABLE is not defined.
> On PPC64 that means when RADIX is enabled.
>
> Rename core part of update_mmu_cache() as __update_mmu_cache()
> and include the initial verification in an inlined caller.

Reivewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/book3s/pgtable.h | 15 ++++++++++-----
>  arch/powerpc/mm/book3s32/mmu.c            |  4 +---
>  arch/powerpc/mm/book3s64/hash_utils.c     |  5 +----
>  3 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/pgtable.h b/arch/powerpc/inc=
lude/asm/book3s/pgtable.h
> index e8269434ecbe..d18b748ea3ae 100644
> --- a/arch/powerpc/include/asm/book3s/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/pgtable.h
> @@ -25,7 +25,8 @@ extern pgprot_t phys_mem_access_prot(struct file *file,=
 unsigned long pfn,
>  				     unsigned long size, pgprot_t vma_prot);
>  #define __HAVE_PHYS_MEM_ACCESS_PROT
> =20
> -#if defined(CONFIG_PPC32) || defined(CONFIG_PPC_64S_HASH_MMU)
> +void __update_mmu_cache(struct vm_area_struct *vma, unsigned long addres=
s, pte_t *ptep);
> +
>  /*
>   * This gets called at the end of handling a page fault, when
>   * the kernel has put a new PTE into the page table for the process.
> @@ -35,10 +36,14 @@ extern pgprot_t phys_mem_access_prot(struct file *fil=
e, unsigned long pfn,
>   * corresponding HPTE into the hash table ahead of time, instead of
>   * waiting for the inevitable extra hash-table miss exception.
>   */
> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,=
 pte_t *ptep);
> -#else
> -static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned=
 long address, pte_t *ptep) {}
> -#endif
> +static inline void update_mmu_cache(struct vm_area_struct *vma, unsigned=
 long address, pte_t *ptep)
> +{
> +	if (IS_ENABLED(CONFIG_PPC32) && !mmu_has_feature(MMU_FTR_HPTE_TABLE))
> +		return;
> +	if (radix_enabled())
> +		return;
> +	__update_mmu_cache(vma, address, ptep);
> +}
> =20
>  #endif /* __ASSEMBLY__ */
>  #endif
> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mm=
u.c
> index a96b73006dfb..7053eb229b4f 100644
> --- a/arch/powerpc/mm/book3s32/mmu.c
> +++ b/arch/powerpc/mm/book3s32/mmu.c
> @@ -314,11 +314,9 @@ static void hash_preload(struct mm_struct *mm, unsig=
ned long ea)
>   *
>   * This must always be called with the pte lock held.
>   */
> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
> +void __update_mmu_cache(struct vm_area_struct *vma, unsigned long addres=
s,
>  		      pte_t *ptep)
>  {
> -	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
> -		return;
>  	/*
>  	 * We don't need to worry about _PAGE_PRESENT here because we are
>  	 * called with either mm->page_table_lock held or ptl lock held
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book=
3s64/hash_utils.c
> index 363a9447d63d..ced1107b1677 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1781,7 +1781,7 @@ static void hash_preload(struct mm_struct *mm, pte_=
t *ptep, unsigned long ea,
>   *
>   * This must always be called with the pte lock held.
>   */
> -void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
> +void __update_mmu_cache(struct vm_area_struct *vma, unsigned long addres=
s,
>  		      pte_t *ptep)
>  {
>  	/*
> @@ -1791,9 +1791,6 @@ void update_mmu_cache(struct vm_area_struct *vma, u=
nsigned long address,
>  	unsigned long trap;
>  	bool is_exec;
> =20
> -	if (radix_enabled())
> -		return;
> -
>  	/* We only want HPTEs for linux PTEs that have _PAGE_ACCESSED set */
>  	if (!pte_young(*ptep) || address >=3D TASK_SIZE)
>  		return;
> --=20
> 2.37.1

