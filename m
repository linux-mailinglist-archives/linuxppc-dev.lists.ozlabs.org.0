Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FF793CC11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 02:25:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XDrZNUtc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVT6Y40DXz3cDN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 10:25:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=XDrZNUtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::830; helo=mail-qt1-x830.google.com; envelope-from=jthoughton@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com [IPv6:2607:f8b0:4864:20::830])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVT5r2Q7hz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 10:24:31 +1000 (AEST)
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-44fee2bfd28so47071cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 17:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721953465; x=1722558265; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77qlRcL4PUP5h8ZRxtqeaydLFX3D5DF3IEwpxS5zrYg=;
        b=XDrZNUtcF7goiKenVYwbsxj9soFfWczx503x8JSkL4ixFHOKK4wlImEEpPCxB4TAMF
         595yaxtjXfjm1ywT8c++sMjiTxcZm/wlmILe+8vZ3JDqF9V9A1jNBTzpMkXU7g6c/ma+
         45wH3XY0tvL/JqV2hxTVd1kFtMLm8iMJIk9yQYeAAGdfZdORuZ/6c/mzQUdmnW3CHDC8
         Kcs+Dyma8H/ZoJOUhx70qviuA/5V1mhnQzwbP9InzY5Y/ufk+593RFMddva+LFOlnYcS
         lwRbrRpw9GazKoB9BrJNpGus2B6v3+1vb9gZ1TuAjDGFDO1nV4XVcekyX0MhLnGZQK/5
         9jrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721953465; x=1722558265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77qlRcL4PUP5h8ZRxtqeaydLFX3D5DF3IEwpxS5zrYg=;
        b=c1GBGM5voDiSajDls+zCPjRW2JomjGjslV63Pz8d5zKtYTQyrIL5v/JZwgJrn2OhfO
         xRmojlqaqYTtaRs+4xa4Nhr8RUBlAAac1bNAzsP7cgTEANhinShAJIaDbTytImbxjYid
         oo8FFHJBs/OZf5O5Pmcquy60Viq6f6gu8HqO6mUX0rJr3+275HeJOBr+HDSooIOG9lW+
         JAPZkw3XoOnKOifZYRo4CumZo5NUSbAHjLaT5pOr9tFnNqI5YcDEvRIgnMRE4JreDgrv
         df2hDHhFwsDnVpvTusQJK4gsz241UpsEmMhe6pmR3jujaT4Aq7BQCAiRXk5m2Rbgl4TT
         hYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVv0ZB5+Jn8DHOsI348sRkSDXjLCa/8CCGvpLjvznAHWJbtOdZ6WQKAzM61xf236yHYUF3Vqz3vLNARJCJbMTK8RqyTwR9bNr/7OSkwA==
X-Gm-Message-State: AOJu0YwrZj+KROt63TTf8z1N6x4hEKOf/8Hwx+L3BjCCU66+8I/McBDx
	J0OperfGDtrz6kRMIp01PTqaFTO2Kl72KPZfdmo42XkJLC1UpK5+1eeK55czn/c1VMafqZRILty
	N7dSMG7mnVKo4szP1Fw0956zLQjDH6Yq6UrQm
X-Google-Smtp-Source: AGHT+IFxRpjgJ6wObQXGzkn9wNtJ+JxPuAaUrFwCV1R1K/Oz3SbJ3MmktuoDvJaW8UnM7obg5LRzDolOme3IjG1RkEI=
X-Received: by 2002:ac8:7e8f:0:b0:447:d78d:773b with SMTP id
 d75a77b69052e-44ff3a6e49amr1570931cf.6.1721953465392; Thu, 25 Jul 2024
 17:24:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240715192142.3241557-1-peterx@redhat.com> <20240715192142.3241557-9-peterx@redhat.com>
 <CADrL8HVH8ff+_Szrmn4ZCyAkm9gDc2oY4VVo3r+6RN_ms6pbhw@mail.gmail.com> <ZqLUjQb2BjedihOx@x1n>
