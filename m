Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D962B43C925
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:02:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfS3s5Xcnz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 23:02:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JQ5dRRYa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfS3K4gNGz2xvf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 23:01:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=JQ5dRRYa; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HfS3D6fVvz4xbG;
 Wed, 27 Oct 2021 23:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1635336108;
 bh=eZo4L/VYResFxnSjYMuAe6p73rb/55QbmAx/d4+9tG4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JQ5dRRYao96n2QjnD9F5FAugsZopemn7Y8YqAmL2meL1PnI4mYsKSjfuExzvZpuA5
 fo98C/+hhHVxXiymFsgVUaNNU2OXZOe+c6bLZFJtrn3hoVRsK8UVbP9gK878GEbfPD
 VDvIrUapL3PKDDjCdUgv6N8Ux67vWT8CizDcTwrTHynUtV9jf15u69Gl+rLY036ixg
 zeY96EVJi9rErgfmwBI6fcGPd1tomYN/VkCpDGNVYTfs0wOrl9IkcGEvhuiGpQKYnb
 nfU4vnXu2gWqpvtG5V7u9/EXKXYSjwtZbh/n8+Hk2z9uQ9E8oJ+OXVuNanRAXRdn+r
 +hzmwqKHzlS9Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
In-Reply-To: <YXbAPIm47WwpYYup@hirez.programming.kicks-ass.net>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
 <YXbAPIm47WwpYYup@hirez.programming.kicks-ass.net>
Date: Wed, 27 Oct 2021 23:01:41 +1100
Message-ID: <87r1c6ad7e.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Peter Zijlstra <peterz@infradead.org> writes:
> On Mon, Oct 25, 2021 at 03:06:24PM +0200, Arnd Bergmann wrote:
>> On Mon, Oct 25, 2021 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
>> > On Sat, Oct 23, 2021 at 06:04:57PM +0200, Arnd Bergmann wrote:
>> > > On Sat, Oct 23, 2021 at 3:37 AM Waiman Long <longman@redhat.com> wrote:
>> > > >> On 10/22/21 7:59 AM, Arnd Bergmann wrote:
>> > > > > From: Arnd Bergmann <arnd@arndb.de>
>> > > > >
>> > > > > As this is all dead code, just remove it and the helper functions built
>> > > > > around it. For arch/ia64, the inline asm could be cleaned up, but
>> > > > > it seems safer to leave it untouched.
>> > > > >
>> > > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> > > >
>> > > > Does that mean we can also remove the GENERIC_LOCKBREAK config option
>> > > > from the Kconfig files as well?
>> > >
>> > >  I couldn't figure this out.
>> > >
>> > > What I see is that the only architectures setting GENERIC_LOCKBREAK are
>> > > nds32, parisc, powerpc, s390, sh and sparc64, while the only architectures
>> > > implementing arch_spin_is_contended() are arm32, csky and ia64.
>> > >
>> > > The part I don't understand is whether the option actually does anything
>> > > useful any more after commit d89c70356acf ("locking/core: Remove break_lock
>> > > field when CONFIG_GENERIC_LOCKBREAK=y").
>> >
>> > Urgh, what a mess.. AFAICT there's still code in
>> > kernel/locking/spinlock.c that relies on it. Specifically when
>> > GENERIC_LOCKBREAK=y we seem to create _lock*() variants that are
>> > basically TaS locks which drop preempt/irq disable while spinning.
>> >
>> > Anybody having this on and not having native TaS locks is in for a rude
>> > surprise I suppose... sparc64 being the obvious candidate there :/
>> 
>> Is this a problem on s390 and powerpc, those two being the ones
>> that matter in practice?
>> 
>> On s390, we pick between the cmpxchg() based directed-yield when
>> running on virtualized CPUs, and a normal qspinlock when running on a
>> dedicated CPU.
>> 
>> On PowerPC, we pick at compile-time between either the qspinlock
>> (default-enabled on Book3S-64, i.e. all server chips) or a ll/sc based
>> spinlock plus vm_yield() (default on embedded and 32-bit mac).
>
> Urgh, yeah, so this crud undermines the whole point of having a fair
> lock. I'm thinking s390 and Power want to have this fixed.

Our Kconfig has:

  config GENERIC_LOCKBREAK
  	bool
  	default y
  	depends on SMP && PREEMPTION

And we have exactly one defconfig that enables both SMP and PREEMPT,
arch/powerpc/configs/85xx/ge_imp3a_defconfig, which is some ~10 year old
PCI card embedded thing I've never heard of. High chance anyone who has
those is not running upstream kernels on them.

So I think we'd be happy for you rip GENERIC_LOCKBREAK out, it's almost
entirely unused on powerpc anyway.

cheers
