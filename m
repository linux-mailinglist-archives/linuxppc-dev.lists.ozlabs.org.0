Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CA166E67E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 20:00:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxJBd3QGYz3fCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 06:00:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TI/jZm0T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=TI/jZm0T;
	dkim-atps=neutral
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxJ9j6TzBz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 06:00:09 +1100 (AEDT)
Received: by mail-io1-xd2d.google.com with SMTP id n85so7689078iod.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 11:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Wdw6HE8HTpF7TjWP3fEjV+IfKA8kpoKQVjC2fd8a/M=;
        b=TI/jZm0TgXF1KqXD5ofQO3vjXscEbgReusDd9NZUiFO+rZ4ufxMxY0Wm4LXbNCDrcg
         VPncWQa1E7kGB48K1ouW/fIGNKtaTHLaj6Z/N+1njok2FFlr1LQOk6B6mXTmTM4tDkDf
         IT/vZNPwYX1bRsGgO77+sUA8PUaha5GZWJLZLvBjr/LdPPd7VppF5lAXYrpbp3pdyZxj
         qnWiHWo+K3KJh9Ng2IQXIddcOyASz5CtMRx5zrwOlml0CTgVQgdC17VWPPFTv7BoO/Vk
         VQiZrTXpH0fg9i9Oc4wCLj9yLYrY/QAd4sRfKUHBx+5Dam1c45UI9qdnx24fctaC4QRp
         myrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Wdw6HE8HTpF7TjWP3fEjV+IfKA8kpoKQVjC2fd8a/M=;
        b=x5k69vwxeTDXnAlyMHbtnyDpol+t3G4gC3znHcyZb1luq6A2NeUbamkexMIocLpSTQ
         BeDuRw7VpF9DNmVvvEi0+EfJfBvinzs2t+vGrzUGAi5ol1YalMBr5zPhqibo2siLflgp
         qAa1E6Nq2DPjcXUtRII4yYWhji8I+qKPzS5kU4CwN7D7LrC5DnJeTPwR/XoyBiUM+BCl
         ByHqJLJJ5wyhOFxbJnNmNzfkutlsyMm1ZMn5Ea+JQAXWmpfHuzh8DbZefsWJ2X1C4zjA
         KeQRzZbBRZdud0zYaChFLh4fv6eQsUTDLpFJs+QRCZk+bYmDkPt9MsuDh723ZPGvX09E
         y/Kw==
X-Gm-Message-State: AFqh2kpWp64SxgcbWP75VB6sBYwgP2iOtM7E/ICdP0z+4hIfWEBz2G6B
	T9tVpVX7n/3orEPC8V9zceDdlPQ2NWpabTyys8dNoQ==
X-Google-Smtp-Source: AMrXdXv6MqZXsvF44Gv12CcJfMs1PLhgpGnFRLlBquHPxqID9PTjCHdbpCsREcfjUMjSH1VGmrPetxKzt6MQiokOUYI=
X-Received: by 2002:a05:6602:2108:b0:704:9cd9:2dc7 with SMTP id
 x8-20020a056602210800b007049cd92dc7mr305485iox.154.1673982006407; Tue, 17 Jan
 2023 11:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
 <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com>
 <Y8bpfzYvWq/3ttr+@casper.infradead.org> <CAJuCfpHkgRDpMJXd6vnCmB50PnSOwDY9pjhW5LcdR+fU5JUseA@mail.gmail.com>
 <Y8btYASD3jmdCf5n@casper.infradead.org> <CAJuCfpGcufxmL7A-ea_JDKU2pxrTQJ7Sez7C6zcVyFK9q1CXUg@mail.gmail.com>
In-Reply-To: <CAJuCfpGcufxmL7A-ea_JDKU2pxrTQJ7Sez7C6zcVyFK9q1CXUg@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 19:59:29 +0100
Message-ID: <CAG48ez3Je1Jht_vqJf-qQ5R=KDuE1gzmHy5wN8oYZTwr+0PwBA@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
To: Suren Baghdasaryan <surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@te
 chsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 7:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> On Tue, Jan 17, 2023 at 10:47 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Tue, Jan 17, 2023 at 10:36:42AM -0800, Suren Baghdasaryan wrote:
> > > On Tue, Jan 17, 2023 at 10:31 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > >
> > > > On Tue, Jan 17, 2023 at 10:26:32AM -0800, Suren Baghdasaryan wrote:
> > > > > On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
> > > > > >
> > > > > > On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > > > > > rw_semaphore is a sizable structure of 40 bytes and consumes
> > > > > > > considerable space for each vm_area_struct. However vma_lock has
> > > > > > > two important specifics which can be used to replace rw_semaphore
> > > > > > > with a simpler structure:
> > > > > > [...]
> > > > > > >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > > > > >  {
> > > > > > > -       up_read(&vma->vm_lock->lock);
> > > > > > > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > > > > > > +               wake_up(&vma->vm_mm->vma_writer_wait);
> > > > > > >  }
> > > > > >
> > > > > > I haven't properly reviewed this, but this bit looks like a
> > > > > > use-after-free because you're accessing the vma after dropping your
> > > > > > reference on it. You'd have to first look up the vma->vm_mm, then do
> > > > > > the atomic_dec_and_test(), and afterwards do the wake_up() without
> > > > > > touching the vma. Or alternatively wrap the whole thing in an RCU
> > > > > > read-side critical section if the VMA is freed with RCU delay.
> > > > >
> > > > > vm_lock->count does not control the lifetime of the VMA, it's a
> > > > > counter of how many readers took the lock or it's negative if the lock
> > > > > is write-locked.
> > > >
> > > > Yes, but ...
> > > >
> > > >         Task A:
> > > >         atomic_dec_and_test(&vma->vm_lock->count)
> > > >                         Task B:
> > > >                         munmap()
> > > >                         write lock
> > > >                         free VMA
> > > >                         synchronize_rcu()
> > > >                         VMA is really freed
> > > >         wake_up(&vma->vm_mm->vma_writer_wait);
> > > >
> > > > ... vma is freed.
> > > >
> > > > Now, I think this doesn't occur.  I'm pretty sure that every caller of
> > > > vma_read_unlock() is holding the RCU read lock.  But maybe we should
> > > > have that assertion?
> > >
> > > Yep, that's what this patch is doing
> > > https://lore.kernel.org/all/20230109205336.3665937-27-surenb@google.com/
> > > by calling vma_assert_no_reader() from __vm_area_free().
> >
> > That's not enough though.  Task A still has a pointer to vma after it
> > has called atomic_dec_and_test(), even after vma has been freed by
> > Task B, and before Task A dereferences vma->vm_mm.
>
> Ah, I see your point now. I guess I'll have to store vma->vm_mm in a
> local variable and call mmgrab() before atomic_dec_and_test(), then
> use it in wake_up() and call mmdrop(). Is that what you are thinking?

You shouldn't need mmgrab()/mmdrop(), because whoever is calling you
for page fault handling must be keeping the mm_struct alive.
