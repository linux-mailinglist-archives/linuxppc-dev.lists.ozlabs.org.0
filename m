Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DCD5B3CFE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MPM0y0rJLz3bmP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Sep 2022 02:30:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WFC+mmfL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WFC+mmfL;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MPM0N2yynz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Sep 2022 02:29:56 +1000 (AEST)
Received: by mail-yb1-xb36.google.com with SMTP id f131so3445995ybf.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=/FXE6KT3IEbyxLGcwK+3ue2mjXL44FHoYVt0dMcsy2k=;
        b=WFC+mmfLyYIjlJGVeXw314g1tcL5tJ4xqzIO2vLl/9rsbaCoGnBIPy0p853g4f7ctg
         8sPwQJXyO0UDB/KTe9E1ptVVFk01M9nrUJanKkaeE7/x8YMgQJdHf/BFgfI3HNW8rgRv
         6vobpUPxSYdYDFfdxIVAMxCj9HiA28eHAR4hUGCqxOsaz4OkiEsdJPiCQwV6GMlORkUI
         BXtJonrmNJppW9fC62mn2CBMHbx/j40w37N9WdzohE0jh06zgBKzULolHeam1yoUoSrH
         Hu4CD+yQ9nXFhR70qoHQP8/d8iHwqo7pk9Xvduf20IcOIKAE33Hdw4PWAhnGhJ63ogWo
         CIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/FXE6KT3IEbyxLGcwK+3ue2mjXL44FHoYVt0dMcsy2k=;
        b=a1fmoXkAkbruzk9hRU43nJyQgN3WdcgZ0uw2VlujSBE3RZMKK+Y9VGUcaAj+5jESfh
         OR/tZ6i7Lsw52j2v354pXU1A4nZCJgbaftl8ziNeW43MyKbcPlLCzHZdTz/RsojJabrg
         gdLkO7HsaSWI67UV4XQDKQ90TSunOLxCsXgtGmQOwL++nytG5t3CHiuOdVCtghD1c01k
         bK7zZRJGI1BgGgTyoG5KxvoQBZryaHI7n8AY/H7ncJBPOOAKiDRlIz+v6cP7unLMK+HW
         UFgHPh9dMN+Q0xCnDkVYfiSnzASBcCa7RiyD/bYpZOc1uXeJP69+JO1TM60nHOp1FwSH
         SAdw==
X-Gm-Message-State: ACgBeo2ZW2GeDeVBk1oP1rd2IALq8W7Oj/2aZ7XHtW6pkC3L+iSGsMRA
	vwk9PX3nQcJ6SfmM0UlEZlJU6IlbhRdnZQoX0+XR7g==
X-Google-Smtp-Source: AA6agR6gf0Uo8qO+GM5qYvgJUVDtfxBsoCtsc3hcZzYnaKBzzFaVOPRlFWPi3fYi14o77F1R3tazfKeOdbmbw81hzpM=
X-Received: by 2002:a25:abea:0:b0:6a8:1bd5:deef with SMTP id
 v97-20020a25abea000000b006a81bd5deefmr12701640ybi.431.1662740993786; Fri, 09
 Sep 2022 09:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com> <20220901173516.702122-8-surenb@google.com>
 <a072fd10-ee7e-469f-c203-978cd7da566c@linux.ibm.com> <CAJuCfpFDFzCB7zuOGyd-gqovyhwvcQaUMOUS0E8+1QxLqD-Gdg@mail.gmail.com>
 <fa73db62-560f-87c4-2b0f-bbba57eed8a7@linux.ibm.com>
In-Reply-To: <fa73db62-560f-87c4-2b0f-bbba57eed8a7@linux.ibm.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 9 Sep 2022 09:29:42 -0700
Message-ID: <CAJuCfpFMRp_VuhL4sp5S3OLnNSKSancSQ5SdC3nEPq_5mLFksg@mail.gmail.com>
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

On Fri, Sep 9, 2022 at 6:27 AM Laurent Dufour <ldufour@linux.ibm.com> wrote=
:
>
> Le 09/09/2022 =C3=A0 01:57, Suren Baghdasaryan a =C3=A9crit :
> > On Tue, Sep 6, 2022 at 7:38 AM Laurent Dufour <ldufour@linux.ibm.com> w=
rote:
> >>
> >> Le 01/09/2022 =C3=A0 19:34, Suren Baghdasaryan a =C3=A9crit :
> >>> Protect VMAs from concurrent page fault handler while performing
> >>> copy_page_range for VMAs having VM_WIPEONFORK flag set.
> >>
> >> I'm wondering why is that necessary.
> >> The copied mm is write locked, and the destination one is not reachabl=
e.
> >> If any other readers are using the VMA, this is only for page fault ha=
ndling.
> >
> > Correct, this is done to prevent page faulting in the VMA being
> > duplicated. I assume we want to prevent the pages in that VMA from
> > changing when we are calling copy_page_range(). Am I wrong?
>
> If a page is faulted while copy_page_range() is in progress, the page may
> not be backed on the child side (PTE lock should protect the copy, isn't =
it).
> Is that a real problem? It will be backed later if accessed on the child =
side.
> Maybe the per process pages accounting could be incorrect...

This feels to me like walking on the edge. Maybe we can discuss this
with more people at LPC before trying it?

>
> >
> >> I should have miss something because I can't see any need to mark the =
lock
> >> VMA here.
> >>
> >>> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>> ---
> >>>  kernel/fork.c | 4 +++-
> >>>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/kernel/fork.c b/kernel/fork.c
> >>> index bfab31ecd11e..1872ad549fed 100644
> >>> --- a/kernel/fork.c
> >>> +++ b/kernel/fork.c
> >>> @@ -709,8 +709,10 @@ static __latent_entropy int dup_mmap(struct mm_s=
truct *mm,
> >>>               rb_parent =3D &tmp->vm_rb;
> >>>
> >>>               mm->map_count++;
> >>> -             if (!(tmp->vm_flags & VM_WIPEONFORK))
> >>> +             if (!(tmp->vm_flags & VM_WIPEONFORK)) {
> >>> +                     vma_mark_locked(mpnt);
> >>>                       retval =3D copy_page_range(tmp, mpnt);
> >>> +             }
> >>>
> >>>               if (tmp->vm_ops && tmp->vm_ops->open)
> >>>                       tmp->vm_ops->open(tmp);
> >>
>
