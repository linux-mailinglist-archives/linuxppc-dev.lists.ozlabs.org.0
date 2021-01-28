Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE72306AD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:58:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR3XC0hg5zDqKK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:58:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.80;
 helo=conssluserg-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=X2YfGmKV; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR2JX2RfjzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 12:02:51 +1100 (AEDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 10S12TRR029723
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 10:02:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10S12TRR029723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795750;
 bh=kQBsC8DD1I5pmWkAr2jPmQQNw1PckPFdZPVIdpQVYdo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=X2YfGmKV6JyqV6skhwNlBN5EndPUYjWcNkOTo404Y6vE/VjuzQzR3Hwre1o9jMX7P
 t3pE8Eb/agEN1+SaB5WdhX3qLWKgeotk+EENxzm+2r79cEMgEquohGT/DZdc81+USy
 n577YnXPqvQTSLbcIfGIwlXir96y4XYna6GbZ8JMehDKy3q1du6FKs+xB6Ee7gryFW
 8fZJW0K2rhzEg2LE1IdBsw1wzN8ed4VgNVCiOpTvAQkAVq2uvVboz8HiD/Bu/u7vRJ
 Dx8w8fXdYSaprH/rcXQNKd/WA9Z42fXEQaKNyPcCBPduv5pMUUnZ/FcS8rZF2bdrdk
 Arf+3kYeRwbDg==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id j2so1484524pgl.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 17:02:29 -0800 (PST)
X-Gm-Message-State: AOAM5325udPAdapPBQUfGDafTkYpYR9mzRGpBiFo4zXAAS7XulHteXK5
 UpNLSDOI83XYXxuDN92kjTM6IzoshyF5cn+ynHQ=
X-Google-Smtp-Source: ABdhPJx2qrnkZf85rd51ifbo3/yHH3r4r1ZqUYd8szq6YngeUvtL91K9BCWmJopJwX8xwD3QAcfaeKREyWnPk27LDQ4=
X-Received: by 2002:a63:575e:: with SMTP id h30mr13844879pgm.7.1611795748589; 
 Wed, 27 Jan 2021 17:02:28 -0800 (PST)
MIME-Version: 1.0
References: <20210128005110.2613902-1-masahiroy@kernel.org>
 <20210128005110.2613902-2-masahiroy@kernel.org>
In-Reply-To: <20210128005110.2613902-2-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 28 Jan 2021 10:01:50 +0900
X-Gmail-Original-Message-ID: <CAK7LNASxQkX9R3g+r2mwKGE11oFLkNVPwsTezgHFzLgHjzcjdw@mail.gmail.com>
Message-ID: <CAK7LNASxQkX9R3g+r2mwKGE11oFLkNVPwsTezgHFzLgHjzcjdw@mail.gmail.com>
Subject: Re: [PATCH 01/27] scripts: add generic syscalltbl.sh
To: linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>
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
Cc: "open list:TENSILICA XTENSA PORT \(xtensa\)"
 <linux-xtensa@linux-xtensa.org>, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mips@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 linux-alpha@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 28, 2021 at 9:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Most of architectures generate syscall headers at the compile time
> in the almost same way.
>
> The syscall table has the same format for all architectures. Each line
> has 3, 4 or 5 fields; syscall number, ABI, syscall name, native entry
> point, and compat entry point. The syscall table is processed by
> syscalltbl.sh script into header files.
>
> Despite the same pattern, scripts are maintained per architecture,
> which results in code duplication and bad maintainability.
>
> As of v5.11-rc1, 12 architectures duplicate similar shell scripts:
>
>   $ find arch -name syscalltbl.sh | sort
>   arch/alpha/kernel/syscalls/syscalltbl.sh
>   arch/arm/tools/syscalltbl.sh
>   arch/ia64/kernel/syscalls/syscalltbl.sh
>   arch/m68k/kernel/syscalls/syscalltbl.sh
>   arch/microblaze/kernel/syscalls/syscalltbl.sh
>   arch/mips/kernel/syscalls/syscalltbl.sh
>   arch/parisc/kernel/syscalls/syscalltbl.sh
>   arch/powerpc/kernel/syscalls/syscalltbl.sh
>   arch/sh/kernel/syscalls/syscalltbl.sh
>   arch/sparc/kernel/syscalls/syscalltbl.sh
>   arch/x86/entry/syscalls/syscalltbl.sh
>   arch/xtensa/kernel/syscalls/syscalltbl.sh
>
> My goal is to unify them into a single file, scripts/syscalltbl.sh.
>
> For example, the i386 syscall table looks like this:
>
>   0  i386  restart_syscall  sys_restart_syscall
>   1  i386  exit             sys_exit
>   2  i386  fork             sys_fork
>   3  i386  read             sys_read
>   4  i386  write            sys_write
>   5  i386  open             sys_open              compat_sys_open
>   ...
>
> scripts/syscalltbl.sh generates the following code:
>
>   __SYSCALL(0, sys_restart_syscall)
>   __SYSCALL(1, sys_exit)
>   __SYSCALL(2, sys_fork)
>   __SYSCALL(3, sys_read)
>   __SYSCALL(4, sys_write)
>   __SYSCALL_WITH_COMPAT(5, sys_open, compat_sys_open)
>   ...
>
> Then, the i386 kernel will do:
>
>   #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, native)
>
> and the x86_64 kernel will do:
>
>   #define __SYSCALL_WITH_COMPAT(nr, native, compat) __SYSCALL(nr, compat)
>
> I noticed all 32/64 bit architectures can be covered by the same
> pattern. Having an arch-specific script is fine if there is a good
> reason to do so, but a single generic script should work for this case.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  scripts/syscalltbl.sh | 52 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 scripts/syscalltbl.sh
>
> diff --git a/scripts/syscalltbl.sh b/scripts/syscalltbl.sh
> new file mode 100644
> index 000000000000..15bf4e09f88c
> --- /dev/null
> +++ b/scripts/syscalltbl.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Usage:
> +#  scripts/syscalltbl.sh INFILE OUTFILE [ABIS] [OFFSET]
> +#
> +# INFILE: input syscall table
> +# OUTFILE: output file
> +# ABIS (optional): specify the ABIs to handle.
> +#                  If omitted, all lines are handled.
> +# OFFSET (optinal): spefify the offset of the syscall numbers.
> +#                   If omitted, the offset is zero.
> +#
> +# The syscall table format:
> +# nr abi name native [compat]


This line should be

 nr abi name [native] [compat]


because the native entry point is also optional.
(if it is missing, sys_ni_syscall is used)




> +#
> +# nr: syscall number
> +# abi: ABI name
> +# name: syscall name
> +# native: native entry point

native (optional): native entry point


> +# compat (optional): compat entry point
> +
> +set -e
> +
> +in="$1"
> +out="$2"
> +abis=$(echo "($3)" | tr ',' '|')
> +offset="${4:-0}"
> +
> +nxt=$offset
> +
> +grep -E "^[0-9]+[[:space:]]+${abis}" "$in" | sort -n | {
> +
> +       while read nr abi name native compat ; do
> +
> +               nr=$((nr + $offset))
> +
> +               while [ $nxt -lt $nr ]; do
> +                       echo "__SYSCALL($nxt, sys_ni_syscall)"
> +                       nxt=$((nxt + 1))
> +               done
> +
> +               if [ -n "$compat" ]; then
> +                       echo "__SYSCALL_WITH_COMPAT($nr, $native, $compat)"
> +               elif [ -n "$native" ]; then
> +                       echo "__SYSCALL($nr, $native)"
> +               else
> +                       echo "__SYSCALL($nr, sys_ni_syscall)"
> +               fi
> +               nxt=$((nr + 1))
> +       done
> +} > "$out"
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
