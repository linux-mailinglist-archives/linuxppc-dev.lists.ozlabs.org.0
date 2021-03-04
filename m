Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A228532D909
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 18:55:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drz6j4pKDz3d8v
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 04:55:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=U51rv4zp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=U51rv4zp; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drz6H20vQz3cXY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 04:55:00 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id f1so44693922lfu.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 09:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FYzGpTewhxHxL7CpcepbC9L9ykWvrUtL+K0xz4SbvmU=;
 b=U51rv4zpBK86lIfGRkTUAlvQqBCWAyLeojeIdsRGl2dxMbLRu1PBgHvwQy2RAlDHGS
 qS95kFnaphLP7itFtdaZV7DD1nsen8f+JhImMQpAhLZG8qUpDZULwh9eDoCKAArsemLI
 9UnBzTRoUe0UVj57BSVi22s7dx6bM1/vbMcIR/FUonD1VZlUC16b1aFbgm8U+XpXciOY
 7n1p/D7SALszYOuW+BmXU3FKIHhJJLXOSAflaMzSFM8wNGBfP6mXixU6n1IktuHAHFH/
 eSSyz8RFBx7y5FWRMYtxK+X00wKN/qDTaSkmYqBWEA1gg8vbtwLkOJxNmU4SWeaKq9p8
 7Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FYzGpTewhxHxL7CpcepbC9L9ykWvrUtL+K0xz4SbvmU=;
 b=NJggvSW0cCO65a6QSyupqmGRbtTTx5Xeb0U/6mi3O8pWSvsA6xgU5sX0iXkBI28oxc
 /uU9E+t0OmQvfK5acjMa/DzVbkEnbYDsZWKNW+J0WAQksAF6q+kkEha0F8AXoGsQmh74
 1ayDL2vD/EpOhudFi4tfcZySL5b52UQXFdVH8c5+r8nXVisfUjJS3PwiPdaK++VkSvAP
 gLH4tiP+PKPinj+TdlfBCc0T7AblymL8Nynkz3GXOniR+3R73VFr3rAj8hWCNr9rqwUb
 YFZZPOrVl++O0DPZRVv/rXsWelHaVkau2TC+oIOn3h+vRLr8DcgVneK81Z0Q06tAdeWj
 oevg==
X-Gm-Message-State: AOAM532OhsK2QjOmnnIGonlJTygZPVlfuG0wpSA837hHBCCClSf/aRtQ
 vO90+70KNmgvg3hGhadDSijyBnryrS5ETUOwdTngaw==
X-Google-Smtp-Source: ABdhPJw6y3taoMD+qAv4h6sTee2Uebo0oTqIZqHuTrRDhVFPJbpn8vlXeZVwpQ4xCPi5BFtzV+p3/G8B2K76LrtsUzk=
X-Received: by 2002:ac2:532c:: with SMTP id f12mr3178752lfh.73.1614880495105; 
 Thu, 04 Mar 2021 09:54:55 -0800 (PST)
MIME-Version: 1.0
References: <e2e8728c4c4553bbac75a64b148e402183699c0c.1614780567.git.christophe.leroy@csgroup.eu>
 <CANpmjNOvgbUCf0QBs1J-mO0yEPuzcTMm7aS1JpPB-17_LabNHw@mail.gmail.com>
 <1802be3e-dc1a-52e0-1754-a40f0ea39658@csgroup.eu>
 <YD+o5QkCZN97mH8/@elver.google.com>
 <20210304145730.GC54534@C02TD0UTHF1T.local>
 <CANpmjNOSpFbbDaH9hNucXrpzG=HpsoQpk5w-24x8sU_G-6cz0Q@mail.gmail.com>
 <20210304165923.GA60457@C02TD0UTHF1T.local>
 <YEEYDSJeLPvqRAHZ@elver.google.com>
