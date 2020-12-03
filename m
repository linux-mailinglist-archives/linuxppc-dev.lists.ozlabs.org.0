Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D90732CCE4F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 06:12:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmkVV3HynzDrNx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Dec 2020 16:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=tfMeMJ93; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmkRP32l4zDrLv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Dec 2020 16:09:53 +1100 (AEDT)
X-Gm-Message-State: AOAM532Gv75Sywmo1ytWEBIJonAOS5Q9sWkdhD0BqlH4G0rUHqRq8sJE
 zefDS0w82kJtVZ6NZED6uMk03dGlW04KuB6J55snSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606972190;
 bh=7g2I9ZPxa4pchuE7dPGHoljxF4dRWBnOMGl/P7H9WIA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tfMeMJ93rqivue3nmkFMInQS2xqr4igxWM3EfAPRbMi6rlAjonbMVtq21YSenddTX
 7K2KbW+u0Z1V8Uz+Bz0A6TPWn3pAqW934WfaUQmmklKjgbkxuXgfvSR9X9p03VSdkw
 IGfD6169dI1yzRY1dfx39xZuEK962uFAyXSe97o8MpsV7BPearkqNkYviq/qNdZ2Uy
 7TttBTGKbY/s1CxOcVALnPKQJuM9jqxg7/yc/ahVe/Pn8BFn++bIF8WjHYY3ckDhFW
 MWbt36hmdgtpKIZDDg7m6pya6naGxSKStcED9XQ0SIw1Qe9Hm8rVu84WJJCUnP+jP1
 MdhhNnDRlQk1g==
X-Google-Smtp-Source: ABdhPJxDY9JVxN1buVB6rnmNib1VO7P6DXlfg5FcFerSQ1RvZb4vgVhneeBCk5IE2FYo99+L/kmDBlVlLd9sen+gCuk=
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr1177759wmc.176.1606972188903; 
 Wed, 02 Dec 2020 21:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-3-npiggin@gmail.com>
 <CALCETrXYkbuJJnDv9ijfT+5tLQ2FOvvN1Ugoh5NwOy+zHp9HXA@mail.gmail.com>
 <1606876327.dyrhkih2kh.astroid@bobo.none>
In-Reply-To: <1606876327.dyrhkih2kh.astroid@bobo.none>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 2 Dec 2020 21:09:37 -0800
X-Gmail-Original-Message-ID: <CALCETrV8Z5JdsP-Qa8B6y01LmXnSruOEWVt9_Un1RX1+nZuhxw@mail.gmail.com>
Message-ID: <CALCETrV8Z5JdsP-Qa8B6y01LmXnSruOEWVt9_Un1RX1+nZuhxw@mail.gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
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
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 1, 2020 at 6:50 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Andy Lutomirski's message of November 29, 2020 3:55 am:
> > On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wrote:
> >>
> >> And get rid of the generic sync_core_before_usermode facility. This is
> >> functionally a no-op in the core scheduler code, but it also catches
> >>
> >> This helper is the wrong way around I think. The idea that membarrier
> >> state requires a core sync before returning to user is the easy one
> >> that does not need hiding behind membarrier calls. The gap in core
> >> synchronization due to x86's sysret/sysexit and lazy tlb mode, is the
> >> tricky detail that is better put in x86 lazy tlb code.
> >>
> >> Consider if an arch did not synchronize core in switch_mm either, then
> >> membarrier_mm_sync_core_before_usermode would be in the wrong place
> >> but arch specific mmu context functions would still be the right place.
> >> There is also a exit_lazy_tlb case that is not covered by this call, which
> >> could be a bugs (kthread use mm the membarrier process's mm then context
> >> switch back to the process without switching mm or lazy mm switch).
> >>
> >> This makes lazy tlb code a bit more modular.
> >
> > I have a couple of membarrier fixes that I want to send out today or
> > tomorrow, and they might eliminate the need for this patch.  Let me
> > think about this a little bit.  I'll cc you.  The existing code is way
> > to subtle and the comments are far too confusing for me to be quickly
> > confident about any of my conclusions :)
> >
>
> Thanks for the head's up. I'll have to have a better look through them
> but I don't know that it eliminates the need for this entirely although
> it might close some gaps and make this not a bug fix. The problem here
> is x86 code wanted something to be called when a lazy mm is unlazied,
> but it missed some spots and also the core scheduler doesn't need to
> know about those x86 details if it has this generic call that annotates
> the lazy handling better.

I'll send v3 tomorrow.  They add more sync_core_before_usermode() callers.

Having looked at your patches a bunch and the membarrier code a bunch,
I don't think I like the approach of pushing this logic out into new
core functions called by arch code.  Right now, even with my
membarrier patches applied, understanding how (for example) the x86
switch_mm_irqs_off() plus the scheduler code provides the barriers
that membarrier needs is quite complicated, and it's not clear to me
that the code is even correct.  At the very least I'm pretty sure that
the x86 comments are misleading.  With your patches, someone trying to
audit the code would have to follow core code calling into arch code
and back out into core code to figure out what's going on.  I think
the result is worse.

I wrote this incomplete patch which takes the opposite approach (sorry
for whitespace damage):

commit 928b5c60e93f475934892d6e0b357ebf0a2bf87d
Author: Andy Lutomirski <luto@kernel.org>
Date:   Wed Dec 2 17:24:02 2020 -0800

    [WIP] x86/mm: Handle unlazying membarrier core sync in the arch code

    The core scheduler isn't a great place for
    membarrier_mm_sync_core_before_usermode() -- the core scheduler
    doesn't actually know whether we are lazy.  With the old code, if a
    CPU is running a membarrier-registered task, goes idle, gets unlazied
    via a TLB shootdown IPI, and switches back to the
    membarrier-registered task, it will do an unnecessary core sync.

    Conveniently, x86 is the only architecture that does anything in this
    hook, so we can just move the code.

    XXX: actually delete the old code.

    Signed-off-by: Andy Lutomirski <luto@kernel.org>

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 3338a1feccf9..e27300fc865b 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -496,6 +496,8 @@ void switch_mm_irqs_off(struct mm_struct *prev,
struct mm_struct *next,
          * from one thread in a process to another thread in the same
          * process. No TLB flush required.
          */
+
+        // XXX: why is this okay wrt membarrier?
         if (!was_lazy)
             return;

@@ -508,12 +510,24 @@ void switch_mm_irqs_off(struct mm_struct *prev,
struct mm_struct *next,
         smp_mb();
         next_tlb_gen = atomic64_read(&next->context.tlb_gen);
         if (this_cpu_read(cpu_tlbstate.ctxs[prev_asid].tlb_gen) ==
-                next_tlb_gen)
+            next_tlb_gen) {
+            /*
+             * We're reactivating an mm, and membarrier might
+             * need to serialize.  Tell membarrier.
+             */
+
+            // XXX: I can't understand the logic in
+            // membarrier_mm_sync_core_before_usermode().  What's
+            // the mm check for?
+            membarrier_mm_sync_core_before_usermode(next);
             return;
+        }

         /*
          * TLB contents went out of date while we were in lazy
          * mode. Fall through to the TLB switching code below.
+         * No need for an explicit membarrier invocation -- the CR3
+         * write will serialize.
          */
         new_asid = prev_asid;
         need_flush = true;
