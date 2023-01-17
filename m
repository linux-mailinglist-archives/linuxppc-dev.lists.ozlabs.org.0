Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6978666E86C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxMV428bWz3fH6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c9xxkcGE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=c9xxkcGE;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxMT85t2dz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:28:43 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4d13cb4bbffso321325387b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ov2HI3CdUQ+o/zqidsM3mX5Kp69NRx9NtPM0yxA19Es=;
        b=c9xxkcGEP3Ye/quI/NFLI8jX0YnrLxNGnHqR2fp0OMlpXEArjj/pF1vQu/FvXtpDdy
         2P3XSqLuk+kmfjnG6rpYrZFmaItZxF+QA1BzlBIFrCRrvOZ7YZaC7BuiM4sInT4nNTss
         P39YoaUBH1WHbYoxEBnNjRWMRcXtkydMsdBc9smvgMcDl+gePUxacD7TDnjmd+Ok8eHr
         UCtEUzGYQgr0JB2aA69UpZhKaYnCxA+E7CxSM5Ppx35IoEiRJVfF5n7xQNPiI80P/duK
         Iq5CwSrKFuLK9FbJJaqWXyM/YWpuN1Uqh0jrUd3BfTc4NHQaTV0IouF4IWoF3Y5UXvCI
         ondg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ov2HI3CdUQ+o/zqidsM3mX5Kp69NRx9NtPM0yxA19Es=;
        b=Vkt3iYbvjlAZXACcbSBR3zpMazCQLqynZaBJMtNs8uiWkw2ljFOXeBAV8tcdk9JEoq
         5VPDxMa/E7/6hA8jWxiF/BmvK1RRX6yQhB3XdT9rgSMnfHRInDY9Gf2H2rdeGQgzuC/H
         S/po2nDI24BteDlto0ny3eNaroYU0K4QxX+dPU/7IMBwqGngkd09FYcGEaNMHApfmhwV
         4fErYO0A2wiqFQJV5V9aARFwgG93BzSRKwK8tlm9E27flsRlQ9rhEgN0iAiR/L2KWLv4
         vFs8O7a9wOW3zo0uXCEjWW0DsFPB3idlYkaghdBnFDpqspT5jPshkSo8g6pgNHCFNn0S
         brdw==
X-Gm-Message-State: AFqh2kqQD+uPHJ6OnBIBRj0IhyjiALF9Z5Z3/KufB6tp+2UHF1kvgmgD
	6BKpuUDCy6tQHSDbOS2/TL6G3byFZIJd737ge+DJRA==
X-Google-Smtp-Source: AMrXdXvNbPUYj/FTXP9jMwGpFUtrl5UX+b/2dnT1jMx2j8lGwbfTbtmjUt5vhRCKMdkNLOmIJWYnhuJB9a8X5pfKXE8=
X-Received: by 2002:a81:6d8d:0:b0:490:89c3:21b0 with SMTP id
 i135-20020a816d8d000000b0049089c321b0mr610621ywc.132.1673990920942; Tue, 17
 Jan 2023 13:28:40 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
In-Reply-To: <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 13:28:27 -0800
Message-ID: <CAJuCfpHawn-hj3yK6MEMHsvnH9xgO87h7Sj3_g0FA7rgut_mVg@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Will Deacon <will@kernel.org>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-f
 oundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 10:03 AM Jann Horn <jannh@google.com> wrote:
>
> +locking maintainers

Thanks! I'll CC the locking maintainers in the next posting.

>
> On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > instead of mmap_lock. Because there are cases when multiple VMAs need
> > to be exclusively locked during VMA tree modifications, instead of the
> > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > locked.
> [...]
> > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > +{
> > +       up_read(&vma->lock);
> > +}
>
> One thing that might be gnarly here is that I think you might not be
> allowed to use up_read() to fully release ownership of an object -
> from what I remember, I think that up_read() (unlike something like
> spin_unlock()) can access the lock object after it's already been
> acquired by someone else. So if you want to protect against concurrent
> deletion, this might have to be something like:
>
> rcu_read_lock(); /* keeps vma alive */
> up_read(&vma->lock);
> rcu_read_unlock();

But for deleting VMA one would need to write-lock the vma->lock first,
which I assume can't happen until this up_read() is complete. Is that
assumption wrong?

>
> But I'm not entirely sure about that, the locking folks might know better.
>
> Also, it might not matter given that the rw_semaphore part is removed
> in the current patch 41/41 anyway...

This does matter because Michal suggested dropping that last 41/41
patch for now.
