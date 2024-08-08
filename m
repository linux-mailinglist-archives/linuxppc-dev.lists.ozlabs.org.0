Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB7994C1E5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:50:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vae04t7d;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vae04t7d;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfs265yZpz2yHD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 01:50:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vae04t7d;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vae04t7d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wfs1R1w95z2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 01:49:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723132182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c69S7nSyvekSR7azb7NgbUlVdfdg4AICMxtsy48mxj8=;
	b=Vae04t7d78qvb9KHjvMvuypinrIqb0ofTEZVvurErtEpd7I1s2E/curEL4pREdpTDE1Y64
	NwepxXFeJC4yZRtePdYvYTR4//lz+fzB0fP7SSszgApt8Gl3VDbXTwwOZX5K1+kXtRQvRS
	Me8Q6MN8DYqn4mYNamTnjSdLaYGJI6c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723132182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c69S7nSyvekSR7azb7NgbUlVdfdg4AICMxtsy48mxj8=;
	b=Vae04t7d78qvb9KHjvMvuypinrIqb0ofTEZVvurErtEpd7I1s2E/curEL4pREdpTDE1Y64
	NwepxXFeJC4yZRtePdYvYTR4//lz+fzB0fP7SSszgApt8Gl3VDbXTwwOZX5K1+kXtRQvRS
	Me8Q6MN8DYqn4mYNamTnjSdLaYGJI6c=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-154-dPYkTNgyN0q52xrgM2q68g-1; Thu, 08 Aug 2024 11:49:41 -0400
X-MC-Unique: dPYkTNgyN0q52xrgM2q68g-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-70939f4bb1aso63368a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 08:49:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723132180; x=1723736980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c69S7nSyvekSR7azb7NgbUlVdfdg4AICMxtsy48mxj8=;
        b=PChJcH2gsTn80YRr4Yx3UHFMfqXLW6yTtKFFefQ1re01yj81lyNWhYTfwYePJ2Ydtb
         xAwaD9L7AxGcXCBV36UEqW0V+5q5K8Ng+w0WhNpN1wmtnx47TtJNzJ6Kt5wQh55W0VDV
         BeHaOEXS2tjo7DyWuFsAp9sDc74CuVVIWed9aGyiN8n2+QdOtpTUF5dSihppGDvMqFjS
         MJlYLRuCh99EoRpO3dys73pF0pUKYyX1r0MKJ3UHcudcRyg7MUK6kYfHYSwPTM4izn8u
         6qh++kOGw1TLOUOF8nHh32iNJg9rWmRdDZ2FhLP0BdPtIVyp/vDhXeLQgYmQFod5FZYQ
         YyPw==
X-Forwarded-Encrypted: i=1; AJvYcCUTda5hS9UB8zU8HryPxK9Wgequol/DaJJFKlip8q1fkGAAM1Dfly6KVKYKfHNNhGj61ljJC4dESXxfZBY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqWUOunOPeSL+XlPuYajZrUoYDnmW/5+meJrQ4yqOR1C+y/BAM
	ytv65Xsbwf6FwaIU2VU7PTvzrjNltBKk6Q5JjUzM70VB9yJVDjS8iupGyvJ5VaNBhwJflA7/X2j
	QC8PAT8ibc+imMEc4S/r1bK1vhh6GWQBy8GL3+GnPobt7QRWhO5Pz+Wba7QAQ8LU=
X-Received: by 2002:a05:6870:51c7:b0:260:ccfd:b270 with SMTP id 586e51a60fabf-26c58abb4bbmr2308fac.7.1723132180123;
        Thu, 08 Aug 2024 08:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG2v/RUodTRobMhQbY3FEHNXh4Gs9MwrhEqdXluF8KQ8hMZ3OnAtry4aRQGnOXF4AoW7eM3Og==
X-Received: by 2002:a05:6870:51c7:b0:260:ccfd:b270 with SMTP id 586e51a60fabf-26c58abb4bbmr2291fac.7.1723132179728;
        Thu, 08 Aug 2024 08:49:39 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785d0b3fsm171313085a.19.2024.08.08.08.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:49:39 -0700 (PDT)
Date: Thu, 8 Aug 2024 11:49:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v4 5/7] mm/x86: arch_check_zapped_pud()
Message-ID: <ZrTpD0XOUsNMM9tP@x1n>
References: <20240807194812.819412-1-peterx@redhat.com>
 <20240807194812.819412-6-peterx@redhat.com>
 <878qx80xy8.ffs@tglx>
MIME-Version: 1.0
In-Reply-To: <878qx80xy8.ffs@tglx>
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

On Thu, Aug 08, 2024 at 12:28:47AM +0200, Thomas Gleixner wrote:
> On Wed, Aug 07 2024 at 15:48, Peter Xu wrote:
> 
> > Subject: mm/x86: arch_check_zapped_pud()
> 
> Is not a proper subject line. It clearly lacks a verb.
> 
>   Subject: mm/x86: Implement arch_check_zapped_pud()
> 
> 
> > Introduce arch_check_zapped_pud() to sanity check shadow stack on PUD zaps.
> > It has the same logic of the PMD helper.
> 
> s/of/as/

Will fix above two.

> 
> > +
> > +void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
> > +{
> > +	/* See note in arch_check_zapped_pte() */
> > +	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
> > +			pud_shstk(pud));
> 
> Please get rid of the line break. You have 100 characters.

Coding-style.rst still tells me 80 here:

        The preferred limit on the length of a single line is 80 columns.

        Statements longer than 80 columns should be broken into sensible chunks,
        unless exceeding 80 columns significantly increases readability and does
        not hide information.

Maybe this just changed very recently so even not in mm-unstable?

I'll fix the two line-wrap in this patch anyway, as I figured these two
cases even didn't hit 80..  probably because I used fill-column=75 locally..

But still I'll probably need to figure it out for other spots.  Please help
me to justify.

> 
> > +}
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 2a6a3cccfc36..2289e9f7aa1b 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -447,6 +447,13 @@ static inline void arch_check_zapped_pmd(struct vm_area_struct *vma,
> >  }
> >  #endif
> >  
> > +#ifndef arch_check_zapped_pud
> > +static inline void arch_check_zapped_pud(struct vm_area_struct *vma,
> > +					 pud_t pud)
> > +{
> 
> Ditto..
> 
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 0024266dea0a..81c5da0708ed 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> 
> Why is a mm change burried in a patch which is named mm/x86?
> 
> It's clearly documented that core changes with the generic fallback come
> in one patch and the architecture override in a separate one afterwards.
> 
> Do we write documentation just for the sake of writing it?

Hmm if that's the rule, in practise I bet many patches are violating that
rule that we merged and whatever patches I used to read.. but I see now,
I'll break this patch into two.

Personally I'd really still prefer it to be one patch especially when it's
only implemented in x86, then I copy x86+mm maintainers all here and it
explains why it's there.  So please let me know if you think it may still
make sense to keep this patch as-is, or I'll split by default.

Thanks,

-- 
Peter Xu

