Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8235AF360
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 20:10:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMYMW5lvKz3c3L
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 04:10:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=ZGD1qkfO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=softfail (domain owner discourages use of this host) smtp.mailfrom=kernel.org (client-ip=210.131.2.91; helo=conssluserg-06.nifty.com; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=ZGD1qkfO;
	dkim-atps=neutral
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMYLs5jXqz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 04:09:41 +1000 (AEST)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50]) (authenticated)
	by conssluserg-06.nifty.com with ESMTP id 286I9NGY029651
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 7 Sep 2022 03:09:24 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 286I9NGY029651
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
	s=dec2015msa; t=1662487764;
	bh=XoFOHD9hbfQLitaVdmtOBiY1QAcAg6OYZ0EoW2xUSHA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZGD1qkfOZB3mvpQdCDzOFOAElkTaO4PaPaAlPwkOGZeswdEKKWDKXGvUZU19OTnzN
	 kI4Lqzl2aWPg2uCtrq2xBvWb3cjVInEsjTzAi3Rf4YG5y9/LblmloX7qnT+SezYZVP
	 dmG+zEZAVxE+l/P5j9X8uI5mbuXzpVOOjco1luwJfnz7ClBnyYSFVGyILEjRvJMY9M
	 oEqHz2POEjG51ru3WyLmIXcAkOS1/761PQoDttDR5Cx4+sGA3i+AhLPYBlTCLeAPS5
	 I+P9+R/2+oFrTgEMh7Aa9eThY2hOa5FgLy2CtYLMSE4o7xQ6FFZduTdrcYLufub2YO
	 RCfeNoN83q/0A==
X-Nifty-SrcIP: [209.85.160.50]
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1225219ee46so30244887fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 11:09:24 -0700 (PDT)
X-Gm-Message-State: ACgBeo3bSpKw5iGcTY2X05zZkpnIiyvzkILmPb6eNxgjJBXwJCtBxnpU
	phOrKwCaNTL7vBYbgQxbyfWI9Zh1z/XogNQICiA=
X-Google-Smtp-Source: AA6agR67hGgf/nFls5Uj5NNQqrAJqhoj1q8j3XR+NtYCIBRN/6y6H7r8K0+yijxj8XiOimNwtU619t+k+s5yxf+KSSk=
X-Received: by 2002:a05:6870:f626:b0:10d:a798:f3aa with SMTP id
 ek38-20020a056870f62600b0010da798f3aamr12376388oab.194.1662487752576; Tue, 06
 Sep 2022 11:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
In-Reply-To: <20220802015052.10452-28-ojeda@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 7 Sep 2022 03:08:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARTX+2Z=pnGbbUepxskE+KZ1f5YsfQukJ88ijPBQt9_GA@mail.gmail.com>
Message-ID: <CAK7LNARTX+2Z=pnGbbUepxskE+KZ1f5YsfQukJ88ijPBQt9_GA@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, rust-for-linux@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, linuxppc-dev <linuxppc-d
 ev@lists.ozlabs.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Michal Marek <michal.lkml@markovi.net>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Tiago Lam <tiagolam@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 2, 2022 at 10:53 AM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Having all the new files in place, we now enable Rust support
