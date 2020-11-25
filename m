Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A402C3865
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 06:16:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgpy70nhLzDqWr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:15:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=rZg90c7i; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgpwF4DSGzDqNN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 16:14:18 +1100 (AEDT)
Received: by mail-ej1-x644.google.com with SMTP id gj5so1194292ejb.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 21:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4tlokv7oJNF7EFCi1VI0Def0yc29uKnnsPIgZygOd+w=;
 b=rZg90c7ipE09vr6/rliJ5Bx5Ag3rpwss5yvkjl/UBUYwyhnPDvxgtTiE3V2h/rH6f/
 /xtHc7UtQxXud0w7dUihSUzkeJ5JX7fPIMABdvOfCJ+rJggcMMSfoJGMmGuBpKN/zevR
 wtrQNjOusHZoogP7CX2QHGUAzkWjrWEfW+QrFhdkAiGmBFnZ4pWcpW+YqSVzF7o38y6W
 7PjemCRPVcn2YjJweuoAFD75DmlBb0Aa5vHYoKB/7egoFGyLIZfRdvkLw4walPczT7Gf
 0lPQki94MMl5pB3zyitSIMb6EH3k3osoh7hx17KM60LvJyx22IHYDi6sToiB7sC5JQrd
 ulJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4tlokv7oJNF7EFCi1VI0Def0yc29uKnnsPIgZygOd+w=;
 b=RWbv7yy9Z0TucATwsURPEGiZAoAPml4TmJz8PVpDObZnLVTzRF93Vn51Uqkxpz8imQ
 XkkjNntjv/zo0bh9dUQiNwHfQ4M/Oqrv4AxS80QG3qg+tucNCYWsm/0Pr1rxxF8nJuaR
 65Mnx7EMlXvNj+6bqGaJyFoPTc1cw4zaNM70KXmaXWETVt0h4S7f1ZDLnTMqORyHz3TV
 mtxH2ukxsKtMkG/ygVt3j3SbUSSsanBv/5yskcRzV2bVgXk2nks+g6R2QEjBEFJKrKvQ
 joqQrSzUJcxqJXQ24GNC0V5e/JdLW5eQy+8NMRtjA7tD0D0med2fV4gSaPR7U4tA0u2V
 p0Iw==
X-Gm-Message-State: AOAM531uD4MvUz+0xIccjFXu+2bf6TkGccw3kYryBplcj/pJJiDVLskV
 T63VMD3DSqOP6iB1j2k24V9SPHUqwZMVQ2OVz0+Z
X-Google-Smtp-Source: ABdhPJy1FYren3Dvcc2xEwRcZtg0UFhfh8mOln0jaIumB3scwVGN/JkowNGh/fCN154uYWRSIy2q+W3RYoQGheACXUc=
X-Received: by 2002:a17:906:5a8f:: with SMTP id
 l15mr1615414ejq.419.1606281251218; 
 Tue, 24 Nov 2020 21:14:11 -0800 (PST)
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
In-Reply-To: <87zh37zaf4.fsf@mpe.ellerman.id.au>
From: Bill Wendling <morbo@google.com>
Date: Tue, 24 Nov 2020 21:13:59 -0800
Message-ID: <CAGG=3QUSF4UwcZQHhFE-PW6As7GVJknsyGkgVMENDXghABzy5A@mail.gmail.com>
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

On Mon, Nov 23, 2020 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Bill Wendling <morbo@google.com> writes:
> > On Mon, Nov 23, 2020 at 12:10 PM Segher Boessenkool
> > <segher@kernel.crashing.org> wrote:
> >> On Mon, Nov 23, 2020 at 12:01:01PM -0800, Bill Wendling wrote:
> >> > On Mon, Nov 23, 2020 at 11:58 AM Segher Boessenkool
> >> > <segher@kernel.crashing.org> wrote:
> >> > > > On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
> >> > > > <segher@kernel.crashing.org> wrote:
> >> > > > > "true" (as a result of a comparison) in as is -1, not 1.
> >> > >
> >> > > On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill Wendling wrote:
> >> > > > What Segher said. :-) Also, if you reverse the comparison, you'll get
> >> > > > a build error.
> >> > >
> >> > > But that means your patch is the wrong way around?
> >> > >
> >> > > -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> >> > > -       .error "Feature section else case larger than body";    \
> >> > > -       .endif;                                                 \
> >> > > +       .org . - ((label##4b-label##3b) > (label##2b-label##1b)); \
> >> > >
> >> > > It should be a + in that last line, not a -.
> >> >
> >> > I said so in a follow up email.
> >>
> >> Yeah, and that arrived a second after I pressed "send" :-)
> >>
> > Michael, I apologize for the churn with these patches. I believe the
> > policy is to resend the match as "v4", correct?
> >
> > I ran tests with the change above. It compiled with no error. If I
> > switch the labels around to ".org . + ((label##2b-label##1b) >
> > (label##4b-label##3b))", then it fails as expected.
>
> I wanted to retain the nicer error reporting for gcc builds, so I did it
> like this:
>
> diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powerpc/include/asm/feature-fixups.h
> index b0af97add751..c4ad33074df5 100644
> --- a/arch/powerpc/include/asm/feature-fixups.h
> +++ b/arch/powerpc/include/asm/feature-fixups.h
> @@ -36,6 +36,24 @@ label##2:                                            \
>         .align 2;                                       \
>  label##3:
>
> +
> +#ifndef CONFIG_CC_IS_CLANG
> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
> +       .ifgt (else_size) - (body_size);                        \
> +       .error "Feature section else case larger than body";    \
> +       .endif;
> +#else
> +/*
> + * If we use the ifgt syntax above, clang's assembler complains about the
> + * expression being non-absolute when the code appears in an inline assembly
> + * statement.
> + * As a workaround use an .org directive that has no effect if the else case
> + * instructions are smaller than the body, but fails otherwise.
> + */
> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
> +       .org . + ((else_size) > (body_size));
> +#endif
> +
>  #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)          \
>  label##4:                                                      \
>         .popsection;                                            \
> @@ -48,9 +66,7 @@ label##5:                                                     \
>         FTR_ENTRY_OFFSET label##2b-label##5b;                   \
>         FTR_ENTRY_OFFSET label##3b-label##5b;                   \
>         FTR_ENTRY_OFFSET label##4b-label##5b;                   \
> -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> -       .error "Feature section else case larger than body";    \
> -       .endif;                                                 \
> +       CHECK_ALT_SIZE((label##4b-label##3b), (label##2b-label##1b)); \
>         .popsection;
>
>
>
> I've pushed a branch with all your patches applied to:
>
>   https://github.com/linuxppc/linux/commits/next-test
>
This works for me. Thanks!

> Are you able to give that a quick test? It builds clean with clang for
> me, but we must be using different versions of clang because my branch
> already builds clean for me even without your patches.
>
You may need to set LLVM_IAS=1 to get the behavior I'm seeing. That
turns on clang's integrated assembler, which I think is disabled by
default.

Note that with clang's integrated assembler, arch/powerpc/boot/util.S
fails to compile. Alan Modra mentioned that he sent you a patch to
"modernize" the file so that clang can compile it.


-bw
