Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B137632D95F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 19:23:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrzlC35prz3d53
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 05:23:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=QLchrPEA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::236;
 helo=mail-oi1-x236.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=QLchrPEA; dkim-atps=neutral
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drzkn0gC7z3cZk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 05:23:10 +1100 (AEDT)
Received: by mail-oi1-x236.google.com with SMTP id d20so31123603oiw.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 10:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lkt+RxNv+povx5RrP6jzx52eKkPT/gfUP+i0E22Jg6A=;
 b=QLchrPEA+a6QS6aiRdvhoLByBQL+eA7V84XmSHtcB6WIXYzejx295qXR9hkGGCOxof
 ygNURmcIvo45pqhjGCRVkQUEe5e1UIebSlhV1NiFQFyZ7bFAzsWFv4/kfPs3HVZvVQ8/
 23kUMCGcdaosoC5JaOrmY89Lp1Aa2lQaD24RlG866uIx//UUg89C5KCdz+kPt6vo/TBC
 IhBc9G4Rnk5/qAHEeCu1TDRoQ4TMxX0uYckqvkVuTltZlINktG4YjafERGWQxE7O2HjU
 mh4hcAMgGLMFmeVo+A4sBIs/CskR1hsTt7w3CyZ7eJzU5gm6M4LlIF56gAlgJOLVtBGc
 LfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lkt+RxNv+povx5RrP6jzx52eKkPT/gfUP+i0E22Jg6A=;
 b=Mq5hPAOWwtMXsKByOSC5BQ6Sr12VJPrsUmpUvhe410TWxXsjozDyS/e9iVgEPl7fey
 xCtKHGAHHQQJYzCaPfr6mmDvXm6giYzDbxd+Q8u1Xf0n5B9rYxfKczSnuqiC7aB2IiKs
 iqfqsTbEljm5kwe1oZVz3psJO65km2VZMxKXwt6iy5k6/Jx/r8pysE1o9hBzzPbWEykE
 xINC3Gm9LSoaiJDzQLPAPFQilDJP4N4AkJV+6X3GBv8c3IFCqqb3cbBF+3frOMzRjEMj
 L4LgRuFRW7LQgwMMmezthl0t1C83z83/0APWiZNxznJF0bVp3ncOQ8hBj489cSlcVN0F
 xUfg==
X-Gm-Message-State: AOAM5309aHVF0aNGTVCuPpAI6i9PaZ25iuMDWIY1HC2X+0odmxGxaoGV
 H+y6SHUE/GNwUsB/SGpY8rbGaZM3VPvxfI8zLgh/sw==
X-Google-Smtp-Source: ABdhPJyh0q8akJpCHSVQ8ANv6vpJ8HOAzihjMi3/13gzP7GpHLPwXR/wy1fi78187um6g6N+N5vR9hTDYM3y884RPgo=
X-Received: by 2002:a05:6808:10d3:: with SMTP id
 s19mr3999250ois.70.1614882185258; 
 Thu, 04 Mar 2021 10:23:05 -0800 (PST)
MIME-Version: 1.0
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
 <YEEYDSJeLPvqRAHZ@elver.google.com>
 <20210304180154.GD60457@C02TD0UTHF1T.local>
In-Reply-To: <20210304180154.GD60457@C02TD0UTHF1T.local>
From: Marco Elver <elver@google.com>
Date: Thu, 4 Mar 2021 19:22:53 +0100
Message-ID: <CANpmjNOZWuhqXATDjH3F=DMbpg2xOy0XppVJ+Wv2XjFh_crJJg@mail.gmail.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, broonie@kernel.org,
 Paul Mackerras <paulus@samba.org>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-toolchains@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 4 Mar 2021 at 19:02, Mark Rutland <mark.rutland@arm.com> wrote:
