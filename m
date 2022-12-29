Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D235658EEF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Dec 2022 17:23:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjYbZ3Sbvz3c9N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 03:23:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dahVygbd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=palmer@dabbelt.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20210112.gappssmtp.com header.i=@dabbelt-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=dahVygbd;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NjYZc1d8Pz3bfD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 03:22:30 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id q68so5171009pgq.9
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Dec 2022 08:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lGyrD0+PhkAL5dbAeObFs9RwoqBo5ONG0NwovuaDsrM=;
        b=dahVygbdXamhJiKEgN7Jyg1lXYgvfTSo1DMUkYl6yXrdIMvfnyRS0HpjAJGhYD3IFg
         E+JY0GnUUwwkM2h9ox2Zgy/UxJJ4gx7kMRbUi8BoQs1MkH7ANMKs27AnO7PEO784TqXp
         ruuAqGepnkn93qVt3OFjdbG1AsqdvffnpusA3lSTC6zFKd8HiqB0qYg9fELjUJN4UbO/
         3lnm7IU3UfXKaT3AUgnmQMHaYpOZ2VZND7TcbraC5FIjkTHVAEIVzHPRo5TQwNIMJbMP
         q3kZJpTtujX11O+tGSd8oHpehkbK7CbScXp9TvIT0cj2FcWn3tOzaHwI3gNMSd/9wBDx
         rNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lGyrD0+PhkAL5dbAeObFs9RwoqBo5ONG0NwovuaDsrM=;
        b=GmHbAWvj511j7ZNkao6tdsgxbSgznhj+Nj0AWCPd5+nZuBayPPRudmy9CZ7SNaRCGF
         B6TW7o+DfEjMd4N+PIEmUU4GKakAZfVDfuSq9/roNKdSr6H02vajG0M+6EhkMAQzfmTb
         xFDgeMdPY18yNpsU7DPKF5iVEsJZS7TLUIImNj+M13gGhvtfTd8QVODXL6DLiXKY/c6F
         bDhVm94IB/AxcB5kj/16Z6mVSsNCahTiIdINlRd5jexWRVwx+DPy/XKXxH3NPnhQ7WB0
         lDhD7Yp2j/t7e4A4wWdArSry/W/pSLAyx/TUxNFheoTGe0EtKVIvJ02z6M8Pb7q4MIK/
         Cpmg==
X-Gm-Message-State: AFqh2krVIj6t+jZOayjWdRonXc2Y0yBb4jUuAsYl875thkUnXpn4WJl1
	tCEcnaOL3vF7QZheXIuQpZylpw==
X-Google-Smtp-Source: AMrXdXvpdMbR8CMYmi4dUk/9PgGNumQG+p4T2pa56FD3JYpViB2+8Ov5fWBEh9VYECa0d3vj+bwoEw==
X-Received: by 2002:aa7:99cb:0:b0:580:d188:f516 with SMTP id v11-20020aa799cb000000b00580d188f516mr22924872pfi.19.1672330945228;
        Thu, 29 Dec 2022 08:22:25 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id x185-20020a6286c2000000b0056bfebfa6e4sm12277463pfd.190.2022.12.29.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:22:24 -0800 (PST)
Date: Thu, 29 Dec 2022 08:22:24 -0800 (PST)
X-Google-Original-Date: Thu, 29 Dec 2022 07:53:04 PST (-0800)
Subject: Re: [PATCH v2] vdso: Improve cmd_vdso_check to check all dynamic relocations
In-Reply-To: <20221221235147.45lkqmosndritfpe@google.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maskray@google.com
Message-ID: <mhng-17d41c33-7f33-4a1c-8af2-ae7d07134e8c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 21 Dec 2022 15:51:47 PST (-0800), maskray@google.com wrote:
> The actual intention is that no dynamic relocation exists. However, some
> GNU ld ports produce unneeded R_*_NONE. (If a port fails to determine
> the exact .rel[a].dyn size, the trailing zeros become R_*_NONE
> relocations. E.g. ld's powerpc port recently fixed
> https://sourceware.org/bugzilla/show_bug.cgi?id=29540) R_*_NONE are
> generally no-op in the dynamic loaders. So just ignore them.
>
> With the change, we can remove ARCH_REL_TYPE_ABS. ARCH_REL_TYPE_ABS is a
> bit misnomer as ports may check RELAVETIVE/GLOB_DAT/JUMP_SLOT which are
> not called "absolute relocations". (The patch is motivated by the arm64
> port missing R_AARCH64_RELATIVE.)
>
> Signed-off-by: Fangrui Song <maskray@google.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> Change from v1:
> * rebase after 8ac3b5cd3e0521d92f9755e90d140382fc292510 (lib/vdso: use "grep -E" instead of "egrep")
> * change the commit message to mention an example GNU ld bug; no longer say the patch fixes a deprecated egrep use
> ---
>   arch/arm/vdso/Makefile            |  3 ---
>   arch/arm64/kernel/vdso/Makefile   |  3 ---
>   arch/arm64/kernel/vdso32/Makefile |  3 ---
>   arch/csky/kernel/vdso/Makefile    |  3 ---
>   arch/loongarch/vdso/Makefile      |  3 ---
>   arch/mips/vdso/Makefile           |  3 ---
>   arch/powerpc/kernel/vdso/Makefile |  1 -
>   arch/riscv/kernel/vdso/Makefile   |  3 ---
>   arch/s390/kernel/vdso32/Makefile  |  2 --
>   arch/s390/kernel/vdso64/Makefile  |  2 --
>   arch/x86/entry/vdso/Makefile      |  4 ----
>   lib/vdso/Makefile                 | 13 ++++---------
>   12 files changed, 4 insertions(+), 39 deletions(-)

[snip]

> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> index 06e6b27f3bcc..d85c37e11b21 100644
> --- a/arch/riscv/kernel/vdso/Makefile
> +++ b/arch/riscv/kernel/vdso/Makefile
> @@ -1,9 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   # Copied from arch/tile/kernel/vdso/Makefile
>
> -# Absolute relocation type $(ARCH_REL_TYPE_ABS) needs to be defined before
> -# the inclusion of generic Makefile.
> -ARCH_REL_TYPE_ABS := R_RISCV_32|R_RISCV_64|R_RISCV_JUMP_SLOT
>   include $(srctree)/lib/vdso/Makefile
>   # Symbols present in the vdso
>   vdso-syms  = rt_sigreturn

Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V

Thanks!
