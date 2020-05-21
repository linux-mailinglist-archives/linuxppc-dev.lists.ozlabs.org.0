Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D89631DDAA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 01:01:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SlV96R3fzDqxV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 09:01:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rW+GFyQS; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SlSD53fgzDql5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 08:59:40 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id b12so3596961plz.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 15:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=YrQHVbAXqdzSr3CR4avaCtFvuJDkrcGK/g6dWnZCDtY=;
 b=rW+GFyQSJAVAE8OyDo2g5kSFLsHxZzVt4tYU3TCfYng8iXLeV4j6vfvjzQx6J/1w70
 uQdeFlfSlLeCgCcn6odfqw1pKmMbMFZ06QFzv4q2KnG2Cptg5PinkOgnBciSRH7FaOkW
 iQenUs22pXRSQepwMb7qxJ/vet9HqCEeSA9ep9SxKYrzdG23JmObor/f/GajnsLFTvnR
 pcO1/salUeockjw5rRtIAstRW729R8fER5wejOh2ZciYWQ2auyN7fIfrCN82mF/rV2ZU
 VjnSQZzZHSmpFxp/RMGxntZSaZ+5PNIKjYH/+6xGkGlXNeZmOQah4hXLDxAnyDXtPDRk
 LMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YrQHVbAXqdzSr3CR4avaCtFvuJDkrcGK/g6dWnZCDtY=;
 b=q1e/VUXQyl/1V+pWseF51J619fMGs3XgHK/foB1o+RCpQC3uiPOGo3KEf3ag91X6YN
 cwrIGoLADm9OoN2CVPs1M1ZZRSsJKPtqQK0Ct2Zr/Cb/fjB2FGGTN8VZ3AcjJJdgbuvV
 M7qgcwhEeHi09+c+o2MIdd2asK5r0U+aWTYflJCX8z8hUj+OmbP3dbJ1W3GKtqtWDgJK
 VP5wRKttfhLvKWgOc3FoiFc8r5F/PPyjzFzDZXv5L7NCZ1EEcR0KgpseKoeSe03LnUFA
 eRUFknrFK80VrkI8DTCk+KpWqzRsHvgoC/XLgZhFBvTMIXWaW6oECogEpylKNUzbr7m9
 1kVA==
X-Gm-Message-State: AOAM531QraaNd67NFQr3/DAnV5NKEiXFNn8+ZaJC1A7tdpEaltHIsmdK
 silIHZWWmhaoi6Fym5d7KTATh4nI
X-Google-Smtp-Source: ABdhPJwiRYVzfcGoQkXfyEfWK/I8mGuHnEB6DIFulolxKwR4AHH9VzMfExfMyI5l/nrZctOCvcaS6Q==
X-Received: by 2002:a17:90a:ea90:: with SMTP id
 h16mr829557pjz.169.1590101977385; 
 Thu, 21 May 2020 15:59:37 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id p30sm4576951pgn.58.2020.05.21.15.59.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 May 2020 15:59:36 -0700 (PDT)
Date: Thu, 21 May 2020 15:59:34 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#1432
 (master - 0aceafc)
Message-ID: <20200521225934.GA1592876@ubuntu-s3-xlarge-x86>
References: <ClangBuiltLinux/continuous-integration+164415390+broken@travis-ci.com>
 <5eb43a0c8d43d_13fb5db924ca0104770@travis-pro-tasks-6cc9887df6-4zmjd.mail>
 <CAKwvOdmendjEgurRBAyi4R0rDZRdwfHjddS_pfOQ6761XiiFMA@mail.gmail.com>
 <87d07fcdee.fsf@mpe.ellerman.id.au>
 <CAKwvOdn0Spc15v3WUE_rdrb5UvaTXmOvjEJOsD7ahktQOwQk+A@mail.gmail.com>
 <20200520010148.GA3327346@ubuntu-s3-xlarge-x86>
 <87r1vdh28z.fsf@mpe.ellerman.id.au>
 <CAKwvOdn_rNgPERgUfBgGywbyRBdSoEbQCaBO1o7fgqkMcCYXqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn_rNgPERgUfBgGywbyRBdSoEbQCaBO1o7fgqkMcCYXqQ@mail.gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 03:23:11PM -0700, Nick Desaulniers wrote:
> On Thu, May 21, 2020 at 6:00 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Nathan Chancellor <natechancellor@gmail.com> writes:
> > > On Tue, May 19, 2020 at 05:56:32PM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> > >> Looks like our CI is still red from this:
> > >>
> > >> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/builds/166854584
> > >>
> > >> Filing a bug to follow up on:
> > >> https://github.com/ClangBuiltLinux/linux/issues/1031
> > >>
> > >> On Thu, May 7, 2020 at 8:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> > >> >
> > >> > Nick Desaulniers <ndesaulniers@google.com> writes:
> > >> > > Looks like ppc64le powernv_defconfig is suddenly failing the locking
> > >> > > torture tests, then locks up?
> > >> > > https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/329211572#L3111-L3167
> > >> > > Any recent changes related here in -next?  I believe this is the first
> > >> > > failure, so I'll report back if we see this again.
> > >> >
> > >> > Thanks for the report.
> > >> >
> > >> > There's nothing newly in next-20200507 that seems related.
> > ...
> > >
> > > This is probably still a manifestation of
> > > https://github.com/ClangBuiltLinux/continuous-integration/issues/262
> > > because rekicking the tests usually fixes it.
> 
> I thought we had upgraded our version of QEMU in response to this already?
> https://github.com/ClangBuiltLinux/dockerimage/pull/44
> https://github.com/ClangBuiltLinux/dockerimage/pull/46

That was more of a bandaid than an actual fix. It happens a lot less
often with QEMU 4.2.0 but I could still reproduce that hang very
sparingly with the POWER9 machines on it. My machines are way more
powerful than the ones on Travis, which I am sure factors into that.
the hang with the POWER9 machines very sparingly with QEMU 4.2.0 but

The real solution is to upgrade to QEMU 5.0.0, which we could probably
do via a PPA (or through our Docker image), or wait for QEMU 4.2.1,
which should hopefully have that fix since it was CC'd for QEMU stable.

> >
> > Oh yep.
> >
> > I was looking at the RCU warning, which I still don't understand, but
> > the lockup is presumably the same problem you hit with interrupts being
> > lost.
> >
> > > We should probably just disable the torture tests like we do for x86_64
> > > for CI because we do not have access to QEMU 5.0.0 where this should be
> > > fixed. I believe it is slated for 4.2.1 as well but we still have to
> > > wait for that to be updated and packaged in Ubuntu.
> >
> > You just need to start building Qemu HEAD as part of your CI ;)
> 
> LOL
> https://github.com/ClangBuiltLinux/dockerimage/pull/46#pullrequestreview-395639442
> Yeah I think the hard part for all these dependendencies is the risk
> of living on the edge of "top of tree" for all of them, and trying to
> control for some by using stable releases.  May not always be
> possible.

Unfortunately, we are at the mercy of a bunch of different parties. If
only we had a ClangBuiltLinux build server that we maintained...

Cheers,
Nathan
