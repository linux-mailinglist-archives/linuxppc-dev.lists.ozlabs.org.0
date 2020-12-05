Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 491A42CFA66
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 09:01:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cp28v2dK0zDqcw
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Dec 2020 19:01:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Gc/gJZMQ; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cp2711xdgzDqDr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Dec 2020 19:00:10 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id m9so5015368pgb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 05 Dec 2020 00:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0masjBUaEdT8yhWPTiGZKXmGUQ0WDl0QMJjmOmFRbgI=;
 b=Gc/gJZMQJsaxJezPjoIJ+l5Klj3CzVb5UfjGmnUDQ+DMJR1ckzh7xASLtrBAkakChE
 Grl/mbVH7ZhodnKKNM2V9SyaZmqJG37yL3RpwHLG4q20CIoG0WuD8qDvAO8cK0/5pOI0
 XLsxT4WCK17cUlrgT8NKnQ5XHp4ZttYAJyAOErwofFJmxZrdS7k60N/YEMuAPFjj724x
 6Y3lOmK1Fa/4/jUmD8oygPoU6iU8yiVqkQIaS7YpdjpykZeVq+kx+BCFkvagYRVtu/LW
 nNkXd6MTx3rnKjDArqwSiQDF0G/uOxtru2icj5A/knbFbSw4HW25IWRF8hP5S0xki7Ot
 QuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0masjBUaEdT8yhWPTiGZKXmGUQ0WDl0QMJjmOmFRbgI=;
 b=d/Ea8inEa0yGLo9ly0Rcbp9JsOOSi4aGaC3uCTwcM0QNmBZPknkLpKpk2ZFDM3sG0f
 95IgywjN+nkG2OteNl/Z9u/1fsjHodFMgOKtLdQXUgUB6eRrPb1yee4WLvALI0bIgNM5
 iaR9X8atGx4EVzRCFEJh8VDghgsIinMh7Lg6OD5MmdEEQS1jYYVVjvAJ3ryYVVO6Dgnc
 xJQM49i5RtrWYvXhjkMnv98QKvG5SO/XDFa7hIddQu4GY6o+kDOnyUT22BF4JNdNew0S
 OYBgB5w/e440cq+dBzyKF1DEzp2fEn3L/AtZcdI8GVp0PdNFYvVOeCunuWPRWG+rO+WW
 Qa/g==
X-Gm-Message-State: AOAM533swKXAYh4gMvh6l9U29PRUJf7RzmZz62g+pxCBp/mwUgx/daUt
 xkVjjUYgDEAOOnjus40HiZ0=
X-Google-Smtp-Source: ABdhPJxxq5hhiaL6DPOoOhrdsC1HhF8QISir8hTk4ZBkYS67jaUKjbr7sa21l559bUoRv8iVAoVSKg==
X-Received: by 2002:a63:a55d:: with SMTP id r29mr10713433pgu.289.1607155208529; 
 Sat, 05 Dec 2020 00:00:08 -0800 (PST)
Received: from localhost ([1.129.168.124])
 by smtp.gmail.com with ESMTPSA id n5sm6278072pgm.29.2020.12.05.00.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Dec 2020 00:00:07 -0800 (PST)
Date: Sat, 05 Dec 2020 18:00:00 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
To: Andy Lutomirski <luto@kernel.org>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-3-npiggin@gmail.com>
 <CALCETrXYkbuJJnDv9ijfT+5tLQ2FOvvN1Ugoh5NwOy+zHp9HXA@mail.gmail.com>
 <1606876327.dyrhkih2kh.astroid@bobo.none>
 <CALCETrV8Z5JdsP-Qa8B6y01LmXnSruOEWVt9_Un1RX1+nZuhxw@mail.gmail.com>
In-Reply-To: <CALCETrV8Z5JdsP-Qa8B6y01LmXnSruOEWVt9_Un1RX1+nZuhxw@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1607152918.fkgmomgfw9.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

