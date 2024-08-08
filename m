Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4282494C5B1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 22:25:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YSVAdMha;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YSVAdMha;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfz846j70z2yP8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 06:25:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YSVAdMha;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YSVAdMha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfz7P2ZYfz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 06:25:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723148715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8daUpyfTZqUQFCrzGvmeyWvUDYOhXzl0ULKyt5g2PCM=;
	b=YSVAdMhaM5ZasfukU2HOCj10Tet3tMInAMsku/0CLAK/HeM4tYzIuIRWSL5OgcxhGw7YLY
	694GCFrHC6RZvkUbNpPDAWrJSf8CpKp8ItNbJFBkzXc+9TvqKnwhLd7rRxrx/+a5L6n4uY
	0L/0ooiJrwp0TRC+5dDqgOd04NMiB6s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723148715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8daUpyfTZqUQFCrzGvmeyWvUDYOhXzl0ULKyt5g2PCM=;
	b=YSVAdMhaM5ZasfukU2HOCj10Tet3tMInAMsku/0CLAK/HeM4tYzIuIRWSL5OgcxhGw7YLY
	694GCFrHC6RZvkUbNpPDAWrJSf8CpKp8ItNbJFBkzXc+9TvqKnwhLd7rRxrx/+a5L6n4uY
	0L/0ooiJrwp0TRC+5dDqgOd04NMiB6s=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-581-6vpVL1WQNZWLH91VYOnVlg-1; Thu, 08 Aug 2024 16:25:14 -0400
X-MC-Unique: 6vpVL1WQNZWLH91VYOnVlg-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b7678caf7dso3881796d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 13:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723148713; x=1723753513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8daUpyfTZqUQFCrzGvmeyWvUDYOhXzl0ULKyt5g2PCM=;
        b=adrlOjM4fMXaWblQp2VVcK96m2zl/OqkJWkm0OWnIKJdsuSoyyIHOXKPWMrrNJsL4P
         k0uNDpU0eMNBNPF4gE1arpHVKCotqqqzIOGfIS5sTJXCoMjNdBd6jhJMjmJe/PMIZJXS
         jIcTQOLhfzLCwrPWSlkFSI7UDRy+EKOYTXwGt+hcR7r1VWt3RbBwcFMUwAYohqUTq5+1
         0IavkJJmyviCN+rUynJIbXwkHb4ErdavvgMEUyCzv2caT+7U1AomO14p8q9qkV6xn+Qf
         FGb4Xv8qTWWwZUPLiTOnHPn8neYQ7JqhQbUIqGNuWsNkLpHtIV6pzolb53Z7TmztpSrk
         MvZw==
X-Forwarded-Encrypted: i=1; AJvYcCXKVueBaBQ7aeYo5GxSaTRcSsyKjvUt8GXLP42VycdvPpayUmUvqV67BgRFPWVix9UwyeBXWkSvF1AOQAldO+NNZuVqms1i0mLEZrhaJA==
X-Gm-Message-State: AOJu0YysoKXnX56n5/JPOLOJRklYllXfueztdx+mxVdzJRtZ2YDEj5b6
	MBE9pKRSpTOkkGnlTXVfkvXJyRyPxcigFHhJqAfVT+RDbD7kN7ZaBQWb4aNPq/MnXQk2rAwOIE6
	YNh9TB76js6WVofBqkaOZ2LsF1IQw7N3R95I5L/S/LTP8q8OLVg/KWPcO3qwyUbw=
X-Received: by 2002:ad4:4c4b:0:b0:6bd:738c:844b with SMTP id 6a1803df08f44-6bd738c86cbmr7125916d6.7.1723148713387;
        Thu, 08 Aug 2024 13:25:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHxHRY0hgUe0eqPdegGemg/UeFvqIQDH8YpIiffoYytwmP645+Qp3cG/ROktBrvTKfdRkxUA==
X-Received: by 2002:ad4:4c4b:0:b0:6bd:738c:844b with SMTP id 6a1803df08f44-6bd738c86cbmr7125696d6.7.1723148712878;
        Thu, 08 Aug 2024 13:25:12 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c78ae4asm70451386d6.33.2024.08.08.13.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 13:25:12 -0700 (PDT)
Date: Thu, 8 Aug 2024 16:25:07 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 6/7] mm/x86: Add missing pud helpers
Message-ID: <ZrUpowkgPHIub4el@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-7-peterx@redhat.com>
 <875xsc0xjy.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <875xsc0xjy.ffs@tglx>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024 at 12:37:21AM +0200, Thomas Gleixner wrote:
> On Wed, Aug 07 2024 at 15:48, Peter Xu wrote:
> > These new helpers will be needed for pud entry updates soon.  Introduce
> > these helpers by referencing the pmd ones.  Namely:
> >
> > - pudp_invalidate()
> > - pud_modify()
> 
> Zero content about what these helpers do and why they are needed. That's
> not how it works, really.

I hope what Dave suggested to add "by referencing the pmd ones" would be
helpful, because they are exactly referencing those.

But sure.. I rewrote the commit message as following:

    mm/x86: Add missing pud helpers

    Some new helpers will be needed for pud entry updates soon.  Introduce
    these helpers by referencing the pmd ones.  Namely:

      - pudp_invalidate(): this helper invalidates a huge pud before a split
      happens, so that the invalidated pud entry will make sure no race will
      happen (either with software, like a concurrent zap, or hardware, like
      a/d bit lost).

      - pud_modify(): this helper applies a new pgprot to an existing huge pud
      mapping.

    For more information on why we need these two helpers, please refer to the
    corresponding pmd helpers in the mprotect() code path.

    When at it, simplify the pud_modify()/pmd_modify() comments on shadow stack
    pgtable entries to reference pte_modify() to avoid duplicating the whole
    paragraph three times.

