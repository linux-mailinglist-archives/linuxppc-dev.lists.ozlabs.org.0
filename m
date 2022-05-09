Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6C520669
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 23:06:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxtyR3zKPz3byW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 07:06:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=orbrA4f7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=orbrA4f7; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxtxp5DKTz3bZC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 07:06:05 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id y32so25966571lfa.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qjp1harQFIcR5JWDx27OsPZ+h/5ZSTnxNJxQGcpbR0Q=;
 b=orbrA4f77ogkxmKkJ3q/TQp+dmMTe5nI5SbmLDizn+BWtUFG8Veqt5b2zCd7XI/v0C
 2++5tFvOTalN0KW1AA0axYrWYizghY3kpdrmvNXVto7XaPmPKHVWTdWCqiCR61V+lIkg
 s9CF/QQDbaxAdyboGRDA09JFYQbpAPBvbY7qhyf+Jc0KYGEYTOw7lFRqZNkDCG1ZGmLE
 QJz9STkUtJlmOiy/nR3lnfGOG5XYt59SxISOM8zb2RbNNEQgXqWZblTbq2UTP54SLCVz
 tubogND8mcPPvr46k7AtFlLzJbSUwmOkxP4rDRYyZelkIvBVWy1QkdJfJ62fVLEyPyIF
 FAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qjp1harQFIcR5JWDx27OsPZ+h/5ZSTnxNJxQGcpbR0Q=;
 b=FMPmFg4PPzmTZSFMriW4or4pL/3pFbuMMDeZiQvZlRRCro/HH1AZg3XylJYGLOfwr9
 IvPHy6y6r0hWuc1rgonM2o3PvCxsRatnbsoZYqPUsfA5H3jgNAlIGVvic/chE54g4l3M
 hCfBUn3C0VtrqSCHhw38BxX6Km/PGUJYqxEp0gR8UxucYvsbejkcyuhdohKZ+e+5azl8
 guRty/1PtU2p/4GRAzIf+H3mzfeLOlVYCaMd1+CSLmosNvfPcXtG5TcUj+dCKhmk+5hC
 Bk4/0wv2za0AQBrno9V8nXFgr9cF+Env4KpLsYlK+ooM2d7ffRDelRinNgRx6OgqPafO
 U6AA==
X-Gm-Message-State: AOAM530SWoj6MdNV40P/EQCW3J7RO8H4bkJnXe41UF6onlT6VdcvYyTf
 2VjsQrJAmdr18OEk8S6newLXF0J5iiBHpbpwwukPPg==
X-Google-Smtp-Source: ABdhPJysiyUy2xjHoY7K99LREor5hcP6IvAjiQlGyHJrA4xH+cD+Sc1vbSv1/2dj3A5+OpE+v2zcENJr5rPg1toaW24=
X-Received: by 2002:a05:6512:1291:b0:473:b522:ef58 with SMTP id
 u17-20020a056512129100b00473b522ef58mr13857412lfs.190.1652130360612; Mon, 09
 May 2022 14:06:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220509204635.2539549-1-nathan@kernel.org>
 <20220509204635.2539549-2-nathan@kernel.org>
In-Reply-To: <20220509204635.2539549-2-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 9 May 2022 14:05:48 -0700
Message-ID: <CAKwvOdnqFRhFvhFeGzKiVCp53iULFMhKeGmgf=n_sCohRt3q0Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] powerpc/vdso: Remove unused ENTRY in linker scripts
To: Nathan Chancellor <nathan@kernel.org>
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
Cc: Fangrui Song <maskray@google.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 llvm@lists.linux.dev, patches@lists.linux.dev,
 Paul Mackerras <paulus@samba.org>, Tom Rix <trix@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 9, 2022 at 1:46 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> When linking vdso{32,64}.so.dbg with ld.lld, there is a warning about
> not finding _start for the starting address:
>
>   ld.lld: warning: cannot find entry symbol _start; not setting start address
>   ld.lld: warning: cannot find entry symbol _start; not setting start address
>
> Looking at GCC + GNU ld, the entry point address is 0x0:
>
>   $ llvm-readelf -h vdso{32,64}.so.dbg &| rg "(File|Entry point address):"
>   File: vdso32.so.dbg
>     Entry point address:               0x0
>   File: vdso64.so.dbg
>     Entry point address:               0x0
>
> This matches what ld.lld emits:
>
>   $ powerpc64le-linux-gnu-readelf -p .comment vdso{32,64}.so.dbg
>
>   File: vdso32.so.dbg
>
>   String dump of section '.comment':
>     [     0]  Linker: LLD 14.0.0
>     [    14]  clang version 14.0.0 (Fedora 14.0.0-1.fc37)
>
>   File: vdso64.so.dbg
>
>   String dump of section '.comment':
>     [     0]  Linker: LLD 14.0.0
>     [    14]  clang version 14.0.0 (Fedora 14.0.0-1.fc37)
>
>   $ llvm-readelf -h vdso{32,64}.so.dbg &| rg "(File|Entry point address):"
>   File: vdso32.so.dbg
>     Entry point address:               0x0
>   File: vdso64.so.dbg
>     Entry point address:               0x0
>
> Remove ENTRY to remove the warning, as it is unnecessary for the vDSO to
> function correctly.

Right, the vdso is going to be injected into the process' mappings;
what would it even mean for a DSO to have an entry point?
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  arch/powerpc/kernel/vdso/vdso32.lds.S | 1 -
>  arch/powerpc/kernel/vdso/vdso64.lds.S | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
> index 58e0099f70f4..e0d19d74455f 100644
> --- a/arch/powerpc/kernel/vdso/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
> @@ -13,7 +13,6 @@ OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
>  OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
>  #endif
>  OUTPUT_ARCH(powerpc:common)
> -ENTRY(_start)
>
>  SECTIONS
>  {
> diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
> index 0288cad428b0..1a4a7bc4c815 100644
> --- a/arch/powerpc/kernel/vdso/vdso64.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
> @@ -13,7 +13,6 @@ OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
>  OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
>  #endif
>  OUTPUT_ARCH(powerpc:common64)
> -ENTRY(_start)
>
>  SECTIONS
>  {
> --
> 2.36.1
>


-- 
Thanks,
~Nick Desaulniers
