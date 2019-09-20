Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19966B971E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 20:20:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Zhp53gp0zDqM3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2019 04:19:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::843; helo=mail-qt1-x843.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="YZ3fLouj"; 
 dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Zhlx1NLRzDqx2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 04:18:04 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id x5so9714330qtr.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 11:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eYbWvzmmKAZuy52DsRiouQHPZ26YbiYdZTYVkZZ/igY=;
 b=YZ3fLoujpXw2Je0ErSV6UgQ31eXHAgTzXUgNx1xncQzpK7MRAX69MKqBBOjpyti5bC
 pz8IvRQnDD9EdMXgdbDYJZgtn5WK5IMSO6krTprg29MJvBhbTAMNSPbWgMn0ebd1R50U
 QpWj4NHCCAByAoQ6AuUKA0Z2B7XnW5VkTXZz89yucCudWG4kNv+5bfwL/DZ6DC9b17xZ
 1jGf9x0b2a7cpwgKbi/dar8YMoVb2Bup+WPuCQJ9eRovePTx+SvOErfvXZiIJHFX5YKw
 jLaddoHNIl7U/8Cpuy6URd639uC9mlTwYj5dr5WyRA3Tc1N/cH7CYBH8s99Y+1cpx4gZ
 xHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eYbWvzmmKAZuy52DsRiouQHPZ26YbiYdZTYVkZZ/igY=;
 b=X2Mvt8e7ClrfNaSkzCrqWF+S1b7Jz5BhAIe4cAcAAhe/hdDvABRwr4RdI/6mFpiegV
 wDhWmNIcYydLP5i2WpVJ/9kNEP05z6iUfFmypqvpvOUs4/bYEtNGlAu0Tc3tnZuRbsNq
 ORD0Q9M5IbPdPPfs6Uc2A/CkeKiA5pxbDO17XJBaIfbI79rc21EK/6JIp3auKXNd+unB
 yCjw6CzQWL3P0H/ikaY0d9FmBAKUBptN86RB9bWmQGjr09a0ISGnIqPwOEQ6+M3hiOab
 A7yz3pFZrrGCXhbEmjSX1FTA0ejwlS6ak7Jjz3cpFvTldBJZMtGBIT1SAMeW7vpNWxRs
 DpRw==
X-Gm-Message-State: APjAAAUoMws9PyX/YTE24EQpykcqtAOtZ+dmZxihmtYI3V7OMHzrEQHL
 AxNMMU2yWjmw31WqnUD5NedBxQ==
X-Google-Smtp-Source: APXvYqwp9/fq/xscoRUtHvBetayixp1jIgu/24Pt8YF+ZNrY+yQ59g7DqU133QajvMMEu2PwokB9qQ==
X-Received: by 2002:ac8:428e:: with SMTP id o14mr4928399qtl.186.1569003480901; 
 Fri, 20 Sep 2019 11:18:00 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id v12sm1640151qtb.5.2019.09.20.11.17.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 11:18:00 -0700 (PDT)
Message-ID: <1569003478.5576.202.camel@lca.pw>
Subject: Re: "Pick the right alignment default when creating dax devices"
 failed to build on powerpc
From: Qian Cai <cai@lca.pw>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Fri, 20 Sep 2019 14:17:58 -0400
In-Reply-To: <87r24bhwng.fsf@linux.ibm.com>
References: <1568988209.5576.199.camel@lca.pw> <87r24bhwng.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-09-20 at 19:55 +0530, Aneesh Kumar K.V wrote:
> Qian Cai <cai@lca.pw> writes:
> 
> > The linux-next commit "libnvdimm/dax: Pick the right alignment default when
> > creating dax devices" causes powerpc failed to build with this config. Reverted
> > it fixed the issue.
> > 
> > ERROR: "hash__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
> > ERROR: "radix__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko]
> > undefined!
> > make[1]: *** [scripts/Makefile.modpost:93: __modpost] Error 1
> > make: *** [Makefile:1305: modules] Error 2
> > 
> > [1] https://patchwork.kernel.org/patch/11133445/
> > [2] https://raw.githubusercontent.com/cailca/linux-mm/master/powerpc.config
> 
> Sorry for breaking the build. How about?

It works fine.

> 
> commit ea15fd8b5489e2c8e9f1b96d67248a7428ffb74a
> Author: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Date:   Fri Sep 20 19:47:56 2019 +0530
> 
>     powerpc/book3s/nvdimm: Fix build error with nvdimm kernel module
>     
>     Fix the below comiple error.
>     
>     ERROR: "hash__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
>     ERROR: "radix__has_transparent_hugepage" [drivers/nvdimm/libnvdimm.ko] undefined!
>     
>     Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> index e04a839cb5b9..65a6966f1de4 100644
> --- a/arch/powerpc/include/asm/book3s/64/radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> @@ -254,7 +254,13 @@ extern void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
>  extern pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
>  extern pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
>  				      unsigned long addr, pmd_t *pmdp);
> -extern int radix__has_transparent_hugepage(void);
> +static inline int radix__has_transparent_hugepage(void)
> +{
> +	/* For radix 2M at PMD level means thp */
> +	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
> +		return 1;
> +	return 0;
> +}
>  #endif
>  
>  extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
> index d1f390ac9cdb..64733b9cb20a 100644
> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
> @@ -406,6 +406,8 @@ int hash__has_transparent_hugepage(void)
>  
>  	return 1;
>  }
> +EXPORT_SYMBOL_GPL(hash__has_transparent_hugepage);
> +
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  #ifdef CONFIG_STRICT_KERNEL_RWX
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index b4ca9e95e678..dc7a38f0a45b 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -1057,13 +1057,6 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
>  	return old_pmd;
>  }
>  
> -int radix__has_transparent_hugepage(void)
> -{
> -	/* For radix 2M at PMD level means thp */
> -	if (mmu_psize_defs[MMU_PAGE_2M].shift == PMD_SHIFT)
> -		return 1;
> -	return 0;
> -}
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
>  void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
