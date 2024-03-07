Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E457F874688
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 04:06:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cm0mjv3w;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jWRpT9PN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqvMh56Wxz3dVK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 14:06:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cm0mjv3w;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jWRpT9PN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqvLy2hwkz3c2K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 14:05:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709780741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkR96+oCUTcXVjSNgBM5A0Wxc2Bmtn+g3wn0Jg6Nemc=;
	b=cm0mjv3wJzG0dwW2M4qsaj3+TXmSrPfeLRoFozBD5lFxPl0TMVhBD9CNeX77OaLZwXdW2c
	4H+kxqWeWzFjtrsLVoEdFHmnVbl0e3+hk0meFXHEJW5Qpow8ualtSXEf36mJ28aZmZ3ZiQ
	I4urq9vrfL0Ce0WJseHctzQICIaksEc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709780742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PkR96+oCUTcXVjSNgBM5A0Wxc2Bmtn+g3wn0Jg6Nemc=;
	b=jWRpT9PNJnuXXjCM0SOav9EFoFRCn6jdgNxW65VVVPgsXZv/rTpqDLZx36NirL8ZVvUCg8
	5/utDqm8QdacjmgH/6AqjjOxK8OdPtGUr/4KDUAQFGhHKvKQPYnxwKmeDolSy+nAdfI1I7
	YDL34dgG0+43rVwpzuYPWsEaSiRdAT4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-_IzLPiCiOd2h-_HYgLHEKw-1; Wed, 06 Mar 2024 22:05:37 -0500
X-MC-Unique: _IzLPiCiOd2h-_HYgLHEKw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6dbd919aba8so112077b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Mar 2024 19:05:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709780736; x=1710385536;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PkR96+oCUTcXVjSNgBM5A0Wxc2Bmtn+g3wn0Jg6Nemc=;
        b=kFBIUv7VV4ahuHTNg6YQBKYeH0ttT7Zn3Ffc3YQv0B5gOsPEX42DByficlIDqbf71W
         5ssGPZ/EoDHlLlKs9sjtNAmtsDfzCy72ysu+CqeQTFcmwWRhTsZQo5IwU1X2SKT8V5kK
         6+K6Nx45+HjwfUveIj0eE40tzSNc52oIECRLFCt8h3rSskaaAOEZhhcpUob+6YmF+Uu6
         0x8aj7axM4VoZhi/3yheg70CMiNWYMN5V64W6EfcbmLZxAEVN93i4IyS1832D5RJ30YR
         FV5tAKkyiYWuWXySfFS7wmbzaLAzuCeR4yXXeThPvY3rxkE4PMZL6Pv533E5/omApqwH
         HvEw==
X-Forwarded-Encrypted: i=1; AJvYcCWfS8GcL5c9ftveRXtREarpExqUXoa3aCyBsHibsLMBvDeuo80OaUojVhYHeJPzL2LymWJsmeD3QU9UrrGsE81mkdNB8g8RMYzLYcTQRQ==
X-Gm-Message-State: AOJu0Yzbp5l/+ICnQkZP52SuicMOVlOq250Xz+VNnmIAJY/BnaeBhi5w
	fk1BVpnAKUQz6RLO4poSyO6/zB+/IuapcNSmy/hfUQrvI9Pvhdau9z5UM6bs1GtJbxK0u6vCIbG
	sdLRCbGUYpEzylyXN+Y9l1VO2OaHTFeM/U6/fOQ9N4UoHuEl4KAsykc/RXiB/LpE=
X-Received: by 2002:a05:6a00:cce:b0:6e6:c6f:dc7e with SMTP id b14-20020a056a000cce00b006e60c6fdc7emr1026113pfv.3.1709780736640;
        Wed, 06 Mar 2024 19:05:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkCBHVN9ZAc+1XyRReKazlag268zheivJJl2EtGptHK/Yo1IMFuR7cjV0MKh9sysGGci92ug==
X-Received: by 2002:a05:6a00:cce:b0:6e6:c6f:dc7e with SMTP id b14-20020a056a000cce00b006e60c6fdc7emr1026089pfv.3.1709780736228;
        Wed, 06 Mar 2024 19:05:36 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id n11-20020a056a000d4b00b006e65720e892sm568324pfv.94.2024.03.06.19.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 19:05:35 -0800 (PST)
