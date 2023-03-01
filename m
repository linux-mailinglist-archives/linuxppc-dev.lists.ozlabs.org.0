Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A5B6A7383
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 19:35:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRjbr5y4qz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 05:35:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sMqxKmMP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=sMqxKmMP;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRjZw4zWtz2yfq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 05:35:03 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id y144so1304864yby.12
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Mar 2023 10:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677695700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sf6UrJ/lIWn1fjlxCohn27ZSd8Q0TfJriVXXcU5qWAE=;
        b=sMqxKmMPWADCyZTd0B+sCUFvSsU0xwpbUR9hz5KDANoBtXhUgELy2PB9S6CmdcPdLB
         9DuY263Lca20XWKvkKm/VeE8UXAxbFZ7UbMDjj/GdF33ace4U+qR3SuprdJIyGlg0kh4
         8ZY6tqKyRCrC4qSvVBH79BPeROQDCdXsUZHeJsRV9J+lzs8QF19Sft8unbL3LhV+NyMQ
         rULPzaHubsvYpBIvwRVqUZqOtQrYMTbpInxvEOTwI44gseylO/JwJ1XsAHZVMuGFZ8ce
         lLm3lv4Ir2Kuf2SdE943w0lXUD4jHslpCCCCxHMHmN15vxuLPQ0RJvPoRPshybRhAX6v
         429Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677695700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sf6UrJ/lIWn1fjlxCohn27ZSd8Q0TfJriVXXcU5qWAE=;
        b=P8E29iedMFlAuakAyS72/axbr4Bn5JPGTpv9YlplDH60o7gusQZKwx3eCZWRVmdgBb
         i+vZDBoznEXdmvpxDe8Jl7PKNJsfw0enTbvc6JoclS57Vw2v/gOcswW5GnjAOzxvRTQu
         b6LvhZXJ0CyS3PnPIPXgkkQVFT80dx8fbfppS62F1LthI9/ZTFS2kGJJIQ5Axd8lxwUU
         oUlbBwYbIDd1SLglTKPlrOsppxYHPW41SFXANHALKIhQxliz12KgZW+vJjr5xiNgHXKx
         eFDOQCOEP+EYOIG+MNzWbR4ExvNr1NF78KswQMVmt4dT7awMTZ0CwPNwxfDPT1yUQSnL
         klDg==
X-Gm-Message-State: AO0yUKXTA+HckH1oBCjqaSqhFZ9ZzvuehCDFRxaYTwzXbmxsZdM2l629
	abKlMIoGafdoUhV+ZL6X9b6wpIiJkUPg/ioB5kLX9A==
X-Google-Smtp-Source: AK7set/vwIRLhIQIPE3GkkxKkfmhP1CRU34HRxLzx1/Rma4BTfbR6X5PIRaaOJxNUaM1YhGtm7HsF2b9hYcFbnNAeaU=
X-Received: by 2002:a25:9704:0:b0:a30:38fb:a2e4 with SMTP id
 d4-20020a259704000000b00a3038fba2e4mr3269439ybo.6.1677695699906; Wed, 01 Mar
 2023 10:34:59 -0800 (PST)
MIME-Version: 1.0
References: <20230227173632.3292573-1-surenb@google.com> <20230227173632.3292573-19-surenb@google.com>
 <Y/8CJQGNuMUTdLwP@localhost> <Y/8FNM9czzPHb5eG@localhost>
In-Reply-To: <Y/8FNM9czzPHb5eG@localhost>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 1 Mar 2023 10:34:48 -0800
Message-ID: <CAJuCfpHYT++MBC6T-p80n_m5hHWRRC4Y1bO9J-bFFZZDqNX-BQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/33] mm: write-lock VMAs before removing them from
 VMA tree
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 28, 2023 at 11:57=E2=80=AFPM Hyeonggon Yoo <42.hyeyoo@gmail.com=
> wrote:
>
> On Wed, Mar 01, 2023 at 07:43:33AM +0000, Hyeonggon Yoo wrote:
> > On Mon, Feb 27, 2023 at 09:36:17AM -0800, Suren Baghdasaryan wrote:
> > > Write-locking VMAs before isolating them ensures that page fault
> > > handlers don't operate on isolated VMAs.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  mm/mmap.c  | 1 +
> > >  mm/nommu.c | 5 +++++
> > >  2 files changed, 6 insertions(+)
> > >
> > > diff --git a/mm/mmap.c b/mm/mmap.c
> > > index 1f42b9a52b9b..f7ed357056c4 100644
> > > --- a/mm/mmap.c
> > > +++ b/mm/mmap.c
> > > @@ -2255,6 +2255,7 @@ int split_vma(struct vma_iterator *vmi, struct =
vm_area_struct *vma,
> > >  static inline int munmap_sidetree(struct vm_area_struct *vma,
> > >                                struct ma_state *mas_detach)
> > >  {
> > > +   vma_start_write(vma);
> > >     mas_set_range(mas_detach, vma->vm_start, vma->vm_end - 1);
> >
> > I may be missing something, but have few questions:
> >
> >       1) Why does a writer need to both write-lock a VMA and mark the V=
MA detached
> >          when unmapping it, isn't it enough to just only write-lock a V=
MA?

We need to mark the VMA detached to avoid handling page fault in a
detached VMA. The possible scenario is:

lock_vma_under_rcu
  vma =3D mas_walk(&mas)
                                                        munmap_sidetree
                                                          vma_start_write(v=
ma)

mas_store_gfp() // remove VMA from the tree
                                                          vma_end_write_all=
()
  vma_start_read(vma)
  // we locked the VMA but it is not part of the tree anymore.

So, marking the VMA locked before vma_end_write_all() and checking
vma->detached after vma_start_read() helps us avoid handling faults in
the detached VMA.


> >
> >       2) as VMAs that are going to be removed are already locked in vma=
_prepare(),
> >          so I think this hunk could be dropped?
>
> After sending this just realized that I did not consider simple munmap ca=
se :)
> But I still think 1) and 3) are valid question.
>
> >
> > >     if (mas_store_gfp(mas_detach, vma, GFP_KERNEL))
> > >             return -ENOMEM;
> > > diff --git a/mm/nommu.c b/mm/nommu.c
> > > index 57ba243c6a37..2ab162d773e2 100644
> > > --- a/mm/nommu.c
> > > +++ b/mm/nommu.c
> > > @@ -588,6 +588,7 @@ static int delete_vma_from_mm(struct vm_area_stru=
ct *vma)
> > >                    current->pid);
> > >             return -ENOMEM;
> > >     }
> > > +   vma_start_write(vma);
> > >     cleanup_vma_from_mm(vma);
> >
> >       3) I think this hunk could be dropped as Per-VMA lock depends on =
MMU anyway.

Ah, yes, you are right. We can safely remove the changes in nommu.c
Andrew, should I post a fixup or you can make the removal directly in
mm-unstable?
Thanks,
Suren.

> >
> > Thanks,
> > Hyeonggon
> >
> > >
> > >     /* remove from the MM's tree and list */
> > > @@ -1519,6 +1520,10 @@ void exit_mmap(struct mm_struct *mm)
> > >      */
> > >     mmap_write_lock(mm);
> > >     for_each_vma(vmi, vma) {
> > > +           /*
> > > +            * No need to lock VMA because this is the only mm user a=
nd no
> > > +            * page fault handled can race with it.
> > > +            */
> > >             cleanup_vma_from_mm(vma);
> > >             delete_vma(mm, vma);
> > >             cond_resched();
> > > --
> > > 2.39.2.722.g9855ee24e9-goog
> > >
> > >
> >
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
