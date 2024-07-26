Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5132193D29A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 13:57:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EaTUglNb;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EaTUglNb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVmTX5fJ8z3dSG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 21:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EaTUglNb;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EaTUglNb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVmSq5Xgnz3dBh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 21:56:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721995013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z86IH/NwuVbs4wh6Itna1eI4RVlRsUnJ2R+cQ/ZJjM=;
	b=EaTUglNb42Lv8wIr97+Vnve/ga9x7YeBZELrVKxG/3i9v8+rLofD8hsOJgimysordZ0fMM
	U1xjWjLvjvBVwXRQP2Y6WBukJW9fMlQbBCly6dhbM2QvqVwqvY4+VY7OvlsxLeVlU6OLri
	CT1xg6eLBLNBvFxXLonQo/hanso9aPY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721995013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Z86IH/NwuVbs4wh6Itna1eI4RVlRsUnJ2R+cQ/ZJjM=;
	b=EaTUglNb42Lv8wIr97+Vnve/ga9x7YeBZELrVKxG/3i9v8+rLofD8hsOJgimysordZ0fMM
	U1xjWjLvjvBVwXRQP2Y6WBukJW9fMlQbBCly6dhbM2QvqVwqvY4+VY7OvlsxLeVlU6OLri
	CT1xg6eLBLNBvFxXLonQo/hanso9aPY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-Y1Tb4IWTPzmokXTMCeDTrA-1; Fri, 26 Jul 2024 07:56:51 -0400
X-MC-Unique: Y1Tb4IWTPzmokXTMCeDTrA-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b7973ab9cbso1878826d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 04:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721995010; x=1722599810;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4Z86IH/NwuVbs4wh6Itna1eI4RVlRsUnJ2R+cQ/ZJjM=;
        b=wkGmlIkydBw5LbHTz8QR/pmiR69ghjQgMHS359DzS5/Z7F5c/sxDRuiuQXrStY1L7x
         EUA1h1mn26Vt9kE3CsWg07ptE8tkqxzVsUJko8gcpHemHvxWPM9SRX4cUcOVLAAiVp0p
         xhY+AOOrhqC2QNz0qowTNtV54hdgR5CR1KEfcw52ciEj+bD+B+Q/+/eRlmJQXjQDl3DH
         4O5IJvxsZvSZ09ZL3o6KsPFig6MrVpIN9crhXMQdOKftEjkQsy8d4R3VpgA8FQ0xsmHM
         qEM3B5h79jvGiJ4xmkGwZ7/iFt0isXGqyZC5jODdmK5++eAuA2rLHcsNoWye6+9ghVb0
         O4jg==
X-Forwarded-Encrypted: i=1; AJvYcCXzxVaVwttn2QmFHyE4Tacpq60+fUpGDRnanS7NmidS1IiGYF28mCLkFrfwqfKPnloRX4ob2ZisiGZcKg6RDRSEskiJT/80InJjO7Dk8g==
X-Gm-Message-State: AOJu0Yx4picHZLCAh8VoiVMO7//CYvnzKFIZ99RXTFMRFYvE4vuflh17
	LOEN4L3RYcrMEovOi1JfFtmoy/SMykRYuli+5d2nxL+l0QfQidJNd+t83Q5kWJkdB8Mo2hC4u9g
	Zdy9la6pWPl0ZmgT+RhsZSxY+gkVMk5amaK56n63+3bzT43tGHv908GufyAuYIGA=
X-Received: by 2002:a05:6214:519a:b0:6b0:6370:28d4 with SMTP id 6a1803df08f44-6bb3e36d07bmr37225506d6.6.1721995010428;
        Fri, 26 Jul 2024 04:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEGvC2s1YpmC7Xh0oPNbR2PTMgHDtIWIWACRSqNjlE8cYjZEpmS07NBeANfwhQ2eLo+N025Q==
X-Received: by 2002:a05:6214:519a:b0:6b0:6370:28d4 with SMTP id 6a1803df08f44-6bb3e36d07bmr37225126d6.6.1721995009990;
        Fri, 26 Jul 2024 04:56:49 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3fb17327sm15684346d6.145.2024.07.26.04.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 04:56:49 -0700 (PDT)
Date: Fri, 26 Jul 2024 07:56:46 -0400
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v3 8/8] mm/mprotect: fix dax pud handlings
Message-ID: <ZqOO_hlZtsUIUXUU@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
 <20240715192142.3241557-9-peterx@redhat.com>
 <CADrL8HVH8ff+_Szrmn4ZCyAkm9gDc2oY4VVo3r+6RN_ms6pbhw@mail.gmail.com>
 <ZqLUjQb2BjedihOx@x1n>
 <CADrL8HWGf9BD5WX_zu7TW9NQXVXUwmaeHU6EGRJkSXyk2zesmg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HWGf9BD5WX_zu7TW9NQXVXUwmaeHU6EGRJkSXyk2zesmg@mail.gmail.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 05:23:48PM -0700, James Houghton wrote:
> On Thu, Jul 25, 2024 at 3:41 PM Peter Xu <peterx@redhat.com> wrote:
> >
> > On Thu, Jul 25, 2024 at 11:29:49AM -0700, James Houghton wrote:
> > > > -               pages += change_pmd_range(tlb, vma, pud, addr, next, newprot,
> > > > +
> > > > +               if (pud_leaf(pud)) {
> > > > +                       if ((next - addr != PUD_SIZE) ||
> > > > +                           pgtable_split_needed(vma, cp_flags)) {
> > > > +                               __split_huge_pud(vma, pudp, addr);
> > > > +                               goto again;
> > >
> > > IIUC, most of the time, we're just going to end up clearing the PUD in
> > > this case. __split_huge_pud() will just clear it, then we goto again
> > > and `continue` to the next pudp. Is that ok?
> > >
> > > (I think it's ok as long as: you never map an anonymous page with a
> > > PUD,
> >
> > I think this is true.
> >
> > > and that uffd-wp is not usable with non-hugetlb PUD mappings of
> > > user memory (which I think is only DAX?).
> >
> > Uffd-wp has the async mode that can even work with dax puds.. even though I
> > don't think anyone should be using it.  Just like I'm more sure that nobody
> > is using mprotect() too with dax pud, and it further justifies why nobody
> > cared this much..
> >
> > What uffd-wp would do in this case is it'll make pgtable_split_needed()
> > returns true on this PUD, the PUD got wiped out, goto again, then
> > change_prepare() will populate this pud with a pgtable page.  Then it goes
> > downwards, install PMD pgtable, then probably start installing pte markers
> > ultimately if it's a wr-protect operation.
> 
> Ah, I didn't understand this patch correctly. You're right, you'll
> install PMDs underneath -- I thought we'd just find pud_none() and
> bail out. So this all makes sense, thanks!
> 
> >
> > > So it seems ok today...?)
> >
> > Yes I think it's ok so far, unless you think it's not. :)
> >
> > >
> > > Also, does the comment in pgtable_split_needed() need updating?
> >
> > /*
> >  * Return true if we want to split THPs into PTE mappings in change
> >  * protection procedure, false otherwise.
> >  */
> >
> > It looks to me it's ok for now to me? THP can represents PUD in dax, and we
> > indeed want to break THPs (no matter PUD/PMD) finally into PTE mappings.
> 
> Oh, heh I was thinking of the other comment:
> 
> /*
> * pte markers only resides in pte level, if we need pte markers,
> * we need to split.  We cannot wr-protect shmem thp because file
> * thp is handled differently when split by erasing the pmd so far.
> */
> 
> I guess this is fine too, it just kind of reads as if this function is
> only called for PMDs. *shrug*

Ah ok, yeah it looks mostly fine here too.  Let's make this easy by keeping
it as-is, but if there'll be a new version I can touch it up if it helps
the readings.

> 
> >
> > >
> > > Somewhat related question: change_huge_pmd() is very careful not to
> > > clear the PMD before writing the new value. Yet change_pmd_range(),
> > > when it calls into __split_huge_pmd(), will totally clear the PMD and
> > > then populate the PTEs underneath (in some cases at least), seemingly
> > > reintroducing the MADV_DONTNEED concern. But your PUD version, because
> > > it never re-populates the PUD (or PMDs/PTEs underneath) does not have
> > > this issue. WDYT?
> 
> I guess I'm wrong about this -- your PUD version is the same as the
> PMD version in this respect: both clear the PUD/PMD and then install
> lower page table entries.
> 
> >
> > Could you elaborate more on the DONTNEED issue you're mentioning here?
> 
> In change_huge_pmd(), there is a comment about not clearing the pmd
> before setting the new value. I guess the issue is: if a user is
> MADV_DONTNEEDing some memory and happens to see a cleared PMD, it will
> just move on. But in this case, if change_huge_pmd() temporarily
> cleared a PMD, then MADV_DONTNEED saw it and moved on, and then
> change_huge_pmd() installed a new PMD, the MADV_DONTNEED has basically
> skipped over the PMD, probably not what the user wanted. It seems like
> we have the same issue when a PMD is cleared when we're splitting it.
> 
> But yeah, given that your PUD version is apparently no different from
> the PMD version in this respect, maybe this question isn't very
> interesting. :)

Ah that one, so yeah that's why I introduced pudp_invalidate() in this
series to make sure that issue isn't there.  Then I assume we're good.

Thanks,

-- 
Peter Xu