> in the build system, including `Kconfig` entries related to Rust,
> the Rust configuration printer, the target specification
> generation script, the version detection script and a few
> other bits.
>
> Co-developed-by: Alex Gaynor <alex.gaynor@gmail.com>
> Signed-off-by: Alex Gaynor <alex.gaynor@gmail.com>
> Co-developed-by: Finn Behrens <me@kloenk.de>
> Signed-off-by: Finn Behrens <me@kloenk.de>
> Co-developed-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Signed-off-by: Adam Bratschi-Kaye <ark.email@gmail.com>
> Co-developed-by: Wedson Almeida Filho <wedsonaf@google.com>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@google.com>
> Co-developed-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Co-developed-by: Sven Van Asbroeck <thesven73@gmail.com>
> Signed-off-by: Sven Van Asbroeck <thesven73@gmail.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Co-developed-by: Boris-Chengbiao Zhou <bobo1239@web.de>
> Signed-off-by: Boris-Chengbiao Zhou <bobo1239@web.de>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Co-developed-by: Douglas Su <d0u9.su@outlook.com>
> Signed-off-by: Douglas Su <d0u9.su@outlook.com>
> Co-developed-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
> Signed-off-by: Dariusz Sosnowski <dsosnowski@dsosnowski.pl>
> Co-developed-by: Antonio Terceiro <antonio.terceiro@linaro.org>
> Signed-off-by: Antonio Terceiro <antonio.terceiro@linaro.org>
> Co-developed-by: Daniel Xu <dxu@dxuuu.xyz>
> Signed-off-by: Daniel Xu <dxu@dxuuu.xyz>
> Co-developed-by: Miguel Cano <macanroj@gmail.com>
> Signed-off-by: Miguel Cano <macanroj@gmail.com>
> Co-developed-by: David Gow <davidgow@google.com>
> Signed-off-by: David Gow <davidgow@google.com>
> Co-developed-by: Tiago Lam <tiagolam@gmail.com>
> Signed-off-by: Tiago Lam <tiagolam@gmail.com>
> Co-developed-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Signed-off-by: Bj=C3=B6rn Roy Baron <bjorn3_gh@protonmail.com>
> Co-developed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  .gitignore                                   |   6 +
>  .rustfmt.toml                                |  12 +
>  Makefile                                     | 172 +++++++-
>  arch/Kconfig                                 |   6 +
>  arch/arm/Kconfig                             |   1 +
>  arch/arm64/Kconfig                           |   1 +
>  arch/powerpc/Kconfig                         |   1 +
>  arch/riscv/Kconfig                           |   1 +
>  arch/riscv/Makefile                          |   5 +
>  arch/um/Kconfig                              |   1 +
>  arch/x86/Kconfig                             |   1 +
>  arch/x86/Makefile                            |  10 +
>  include/linux/compiler_types.h               |   6 +-
>  init/Kconfig                                 |  46 +-
>  lib/Kconfig.debug                            |  82 ++++
>  rust/.gitignore                              |  10 +
>  rust/Makefile                                | 415 +++++++++++++++++++
>  rust/bindgen_parameters                      |  21 +
>  scripts/.gitignore                           |   1 +
>  scripts/Kconfig.include                      |   6 +-
>  scripts/Makefile                             |   3 +
>  scripts/Makefile.build                       |  60 +++
>  scripts/Makefile.debug                       |  10 +
>  scripts/Makefile.host                        |  34 +-
>  scripts/Makefile.lib                         |  12 +
>  scripts/Makefile.modfinal                    |   8 +-
>  scripts/cc-version.sh                        |  12 +-
>  scripts/generate_rust_target.rs              | 232 +++++++++++
>  scripts/is_rust_module.sh                    |  16 +
>  scripts/kconfig/confdata.c                   |  75 ++++
>  scripts/min-tool-version.sh                  |   6 +
>  scripts/rust-is-available-bindgen-libclang.h |   2 +
>  scripts/rust-is-available.sh                 | 160 +++++++
>  33 files changed, 1408 insertions(+), 26 deletions(-)
>  create mode 100644 .rustfmt.toml
>  create mode 100644 rust/.gitignore
>  create mode 100644 rust/Makefile
>  create mode 100644 rust/bindgen_parameters
>  create mode 100644 scripts/generate_rust_target.rs
>  create mode 100755 scripts/is_rust_module.sh
>  create mode 100644 scripts/rust-is-available-bindgen-libclang.h
>  create mode 100755 scripts/rust-is-available.sh
>






> @@ -151,7 +162,8 @@ config WERROR
>         default COMPILE_TEST
>         help
>           A kernel build should not cause any compiler warnings, and this
> -         enables the '-Werror' flag to enforce that rule by default.
> +         enables the '-Werror' (for C) and '-Dwarnings' (for Rust) flags
> +         to enforce that rule by default.
>
>           However, if you have a new (or very old) compiler with odd and
>           unusual warnings, or you have some architecture with problems,
> @@ -1898,6 +1910,38 @@ config PROFILING
>           Say Y here to enable the extended profiling support mechanisms =
used
>           by profilers.
>
> +config RUST
> +       bool "Rust support"
> +       depends on HAVE_RUST
> +       depends on RUST_IS_AVAILABLE
> +       depends on !MODVERSIONS
> +       depends on !GCC_PLUGINS
> +       depends on !RANDSTRUCT
> +       depends on !DEBUG_INFO_BTF
> +       select CONSTRUCTORS
> +       help
> +         Enables Rust support in the kernel.
> +
> +         This allows other Rust-related options, like drivers written in=
 Rust,
> +         to be selected.
> +
> +         It is also required to be able to load external kernel modules
> +         written in Rust.
> +
> +         See Documentation/rust/ for more information.
> +
> +         If unsure, say N.
> +
> +config RUSTC_VERSION_TEXT
> +       string
> +       depends on RUST
> +       default $(shell,command -v $(RUSTC) >/dev/null 2>&1 && $(RUSTC) -=
-version || echo n)
> +
> +config BINDGEN_VERSION_TEXT
> +       string
> +       depends on RUST
> +       default $(shell,command -v $(BINDGEN) >/dev/null 2>&1 && $(BINDGE=
N) --version || echo n)
> +



Where are these config options used?


I grep'ed but no hit.


masahiro@zoe:~/ref/linux-next$ git grep RUSTC_VERSION_TEXT
init/Kconfig:config RUSTC_VERSION_TEXT
masahiro@zoe:~/ref/linux-next$ git grep BINDGEN_VERSION_TEXT
init/Kconfig:config BINDGEN_VERSION_TEXT



> --
> 2.37.1
>


--
Best Regards
Masahiro Yamada