Excerpts from Andy Lutomirski's message of December 3, 2020 3:09 pm:
> On Tue, Dec 1, 2020 at 6:50 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> Excerpts from Andy Lutomirski's message of November 29, 2020 3:55 am:
>> > On Sat, Nov 28, 2020 at 8:02 AM Nicholas Piggin <npiggin@gmail.com> wr=
ote:
>> >>
>> >> And get rid of the generic sync_core_before_usermode facility. This i=
s
>> >> functionally a no-op in the core scheduler code, but it also catches
>> >>
>> >> This helper is the wrong way around I think. The idea that membarrier
>> >> state requires a core sync before returning to user is the easy one
>> >> that does not need hiding behind membarrier calls. The gap in core
>> >> synchronization due to x86's sysret/sysexit and lazy tlb mode, is the
>> >> tricky detail that is better put in x86 lazy tlb code.
>> >>
>> >> Consider if an arch did not synchronize core in switch_mm either, the=
n
>> >> membarrier_mm_sync_core_before_usermode would be in the wrong place
>> >> but arch specific mmu context functions would still be the right plac=
e.
>> >> There is also a exit_lazy_tlb case that is not covered by this call, =
which
>> >> could be a bugs (kthread use mm the membarrier process's mm then cont=
ext
>> >> switch back to the process without switching mm or lazy mm switch).
>> >>
>> >> This makes lazy tlb code a bit more modular.
>> >
>> > I have a couple of membarrier fixes that I want to send out today or
>> > tomorrow, and they might eliminate the need for this patch.  Let me
>> > think about this a little bit.  I'll cc you.  The existing code is way
>> > to subtle and the comments are far too confusing for me to be quickly
>> > confident about any of my conclusions :)
>> >
>>
>> Thanks for the head's up. I'll have to have a better look through them
>> but I don't know that it eliminates the need for this entirely although
>> it might close some gaps and make this not a bug fix. The problem here
>> is x86 code wanted something to be called when a lazy mm is unlazied,
>> but it missed some spots and also the core scheduler doesn't need to
>> know about those x86 details if it has this generic call that annotates
>> the lazy handling better.
>=20
> I'll send v3 tomorrow.  They add more sync_core_before_usermode() callers=
.
>=20
> Having looked at your patches a bunch and the membarrier code a bunch,
> I don't think I like the approach of pushing this logic out into new
> core functions called by arch code.  Right now, even with my
> membarrier patches applied, understanding how (for example) the x86
> switch_mm_irqs_off() plus the scheduler code provides the barriers
> that membarrier needs is quite complicated, and it's not clear to me
> that the code is even correct.  At the very least I'm pretty sure that
> the x86 comments are misleading.
>
> With your patches, someone trying to
> audit the code would have to follow core code calling into arch code
> and back out into core code to figure out what's going on.  I think
> the result is worse.

Sorry I missed this and rather than reply to the later version you
have a bigger comment here.

I disagree. Until now nobody following it noticed that the mm gets
un-lazied in other cases, because that was not too clear from the
code (only indirectly using non-standard terminology in the arch
support document).

In other words, membarrier needs a special sync to deal with the case=20
when a kthread takes the mm. exit_lazy_tlb gives membarrier code that=20
exact hook that it wants from the core scheduler code.

>=20
> I wrote this incomplete patch which takes the opposite approach (sorry
> for whitespace damage):

That said, if you want to move the code entirely in the x86 arch from
exit_lazy_tlb to switch_mm_irqs_off, it's trivial and touches no core
code after my series :) and I would have no problem with doing that.

I suspect it might actually be more readable to go the other way and
pull most of the real_prev =3D=3D next membarrier code into exit_lazy_tlb
instead, but I could be wrong I don't know exactly how the x86 lazy
state correlates with core lazy tlb state.

Thanks,
Nick

>=20
> commit 928b5c60e93f475934892d6e0b357ebf0a2bf87d
> Author: Andy Lutomirski <luto@kernel.org>
> Date:   Wed Dec 2 17:24:02 2020 -0800
>=20
>     [WIP] x86/mm: Handle unlazying membarrier core sync in the arch code
>=20
>     The core scheduler isn't a great place for
>     membarrier_mm_sync_core_before_usermode() -- the core scheduler
>     doesn't actually know whether we are lazy.  With the old code, if a
>     CPU is running a membarrier-registered task, goes idle, gets unlazied
>     via a TLB shootdown IPI, and switches back to the
>     membarrier-registered task, it will do an unnecessary core sync.
>=20
>     Conveniently, x86 is the only architecture that does anything in this
>     hook, so we can just move the code.
>=20
>     XXX: actually delete the old code.
>=20
>     Signed-off-by: Andy Lutomirski <luto@kernel.org>
>=20
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 3338a1feccf9..e27300fc865b 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -496,6 +496,8 @@ void switch_mm_irqs_off(struct mm_struct *prev,
> struct mm_struct *next,
>           * from one thread in a process to another thread in the same
>           * process. No TLB flush required.
>           */
> +
> +        // XXX: why is this okay wrt membarrier?
>          if (!was_lazy)
>              return;
>=20
> @@ -508,12 +510,24 @@ void switch_mm_irqs_off(struct mm_struct *prev,
> struct mm_struct *next,
>          smp_mb();
>          next_tlb_gen =3D atomic64_read(&next->context.tlb_gen);
>          if (this_cpu_read(cpu_tlbstate.ctxs[prev_asid].tlb_gen) =3D=3D
> -                next_tlb_gen)
> +            next_tlb_gen) {
> +            /*
> +             * We're reactivating an mm, and membarrier might
> +             * need to serialize.  Tell membarrier.
> +             */
> +
> +            // XXX: I can't understand the logic in
> +            // membarrier_mm_sync_core_before_usermode().  What's
> +            // the mm check for?
> +            membarrier_mm_sync_core_before_usermode(next);
>              return;
> +        }
>=20
>          /*
>           * TLB contents went out of date while we were in lazy
>           * mode. Fall through to the TLB switching code below.
> +         * No need for an explicit membarrier invocation -- the CR3
> +         * write will serialize.
>           */
>          new_asid =3D prev_asid;
>          need_flush =3D true;
>=20
