Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9AAB7377E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 01:11:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Srt/QiH6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qm2SZ5fzNz30dx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jun 2023 09:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Srt/QiH6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qm2Rd2VYSz30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jun 2023 09:10:35 +1000 (AEST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-57023c9be80so54758637b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 16:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687302633; x=1689894633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nozU+u202dwuRZdJGKz18i7nEQxa/ZPqnuIXPcARxTk=;
        b=Srt/QiH6vSlV6ltPf9H8KdAeCpbz7L591o99Craxfn8w/jM66I5hACYYF7kGTNoYRf
         37MNDI/F8R1g44q3mAPdvv0ch2USGp6Xr2QpXeRs4zwys088B20V4rigZMbQAUtCAcnv
         ujlqxNx2s65vbfsZd3k+2DjIHKhHJIWAfpgn7QYgmI+NGmP+FiWPPp675PKwGH44ORfj
         zOUT1l13zV/ZQbeHYvFRsincMrSLLgcM09n9imSEGZWNpBzKYFGwq1+DONOYFih8u36L
         jrVhBZXiCnjwgLIXcNbQ+C7KfkKQcJy9rAKazTyykVFlz02AVb/RzeIKJrXQdve86D2m
         bp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687302633; x=1689894633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nozU+u202dwuRZdJGKz18i7nEQxa/ZPqnuIXPcARxTk=;
        b=isa/D9y7Xaa4rA8gm7anOqHYU7md0z9bIQaZK80hjPlw8aFkOxWd6RkAr/q44CjM0a
         VSPsVwjF5gZII0z4WLiNc9I8EdP+DDd90xHZVOpOnUH9buDzTs0owzqJCZ4kAXDdx0l2
         dGGu0TW2FAiuiwW0uwa86zdl8YJ7LMeEwfUlHhm0y7rMO2VAp3qcfJqfcQjrRpnD3IIP
         XB3EQZJ85Snc02ZSh/AiJdZzx+LVN9fHa2SaPPQ6PGt/RSoh1ik8va1oM0Odym7WjAdf
         E9hgMCxZsjiEosZwTJHw0FYHPKGFUXeyvmGgfaURLtwdAtiVJPWlSB2Kr/ixJMkWveQ6
         34Bw==
X-Gm-Message-State: AC+VfDxbeeoIUlwt43kGV1sfDfV4hQAlr3yUYQhE7SVGv+kktl8JszKV
	DFCgEYVLysfXFLVbw7KSj6OmceKFXnJNY6QssE0=
X-Google-Smtp-Source: ACHHUZ7+vWx7il1X3ew5mkzUq07+yx6XfH7tiB7mbTeTUr9bW7PRwJQYCTYOe/jG083Yaru2U6b3dhZd45Wu7Dtq2+o=
X-Received: by 2002:a0d:dfcb:0:b0:570:89bf:6f10 with SMTP id
 i194-20020a0ddfcb000000b0057089bf6f10mr9653803ywe.25.1687302632746; Tue, 20
 Jun 2023 16:10:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230612210423.18611-1-vishal.moola@gmail.com>
 <20230612210423.18611-5-vishal.moola@gmail.com> <ZIxXw9ERkYv+ipdd@nvidia.com>
 <CAOzc2pwMW64O0m4Zu4zVFTY+qCJRK7V+7niN_t1m7pLaJrtb2A@mail.gmail.com> <ZJIwpO68kc3zMB/c@nvidia.com>
In-Reply-To: <ZJIwpO68kc3zMB/c@nvidia.com>
From: Vishal Moola <vishal.moola@gmail.com>
Date: Tue, 20 Jun 2023 16:10:22 -0700
Message-ID: <CAOzc2pwNc-9bRbAV8=_yROU5uq96q6v-dEfcYuzJyDrRygNsbA@mail.gmail.com>
Subject: Re: [PATCH v4 04/34] pgtable: Create struct ptdesc
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 20, 2023 at 4:05=E2=80=AFPM Jason Gunthorpe <jgg@nvidia.com> wr=
ote:
>
> On Tue, Jun 20, 2023 at 01:01:39PM -0700, Vishal Moola wrote:
> > On Fri, Jun 16, 2023 at 5:38=E2=80=AFAM Jason Gunthorpe <jgg@nvidia.com=
> wrote:
> > >
> > > On Mon, Jun 12, 2023 at 02:03:53PM -0700, Vishal Moola (Oracle) wrote=
:
> > > > Currently, page table information is stored within struct page. As =
part
> > > > of simplifying struct page, create struct ptdesc for page table
> > > > information.
> > > >
> > > > Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> > > > ---
> > > >  include/linux/pgtable.h | 51 +++++++++++++++++++++++++++++++++++++=
++++
> > > >  1 file changed, 51 insertions(+)
> > > >
> > > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > > index c5a51481bbb9..330de96ebfd6 100644
> > > > --- a/include/linux/pgtable.h
> > > > +++ b/include/linux/pgtable.h
> > > > @@ -975,6 +975,57 @@ static inline void ptep_modify_prot_commit(str=
uct vm_area_struct *vma,
> > > >  #endif /* __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION */
> > > >  #endif /* CONFIG_MMU */
> > > >
> > > > +
> > > > +/**
> > > > + * struct ptdesc - Memory descriptor for page tables.
> > > > + * @__page_flags: Same as page flags. Unused for page tables.
> > > > + * @pt_list: List of used page tables. Used for s390 and x86.
> > > > + * @_pt_pad_1: Padding that aliases with page's compound head.
> > > > + * @pmd_huge_pte: Protected by ptdesc->ptl, used for THPs.
> > > > + * @_pt_s390_gaddr: Aliases with page's mapping. Used for s390 gma=
p only.
> > > > + * @pt_mm: Used for x86 pgds.
> > > > + * @pt_frag_refcount: For fragmented page table tracking. Powerpc =
and s390 only.
> > > > + * @ptl: Lock for the page table.
> > > > + *
> > > > + * This struct overlays struct page for now. Do not modify without=
 a good
> > > > + * understanding of the issues.
> > > > + */
> > > > +struct ptdesc {
> > > > +     unsigned long __page_flags;
> > > > +
> > > > +     union {
> > > > +             struct list_head pt_list;
> > > > +             struct {
> > > > +                     unsigned long _pt_pad_1;
> > > > +                     pgtable_t pmd_huge_pte;
> > > > +             };
> > > > +     };
> > > > +     unsigned long _pt_s390_gaddr;
> > > > +
> > > > +     union {
> > > > +             struct mm_struct *pt_mm;
> > > > +             atomic_t pt_frag_refcount;
> > > > +     };
> > > > +
> > > > +#if ALLOC_SPLIT_PTLOCKS
> > > > +     spinlock_t *ptl;
> > > > +#else
> > > > +     spinlock_t ptl;
> > > > +#endif
> > > > +};
> > >
> > > I think you should include the memcg here too? It needs to be valid
> > > for a ptdesc, even if we don't currently deref it through the ptdesc
> > > type.
> >
> > Yes, thanks for catching that! I'll add it to v5.
> >
> > > Also, do you see a way to someday put a 'struct rcu_head' into here?
> >
> > Eventually, when they're being dynamically allocated independent of
> > struct page. Although at that point I'm not sure if we'll need one.
>
> Sooner than dynamic struct page?
>
> Probably it can overlap pt_list in alot of arches?

Ah yes, there will be one if v5 overlapping with pt_list
(it already does in struct page anyways).
