Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A054512028A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 11:30:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47byFt4k8tzDqSK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 21:30:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="PQl9UUy0"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47byCf45xBzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2019 21:28:14 +1100 (AEDT)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7CFD206CB;
 Mon, 16 Dec 2019 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576492091;
 bh=aJNODjNlV3v54INi4VXe5H6gmqwl3DaOFDNd3U6oYJs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PQl9UUy06Hwnhc+WgyHD0YW0DQzVIQ3siJt9h2AJUf2ItnavgPY6wHx2lPr17QIQn
 pWJIbXf9wTMoC3M3VQX7GFymirkp4wWHUq5YB2bZkO1uOlk9b2v98++N2Cjd8ShJBl
 a4tkOdQpyWd0Yqop+KfyrtBhCC5RfjzevBWWVcHs=
Date: Mon, 16 Dec 2019 10:28:06 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
Message-ID: <20191213144359.GA3826@willie-the-truck>
References: <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
 <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
 <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 13, 2019 at 02:17:08PM +0100, Arnd Bergmann wrote:
> On Thu, Dec 12, 2019 at 9:50 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Thu, Dec 12, 2019 at 11:34 AM Will Deacon <will@kernel.org> wrote:
> > > The root of my concern in all of this, and what started me looking at it in
> > > the first place, is the interaction with 'typeof()'. Inheriting 'volatile'
> > > for a pointer means that local variables in macros declared using typeof()
> > > suddenly start generating *hideous* code, particularly when pointless stack
> > > spills get stackprotector all excited.
> >
> > Yeah, removing volatile can be a bit annoying.
> >
> > For the particular case of the bitops, though, it's not an issue.
> > Since you know the type there, you can just cast it.
> >
> > And if we had the rule that READ_ONCE() was an arithmetic type, you could do
> >
> >     typeof(0+(*p)) __var;
> >
> > since you might as well get the integer promotion anyway (on the
> > non-volatile result).
> >
> > But that doesn't work with structures or unions, of course.
> >
> > I'm not entirely sure we have READ_ONCE() with a struct. I do know we
> > have it with 64-bit entities on 32-bit machines, but that's ok with
> > the "0+" trick.
> 
> I'll have my randconfig builder look for instances, so far I found one,
> see below. My feeling is that it would be better to enforce at least
> the size being a 1/2/4/8, to avoid cases where someone thinks
> the access is atomic, but it falls back on a memcpy.

I've been using something similar built on compiletime_assert_atomic_type()
and I spotted another instance in the xdp code (xskq_validate_desc()) which
tries to READ_ONCE() on a 128-bit descriptor, although a /very/ quick read
of the code suggests that this probably can't be concurrently modified if
the ring indexes are synchronised properly.

However, enabling this for 32-bit ARM is total carnage; as Linus mentioned,
a whole bunch of code appears to be relying on atomic 64-bit access of
READ_ONCE(); the perf ring buffer, io_uring, the scheduler, pm_runtime,
cpuidle, ... :(

Unfortunately, at least some of these *do* look like bugs, but I can't see
how we can fix them, not least because the first two are user ABI afaict. It
may also be that in practice we get 2x32-bit stores, and that works out fine
when storing a 32-bit virtual address. I'm not sure what (if anything) the
compiler guarantees in these cases.

Will