In-Reply-To: <ZqLUjQb2BjedihOx@x1n>
From: James Houghton <jthoughton@google.com>
Date: Thu, 25 Jul 2024 17:23:48 -0700
Message-ID: <CADrL8HWGf9BD5WX_zu7TW9NQXVXUwmaeHU6EGRJkSXyk2zesmg@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] mm/mprotect: fix dax pud handlings
To: Peter Xu <peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2024 at 3:41=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jul 25, 2024 at 11:29:49AM -0700, James Houghton wrote:
> > > -               pages +=3D change_pmd_range(tlb, vma, pud, addr, next=
, newprot,
> > > +
> > > +               if (pud_leaf(pud)) {
> > > +                       if ((next - addr !=3D PUD_SIZE) ||
> > > +                           pgtable_split_needed(vma, cp_flags)) {
> > > +                               __split_huge_pud(vma, pudp, addr);
> > > +                               goto again;
> >
> > IIUC, most of the time, we're just going to end up clearing the PUD in
> > this case. __split_huge_pud() will just clear it, then we goto again
> > and `continue` to the next pudp. Is that ok?
> >
> > (I think it's ok as long as: you never map an anonymous page with a
> > PUD,
>
> I think this is true.
>
> > and that uffd-wp is not usable with non-hugetlb PUD mappings of
> > user memory (which I think is only DAX?).
>
> Uffd-wp has the async mode that can even work with dax puds.. even though=
 I
> don't think anyone should be using it.  Just like I'm more sure that nobo=
dy
> is using mprotect() too with dax pud, and it further justifies why nobody
> cared this much..
>
> What uffd-wp would do in this case is it'll make pgtable_split_needed()
> returns true on this PUD, the PUD got wiped out, goto again, then
> change_prepare() will populate this pud with a pgtable page.  Then it goe=
s
> downwards, install PMD pgtable, then probably start installing pte marker=
s
> ultimately if it's a wr-protect operation.

Ah, I didn't understand this patch correctly. You're right, you'll
install PMDs underneath -- I thought we'd just find pud_none() and
bail out. So this all makes sense, thanks!

>
> > So it seems ok today...?)
>
> Yes I think it's ok so far, unless you think it's not. :)
>
> >
> > Also, does the comment in pgtable_split_needed() need updating?
>
> /*
>  * Return true if we want to split THPs into PTE mappings in change
>  * protection procedure, false otherwise.
>  */
>
> It looks to me it's ok for now to me? THP can represents PUD in dax, and =
we
> indeed want to break THPs (no matter PUD/PMD) finally into PTE mappings.

Oh, heh I was thinking of the other comment:

/*
* pte markers only resides in pte level, if we need pte markers,
* we need to split.  We cannot wr-protect shmem thp because file
* thp is handled differently when split by erasing the pmd so far.
*/

I guess this is fine too, it just kind of reads as if this function is
only called for PMDs. *shrug*

>
> >
> > Somewhat related question: change_huge_pmd() is very careful not to
> > clear the PMD before writing the new value. Yet change_pmd_range(),
> > when it calls into __split_huge_pmd(), will totally clear the PMD and
> > then populate the PTEs underneath (in some cases at least), seemingly
> > reintroducing the MADV_DONTNEED concern. But your PUD version, because
> > it never re-populates the PUD (or PMDs/PTEs underneath) does not have
> > this issue. WDYT?

I guess I'm wrong about this -- your PUD version is the same as the
PMD version in this respect: both clear the PUD/PMD and then install
lower page table entries.

>
> Could you elaborate more on the DONTNEED issue you're mentioning here?

In change_huge_pmd(), there is a comment about not clearing the pmd
before setting the new value. I guess the issue is: if a user is
MADV_DONTNEEDing some memory and happens to see a cleared PMD, it will
just move on. But in this case, if change_huge_pmd() temporarily
cleared a PMD, then MADV_DONTNEED saw it and moved on, and then
change_huge_pmd() installed a new PMD, the MADV_DONTNEED has basically
skipped over the PMD, probably not what the user wanted. It seems like
we have the same issue when a PMD is cleared when we're splitting it.

But yeah, given that your PUD version is apparently no different from
the PMD version in this respect, maybe this question isn't very
interesting. :)

>
> >
> > Thanks for this series!
>
> Thanks for reviewing it, James.
