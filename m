Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7F6A14C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 03:07:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PNCvf3hsvz3cjP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 13:07:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rwzlWHlQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=rwzlWHlQ;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PNCtd3BWdz3cXX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 13:06:32 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536e10ae021so201332997b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 18:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7HOzF5+96t9CG2+VEDPfL5tgNhMKk1YUB8OqcQPJdHg=;
        b=rwzlWHlQupd34iw5jxBSHbAyTITecGBAwbDOwR8sal5zUrDwpScWQdPtFFN/gCneoM
         /Va8NvCFYP2JYbQAbwaFMwhX2Wx9TgYp8Ymv2JqxMA9QSWX/TbVIuwBuwlFixgDJ4klb
         Klrhh1pl1XD657QXd1UxEWdvo7ZnF/nOdF429eLdPsntmWqtHxBK2v8VhOgIAs9HSbOx
         Z2yJ0Nb1PBDqsZg7A+PtC/aoMgiOQKSsgP5dqvqXan9LicHBUtbinwqAVmY+RpuUA8I1
         k5LAzK4Rvx6dfAyLYMjxLep+JF0xlJJXbwKh0xbZJvs0oEmoTSTdg7Wyxrwyn+yFuzmH
         uuag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7HOzF5+96t9CG2+VEDPfL5tgNhMKk1YUB8OqcQPJdHg=;
        b=5nlZHKHEdH7UEvMaNI8ZbPz3pTvFYcWJAtzJvnY1j2DHk+xU+syvpUk2CgWr2B83E9
         N+ZUNrGMjFNkGQdX7jbG+lXjEO0033zivvsynXetko1X9Y0zMP5Lo0Libtvcy34p+ZMi
         gETRNBNw9YR/m/11jwEVxh1ddY8jIDQ+cAIfRfhAShrOiNTsgbQ3P90WIIKSVek1OUii
         bQKXBwsPnnw/EAl6apSsz15OD0dupYmWi4aIVYqK0rHt1HZplOg7CcidvDZNs4qGcarH
         +GhnhX7qWQvMJ4iyqJmiJ7TRt4O6gHEDqtGkD7WktMZ8BIhgdnulaQQciTNKL/pe+VQ2
         lduQ==
X-Gm-Message-State: AO0yUKVYfVwX8isvCvxUUwHgUBYRKvgqypEFAjPhGpkZA0jnMecY5/P+
	c0H8CAovBIv2FgEKmuDWsHQMhE+6ZPsiVXoCEmOrFg==
X-Google-Smtp-Source: AK7set8C9O8l9Jw6Ox58CJXZD5pj/I+KGStWdZtXnvUxFzpUjvoE9DptEBlowq7kWqvjxeQ9BdazE3XF6oVL/1YNDJg=
X-Received: by 2002:a81:4513:0:b0:534:2d49:790a with SMTP id
 s19-20020a814513000000b005342d49790amr3550041ywa.0.1677204389295; Thu, 23 Feb
 2023 18:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-18-surenb@google.com>
 <20230223202011.dahh6cidqxhzoxne@revolver> <20230223202844.noant5suylne3dnh@revolver>
 <CAJuCfpE3YtSQuXJwOYWKe1z9O4GASS9pA_FTWGkdveHb3bcMXA@mail.gmail.com> <20230224014624.gnirnx625ylhoevb@revolver>
In-Reply-To: <20230224014624.gnirnx625ylhoevb@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 23 Feb 2023 18:06:18 -0800
Message-ID: <CAJuCfpG4JOv4aeJ6KJDi7R649vuhc0h75230ZRJgUg8spqti8w@mail.gmail.com>
Subject: Re: [PATCH v3 17/35] mm/mmap: write-lock VMA before shrinking or
 expanding it
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	akpm@linux-foundation.org, michel@lespinasse.org, jglisse@google.com, 
	mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, dave@stgolabs.net, willy@infradead.org, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	mingo@redhat.com, will@kernel.org, luto@kernel.org, songliubraving@fb.com, 
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	chriscli@google.com, axelrasmussen@google.com, joelaf@google.com, 
	minchan@google.com, rppt@kernel.org, jannh@google.com, shakeelb@google.com, 
	tatashin@google.com, edumazet@google.com, gthelen@google.com, 
	gurua@google.com, arjunroy@google.com, soheil@google.com, leewalsh@google.com, 
	posk@google.com, michalechner92@googlemail.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	x86@kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 5:46 PM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
