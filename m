Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E34E05B3CD7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:20:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPLmv5tnTz3c69
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:19:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Vtzxz/3W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2f; helo=mail-yb1-xb2f.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Vtzxz/3W;
	dkim-atps=neutral
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPLmH05g8z30hw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:19:25 +1000 (AEST)
Received: by mail-yb1-xb2f.google.com with SMTP id g5so3382786ybg.11
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=2KJtyG0OrgeeUZ3tbEzNZEApZJ2MVSJ3tdGvELtllWA=;
        b=Vtzxz/3WnYzehsvxEe5bYGVLVOYdFWrSTvZz1vALAWuaevC3U5WtB+f78lFCZF324w
         FiscSmbXyU+XOB2/F7lOYLYlIX8OuFWYPchdz5uYxmpm9O//MmQsACLWQpqvEvhHp78u
         Fqcicq6ClSVver2X4O9EIw1QxejGbytPeJEB/dU6IAFURZmla+3iGvObrXUwU6kzrvty
         vvKRbbaLhKfEVSQiX5d/rnqzs2MN5BTC2/L2bdEQkmQOw6LxzvEJ4w2N+ZccRlBLFUqE
         QBiGhcqj/PQWmuf5DYdZqpxP0dQ13hOo5+doY9eqgJ0sxS0rfuqgmlMiu7e7iSGtWTIp
         SMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=2KJtyG0OrgeeUZ3tbEzNZEApZJ2MVSJ3tdGvELtllWA=;
        b=G5Ic5uxr0dJo2YE15l65xuDtXeNBfBX5cNNOKqKG2Xs+Qinoy7Dwy7ddWlq7wo4VyR
         IDL/q1xHenQJEhQLB3aEOSTsHwWVwQG8bO2EeX/PknDtg1PHZza+01Jpou49asLpxUhc
         TNQ3fjlw3sQDjFdotIwb0t8Wo0dh8ui/Rwn4zEHQgLh/pN2RcsAgDFy0iXueZbFBYKuO
         rjuDa1VSOOk7MyOOeZ3ZyyaumR1IgRrJuIw/il1o6+5nrQ1ftjRCPUJ32k6kB2tvYRhj
         KDkjPTjKkZNujbItjTjSWxp93zIQZ2GK5cv+CBeKM+RtFKAF7CTwQkFpNg6WGt7FCC+B
         OnkA==
X-Gm-Message-State: ACgBeo23W14/FmULogfrPgJ0LwIctyTDpKXqlKRWTHIUTXBquaBsxk91
	gEs+QsnpOP8JvFfy4LHIJULYQcZ1qzgY76ueiCCxvA==
X-Google-Smtp-Source: AA6agR5nRzGlVojCwvyK5XF84Xj8sLR9CtuVgi9z+gwaNZrGge2Gh6ZuqKhqShhWXfC987DrYFOeiSZ3ndHTh5gSVbA=
X-Received: by 2002:a05:6902:2d0:b0:694:d257:4c4b with SMTP id
 w16-20020a05690202d000b00694d2574c4bmr12464223ybh.316.1662740362348; Fri, 09
 Sep 2022 09:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-17-surenb@google.com>
 <acf01185-0b34-0e92-770e-8417f4cc3cf3@linux.ibm.com>
In-Reply-To: <acf01185-0b34-0e92-770e-8417f4cc3cf3@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:19:11 -0700
Message-ID: <CAJuCfpHgLSbc-JgQRruTS=A_aQpj5b2bFkdbReFSPY01RXMVgQ@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 16/28] kernel/fork: assert no VMA readers
 during its destruction
To: Laurent Dufour <ldufour@linux.ibm.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 9, 2022 at 6:56 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:35, Suren Baghdasaryan a =C3=A9crit :
> > Assert there are no holders of VMA lock for reading when it is about to=
 be
> > destroyed.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h | 8 ++++++++
> >  kernel/fork.c      | 2 ++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index dc72be923e5b..0d9c1563c354 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -676,6 +676,13 @@ static inline void vma_assert_write_locked(struct =
vm_area_struct *vma, int pos)
> >       VM_BUG_ON_VMA(vma->vm_lock_seq !=3D READ_ONCE(vma->vm_mm->mm_lock=
_seq), vma);
> >  }
> >
> > +static inline void vma_assert_no_reader(struct vm_area_struct *vma)
> > +{
> > +     VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
> > +                   vma->vm_lock_seq !=3D READ_ONCE(vma->vm_mm->mm_lock=
_seq),
> > +                   vma);
> > +}
> > +
> >  #else /* CONFIG_PER_VMA_LOCK */
> >
> >  static inline void vma_init_lock(struct vm_area_struct *vma) {}
> > @@ -685,6 +692,7 @@ static inline bool vma_read_trylock(struct vm_area_=
struct *vma)
> >  static inline void vma_read_unlock(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_locked(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_write_locked(struct vm_area_struct *vma,=
 int pos) {}
> > +static inline void vma_assert_no_reader(struct vm_area_struct *vma) {}
> >
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index 1872ad549fed..b443ba3a247a 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -487,6 +487,8 @@ static void __vm_area_free(struct rcu_head *head)
> >  {
> >       struct vm_area_struct *vma =3D container_of(head, struct vm_area_=
struct,
> >                                                 vm_rcu);
> > +     /* The vma should either have no lock holders or be write-locked.=
 */
> > +     vma_assert_no_reader(vma);
>
> I'm wondering if this can be hit in the case the thread freeing a VMA is
> preempted before incrementing the mm ref count, like this:
>
> VMA is about to be freed
> write lock VMA
> free vma -> call_rcu
> ..
> <--- thread preempted
>         rcu handler runs
>         rcu calls __vm_area_free() <<<<<<

At this point the VMA is still write-locked (mm seq count hasn't been
incremented yet), correct? If so then vma_assert_no_reader() will not
assert because the second condition of VMA being write-locked is
satisfied. Did I miss anything?

> unlock mmap_lock and increase the mm seq count
>
>
> >       kmem_cache_free(vm_area_cachep, vma);
> >  }
> >  #endif
>
