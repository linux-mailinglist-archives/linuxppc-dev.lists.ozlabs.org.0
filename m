Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915D66E58F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 19:04:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxGxR2jFdz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 05:04:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mooewx5N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::132; helo=mail-il1-x132.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Mooewx5N;
	dkim-atps=neutral
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxGwT6bTBz3cdB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:03:36 +1100 (AEDT)
Received: by mail-il1-x132.google.com with SMTP id i1so12279345ilu.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 10:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2LfIzIDKNfdwhzRI4wk4tbto15PFLzQqPn6IM74K1Nc=;
        b=Mooewx5NuvmBi8G3lPeDVvjeMhDwam4J3V5WoYrMGEaACQq8r01FTJwg9r5gNAqKHv
         BcT+clyjtziDoHfDoZgf8mXwiyxjshQK9AVHMyb/QWVVp32ww9ingtrVqod0LDfOJImz
         Y0TwcaekYYsJ//YdVBtdZXByqq9WLLeZf19Z8v3wfd8Qhfwfau1IdSR4Tc4e6jr2szha
         MfdiYZLdlOAFeQe7T4M3d15TPoEEp9r20dwRTcjDofABHxa96XnhDW06/jzXCIqYK82c
         D9cdjVUUN6zid8FXGy9WF8BxgN6Gta9IfDG+F3FYzRS4GL6vM308WQjFQsyY7d5ObtDP
         aykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LfIzIDKNfdwhzRI4wk4tbto15PFLzQqPn6IM74K1Nc=;
        b=JZZDd7tSJTYw/trfjT2rjrGA78kMx/adnD/eI1GeWYcPzYlc9ahqjwk8aqtcfiTblU
         zMSxHSXfI8mApJ5E4/6XAerrvWy1UyTRoeMsd2c0jdeIo+cxTQpDzkMOnBONDm4/sKZk
         ErhefI8A8lidOCuaQoKS7R68kfCAkE3JQX+bd8Glnyw3wYozIKHQFNngcDNkbJwjsXgE
         tewFas+LjU0HiEBLnQMCdYbSSB8+rMS5g/fXUPU65Uh/38hzkh+4TNS5/dQtyINRasyQ
         j2//8dR5+TqJw7wwT2iy2SP3glN+rNAzTJJ4XHc7UeaYWvc2I+Ojn/kKmR+WSvDqpZOU
         wB1g==
X-Gm-Message-State: AFqh2kqKKjp0AtIsmLctVRuI7ejpndW5XOtW5Ths/nrHaCBYAkd91KUb
	R/7Y2K48dXvZv7LO5PTEksFtS5pFZp1ZwYw+rfFFDA==
X-Google-Smtp-Source: AMrXdXuYG9pfhe3BEDdAxOrlJ5FMm60eG9MzyrHap4mGomMoh4ycHHb4WuecCt1NKPItKhuNPMbigXyQKtN6iEbWTIk=
X-Received: by 2002:a92:a043:0:b0:30b:f4af:87bd with SMTP id
 b3-20020a92a043000000b0030bf4af87bdmr425702ilm.254.1673978611685; Tue, 17 Jan
 2023 10:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
In-Reply-To: <20230109205336.3665937-13-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 17 Jan 2023 19:02:55 +0100
Message-ID: <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
To: Suren Baghdasaryan <surenb@google.com>, peterz@infradead.org, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, gurua@google.com, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

+locking maintainers

On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> Introduce a per-VMA rw_semaphore to be used during page fault handling
> instead of mmap_lock. Because there are cases when multiple VMAs need
> to be exclusively locked during VMA tree modifications, instead of the
> usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> mmap_write_lock holder is done with all modifications and drops mmap_lock,
> it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> locked.
[...]
> +static inline void vma_read_unlock(struct vm_area_struct *vma)
> +{
> +       up_read(&vma->lock);
> +}

One thing that might be gnarly here is that I think you might not be
allowed to use up_read() to fully release ownership of an object -
from what I remember, I think that up_read() (unlike something like
spin_unlock()) can access the lock object after it's already been
acquired by someone else. So if you want to protect against concurrent
deletion, this might have to be something like:

rcu_read_lock(); /* keeps vma alive */
up_read(&vma->lock);
rcu_read_unlock();

But I'm not entirely sure about that, the locking folks might know better.

Also, it might not matter given that the rw_semaphore part is removed
in the current patch 41/41 anyway...
