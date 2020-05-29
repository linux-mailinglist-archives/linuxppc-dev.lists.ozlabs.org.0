Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A66B1E7D4F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 14:34:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49YPBf5mLPzDqjT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 22:34:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=brainfault.org
 (client-ip=2a00:1450:4864:20::442; helo=mail-wr1-x442.google.com;
 envelope-from=anup@brainfault.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=brainfault.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=brainfault-org.20150623.gappssmtp.com
 header.i=@brainfault-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=mBkbI/wQ; dkim-atps=neutral
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49YNdN46yQzDqf5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 22:08:39 +1000 (AEST)
Received: by mail-wr1-x442.google.com with SMTP id q11so3317465wrp.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 05:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vGzgQ0oWXrfQvBFNyvws263rfUklV7fS0Kri1ESqJoI=;
 b=mBkbI/wQaLkVLogzJl87GmMttTQRrtg48uQGw87cetKxyoTbZ8TXDRX6AEGYJ3BZRe
 mFBeT9jFfQzRtebPk19vn4iQ2vSvT9dhv0MPCer2BTIMihVg+YnZbAPU7GVKLY3+IirG
 HYkDdN6fx1+oN6/GW+kLRjlSpogXCaCvbv978puPP6e8FWl0mPevIo1ateS5PYVuk9Ls
 5D7tBFVkBntRHWguyAxjpQ3YU0COkfKCkcOGFTYAi7yGT6VGtRxuonqNp43Nxi0bxPUo
 UZvZWdtfI1nQyQT1/E24yeUt3DWBhKGbGmR3RRxNLM9qLQOY9nBNaEBerSNgD8zv1NjG
 n8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vGzgQ0oWXrfQvBFNyvws263rfUklV7fS0Kri1ESqJoI=;
 b=mIGK+nYJOzpd6dRw1D7caHFXEwR1aaEH7L1sRob1HfsJf7vzRXIIjtDhxpDzYsUMt5
 4lX+aC6P3YeVOpvNy0irql5Gi7qsAGu7edXbxztFIssHTfJAGLwfs5GCDHhhtTcXAuF6
 I8PoBK5bWm1Wm6/kTS9rew8NkT1SNjSTY2uG+wzF2qKjcI2qRbjZG198vkWkRe11KpLK
 M9gMIxNV4Rpbmrum9a8PwANG/b0+0kI36Uj04AUr4BRuv6axSSny+Io8KzYmoRCx7eiJ
 1QRYsGzajfNlQU24wjFkaepgyaiYd56CttXDs7CJ+7ala32zd9FhWsGuO7oihKwObABj
 41yQ==
X-Gm-Message-State: AOAM531J4r0CkpNY/eWAg0+aiiVFyiocHO25ycMIGCuezW7rrOjMjl92
 DVyKNT/S5FSR2AARkWYDDvFRraIubv32eb6ypBf85Q==
X-Google-Smtp-Source: ABdhPJxcmum5AqvPxZ4BgYibGRAG0WySW6PgECxJEETQ+riECYGz8uccIRvPRLzm9MtnbhHc4//Tc63ju4JFuXcHwcM=
X-Received: by 2002:a05:6000:12c4:: with SMTP id
 l4mr9027325wrx.128.1590754115201; 
 Fri, 29 May 2020 05:08:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200524085259.24784-1-alex@ghiti.fr>
 <20200524085259.24784-4-alex@ghiti.fr>
In-Reply-To: <20200524085259.24784-4-alex@ghiti.fr>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 29 May 2020 17:38:22 +0530
Message-ID: <CAAhSdy10F3Yjca8rJDPn2wyzejYivHwTdMtzYPRkms1Rn+NYUg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arch, scripts: Add script to check relocations at
 compile time
To: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 29 May 2020 22:26:28 +1000
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <Atish.Patra@wdc.com>, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 24, 2020 at 2:26 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Relocating kernel at runtime is done very early in the boot process, so
> it is not convenient to check for relocations there and react in case a
> relocation was not expected.
>
> Powerpc architecture has a script that allows to check at compile time
> for such unexpected relocations: extract the common logic to scripts/
> and add arch specific scripts triggered at postlink.
>
> At the moment, powerpc and riscv architectures take advantage of this
> compile-time check.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/powerpc/tools/relocs_check.sh | 18 ++-------------
>  arch/riscv/Makefile.postlink       | 36 ++++++++++++++++++++++++++++++
>  arch/riscv/tools/relocs_check.sh   | 26 +++++++++++++++++++++
>  scripts/relocs_check.sh            | 20 +++++++++++++++++
>  4 files changed, 84 insertions(+), 16 deletions(-)
>  create mode 100644 arch/riscv/Makefile.postlink
>  create mode 100755 arch/riscv/tools/relocs_check.sh
>  create mode 100755 scripts/relocs_check.sh

Maybe you should send the change arch/powerpc/tools/relocs_check.sh
as a separate patch so that it can be picked up by arch/powerpc maintainers.

>
> diff --git a/arch/powerpc/tools/relocs_check.sh b/arch/powerpc/tools/relocs_check.sh
> index 014e00e74d2b..e367895941ae 100755
> --- a/arch/powerpc/tools/relocs_check.sh
> +++ b/arch/powerpc/tools/relocs_check.sh
> @@ -15,21 +15,8 @@ if [ $# -lt 3 ]; then
>         exit 1
>  fi
>
> -# Have Kbuild supply the path to objdump and nm so we handle cross compilation.
> -objdump="$1"
> -nm="$2"
> -vmlinux="$3"
> -
> -# Remove from the bad relocations those that match an undefined weak symbol
> -# which will result in an absolute relocation to 0.
> -# Weak unresolved symbols are of that form in nm output:
> -# "                  w _binary__btf_vmlinux_bin_end"
> -undef_weak_symbols=$($nm "$vmlinux" | awk '$1 ~ /w/ { print $2 }')
> -
>  bad_relocs=$(
> -$objdump -R "$vmlinux" |
> -       # Only look at relocation lines.
> -       grep -E '\<R_' |
> +${srctree}/scripts/relocs_check.sh "$@" |
>         # These relocations are okay
>         # On PPC64:
>         #       R_PPC64_RELATIVE, R_PPC64_NONE
> @@ -43,8 +30,7 @@ R_PPC_ADDR16_LO
>  R_PPC_ADDR16_HI
>  R_PPC_ADDR16_HA
>  R_PPC_RELATIVE
> -R_PPC_NONE' |
> -       ([ "$undef_weak_symbols" ] && grep -F -w -v "$undef_weak_symbols" || cat)
> +R_PPC_NONE'
>  )
>
>  if [ -z "$bad_relocs" ]; then
> diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
> new file mode 100644
> index 000000000000..bf2b2bca1845
> --- /dev/null
> +++ b/arch/riscv/Makefile.postlink
> @@ -0,0 +1,36 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# ===========================================================================
> +# Post-link riscv pass
> +# ===========================================================================
> +#
> +# Check that vmlinux relocations look sane
> +
> +PHONY := __archpost
> +__archpost:
> +
> +-include include/config/auto.conf
> +include scripts/Kbuild.include
> +
> +quiet_cmd_relocs_check = CHKREL  $@
> +cmd_relocs_check =                                                     \
> +       $(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
> +
> +# `@true` prevents complaint when there is nothing to be done
> +
> +vmlinux: FORCE
> +       @true
> +ifdef CONFIG_RELOCATABLE
> +       $(call if_changed,relocs_check)
> +endif
> +
> +%.ko: FORCE
> +       @true
> +
> +clean:
> +       @true
> +
> +PHONY += FORCE clean
> +
> +FORCE:
> +
> +.PHONY: $(PHONY)
> diff --git a/arch/riscv/tools/relocs_check.sh b/arch/riscv/tools/relocs_check.sh
> new file mode 100755
> index 000000000000..baeb2e7b2290
> --- /dev/null
> +++ b/arch/riscv/tools/relocs_check.sh
> @@ -0,0 +1,26 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +# Based on powerpc relocs_check.sh
> +
> +# This script checks the relocations of a vmlinux for "suspicious"
> +# relocations.
> +
> +if [ $# -lt 3 ]; then
> +        echo "$0 [path to objdump] [path to nm] [path to vmlinux]" 1>&2
> +        exit 1
> +fi
> +
> +bad_relocs=$(
> +${srctree}/scripts/relocs_check.sh "$@" |
> +       # These relocations are okay
> +       #       R_RISCV_RELATIVE
> +       grep -F -w -v 'R_RISCV_RELATIVE'
> +)
> +
> +if [ -z "$bad_relocs" ]; then
> +       exit 0
> +fi
> +
> +num_bad=$(echo "$bad_relocs" | wc -l)
> +echo "WARNING: $num_bad bad relocations"
> +echo "$bad_relocs"
> diff --git a/scripts/relocs_check.sh b/scripts/relocs_check.sh
> new file mode 100755
> index 000000000000..137c660499f3
> --- /dev/null
> +++ b/scripts/relocs_check.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# Get a list of all the relocations, remove from it the relocations
> +# that are known to be legitimate and return this list to arch specific
> +# script that will look for suspicious relocations.
> +
> +objdump="$1"
> +nm="$2"
> +vmlinux="$3"
> +
> +# Remove from the possible bad relocations those that match an undefined
> +# weak symbol which will result in an absolute relocation to 0.
> +# Weak unresolved symbols are of that form in nm output:
> +# "                  w _binary__btf_vmlinux_bin_end"
> +undef_weak_symbols=$($nm "$vmlinux" | awk '$1 ~ /w/ { print $2 }')
> +
> +$objdump -R "$vmlinux" |
> +       grep -E '\<R_' |
> +       ([ "$undef_weak_symbols" ] && grep -F -w -v "$undef_weak_symbols" || cat)
> --
> 2.20.1
>

Otherwise, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup
