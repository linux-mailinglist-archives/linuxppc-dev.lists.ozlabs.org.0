Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D17B1DDA2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 00:25:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Skht745yzDqw9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 08:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=W+8Ptz9t; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SkfS5XRxzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 08:23:28 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id t8so1923059pju.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 15:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yCV7YGOue6+HEZJnM2j50Jm1kKfGwuf3awt8ZBhkBDo=;
 b=W+8Ptz9t6amr9JKLjhknLd9LA+oVVFTyrbZR9dxbeoYnH7DvamTW+77cyrdXjkjvyT
 iGXKjMz8FIzXpzuQPXewhCUIwC5SYwmxbBu8dgLGKUjKIrsauPJTyIRPAmXQjlRVT0ur
 HNAajvK2opVkr4Uw4eP2oogixZvxeLs6sMVy9bxGl3J7Ldk3NQo3adAlsneYcrwxqLX7
 S4RSVMDtiaiGYgL7SsNG3vqIXIr4687YFYr/MZdLGNkEhc6lCqTJ/soP1kvr977YCNT1
 qseVmUciojVDdSdriw9rWEJFX2Xvg3RrB+1n4p2+cHZDYOEVq901HsaEdZjIuSOSI1XS
 LpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yCV7YGOue6+HEZJnM2j50Jm1kKfGwuf3awt8ZBhkBDo=;
 b=j9EiYKDykCldsZGNeUB/jLt7zRlSVLD500ccOo2vpsD8lWW505/PbX1iQXkTAQg3H9
 0DzOL8DbjsVCUmOu02EmRK50XhOdtPUrFQxCrbQibJswxXa5yi0TQPpnnysTu0zIjv/M
 dc+4AYw8RUknt1Oh2tvra2NR7SawbXCMubw4py81oHTmIzj2ON8SycGSZ4GPsZAH8hHM
 ZrxJmximJ10w4j+ZqiwPoqpDKZ/opZHFrbyeEcX7CYTJ12USufahIXCVB4T21eTbnTen
 6z/g1zGkEpJWAEdlvfiNhzDD7w0rigWYpAmFjSt7v3UWGoeCuoai37isJkWDVBcR6WEv
 IsaQ==
X-Gm-Message-State: AOAM531oS0ZYsy6fo+r4BSSSgf35Ymd86GKheXugn5YGj4uP6OLeW2Td
 dECU8/PtOWWs6lMidRXFMZJRDqNAErvstF69SuVE3A==
X-Google-Smtp-Source: ABdhPJwjt5wsg+vvcnlqkrRiUF/M3wjd4ldvxRdTs7T/INV1Wxb6v0UqkM4/ozMyqwj5SGxm2Gn6aj14UUEBR+njBUg=
X-Received: by 2002:a17:90b:19cc:: with SMTP id
 nm12mr734050pjb.25.1590099804438; 
 Thu, 21 May 2020 15:23:24 -0700 (PDT)
MIME-Version: 1.0
References: <ClangBuiltLinux/continuous-integration+164415390+broken@travis-ci.com>
 <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
 <CAKwvOdmendjEgurRBAyi4R0rDZRdwfHjddS_pfOQ6761XiiFMA@mail.gmail.com>
 <87d07fcdee.fsf@mpe.ellerman.id.au>
 <CAKwvOdn0Spc15v3WUE_rdrb5UvaTXmOvjEJOsD7ahktQOwQk+A@mail.gmail.com>
 <20200520010148.GA3327346@ubuntu-s3-xlarge-x86>
 <87r1vdh28z.fsf@mpe.ellerman.id.au>
In-Reply-To: <87r1vdh28z.fsf@mpe.ellerman.id.au>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 21 May 2020 15:23:11 -0700
Message-ID: <CAKwvOdn_rNgPERgUfBgGywbyRBdSoEbQCaBO1o7fgqkMcCYXqQ@mail.gmail.com>
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432
 (master - 0aceafc)
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: clang-built-linux <clang-built-linux@googlegroups.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 6:00 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > On Tue, May 19, 2020 at 05:56:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> >> Looks like our CI is still red from this:
> >>
> >> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/166854584
> >>
> >> Filing a bug to follow up on:
> >> https://github.com/ClangBuiltLinux/linux/issues/1031
> >>
> >> On Thu, May 7, 2020 at 8:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> >
> >> > Nick Desaulniers <ndesaulniers@google.com> writes:
> >> > > Looks like ppc64le powernv_defconfig is suddenly failing the locking
> >> > > torture tests, then locks up?
> >> > > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/329211572#L3111-L3167
> >> > > Any recent changes related here in -next?  I believe this is the first
> >> > > failure, so I'll report back if we see this again.
> >> >
> >> > Thanks for the report.
> >> >
> >> > There's nothing newly in next-20200507 that seems related.
> ...
> >
> > This is probably still a manifestation of
> > https://github.com/ClangBuiltLinux/continuous-integration/issues/262
> > because rekicking the tests usually fixes it.

I thought we had upgraded our version of QEMU in response to this already?
https://github.com/ClangBuiltLinux/dockerimage/pull/44
https://github.com/ClangBuiltLinux/dockerimage/pull/46

>
> Oh yep.
>
> I was looking at the RCU warning, which I still don't understand, but
> the lockup is presumably the same problem you hit with interrupts being
> lost.
>
> > We should probably just disable the torture tests like we do for x86_64
> > for CI because we do not have access to QEMU 5.0.0 where this should be
> > fixed. I believe it is slated for 4.2.1 as well but we still have to
> > wait for that to be updated and packaged in Ubuntu.
>
> You just need to start building Qemu HEAD as part of your CI ;)

LOL
https://github.com/ClangBuiltLinux/dockerimage/pull/46#pullrequestreview-395639442
Yeah I think the hard part for all these dependendencies is the risk
of living on the edge of "top of tree" for all of them, and trying to
control for some by using stable releases.  May not always be
possible.
-- 
Thanks,
~Nick Desaulniers
