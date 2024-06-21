Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802F912A90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 17:46:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3X7MeWl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3X7MeWl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5MCb5CTJz3cZs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jun 2024 01:46:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3X7MeWl;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B3X7MeWl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5MBs1fR8z30Vd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jun 2024 01:45:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718984737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DvV7QxN2N8EkXiFQ37jwVC1N3GHUF6ZxiwTS9PAYN+c=;
	b=B3X7MeWlJqosfUIRCa32iQ/ZFFFdZ6xehvr8ykD64zFuA/8L3c0810LUP/g+FkZGfwjBOE
	8B7mMIP33kEQfbtnOnp0uoAf5KjPYqRlngeW5BYhaKG8jyqqjoVJPniHltAJPr6FSLPyNV
	ZKmcuV6ncs4Sj5L4m7O7FF+W4RGMHG4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718984737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DvV7QxN2N8EkXiFQ37jwVC1N3GHUF6ZxiwTS9PAYN+c=;
	b=B3X7MeWlJqosfUIRCa32iQ/ZFFFdZ6xehvr8ykD64zFuA/8L3c0810LUP/g+FkZGfwjBOE
	8B7mMIP33kEQfbtnOnp0uoAf5KjPYqRlngeW5BYhaKG8jyqqjoVJPniHltAJPr6FSLPyNV
	ZKmcuV6ncs4Sj5L4m7O7FF+W4RGMHG4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-EJmhrzKUMgiUK11kuw9H6A-1; Fri, 21 Jun 2024 11:45:36 -0400
X-MC-Unique: EJmhrzKUMgiUK11kuw9H6A-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7955e5ebc55so19065585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 08:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718984736; x=1719589536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DvV7QxN2N8EkXiFQ37jwVC1N3GHUF6ZxiwTS9PAYN+c=;
        b=H5v9RnSM6fsMey1fisEb4nW1qAJ9vg7hG58UxZAN+Sjf3r1XNVIxpZ07LvDpuSxHOL
         gEeqnF9qa9D1wRVJCVqnSi29hLsftJqEy0vctfRlVp6FxAQt+CIaFp1I9GiwVqRdpYmz
         ti0Av75gCZ4eeg/IPWFh0A6gSSGairzquHC1TejpoU0zIw/FeVNjbkqP0L5vg0FCk8VI
         DYzHzYC9fjkPH8vGtHVhureuqgdfhBfnO2zgMB4K0O0/9jdYpbOl5WVcMrNMWkjgwk8C
         ZO+Dn8EtTcBN7nxpMxU1RSe+gCKxWDgH2e4bmgSsti+2655lGdXCxNZckZEFfP2k9xwj
         O51w==
X-Forwarded-Encrypted: i=1; AJvYcCUJFnZRi9e5YSSWLCZ99q11ui/I1r5tZ4Q0f6fYFaM8bTL/4/pGaUaB04+SpdQK92E5pAZk3GL1b3n02eAdD9zDFt47IPJfVZS/cSqzVg==
X-Gm-Message-State: AOJu0YxtrC82TG2vC1231hqRGsz/3QAVdL3QSf1qqLzWSNDke4G/mzQU
	7fO1llxOZNsNqnn53M78Zm7oJdZZn17K0wNWIhPfFnm4mtCMDBE11aLZa127e3cC0dzDAkk0lTo
	JSem4R+OWUP4Xozj7X3pexDWr2aLvzQhVWfkGJ9vDxxk82HtcZIAtJKTcD/kQM08=
X-Received: by 2002:ad4:5be2:0:b0:6b2:bfe2:70c3 with SMTP id 6a1803df08f44-6b501ede972mr90358176d6.4.1718984735683;
        Fri, 21 Jun 2024 08:45:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB4nZlIY0H/jVph74+0l9c524qednI2eEp5OI3eX2TFxMHuOsOPAnloJuGVmQCrkbVd6KN2g==
X-Received: by 2002:ad4:5be2:0:b0:6b2:bfe2:70c3 with SMTP id 6a1803df08f44-6b501ede972mr90357756d6.4.1718984735058;
        Fri, 21 Jun 2024 08:45:35 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b51ef4b1f7sm9609536d6.108.2024.06.21.08.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 08:45:34 -0700 (PDT)
