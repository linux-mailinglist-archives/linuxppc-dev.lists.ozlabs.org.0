Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DC553466D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 00:26:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7lz12xZ5z3bxt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 May 2022 08:26:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=fAMfron/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::231;
 helo=mail-lj1-x231.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=fAMfron/; dkim-atps=neutral
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7lyP42ySz2yXP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 May 2022 08:25:48 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id i23so26008886ljb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 15:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y4JE5dVY5pJ4L5p/4sGg1xocj3NSEFAKSZJJs4bfl50=;
 b=fAMfron/HjbN7nd+bsG3ASO/nK1WjlcoVqa4+QdtPam6ciW/bwdYCmk9ujS4Abe4VJ
 w2sueG/5d5jh11UgLmuXnMAdarDjSChSdXdKrhg3y7F8Pjptb4ff8WlByIdiSkfEbGFm
 PkRmC+09uBSPSsg344wCJdI8n7v1Yt+vr7kQ9DePitEy6ui34PJ0AU8C5jZKRsffEDfP
 ug3LM0AmYwwUZHhVNWlMxQzBz79rShyO1d1dkhvX1r4lmvgXBfWQm+lShZOQXq9rxarC
 SWsS9kfyfYspj/5U44fShRnUcSFmlbceeiOtALpaquQdvDHDNyVkshBPqlQYpF3P0oqm
 UHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y4JE5dVY5pJ4L5p/4sGg1xocj3NSEFAKSZJJs4bfl50=;
 b=5aZ3B09Z8nrx7g9SnbbbbBu+7wOFBpZU04PcVaaDpRtwrU3b1i6OJraln2lQdlZk7I
 GUtw3wuhbrrKqLZGXrU1vJgXQeo/siRMDXsEPE5t1e6LKx4Ch960a63/iarjF/b5E4Hc
 kZUxRBWBg9Bd/ke3VbjBl3fUuZ9gDLxcApeZovzDCTWQl4EhRdUeQId/AtnRr5eRPTUM
 rHZwWU3nSziMWhEih6mVcK3U/EwUEqCTWIdmaEg6A5gMqCDDEsd/r0EVukfBLfgrwpcz
 6k/F066ya4UMketwb85qk3yTAAn32g/uWXIjQm+O0SGxD5uXccIwOjfS8W2LIRQRGmxh
 8apw==
X-Gm-Message-State: AOAM530j0tHJp9uS08C0GswDCVw/VwQqRgqnSZn3KfyUKsMU0ur7A/Tk
 itj8MEpK9OnqhM39EyIoOy/Zz756A7s3vxDTA7opWg==
X-Google-Smtp-Source: ABdhPJyyMkDOBVLKOsbECK6J7ZWww0BuYU20TDN6fYXnxk8xptFKTQXny9GfJRyE8hkAsArQFcu6jZmKOkIJSKODNlQ=
X-Received: by 2002:a2e:98c3:0:b0:253:e0e1:20 with SMTP id
 s3-20020a2e98c3000000b00253e0e10020mr14949440ljj.26.1653517540546; 
 Wed, 25 May 2022 15:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org>
 <20220523020209.11810-22-ojeda@kernel.org>
In-Reply-To: <20220523020209.11810-22-ojeda@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 25 May 2022 15:25:28 -0700
Message-ID: <CAKwvOdn+9qORm8UpDGnPXxiK7B7P_TW5CtXv1+8qkv7UvQr3hQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Miguel Ojeda <ojeda@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>
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
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Wedson Almeida Filho <wedsonaf@google.com>,
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

On Sun, May 22, 2022 at 7:04 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> --- a/Makefile
> +++ b/Makefile
> @@ -120,6 +120,15 @@ endif
>
>  export KBUILD_CHECKSRC
>
> +# Enable "clippy" (a linter) as part of the Rust compilation.
> +#
> +# Use 'make CLIPPY=1' to enable it.
> +ifeq ("$(origin CLIPPY)", "command line")
> +  KBUILD_CLIPPY := $(CLIPPY)
> +endif

Is there a reason to not just turn clippy on always? Might be nicer to
start off with good practices by default. :^)

> @@ -1494,7 +1588,8 @@ MRPROPER_FILES += include/config include/generated          \
>                   certs/signing_key.pem \
>                   certs/x509.genkey \
>                   vmlinux-gdb.py \
> -                 *.spec
> +                 *.spec \
> +                 rust/target.json rust/libmacros.so
>
>  # clean - Delete most, but leave enough to build external modules
>  #
> @@ -1519,6 +1614,9 @@ $(mrproper-dirs):
>
>  mrproper: clean $(mrproper-dirs)
>         $(call cmd,rmfiles)
> +       @find . $(RCS_FIND_IGNORE) \
> +               \( -name '*.rmeta' \) \
> +               -type f -print | xargs rm -f

