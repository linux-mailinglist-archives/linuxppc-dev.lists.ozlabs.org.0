Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063B566E5EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:27:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxHS65hC3z3cdk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:27:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hBh7iHpA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hBh7iHpA;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxHRD0P4Qz3bTB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:26:47 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id o75so35188558yba.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4j3tl0DYASqrjkqUxwz46bG4ROPSgLPddwJUIyGPfX8=;
        b=hBh7iHpA0qfvzb6NYfBFfodVZoJZG89lkfXRit37mYAmeC5nBFxn8EQS0LUAe3jcVo
         C5FRsaxj+EKLI2jWmHfjp8neugrXB9pI/nKBzQoYA1YpgFoWtnyOa5v24hYecpIUquUN
         KSNNz94C5dAuBzIbNy+BM3HlLgWGdJfq88KPVCdqr5XOURSiVIt8NC83fhsqzZZfL4An
         QFEI0BAISvqo9iX+zoQ1BM4zTAWiTj/t7PqnS+AcCO7l4eOGIMMkEF+giJ7BJLV4QoxO
         D/AunpSl6jrX3m5nr8I4wWYNarHbEt/jf3IwcNd/YSKXxcntJzTg/UwFDPfUl4301hBU
         s7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4j3tl0DYASqrjkqUxwz46bG4ROPSgLPddwJUIyGPfX8=;
        b=cb+o5GTwjME1G144JFkqDmsMgjIP1RrhFwVDh0x8eCrSWdYj/rh5Igm57Vb4baKof0
         oXrjESgDr07QTZq5i5rJRkgQafrwP0qSu5VQ4109l6tCwVfmpV23slgCK25+uw2RembC
         cORayHd2rtVM9PRq59EH4jPwQUgX8cvSvCQUT46q2be3UmeYNczIqIMa+2OpGsu/491J
         c9/Xq3870ROqucoH6q09KGvqGWgIgY/UxO/+B+N4l8/rxvSqDPYBbqSfRZav/eWw9/3W
         UMzcvHcWW/eRvksovUcwgCt9HD4dO2xcGTujIarRUl0Jrba65IO0O1ZTtms+PVgfpFUP
         OAIA==
X-Gm-Message-State: AFqh2krOj7jdOglfl0dskVqyaGJSGTwv9OmpjKvAwLu0UVoOHXoW1e26
	hfa807yP8hfoGnZhOf1I0Y4q5BuowLxFoTlNcaN82g==
X-Google-Smtp-Source: AMrXdXs7BogT7SdoZ360ei40N37ZNOM5XxWUzxAMlDXlaXiTGADLynxjLDtiuGW4hqoQrK26rMYv0lMAFrNqu+/4diM=
X-Received: by 2002:a25:ceca:0:b0:7e4:115c:9cf6 with SMTP id
 x193-20020a25ceca000000b007e4115c9cf6mr537549ybe.316.1673980003301; Tue, 17
 Jan 2023 10:26:43 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-42-surenb@google.com>
 <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
In-Reply-To: <CAG48ez3ZNt+B3XvAMP1OaeEYuwpXJ1epmT9YtNonFLEJ6yANVQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 10:26:32 -0800
Message-ID: <CAJuCfpFruHecz9NssGGFrG-RqbJFHCfRuZ7c6GbTBD4x4AU8aA@mail.gmail.com>
Subject: Re: [PATCH 41/41] mm: replace rw_semaphore with atomic_t in vma_lock
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

On Tue, Jan 17, 2023 at 10:12 AM Jann Horn <jannh@google.com> wrote:
>
> On Mon, Jan 9, 2023 at 9:55 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > rw_semaphore is a sizable structure of 40 bytes and consumes
> > considerable space for each vm_area_struct. However vma_lock has
> > two important specifics which can be used to replace rw_semaphore
> > with a simpler structure:
> [...]
> >  static inline void vma_read_unlock(struct vm_area_struct *vma)
> >  {
> > -       up_read(&vma->vm_lock->lock);
> > +       if (atomic_dec_and_test(&vma->vm_lock->count))
> > +               wake_up(&vma->vm_mm->vma_writer_wait);
> >  }
>
> I haven't properly reviewed this, but this bit looks like a
> use-after-free because you're accessing the vma after dropping your
> reference on it. You'd have to first look up the vma->vm_mm, then do
> the atomic_dec_and_test(), and afterwards do the wake_up() without
> touching the vma. Or alternatively wrap the whole thing in an RCU
> read-side critical section if the VMA is freed with RCU delay.

vm_lock->count does not control the lifetime of the VMA, it's a
counter of how many readers took the lock or it's negative if the lock
is write-locked.