> On Thu, Mar 04, 2021 at 06:25:33PM +0100, Marco Elver wrote:
> > On Thu, Mar 04, 2021 at 04:59PM +0000, Mark Rutland wrote:
> > > On Thu, Mar 04, 2021 at 04:30:34PM +0100, Marco Elver wrote:
> > > > On Thu, 4 Mar 2021 at 15:57, Mark Rutland <mark.rutland@arm.com> wrote:
> > > > > [adding Mark Brown]
> > > > >
> > > > > The bigger problem here is that skipping is dodgy to begin with, and
> > > > > this is still liable to break in some cases. One big concern is that
> > > > > (especially with LTO) we cannot guarantee the compiler will not inline
> > > > > or outline functions, causing the skipp value to be too large or too
> > > > > small. That's liable to happen to callers, and in theory (though
> > > > > unlikely in practice), portions of arch_stack_walk() or
> > > > > stack_trace_save() could get outlined too.
> > > > >
> > > > > Unless we can get some strong guarantees from compiler folk such that we
> > > > > can guarantee a specific function acts boundary for unwinding (and
> > > > > doesn't itself get split, etc), the only reliable way I can think to
> > > > > solve this requires an assembly trampoline. Whatever we do is liable to
> > > > > need some invasive rework.
> > > >
> > > > Will LTO and friends respect 'noinline'?
> > >
> > > I hope so (and suspect we'd have more problems otherwise), but I don't
> > > know whether they actually so.
> > >
> > > I suspect even with 'noinline' the compiler is permitted to outline
> > > portions of a function if it wanted to (and IIUC it could still make
> > > specialized copies in the absence of 'noclone').
> > >
> > > > One thing I also noticed is that tail calls would also cause the stack
> > > > trace to appear somewhat incomplete (for some of my tests I've
> > > > disabled tail call optimizations).
> > >
> > > I assume you mean for a chain A->B->C where B tail-calls C, you get a
> > > trace A->C? ... or is A going missing too?
> >
> > Correct, it's just the A->C outcome.
>
> I'd assumed that those cases were benign, e.g. for livepatching what
> matters is what can be returned to, so B disappearing from the trace
> isn't a problem there.
>
> Is the concern debugability, or is there a functional issue you have in
> mind?

For me, it's just been debuggability, and reliable test cases.

> > > > Is there a way to also mark a function non-tail-callable?
> > >
> > > I think this can be bodged using __attribute__((optimize("$OPTIONS")))
> > > on a caller to inhibit TCO (though IIRC GCC doesn't reliably support
> > > function-local optimization options), but I don't expect there's any way
> > > to mark a callee as not being tail-callable.
> >
> > I don't think this is reliable. It'd be
> > __attribute__((optimize("-fno-optimize-sibling-calls"))), but doesn't
> > work if applied to the function we do not want to tail-call-optimize,
> > but would have to be applied to the function that does the tail-calling.
>
> Yup; that's what I meant then I said you could do that on the caller but
> not the callee.
>
> I don't follow why you'd want to put this on the callee, though, so I
> think I'm missing something. Considering a set of functions in different
> compilation units:
>
>   A->B->C->D->E->F->G->H->I->J->K

I was having this problem with KCSAN, where the compiler would
tail-call-optimize __tsan_X instrumentation. This would mean that
KCSAN runtime functions ended up in the trace, but the function where
the access happened would not. However, I don't care about the runtime
functions, and instead want to see the function where the access
happened. In that case, I'd like to just mark __tsan_X and any other
kcsan instrumentation functions as do-not-tail-call-optimize, which
would solve the problem.

The solution today is that when you compile a kernel with KCSAN, every
instrumented TU is compiled with -fno-optimize-sibling-calls. The
better solution would be to just mark KCSAN runtime functions somehow,
but permit tail calling other things. Although, I probably still want
to see the full trace, and would decide that having
-fno-optimize-sibling-calls is a small price to pay in a
debug-only-kernel to get complete traces.

> ... if K were marked in this way, and J was compiled with visibility of
> this, J would stick around, but J's callers might not, and so the a
> trace might see:
>
>   A->J->K
>
> ... do you just care about the final caller, i.e. you just need
> certainty that J will be in the trace?

Yes. But maybe it's a special problem that only sanitizers have.

> If so, we can somewhat bodge that by having K have an __always_inline
> wrapper which has a barrier() or similar after the real call to K, so
> the call couldn't be TCO'd.
>
> Otherwise I'd expect we'd probably need to disable TCO generally.

Thanks,
-- Marco
