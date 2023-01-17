Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 895EE66E856
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 22:22:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxMLL2XZ3z3bh6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 08:22:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AcMcOiO2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=AcMcOiO2;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxMKR01zZz2xl2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 08:22:01 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-4d59d518505so272364407b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 13:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xtczcpnEdrb6Lo/I50tBUUcvRCWBMIoMko6b3VfQkh8=;
        b=AcMcOiO2z6ozFh44VpqFr7ezkcbEZnhi09Dbp343HQiIrdSXkgI50tblBtSXc4Qkbr
         Dm0aJ5OWtPIPe1vN3owVIfQugxfobInM08+GWcQC0Wl/sGleOffZOyKeiGBU66WnPH9X
         yGh7HPsaf3D37qff2nHLKSk9GB5gXj4/bJSoqoPygqkBfp0n5aCUJW1R2r1cGv48MYT9
         AF0QYZ+3MvoaJhRFmZkp/7b87hU6GOckZwAwfWDK+vU6aqzT+gjcR5kQJuyq+Vt1cTTM
         SPO3L3JDVl95dXMuhHrtNaPJurOeiaEkl6ib7er/Q0Jv+k3LnRbtNLzrD3OvrfjKSDHz
         HteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtczcpnEdrb6Lo/I50tBUUcvRCWBMIoMko6b3VfQkh8=;
        b=ERmBd062xb3Vh4Na50ffnaK9h6y/wO5vbPrU8Cn7GuFcYz+TJQbwVLHftw9nvvLu8L
         +pLvLAi7qoAuxdw/WFxM16zUwsuGxvkMPQlspe5yDm/OS7d8Q3Xwwygqslc31Q/xdwRg
         FZ+x4HKWI8KpukCDLGFuIh6ZgxAvJ8rNSh2wfSrxsinHTgX+IuiM1Axl1UtDdiXvFnnr
         PX0gpb78Q+aqedZU5zR24H6yGj0Ho1pNtYFwnSxKAyu+Cxz5N6E1t/FaKAeOXUBA08/s
         p8CfmCqMObSkTQwVuck1AO4eH1wDA3Pcvap+2GLTPWp4qBhHDu7tEMyt1YGlu3GmLlyK
         GwZw==
X-Gm-Message-State: AFqh2krqtEC2hStc6Js3afxKR5bGnmQf7HSy4kwsIGvu1+pVAGHF8x9n
	/yCfhbRFNQRSiFFDUEeG59CYPKIJI1BO9DIh0RqgTg==
X-Google-Smtp-Source: AMrXdXtePqeFLTDxDaGD0SiAwIlsFIJGXklyX1m/MZjPOlYrdLeSS6NZFiXQQ8abRq5qEH0JCgU5ZQh27jLTDLKC0bU=
X-Received: by 2002:a81:1d2:0:b0:433:f1c0:3f1c with SMTP id
 201-20020a8101d2000000b00433f1c03f1cmr623569ywb.438.1673990519331; Tue, 17
 Jan 2023 13:21:59 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <Y8a4+bV1dYNAiUkD@dhcp22.suse.cz> <Y8a66gshQkkhC1cT@dhcp22.suse.cz>
In-Reply-To: <Y8a66gshQkkhC1cT@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 17 Jan 2023 13:21:47 -0800
Message-ID: <CAJuCfpF2ciMbMFgqa4GqYqg8zjpnmBoNZDG23V0+w017LXeU3w@mail.gmail.com>
Subject: Re: [PATCH 12/41] mm: add per-VMA lock and helper functions to
 control it
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

On Tue, Jan 17, 2023 at 7:12 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 17-01-23 16:04:26, Michal Hocko wrote:
> > On Mon 09-01-23 12:53:07, Suren Baghdasaryan wrote:
> > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > to be exclusively locked during VMA tree modifications, instead of the
> > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > locked.
> >
> > I have to say I was struggling a bit with the above and only understood
> > what you mean by reading the patch several times. I would phrase it like
> > this (feel free to use if you consider this to be an improvement).
> >
> > Introduce a per-VMA rw_semaphore. The lock implementation relies on a
> > per-vma and per-mm sequence counters to note exclusive locking:
> >         - read lock - (implemented by vma_read_trylock) requires the the
> >           vma (vm_lock_seq) and mm (mm_lock_seq) sequence counters to
> >           differ. If they match then there must be a vma exclusive lock
> >           held somewhere.
> >         - read unlock - (implemented by vma_read_unlock) is a trivial
> >           vma->lock unlock.
> >         - write lock - (vma_write_lock) requires the mmap_lock to be
> >           held exclusively and the current mm counter is noted to the vma
> >           side. This will allow multiple vmas to be locked under a single
> >           mmap_lock write lock (e.g. during vma merging). The vma counter
> >           is modified under exclusive vma lock.
>
> Didn't realize one more thing.
>             Unlike standard write lock this implementation allows to be
>             called multiple times under a single mmap_lock. In a sense
>             it is more of mark_vma_potentially_modified than a lock.

In the RFC it was called vma_mark_locked() originally and renames were
discussed in the email thread ending here:
https://lore.kernel.org/all/621612d7-c537-3971-9520-a3dec7b43cb4@suse.cz/.
If other names are preferable I'm open to changing them.

>
> >         - write unlock - (vma_write_unlock_mm) is a batch release of all
> >           vma locks held. It doesn't pair with a specific
> >           vma_write_lock! It is done before exclusive mmap_lock is
> >           released by incrementing mm sequence counter (mm_lock_seq).
> >       - write downgrade - if the mmap_lock is downgraded to the read
> >         lock all vma write locks are released as well (effectivelly
> >         same as write unlock).
> --
> Michal Hocko
> SUSE Labs
