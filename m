Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE39832E79F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 13:05:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsRJs4bCrz3dLy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 23:05:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DsRJY0GW4z3cRd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 23:05:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F22531B;
 Fri,  5 Mar 2021 04:05:27 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.47.91])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B046D3F766;
 Fri,  5 Mar 2021 04:05:24 -0800 (PST)
Date: Fri, 5 Mar 2021 12:04:53 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210305120453.GA74705@C02TD0UTHF1T.local>
References: <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
 <YEEYDSJeLPvqRAHZ@elver.google.com>
 <20210304180154.GD60457@C02TD0UTHF1T.local>
 <CANpmjNOZWuhqXATDjH3F=DMbpg2xOy0XppVJ+Wv2XjFh_crJJg@mail.gmail.com>
 <20210304185148.GE60457@C02TD0UTHF1T.local>
 <CANpmjNMQNWBtWS7O_aaCfbMWvQUnzWTPXoxgD8DzqNzKfL_2Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMQNWBtWS7O_aaCfbMWvQUnzWTPXoxgD8DzqNzKfL_2Dg@mail.gmail.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-toolchains@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 08:01:29PM +0100, Marco Elver wrote:
> On Thu, 4 Mar 2021 at 19:51, Mark Rutland <mark.rutland@arm.com> wrote:
> > On Thu, Mar 04, 2021 at 07:22:53PM +0100, Marco Elver wrote:

> > > I was having this problem with KCSAN, where the compiler would
> > > tail-call-optimize __tsan_X instrumentation.
> >
> > Those are compiler-generated calls, right? When those are generated the
> > compilation unit (and whatever it has included) might not have provided
> > a prototype anyway, and the compiler has special knowledge of the
> > functions, so it feels like the compiler would need to inhibit TCO here
> > for this to be robust. For their intended usage subjecting them to TCO
> > doesn't seem to make sense AFAICT.
> >
> > I suspect that compilers have some way of handling that; otherwise I'd
> > expect to have heard stories of mcount/fentry calls getting TCO'd and
> > causing problems. So maybe there's an easy fix there?
> 
> I agree, the compiler builtins should be handled by the compiler
> directly, perhaps that was a bad example. But we also have "explicit
> instrumentation", e.g. everything that's in <linux/instrumented.h>.

True -- I agree for those we want similar, and can see a case for a
no-tco-calls-to-me attribute on functions as with noreturn.

Maybe for now it's worth adding prevent_tail_call_optimization() to the
instrument_*() call wrappers in <linux/instrumented.h>? As those are
__always_inline, that should keep the function they get inlined in
around. Though we probably want to see if we can replace the mb() in
prevent_tail_call_optimization() with something that doesn't require a
real CPU barrier.

[...]

> > I reckon for basically any instrumentation we don't want calls to be
> > TCO'd, though I'm not immediately sure of cases beyond sanitizers and
> > mcount/fentry.
> 
> Thinking about this more, I think it's all debugging tools. E.g.
> lockdep, if you lock/unlock at the end of a function, you might tail
> call into lockdep. If the compiler applies TCO, and lockdep determines
> there's a bug and then shows a trace, you'll have no idea where the
> actual bug is. The kernel has lots of debugging facilities that add
> instrumentation in this way. So perhaps it's a general debugging-tool
> problem (rather than just sanitizers).

This makes sense to me.

Thanks,
Mark.
