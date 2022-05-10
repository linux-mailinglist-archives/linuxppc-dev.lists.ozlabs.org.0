Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5913F520DCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 08:22:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky7JF1mBcz3c9H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 16:22:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=MzCALGLy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com
 header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=MzCALGLy; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky7HZ705rz2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 16:22:17 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d17so15923836plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 23:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pLsX+xsYEgwEJEwz99NE4N6HjmBRdHv5xHVOacRi1x8=;
 b=MzCALGLyrimjV3VurhfrU/MhuO18uKXyDYWtCNbVxxqRTKTZ8doRsmDAxtqodTGFTY
 WantHJMBW8ivyi1d2ES8sjzA8nzem5rv0P67ldHiXextcSSuhRtA22MMIjLFiPhpvBM5
 b3SumCxRtLYFDMrdv0k5d1Lw4E/m3SbMMHj2LKi4AYUvuJqcFVtZHTk7GPz7bZLxGz6j
 ZVUs1PggCEVAXI6I7wo58iN+VLYymshtWjdNHU4hQQkkbd2auLm6ickvsnG8Cb1OEHuW
 KBAVob7hXXR5R+huTBrf83ulYGi3HIgFScBwshkKAasT+HBETKD6sw10UXEUkaa9veoL
 orRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pLsX+xsYEgwEJEwz99NE4N6HjmBRdHv5xHVOacRi1x8=;
 b=WGdQTqlciXO1G2/adWg6qyZQpoLBQRKvxJ72+8dCy5nJ0dNtMQMhpRl/UFbioQnBuE
 IhaRgInzjQzxL+7y96bkiVS2upeSgwXlRsqF7BWszFx9tWQ5i09rWbMiS90EnpsOPlZe
 pNMJqDK4IHSfGh4xUoVFAVdCBj/CqS8drYh5uc0z2FkpCr3vGVJoTdziOUezGeQf4zJ/
 LWEIYeAkE6B5M240gFehJHpab5pYuz7Z5QsM14B5cTfohS+LqJChvyjONxRP5ChiDT/N
 WX/QZHn4XU1PR5bFdEkLOq+kFUcFLqwG/cG5nFPZJabCugxyDu3APp/5XVwLhQFkkdKs
 T8zg==
X-Gm-Message-State: AOAM530RXh9T0lbSN7KDN6dXE2LBpjH2YbQ4mSzrl7X0lJgqbcNINQ7k
 OEZKBsaw7UD9Ih1Y8GG1Q6q7GA==
X-Google-Smtp-Source: ABdhPJxVburEU+sUT4s6CpJbLeAGJou2OCa9ZWStLyZ2YL9ESmJVKWLG+Zcqv6yZuGBiwjPwLZN7xA==
X-Received: by 2002:a17:902:ea46:b0:15d:dbc:34f2 with SMTP id
 r6-20020a170902ea4600b0015d0dbc34f2mr19070743plg.60.1652163734044; 
 Mon, 09 May 2022 23:22:14 -0700 (PDT)
Received: from [10.61.2.177] (110-175-254-242.static.tpgi.com.au.
 [110.175.254.242]) by smtp.gmail.com with ESMTPSA id
 v13-20020a17090331cd00b0015e8d4eb247sm1026976ple.145.2022.05.09.23.22.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 23:22:13 -0700 (PDT)
Message-ID: <ea0096e5-e1cb-a25d-e5b1-1774c0614397@ozlabs.ru>
Date: Tue, 10 May 2022 16:22:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH 1/2] powerpc/vdso: Remove unused ENTRY in linker scripts
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20220509204635.2539549-1-nathan@kernel.org>
 <20220509204635.2539549-2-nathan@kernel.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20220509204635.2539549-2-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 patches@lists.linux.dev, Paul Mackerras <paulus@samba.org>,
 Tom Rix <trix@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/10/22 06:46, Nathan Chancellor wrote:
> When linking vdso{32,64}.so.dbg with ld.lld, there is a warning about
> not finding _start for the starting address:
> 
>    ld.lld: warning: cannot find entry symbol _start; not setting start address
>    ld.lld: warning: cannot find entry symbol _start; not setting start address
> 
> Looking at GCC + GNU ld, the entry point address is 0x0:
> 
>    $ llvm-readelf -h vdso{32,64}.so.dbg &| rg "(File|Entry point address):"
>    File: vdso32.so.dbg
>      Entry point address:               0x0
>    File: vdso64.so.dbg
>      Entry point address:               0x0
> 
> This matches what ld.lld emits:
> 
>    $ powerpc64le-linux-gnu-readelf -p .comment vdso{32,64}.so.dbg
> 
>    File: vdso32.so.dbg
> 
>    String dump of section '.comment':
>      [     0]  Linker: LLD 14.0.0
>      [    14]  clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
>    File: vdso64.so.dbg
> 
>    String dump of section '.comment':
>      [     0]  Linker: LLD 14.0.0
>      [    14]  clang version 14.0.0 (Fedora 14.0.0-1.fc37)
> 
>    $ llvm-readelf -h vdso{32,64}.so.dbg &| rg "(File|Entry point address):"
>    File: vdso32.so.dbg
>      Entry point address:               0x0
>    File: vdso64.so.dbg
>      Entry point address:               0x0
> 
> Remove ENTRY to remove the warning, as it is unnecessary for the vDSO to
> function correctly.


Sounds more like a bugfix to me - _start is simply not defined, I wonder 
why ld is not complaining.


Tested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>   arch/powerpc/kernel/vdso/vdso32.lds.S | 1 -
>   arch/powerpc/kernel/vdso/vdso64.lds.S | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/vdso/vdso32.lds.S b/arch/powerpc/kernel/vdso/vdso32.lds.S
> index 58e0099f70f4..e0d19d74455f 100644
> --- a/arch/powerpc/kernel/vdso/vdso32.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso32.lds.S
> @@ -13,7 +13,6 @@ OUTPUT_FORMAT("elf32-powerpcle", "elf32-powerpcle", "elf32-powerpcle")
>   OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
>   #endif
>   OUTPUT_ARCH(powerpc:common)
> -ENTRY(_start)
>   
>   SECTIONS
>   {
> diff --git a/arch/powerpc/kernel/vdso/vdso64.lds.S b/arch/powerpc/kernel/vdso/vdso64.lds.S
> index 0288cad428b0..1a4a7bc4c815 100644
> --- a/arch/powerpc/kernel/vdso/vdso64.lds.S
> +++ b/arch/powerpc/kernel/vdso/vdso64.lds.S
> @@ -13,7 +13,6 @@ OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
>   OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
>   #endif
>   OUTPUT_ARCH(powerpc:common64)
> -ENTRY(_start)
>   
>   SECTIONS
>   {
