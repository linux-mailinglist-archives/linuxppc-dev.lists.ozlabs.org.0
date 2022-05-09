Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B963520378
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kxnxf3Q5Sz3byl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 03:20:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FoDLMQ1C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=FoDLMQ1C; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxnx01J4Jz3bhF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 03:20:02 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id i10so24965932lfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xq5ml2d/MeiCgCuvTz1iX/vBFJV/Zf5wkHsF94chv1Q=;
 b=FoDLMQ1CUcXkPH5YH2WUvQkrh4wyHkUUHZHcdPJapmG1T0eHAY1wc8brR60ppGMa5J
 MvFXF3tuoDWJ6lkuzwDg+uXRKK1dpjzfA/uB5GQC4TIBsPxsrPlb2FDEA+M+F9oDz5r4
 vtrjLZL3T3cOwM7JK/DHccrk8RMKefToEtmE3ezQ84jzYnAtOuLgLmSS8SPIbwmYpL8e
 +569UZLjUuKlLJxuLia9HvqCZWJPaqW6wxZ2wKVmnB6sIpUzIEuoLVasYEAtGywHS+dy
 NOLgCVKyfJ/Tlp9jDY6Jr3DzFF11gOShM2S20Pm+kw6ankpEDU3X7veoarlOtuIzCHqv
 rMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xq5ml2d/MeiCgCuvTz1iX/vBFJV/Zf5wkHsF94chv1Q=;
 b=dSGEFGqIk1KNd6IL28mdicMR9afu4Lv/I/jMZ8Tu9eicOF9H+J6pbb9PMnHZ6p8QUd
 eEFMugQlL2noNLB+zy2lBJ15I9CPCbql6TLXjLHYzczxxpGfJdHoSjZqpcr0Uc9r79dj
 SIQSiqPTtlvcUjS8ufB/sTstQPQzUtwTK4gGaSPB8Rw4HlwqnE3VaPS4VSc47mSucNxS
 rsMNuFQykT7mWFw0uwbhoyTvywHnJD/FxEIgj/fD9Vhf1/EX1P4todcWO9+SNmWMcdmA
 au5Ej6ZmTQWtEc6SFKKYSuy14jiBmMqevaXfUCKHrB0eUXPtbtBpQ9NarZXS99kHuQIX
 mj8Q==
X-Gm-Message-State: AOAM530wI+dEyThPDrp/LNg7/sa1HzO5+tvxIoS5sB4wFkl/Uc35PE2K
 1Dt5nQDhR1GDiff6pcDMcfoJRfTrIlk1l4bpikMm8w==
X-Google-Smtp-Source: ABdhPJz9taxhLV4YRudjP7JD9rlg95k5LEcou1gLMLiVH/oLNlkumRLOmW/IlL/tmn/lb4A3bbzyo1/l2F7YyG1FIcQ=
X-Received: by 2002:a19:4303:0:b0:473:f5fb:27b2 with SMTP id
 q3-20020a194303000000b00473f5fb27b2mr12343182lfa.626.1652116799064; Mon, 09
 May 2022 10:19:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220508190631.2386038-1-masahiroy@kernel.org>
 <20220508190631.2386038-4-masahiroy@kernel.org>
In-Reply-To: <20220508190631.2386038-4-masahiroy@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 10:19:47 -0700
Message-ID: <CAKwvOd=LR=UNOeWJDmM-McJ=FrCWTo8w1ox+KGMQCwCVpiUyFg@mail.gmail.com>
Subject: Re: [PATCH v4 03/14] modpost: split the section mismatch checks into
 section-check.c
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 clang-built-linux <llvm@lists.linux.dev>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 8, 2022 at 12:10 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> modpost.c is too big, and the half of the code is for section checks.
> Split it.
>
> I fixed some style issues in the moved code.

It would be helpful for review if the split and restyle were distinct
patches.  Otherwise I can't tell what has changed.

This does lose the ability to use git blame to get more context on
some of the oddities in modpost (which I have found useful in the
past).  I don't feel strongly though.

>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
> Changes in v4:
>   - New patch
>
>  scripts/mod/Makefile        |    2 +-
>  scripts/mod/modpost.c       | 1202 +---------------------------------
>  scripts/mod/modpost.h       |   34 +-
>  scripts/mod/section-check.c | 1222 +++++++++++++++++++++++++++++++++++
>  4 files changed, 1240 insertions(+), 1220 deletions(-)
>  create mode 100644 scripts/mod/section-check.c
>
> diff --git a/scripts/mod/Makefile b/scripts/mod/Makefile
> index c9e38ad937fd..ca739c6c68a1 100644
> --- a/scripts/mod/Makefile
> +++ b/scripts/mod/Makefile
> @@ -5,7 +5,7 @@ CFLAGS_REMOVE_empty.o += $(CC_FLAGS_LTO)
>  hostprogs-always-y     += modpost mk_elfconfig
>  always-y               += empty.o
>
> -modpost-objs   := modpost.o file2alias.o sumversion.o
> +modpost-objs   := modpost.o section-check.o file2alias.o sumversion.o
>
>  devicetable-offsets-file := devicetable-offsets.h
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index a78b75f0eeb0..e7e2c70a98f5 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -31,7 +31,7 @@ static bool external_module;
>  /* Only warn about unresolved symbols */
>  static bool warn_unresolved;
>
> -static int sec_mismatch_count;
> +int sec_mismatch_count;

^ this should go in modpost.h if it is to be used in two translation
units, rather than forward declaring it in section-check.c.  You did
this for the functions.
-- 
Thanks,
~Nick Desaulniers