Please let me know if this works for you.

> 
>   
> > +static inline pud_t pud_mkinvalid(pud_t pud)
> > +{
> > +	return pfn_pud(pud_pfn(pud),
> > +		       __pgprot(pud_flags(pud) & ~(_PAGE_PRESENT|_PAGE_PROTNONE)));
> 
> 100 characters...

Waiting for an answer on this one, so I'll ignore "100 char" comments for
now, and will address them when I get a clue on what is happening..

> 
> > +}
> > +
> >  static inline u64 flip_protnone_guard(u64 oldval, u64 val, u64 mask);
> >  
> >  static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
> > @@ -834,14 +840,8 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
> >  	pmd_result = __pmd(val);
> >  
> >  	/*
> > -	 * To avoid creating Write=0,Dirty=1 PMDs, pte_modify() needs to avoid:
> > -	 *  1. Marking Write=0 PMDs Dirty=1
> > -	 *  2. Marking Dirty=1 PMDs Write=0
> > -	 *
> > -	 * The first case cannot happen because the _PAGE_CHG_MASK will filter
> > -	 * out any Dirty bit passed in newprot. Handle the second case by
> > -	 * going through the mksaveddirty exercise. Only do this if the old
> > -	 * value was Write=1 to avoid doing this on Shadow Stack PTEs.
> > +	 * Avoid creating shadow stack PMD by accident.  See comment in
> > +	 * pte_modify().
> 
> The changelog is utterly silent about this comment update.

Updated my commit message altogether above; I hope it works.

> 
> >  	 */
> >  	if (oldval & _PAGE_RW)
> >  		pmd_result = pmd_mksaveddirty(pmd_result);
> > @@ -851,6 +851,29 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
> >  	return pmd_result;
> >  }
> >  
> > +static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
> > +{
> > +	pudval_t val = pud_val(pud), oldval = val;
> > +	pud_t pud_result;
> > +
> > +	val &= _HPAGE_CHG_MASK;
> > +	val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
> > +	val = flip_protnone_guard(oldval, val, PHYSICAL_PUD_PAGE_MASK);
> > +
> > +	pud_result = __pud(val);
> > +
> > +	/*
> > +	 * Avoid creating shadow stack PUD by accident.  See comment in
> > +	 * pte_modify().
> > +	 */
> > +	if (oldval & _PAGE_RW)
> > +		pud_result = pud_mksaveddirty(pud_result);
> > +	else
> > +		pud_result = pud_clear_saveddirty(pud_result);
> > +
> > +	return pud_result;
> > +}
> > +
> >  /*
> >   * mprotect needs to preserve PAT and encryption bits when updating
> >   * vm_page_prot
> > @@ -1389,10 +1412,26 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> >  }
> >  #endif
> >  
> > +static inline pud_t pudp_establish(struct vm_area_struct *vma,
> > +		unsigned long address, pud_t *pudp, pud_t pud)
> 
> Random line break alignment.... See documentation.

This is exactly what we do with pmdp_establish() right above.

Would you be fine I keep this just to make pmd/pud look the same?

> 
> > +{
> > +	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> > +	if (IS_ENABLED(CONFIG_SMP)) {
> > +		return xchg(pudp, pud);
> > +	} else {
> > +		pud_t old = *pudp;
> > +		WRITE_ONCE(*pudp, pud);
> 
> Lacks a newline between variable declaration and code.
> 
> But seriously, why optimizing for !SMP? That's a pointless exercise and
> a guarantee for bitrot.

So far it looks still reasonable to me if it is there in pmd.  If I remove
it, people can complain again on "hey, we have this /optimization/ in pmd,
why you removed it in pud?".  No end..

So again.. it's the same to pmd ones.  Either we change nothing, or we
change both.  I don't want to expand this series to more than it wants to
do.. would you mind I keep it until someone justifies the change to modify
both?

> 
> > +		return old;
> > +	}
> > +}
> > +
> >  #define __HAVE_ARCH_PMDP_INVALIDATE_AD
> >  extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
> >  				unsigned long address, pmd_t *pmdp);
> >  
> > +pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> > +		      pud_t *pudp);
> 
> While 'extern' is not required, please keep the file style consistent
> and use the 100 characters...
> 
> > --- a/arch/x86/mm/pgtable.c
> > +++ b/arch/x86/mm/pgtable.c
> > @@ -641,6 +641,18 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
> >  }
> >  #endif
> >  
> > +#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
> > +	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
> > +pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
> > +		     pud_t *pudp)
> > +{
> > +	VM_WARN_ON_ONCE(!pud_present(*pudp));
> > +	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
> > +	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
> > +	return old;
> 
> Your keyboard clearly lacks a newline key ...

This is also the same, that pmdp_invalidate() coded it like exactly that.

In general, I prefer keeping the pmd/pud helpers look the same if you won't
disagree as of now, all over the places.

I know that it might even be better to clean up everything, get everything
reviewed first on pmd changes, then clone that to pud.  That might be
cleaner indeed.  But it adds much fuss all over the places, and even with
this series I got stuck for months.. and so far I haven't yet post what I
really wanted to post (huge pfnmaps).  I sincerely hope we can move forward
with this and then clean things up later (none of them are major issues;
all trivial details so far, IMHO, so nothing I see go severely wrong yet),
and then the cleanup will need to be justified one by one on each spot.

Thanks,

-- 
Peter Xu