Are there *.rmeta directories that we _don't_ want to remove via `make
mrproper`? I'm curious why *.rmeta isn't just part of MRPROPER_FILES?

>
>  # distclean
>  #
> @@ -1606,6 +1704,23 @@ help:
>         @echo  '  kselftest-merge   - Merge all the config dependencies of'
>         @echo  '                      kselftest to existing .config.'
>         @echo  ''
> +       @echo  'Rust targets:'
> +       @echo  '  rustavailable   - Checks whether the Rust toolchain is'
> +       @echo  '                    available and, if not, explains why.'
> +       @echo  '  rustfmt         - Reformat all the Rust code in the kernel'
> +       @echo  '  rustfmtcheck    - Checks if all the Rust code in the kernel'
> +       @echo  '                    is formatted, printing a diff otherwise.'
> +       @echo  '  rustdoc         - Generate Rust documentation'
> +       @echo  '                    (requires kernel .config)'
> +       @echo  '  rusttest        - Runs the Rust tests'
> +       @echo  '                    (requires kernel .config; downloads external repos)'
> +       @echo  '  rust-analyzer   - Generate rust-project.json rust-analyzer support file'
> +       @echo  '                    (requires kernel .config)'
> +       @echo  '  dir/file.[os]   - Build specified target only'
> +       @echo  '  dir/file.i      - Build macro expanded source, similar to C preprocessing'
> +       @echo  '                    (run with RUSTFMT=n to skip reformatting if needed)'
> +       @echo  '  dir/file.ll     - Build the LLVM assembly file'

I don't think we need to repeat dir/* here again for rust. The
existing targets listed above (outside this hunk) make sense in both
contexts.

Does rustc really use .i as a conventional suffix for macro expanded
sources? (The C compiler might use the -x flag to override the guess
it would make based on the file extension; I'm curious if rustc can
ingest .i files or will it warn?)

> diff --git a/init/Kconfig b/init/Kconfig
> index ddcbefe535e9..3457cf596588 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> +config RUSTC_VERSION_TEXT
> +       string
> +       depends on RUST
> +       default $(shell,command -v $(RUSTC) >/dev/null 2>&1 && $(RUSTC) --version || echo n)
> +
> +config BINDGEN_VERSION_TEXT
> +       string
> +       depends on RUST
> +       default $(shell,command -v $(BINDGEN) >/dev/null 2>&1 && $(BINDGEN) --version || echo n)

Are these two kconfigs used anywhere?

> diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> index 0496efd6e117..83e850321eb6 100644
> --- a/scripts/Kconfig.include
> +++ b/scripts/Kconfig.include
> @@ -36,12 +36,12 @@ ld-option = $(success,$(LD) -v $(1))
>  as-instr = $(success,printf "%b\n" "$(1)" | $(CC) $(CLANG_FLAGS) -c -x assembler -o /dev/null -)
>
>  # check if $(CC) and $(LD) exist
> -$(error-if,$(failure,command -v $(CC)),compiler '$(CC)' not found)
> +$(error-if,$(failure,command -v $(CC)),C compiler '$(CC)' not found)

Not that it's important to do so, but a couple hunks s/compiler/C
compiler/. Those _could_ probably get submitted ahead of this, but not
important to do so.

> diff --git a/scripts/Makefile.debug b/scripts/Makefile.debug
> index 9f39b0130551..fe87389d52c0 100644
> --- a/scripts/Makefile.debug
> +++ b/scripts/Makefile.debug
> @@ -1,4 +1,5 @@
>  DEBUG_CFLAGS   :=
> +DEBUG_RUSTFLAGS        :=
>
>  ifdef CONFIG_DEBUG_INFO_SPLIT
>  DEBUG_CFLAGS   += -gsplit-dwarf
> @@ -10,6 +11,12 @@ ifndef CONFIG_AS_IS_LLVM
>  KBUILD_AFLAGS  += -Wa,-gdwarf-2
>  endif
>
> +ifdef CONFIG_DEBUG_INFO_REDUCED
> +DEBUG_RUSTFLAGS += -Cdebuginfo=1
> +else
> +DEBUG_RUSTFLAGS += -Cdebuginfo=2
> +endif
> +

How does enabling or disabling debug info work for rustc? I may have
missed it, but I was surprised to see no additional flags getting
passed to rustc based on CONFIG_DEBUG info.

> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> new file mode 100644
> index 000000000000..c146a3407183
> --- /dev/null
> +++ b/scripts/generate_rust_target.rs

Ah, that explains the host rust build infra.  Bravo! Hard coding the
target files was my major concern last I looked at the series. I'm
very happy to see it be generated properly from .config!

I haven't actually reviewed this yet, but it makes me significantly
more confident in the series to see this approach added. Good job
whoever wrote this.

> diff --git a/scripts/is_rust_module.sh b/scripts/is_rust_module.sh
> new file mode 100755
> index 000000000000..277a64d07f22
> --- /dev/null
> +++ b/scripts/is_rust_module.sh
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# is_rust_module.sh module.ko
> +#
> +# Returns `0` if `module.ko` is a Rust module, `1` otherwise.
> +
> +set -e
> +
> +# Using the `16_` prefix ensures other symbols with the same substring
> +# are not picked up (even if it would be unlikely). The last part is
> +# used just in case LLVM decides to use the `.` suffix.
> +${NM} "$*" | grep -qE '^[0-9a-fA-F]+ r _R[^[:space:]]+16___IS_RUST_MODULE[^[:space:]]*$'

Does `$(READELF) -p .comment foo.o` print anything about which
compiler was used? That seems less brittle IMO.

---

Modulo the RUST_OPT_LEVEL_SIMILAR_AS_CHOSEN_FOR_C which I'm not a fan
of, this is looking good to me. Masahiro, what are your thoughts on
the build system support?
-- 
Thanks,
~Nick Desaulniers
