Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 000202B6F37
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 20:47:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbGgb6rX8zDqKX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 06:47:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=dRx9LRqt; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbGXV3hNdzDqDq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 06:41:30 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id l11so1041679plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 11:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3Ha3Pf7m43xGsOqdVk/c2fh9M5AzkQhemcyhlHdZ12E=;
 b=dRx9LRqtNTIEGpbdDyf15y725bNfdo/TKBV27AztcI9HXmR3EvdD0CAGZSMmvl6Dfy
 70FVnIF1ExZyAqsmYE5/5N3a3+ExBgngbr7ZbSeVOEYOHg5W3/mxPh7gjYu7zV7gnFLw
 HbbVR856G85VrUeI22aF75L9XnbkWBI7l+RpMGNgJuGvegZulJGCQe9+XRorN47pNKBr
 9UvQwR0KP9gRyKk3i8s5FonExGNLRDhAbnDFv9EhWFqphul4JiipLpwjnR0BrJcMfMnv
 ZXthiqEgvHVcoqJnoS/DVun0sodQvm6v0yBPkWaf2q431cbMTJQYIx+7+EfTFvOl9IG0
 VhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3Ha3Pf7m43xGsOqdVk/c2fh9M5AzkQhemcyhlHdZ12E=;
 b=rflm2WHdiPi4Wda4TB+LUxSfS/cUa0JG4Z1d4CpY1/0SeSnGUvIk1h3P7pS7HQeLfe
 j2RNCpRXCg16F7AIENRnf6wGUtW9PUm8ZwF3qrB7YXY7s8Ze9EPy9eDNJMw2S97gn48m
 2t0va3kS+guDlPZwkgzseb1GvC+maTuo3L8iPG7Ar+/tknfbO4RlK1equSTxTlgYndGE
 kui/+S6Ho4y0QLKj8YMa1YyCBT/AOBQ3NBtcyWZKwecOz33gjZz2btn9ZFr3u2mSGjf6
 mPpUiXU2rzeM0ogK3/Z3oxpmnoZLLUwxFDaxx5ak2dC+YcOje3i7+4FLOSb32ccj+V+/
 FkAg==
X-Gm-Message-State: AOAM531ygUlis+UFEcG5VXjGhvvJgpWDw+zZ2KuXq7PRSp/3TZNp0Kr0
 6mH2jvYA7m1wIhmFgaFAdnG48ILTKIPxIgm1fE61Rg==
X-Google-Smtp-Source: ABdhPJwDity6T8yzzbWGKSDq/bdE3JNe9KWacLBcdOoRoKbH+pmtyjSTnlkogXOyLkkn+mwymDhBgdSpMrc0Vv23Rik=
X-Received: by 2002:a17:902:221:b029:d8:f938:b112 with SMTP id
 30-20020a1709020221b02900d8f938b112mr1006063plc.10.1605642086810; Tue, 17 Nov
 2020 11:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201113195553.1487659-2-natechancellor@gmail.com>
In-Reply-To: <20201113195553.1487659-2-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2020 11:41:15 -0800
Message-ID: <CAKwvOdni24b_70xm+xK_7r2N77WrsOk4_OgoLiwSzZ5f+6vqfA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
 10.0.1
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 "kernelci . org bot" <bot@kernelci.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, LKML <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Arvind Sankar <nivedita@alum.mit.edu>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 13, 2020 at 11:56 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> along with a few others. Newer versions of ld.lld do not have these
> warnings. As a result, do not add '--orphan-handling=warn' to
> LDFLAGS_vmlinux if ld.lld's version is not new enough.
>
> Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Reported-by: Mark Brown <broonie@kernel.org>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>  MAINTAINERS            |  1 +
>  init/Kconfig           |  6 +++++-
>  scripts/lld-version.sh | 20 ++++++++++++++++++++
>  3 files changed, 26 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/lld-version.sh
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3da6d8c154e4..4b83d3591ec7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4284,6 +4284,7 @@ B:        https://github.com/ClangBuiltLinux/linux/issues
>  C:     irc://chat.freenode.net/clangbuiltlinux
>  F:     Documentation/kbuild/llvm.rst
>  F:     scripts/clang-tools/
> +F:     scripts/lld-version.sh
>  K:     \b(?i:clang|llvm)\b
>
>  CLEANCACHE API
> diff --git a/init/Kconfig b/init/Kconfig
> index a270716562de..40c9ca60ac1d 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -47,6 +47,10 @@ config CLANG_VERSION
>         int
>         default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
>
> +config LLD_VERSION
> +       int
> +       default $(shell,$(srctree)/scripts/lld-version.sh $(LD))
> +
>  config CC_CAN_LINK
>         bool
>         default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> @@ -1349,7 +1353,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
>           own risk.
>
>  config LD_ORPHAN_WARN
> -       def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn)
> +       def_bool ARCH_WANT_LD_ORPHAN_WARN && $(ld-option,--orphan-handling=warn) && (!LD_IS_LLD || LLD_VERSION >= 110000)
>
>  config SYSCTL
>         bool
> diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> new file mode 100755
> index 000000000000..cc779f412e39
> --- /dev/null
> +++ b/scripts/lld-version.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# ld.lld-version ld.lld-command

^ it looks like this format was copied from scripts/gcc-version, but
it's kind of curious/cryptic to me for a comment about usage.  Is it
necessary?  A comment in the form:

# Usage: ./scripts/lld-version.sh ld.lld

Would be clearer to me.

> +#
> +# Print the linker version of `ld.lld-command' in a 5 or 6-digit form
> +# such as `100001' for ld.lld 10.0.1 etc.
> +
> +linker="$*"
> +
> +if ! ( $linker --version | grep -q LLD ); then
> +       echo 0
> +       exit 1
> +fi
> +
> +VERSION=$($linker --version | cut -d ' ' -f 2)

This is going to invoke the linker potentially twice if it's LLD.
Would it be nicer to capture the output of `$linker --version`, check
which linker it is, then slice that up via `cut` to get the version?

This version is fine to me, but if you're going to send a v2, that
might be a nice slight cleanup.  Otherwise,

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

(Please drop those tags if you modify this for v2 and I'll rereview/retest).

> +MAJOR=$(echo $VERSION | cut -d . -f 1)
> +MINOR=$(echo $VERSION | cut -d . -f 2)
> +PATCHLEVEL=$(echo $VERSION | cut -d . -f 3)
> +printf "%d%02d%02d\\n" $MAJOR $MINOR $PATCHLEVEL
> --
> 2.29.2
>


-- 
Thanks,
~Nick Desaulniers
