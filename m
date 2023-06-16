Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E67B6733B8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 23:29:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kDqKbU7P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjXP85LgHz3bw9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Jun 2023 07:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=kDqKbU7P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjXNG24vTz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jun 2023 07:29:00 +1000 (AEST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-57012b2973eso14367947b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 14:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686950935; x=1689542935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8f4Qp7cwj4O2kdf7qLqLnrTRkxhB0m+8FmgrZaxSBc=;
        b=kDqKbU7P9edSk/BgMH9xSstpKqVCZCkotk48bdhsv9CQedo7tgzNx594G7ZL6GQuxg
         jA1o2JPcz0QDYMp8Gk7IfVIBu/Qb0pO39azZ5F7HLfZC1IgCGAp3b3idtV3rR/BwTQDN
         x0xETay6eu3ghZcxBbeBHYOXCm+0UdQ18fM+kmxKxAuiYRqF/zWkw4LlfaXk/Ol9POup
         f5e5C/WGoi8jmqXjJwP7rx3T/q8TLMKNW53qsepy7E0u9eKRuHWvS7CgQ60QFJLvcMrS
         P+YDUzuxecN+sqBu1rA+X9cuH9CB9q1H/97ksOSagJnc4ZVXc8JgbNn89oLF/7saT6Tn
         z99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686950935; x=1689542935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8f4Qp7cwj4O2kdf7qLqLnrTRkxhB0m+8FmgrZaxSBc=;
        b=OkQY6B8tI/sLggVRX8Dd3m/IK+8brGNTolRqIGuGWbYWsjxXJP6B/sHhwFcRv9pLZr
         kqpEYXEcaZA9HnydZbQHs2xGyCdQ5iQ+M3NL/7sPucKoPlbMtRDOh/2SPp34oz0ttDSL
         5t6Iq/fsEahOuigZpsWOUnPxNPyTSq9A08wLN9aZbdpcDeOqvEFw1BRTaznaoY714fMj
         DtTfTTSp8ZQryUrfsTqXV6en1Ixw0amByIZ+jltKdIHxMs0AEyWy7zlVUfl2LesYjsRE
         khyo93oJrxPkA2ToFiK4yTI4JIMa0VOEmaLMGpdHBT1Fb9iGly1ldOvwY/spW0yL1Kos
         4TIg==
X-Gm-Message-State: AC+VfDxUG+TuCVa9M7j/FGFFPitKlqPpwJolTlvUEcM5SxIfsS7lISLE
	YrpIbiov1d4kVat35WV69Sro40iru0YtfPih/fI=
X-Google-Smtp-Source: ACHHUZ7/iv7DGmrSbI7dWoycmh8dvViREYGBrKV5KnrTS1VkZy/HhcudLLxyAMIf5U1P44XX8eoY39CR0V8jmRNeXMA=
X-Received: by 2002:a81:6c02:0:b0:56c:f684:b4f0 with SMTP id
 h2-20020a816c02000000b0056cf684b4f0mr2990065ywc.27.1686950935072; Fri, 16 Jun
 2023 14:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com> <fd63179-6ad6-fd86-79d6-2833c91111f8@google.com>
In-Reply-To: <fd63179-6ad6-fd86-79d6-2833c91111f8@google.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Fri, 16 Jun 2023 14:28:44 -0700
Message-ID: <CAOzc2pwhoF=XNCoe-+w2Z5MRoRJGvTfSr56HV00OGitEBMtPcw@mail.gmail.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, linux-mm@kvack.org, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-openrisc@vger.kernel.org, linux-mips@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 15, 2023 at 12:57=E2=80=AFAM Hugh Dickins <hughd@google.com> wr=
ote:
>
> On Mon, 12 Jun 2023, Vishal Moola (Oracle) wrote:
>
> > Currently, page table information is stored within struct page. As part
> > of simplifying struct page, create struct ptdesc for page table
> > information.
> >
> > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
>
> Vishal, as I think you have already guessed, your ptdesc series and
> my pte_free_defer() "mm: free retracted page table by RCU" series are
> on a collision course.
>
> Probably just trivial collisions in most architectures, which either
> of us can easily adjust to the other; powerpc likely to be more awkward,
> but fairly easily resolved; s390 quite a problem.
>
> I've so far been unable to post a v2 of my series (and powerpc and s390
> were stupidly wrong in the v1), because a good s390 patch is not yet
> decided - Gerald Schaefer and I are currently working on that, on the
> s390 list (I took off most Ccs until we are settled and I can post v2).
>
> As you have no doubt found yourself, s390 has sophisticated handling of
> free half-pages already, and I need to add rcu_head usage in there too:
> it's tricky to squeeze it all in, and ptdesc does not appear to help us
> in any way (though mostly it's just changing some field names, okay).
>
> If ptdesc were actually allowing a flexible structure which architectures
> could add into, that would (in some future) be nice; but of course at
> present it's still fitting it all into one struct page, and mandating
> new restrictions which just make an architecture's job harder.

A goal of ptdescs is to make architecture's jobs simpler and standardized.
Unfortunately, ptdescs are nowhere near isolated from struct page yet.
This version of struct ptdesc contains the exact number of fields architect=
ures
need right now, just reorganized to be located next to each other. It *prob=
ably*
shouldn't make an architectures job harder, aside from discouraging their u=
se
of yet even more members of struct page.

> Some notes on problematic fields below FYI.
>
> > ---
> >  include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index c5a51481bbb9..330de96ebfd6 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(struct =
vm_area_struct *vma,
> >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> >  #endif /* CONFIG_MMU */
> >
> > +
> > +/**
> > + * struct ptdesc - Memory descriptor for page tables.
> > + * @__page_flags: Same as page flags. Unused for page tables.
> > + * @pt_list: List of used page tables. Used for s390 and x86.
> > + * @_pt_pad_1: Padding that aliases with page's compound head.
> > + * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
> > + * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gmap on=
ly.
> > + * @pt_mm: Used for x86 pgds.
> > + * @pt_frag_refcount: For fragmented page table tracking. Powerpc and =
s390 only.
> > + * @ptl: Lock for the page table.
> > + *
> > + * This struct overlays struct page for now. Do not modify without a g=
ood
> > + * understanding of the issues.
> > + */
> > +struct ptdesc {
> > +     unsigned long __page_flags;
> > +
> > +     union {
> > +             struct list_head pt_list;
>
> I shall be needing struct rcu_head rcu_head (or pt_rcu_head or whatever,
> if you prefer) in this union too.  Sharing the lru or pt_list with rcu_he=
ad
> is what's difficult to get right and efficient on s390 - and if ptdesc ga=
ve
> us an independent rcu_head for each page table, that would be a blessing!
> but sadly not, it still has to squeeze into a struct page.

I can add a pt_rcu_head along with a comment to deter aliasing issues :)
Independent rcu_heads aren't coming any time soon though :(

> > +             struct {
> > +                     unsigned long _pt_pad_1;
> > +                     pgtable_t pmd_huge_pte;
> > +             };
> > +     };
> > +     unsigned long _pt_s390_gaddr;
> > +
> > +     union {
> > +             struct mm_struct *pt_mm;
> > +             atomic_t pt_frag_refcount;
>
> Whether s390 will want pt_mm is not yet decided: I want to use it,
> Gerald prefers to go without it; but if we do end up using it,
> then pt_frag_refcount is a luxury we would have to give up.

I don't like the use of pt_mm for s390 either. s390 uses space equivalent
to all five words allocated in the page table struct (albeit in various pla=
ces
of struct page). Using extra space (especially allocated for unrelated
reasons) just because it exists makes things more complicated and
confusing, and s390 is already confusing enough as a result of that.

If having access to pt_mm is necessary I can drop the
pt_frag_refcount patch, but I'd rather avoid it.

> s390 does very well already with its _refcount tricks, and I'd expect
> powerpc's simpler but more wasteful implementation to work as well
> with _refcount too - I know that a few years back, powerpc did misuse
> _refcount (it did not allow for speculative accesses, thought it had
> sole ownership of that field); but s390 copes well with that, and I
> expect powerpc can do so too, without the luxury of pt_frag_refcount.
>
> But I've no desire to undo powerpc's use of pt_frag_refcount:
> just warning that we may want to undo any use of it in s390.
>
> I thought I had more issues to mention, probably Gerald will
> remind me of a whole new unexplored dimension! gmap perhaps.
>
> Hugh
>
> > +     };
> > +
> > +#if ALLOC_SPLIT_PTLOCKS
> > +     spinlock_t *ptl;
> > +#else
> > +     spinlock_t ptl;
> > +#endif
> > +};
> > +
> > +#define TABLE_MATCH(pg, pt)                                          \
> > +     static_assert(offsetof(struct page, pg) =3D=3D offsetof(struct pt=
desc, pt))
> > +TABLE_MATCH(flags, __page_flags);
> > +TABLE_MATCH(compound_head, pt_list);
> > +TABLE_MATCH(compound_head, _pt_pad_1);
> > +TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
> > +TABLE_MATCH(mapping, _pt_s390_gaddr);
> > +TABLE_MATCH(pt_mm, pt_mm);
> > +TABLE_MATCH(ptl, ptl);
> > +#undef TABLE_MATCH
> > +static_assert(sizeof(struct ptdesc) <=3D sizeof(struct page));
> > +
> >  /*
> >   * No-op macros that just return the current protection value. Defined=
 here
> >   * because these macros can be used even if CONFIG_MMU is not defined.
> > --
> > 2.40.1
