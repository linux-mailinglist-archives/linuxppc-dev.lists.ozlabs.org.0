Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B52439335
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 11:58:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hd9QF14yVz2yp5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Oct 2021 20:58:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=MBCIXeXh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hd9PS1ZRVz2xtP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Oct 2021 20:57:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=kBcBoUwV55Vzzvl24KD3p0ArPNxglJAR5S99vkQU21A=; b=MBCIXeXhf6eTBncr2QpHLUaYS7
 6G6hOzIwUql2vqiXbPvPa9A34kSeid/gzxP9EN8BQVKIOSUqesYOAciHBywhpFV3bEqT11li2ezNu
 zXx9DIsxagTnN0sBGW93C3YbKy15aQnc8uqykO8jv9JtgA7VFmGzMn4I4p3JH8gdxJP7oqeAJkvZK
 9hy4dbsx6zYQT7WBZKaHuQoTx6ibgTsFc6MJcGaipDs9afWbC+XldzOHN6X5mUvDpqD4/OWFj24A9
 qTxIRw6JiXreO28PuVyy/+uQk7JTwDJ6Zg/u5Y+Y7ul3SpvRSdBp1gBelToDOuKySSBC3ttwob/pS
 /4/6lXZQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mewjU-00C7ZM-Sf; Mon, 25 Oct 2021 09:57:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9A95B3002AE;
 Mon, 25 Oct 2021 11:57:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 74DE220C6C150; Mon, 25 Oct 2021 11:57:28 +0200 (CEST)
Date: Mon, 25 Oct 2021 11:57:28 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] locking: remove spin_lock_flags() etc
Message-ID: <YXZ/iLB7BvZtzDMp@hirez.programming.kicks-ass.net>
References: <20211022120058.1031690-1-arnd@kernel.org>
 <cc8e3c58-457d-fdf3-6a62-98bde0cefdea@redhat.com>
 <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a0YjaRS+aUCOKGjsfkR3TM49PrG6U4ftG_Fz+OFuyCb0w@mail.gmail.com>
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

On Sat, Oct 23, 2021 at 06:04:57PM +0200, Arnd Bergmann wrote:
> On Sat, Oct 23, 2021 at 3:37 AM Waiman Long <longman@redhat.com> wrote:
> >> On 10/22/21 7:59 AM, Arnd Bergmann wrote:
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > As this is all dead code, just remove it and the helper functions built
> > > around it. For arch/ia64, the inline asm could be cleaned up, but
> > > it seems safer to leave it untouched.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Does that mean we can also remove the GENERIC_LOCKBREAK config option
> > from the Kconfig files as well?
> 
>  I couldn't figure this out.
> 
> What I see is that the only architectures setting GENERIC_LOCKBREAK are
> nds32, parisc, powerpc, s390, sh and sparc64, while the only architectures
> implementing arch_spin_is_contended() are arm32, csky and ia64.
> 
> The part I don't understand is whether the option actually does anything
> useful any more after commit d89c70356acf ("locking/core: Remove break_lock
> field when CONFIG_GENERIC_LOCKBREAK=y").

Urgh, what a mess.. AFAICT there's still code in
kernel/locking/spinlock.c that relies on it. Specifically when
GENERIC_LOCKBREAK=y we seem to create _lock*() variants that are
basically TaS locks which drop preempt/irq disable while spinning.

Anybody having this on and not having native TaS locks is in for a rude
surprise I suppose... sparc64 being the obvious candidate there :/



