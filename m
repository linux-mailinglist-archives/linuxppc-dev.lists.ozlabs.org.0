Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08B895FC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 00:44:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S9PxDmS7;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZGPo7Fa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8NHR3b7Nz3vmk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 09:44:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S9PxDmS7;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PZGPo7Fa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8NGb6B1kz3vY2
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 09:44:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712097843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msm30zqdysTm36DA/rZCqzTJxXxvA+rydv8lKPCKRNo=;
	b=S9PxDmS7cMP4xVVO6g3JrkBP3FB1ohuU/ePpi1mO0OcndetwgzH2rn7dZrTBVwyg//HdL9
	BqBBNxkQWVczr9dKhppoZH4dCphZ0+NFVi04ogbSa6UTEefj5OHhMrFWrm//sDLhwtJema
	1PfDFmObfd+ZUbne8wLNEPYpoRTI3V8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712097844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=msm30zqdysTm36DA/rZCqzTJxXxvA+rydv8lKPCKRNo=;
	b=PZGPo7Fap/n6eolzWK3XFcRJ4Xwpl3yED2Q9YD9tzP6N/JfA3T63mPW2iJWBz0hTeAEjFZ
	nQisHuBk4BRV//xjFc6Mtc0aE/nOzCyKM1hRKC3phKcvywsNJKRhIzaBq9v/cmi1SbMVyH
	sztdyrYMq1IPspReF89Bl+L9qxy5fmU=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-9L6X1KK8P1eu-VIyE_7_hw-1; Tue, 02 Apr 2024 18:44:01 -0400
X-MC-Unique: 9L6X1KK8P1eu-VIyE_7_hw-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6e6cb8055b8so1924005a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Apr 2024 15:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712097840; x=1712702640;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msm30zqdysTm36DA/rZCqzTJxXxvA+rydv8lKPCKRNo=;
        b=K28nThihZQP+kUthf1BGuxnuyOmntfbuqZJo9ADN/8JD/WWi4NH3rhEiMTWevH2tBV
         r2CWiiM5uoTviLsmffVcRAltIWOOtNbnD+lotkV/vfyI6f1FaTXGURWeqfjqHl/njSjx
         04ghbq3Rsy9zcRq+Ee5rgrhxcR4Ynd9C+AIQ+6x4sDMk9qjkpq+XLI0Chd+A536nCG5H
         uij4UIyw0DzD2T3+GZuQMbF4Ll1RYe+zh4PzauQDQb7OsrgHqSUhteIwu83ULOT1we2k
         JgmovJGKaiV/PRzPntFSZEqhsdmv98FV4W+v6L97BuqMPH31DwhLWLLSQlCpFyWC4Zt2
         MfWg==
X-Forwarded-Encrypted: i=1; AJvYcCX3hf137IkBlsCGmcrxtiCZ4oC0MuXNr2BO+MMAeqp4ak44JVrUcFKBOtJEbVcVtK4p4BMgWM00F8n/3nn7CrADzdGGCuMY5XKsIbh4Jw==
X-Gm-Message-State: AOJu0Yy1jm7VOVg15AW/khYMM+3Ng0mwIHGmwrGvpEdWT1FSw4vLZe0S
	RUNlXIvOoM+SiZPqL5kVibyxMNNsssgxToQBizUlb1qBH7Lgrgc45kGj/3+5PPKS29o7+ODN/vh
	6D3eC0IQSimpGLJUOG7GLL4uLdIT4FXlfWS0negersgJoGRfDVn/cjwCuj9ZTZO0=
X-Received: by 2002:a05:6808:15a1:b0:3c4:f2b2:2c20 with SMTP id t33-20020a05680815a100b003c4f2b22c20mr4238890oiw.2.1712097840182;
        Tue, 02 Apr 2024 15:44:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6a1W8aoV0zchhQZ+4+B4MiM4kTW0SJ53OaThQIv9a42FW90adjoyx8moZXDxiuklchxwa7w==
