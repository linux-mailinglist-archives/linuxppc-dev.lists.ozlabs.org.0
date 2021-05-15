Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A223819E7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 18:36:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj9xr4CkSz3079
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 May 2021 02:36:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Y10XP702;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Y10XP702; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj9xM5pLSz2xvH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 02:35:33 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id k19so1909935qta.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6rKLntZO/5o/apLZQWKMZB3LLHw2NcASFdCosdEebqk=;
 b=Y10XP7028Bj4GuwdZNSMPJrk432ozPJfeEL2CFeMvEglPxMYjvqwJeCRf6QLrLtIyd
 85jD+EnfGKX9ltzNTP311imyU6L6StDDBetJK1o5uj5bdU2KA5lXX8OKrhM/DubsmI8R
 yaUwH7cxsxeX6SEPxYYz98UeBG+/72iNf+gUAOw2anc5gwUIO8IomC5PYa9JQdjkp3YM
 qzKbr3N33S8KaS+HVuz1EyLv97YY37kgaLh+OGyWd2t8hV/mgxMNStlgVzlrQ4wN+6cG
 yKorGYYcQaG0A2f0i8a6HVq7lb4x5+8zBE1U/0JeDw7oC1mIFqVrHtRAx+7sgFC7J+D4
 /HAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=6rKLntZO/5o/apLZQWKMZB3LLHw2NcASFdCosdEebqk=;
 b=Rwxmw70+hc/eySzfxEbpwOHhSdKcOw6+DeEdLgcJrTRfnl5PWdG4D/AGAfeZoSDdI4
 VAXeEfBEzMQeEQUpvJdn3ld5dxNqbjp9L31kZFyVyEi8TYVN3bBtgRzbvSxmFfMU4m2k
 OZ5RAM8V5eixsXFaEGtTiP/Nf8UsFZahXhA+U9kSSRmLm/f60e/+0iowOuKK305srknM
 Tn7gRRqCKnNSNboUGrw80tMb1+8piERIBb3Ku9YPPH3BL080LhT0SM+8yNsnI6M2vP7o
 csOoPaFlPzEYLIb5LJTj9QIekj3cctFdga32Q0wJSQWg3sCeDHs4KpJFNdsUtkLW9s1e
 4M5A==
X-Gm-Message-State: AOAM532/FPqVhvZrZwWN9jggsKPY5MlBFc6NvLJRg7bJHlMn+t8kOxhI
 pAgTfXhL/ynsfS6Wi5mGMSs=
X-Google-Smtp-Source: ABdhPJxG1LjipH9fLU+4E7UOxNVGIx4NgmwkDEqV22ni2orbdercqv/dxVNLyw9KmqrBYtc5BFZMvg==
X-Received: by 2002:ac8:5553:: with SMTP id o19mr1755021qtr.308.1621096527754; 
 Sat, 15 May 2021 09:35:27 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 7sm6981495qkd.20.2021.05.15.09.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 09:35:27 -0700 (PDT)
Date: Sat, 15 May 2021 09:35:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v5 5/9] powerpc/mm/book3s64: Update tlb flush routines to
 take a page walk cache flush argument
Message-ID: <20210515163525.GA1106462@roeck-us.net>
References: <20210422054323.150993-1-aneesh.kumar@linux.ibm.com>
 <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422054323.150993-6-aneesh.kumar@linux.ibm.com>
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
Cc: npiggin@gmail.com, linux-mm@kvack.org, kaleshsingh@google.com,
 joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 22, 2021 at 11:13:19AM +0530, Aneesh Kumar K.V wrote:
> No functional change in this patch
> 
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  .../include/asm/book3s/64/tlbflush-radix.h    | 19 +++++++-----
>  arch/powerpc/include/asm/book3s/64/tlbflush.h | 23 ++++++++++++---
>  arch/powerpc/mm/book3s64/radix_hugetlbpage.c  |  4 +--
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 29 +++++++------------
>  4 files changed, 42 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> index 8b33601cdb9d..171441a43b35 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
> @@ -56,15 +56,18 @@ static inline void radix__flush_all_lpid_guest(unsigned int lpid)
>  }
>  #endif
>  
> -extern void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> -					   unsigned long start, unsigned long end);
> -extern void radix__flush_tlb_range_psize(struct mm_struct *mm, unsigned long start,
> -					 unsigned long end, int psize);
> -extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
> -				       unsigned long start, unsigned long end);
> -extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +void radix__flush_hugetlb_tlb_range(struct vm_area_struct *vma,
> +				    unsigned long start, unsigned long end,
> +				    bool flush_pwc);
> +void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
> +				unsigned long start, unsigned long end,
> +				bool flush_pwc);
> +void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
> +				      unsigned long end, int psize, bool flush_pwc);
> +void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>  			    unsigned long end);
> -extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
> +void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
> +
>  
>  extern void radix__local_flush_tlb_mm(struct mm_struct *mm);
>  extern void radix__local_flush_all_mm(struct mm_struct *mm);
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> index 215973b4cb26..f9f8a3a264f7 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
> @@ -45,13 +45,30 @@ static inline void tlbiel_all_lpid(bool radix)
>  		hash__tlbiel_all(TLB_INVAL_SCOPE_LPID);
>  }
>  
> +static inline void flush_pmd_tlb_pwc_range(struct vm_area_struct *vma,
                 ^^^^
> +					   unsigned long start,
> +					   unsigned long end,
> +					   bool flush_pwc)
> +{
> +	if (radix_enabled())
> +		return radix__flush_pmd_tlb_range(vma, start, end, flush_pwc);
> +	return hash__flush_tlb_range(vma, start, end);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

> +}

>  
>  #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
>  static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
                 ^^^^
>  				       unsigned long start, unsigned long end)
> +{
> +	return flush_pmd_tlb_pwc_range(vma, start, end, false);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Doesn't that cause build warnings/errors all over the place ?

Guenter