In-Reply-To: <YEEYDSJeLPvqRAHZ@elver.google.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 4 Mar 2021 09:54:44 -0800
Message-ID: <CAKwvOd=wBArMwvtDC8zV-QjQa5UuwWoxksQ8j+hUCZzbEAn+Fw@mail.gmail.com>
Subject: Re: [PATCH v1] powerpc: Include running function as first entry in
 save_stack_trace() and friends
To: Marco Elver <elver@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Paul Mackerras <paulus@samba.org>, kasan-dev <kasan-dev@googlegroups.com>,
 linux-toolchains@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 4, 2021 at 9:42 AM Marco Elver <elver@google.com> wrote:
>
> On Thu, Mar 04, 2021 at 04:59PM +0000, Mark Rutland wrote:
> > On Thu, Mar 04, 2021 at 04:30:34PM +0100, Marco Elver wrote:
> > > On Thu, 4 Mar 2021 at 15:57, Mark Rutland <mark.rutland@arm.com> wrote:
> > > > [adding Mark Brown]
> > > >
> > > > The bigger problem here is that skipping is dodgy to begin with, and
> > > > this is still liable to break in some cases. One big concern is that
> > > > (especially with LTO) we cannot guarantee the compiler will not inline
> > > > or outline functions, causing the skipp value to be too large or too
> > > > small. That's liable to happen to callers, and in theory (though
> > > > unlikely in practice), portions of arch_stack_walk() or
> > > > stack_trace_save() could get outlined too.
> > > >
> > > > Unless we can get some strong guarantees from compiler folk such that we
> > > > can guarantee a specific function acts boundary for unwinding (and
> > > > doesn't itself get split, etc), the only reliable way I can think to
> > > > solve this requires an assembly trampoline. Whatever we do is liable to
> > > > need some invasive rework.
> > >
> > > Will LTO and friends respect 'noinline'?
> >
> > I hope so (and suspect we'd have more problems otherwise), but I don't
> > know whether they actually so.
> >
> > I suspect even with 'noinline' the compiler is permitted to outline
> > portions of a function if it wanted to (and IIUC it could still make
> > specialized copies in the absence of 'noclone').
> >
> > > One thing I also noticed is that tail calls would also cause the stack
> > > trace to appear somewhat incomplete (for some of my tests I've
> > > disabled tail call optimizations).
> >
> > I assume you mean for a chain A->B->C where B tail-calls C, you get a
> > trace A->C? ... or is A going missing too?
>
> Correct, it's just the A->C outcome.
>
> > > Is there a way to also mark a function non-tail-callable?
> >
> > I think this can be bodged using __attribute__((optimize("$OPTIONS")))
> > on a caller to inhibit TCO (though IIRC GCC doesn't reliably support
> > function-local optimization options), but I don't expect there's any way
> > to mark a callee as not being tail-callable.
>
> I don't think this is reliable. It'd be
> __attribute__((optimize("-fno-optimize-sibling-calls"))), but doesn't
> work if applied to the function we do not want to tail-call-optimize,
> but would have to be applied to the function that does the tail-calling.
> So it's a bit backwards, even if it worked.
>
> > Accoding to the GCC documentation, GCC won't TCO noreturn functions, but
> > obviously that's not something we can use generally.
> >
> > https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes

include/linux/compiler.h:246:
prevent_tail_call_optimization

commit a9a3ed1eff36 ("x86: Fix early boot crash on gcc-10, third try")

>
> Perhaps we can ask the toolchain folks to help add such an attribute. Or
> maybe the feature already exists somewhere, but hidden.
>
> +Cc linux-toolchains@vger.kernel.org
>
> > > But I'm also not sure if with all that we'd be guaranteed the code we
> > > want, even though in practice it might.
> >
> > True! I'd just like to be on the least dodgy ground we can be.
>
> It's been dodgy for a while, and I'd welcome any low-cost fixes to make
> it less dodgy in the short-term at least. :-)
>
> Thanks,
> -- Marco



-- 
Thanks,
~Nick Desaulniers
