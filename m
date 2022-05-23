Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D7153158B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 20:45:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6R9M48Pjz3btT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 04:45:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UstXh4Ww;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=UstXh4Ww; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6R8l13dpz3bYG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 04:45:09 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id m6so18295687ljb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 May 2022 11:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oOWZUBJqNcdlgAF3ozzceIWa1QLe3KoX8JwY9UNGHd4=;
 b=UstXh4WwiSYrL1ybcoTWRmyZsv9hEjc6PjZMBIKnBZP0zhT7iTun1KvXZ8H17U8qSH
 iz+7+bLHxdtL7wvkFkMIpdZu3lQ51hwOwKdx/wG4KzaJXykJmazsGwA7t4UGAtTePw/B
 mK+BUuXVrIeuhZNDEKPHGY+iv6YBe6R27v/utPWafsuvsLf2TmGu2ewgAfZSdKBowv4l
 LoP4BWbhRDtTjeIcpB3tIiVwfN42D2mxokpmBrGJMTT5Dd6TNpI3j9kQxH/bd3ESREMT
 XevvqDcVtKuqvXq0zcj3Z/G0wAyCfCELfimVoPf+6+u9hcQLdRX4KGz8yIs0FLopHIeq
 RhLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oOWZUBJqNcdlgAF3ozzceIWa1QLe3KoX8JwY9UNGHd4=;
 b=Bn0e2F56nv5zv0q7plnVS68LXbxIz8sSISBlBzno9Zd8PzoTA0Uo1ACBMU5P1lMnzW
 0GJFZmGeERXKDOHj3Vpt2n/9JlmlQPc6eRDDDBrOTb7nLQNCGCAt6gPbLQUnHI/I7j9I
 uamBZU7eR2ggVpa2ddXI2LVpHq/41mo1uTkYRdjP3cKI12VpV9sBFPkSW/sw8usVKx6a
 VfKnOOHuKBSqtg+tcrxeYNmVj+OzfGd6Y4dEorDc40xnFEXicQkZEBVbJgn/0gW7o3TG
 yDbltcZJE6mXHH34C9W3x1vbJpWr2ysg2Sg8pucG7UuviCfGQn+1gfHIiU6rYLMiduRw
 bdLw==
X-Gm-Message-State: AOAM530o3ifgBJZ8JV0i17gmCP+trNoPNrMqoogFy28ktIoOxm9Ra1GZ
 cFXt++EcsNavoAZRB838fwRSrZRIcYp3JpIUb3O1+g==
X-Google-Smtp-Source: ABdhPJyqr3CCsMipzHURp2FsSWTJB3upstez3xIYqCFafcp/ENDyuWVgPX2GXxQPyyXKkJMEh1xX8mg+wI61pNqucdI=
X-Received: by 2002:a2e:98cd:0:b0:253:df46:323e with SMTP id
 s13-20020a2e98cd000000b00253df46323emr9603557ljj.295.1653331503220; Mon, 23
 May 2022 11:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org>
 <20220523020209.11810-22-ojeda@kernel.org>
In-Reply-To: <20220523020209.11810-22-ojeda@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 23 May 2022 11:44:51 -0700
Message-ID: <CAKwvOdkTjxNEmCTnuH5f41WB50ef6ErBM2Kp2zJ-t9q_5U8rBA@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, Daniel Xu <dxu@dxuuu.xyz>,
 David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 linux-arm-kernel@lists.infradead.org, Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>,
 Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +choice
> +       prompt "Optimization level"
> +       default RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +       depends on RUST
> +       help
> +         Controls rustc's `-Copt-level` codegen option.
> +
> +         This flag controls the optimization level.
> +
> +         If unsure, say "Similar as chosen for C".
> +
> +config RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C
> +       bool "Similar as chosen for C"
> +       help
> +         This choice will pick a similar optimization level as chosen in
> +         the "Compiler optimization level" for C:
> +
> +             -O2 is currently mapped to -Copt-level=2
> +             -O3 is currently mapped to -Copt-level=3
> +             -Os is currently mapped to -Copt-level=s
> +
> +         The mapping may change over time to follow the intended semantics
> +         of the choice for C as sensibly as possible.
> +
> +         This is the default.
> +
> +config RUST_OPT_LEVEL_0
> +       bool "No optimizations (-Copt-level=0)"
> +       help
> +         Not recommended for most purposes. It may come in handy for debugging
> +         suspected optimizer bugs, unexpected undefined behavior, etc.
> +
> +         Note that this level will *not* enable debug assertions nor overflow
> +         checks on its own (like it happens when interacting with rustc
> +         directly). Use the corresponding configuration options to control
> +         that instead, orthogonally.
> +
> +         Note this level may cause excessive stack usage, which can lead to stack
> +         overflow and subsequent crashes.
> +
> +config RUST_OPT_LEVEL_1
> +       bool "Basic optimizations (-Copt-level=1)"
> +       help
> +         Useful for debugging without getting too lost, but without
> +         the overhead and boilerplate of no optimizations at all.
> +
> +         Note this level may cause excessive stack usage, which can lead to stack
> +         overflow and subsequent crashes.
> +
> +config RUST_OPT_LEVEL_2
> +       bool "Some optimizations (-Copt-level=2)"
> +       help
> +         The sensible choice in most cases.
> +
> +config RUST_OPT_LEVEL_3
> +       bool "All optimizations (-Copt-level=3)"
> +       help
> +         Yet more performance (hopefully).
> +
> +config RUST_OPT_LEVEL_S
> +       bool "Optimize for size (-Copt-level=s)"
> +       help
> +         Smaller kernel, ideally without too much performance loss.
> +
> +config RUST_OPT_LEVEL_Z
> +       bool "Optimize for size, no loop vectorization (-Copt-level=z)"
> +       help
> +         Like the previous level, but also turn off loop vectorization.

I'm super not into having the rust optimization level differ from the
C optimization level.  This is just someone having too much fun
wrapping every compiler flag in a kbuild option.  Either folks wan't
smaller size or more optimizations. Allowing for RUST_OPT_LEVEL_S and
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE or RUST_OPT_LEVEL_3 and
CONFIG_CC_OPTIMIZE_FOR_SIZE is just wacky nonsense that's going to
make randconfig bug reports more confusing to tease out.
-- 
Thanks,
~Nick Desaulniers
