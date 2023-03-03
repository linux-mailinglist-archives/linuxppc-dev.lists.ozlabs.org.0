Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8C36A8ECB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 02:35:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSVsl596hz3cgR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 12:35:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Fu9U55wx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Fu9U55wx;
	dkim-atps=neutral
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSVrn68sfz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 12:34:48 +1100 (AEDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-53cb9ac9470so15816757b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Mar 2023 17:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1677807284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TciFh9FdyF3mrNIuO70cM61gX9uwhyReNw+Gw2pRUPA=;
        b=Fu9U55wxTCLtEXaKgOYnyEQH6o/knLUeIWIORmIAitVZwfQOux0uTJ7B66Lcq0ckLn
         DnaiYkrXI1vYlCgghAucupoHiJLokhAsINv3RZQOUyxdPAalX4v/jrQ0u6/kLfDotIq9
         fLpMNArb7teZwLpvE7yeMPSDWGi9TR9ae2CG3WWhAqSW7EINvX/f7irqODYobdS+zhBJ
         a7ooWCbNGLmh3/Gc2gFtAmGd5kUxNiekAbwj6joc0NC1oS5J6bD3OPBdhvO9gsTQ0ite
         jNjMWQ4waHcWsNugjOXd04kipv5Kdf3uEMBA3Jbr551AWQN/ktqXyvrMm6S4Ke4LZV0c
         2yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677807284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TciFh9FdyF3mrNIuO70cM61gX9uwhyReNw+Gw2pRUPA=;
        b=y5lQLU/JbBcxTZsOGgWhIXw9vmXiMLC7PWA+FW+Qf2YtDG6hD1VKTKH+ncQ7P5ziSO
         5r3raxdaKATCtpN/+gLyjBKcGpoYrbLOyeg4mgW5mLsKMn+Gy/NF3YEeNb5G6sWI7p4J
         +oU+P2KReFOhaz1F/thM/8VejgW1CSwlebxKNu7ihiEAVlaNV4nFO3MKLK6K0iJmYNwd
         SnRfjdyXCZSjMOVGtQ6l69f7WGedxxWIR63ngh5tEQbmWDmf2SWgA8e7GNlx6H3fQ3zk
         B2S9MXqi4O4ln2ybPeR7Wi9IdYmSIL3xmuhORB48FbdPb8vdyxgroOelFpZVMY+1M+4p
         FPDQ==
X-Gm-Message-State: AO0yUKWHrA1hji1nSV0dmm1J0HDlan+Fsis2iVh7CH0yQjrCu1mYD4Bp
	8BKTJPy+IluizPou/NcQcNUCUn+0qVP5vNMM4SE52A==
X-Google-Smtp-Source: AK7set8EWcUQluqN8WKHq8/XSmKUp/RVBAW+c+8SuNyz0OuOQxujuvEHXp6QWVS8hEOwj7mZluNQW9cmwuljgEcX14A=
X-Received: by 2002:a81:ac51:0:b0:53c:6fda:b469 with SMTP id
 z17-20020a81ac51000000b0053c6fdab469mr4635252ywj.0.1677807284013; Thu, 02 Mar
 2023 17:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20230301190457.1498985-1-surenb@google.com> <31a88065-063a-727e-52fd-9fbc7d17fb5c@redhat.com>
In-Reply-To: <31a88065-063a-727e-52fd-9fbc7d17fb5c@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 2 Mar 2023 17:34:33 -0800
Message-ID: <CAJuCfpGKK5SwxQr_BKrqnn0ZeaLVtX=n31MbKUwdnSSd4umB3A@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/nommu: remove unnecessary VMA locking
To: David Hildenbrand <david@redhat.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Hyeonggon Yoo <42.hyeyoo@gmail.com>, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, 
 akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 2, 2023 at 1:41=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 01.03.23 20:04, Suren Baghdasaryan wrote:
> > Since CONFIG_PER_VMA_LOCK depends on CONFIG_MMU, the changes in nommu
> > are not needed. Remove them.
> >
> > Fixes: bad94decd6a4 ("mm: write-lock VMAs before removing them from VMA=
 tree")
> > Reported-by: Hyeonggon Yoo <42.hyeyoo@gmail.com>
> > Link: https://lore.kernel.org/all/Y%2F8CJQGNuMUTdLwP@localhost/
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> > Fix cleanly applies over mm-unstable, SHA in "Fixes" is from that tree.
> >
> >   mm/nommu.c | 5 -----
> >   1 file changed, 5 deletions(-)
> >
> > diff --git a/mm/nommu.c b/mm/nommu.c
> > index 2ab162d773e2..57ba243c6a37 100644
> > --- a/mm/nommu.c
> > +++ b/mm/nommu.c
> > @@ -588,7 +588,6 @@ static int delete_vma_from_mm(struct vm_area_struct=
 *vma)
> >                      current->pid);
> >               return -ENOMEM;
> >       }
> > -     vma_start_write(vma);
> >       cleanup_vma_from_mm(vma);
> >
> >       /* remove from the MM's tree and list */
> > @@ -1520,10 +1519,6 @@ void exit_mmap(struct mm_struct *mm)
> >        */
> >       mmap_write_lock(mm);
> >       for_each_vma(vmi, vma) {
> > -             /*
> > -              * No need to lock VMA because this is the only mm user a=
nd no
> > -              * page fault handled can race with it.
> > -              */
> >               cleanup_vma_from_mm(vma);
> >               delete_vma(mm, vma);
> >               cond_resched();
>
> So, i assume this should be squashed.

Yes, that would be best.

>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks1

>
>
> Just a general comment: usually, if review of the original series is
> still going on, it makes a lot more sense to raise such things in the
> original series so the author can fixup while things are still in
> mm-unstable. Once the series is in mm-stable, it's a different story. In
> that case, it is usually good to have the mail subjects be something
> like  "[PATCH mm-stable 1/1] ...".

Ok... For my education, do you mean the title of this patch should
somehow reflect that it should be folded into the original patch? Just
trying to understand the actionable item here. How would you change
this patch when posting for mm-unstable and for mm-stable?
Thanks,
Suren.

>
> --
> Thanks,
>
> David / dhildenb
>
