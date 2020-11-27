Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 940DD2C5EA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 03:01:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChyY50ppjzDrDy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 13:01:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::543;
 helo=mail-ed1-x543.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Prtzor9M; dkim-atps=neutral
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChyW11F0TzDr9v
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 12:59:54 +1100 (AEDT)
Received: by mail-ed1-x543.google.com with SMTP id d18so4106435edt.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 17:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4R4b+iBzdCv3+ky4IRDHtZqAqs4VgHZwwe7NxwyTBQ=;
 b=Prtzor9MsjDSCxDvwphuYFPT55LllKoQtVSk7CBWAwYJJW6I4Y3gfu+I7KEbZOFi8o
 0jvbkIMznKPsGfk+FlZ6EMOCyks4f0lBEgtU1rNscUrKqjR63p1FU9j7tKL/7mGk3epc
 KRmsEcsr009Se/KOTkEVoo6voKySKz+/h6k8/xcwBcCH3JZJgbQ7MGOZEvPfbz+/KF0O
 0RqJLaN+2My0NsgJz4P7Y/xOZ2E80bK6GS4+h3DRE3WJ5TQoGZi69eSzzQ4PyAZ/QqOd
 +ar3wLkQTwuwSpU1kCFyCkvOSSAT4z/WpKnzw9ztsDpzQETUqXfBZXBqxV1l9inm4N/E
 CCcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4R4b+iBzdCv3+ky4IRDHtZqAqs4VgHZwwe7NxwyTBQ=;
 b=fNFGR9YA61Zejo28xrruVDQEPaVWl4+tsR3WW9Wpm8SEh872cU04tajWCb2vrMZPko
 SncdftISfKly7ekWKxUeG1S36j0F4Zu6zoW/eDP1mcvwE8ABtvjINyt/bqICIOujqAie
 Zz1c6OUm3SLGPgSVH7ACvv/fBEG3LyjDR0cSyHqBTcC83I98VlR68qsQbx0w88cIobQl
 k6vupPHRh5dWV3z7jQFgt8QETIL+gzuUzG4+2IuU011F/rbOendgyR4PTJSgaKL5BacJ
 Nz15wG1JpIgjJhhBVQzyu9XcOqI8949LcyPJXmie8vXJs4yqdzm2+zYaCM4hQSptEbOJ
 ZG1Q==
X-Gm-Message-State: AOAM531DmOzEMibL0CiNt6hWIt4uYvcFYrthp3Fft1gYMS1nqJKrZ0tA
 Vii9CX6m34lUhHV4KDWk1ssOJEMH0lPlQNvUuGnr
X-Google-Smtp-Source: ABdhPJy5B1N4NR8TD6EPrLX+qj9En4kQ1BjH7ZIskF/apRdDnIKvIdeugLhwUnbIBuCIM6eezBISd84fm++LII8LL0A=
X-Received: by 2002:a50:99d6:: with SMTP id n22mr5273583edb.261.1606442389564; 
 Thu, 26 Nov 2020 17:59:49 -0800 (PST)
MIME-Version: 1.0
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com> <87d0041vaf.fsf@mpe.ellerman.id.au>
 <20201123063432.GG2672@gate.crashing.org>
 <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
 <20201123195622.GI2672@gate.crashing.org>
 <CAGG=3QXR=Yfh8PNa4m-kQLTBP4YKD8OGm_6fSUgeasQ1ar9b2g@mail.gmail.com>
 <20201123200846.GJ2672@gate.crashing.org>
 <CAGG=3QUeXTU+8jqw40W_rhatsHCRiuTboL3enz9bpt_jaJC3TA@mail.gmail.com>
 <87zh37zaf4.fsf@mpe.ellerman.id.au>
 <CAGG=3QUSF4UwcZQHhFE-PW6As7GVJknsyGkgVMENDXghABzy5A@mail.gmail.com>
 <87ft4vy5jp.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ft4vy5jp.fsf@mpe.ellerman.id.au>
