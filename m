Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043D2C7776
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 04:57:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CkF1G0L0KzF0fJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Nov 2020 14:57:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RIa5z40g; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CkDz71m77zF0Qm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 14:55:15 +1100 (AEDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF15320825
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Nov 2020 03:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606622112;
 bh=SFN0cW7ogqkomQKOXYAGwHhs99pK+M7jTK6kr0JdxhQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RIa5z40goQIQDLMNaAtltuoB/wE0qEzVAOMGYNuhmvzVHq0LWbHfJof2wjKw7TPOs
 1XgBacK+PIBgAGvGw0Z1NTuKx/2qpjY45VH0QJbKQ3LKZmBA0wjqH9YalNQOkGM0iH
 Xd0UudwbagjBtu41fJaBX4gb+sXd87B5VGO25xGg=
Received: by mail-wr1-f50.google.com with SMTP id p8so10356557wrx.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 19:55:11 -0800 (PST)
X-Gm-Message-State: AOAM533tQy4B8YyrWzsuQmkpTDTL8jeFr24FDvaVbsMDclMkexXMEXs9
 icd2QMkPrmR2ccawgz0axrpELHYpe6VYgIGgXmkQ+w==
X-Google-Smtp-Source: ABdhPJwS4QIa9ZSC36DmJxGBf/plpbJObGJjJ0ZkOhBf+B6z5NpaaqPHMyKoPNucQWoi6SiCDnzDwGiIMEAs9GwV6rw=
X-Received: by 2002:adf:e449:: with SMTP id t9mr20484863wrm.257.1606622110451; 
 Sat, 28 Nov 2020 19:55:10 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
In-Reply-To: <20201128160141.1003903-7-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 28 Nov 2020 19:54:57 -0800
X-Gmail-Original-Message-ID: <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
Message-ID: <CALCETrVXUbe8LfNn-Qs+DzrOQaiw+sFUg1J047yByV31SaTOZw@mail.gmail.com>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies,
 a non-refcounting lazy tlb option
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> On big systems, the mm refcount can become highly contented when doing
> a lot of context switching with threaded applications (particularly
> switching between the idle thread and an application thread).
>
> Abandoning lazy tlb slows switching down quite a bit in the important
> user->idle->user cases, so so instead implement a non-refcounted scheme
> that causes __mmdrop() to IPI all CPUs in the mm_cpumask and shoot down
> any remaining lazy ones.
>
> Shootdown IPIs are some concern, but they have not been observed to be
> a big problem with this scheme (the powerpc implementation generated
> 314 additional interrupts on a 144 CPU system during a kernel compile).
> There are a number of strategies that could be employed to reduce IPIs
> if they turn out to be a problem for some workload.

I'm still wondering whether we can do even better.

The IPIs you're doing aren't really necessary -- we don't
fundamentally need to free the pagetables immediately when all
non-lazy users are done with them (and current kernels don't) -- what
we need to do is to synchronize all the bookkeeping.  So, with
adequate locking (famous last words), a couple of alternative schemes
ought to be possible.

a) Instead of sending an IPI, increment mm_count on behalf of the
remote CPU and do something to make sure that the remote CPU knows we
did this on its behalf.  Then free the mm when mm_count hits zero.

b) Treat mm_cpumask as part of the refcount.  Add one to mm_count when
an mm is created.  Once mm_users hits zero, whoever clears the last
bit in mm_cpumask is responsible for decrementing a single reference
from mm_count, and whoever sets it to zero frees the mm.

Version (b) seems fairly straightforward to implement -- add RCU
protection and a atomic_t special_ref_cleared (initially 0) to struct
mm_struct itself.  After anyone clears a bit to mm_cpumask (which is
already a barrier), they read mm_users.  If it's zero, then they scan
mm_cpumask and see if it's empty.  If it is, they atomically swap
special_ref_cleared to 1.  If it was zero before the swap, they do
mmdrop().  I can imagine some tweaks that could make this a big
faster, at least in the limit of a huge number of CPUs.

Version (a) seems a bit harder to reason about.  Maybe it could be
done like this.  Add a percpu variable mm_with_extra_count.  This
variable can be NULL, but it can also be an mm that has an extra
reference on behalf of the cpu in question.

__mmput scans mm_cpumask and, for each cpu in the mask, mmgrabs the mm
and cmpxchgs that cpu's mm_with_extra_count from NULL to mm.  If it
succeeds, then we win.  If it fails, further thought is required, and
maybe we have to send an IPI, although maybe some other cleverness is
possible.  Any time a CPU switches mms, it does atomic swaps
mm_with_extra_count to NULL and mmdrops whatever the mm was.  (Maybe
it needs to check the mm isn't equal to the new mm, although it would
be quite bizarre for this to happen.)  Other than these mmgrab and
mmdrop calls, the mm switching code doesn't mmgrab or mmdrop at all.


Version (a) seems like it could have excellent performance.


*However*, I think we should consider whether we want to do something
even bigger first.  Even with any of these changes, we still need to
maintain mm_cpumask(), and that itself can be a scalability problem.
I wonder if we can solve this problem too.  Perhaps the switch_mm()
paths could only ever set mm_cpumask bits, and anyone who would send
an IPI because a bit is set in mm_cpumask would first check some
percpu variable (cpu_rq(cpu)->something?  an entirely new variable) to
see if the bit in mm_cpumask is spurious.  Or perhaps mm_cpumask could
be split up across multiple cachelines, one per node.

We should keep the recent lessons from Apple in mind, though: x86 is a
dinosaur.  The future of atomics is going to look a lot more like
ARM's LSE than x86's rather anemic set.  This means that mm_cpumask
operations won't need to be full barriers forever, and we might not
want to take the implied full barriers in set_bit() and clear_bit()
for granted.

--Andy