>
> * Suren Baghdasaryan <surenb@google.com> [230223 16:16]:
> > On Thu, Feb 23, 2023 at 12:28 PM Liam R. Howlett
> > <Liam.Howlett@oracle.com> wrote:
> > >
> > >
> > > Wait, I figured a better place to do this.
> > >
> > > init_multi_vma_prep() should vma_start_write() on any VMA that is passed
> > > in.. that we we catch any modifications here & in vma_merge(), which I
> > > think is missed in this patch set?
> >
> > Hmm. That looks like a good idea but in that case, why not do the
> > locking inside vma_prepare() itself? From the description of that
> > function it sounds like it was designed to acquire locks before VMA
> > modifications, so would be the ideal location for doing that. WDYT?
>
> That might be even better.  I think it will result in even less code.

Yes.

>
> There is also a vma_complete() which might work to call
> vma_end_write_all() as well?

If there are other VMAs already locked before vma_prepare() then we
would unlock them too. Safer to just let mmap_unlock do
vma_end_write_all().

>
> > The only concern is vma_adjust_trans_huge() being called before
> > vma_prepare() but I *think* that's safe because
> > vma_adjust_trans_huge() does its modifications after acquiring PTL
> > lock, which page fault handlers also have to take. Does that sound
> > right?
>
> I am not sure.  We are certainly safe the way it is, and the PTL has to
> be safe for concurrent faults.. but this could alter the walk to a page
> table while that walk is occurring and I don't think that happens today.
>
> It might be best to leave the locking order the way you have it, unless
> someone can tell us it's safe?

Yes, I have the same feelings about changing this.

>
> We could pass through the three extra variables that are needed to move
> the vma_adjust_trans_huge() call within that function as well?  This
> would have the added benefit of having all locking grouped in the one
> location, but the argument list would be getting long, however we could
> use the struct.

Any issues if I change the order to have vma_prepare() called always
before vma_adjust_trans_huge()? That way the VMA will always be locked
before vma_adjust_trans_huge() executes and we don't need any
additional arguments.

>
> remove & remove2 should be be detached in vma_prepare() or
> vma_complete() as well?

They are marked detached in vma_complete() (see
https://lore.kernel.org/all/20230216051750.3125598-25-surenb@google.com/)
and that should be enough. We should be safe as long as we mark them
detached before unlocking the VMA.

>
> >
> > >
> > >
> > > * Liam R. Howlett <Liam.Howlett@Oracle.com> [230223 15:20]:
> > > > Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
> > > >
> > > > * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > > > > vma_expand and vma_shrink change VMA boundaries. Expansion might also
> > > > > result in freeing of an adjacent VMA. Write-lock affected VMAs to prevent
> > > > > concurrent page faults.
> > > > >
> > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > ---
> > > > >  mm/mmap.c | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > > > index ec2f8d0af280..f079e5bbcd57 100644
> > > > > --- a/mm/mmap.c
> > > > > +++ b/mm/mmap.c
> > > > > @@ -674,6 +674,9 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > > >             ret = dup_anon_vma(vma, next);
> > > > >             if (ret)
> > > > >                     return ret;
> > > > > +
> > > > > +           /* Lock the VMA  before removing it */
> > > > > +           vma_start_write(next);
> > > > >     }
> > > > >
> > > > >     init_multi_vma_prep(&vp, vma, NULL, remove_next ? next : NULL, NULL);
> > > > > @@ -686,6 +689,7 @@ int vma_expand(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > > >     if (vma_iter_prealloc(vmi))
> > > > >             goto nomem;
> > > > >
> > > > > +   vma_start_write(vma);
> > > > >     vma_adjust_trans_huge(vma, start, end, 0);
> > > > >     /* VMA iterator points to previous, so set to start if necessary */
> > > > >     if (vma_iter_addr(vmi) != start)
> > > > > @@ -725,6 +729,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
> > > > >     if (vma_iter_prealloc(vmi))
> > > > >             return -ENOMEM;
> > > > >
> > > > > +   vma_start_write(vma);
> > > > >     init_vma_prep(&vp, vma);
> > > > >     vma_adjust_trans_huge(vma, start, end, 0);
> > > > >     vma_prepare(&vp);
> > > > > --
> > > > > 2.39.1
> > > > >
> > >
> > > --
> > > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> > >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
