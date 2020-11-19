Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9982B9CC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 22:15:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcXWy3yqpzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 08:15:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=VX9vMNKu; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcXTy6pDCzDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 08:13:42 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id 10so5713374pfp.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 13:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v4GZ/jYkXszE1mls+kEMDdrPEPVfJzO/2ICpEIaBNDQ=;
 b=VX9vMNKumxYjb1MaiOgA8BYXWmZVJDiTW6P01b9rG1rPFKPOjSfowk4zaRH1rXRNir
 BtNu2L/lhkEgxsDBVm5+hwahoKlcdKx8DSfHEvvF9koYNFXSPx+TqpjXadTh2ckpyrEn
 LPRrqR2nTFG9fkBNgO6K7sSMsjq9j5w7XVC/YqMh/5mCy4tlsbZt8u5jaaCN7inZBCZ3
 KqCnmRWetMpK1EIMWJnCEmxwayXO5SCYdsiunWSlbvt5gCFY4m7Mqnk47VBIHFU1IKw2
 se5KST+MC+lt9D5LyUhQiwfEntRz78UomESsMPm9dc/J0TdU7KKuOC0d0zDuJvAGm00a
 Yt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v4GZ/jYkXszE1mls+kEMDdrPEPVfJzO/2ICpEIaBNDQ=;
 b=tDEIcMUEwmV1FDocqxBNMeyDK/VM56hm1Aw04XVEngt0DpONeySi06sNvsq4TxCvha
 o+yBr39Qrq+5HnvAkrXj1UxvmNVjXM1EbsMKQrRrP1kEV+Wo1Vn3VAV0nKSotd6Ojfbq
 l9PfUquUXTp+FjOFnF6z5Crn4cB6G1fNvtOk5pqSmSU085wZS/xf8NFE7Pb4yT0c8PUy
 m0NPjp5fHD3ZlL3sW2AcWsD56f4jcJ1s7Ps9uuuoecJjHcbJXL3fLuTLyhjgC/lViS5S
 nIao0a6bSGGB32jA022jHLAUJCiJNSvXJgRoVhcGTectMYlm6qXCMXB61ek9O05wgGVe
 TqRg==
X-Gm-Message-State: AOAM530JW2jMSqgPULRfK86DUFuyDEcYCoH4u2rI48QIv63uQ/s2Bt5F
 QTfCFglhhnEIsP6S1sGV1xenyeTsdhJZ3o4ItZkF6A==
X-Google-Smtp-Source: ABdhPJxZrPh18rHCKywSfaLz+afmz6qeTTM23n3N+yG4DUvwsOZWdSWRDWD6fR2nhxs02pK/JPvBxMBwXKRZ5ZsZb4M=
X-Received: by 2002:a65:4485:: with SMTP id l5mr14014104pgq.10.1605820419400; 
 Thu, 19 Nov 2020 13:13:39 -0800 (PST)
MIME-Version: 1.0
References: <20201113195553.1487659-1-natechancellor@gmail.com>
 <20201119204656.3261686-2-natechancellor@gmail.com>
In-Reply-To: <20201119204656.3261686-2-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 19 Nov 2020 13:13:27 -0800
Message-ID: <CAKwvOdkPgwL8H4EGF6=-VuxTdmxA8JHhGbLHVYcLJj9MmAvW=g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld
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

On Thu, Nov 19, 2020 at 12:57 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> ld.lld 10.0.1 spews a bunch of various warnings about .rela sections,
> along with a few others. Newer versions of ld.lld do not have these
> warnings. As a result, do not add '--orphan-handling=warn' to
> LDFLAGS_vmlinux if ld.lld's version is not new enough.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1187
> Link: https://github.com/ClangBuiltLinux/linux/issues/1193
> Reported-by: Arvind Sankar <nivedita@alum.mit.edu>
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Reported-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Thanks for the additions in v2.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2:
>
> * Add condition as a depends on line (Kees Cook)
>
> * Capture output of "$* --version" to avoid invoking linker twice (Nick
>   Desaulniers)
>
> * Improve documentation of script in comments (Nick Desaulniers)
>
> * Pick up review tag from Kees
>
>  MAINTAINERS            |  1 +
>  init/Kconfig           |  5 +++++
>  scripts/lld-version.sh | 20 ++++++++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100755 scripts/lld-version.sh
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e451dcce054f..e6f74f130ae1 100644
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
> index 92c58b45abb8..b9037d6c5ab3 100644
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
> @@ -1351,6 +1355,7 @@ config LD_DEAD_CODE_DATA_ELIMINATION
>  config LD_ORPHAN_WARN
>         def_bool y
>         depends on ARCH_WANT_LD_ORPHAN_WARN
> +       depends on !LD_IS_LLD || LLD_VERSION >= 110000
>         depends on $(ld-option,--orphan-handling=warn)
>
>  config SYSCTL
> diff --git a/scripts/lld-version.sh b/scripts/lld-version.sh
> new file mode 100755
> index 000000000000..d70edb4d8a4f
> --- /dev/null
> +++ b/scripts/lld-version.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Usage: $ ./scripts/lld-version.sh ld.lld
> +#
> +# Print the linker version of `ld.lld' in a 5 or 6-digit form
> +# such as `100001' for ld.lld 10.0.1 etc.
> +
> +linker_string="$($* --version)"
> +
> +if ! ( echo $linker_string | grep -q LLD ); then
> +       echo 0
> +       exit 1
> +fi
> +
> +VERSION=$(echo $linker_string | cut -d ' ' -f 2)
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
