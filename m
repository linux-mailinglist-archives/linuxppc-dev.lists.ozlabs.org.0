Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B2A332B6D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 17:06:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0S64z0Rz3cW1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 03:05:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dw0Rn4T50z3bPK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 03:05:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DFF21042;
 Tue,  9 Mar 2021 08:05:35 -0800 (PST)
Received: from C02TD0UTHF1T.local (unknown [10.57.49.159])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 032A13F71B;
 Tue,  9 Mar 2021 08:05:32 -0800 (PST)
Date: Tue, 9 Mar 2021 16:05:23 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
Message-ID: <20210309160505.GA4979@C02TD0UTHF1T.local>
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <20210304215448.GU29191@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304215448.GU29191@gate.crashing.org>
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
Cc: Marco Elver <elver@google.com>, Catalin Marinas <catalin.marinas@arm.com>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 04, 2021 at 03:54:48PM -0600, Segher Boessenkool wrote:
> Hi!

Hi Segher,

> On Thu, Mar 04, 2021 at 02:57:30PM +0000, Mark Rutland wrote:
> > It looks like GCC is happy to give us the function-entry-time FP if we use
> > __builtin_frame_address(1),
> 
> From the GCC manual:
>      Calling this function with a nonzero argument can have
>      unpredictable effects, including crashing the calling program.  As
>      a result, calls that are considered unsafe are diagnosed when the
>      '-Wframe-address' option is in effect.  Such calls should only be
>      made in debugging situations.
> 
> It *does* warn (the warning is in -Wall btw), on both powerpc and
> aarch64.  Furthermore, using this builtin causes lousy code (it forces
> the use of a frame pointer, which we normally try very hard to optimise
> away, for good reason).
> 
> And, that warning is not an idle warning.  Non-zero arguments to
> __builtin_frame_address can crash the program.  It won't on simpler
> functions, but there is no real definition of what a simpler function
> *is*.  It is meant for debugging, not for production use (this is also
> why no one has bothered to make it faster).
>
> On Power it should work, but on pretty much any other arch it won't.

I understand this is true generally, and cannot be relied upon in
portable code. However as you hint here for Power, I believe that on
arm64 __builtin_frame_address(1) shouldn't crash the program due to the
way frame records work on arm64, but I'll go check with some local
compiler folk. I agree that __builtin_frame_address(2) and beyond
certainly can, e.g.  by NULL dereference and similar.

For context, why do you think this would work on power specifically? I
wonder if our rationale is similar.

Are you aware of anything in particular that breaks using
__builtin_frame_address(1) in non-portable code, or is this just a
general sentiment of this not being a supported use-case?

> > Unless we can get some strong guarantees from compiler folk such that we
> > can guarantee a specific function acts boundary for unwinding (and
> > doesn't itself get split, etc), the only reliable way I can think to
> > solve this requires an assembly trampoline. Whatever we do is liable to
> > need some invasive rework.
> 
> You cannot get such a guarantee, other than not letting the compiler
> see into the routine at all, like with assembler code (not inline asm,
> real assembler code).

If we cannot reliably ensure this then I'm happy to go write an assembly
trampoline to snapshot the state at a function call boundary (where our
procedure call standard mandates the state of the LR, FP, and frame
records pointed to by the FP). This'll require reworking a reasonable
amount of code cross-architecture, so I'll need to get some more
concrete justification (e.g. examples of things that can go wrong in
practice).

> The real way forward is to bite the bullet and to no longer pretend you
> can do a full backtrace from just the stack contents.  You cannot.

I think what you mean here is that there's no reliable way to handle the
current/leaf function, right? If so I do agree.

Beyond that I believe that arm64's frame records should be sufficient.

Thanks,
Mark.
