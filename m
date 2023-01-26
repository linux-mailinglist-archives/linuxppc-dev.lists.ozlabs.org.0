Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2642067D10F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:12:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2m270Grwz3fG5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=F4aRNUuV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=F4aRNUuV;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2m196f8Zz2yyh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:11:41 +1100 (AEDT)
Received: by mail-yb1-xb30.google.com with SMTP id b1so2527163ybn.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jan 2023 08:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=avupiuDAbLM3PyQGhRhg5PpJotruwpJ0ItNruSnPDto=;
        b=F4aRNUuVVxsDBeXKsHm0/n4bD8ec/RvsWf4QHiaPtWESGWCVcLcyLKe9Jd548b052h
         QcT6RtpE5UZKWO+YM6n5OvW4ARJ407Bh/66B49pzxrLWo0wLTwvYXksgxlAxJP0ioT2A
         Ualx0U2WcTfPugYJrqjVJj1hLBW/6lt2d5fTsCBLTpqMFd3n42vfTrLpt86ugZXy5nJt
         QY7vUCD1iSwt54l8qO7z+mpREsvijxTv+UkGBr5zHsEg/ZvnO6ENLfsmCjldantrjHKi
         izJKDDdVWgISSoDXUQEPobl6q3z+Qvi6Jzv0Ef01T3mTiN/xvpQhZNzm1GdzaOYEsUKe
         IgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=avupiuDAbLM3PyQGhRhg5PpJotruwpJ0ItNruSnPDto=;
        b=B8zyPox5L+YcFYu0c68SYhXUYZH6q4NeKTDdaMxhyf0e9htoI6N0fCWBFCPM62SMQM
         rxQO6fPJyVdZlNn4fokmvnd4wf5i0/U7D2l5L6YknCCTn9dQCyn+Mrk8Se6rsvcEZVs0
         zug80MUkzV0G9VO7MfA2N8CgGfWE3hy4NtdN8HHkVC3sj1yocjBJQBiyaslKJgpqcgdF
         bOzPaGf3OxZ2drNDu3MLZHCAc7icdO6gJrsUG97a2sIvct+HVKJH3CDDlEJLbpUpKZx8
         NNRmsT+vOCl2Xqo9AkEVobYePm1D5Wxr3R+A3YjtHe2L/kMPFJ+UpVL4FZisNLXqgzib
         OK5g==
X-Gm-Message-State: AO0yUKV57t4fTlzWoiGWazej3CKwogsrARNocZYCzxdyosfizY+huMxU
	T5lcNJrPUgOLBRw8zlTsRx+sXZtGUzsH4XborzMoVA==
X-Google-Smtp-Source: AK7set9JejgaDEq/8tf/XX17cO+V0P18PwdgAGce26N1rqJGw+gXM9FumIvm5V3c8mJiZHRvPDjFNqGKBCO61IcUfSw=
X-Received: by 2002:a25:ad02:0:b0:80b:6fd3:84d3 with SMTP id
 y2-20020a25ad02000000b0080b6fd384d3mr1139572ybi.316.1674749499156; Thu, 26
 Jan 2023 08:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20230125233554.153109-1-surenb@google.com> <20230125233554.153109-6-surenb@google.com>
 <20230126151923.4fu34ytwkpbbnvha@techsingularity.net>
In-Reply-To: <20230126151923.4fu34ytwkpbbnvha@techsingularity.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Jan 2023 08:11:28 -0800
Message-ID: <CAJuCfpGyrxVJf1tuU=YUsjdhfPbPK4Bk4KmTO9OVRKfF-_XeEA@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] mm: replace vma->vm_flags indirect modification in ksm_madvise
To: Mel Gorman <mgorman@techsingularity.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 7:19 AM Mel Gorman <mgorman@techsingularity.net> wrote:
>
> On Wed, Jan 25, 2023 at 03:35:52PM -0800, Suren Baghdasaryan wrote:
> > Replace indirect modifications to vma->vm_flags with calls to modifier
> > functions to be able to track flag changes and to keep vma locking
> > correctness.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Acked-by: Michal Hocko <mhocko@suse.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv_uvmem.c | 5 ++++-
> >  arch/s390/mm/gmap.c                | 5 ++++-
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > index 1d67baa5557a..325a7a47d348 100644
> > --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> > +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> > @@ -393,6 +393,7 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
> >  {
> >       unsigned long gfn = memslot->base_gfn;
> >       unsigned long end, start = gfn_to_hva(kvm, gfn);
> > +     unsigned long vm_flags;
> >       int ret = 0;
> >       struct vm_area_struct *vma;
> >       int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
> > @@ -409,12 +410,14 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
> >                       ret = H_STATE;
> >                       break;
> >               }
> > +             vm_flags = vma->vm_flags;
> >               ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > -                       merge_flag, &vma->vm_flags);
> > +                       merge_flag, &vm_flags);
> >               if (ret) {
> >                       ret = H_STATE;
> >                       break;
> >               }
> > +             reset_vm_flags(vma, vm_flags);
> >               start = vma->vm_end;
> >       } while (end > vma->vm_end);
>
> Add a comment on why the vm_flags are copied in case someone "optimises"
> this in the future? Something like
>
> /* Copy vm_flags to avoid any partial modifications in ksm_madvise. */

Ack.

>
> >
> > diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
> > index 3a695b8a1e3c..d5eb47dcdacb 100644
> > --- a/arch/s390/mm/gmap.c
> > +++ b/arch/s390/mm/gmap.c
> > @@ -2587,14 +2587,17 @@ int gmap_mark_unmergeable(void)
> >  {
> >       struct mm_struct *mm = current->mm;
> >       struct vm_area_struct *vma;
> > +     unsigned long vm_flags;
> >       int ret;
> >       VMA_ITERATOR(vmi, mm, 0);
> >
> >       for_each_vma(vmi, vma) {
> > +             vm_flags = vma->vm_flags;
> >               ret = ksm_madvise(vma, vma->vm_start, vma->vm_end,
> > -                               MADV_UNMERGEABLE, &vma->vm_flags);
> > +                               MADV_UNMERGEABLE, &vm_flags);
> >               if (ret)
> >                       return ret;
> > +             reset_vm_flags(vma, vm_flags);
>
> Same.
>
> Not necessary as such as there are few users of ksm_madvise and I doubt
> it'll introduce new surprises.
>
> With or without the comment;
>
> Acked-by: Mel Gorman <mgorman@techsingularity.net>

Thanks!

>
> --
> Mel Gorman
> SUSE Labs
