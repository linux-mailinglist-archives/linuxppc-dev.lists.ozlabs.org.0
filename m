Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED972062C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 17:28:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXn2Q4vfFz3fGp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jun 2023 01:28:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dOBUs4e+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=dOBUs4e+;
	dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXn1W72DVz3cds
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jun 2023 01:27:26 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-33baee0235cso101685ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jun 2023 08:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685719644; x=1688311644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VGpvRAYJcTbdsEDxK6Clk8jD+jwMUaRTiJd7OGuc/es=;
        b=dOBUs4e+KgoAyiadv1JJ/f9tRqSN5ukcthj4VsU0D4Qes6hv2PsZpLdOPmqCt2ZbfT
         CXdj5C1FgEWgPvMeHAQtRU71Y8a9/s5zW+2gD6fL9oiWaz1NTfBA889r+/CeuBNedToQ
         y9FEwwG2vRh596WD/dNjkYUeIBDO2KkO6LlIO3v8MbmdrEpXss7rB+3TBNMIDEvWgJDY
         9ImYQMoTxddcF5lsSEnQ/wUTIlB70U4obnNud4RtfmLF6/iSzfNonP9zKKd4j9ClkMH5
         2I3BQ8ccjCWIk+EQTYses/gpOeyU9yAW+KUgfVQCLR3fRbgLO8XIkze0Iis1VMMNRgL5
         dd5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685719644; x=1688311644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGpvRAYJcTbdsEDxK6Clk8jD+jwMUaRTiJd7OGuc/es=;
        b=fj/QH0O1TmTF7jPAl3vAeLrmZbuiOzqnIbXM/oKdC6kOOL6hBl+OUGc/XE7Zy91fa5
         JY5WTTH/xrqwLmXYxGvMK1q/KFhCHOAPcsIDg+ods8+4jgLKMzq0KbNDMXH7IG9YWC7d
         0W8J/uaBrRgeR6cSW5NvfnS+b1MkyBuVZIB9YSzwWdFavG9B9GpBBAincKz7GbGf3R9P
         /gKo1bw+39vwO3GEV7V2rCWF7RhpLFnJa2JY34UlSAKukdQPsWs9eVJZCq990BIa14xS
         PbdGEa9pgckY8Sca76WxZTWRgPM5pDVckqdJ/054audTVqkzFLFBIIkAhVF76aFQbvFD
         jqJg==
X-Gm-Message-State: AC+VfDxO8JEQZ77/RQTJAxpIUlANeV6iPTU2rGwNxKk/eSiqwjRHRKdy
	kdmZQ3GTbcgIxHLsgsa0KppZNw5S+agasLHxblc0sA==
X-Google-Smtp-Source: ACHHUZ6wYA9MFcxbCRs4DlQGPF6tbNz6AN15jZgbaKRQbuP7sxKmkHSJQSJyONgVy18SRiB84LFHkHiwlvKWwKGXIik=
X-Received: by 2002:a05:6e02:164a:b0:33c:c3ed:889c with SMTP id
 v10-20020a056e02164a00b0033cc3ed889cmr239170ilu.12.1685719644120; Fri, 02 Jun
 2023 08:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <CAG48ez0pCqfRdVSnJz7EKtNvMR65=zJgVB-72nTdrNuhtJNX2Q@mail.gmail.com> <3a33b59f-47c1-9dea-209a-9f77eec3cb1@google.com>
In-Reply-To: <3a33b59f-47c1-9dea-209a-9f77eec3cb1@google.com>
From: Jann Horn <jannh@google.com>
Date: Fri, 2 Jun 2023 17:26:47 +0200
Message-ID: <CAG48ez1Yua=6ztK6Urc-BZj9ku14MWbOKP8iBUK6_F5VzRXP-A@mail.gmail.com>
Subject: Re: [PATCH 00/12] mm: free retracted page table by RCU
To: Hugh Dickins <hughd@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 2, 2023 at 6:37=E2=80=AFAM Hugh Dickins <hughd@google.com> wrot=
e:
> On Wed, 31 May 2023, Jann Horn wrote:
> > On Mon, May 29, 2023 at 8:11=E2=80=AFAM Hugh Dickins <hughd@google.com>=
 wrote:
