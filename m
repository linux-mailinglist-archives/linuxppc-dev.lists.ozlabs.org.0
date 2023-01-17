Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52FE66E7BB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 21:37:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxLL43qwCz3fCj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:37:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QpAHNbvK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=QpAHNbvK;
	dkim-atps=neutral
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxLK967bfz3cdJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 07:36:44 +1100 (AEDT)
Received: by mail-io1-xd2f.google.com with SMTP id p66so15483506iof.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 12:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gzv/PjbkvkttZs2lXK771JGFBCi9Hf6ZZVadDKoWVOE=;
        b=QpAHNbvKrocr/gd9vGeih5qNlPxQR4MEXcSF4KR6pVa+PSdw28fgbVUFIbunf7ZNMp
         Bz+X/7R7YhZTp8QcKnf0rUNp4dHWFtDOn/C2E4pP8Kpox0pG02f+bk7RVlPsuaaQhpeE
         rR6AvvWD4qsJO0fGm/eLsQBDRj0Za8beePU4FZpa45+qQAtII1R2/dAg+bbznUkadb8m
         WpMTk5odBTayNIx9c/yS0gJXB6st0uuvpfPLzoL+u+QKqVr4iigyIBml9XmSh6isdaMz
         QufOUvjdWx/iu+V+o7iSeOPWNnygir8efcpoGOyVnh+WRc4LAfLaTOOuRgiv9PC/HVzz
         ctzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzv/PjbkvkttZs2lXK771JGFBCi9Hf6ZZVadDKoWVOE=;
        b=yi8mThC8yeakX+fvoBlFSreTZbtDkoVTK1CqLDyGd2DlImCs8lknKigE0TcmJjk5N6
         uJYEP8oukZ4YkK19DBx2ZXGg5BqzGvXLZCVsOr5QXWFTlm8XJL4J+i3yoAj4bapeTRJR
         ntMlisYl2GylyzxMfUuPgXNcU3fXe4MLYhhtBTF+yFcPtg9lzM7QhzMd1hRPYqp0aWTO
         mGEoRIX/Hr/ULubNhr/3qMMdsdiWEqBHPtmZLwEJhPZQkpdA6T+kmwsjZ5in7nVGeWzq
         kNcpI/nPvXeLCK/ypqzXMfrTWKpv8stltcZd7FwVulRSh1FMESbOQz3pfyfwK0JusKje
         FcIA==
X-Gm-Message-State: AFqh2krqWoDGAw/bTeT66QORqTXWAcN/CoMNghAzb2DvxVcJG1dYRkPR
	98qggd3tdAuB2Kh2W66bIB1a5wNlH88HRv6HR2C2Cg==
X-Google-Smtp-Source: AMrXdXusAVEO39vkcFBYo1YaXglysvZb5hIpl6B/Ane5TCpjdEQi3a24j+bOu8/GXvC7NmQ4pthv5BDs12Jhfzy67zo=
X-Received: by 2002:a02:2a4b:0:b0:38c:886a:219a with SMTP id
 w72-20020a022a4b000000b0038c886a219amr490143jaw.133.1673987801346; Tue, 17
 Jan 2023 12:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-33-surenb@google.com>
 <CAG48ez0Z-wnBLzCNDHgTviV0Ws+s4grX-sFRZ-43dxhJg+GzfA@mail.gmail.com>
In-Reply-To: <CAG48ez0Z-wnBLzCNDHgTviV0Ws+s4grX-sFRZ-43dxhJg+GzfA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 21:36:05 +0100
Message-ID: <CAG48ez1J2YC=_wu82p1BCgR+igd3aF_rwi5WmLJX9MjYM-BUsw@mail.gmail.com>
Subject: Re: [PATCH 32/41] mm: prevent userfaults to be handled under per-vma lock
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 8:51 PM Jann Horn <jannh@google.com> wrote:
> On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
> > handling under VMA lock and retry holding mmap_lock. This can be handled
> > more gracefully in the future.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > Suggested-by: Peter Xu <peterx@redhat.com>
> > ---
> >  mm/memory.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 20806bc8b4eb..12508f4d845a 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5273,6 +5273,13 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
> >         if (!vma->anon_vma)
> >                 goto inval;
> >
> > +       /*
> > +        * Due to the possibility of userfault handler dropping mmap_lock, avoid
> > +        * it for now and fall back to page fault handling under mmap_lock.
> > +        */
> > +       if (userfaultfd_armed(vma))
> > +               goto inval;
>
> This looks racy wrt concurrent userfaultfd_register(). I think you'll
> want to do the userfaultfd_armed(vma) check _after_ locking the VMA,

I still think this change is needed...

> and ensure that the userfaultfd code write-locks the VMA before
> changing the __VM_UFFD_FLAGS in vma->vm_flags.

Ah, but now I see you already took care of this half of the issue with
the reset_vm_flags() change in
https://lore.kernel.org/linux-mm/20230109205336.3665937-16-surenb@google.com/
.


> >         if (!vma_read_trylock(vma))
> >                 goto inval;
> >
> > --
> > 2.39.0
> >