Date: Fri, 21 Jun 2024 11:45:31 -0400
From: Peter Xu <peterx@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 6/7] mm/x86: Add missing pud helpers
Message-ID: <ZnWgG7WmZWS-xWJU@x1n>
References: <20240621142504.1940209-1-peterx@redhat.com>
 <20240621142504.1940209-7-peterx@redhat.com>
 <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
MIME-Version: 1.0
In-Reply-To: <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 07:51:26AM -0700, Dave Hansen wrote:
> On 6/21/24 07:25, Peter Xu wrote:
> > These new helpers will be needed for pud entry updates soon.  Namely:
> > 
> > - pudp_invalidate()
> > - pud_modify()
> 
> I think it's also definitely worth noting where you got this code from.
> Presumably you copied, pasted and modified the PMD code.  That's fine,
> but it should be called out.

Yes that's from PMD ones.  Sure, I will add that.

> 
> ...
> > +static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
> > +{
> > +	pudval_t val = pud_val(pud), oldval = val;
> > +
> > +	/*
> > +	 * NOTE: no need to consider shadow stack complexities because it
> > +	 * doesn't support 1G mappings.
> > +	 */
> > +	val &= _HPAGE_CHG_MASK;
> > +	val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
> > +	val = flip_protnone_guard(oldval, val, PHYSICAL_PUD_PAGE_MASK);
> > +
> > +	return __pud(val);
> > +}
> 
> First of all, the comment to explain what you didn't do here is as many
> lines as the code to _actually_ implement it.
> 
> Second, I believe this might have missed the purpose of the "shadow
> stack complexities".  The pmd/pte code is there not to support modifying
> shadow stack mappings, it's there to avoid inadvertent shadow stack
> mapping creation.
> 
> That "NOTE:" is ambiguous as to whether the shadow stacks aren't
> supported on 1G mappings in Linux or the hardware (I just checked the
> hardware docs and don't see anything making 1G mappings special, btw).

Right this could be ambiguous indeed; I was trying to refer to the fact
where shadow stack is only supported on anon, and anon doesn't support 1G.
But looks like I'm more than wrong than that..

> 
> But, still, what if you take a Dirty=1,Write=1 pud and pud_modify() it
> to make it Dirty=1,Write=0?  What prevents that from being
> misinterpreted by the hardware as being a valid 1G shadow stack mapping?

Thanks for pointing that out.  I think I was thinking it will only take
effect on VM_SHADOW_STACK first, so it's not?

I was indeed trying to find more information on shadow stack at that time
but I can't find as much on the pgtable implications, on e.g. whether "D=1
+ W=0" globally will be recognized as shadow stack.  At least on SDM March
2024 version Vol3 Chap4 pgtable entries still don't explain these details,
or maybe I missed it.  Please let me know if there's suggestion on what I
can read before I post a v2.

So if it's globally taking effect, indeed we'll need to handle them in PUDs
too.

Asides, not sure whether it's off-topic to ask here, but... why shadow
stack doesn't reuse an old soft-bit to explicitly mark "this is shadow
stack ptes" when designing the spec?  Now it consumed bit 58 anyway for
caching dirty. IIUC we can avoid all these "move back and forth" issue on
dirty bit if so.

> 
> >  /*
> >   * mprotect needs to preserve PAT and encryption bits when updating
> >   * vm_page_prot
> > @@ -1377,10 +1398,25 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
> >  }
> >  #endif
> >  
> > +static inline pud_t pudp_establish(struct vm_area_struct *vma,
> > +		unsigned long address, pud_t *pudp, pud_t pud)
> > +{
> > +	if (IS_ENABLED(CONFIG_SMP)) {
> > +		return xchg(pudp, pud);
> > +	} else {
> > +		pud_t old = *pudp;
> > +		WRITE_ONCE(*pudp, pud);
> > +		return old;
> > +	}
> > +}
> 
> Why is there no:
> 
> 	page_table_check_pud_set(vma->vm_mm, pudp, pud);
> 
> ?  Sure, it doesn't _do_ anything today.  But the PMD code has it today.
>  So leaving it out creates a divergence that honestly can only serve to
> bite us in the future and will create a head-scratching delta for anyone
> that is comparing PUD and PMD implementations in the future.

Good question, I really don't remember why I didn't have that, since I
should have referenced the pmd helper.  I'll add them and see whether I'll
hit something otherwise.

Thanks for the review.

-- 
Peter Xu