From: Bill Wendling <morbo@google.com>
Date: Thu, 26 Nov 2020 17:59:38 -0800
Message-ID: <CAGG=3QXzFvRACUpW5DXEhXU-GOdGux45zT-0QACe2zf=kZVCig@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 26, 2020 at 5:03 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Bill Wendling <morbo@google.com> writes:
> > On Mon, Nov 23, 2020 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >> Bill Wendling <morbo@google.com> writes:
> >> > On Mon, Nov 23, 2020 at 12:10 PM Segher Boessenkool
> >> > <segher@kernel.crashing.org> wrote:
> >> >> On Mon, Nov 23, 2020 at 12:01:01PM -0800, Bill Wendling wrote:
> >> >> > On Mon, Nov 23, 2020 at 11:58 AM Segher Boessenkool
> >> >> > <segher@kernel.crashing.org> wrote:
> >> >> > > > On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
> >> >> > > > <segher@kernel.crashing.org> wrote:
> >> >> > > > > "true" (as a result of a comparison) in as is -1, not 1.
> >> >> > >
> >> >> > > On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill Wendling wrote:
> >> >> > > > What Segher said. :-) Also, if you reverse the comparison, you'll get
> >> >> > > > a build error.
> >> >> > >
> >> >> > > But that means your patch is the wrong way around?
> >> >> > >
> >> >> > > -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> >> >> > > -       .error "Feature section else case larger than body";    \
> >> >> > > -       .endif;                                                 \
> >> >> > > +       .org . - ((label##4b-label##3b) > (label##2b-label##1b)); \
> >> >> > >
> >> >> > > It should be a + in that last line, not a -.
> >> >> >
> >> >> > I said so in a follow up email.
> >> >>
> >> >> Yeah, and that arrived a second after I pressed "send" :-)
> >> >>
> >> > Michael, I apologize for the churn with these patches. I believe the
> >> > policy is to resend the match as "v4", correct?
> >> >
> >> > I ran tests with the change above. It compiled with no error. If I
> >> > switch the labels around to ".org . + ((label##2b-label##1b) >
> >> > (label##4b-label##3b))", then it fails as expected.
> >>
> >> I wanted to retain the nicer error reporting for gcc builds, so I did it
> >> like this:
> >>
> >> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
> >> index b0af97add751..c4ad33074df5 100644
> >> --- a/arch/powerpc/include/asm/feature-fixups.h
> >> +++ b/arch/powerpc/include/asm/feature-fixups.h
> >> @@ -36,6 +36,24 @@ label##2:                                            \
> >>         .align 2;                                       \
> >>  label##3:
> >>
> >> +
> >> +#ifndef CONFIG_CC_IS_CLANG
> >> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
> >> +       .ifgt (else_size) - (body_size);                        \
> >> +       .error "Feature section else case larger than body";    \
> >> +       .endif;
> >> +#else
> >> +/*
> >> + * If we use the ifgt syntax above, clang's assembler complains about the
> >> + * expression being non-absolute when the code appears in an inline assembly
> >> + * statement.
> >> + * As a workaround use an .org directive that has no effect if the else case
> >> + * instructions are smaller than the body, but fails otherwise.
> >> + */
> >> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
> >> +       .org . + ((else_size) > (body_size));
> >> +#endif
> >> +
> >>  #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)          \
> >>  label##4:                                                      \
> >>         .popsection;                                            \
> >> @@ -48,9 +66,7 @@ label##5:                                                     \
> >>         FTR_ENTRY_OFFSET label##2b-label##5b;                   \
> >>         FTR_ENTRY_OFFSET label##3b-label##5b;                   \
> >>         FTR_ENTRY_OFFSET label##4b-label##5b;                   \
> >> -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> >> -       .error "Feature section else case larger than body";    \
> >> -       .endif;                                                 \
> >> +       CHECK_ALT_SIZE((label##4b-label##3b), (label##2b-label##1b)); \
> >>         .popsection;
> >>
> >>
> >>
> >> I've pushed a branch with all your patches applied to:
> >>
> >>   https://github.com/linuxppc/linux/commits/next-test
> >>
> > This works for me. Thanks!
>
> Great.
>
> >> Are you able to give that a quick test? It builds clean with clang for
> >> me, but we must be using different versions of clang because my branch
> >> already builds clean for me even without your patches.
> >>
> > You may need to set LLVM_IAS=1 to get the behavior I'm seeing. That
> > turns on clang's integrated assembler, which I think is disabled by
> > default.
>
> Yep that does it.
>
> But then I get:
>   clang: error: unsupported argument '-mpower4' to option 'Wa,'
>   clang: error: unsupported argument '-many' to option 'Wa,'
>
> So I guess I'm still missing something?
>
[Resent, because my previous email went out as non-plain text.]

I've seen that too. I'm not entirely sure what's causing it, but I'll
look into it. I've got a backlog of things to work on still. :-) It's
probably a clang issue. There's another one that came up having to do
with the format of some PPC instructions. I have a clang fix on review
for those.

> > Note that with clang's integrated assembler, arch/powerpc/boot/util.S
> > fails to compile. Alan Modra mentioned that he sent you a patch to
> > "modernize" the file so that clang can compile it.
>
> Ah you're right he did, it didn't go to patchwork so I missed it. Have
> grabbed it now.
>
Thanks!

-bw
