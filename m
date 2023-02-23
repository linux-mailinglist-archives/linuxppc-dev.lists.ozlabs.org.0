Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D420D6A0EE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 18:47:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN0pP4phbz3chD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 04:47:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dummwTyK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=dummwTyK;
	dkim-atps=neutral
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN0nV2mzfz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 04:46:21 +1100 (AEDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-536c2a1cc07so199421177b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 09:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g/PLDPGKQjPZMyA7q+2mFnv6mahBdE0bikjr2yluVPY=;
        b=dummwTyKyVw0SoCKQB2T+CwBI/Ypb4Xjjntbgjy5yY3C5JfegBtvOFcckYNV17WdQ/
         0w5jao6F1lAd1zF6E9RI9/RWGb80R3PDgmBk2m8yqC+Gi9Cz8dqE6Quoai9BJdhJlqEh
         HXWjKep0uNLo6oQwpJ0si4E5CdSInQ6nVrYPpOZOZDmYeky4HyVGIjYgVtIRp21yjlXY
         GGlDKZIvbQYER09r+RZ/9BDfYBpNR1R7LQbtmEy4HPIjt4ErWpQfPwxeLOIuF7azgaN9
         TZCm0VAiYi4HMUn+5S8/JEaDBL3nNNe95Tqa3VX6huByAmE5cf905UXPLAp2GPZwk+ll
         sIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/PLDPGKQjPZMyA7q+2mFnv6mahBdE0bikjr2yluVPY=;
        b=NbSmsxnZCtMP22fCgR/3KwKocpg7JowlYr7gZvYgjdDmE01H5YMag+Yf76ecYf1LCo
         3QD9bC00IB2I6Q/+mOsLtvcIydOR7jPNSyivYWzLd51FVeRGjp+0P8zH02ByjoAh1c3R
         nH5tzyrVRsAi0EdXRkjxmUHtot2xbxba21WSzXO83tWoN/+5eIvHYkA7+9ObA+yAFH81
         bLl3NQAjMPdsT5lJXQ4DZAgDzCLY60KQ5w1XdDYZmW1rPBtwuCexq1Vsog+o3MurB1so
         BtkBy1VzaF5YIK4tKE/siknOum5sNMYaZKdpvCI7txojXVMLmnYnmkvn3Hn5oLuaFIqx
         H9mA==
X-Gm-Message-State: AO0yUKXlj2WfmD4SJcq+G9+srXNKo2uwa6ZT38ES75rNeVB2r7YcFoZn
	3+BHOmNMNT2HlW/dbWsrW6I/fEne1oSuMATY5NCkEg==
X-Google-Smtp-Source: AK7set8VspgWW+dqkUupWcrMtXnPa8I+wv5kJWT4xioj+Je37AbwwoY0FONlPTo7MjbvDCQNHSJjmEXD8ltyQIw5ZGk=
X-Received: by 2002:a81:b71b:0:b0:533:8f19:4576 with SMTP id
 v27-20020a81b71b000000b005338f194576mr2731678ywh.0.1677174377752; Thu, 23 Feb
 2023 09:46:17 -0800 (PST)
MIME-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com> <20230216051750.3125598-17-surenb@google.com>
 <Y/d9b5Ev6vAEzzVO@localhost>
In-Reply-To: <Y/d9b5Ev6vAEzzVO@localhost>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 23 Feb 2023 09:46:06 -0800
Message-ID: <CAJuCfpFmQYJ-0jFfO1YW7vgZ_DAm-ftrWfTm2AtFQ5u=AGgwVg@mail.gmail.com>
Subject: Re: [PATCH v3 16/35] mm/mmap: write-lock VMAs before merging,
 splitting or expanding them
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023 at 6:51 AM Hyeonggon Yoo <42.hyeyoo@gmail.com> wrote:
>
> On Wed, Feb 15, 2023 at 09:17:31PM -0800, Suren Baghdasaryan wrote:
> > Decisions about whether VMAs can be merged, split or expanded must be
> > made while VMAs are protected from the changes which can affect that
> > decision. For example, merge_vma uses vma->anon_vma in its decision
>
> Did you mean vma_merge()?

Correct.

>
> > whether the VMA can be merged. Meanwhile, page fault handler changes
> > vma->anon_vma during COW operation.
> > Write-lock all VMAs which might be affected by a merge or split operation
> > before making decision how such operations should be performed.
> >
>
> It doesn't make sense (to me) to update vma->anon_vma during COW fault.
>
> AFAIK children's vma->anon_vma is allocated during fork() and
> page->anon_vma is updated on COW to reduce rmap walking because it's now
> unshared, no?
>
> As patch 26 just falls back to mmap_lock if no anon_vma is set,
> I think we can assume nothing updates vma->anon_vma (and its interval
> tree) if we are holding mmap_lock in write mode.
>
> Or am I missing something?

No, I think you are right. Patch 26 was added in the later versions of
this patchset and at the time this patch was written vma->anon_vma
could change during page fault handling under only per-VMA lock
protection.
So, this patch can be simplified. We still want to prevent concurrent
page faults while VMA is being merged or split (simply because par-VMA
lock that page fault handler holds might become the wrong one if the
VMA is split or merged from under it) but the timing of taking per-VMA
lock does not have to be *before* can_vma_merge_{before|after}. Does
that make sense?

>
> --
> Regards,
> Hyeonggon
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