> > > Here is the third series of patches to mm (and a few architectures), =
based
> > > on v6.4-rc3 with the preceding two series applied: in which khugepage=
d
> > > takes advantage of pte_offset_map[_lock]() allowing for pmd transitio=
ns.
> >
> > To clarify: Part of the design here is that when you look up a user
> > page table with pte_offset_map_nolock() or pte_offset_map() without
> > holding mmap_lock in write mode, and you later lock the page table
> > yourself, you don't know whether you actually have the real page table
> > or a detached table that is currently in its RCU grace period, right?
>
> Right.  (And I'd rather not assume anything of mmap_lock, but there are
> one or two or three places that may still do so.)
>
> > And detached tables are supposed to consist of only zeroed entries,
> > and we assume that no relevant codepath will do anything bad if one of
> > these functions spuriously returns a pointer to a page table full of
> > zeroed entries?
>
> (Nit that I expect you're well aware of: IIRC "zeroed" isn't 0 on s390.)

I was not aware, thanks. I only knew that on Intel's Knights Landing
CPUs, the A/D bits are ignored by pte_none() due to some erratum.

> If someone is using pte_offset_map() without lock, they must be prepared
> to accept page-table-like changes.  The limits of pte_offset_map_nolock()
> with later spin_lock(ptl): I'm still exploring: there's certainly an
> argument that one ought to do a pmd_same() check before proceeding,
> but I don't think anywhere needs that at present.
>
> Whether the page table has to be full of zeroed entries when detached:
> I believe it is always like that at present (by the end of the series,
> when the collapse_pte_offset_map() oddity is fixed), but whether it needs
> to be so I'm not sure.  Quite likely it will need to be; but I'm open to
> the possibility that all it needs is to be still a page table, with
> perhaps new entries from a new usage in it.

My understanding is that at least handle_pte_fault(), the way it is
currently written, would do bad things in that case:

// assume we enter with mmap_lock in read mode,
// for a write fault on a shared writable VMA without a page_mkwrite handle=
r
static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
{
  pte_t entry;

  if (unlikely(pmd_none(*vmf->pmd))) {
    [ not executed ]
  } else {
    /*
     * A regular pmd is established and it can't morph into a huge
     * pmd by anon khugepaged, since that takes mmap_lock in write
     * mode; but shmem or file collapse to THP could still morph
     * it into a huge pmd: just retry later if so.
     */
    vmf->pte =3D pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
             vmf->address, &vmf->ptl);
    if (unlikely(!vmf->pte))
      [not executed]
    [assume that at this point, a concurrent THP collapse operation
     removes the page table, and the page table has now been reused
     and contains a read-only PTE]
    // this reads page table contents protected solely by RCU
    vmf->orig_pte =3D ptep_get_lockless(vmf->pte);
    vmf->flags |=3D FAULT_FLAG_ORIG_PTE_VALID;

    if (pte_none(vmf->orig_pte)) {
      pte_unmap(vmf->pte);
      vmf->pte =3D NULL;
    }
  }

  if (!vmf->pte)
    [not executed]

  if (!pte_present(vmf->orig_pte))
    [not executed]

  if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma))
    [not executed]

  spin_lock(vmf->ptl);
  entry =3D vmf->orig_pte;
  if (unlikely(!pte_same(*vmf->pte, entry))) {
    [not executed]
  }
  if (vmf->flags & (FAULT_FLAG_WRITE|FAULT_FLAG_UNSHARE)) {
    if (!pte_write(entry))
      // This will go into wp_page_shared(),
      // which will call wp_page_reuse(),
      // which will upgrade the page to writable
      return do_wp_page(vmf);
    [ not executed ]
  }
  [ not executed ]
}

That looks like we could end up racing such that a read-only PTE in
the reused page table gets upgraded to writable, which would probably
be a security bug.

But I guess if you added bailout checks to every page table lock
operation, it'd be a different story, maybe?

