Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B08164515
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 14:13:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Myp44dK2zDqfb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 00:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Myht6LbBzDqcX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 00:08:46 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 01JD8ATq027345;
 Wed, 19 Feb 2020 07:08:10 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 01JD88xt027342;
 Wed, 19 Feb 2020 07:08:08 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 19 Feb 2020 07:08:08 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Surprising code generated for vdso_read_begin()
Message-ID: <20200219130808.GU22482@gate.crashing.org>
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <bd4557a7-9715-59aa-5d8e-488c5e516a98@c-s.fr>
 <20200109200733.GS3191@gate.crashing.org>
 <77a8bf25-6615-6c0a-56d4-eae7aa8a8f09@c-s.fr>
 <20200111113328.GX3191@gate.crashing.org>
 <CAK8P3a11wX1zJ+TAacDTkYsrzvfdVmNrcB6OC23aFvCxF57opQ@mail.gmail.com>
 <305fcee5-2e1b-ea4d-9a2a-a0e8034d40a8@c-s.fr>
 <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a0SfCwP04CJPThCuDmngGhwtejN8Px_UQpSwi=s_ww=bw@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 19, 2020 at 10:52:16AM +0100, Arnd Bergmann wrote:
> On Wed, Feb 19, 2020 at 9:45 AM Christophe Leroy
> <christophe.leroy@c-s.fr> wrote:
> > Le 16/02/2020 à 19:10, Arnd Bergmann a écrit :
> > > On Sat, Jan 11, 2020 at 12:33 PM Segher Boessenkool
> > > <segher@kernel.crashing.org> wrote:
> > >>
> > >> On Fri, Jan 10, 2020 at 07:45:44AM +0100, Christophe Leroy wrote:
> > >>> Le 09/01/2020 à 21:07, Segher Boessenkool a écrit :
> > >>>> It looks like the compiler did loop peeling.  What GCC version is this?
> > >>>> Please try current trunk (to become GCC 10), or at least GCC 9?
> > >>>
> > >>> It is with GCC 5.5
> > >>>
> > >>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ doesn't have more
> > >>> recent than 8.1
> > >>
> > >> Arnd, can you update the tools?  We are at 8.3 and 9.2 now :-)  Or is
> > >> this hard and/or painful to do?
> > >
> > > To follow up on this older thread, I have now uploaded 6.5, 7.5, 8.3 and 9.2
> > > binaries, as well as a recent 10.0 snapshot.
> > >
> >
> > Thanks Arnd,
> >
> > I have built the VDSO with 9.2, I get less performant result than with
> > 8.2 (same performance as with 5.5).
> >
> > After a quick look, I see:
> > - Irrelevant NOPs to align loops and stuff, allthough -mpcu=860 should
> > avoid that.
> > - A stack frame is set for saving r31 in __c_kernel_clock_gettime. GCC
> > 8.1 don't need that, all VDSO functions are frameless with 8.1
> 
> If you think it should be fixed in gcc, maybe try to reproduce it in
> https://godbolt.org/

(Feel free to skip this step; and don't put links to godbolt (or anything
else external) in our bugzilla, please; such links go stale before you
know it.)

> and open a gcc bug against that.

Yes please :-)

> Also, please try the gcc-10 snapshot, which has the highest chance
> of getting fixes if it shows the same issue (or worse).

If it is a regression, chances are it will be backported.  (But not to
9.3, which is due in just a few weeks, just like 8.4).  If it is just a
side effect of some other change, it will probably *not* be undone, not
on trunk (GCC 10) either.  It depends.

But sure, always test trunk if you can.


Segher
