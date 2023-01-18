Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 523A0671DAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 14:25:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxmhZ1nKvz3fC2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 00:25:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KZxUrgqH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=KZxUrgqH;
	dkim-atps=neutral
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxmgd13KVz3c9M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 00:24:11 +1100 (AEDT)
Received: by mail-io1-xd35.google.com with SMTP id n85so8756935iod.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 05:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0HpDGQASu6jsCGakE+zyQJRkRHgKI6AmZnZRKwM4p1o=;
        b=KZxUrgqHOW6I35Thp3B9indQq7cNnlsKLrVWZ68ThfJfnc4b/iqwH1v/YsPHPNW6tp
         V0YdIdO+lePrdsnwJWIzf9EZxzjMQV8s2oSdmZzbMaVvMUHcivT98VYHp4GmPgxfVJiY
         QxdeupqxD5r1mKUYxTxYX6YDjubBfnW+bX+37WdITk+kfxRSs+qUwQDLOUr2sodzGy2R
         MfEBWGAPloJqULLT0MZkW9ZE6qzOTFs7ToE5ut4M3pmXc0glt5lwYpTTirTHRVX3Wzu1
         0tT6YSymo3X385zYRZoJUJCesQvXGA7sPFARjqlTbO3/6fTFQPXzfX9Xa13K1La1cvUB
         MMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0HpDGQASu6jsCGakE+zyQJRkRHgKI6AmZnZRKwM4p1o=;
        b=vDQjzE9Rp4+GaznXSdITbDJqQxl6Kn1AQytN4qfB7JO527/QZLo2nBvQKieviG9aLJ
         IAF+fPwSGH9sJvLQJSg9YEMUSZLyw8hGGIeAm0pIysYWwAHBqyjOxwbCDeM35l2TGVa8
         tBBgH33/QTzPvhnRZlyQutG3moUhEQgr4x6ut6J4dDW8LPTGocX2LqlHFQZDPYKa95Du
         NECCytAT8DTA77QFR6ZuTjhcqdZnkEuJVq/+vmsVT7xeY/fNd1ZMNXpxQgIv0HZThHKB
         V6Pme7+qLZ23ZDyWsdYiCZvp2pIINXEKP0REae4poD/q0Qks5qa86W1rA6hknvGNGaQk
         FEmg==
X-Gm-Message-State: AFqh2ko9lPr/tM7X7Ds6Kw4/AVkxLvm6HK5UhIL88hO6KWNhgnkn3WTZ
	1HXkzeSqyVc+7OhHKGfFrp3kqnd/RhFpvn8JnXFpww==
X-Google-Smtp-Source: AMrXdXtVpr4jvFh+Nzy9mDXPMsxLoU3U3NYpeqIF3hovLZvVNxSrOgQi9liraHCx6fDJZNKaow5tcJKbajRkxzFbjws=
X-Received: by 2002:a02:2a4b:0:b0:38c:886a:219a with SMTP id
 w72-20020a022a4b000000b0038c886a219amr814437jaw.133.1674048249506; Wed, 18
 Jan 2023 05:24:09 -0800 (PST)
MIME-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com> <20230109205336.3665937-13-surenb@google.com>
 <CAG48ez0RhQ6=W01brLUXDXqQxz2M1FEMNqd2OvL+LhcJQY=NqA@mail.gmail.com> <Y8fl8lqS4QHZO1gV@dhcp22.suse.cz>
In-Reply-To: <Y8fl8lqS4QHZO1gV@dhcp22.suse.cz>
From: Jann Horn <jannh@google.com>
Date: Wed, 18 Jan 2023 14:23:32 +0100
Message-ID: <CAG48ez0dCo6KHPJrjAra=2Hm9aTm_3ERwCN3j64p3T82xNWScg@mail.gmail.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, Will Deacon <will@kernel.org>, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cm
 pxchg.org, akpm@linux-foundation.org, tatashin@google.com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 18, 2023 at 1:28 PM Michal Hocko <mhocko@suse.com> wrote:
> On Tue 17-01-23 19:02:55, Jann Horn wrote:
> > +locking maintainers
> >
> > On Mon, Jan 9, 2023 at 9:54 PM Suren Baghdasaryan <surenb@google.com> wrote:
> > > Introduce a per-VMA rw_semaphore to be used during page fault handling
> > > instead of mmap_lock. Because there are cases when multiple VMAs need
> > > to be exclusively locked during VMA tree modifications, instead of the
> > > usual lock/unlock patter we mark a VMA as locked by taking per-VMA lock
> > > exclusively and setting vma->lock_seq to the current mm->lock_seq. When
> > > mmap_write_lock holder is done with all modifications and drops mmap_lock,
> > > it will increment mm->lock_seq, effectively unlocking all VMAs marked as
> > > locked.
> > [...]
> > > +static inline void vma_read_unlock(struct vm_area_struct *vma)
> > > +{
> > > +       up_read(&vma->lock);
> > > +}
> >
> > One thing that might be gnarly here is that I think you might not be
> > allowed to use up_read() to fully release ownership of an object -
> > from what I remember, I think that up_read() (unlike something like
> > spin_unlock()) can access the lock object after it's already been
> > acquired by someone else.
>
> Yes, I think you are right. From a look into the code it seems that
> the UAF is quite unlikely as there is a ton of work to be done between
> vma_write_lock used to prepare vma for removal and actual removal.
> That doesn't make it less of a problem though.
>
> > So if you want to protect against concurrent
> > deletion, this might have to be something like:
> >
> > rcu_read_lock(); /* keeps vma alive */
> > up_read(&vma->lock);
> > rcu_read_unlock();
> >
> > But I'm not entirely sure about that, the locking folks might know better.
>
> I am not a locking expert but to me it looks like this should work
> because the final cleanup would have to happen rcu_read_unlock.
>
> Thanks, I have completely missed this aspect of the locking when looking
> into the code.
>
> Btw. looking at this again I have fully realized how hard it is actually
> to see that vm_area_free is guaranteed to sync up with ongoing readers.
> vma manipulation functions like __adjust_vma make my head spin. Would it
> make more sense to have a rcu style synchronization point in
> vm_area_free directly before call_rcu? This would add an overhead of
> uncontended down_write of course.

Something along those lines might be a good idea, but I think that
rather than synchronizing the removal, it should maybe be something
that splats (and bails out?) if it detects pending readers. If we get
to vm_area_free() on a VMA that has pending readers, we might already
be in a lot of trouble because the concurrent readers might have been
traversing page tables while we were tearing them down or fun stuff
like that.

I think maybe Suren was already talking about something like that in
another part of this patch series but I don't remember...