X-Received: by 2002:a05:6808:15a1:b0:3c4:f2b2:2c20 with SMTP id t33-20020a05680815a100b003c4f2b22c20mr4238865oiw.2.1712097839620;
        Tue, 02 Apr 2024 15:43:59 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id u6-20020a05620a120600b00789e8860ef7sm4617106qkj.121.2024.04.02.15.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 15:43:59 -0700 (PDT)
Date: Tue, 2 Apr 2024 18:43:56 -0400
From: Peter Xu <peterx@redhat.com>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v4 05/13] mm/arch: Provide pud_pfn() fallback
Message-ID: <ZgyKLLVZ4vN56uZE@x1n>
References: <20240327152332.950956-1-peterx@redhat.com>
 <20240327152332.950956-6-peterx@redhat.com>
 <20240402190549.GA706730@dev-arch.thelio-3990X>
MIME-Version: 1.0
In-Reply-To: <20240402190549.GA706730@dev-arch.thelio-3990X>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, WANG Xuerui <kernel@xen0n.name>, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, Huacai Chen <chenhuacai@kernel.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, loongarch@lists.linux.dev, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 02, 2024 at 12:05:49PM -0700, Nathan Chancellor wrote:
> Hi Peter (and LoongArch folks),
> 
> On Wed, Mar 27, 2024 at 11:23:24AM -0400, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > The comment in the code explains the reasons.  We took a different approach
> > comparing to pmd_pfn() by providing a fallback function.
> > 
> > Another option is to provide some lower level config options (compare to
> > HUGETLB_PAGE or THP) to identify which layer an arch can support for such
> > huge mappings.  However that can be an overkill.
> > 
> > Cc: Mike Rapoport (IBM) <rppt@kernel.org>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h    |  1 +
> >  arch/s390/include/asm/pgtable.h     |  1 +
> >  arch/sparc/include/asm/pgtable_64.h |  1 +
> >  arch/x86/include/asm/pgtable.h      |  1 +
> >  include/linux/pgtable.h             | 10 ++++++++++
> >  5 files changed, 14 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 20242402fc11..0ca28cc8e3fa 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -646,6 +646,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
> >  
> >  #define __pud_to_phys(pud)  (__page_val_to_pfn(pud_val(pud)) << PAGE_SHIFT)
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	return ((__pud_to_phys(pud) & PUD_MASK) >> PAGE_SHIFT);
> > diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
> > index 1a71cb19c089..6cbbe473f680 100644
> > --- a/arch/s390/include/asm/pgtable.h
> > +++ b/arch/s390/include/asm/pgtable.h
> > @@ -1414,6 +1414,7 @@ static inline unsigned long pud_deref(pud_t pud)
> >  	return (unsigned long)__va(pud_val(pud) & origin_mask);
> >  }
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	return __pa(pud_deref(pud)) >> PAGE_SHIFT;
> > diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
> > index 4d1bafaba942..26efc9bb644a 100644
> > --- a/arch/sparc/include/asm/pgtable_64.h
> > +++ b/arch/sparc/include/asm/pgtable_64.h
> > @@ -875,6 +875,7 @@ static inline bool pud_leaf(pud_t pud)
> >  	return pte_val(pte) & _PAGE_PMD_HUGE;
> >  }
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	pte_t pte = __pte(pud_val(pud));
> > diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> > index cefc7a84f7a4..273f7557218c 100644
> > --- a/arch/x86/include/asm/pgtable.h
> > +++ b/arch/x86/include/asm/pgtable.h
> > @@ -234,6 +234,7 @@ static inline unsigned long pmd_pfn(pmd_t pmd)
> >  	return (pfn & pmd_pfn_mask(pmd)) >> PAGE_SHIFT;
> >  }
> >  
> > +#define pud_pfn pud_pfn
> >  static inline unsigned long pud_pfn(pud_t pud)
> >  {
> >  	phys_addr_t pfn = pud_val(pud);
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 600e17d03659..75fe309a4e10 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1817,6 +1817,16 @@ typedef unsigned int pgtbl_mod_mask;
> >  #define pte_leaf_size(x) PAGE_SIZE
> >  #endif
> >  
> > +/*
> > + * We always define pmd_pfn for all archs as it's used in lots of generic
> > + * code.  Now it happens too for pud_pfn (and can happen for larger
> > + * mappings too in the future; we're not there yet).  Instead of defining
> > + * it for all archs (like pmd_pfn), provide a fallback.
> > + */
> > +#ifndef pud_pfn
> > +#define pud_pfn(x) ({ BUILD_BUG(); 0; })
> > +#endif
> > +
> >  /*
> >   * Some architectures have MMUs that are configurable or selectable at boot
> >   * time. These lead to variable PTRS_PER_x. For statically allocated arrays it
> > -- 
> > 2.44.0
> > 
> 
> This BUILD_BUG() triggers for LoongArch with their defconfig, so it
> seems like they need to provide an implementation of pud_pfn()?
> 
>   In function 'follow_huge_pud',
>       inlined from 'follow_pud_mask' at mm/gup.c:1075:10,
>       inlined from 'follow_p4d_mask' at mm/gup.c:1105:9,
>       inlined from 'follow_page_mask' at mm/gup.c:1151:10:
>   include/linux/compiler_types.h:460:45: error: call to '__compiletime_assert_382' declared with attribute error: BUILD_BUG failed
>     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |                                             ^
>   include/linux/compiler_types.h:441:25: note: in definition of macro '__compiletime_assert'
>     441 |                         prefix ## suffix();                             \
>         |                         ^~~~~~
>   include/linux/compiler_types.h:460:9: note: in expansion of macro '_compiletime_assert'
>     460 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>         |         ^~~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
>      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
>         |                                     ^~~~~~~~~~~~~~~~~~
>   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
>      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
>         |                     ^~~~~~~~~~~~~~~~
>   include/linux/pgtable.h:1887:23: note: in expansion of macro 'BUILD_BUG'
>    1887 | #define pud_pfn(x) ({ BUILD_BUG(); 0; })
>         |                       ^~~~~~~~~
>   mm/gup.c:679:29: note: in expansion of macro 'pud_pfn'
>     679 |         unsigned long pfn = pud_pfn(pud);
>         |                             ^~~~~~~

I actually tested this without hitting the issue (even though I didn't
mention it in the cover letter..).  I re-kicked the build test, it turns
out my "make alldefconfig" on loongarch will generate a config with both
HUGETLB=n && THP=n, while arch/loongarch/configs/loongson3_defconfig has
THP=y (which I assume was the one above build used).  I didn't further
check how "make alldefconfig" generated the config; a bit surprising that
it didn't fetch from there.

(and it also surprises me that this BUILD_BUG can trigger.. I used to try
 triggering it elsewhere but failed..)

For loongarch the best thing is not compile in follow_huge_pud(), as it
doesn't support pud dax, neither does it support pud hugetlb.  However
again that may require some more CONFIG_* options to declare the level one
arch supports on HUGETLB_PAGE.  Here maybe the simplest (and it should also
cover all the rest archs on similar issues if ever possible to happen) is
we remove the BUILD_BUG() and explain why.  It should be safe for loongarch
too here in this case to not defined it until properly supported.

Thanks,

===8<===
From 585f34aa3d5b12cd2186367b0882d4293f792062 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Tue, 2 Apr 2024 18:31:07 -0400
Subject: [PATCH] fixup! mm/arch: provide pud_pfn() fallback

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/pgtable.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index fa8f92f6e2d7..0f4b2faa1d71 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1882,9 +1882,13 @@ typedef unsigned int pgtbl_mod_mask;
  * code.  Now it happens too for pud_pfn (and can happen for larger
  * mappings too in the future; we're not there yet).  Instead of defining
  * it for all archs (like pmd_pfn), provide a fallback.
+ *
+ * Note that returning 0 here means any arch that didn't define this can
+ * get severely wrong when it hits a real pud leaf.  It's arch's
+ * responsibility to properly define it when a huge pud is possible.
  */
 #ifndef pud_pfn
-#define pud_pfn(x) ({ BUILD_BUG(); 0; })
+#define pud_pfn(x) 0
 #endif
 
 /*
-- 
2.44.0

-- 
Peter Xu

