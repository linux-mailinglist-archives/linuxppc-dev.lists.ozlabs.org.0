Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A11D672539
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 18:41:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxtNg1h4Mz3fBm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 04:41:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ka6nVunr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Ka6nVunr;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxtMm4FNjz3bPD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 04:40:52 +1100 (AEDT)
Received: by mail-yb1-xb35.google.com with SMTP id 188so39011326ybi.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 09:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O+c3praop+F4hgZx9fYsgBqwRZyACPImTP4EJ0i5h+4=;
        b=Ka6nVunrhz4AtVb4ez9bPbZMrA+BT0HLYjQWV2A83Am/7vZHMnwaJyxrzb3BG1Ge4V
         jClzWXorirsqV3khCBOP4ggO2Tn0WG07oU9lIclP9VHGeoB6qrpZtnGhe7bo/ttx6zDC
         TMjP/ThYyG7YcvLasV/vCtOVTAZsP1RDT6VNGtA88feNmFKy0+OV9yXL+HJ0AxWhqfSt
         pSmnW0q7C+E7rigeF6haineNjehNr7CNxIMAgv0g5lIonW0kqwLOFL/u5eriUgrmlkcF
         2HtNHfIc9raNIqPYMX6fhNH4Ttqpzmn1gyvx4VhRfWtC7xh2fn/uQa3Wc5QgHD/pyLWB
         Ygag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O+c3praop+F4hgZx9fYsgBqwRZyACPImTP4EJ0i5h+4=;
        b=dKmc5tKpVzkzgo7efBl813faT9YAnHyro+p2YhchANYqbamHaW1trCuGMJOB3svP+B
         /pPPyBwn1rsK4aK1hgRSxRSWJ/AB5Z77/Kna0c/s1PGZiivzeajGhTsy9oUU3oDB6tuk
         J0aHJmDpyaPW7rsL5CqbGvK9KPHX9Asx5iXht2wGZRPJfrnt+O+HzbJrjW0k+FJMFD5G
         Xxf+KV40ZLP3ldwX0c+D9wjijz/K+Sv8GZf0WyExRH+nLPr9z9UWeM1hezmVidwDqJL4
         L/MLACIM6yNoR9WRM89NNk2tW6Misa9/nVF2e4ggL9FBdnsIq3Op/YJsCk9HcwBf9cyR
         XyuQ==
X-Gm-Message-State: AFqh2krCBh74EZuOM+V2G+ttEykZsKwM2e7KJB1oFVpK/PIITLs5NjGm
	CUdBtdcyKwfpcyBcszY+0bpLV/uYMO7Z6ovthev7pw==
X-Google-Smtp-Source: AMrXdXs1k5W3HoVGCiUVOI7jTqOyluR9eRrHzCwGnTn1al/nkArE3wLdMkVcHMHmAcyunh8GSfVeJdebmQPCKJ8WsTw=
X-Received: by 2002:a05:6902:685:b0:7e9:646d:2da3 with SMTP id
 i5-20020a056902068500b007e9646d2da3mr1102592ybt.340.1674063648863; Wed, 18
 Jan 2023 09:40:48 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-28-surenb@google.com>
 <CAG48ez3EAai=1ghnCMF6xcgUebQRm-u2xhwcpYsfP9=r=oVXig@mail.gmail.com>
In-Reply-To: <CAG48ez3EAai=1ghnCMF6xcgUebQRm-u2xhwcpYsfP9=r=oVXig@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Jan 2023 09:40:37 -0800
Message-ID: <CAJuCfpETt1NHOhOzkP+pgUnNLNRq3LRRyadsc20pW+cCDLuyPg@mail.gmail.com>
Subject: Re: [PATCH 27/41] mm/mmap: prevent pagefault handler from racing with
 mmu_notifier registration
To: Jann Horn <jannh@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 4:51 AM Jann Horn <jannh@google.com> wrote:
>
> On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > Page fault handlers might need to fire MMU notifications while a new
> > notifier is being registered. Modify mm_take_all_locks to write-lock all
> > VMAs and prevent this race with fault handlers that would hold VMA locks.
> > VMAs are locked before i_mmap_rwsem and anon_vma to keep the same
> > locking order as in page fault handlers.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  mm/mmap.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/mm/mmap.c b/mm/mmap.c
> > index 30c7d1c5206e..a256deca0bc0 100644
> > --- a/mm/mmap.c
> > +++ b/mm/mmap.c
> > @@ -3566,6 +3566,7 @@ static void vm_lock_mapping(struct mm_struct *mm, struct address_space *mapping)
> >   * of mm/rmap.c:
> >   *   - all hugetlbfs_i_mmap_rwsem_key locks (aka mapping->i_mmap_rwsem for
> >   *     hugetlb mapping);
> > + *   - all vmas marked locked
>
> The existing comment above says that this is an *ordered* listing of
> which locks are taken.
>
> >   *   - all i_mmap_rwsem locks;
> >   *   - all anon_vma->rwseml
> >   *
> > @@ -3591,6 +3592,7 @@ int mm_take_all_locks(struct mm_struct *mm)
> >         mas_for_each(&mas, vma, ULONG_MAX) {
> >                 if (signal_pending(current))
> >                         goto out_unlock;
> > +               vma_write_lock(vma);
> >                 if (vma->vm_file && vma->vm_file->f_mapping &&
> >                                 is_vm_hugetlb_page(vma))
> >                         vm_lock_mapping(mm, vma->vm_file->f_mapping);
>
> Note that multiple VMAs can have the same ->f_mapping, so with this,
> the lock ordering between VMA locks and the mapping locks of hugetlb
> VMAs is mixed: If you have two adjacent hugetlb VMAs with the same
> ->f_mapping, then the following operations happen:
>
> 1. lock VMA 1
> 2. lock mapping of VMAs 1 and 2
> 3. lock VMA 2
> 4. [second vm_lock_mapping() is a no-op]
>
> So for VMA 1, we ended up taking the VMA lock first, but for VMA 2, we
> took the mapping lock first.
>
> The existing code has one loop per lock type to ensure that the locks
> really are taken in the specified order, even when some of the locks
> are associated with multiple VMAs.
>
> If we don't care about the ordering between these two, maybe that's
> fine and you just have to adjust the comment; but it would be clearer
> to add a separate loop for the VMA locks.

Oh, thanks for pointing out this detail. A separate loop is definitely
needed here. Will do that in the next respin.

>
> > @@ -3677,6 +3679,7 @@ void mm_drop_all_locks(struct mm_struct *mm)
> >                 if (vma->vm_file && vma->vm_file->f_mapping)
> >                         vm_unlock_mapping(vma->vm_file->f_mapping);
> >         }
> > +       vma_write_unlock_mm(mm);
> >
> >         mutex_unlock(&mm_all_locks_mutex);
> >  }
> > --
> > 2.39.0
> >