> The most obvious vital thing (in the split ptlock case) is that it
> remains a struct page with a usable ptl spinlock embedded in it.
>
> The question becomes more urgent when/if extending to replacing the
> pagetable pmd by huge pmd in one go, without any mmap_lock: powerpc
> wants to deposit the page table for later use even in the shmem/file
> case (and all arches in the anon case): I did work out the details once
> before, but I'm not sure whether I would still agree with myself; and was
> glad to leave replacement out of this series, to revisit some time later.
>
> >
> > So in particular, in handle_pte_fault() we can reach the "if
> > (unlikely(!pte_same(*vmf->pte, entry)))" with vmf->pte pointing to a
> > detached zeroed page table, but we're okay with that because in that
> > case we know that !pte_none(vmf->orig_pte)&&pte_none(*vmf->pte) ,
> > which implies !pte_same(*vmf->pte, entry) , which means we'll bail
> > out?
>
> There is no current (even at end of series) circumstance in which we
> could be pointing to a detached page table there; but yes, I want to
> allow for that, and yes I agree with your analysis.

Hmm, what am I missing here?

static vm_fault_t handle_pte_fault(struct vm_fault *vmf)
{
  pte_t entry;

  if (unlikely(pmd_none(*vmf->pmd))) {
    [not executed]
  } else {
    /*
     * A regular pmd is established and it can't morph into a huge
     * pmd by anon khugepaged, since that takes mmap_lock in write
     * mode; but shmem or file collapse to THP could still morph
     * it into a huge pmd: just retry later if so.
     */
    vmf->pte =3D pte_offset_map_nolock(vmf->vma->vm_mm, vmf->pmd,
             vmf->address, &vmf->ptl);
    if (unlikely(!vmf->pte))
      [not executed]
    // this reads a present readonly PTE
    vmf->orig_pte =3D ptep_get_lockless(vmf->pte);
    vmf->flags |=3D FAULT_FLAG_ORIG_PTE_VALID;

    if (pte_none(vmf->orig_pte)) {
      [not executed]
    }
  }

  [at this point, a concurrent THP collapse operation detaches the page tab=
le]
  // vmf->pte now points into a detached page table

  if (!vmf->pte)
    [not executed]

  if (!pte_present(vmf->orig_pte))
    [not executed]

  if (pte_protnone(vmf->orig_pte) && vma_is_accessible(vmf->vma))
    [not executed]

  spin_lock(vmf->ptl);
  entry =3D vmf->orig_pte;
  // vmf->pte still points into a detached page table
  if (unlikely(!pte_same(*vmf->pte, entry))) {
    update_mmu_tlb(vmf->vma, vmf->address, vmf->pte);
    goto unlock;
  }
  [...]
}

> But with the
> interesting unanswered question for the future, of what if the same
> value could be found there: would that imply it's safe to proceed,
> or would some further prevention be needed?

That would then hand the pointer to the detached page table to
functions like do_wp_page(), which I think will do bad things (see
above) if they are called on either a page table that has been reused
in a different VMA with different protection flags (which could, for
example, lead to pages becoming writable that should not be writable
or such things) or on a page table that is no longer in use (because
it would assume that PTEs referencing pages are refcounted when they
actually aren't).

> > If that's the intent, it might be good to add some comments, because
> > at least to me that's not very obvious.
>
> That's a very fair request; but I shall have difficulty deciding where
> to place such comments.  I shall have to try, then you redirect me.
>
> And I think we approach this in opposite ways: my nature is to put some
> infrastructure in place, and then look at it to see what we can get away
> with; whereas your nature is to define upfront what the possibilities are=
.
> We can expect some tussles!

Yeah. :P
One of my strongly-held beliefs is that it's important when making
changes to code to continuously ask oneself "If I had to explain the
rules by which this code operates - who has to take which locks, who
holds references to what and so on -, how complicated would those
rules be?", and if that turns into a series of exception cases, that
probably means there will be bugs, because someone will probably lose
track of one of those exceptions. So I would prefer it if we could
have some rule like "whenever you lock an L1 page table, you must
immediately recheck whether the page table is still referenced by the
L2 page table, unless you know that you have a stable page reference
for whatever reason", and then any code that operates on a locked page
table doesn't have to worry about whether the page table might be
detached.
