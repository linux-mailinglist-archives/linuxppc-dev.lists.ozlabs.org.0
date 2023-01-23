Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDAD678147
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 17:24:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0wQm6QBjz3c9r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 03:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GT9CtnzF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GT9CtnzF;
	dkim-atps=neutral
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0wPp6qGjz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 03:23:09 +1100 (AEDT)
Received: by mail-yb1-xb2a.google.com with SMTP id b1so10225816ybn.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 08:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fMnbgf/RHQ3ZAFZtL86FFLpdOpXvUOvzb7OmVGfvdng=;
        b=GT9CtnzFDJgzUI5mydXp8vMCy8KjDM1ZqtBPYM0kcgx0FRmyl+E9TT47+NJLVc9OqG
         5B3xB6XB0xC505sdjlph/P3bNWUs+gwAY1bJeex4c5AXqMOiJ4kjsB70LJKHU1jq0S1p
         hpeWHMoy7IOoUmJEKiUYEepireN9i7kkgjXe4rrGmSrAN1Teoju59/CEYvPmeHmEYidF
         p6NVvwPXwkThYpdM/Zr6S2ip9BawZ0L6I9IbGk4vDo34NVL1snNIbnQPkwhHHAoedn6L
         IAMXqS1Abqo4chqx/pUJclhMWVSXP4nbkA+vi+eRWwhfst2RSj0RmxvR/EUi0HREO6Zi
         Qa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMnbgf/RHQ3ZAFZtL86FFLpdOpXvUOvzb7OmVGfvdng=;
        b=Y56u5x0SP9+EU91bqrmjyUbdm6pXyCj3lgPBv1iyR4gHiOmJOqpVjqUojJI31Felkq
         kAKRv2MO9REUEVYWawP3vc/PNiawrLENmsVyPFDpZEiac/pgwnlbQT/fJqhggbhIb/hE
         LjmbYMxbMeWyH7xpwLAjjkfU2NsVlMK0Cm5OF5VSsGEI2i0nDKbfJJpKLXoNfcQjNMVw
         JpfUqmBQgquIdDOPWBUnWeXMzn6pOfNdUWgaUwqgYrjuPMxaDE5dA/U8Czjt2eLbErwy
         sg3DJi5uT+yGGrrVRHuArEv/f9KKW6iQbAC14wo0dsvIUVcodghIZtq7+Kbd2jcUioDQ
         SH6w==
X-Gm-Message-State: AFqh2kp8Sm4GcehnF5IEcJamvf3mLHNas1QDvvfO6GwcGqDKHZy5e153
	JeixrDxeelzUVd7FUPt/h9NFp2tQ59+dTA/xV1sjtw==
X-Google-Smtp-Source: AMrXdXtgthJLROeIi9Kdf1aWHb5lhJLB0d8xJETJsdksQhtsxXC8/QdbWj0HkxC0Jssb10n37A0eaFm+06xsm+/I2B0=
X-Received: by 2002:a5b:cc8:0:b0:7ba:78b1:9fcc with SMTP id
 e8-20020a5b0cc8000000b007ba78b19fccmr2576165ybr.593.1674490984902; Mon, 23
 Jan 2023 08:23:04 -0800 (PST)
MIME-Version: 1.0
References: <Y8k+syJu7elWAjRj@dhcp22.suse.cz> <CAJuCfpEAL9y70KJ_a=Z_kJpJnNC-ge1aN2ofTupeQ5-FaKh84g@mail.gmail.com>
 <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz> <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org> <20230120170815.yuylbs27r6xcjpq5@revolver>
 <CAJuCfpH4o-iCmzdUcYD9bKieJ6-k-MZYLuHFhH+bN9yE07sibw@mail.gmail.com>
 <Y8rQNj5dVyuxRBOf@casper.infradead.org> <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz>
In-Reply-To: <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jan 2023 08:22:53 -0800
Message-ID: <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in vm_area_free
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@g
 oogle.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 23, 2023 at 1:56 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 20-01-23 09:50:01, Suren Baghdasaryan wrote:
> > On Fri, Jan 20, 2023 at 9:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> [...]
> > > The page fault handler (or whatever other reader -- ptrace, proc, etc)
> > > should have a refcount on the mm_struct, so we can't be in this path
> > > trying to free VMAs.  Right?
> >
> > Hmm. That sounds right. I checked process_mrelease() as well, which
> > operated on mm with only mmgrab()+mmap_read_lock() but it only unmaps
> > VMAs without freeing them, so we are still good. Michal, do you agree
> > this is ok?
>
> Don't we need RCU procetions for the vma life time assurance? Jann has
> already shown how rwsem is not safe wrt to unlock and free without RCU.

Jann's case requires a thread freeing the VMA to be blocked on vma
write lock waiting for the vma real lock to be released by a page
fault handler. However exit_mmap() means mm->mm_users==0, which in
turn suggests that there are no racing page fault handlers and no new
page fault handlers will appear. Is that a correct assumption? If so,
then races with page fault handlers can't happen while in exit_mmap().
Any other path (other than page fault handlers), accesses vma->lock
under protection of mmap_lock (for read or write, does not matter).
One exception is when we operate on an isolated VMA, then we don't
need mmap_lock protection, but exit_mmap() does not deal with isolated
VMAs, so out of scope here. exit_mmap() frees vm_area_structs under
protection of mmap_lock in write mode, so races with anything other
than page fault handler should be safe as they are today.

That said, the future possible users of lock_vma_under_rcu() using VMA
without mmap_lock protection will have to ensure mm's stability while
they are using the obtained VMA. IOW they should elevate mm's refcount
and keep it elevated as long as they are using that VMA and not before
vma->lock is released. I guess it would be a good idea to document
that requirement in lock_vma_under_rcu() comments if we decide to take
this route.

>
> --
> Michal Hocko
> SUSE Labs
