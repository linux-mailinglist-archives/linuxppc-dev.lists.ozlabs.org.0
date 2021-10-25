Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A4E4398C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 16:39:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HdHfW3Kf5z2ywk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Oct 2021 01:39:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=fFKP9rs4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=fFKP9rs4; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HdHdp0m0nz2xXC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 01:39:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=I97oc9kS0hxonuSgC18bwLyEuuHyR5BjA3g3cz+StFk=; b=fFKP9rs4D2Npzo47cjKm17xnDL
 mnZs+FfL6mBbrPRwuacU8oISILWxsnNi7ZuMz61CuSJ1QMPl2TQreluUzhkqRRUI4lBbEZXeaBO1s
 ZXMdk9jHBpFCtwxGqrYPvonpw/OV3jLOkrbqXgilnq7SCHNPEsrwy1fXol7lzJe2UqoHGQO447vOu
 QKLAo22Qs5t9oHPVsqjpMqrhsIEiimGViYptsdGGD98azVSz512YvOHfRB/OU7Vyn1E/bXZmZy5gf
 4k6cm+wWoq9NTCPkDo7Ma1V4LZuHP2S5ly8dVZqHdFX+ziR3TjYBNCJOOiY8z6Bt0rs6ou4GLgxIt
 c0F3H/XQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf12c-00GBQq-5S; Mon, 25 Oct 2021 14:34:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8B8163002AE;
 Mon, 25 Oct 2021 16:33:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6DE4F20C6C153; Mon, 25 Oct 2021 16:33:32 +0200 (CEST)
Date: Mon, 25 Oct 2021 16:33:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
Message-ID: <YXbAPIm47WwpYYup@hirez.programming.kicks-ass.net>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
 <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
 <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2Luz7sd5cM1OdZhYCs_UPzo+2qVQYSZPfR2QN+0DkyRg@mail.gmail.com>
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

On Mon, Oct 25, 2021 at 03:06:24PM +0200, Arnd Bergmann wrote:
> On Mon, Oct 25, 2021 at 11:57 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Sat, Oct 23, 2021 at 06:04:57PM +0200, Arnd Bergmann wrote:
> > > On Sat, Oct 23, 2021 at 3:37 AM Waiman Long <longman@redhat.com> wrote:
> > > >> On 10/22/21 7:59 AM, Arnd Bergmann wrote:
> > > > > From: Arnd Bergmann <arnd@arndb.de>
> > > > >
> > > > > As this is all dead code, just remove it and the helper functions built
> > > > > around it. For arch/ia64, the inline asm could be cleaned up, but
> > > > > it seems safer to leave it untouched.
> > > > >
> > > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > >
> > > > Does that mean we can also remove the GENERIC_LOCKBREAK config option
> > > > from the Kconfig files as well?
> > >
> > >  I couldn't figure this out.
> > >
> > > What I see is that the only architectures setting GENERIC_LOCKBREAK are
> > > nds32, parisc, powerpc, s390, sh and sparc64, while the only architectures
> > > implementing arch_spin_is_contended() are arm32, csky and ia64.
> > >
> > > The part I don't understand is whether the option actually does anything
> > > useful any more after commit d89c70356acf ("locking/core: Remove break_lock
> > > field when CONFIG_GENERIC_LOCKBREAK=y").
> >
> > Urgh, what a mess.. AFAICT there's still code in
> > kernel/locking/spinlock.c that relies on it. Specifically when
> > GENERIC_LOCKBREAK=y we seem to create _lock*() variants that are
> > basically TaS locks which drop preempt/irq disable while spinning.
> >
> > Anybody having this on and not having native TaS locks is in for a rude
> > surprise I suppose... sparc64 being the obvious candidate there :/
> 
> Is this a problem on s390 and powerpc, those two being the ones
> that matter in practice?
> 
> On s390, we pick between the cmpxchg() based directed-yield when
> running on virtualized CPUs, and a normal qspinlock when running on a
> dedicated CPU.
> 
> On PowerPC, we pick at compile-time between either the qspinlock
> (default-enabled on Book3S-64, i.e. all server chips) or a ll/sc based
> spinlock plus vm_yield() (default on embedded and 32-bit mac).

Urgh, yeah, so this crud undermines the whole point of having a fair
lock. I'm thinking s390 and Power want to have this fixed.
