Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A223D6A4818
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 18:34:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQSLL3y6Rz3c6P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 04:34:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EmYlVn1x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EmYlVn1x;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQSKR6pxdz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 04:34:02 +1100 (AEDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-53852143afcso197355667b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Feb 2023 09:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=clSo+ynhBcgd5P9oqBCplVUWaCRz+bAuQWNUwRUeW4A=;
        b=EmYlVn1xvrcf7zrr5iy4RTNshyBLoKiKAZKUtboCL/A941OU+Fr6WmnHBG9wnH64cw
         hNBCUpkYIEcf4MNUBwUoZw0b2MIu6JUMAPcHXGaKgsYyJuQR6NlXSN9FkPIWduRVuC9V
         zsAjMHnyTstST8ItvKvXKtLK5ei8ulndGMVe0+lik/LE5VQmzs18Dkzt2+uqlYlWoF0g
         psRsRKJvyAca+Xc0847actyvz2EtyQPXcEgyqcP0hlcvy2m+GgqNR1i9NYntIpolO9lz
         e9Ky8rIShfMPGeWPHTJ8yH6QdzBXma6FLbEfF1Vpmh0GBu/TSSr5BSTiSYHZBuSNVK/I
         RqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clSo+ynhBcgd5P9oqBCplVUWaCRz+bAuQWNUwRUeW4A=;
        b=kTOvO5NnH8U3RIFP+0hQ7qPgrfxPWKh+Bucg0DIV93CPXEVFyi1PCTyRZh8uk7AhWf
         w3OtL8taQ8yPMX+RmkjWIx+v6IBC2dNQkr/yNamrPgih+ZO+7aHvYIDMXAfiXV7Zhdb3
         yDxKU1bgrn0Zs++4V6zn0zBlcAzvzhYgTb0WXyVlNqsqzNbNio5vzFubHwdhZHzB4sie
         JgVgJljYM7lZyeH03TQA7is+IGTmWcn3CkbXoYlakq8K05hb3/QwKEQNGcNKX5RWwMkW
         OiS7PFc+lL3ZjU2vvXIaV2YHrwM9ySi86Hux3whMBEvd6uHAvXNwhjUbNBW4I5jkfP5R
         fTQA==
X-Gm-Message-State: AO0yUKW6Xzorn67VcT4xf50/wrmPCJfkEnT7xebBHJ6yT/UwPcC9lJ0J
	7uXUwVbxahQGKSEUMujWWBEWe0+lflNSR0PNf/9oag==
X-Google-Smtp-Source: AK7set850RJ3FwfeF2E4weG1y1xeomWWv7+ssvA8wEpEPU3XPf/dB2vZaBErWfbEaagv9IhdIaDDiNfth2tpmFqVxEs=
X-Received: by 2002:a81:ae01:0:b0:533:9c5b:7278 with SMTP id
 m1-20020a81ae01000000b005339c5b7278mr10669499ywh.0.1677519240376; Mon, 27 Feb
 2023 09:34:00 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-18-surenb@google.com>
 <20230223202011.dahh6cidqxhzoxne@revolver> <20230223202844.noant5suylne3dnh@revolver>
 <CAJuCfpE3YtSQuXJwOYWKe1z9O4GASS9pA_FTWGkdveHb3bcMXA@mail.gmail.com>
 <20230224014624.gnirnx625ylhoevb@revolver> <CAJuCfpG4JOv4aeJ6KJDi7R649vuhc0h75230ZRJgUg8spqti8w@mail.gmail.com>
 <20230224161402.o7phj2crnt2xg4nl@revolver> <CAJuCfpFdvNZ-O7ku7ivUz=iuHLzypVCvseU58D=fVFoSyPFCeA@mail.gmail.com>
In-Reply-To: <CAJuCfpFdvNZ-O7ku7ivUz=iuHLzypVCvseU58D=fVFoSyPFCeA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 27 Feb 2023 09:33:49 -0800
Message-ID: <CAJuCfpEgagE7CJx5m3w_3rjpcZAvQtqO6bYMQnaqj1DN+Nx5OQ@mail.gmail.com>
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

On Fri, Feb 24, 2023 at 8:19 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Fri, Feb 24, 2023 at 8:14 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> >
> > * Suren Baghdasaryan <surenb@google.com> [230223 21:06]:
> > > On Thu, Feb 23, 2023 at 5:46 PM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
> > > >
> > > > * Suren Baghdasaryan <surenb@google.com> [230223 16:16]:
> > > > > On Thu, Feb 23, 2023 at 12:28 PM Liam R. Howlett
> > > > > <Liam.Howlett@oracle.com> wrote:
> > > > > >
> > > > > >
> > > > > > Wait, I figured a better place to do this.
> > > > > >
> > > > > > init_multi_vma_prep() should vma_start_write() on any VMA that is passed
> > > > > > in.. that we we catch any modifications here & in vma_merge(), which I
> > > > > > think is missed in this patch set?
> > > > >
> > > > > Hmm. That looks like a good idea but in that case, why not do the
> > > > > locking inside vma_prepare() itself? From the description of that
> > > > > function it sounds like it was designed to acquire locks before VMA
> > > > > modifications, so would be the ideal location for doing that. WDYT?
> > > >
> > > > That might be even better.  I think it will result in even less code.
> > >
> > > Yes.
> > >
> > > >
> > > > There is also a vma_complete() which might work to call
> > > > vma_end_write_all() as well?
> > >
> > > If there are other VMAs already locked before vma_prepare() then we
> > > would unlock them too. Safer to just let mmap_unlock do
> > > vma_end_write_all().
> > >
> > > >
> > > > > The only concern is vma_adjust_trans_huge() being called before
> > > > > vma_prepare() but I *think* that's safe because
> > > > > vma_adjust_trans_huge() does its modifications after acquiring PTL
> > > > > lock, which page fault handlers also have to take. Does that sound
> > > > > right?
> > > >
> > > > I am not sure.  We are certainly safe the way it is, and the PTL has to
> > > > be safe for concurrent faults.. but this could alter the walk to a page
> > > > table while that walk is occurring and I don't think that happens today.
> > > >
> > > > It might be best to leave the locking order the way you have it, unless
> > > > someone can tell us it's safe?
> > >
> > > Yes, I have the same feelings about changing this.
> > >
> > > >
> > > > We could pass through the three extra variables that are needed to move
> > > > the vma_adjust_trans_huge() call within that function as well?  This
> > > > would have the added benefit of having all locking grouped in the one
> > > > location, but the argument list would be getting long, however we could
> > > > use the struct.
> > >
> > > Any issues if I change the order to have vma_prepare() called always
> > > before vma_adjust_trans_huge()? That way the VMA will always be locked
> > > before vma_adjust_trans_huge() executes and we don't need any
> > > additional arguments.
> >
> > I preserved the locking order from __vma_adjust() to ensure there was no
> > issues.
> >
> > I am not sure but, looking through the page table information [1], it
> > seems that vma_adjust_trans_huge() uses the pmd lock, which is part of
> > the split page table lock.  According to the comment in rmap, it should
> > be fine to reverse the ordering here.
> >
> > Instead of:
> >
> > mmap_lock()
> > vma_adjust_trans_huge()
> >         pte_lock
> >         pte_unlock
> >
> > vma_prepare()
> >         mapping->i_mmap_rwsem lock
> >         anon_vma->rwsem lock
> >
> > <changes to tree/VMAs>
> >
> > vma_complete()
> >         anon_vma->rwsem unlock
> >         mapping->i_mmap_rwsem unlock
> >
> > mmap_unlock()
> >
> > ---------
> >
> > We would have:
> >
> > mmap_lock()
> > vma_prepare()
> >         mapping->i_mmap_rwsem lock
> >         anon_vma->rwsem lock
> >
> > vma_adjust_trans_huge()
> >         pte_lock
> >         pte_unlock
> >
> > <changes to tree/VMAs>
> >
> > vma_complete()
> >         anon_vma->rwsem unlock
> >         mapping->i_mmap_rwsem unlock
> >
> > mmap_unlock()
> >
> >
> > Essentially, increasing the nesting of the pte lock, but not violating
> > the ordering.
> >
> > 1. https://docs.kernel.org/mm/split_page_table_lock.html
>
> Thanks for the confirmation, Liam. I'll make the changes and test over
> the weekend. If everything's still fine, I will post the next version
> with these and other requested changes on Monday.

Weekend testing results look good with all the changes. I'll post v4 shortly.
Thanks,
Suren.

>
> >
> > >
> > > >
> > > > remove & remove2 should be be detached in vma_prepare() or
> > > > vma_complete() as well?
> > >
> > > They are marked detached in vma_complete() (see
> > > https://lore.kernel.org/all/20230216051750.3125598-25-surenb@google.com/)
> > > and that should be enough. We should be safe as long as we mark them
> > > detached before unlocking the VMA.
> > >
> >
> > Right, Thanks.
> >
> > ...
> >
> > --
> > To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> >
