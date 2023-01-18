Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FD567106E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 02:54:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxTMF4myRz3c8f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 12:54:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=S9f07Af/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b36; helo=mail-yb1-xb36.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=S9f07Af/;
	dkim-atps=neutral
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxTLM02tdz2xkm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 12:53:14 +1100 (AEDT)
Received: by mail-yb1-xb36.google.com with SMTP id 66so1234305yba.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 17:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ILbFWlZPwOXtbFXdBol6/JJ1NLyMRbPqRykuoOsUcaw=;
        b=S9f07Af/lU4+G+VMUbpgZblq8lSp89NNJk70aQ471CbMT/vlt7aN2JxyyA5gStbl73
         aXeNwMBG/dw/kxWw25tkzpI4AX6mo7X4hNZG3bANHhOypcVk/IOrijHxJuXWX2Bmiw0e
         PD1ZsIm7h5czVLywMPX3OimFR0B/7nHvePIMqQ/YFndiEgSIW6D/9fkr+k0Yx8Xxb3hc
         h4h+vIBsux9kUR61oAsVqczCnkCyPzYbZvz4ZbxZZEqKg1Vhp1uWZN7TEv7/40lWi0+n
         nRnqRKFWuzj6thZ+YRtwsNGrFNp9IxjZGzOdTL6toc2EncIaosruIioEJUTHDynIwSRR
         fmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILbFWlZPwOXtbFXdBol6/JJ1NLyMRbPqRykuoOsUcaw=;
        b=TdGKLrcE1Dfi9YnO5OwVccGz+mEf3AVouJ6YmbRVcXCuWMu9AUa99/5EnRrJ2PfGuR
         GTMWfTYgKzGc1wnmJSWJjnEuu/LvLDgOM/ldNR+ndddKOWg58CvFBq8uH9vaJd+HjDwy
         bxh1iQfBnwTNz8/SU673nwyR4Y66Pqglq/B2edmI0TkAkXl+EmzXvbJ+9GEFP8dj2FSP
         u4SEpuWzljKGQTxzDoySw2dVNp0TZjXF4tEPas5KcsRyVlkt5p+RkghkIh4aoHWpThpY
         fI+ubKmWJBS2xduQ3xgmnqLB2QF+IjEgvWo0fIEUMRw0f0onSbmwhTvFf523iW/YqUUR
         ROqQ==
X-Gm-Message-State: AFqh2koEPwS6OXYL6OmUbhVZD8wVFUIy5DuoNlhwBsNhjyntEbGDg81c
	r4hd5sCn4vpULIRghJoYokb7BZNvGW/njcwaQunFsQ==
X-Google-Smtp-Source: AMrXdXv4O1UDY3yFBG9KhKaThCAzMgSaCQb59bBOMeFB9e7SkeMuHmfyRxlJ6Uq5Jl9JKGZR5HpABk6NXpFuXqNAazY=
X-Received: by 2002:a25:4cf:0:b0:7ec:2d81:a6f9 with SMTP id
 198-20020a2504cf000000b007ec2d81a6f9mr626656ybe.431.1674006791486; Tue, 17
 Jan 2023 17:53:11 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-27-surenb@google.com>
 <Y8bB3TFLQV2HJZQ+@dhcp22.suse.cz>
In-Reply-To: <Y8bB3TFLQV2HJZQ+@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 17:53:00 -0800
Message-ID: <CAJuCfpH8-wNiPXQcS=0j-Ex7iMqoBkUhjSN8QiAvq6FdXudRGQ@mail.gmail.com>
Subject: Re: [PATCH 26/41] kernel/fork: assert no VMA readers during its destruction
To: Michal Hocko <mhocko@suse.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.ne
 t
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 17, 2023 at 7:42 AM 'Michal Hocko' via kernel-team
<kernel-team@android.com> wrote:
>
> On Mon 09-01-23 12:53:21, Suren Baghdasaryan wrote:
> > Assert there are no holders of VMA lock for reading when it is about to be
> > destroyed.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  include/linux/mm.h | 8 ++++++++
> >  kernel/fork.c      | 2 ++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 594e835bad9c..c464fc8a514c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -680,6 +680,13 @@ static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >       VM_BUG_ON_VMA(vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq), vma);
> >  }
> >
> > +static inline void vma_assert_no_reader(struct vm_area_struct *vma)
> > +{
> > +     VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock) &&
> > +                   vma->vm_lock_seq != READ_ONCE(vma->vm_mm->mm_lock_seq),
> > +                   vma);
>
> Do we really need to check for vm_lock_seq? rwsem_is_locked should tell
> us something is wrong on its own, no? This could be somebody racing with
> the vma destruction and using the write lock. Unlikely but I do not see
> why to narrow debugging scope.

I wanted to ensure there are no page fault handlers (read-lockers)
when we are destroying the VMA and rwsem_is_locked(&vma->lock) alone
could trigger if someone is concurrently calling vma_write_lock(). But
I don't think we expect someone to be write-locking the VMA while we
are destroying it, so you are right, I'm overcomplicating things here.
I think I can get rid of vma_assert_no_reader() and add
VM_BUG_ON_VMA(rwsem_is_locked(&vma->lock)) directly in
__vm_area_free(). WDYT?


> --
> Michal Hocko
> SUSE Labs
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
