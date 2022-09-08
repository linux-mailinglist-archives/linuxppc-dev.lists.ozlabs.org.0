Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A248E5B2AB2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 01:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MNx0242Z9z3c3w
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 09:58:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eex6cV74;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=eex6cV74;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MNwzM2gjdz2xJJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 09:57:34 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id g5so321061ybg.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Sep 2022 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=fjRx/Lr4rWG8FdNjepWfPwinvttFV+7WLgO00cFoqzc=;
        b=eex6cV74s4M8HeKkMm8twe1wMmlZy8xPylfXxTCwczLvM6rjy9aZnLRWAV94lwFweL
         wAYpV8vwszuecJPQnwFpuZcAWGq+gpGawG4NDhdV/gC5fkudZU59f9HbpteQ+lQOcY0I
         GAuQhYX7csyCScbjD5jgdN/lxX0hV5690Tcj8OCWTWHOdxz1phA0WKGeiTCECkVAzaLw
         sEfntZDZ1/grg22e7rWeAYxWauW5E1ZRZA2dGh5d7M8MUfKjS+PoLz8YplH1AxLv4mjU
         xBy4gnrkKgV0FDBrrfwV2xX69XGlTUWccShysi4f6ykbn3u/y4iOr6sGj4cHuPbiwDv6
         bZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fjRx/Lr4rWG8FdNjepWfPwinvttFV+7WLgO00cFoqzc=;
        b=dCJ5Y6iqBCBKy525TJSqEKGwiqKuAbdYxK80ew0yVtKNFiV2MmLiUYTwmeUAKbsMRz
         xJJM66wXKuGmYIVSptPBqreQliUbX75x7ydG+XBCy8qfB49bHwZ8F7poqWug0fMoYVcf
         PAW2AvjfDSUKCj215r9IrNn0cA0hXa2yU2oebq0EQsShAHYbSZOK6ttK8bI2c/OZBtnO
         iagDwlkVUhCS2Req6lDpW8CuaO2zcwdPwgEXQ+/S/v9Cp0QKapLl3i0HlT27haLI6qyP
         9vv8gC/940exgVCb3PRywtgcUjCSyzRR0fK1mq+rfEuuf16vTj4sJZbFc6pWsRR70h1g
         /BJA==
X-Gm-Message-State: ACgBeo0Vsny51wCZDvpcHD/IRSPcqjTN0BD83yjpufdSA7LZ9C2tXF4S
	EHJr+5+QVIER5cXTV81JGV6FzedZQvwszy62D7TB7g==
X-Google-Smtp-Source: AA6agR5z3AebbL5Azy4sNoMfTt0gW01VpIp+qr6/rNEQLn3rNpaHhq14wg8Eeh+706sD3nPJeGD6bnyLQT+FGI+FElY=
X-Received: by 2002:a05:6902:2d0:b0:694:d257:4c4b with SMTP id
 w16-20020a05690202d000b00694d2574c4bmr9669475ybh.316.1662681449064; Thu, 08
 Sep 2022 16:57:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-8-surenb@google.com>
 <a072fd10-ee7e-469f-c203-978cd7da566c@linux.ibm.com>
In-Reply-To: <a072fd10-ee7e-469f-c203-978cd7da566c@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 Sep 2022 16:57:17 -0700
Message-ID: <CAJuCfpFDFzCB7zuOGyd-gqovyhwvcQaUMOUS0E8+1QxLqD-Gdg@mail.gmail.com>
Subject: Re: [RFC PATCH RESEND 07/28] kernel/fork: mark VMAs as locked before
 copying pages during fork
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

On Tue, Sep 6, 2022 at 7:38 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> > Protect VMAs from concurrent page fault handler while performing
> > copy_page_range for VMAs having VM_WIPEONFORK flag set.
>
> I'm wondering why is that necessary.
> The copied mm is write locked, and the destination one is not reachable.
> If any other readers are using the VMA, this is only for page fault handl=
ing.

Correct, this is done to prevent page faulting in the VMA being
duplicated. I assume we want to prevent the pages in that VMA from
changing when we are calling copy_page_range(). Am I wrong?

> I should have miss something because I can't see any need to mark the loc=
k
> VMA here.
>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  kernel/fork.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/fork.c b/kernel/fork.c
> > index bfab31ecd11e..1872ad549fed 100644
> > --- a/kernel/fork.c
> > +++ b/kernel/fork.c
> > @@ -709,8 +709,10 @@ static __latent_entropy int dup_mmap(struct mm_str=
uct *mm,
> >               rb_parent =3D &tmp->vm_rb;
> >
> >               mm->map_count++;
> > -             if (!(tmp->vm_flags & VM_WIPEONFORK))
> > +             if (!(tmp->vm_flags & VM_WIPEONFORK)) {
> > +                     vma_mark_locked(mpnt);
> >                       retval =3D copy_page_range(tmp, mpnt);
> > +             }
> >
> >               if (tmp->vm_ops && tmp->vm_ops->open)
> >                       tmp->vm_ops->open(tmp);
>