Date: Thu, 7 Mar 2024 11:05:21 +0800
From: Peter Xu <peterx@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC 09/13] mm/powerpc: Redefine pXd_huge() with pXd_leaf()
Message-ID: <Zeku8SsorvytLJGe@x1n>
References: <20240306104147.193052-1-peterx@redhat.com>
 <20240306104147.193052-10-peterx@redhat.com>
 <87v85zo6w7.fsf@mail.lhotse>
MIME-Version: 1.0
In-Reply-To: <87v85zo6w7.fsf@mail.lhotse>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, x86@kernel.org, Muchun Song <muchun.song@linux.dev>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 11:56:56PM +1100, Michael Ellerman wrote:
> peterx@redhat.com writes:
> > From: Peter Xu <peterx@redhat.com>
> >
> > PowerPC book3s 4K mostly has the same definition on both, except pXd_huge()
> > constantly returns 0 for hash MMUs.  AFAICT that is fine to be removed,
> > because pXd_huge() reflects a hugetlb entry, while it's own hugetlb pgtable
> > lookup function (__find_linux_pte() shared by all powerpc code) already use
> > pXd_leaf() irrelevant of the MMU type.  It means pXd_leaf() should work all
> > fine with hash MMU pgtables or something could already went wrong.
> 
> Yes I think that's correct.
> 
> 4K Hash MMU doesn't support any hugepage size at PMD or PUD level (the
> geometry is wrong), so pmd/pud_huge() were written with that in mind,
> ie. they are hard coded to return false.
> 
> But it should be OK to use pmd/pud_leaf(), they will actually look for
> _PAGE_PTE, but it should never be set for 4K Hash.
> 
> See eg. arch/powerpc/include/asm/book3s/64/hash-4k.h:
> 
> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
> {
> 	BUG();
> 	return pmd;
> }

Good to get confirmation on this, thanks, Michael.  These explanations also
look better than what I wrote, I'll amend the commit message.

> 
> > The goal should be that we will have one API pXd_leaf() to detect all kinds
> > of huge mappings.  AFAICT we need to use the pXd_leaf() impl (rather than
> > pXd_huge() ones) to make sure ie. THPs on hash MMU will also return true.
> >
> > This helps to simplify a follow up patch to drop pXd_huge() treewide.
> >
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Nicholas Piggin <npiggin@gmail.com>
> > Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> > Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  arch/powerpc/include/asm/book3s/64/pgtable-4k.h | 14 ++------------
> >  1 file changed, 2 insertions(+), 12 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
> > index 48f21820afe2..92545981bb49 100644
> > --- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
> > +++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
> > @@ -8,22 +8,12 @@
> >  #ifdef CONFIG_HUGETLB_PAGE
> >  static inline int pmd_huge(pmd_t pmd)
> >  {
> > -	/*
> > -	 * leaf pte for huge page
> > -	 */
> > -	if (radix_enabled())
> > -		return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> > -	return 0;
> > +	return pmd_leaf(pmd);
> >  }
> >  
> >  static inline int pud_huge(pud_t pud)
> >  {
> > -	/*
> > -	 * leaf pte for huge page
> > -	 */
> > -	if (radix_enabled())
> > -		return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> > -	return 0;
> > +	return pud_leaf(pud);
> >  }
> 
> This doesn't actually compile though.
> 
>   arch/powerpc/include/asm/book3s/64/pgtable-4k.h:11:16: error: implicit declaration of function ‘pmd_leaf’; did you mean ‘pgd_clear’? [-Werror=implicit-function-declaration]
> 
> etc.
> 
> To make it compile we'd need to relocate the pmd/pud_leaf() definitions:
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index df66dce8306f..fd7180fded75 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -262,6 +262,18 @@ extern unsigned long __kernel_io_end;
> 
>  extern struct page *vmemmap;
>  extern unsigned long pci_io_base;
> +
> +#define pmd_leaf pmd_leaf
> +static inline bool pmd_leaf(pmd_t pmd)
> +{
> +       return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> +}
> +
> +#define pud_leaf pud_leaf
> +static inline bool pud_leaf(pud_t pud)
> +{
> +       return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> +}
>  #endif /* __ASSEMBLY__ */
> 
>  #include <asm/book3s/64/hash.h>
> @@ -1436,20 +1448,5 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
>         return false;
>  }
> 
> -/*
> - * Like pmd_huge(), but works regardless of config options
> - */
> -#define pmd_leaf pmd_leaf
> -static inline bool pmd_leaf(pmd_t pmd)
> -{
> -       return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> -}
> -
> -#define pud_leaf pud_leaf
> -static inline bool pud_leaf(pud_t pud)
> -{
> -       return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> -}
> -
>  #endif /* __ASSEMBLY__ */
>  #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */

Thanks for the help, I'll fix that.  I'm wondering when syzbot will start
to feed my series into the testers; I do still rely on those feedbacks on
compilation issues with such treewide changes, but so far I didn't yet
receive any reports.

I've also attached the new patch directly here in case of any further
comment.

Thanks,

==========8<===========
From 9e75aef2141170f241577e7786aaa4bbbfd93360 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Wed, 6 Mar 2024 14:49:48 +0800
Subject: [PATCH] mm/powerpc: Redefine pXd_huge() with pXd_leaf()

PowerPC book3s 4K mostly has the same definition on both, except pXd_huge()
constantly returns 0 for hash MMUs.  As Michael Ellerman pointed out [1],
it is safe to check _PAGE_PTE on hash MMUs, as the bit will never be set so
it will keep returning false.

As a reference, __p[mu]d_mkhuge() will trigger a BUG_ON trying to create
such huge mappings for 4K hash MMUs.  Meanwhile, the major powerpc hugetlb
pgtable walker __find_linux_pte(), already used pXd_leaf() to check hugetlb
mappings.

The goal should be that we will have one API pXd_leaf() to detect all kinds
of huge mappings.  AFAICT we need to use the pXd_leaf() impl (rather than
pXd_huge() ones) to make sure ie. THPs on hash MMU will also return true.

This helps to simplify a follow up patch to drop pXd_huge() treewide.

NOTE: *_leaf() definition need to be moved before the inclusion of
asm/book3s/64/pgtable-4k.h, which defines pXd_huge() with it.

[1] https://lore.kernel.org/r/87v85zo6w7.fsf@mail.lhotse

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 .../include/asm/book3s/64/pgtable-4k.h        | 14 ++--------
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 27 +++++++++----------
 2 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
index 48f21820afe2..92545981bb49 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable-4k.h
@@ -8,22 +8,12 @@
 #ifdef CONFIG_HUGETLB_PAGE
 static inline int pmd_huge(pmd_t pmd)
 {
-	/*
-	 * leaf pte for huge page
-	 */
-	if (radix_enabled())
-		return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-	return 0;
+	return pmd_leaf(pmd);
 }
 
 static inline int pud_huge(pud_t pud)
 {
-	/*
-	 * leaf pte for huge page
-	 */
-	if (radix_enabled())
-		return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-	return 0;
+	return pud_leaf(pud);
 }
 
 /*
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index df66dce8306f..fd7180fded75 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -262,6 +262,18 @@ extern unsigned long __kernel_io_end;
 
 extern struct page *vmemmap;
 extern unsigned long pci_io_base;
+
+#define pmd_leaf pmd_leaf
+static inline bool pmd_leaf(pmd_t pmd)
+{
+	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
+}
+
+#define pud_leaf pud_leaf
+static inline bool pud_leaf(pud_t pud)
+{
+	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
+}
 #endif /* __ASSEMBLY__ */
 
 #include <asm/book3s/64/hash.h>
@@ -1436,20 +1448,5 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
-/*
- * Like pmd_huge(), but works regardless of config options
- */
-#define pmd_leaf pmd_leaf
-static inline bool pmd_leaf(pmd_t pmd)
-{
-	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
-}
-
-#define pud_leaf pud_leaf
-static inline bool pud_leaf(pud_t pud)
-{
-	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
-}
-
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
-- 
2.44.0

-- 
Peter Xu

