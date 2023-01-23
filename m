Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0971678294
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 18:08:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0xQL2h9pz3cJF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 04:08:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rdkh5YvS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=Rdkh5YvS;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0xPM5gnpz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 04:07:50 +1100 (AEDT)
Received: by mail-yb1-xb29.google.com with SMTP id b1so10413346ybn.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 09:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0FW2Lu3pQY4jZR84HYv4JQ4VKgnKPsvFkN66d0OQdfk=;
        b=Rdkh5YvSKKbAMeVrmVNplinHHWb9L0j8rdsuQhapYgNXgo2gD8OT9rPe2ZaYeKAx5E
         pquLD54vscJdCDSHhWXmL1EWzDt5pyAG1htz3dnPZFHMU65k7/ecAz8h560ev1Whkpkx
         GmJi3/qAY1SytqJGcHyL7ZauQwcXJIeewko/PfLsfneDZVVLvC6oLIKSy4xP3e27K+yS
         i+du5yv0dwEDCaLuKuAjKsXUTksGEyuqnkOl0M4LdMY5aXamVLJ2M8zCnWuE09jvAmuF
         sB/MZ98fMFzyGzj/8ucdRz1+7hR1rvsj7rFOBbeWzzRB8MHHZmcx/qo6hKDyOuhNc/f8
         Lcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FW2Lu3pQY4jZR84HYv4JQ4VKgnKPsvFkN66d0OQdfk=;
        b=a3tQABM6DVjwd4n78vE5YtdF4076VWyHqGcQ6zWJIYkyIltSGFEX4o1irWHIOLMeYN
         pz3Ub9rtamzmNnfkhCwwVrkcaWGoJBz7M9HAvmUWZMaCRbaTTXJY79yxO/1w2KTihI/J
         rShhQ27p71CMKCXqq1CUwcx7E1m3drf6KKLUY8/ocMsSOL69E8EQn4EbyvuY6pJozz/4
         VpO5IdMAX4/yHZhaeFk8hcnhXEf23rk9EztlUz1NCucqjQdTBukqD0D5msACojDEUvMw
         brYGcqiwcGVEfU/bckSCwsW/BqQu5ewQ38OXXwHZGmiJm/yG0u/ZWI/PrG6wHSr73tfa
         Gm3g==
X-Gm-Message-State: AFqh2kp2NCXyAJ78moSjn6hGGJ9QP0ryPZWDRmeFG1uKj1WBI0VxEWgZ
	O1rrFE6O6xmRi1VuG63HGrlasidpENjb0C3g/VpP5g==
X-Google-Smtp-Source: AMrXdXuiJMyjRQftHqmMyvImwNLCOEQZDFoh5cTDm5Yhcc0MUbhCxbDK85e3u9MmqqS9nUopxnOnX6EdJLA1Sjcj6S4=
X-Received: by 2002:a25:ceca:0:b0:7e4:115c:9cf6 with SMTP id
 x193-20020a25ceca000000b007e4115c9cf6mr2777687ybe.316.1674493667105; Mon, 23
 Jan 2023 09:07:47 -0800 (PST)
MIME-Version: 1.0
References: <Y8pWW9Am3mDP53qJ@dhcp22.suse.cz> <CAJuCfpHeuckG8YuNTgdDcNHNzJ3sQExD_f1hwXG_xmS7Z-925g@mail.gmail.com>
 <CAJuCfpF20nuP6Meib9h7NVrJv+wybYS==vZFQXxUW6n-ir9bvQ@mail.gmail.com>
 <Y8rGJq8LvX2C+Cr7@casper.infradead.org> <20230120170815.yuylbs27r6xcjpq5@revolver>
 <CAJuCfpH4o-iCmzdUcYD9bKieJ6-k-MZYLuHFhH+bN9yE07sibw@mail.gmail.com>
 <Y8rQNj5dVyuxRBOf@casper.infradead.org> <CAJuCfpG3YaExGkzsSSm0tXjMiSoM6rVf0JQgfrWu4UY5gsw=-w@mail.gmail.com>
 <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz> <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz>
In-Reply-To: <Y868Fadajv27QMXh@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 23 Jan 2023 09:07:34 -0800
Message-ID: <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
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

On Mon, Jan 23, 2023 at 8:55 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 23-01-23 08:22:53, Suren Baghdasaryan wrote:
> > On Mon, Jan 23, 2023 at 1:56 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Fri 20-01-23 09:50:01, Suren Baghdasaryan wrote:
> > > > On Fri, Jan 20, 2023 at 9:32 AM Matthew Wilcox <willy@infradead.org> wrote:
> > > [...]
> > > > > The page fault handler (or whatever other reader -- ptrace, proc, etc)
> > > > > should have a refcount on the mm_struct, so we can't be in this path
> > > > > trying to free VMAs.  Right?
> > > >
> > > > Hmm. That sounds right. I checked process_mrelease() as well, which
> > > > operated on mm with only mmgrab()+mmap_read_lock() but it only unmaps
> > > > VMAs without freeing them, so we are still good. Michal, do you agree
> > > > this is ok?
> > >
> > > Don't we need RCU procetions for the vma life time assurance? Jann has
> > > already shown how rwsem is not safe wrt to unlock and free without RCU.
> >
> > Jann's case requires a thread freeing the VMA to be blocked on vma
> > write lock waiting for the vma real lock to be released by a page
> > fault handler. However exit_mmap() means mm->mm_users==0, which in
> > turn suggests that there are no racing page fault handlers and no new
> > page fault handlers will appear. Is that a correct assumption? If so,
> > then races with page fault handlers can't happen while in exit_mmap().
> > Any other path (other than page fault handlers), accesses vma->lock
> > under protection of mmap_lock (for read or write, does not matter).
> > One exception is when we operate on an isolated VMA, then we don't
> > need mmap_lock protection, but exit_mmap() does not deal with isolated
> > VMAs, so out of scope here. exit_mmap() frees vm_area_structs under
> > protection of mmap_lock in write mode, so races with anything other
> > than page fault handler should be safe as they are today.
>
> I do not see you talking about #PF (RCU + vma read lock protected) with
> munmap. It is my understanding that the latter will synchronize over per
> vma lock (along with mmap_lock exclusive locking). But then we are back
> to the lifetime guarantees, or do I miss anything.

munmap() or any VMA-freeing operation other than exit_mmap() will free
using call_rcu(), as implemented today. The suggestion is to free VMAs
directly, without RCU grace period only when done from exit_mmap().
That' because VMA freeing flood has been seen so far only in the case
of exit_mmap() and we assume other cases are not that heavy to cause
call_rcu() flood to cause regressions. That assumption might prove
false but we can deal with that once we know it needs fixing.

> --
> Michal Hocko
> SUSE Labs
