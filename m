Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8EB1699D0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 20:37:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHlb05fLFz3ch6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 06:37:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ofef3CWO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=ofef3CWO;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHlZ20CfYz3cf8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 06:36:40 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id g2so3437607ybk.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7kPbmP0HEcZpXUsWhibQteNAlMcCYqcrNbxA2g4JE/A=;
        b=ofef3CWOUeTxZZ+PIIwVk8SzvwcsVuW68YnGdTw0sJZfvvLZRwG1rTv+k9fTx+zmY0
         PE+VFGCtwaQeHc/Q7XMRjsyKtq5v6pfu2ev2sPQMb6UhIu61GUINkjK2pMfPtzeCkg5o
         6Gjn60EBkfD/UVWNXjrWJZQIdGTPM/jNXjLbXL+SInNkzvFVogdETkZAoteauf6LPlI8
         AgbAdlE0fAYulqZ1ET3yXlivnH8nosnvGQm5O+vqx8fc5mJNQMBxl19NpaII9TKyV+Lb
         0ghtuwgUVAq0SlQaFPa0ikdsi4vcic/WEKbLdudqbreIUAad8DgTKMEozeVtakIWzbDz
         Eq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kPbmP0HEcZpXUsWhibQteNAlMcCYqcrNbxA2g4JE/A=;
        b=OiHkISnt10/WcrKdUSSCZzoj2D4Euoih0UyrNSIac+4GhJXmKQd33Nu/EDfy6we+0v
         MPtBUBj3f7d6IycuTejwHuZDvJeJxHf+IOoyi2YcncKsOm9HlG2AjdkNtGp+Uyw5bgH1
         /Jre4OWWX7hUUSIDITxpF84iq8YjlaeXr2BEvXKOE/XrXEVZUxSukRgT4eTdbA7tJXr3
         S11uCMH+I/7GLNEHRWsr8Do5Q0FJfMmhHaqr4ykmqPasxsmS1K1nHOZWCOMwLcXoFsxy
         i1vEp0aZfcLfadFpECo+CR8iBAuMwF1aSxk+0bmf8wv0StV0S77Csxl31bNwocLUrmyG
         TLeA==
X-Gm-Message-State: AO0yUKXQcKNJG8Xrg/UAw/ye3ImQPEufitc2nvXJpsd6nj/KquHtajMz
	krmed/XSqh1lMeAyw//OiB5w6e8NC5RJpYwOvtWA3g==
X-Google-Smtp-Source: AK7set+RMcw3ZcSV3HGm+iFjEGJ0Lev4v85qKlq2LIi8Vsi9NpR/fhxseBWzeKpPsLOx+aOI+tOgrQwVizPu7Xy8HOQ=
X-Received: by 2002:a25:9941:0:b0:90c:de27:7f15 with SMTP id
 n1-20020a259941000000b0090cde277f15mr873659ybo.428.1676576195831; Thu, 16 Feb
 2023 11:36:35 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-22-surenb@google.com>
 <20230216153405.zo4l2lqpnc2agdzg@revolver>
In-Reply-To: <20230216153405.zo4l2lqpnc2agdzg@revolver>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 16 Feb 2023 11:36:24 -0800
Message-ID: <CAJuCfpEkujbHNxNWcWr8bmrsMhXGcpDyraOfQaPAcOH=RQPv5A@mail.gmail.com>
Subject: Re: [PATCH v3 21/35] mm/mmap: write-lock adjacent VMAs if they can
 grow into unmapped area
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

On Thu, Feb 16, 2023 at 7:34 AM Liam R. Howlett <Liam.Howlett@oracle.com> wrote:
>
>
> First, sorry I didn't see this before v3..

Feedback at any time is highly appreciated!

>
> * Suren Baghdasaryan <surenb@google.com> [230216 00:18]:
> > While unmapping VMAs, adjacent VMAs might be able to grow into the area
> > being unmapped. In such cases write-lock adjacent VMAs to prevent this
> > growth.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 118b2246bba9..00f8c5798936 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -2399,11 +2399,13 @@ do_vmi_align_munmap(struct vma_iterator *vmi, struct vm_area_struct *vma,
> >        * down_read(mmap_lock) and collide with the VMA we are about to unmap.
> >        */
> >       if (downgrade) {
> > -             if (next && (next->vm_flags & VM_GROWSDOWN))
> > +             if (next && (next->vm_flags & VM_GROWSDOWN)) {
> > +                     vma_start_write(next);
> >                       downgrade = false;
>
> If the mmap write lock is insufficient to protect us from next/prev
> modifications then we need to move *most* of this block above the maple
> tree write operation, otherwise we have a race here.  When I say most, I
> mean everything besides the call to mmap_write_downgrade() needs to be
> moved.

Which prior maple tree write operation are you referring to? I see
__split_vma() and munmap_sidetree() which both already lock the VMAs
they operate on, so page faults can't happen in those VMAs.

>
> If the mmap write lock is sufficient to protect us from next/prev
> modifications then we don't need to write lock the vmas themselves.

mmap write lock is not sufficient because with per-VMA locks we do not
take mmap lock at all.

>
> I believe this is for expand_stack() protection, so I believe it's okay
> to not vma write lock these vmas.. I don't think there are other areas
> where we can modify the vmas without holding the mmap lock, but others
> on the CC list please chime in if I've forgotten something.
>
> So, if I am correct, then you shouldn't lock next/prev and allow the
> vma locking fault method on these vmas.  This will work because
> lock_vma_under_rcu() uses mas_walk() on the faulting address.  That is,
> your lock_vma_under_rcu() will fail to find anything that needs to be
> grown and go back to mmap lock protection.  As it is written today, the
> vma locking fault handler will fail and we will wait for the mmap lock
> to be released even when the vma isn't going to expand.

So, let's consider a case when the next VMA is not being removed (so
it was neither removed nor locked by munmap_sidetree()) and it is
found by lock_vma_under_rcu() in the page fault handling path. Page
fault handler can now expand it and push into the area we are
unmapping in unmap_region(). That is the race I'm trying to prevent
here by locking the next/prev VMAs which can be expanded before
unmap_region() unmaps them. Am I missing something?

>
>
> > -             else if (prev && (prev->vm_flags & VM_GROWSUP))
> > +             } else if (prev && (prev->vm_flags & VM_GROWSUP)) {
> > +                     vma_start_write(prev);
> >                       downgrade = false;
> > -             else
> > +             } else
> >                       mmap_write_downgrade(mm);
> >       }
> >
> > --
> > 2.39.1
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
