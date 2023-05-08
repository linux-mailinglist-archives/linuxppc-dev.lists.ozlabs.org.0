Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 287296FB474
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 17:54:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFQnf6v46z3chl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 01:53:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oNYaQUT3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oNYaQUT3;
	dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFQmp63sNz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 01:53:12 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3f394fe5465so1833921cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683561188; x=1686153188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7an4MsU+A1D/BiDTLfn7jyyo8mReHeEE9qn6uLYEhzQ=;
        b=oNYaQUT3rQ4ijau0pTQQVlvIxM8K2nUnc3y4nk747J+Kx626kgonJH8zSTVraIag4V
         jHyq8slUEb/dTxfPJXjnDQcv7A05MwWo639bmustuj6KJZJY/QBiEpnL91N5wn/5U+ta
         xf0Thp4fZd5SmMFL65B8c+nMS8lGXkp5nyTXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683561188; x=1686153188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7an4MsU+A1D/BiDTLfn7jyyo8mReHeEE9qn6uLYEhzQ=;
        b=N1/tbL9akQ3iN0ENNhJKSY0OQJsw04yG8XntQdgJsoqezz2Tg7CLlKJR3eBc5VsdsV
         Ls4qEPHEfxIfUVna8M3DKqnnZfoYHi+jDoi2Ca+7ivtiHIAAMhfKSTtjGSW7HpRl8ZQO
         KcYi9t2aoyurs9lH+6Ys/+dhtoIUr6L0TTO5L5PPshAXg0/XCUvkgTLnWREBS1+ENM1m
         7rbErr61xGm7GNCQMV2988t+FQuMTdUeX7Qh+WEpj3zQC0oQ31VM+XnDn8MvjK9x4wLG
         Z+BN5KIbjybwisWit+FipNau+AcnKBiJvH8ekBVJ7mU8Pel1VZlZ7Wnc29HWojlryz/g
         03nw==
X-Gm-Message-State: AC+VfDzI6BaclznpPfzU+m8oFwuOB6ZEFOEa461Jm8i254bLdJjQdwCj
	i8B3q8CAZIS/srq3Y365h2GkJj3TBh9hFVg8y1A=
X-Google-Smtp-Source: ACHHUZ6OdmvHfMhRFDGpP92WQAr33+gfk4MdCUITjtIHWyOPu68lzVW8o/LniRukHD2zmz+IqY38JQ==
X-Received: by 2002:ac8:7f52:0:b0:3ef:5221:5710 with SMTP id g18-20020ac87f52000000b003ef52215710mr16916871qtk.47.1683561187845;
        Mon, 08 May 2023 08:53:07 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id s25-20020ac85299000000b003bf9f9f1844sm3030107qtn.71.2023.05.08.08.53.07
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 08:53:07 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-3f38824a025so248271cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 08:53:07 -0700 (PDT)
X-Received: by 2002:ac8:57c9:0:b0:3ef:3083:a437 with SMTP id
 w9-20020ac857c9000000b003ef3083a437mr518031qta.18.1683561166909; Mon, 08 May
 2023 08:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
 <CSDZSKA38AEF.FY7J3JXBJX4I@wheely> <CAD=FV=XDfbx3UaP7DV63tASE5Md7siS-EnORD_3T-4yYaEQ7ww@mail.gmail.com>
 <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
In-Reply-To: <CSGHQJAJHWVS.1UAJOF8P5UXSK@wheely>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 8 May 2023 08:52:35 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
Message-ID: <CAD=FV=WEp23wDm2=cFO66uSjqw1UfYSczGSrQh32DGiqHnUDkg@mail.gmail.com>
Subject: Re: [PATCH v4 13/17] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
To: Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, ravi.v.shankar@intel.com, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, Petr Mladek <pmladek@suse.com>, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linux
 ppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Sun, May 7, 2023 at 6:05=E2=80=AFPM Nicholas Piggin <npiggin@gmail.com> =
wrote:
>
> > No, I wasn't aware of it. Interesting, it seems to basically enable
> > both types of hardlockup detectors together. If that really catches
> > more lockups, it seems like we could do the same thing for the buddy
> > system.
>
> It doesn't catch more lockups. On powerpc we don't have a reliable
> periodic NMI hence the SMP checker. But it is preferable that a CPU
> detects its own lockup because NMI IPIs can result in crashes if
> they are taken in certain critical sections.

Ah, interesting. Is the fact that NMI IPIs can crash the system
something specific to the way they're implemented in powerpc, or is
this something common in Linux? I've been assuming that IPI NMIs would
be roughly as reliable (or perhaps more reliable) than the NMI
timer/perf counter.


> > > It's all to
> > > all rather than buddy which makes it more complicated but arguably
> > > bit better functionality.
> >
> > Can you come up with an example crash where the "all to all" would
> > work better than the simple buddy system provided by this patch?
>
> CPU2                     CPU3
> spin_lock_irqsave(A)     spin_lock_irqsave(B)
> spin_lock_irqsave(B)     spin_lock_irqsave(A)
>
> CPU1 will detect the lockup on CPU2, but CPU3's lockup won't be
> detected so we don't get the trace that can diagnose the bug.

Ah, that makes sense as a benefit if
"sysctl_hardlockup_all_cpu_backtrace" is false, which you'd probably
want if you had massively SMP systems. ...of course, if you had a lot
of cores then I'd imagine the "all-to-all" might become a lot of
overhead...

Hmmm, but I don't think you really need "all-to-all" checking to get
the stacktraces you want, do you? Each CPU can be "watching" exactly
one other CPU, but then when we actually lock up we could check all of
them and dump stacks on all the ones that are locked up. I think this
would be a fairly easy improvement for the buddy system. I'll leave it
out for now just to keep things simple for the initial landing, but it
wouldn't be hard to add. Then I think the two SMP systems  (buddy vs.
all-to-all) would be equivalent in terms of functionality?


Thinking about this more, I guess you must be assuming coordination
between the "SMP" and "non-SMP" checker. Specifically I guess you'd
want some guarantee that the "SMP" checker always fires before the
non-SMP checker because that would have a higher chance of getting a
stack trace without tickling the IPI NMI crash. ...but then once the
non-SMP checker printed its own stack trace you'd like the SMP checker
running on the same CPU to check to see if any other CPUs were locked
up so you could get their stacks as well. With my simplistic solution
of just allowing the buddy detector to be enabled in parallel with a
perf-based detector then we wouldn't have this level of coordination,
but I'll assume that's OK for the initial landing.


> Another thing I actually found it useful for is you can easily
> see if a core (i.e., all threads in the core) or a chip has
> died. Maybe more useful when doing presilicon and bring up work
> or firmware hacking, but still useful.

I'm probably biased, but for bringup work and stuff like this I
usually have kdb/kgdb enabled and then I could get stack traces for
whichever CPUs I want. :-P

-Doug
