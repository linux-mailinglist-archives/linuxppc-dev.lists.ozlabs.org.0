Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFF621DB1D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 18:02:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B57hq4Q4KzDqVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 02:02:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=J6B1/an8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B57cm11q8zDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 01:59:19 +1000 (AEST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5777720771
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594655957;
 bh=KyCw4fkjqGBP+Ng7/LXUCofxHSgPOYAylS5bQauPuV4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=J6B1/an87Uz+Ik5Zm/ikXniJFfkB0OJpKuPGtOS2jbFknhgYBK84N6z3WsA+39h32
 PIVdl90MO3IcY5znDYwiVHWLvaEypp3S2PIYeR4tpEiDakNY6jKisITSFJqHaHAgj5
 vtQuv/rRYW1/UBP9ICpJLNgkUogL19k2zGmWv098=
Received: by mail-wr1-f42.google.com with SMTP id j4so17100286wrp.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 08:59:17 -0700 (PDT)
X-Gm-Message-State: AOAM530qGy4Z7QrPjGSZ9GiznWI3I0lOSG608ctrUKIVokvYvZWducc4
 s0EzUXfS4nHe8YF8Aigt/ZRGr/qSCPJhnnd5PG14RA==
X-Google-Smtp-Source: ABdhPJxU2n3wnRIWWwiKNhxrwmUD4JY7g5VTemgvAdq6OBgmfsRoQL9sAN5gakJjmLDCt30osVAF5ooJLNn0n7EpJd8=
X-Received: by 2002:adf:e482:: with SMTP id i2mr11665wrm.75.1594655955925;
 Mon, 13 Jul 2020 08:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-8-npiggin@gmail.com>
In-Reply-To: <20200710015646.2020871-8-npiggin@gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 13 Jul 2020 08:59:04 -0700
X-Gmail-Original-Message-ID: <CALCETrWbD=3SUOuq9P7Syb+a1DoBjjem8hq9_HCvn7wyqETkpw@mail.gmail.com>
Message-ID: <CALCETrWbD=3SUOuq9P7Syb+a1DoBjjem8hq9_HCvn7wyqETkpw@mail.gmail.com>
Subject: Re: [RFC PATCH 7/7] lazy tlb: shoot lazies, a non-refcounting lazy
 tlb option
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

On Thu, Jul 9, 2020 at 6:57 PM Nicholas Piggin <npiggin@gmail.com> wrote:
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
> On a 16-socket 192-core POWER8 system, a context switching benchmark
> with as many software threads as CPUs (so each switch will go in and
> out of idle), upstream can achieve a rate of about 1 million context
> switches per second. After this patch it goes up to 118 million.
>

I read the patch a couple of times, and I have a suggestion that could
be nonsense.  You are, effectively, using mm_cpumask() as a sort of
refcount.  You're saying "hey, this mm has no more references, but it
still has nonempty mm_cpumask(), so let's send an IPI and shoot down
those references too."  I'm wondering whether you actually need the
IPI.  What if, instead, you actually treated mm_cpumask as a refcount
for real?  Roughly, in __mmdrop(), you would only free the page tables
if mm_cpumask() is empty.  And, in the code that removes a CPU from
mm_cpumask(), you would check if mm_users == 0 and, if so, check if
you just removed the last bit from mm_cpumask and potentially free the
mm.

Getting the locking right here could be a bit tricky -- you need to
avoid two CPUs simultaneously exiting lazy TLB and thinking they
should free the mm, and you also need to avoid an mm with mm_users
hitting zero concurrently with the last remote CPU using it lazily
exiting lazy TLB.  Perhaps this could be resolved by having mm_count
== 1 mean "mm_cpumask() is might contain bits and, if so, it owns the
mm" and mm_count == 0 meaning "now it's dead" and using some careful
cmpxchg or dec_return to make sure that only one CPU frees it.

Or maybe you'd need a lock or RCU for this, but the idea would be to
only ever take the lock after mm_users goes to zero.

--Andy
