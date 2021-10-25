Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F2843972D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 15:07:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdFbw53wgz2yZf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 00:07:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rjOPvUdJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rjOPvUdJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdFbB5WMFz2xWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 00:06:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F297F61078
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 13:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635167203;
 bh=ZCuob8BZrhlG+EmJNscDR7p2oOKkE8Oq9/x5u4oFHEA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rjOPvUdJRFt+C9UNBEWqTe13JML4EB3zOwhCKERYPTuYIBCm/KanC0F8RaQduPrwV
 klq+bcLolRr9EV7XsqzAmolFYphiSWru24h6VEOLGs83iKRzsUfUDBqTnGm3Pik+c2
 ozYkc3H57UBl/Z+aThlgXRcvE+SI5/0MPsloo3IswAWMA6vfF9K+iVUPFleyhCoYsK
 erur4poO81/SfZJuaF7vy9Gb7SXgFWs44y7WHlUrfvcFIzyjGdYpJ4sm7cR+O50BK0
 ePMEwGIhpx+Eb/C4NNBwMUwqcxY2nzTAZD32gCk7H1xBMA3LMCcZ6HiaOmFasKK6KT
 haSe42j1LD+cQ==
Received: by mail-wm1-f41.google.com with SMTP id
 b133-20020a1c808b000000b0032ca4d18aebso9291707wmd.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 06:06:42 -0700 (PDT)
X-Gm-Message-State: AOAM532QkEJah7+CsKEy3INPQPmPtqTd2W2cu+8W/aLRvaOS2RdO2+Hm
 vR0wjBKLX1ozM3xY0aMrUytudHXmQU5k3tXDku4=
X-Google-Smtp-Source: ABdhPJzvjBncUZE2QFv7r8anYBis3Hwxw5+smqgbcmZGe49Rh+5b7Sf365AJDO4MLIyZVs8sWDAX066taTW3DQLxG28=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr19963769wmg.35.1635167201284; 
 Mon, 25 Oct 2021 06:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
In-Reply-To: <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Oct 2021 15:06:24 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
Message-ID: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: linux-ia64@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Openrisc <openrisc@lists.librecores.org>, Stafford Horne <shorne@gmail.com>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 25, 2021 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
> On Sat, Oct 23, 2021 at 06:04:57PM +0200, Arnd Bergmann wrote:
> > On Sat, Oct 23, 2021 at 3:37 AM Waiman Long <longman@redhat.com> wrote:
> > >> On 10/22/21 7:59 AM, Arnd Bergmann wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > As this is all dead code, just remove it and the helper functions built
> > > > around it. For arch/ia64, the inline asm could be cleaned up, but
> > > > it seems safer to leave it untouched.
> > > >
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > Does that mean we can also remove the GENERIC_LOCKBREAK config option
> > > from the Kconfig files as well?
> >
> >  I couldn't figure this out.
> >
> > What I see is that the only architectures setting GENERIC_LOCKBREAK are
> > nds32, parisc, powerpc, s390, sh and sparc64, while the only architectures
> > implementing arch_spin_is_contended() are arm32, csky and ia64.
> >
> > The part I don't understand is whether the option actually does anything
> > useful any more after commit d89c70356acf ("locking/core: Remove break_lock
> > field when CONFIG_GENERIC_LOCKBREAK=y").
>
> Urgh, what a mess.. AFAICT there's still code in
> kernel/locking/spinlock.c that relies on it. Specifically when
> GENERIC_LOCKBREAK=y we seem to create _lock*() variants that are
> basically TaS locks which drop preempt/irq disable while spinning.
>
> Anybody having this on and not having native TaS locks is in for a rude
> surprise I suppose... sparc64 being the obvious candidate there :/

Is this a problem on s390 and powerpc, those two being the ones
that matter in practice?

On s390, we pick between the cmpxchg() based directed-yield when
running on virtualized CPUs, and a normal qspinlock when running on a
dedicated CPU.

On PowerPC, we pick at compile-time between either the qspinlock
(default-enabled on Book3S-64, i.e. all server chips) or a ll/sc based
spinlock plus vm_yield() (default on embedded and 32-bit mac).

       Arnd
