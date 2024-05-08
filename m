Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D82D28C0021
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 16:35:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UPIaLpzb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZHk75PZBz3cXH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 00:35:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=UPIaLpzb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32a; helo=mail-ot1-x32a.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZHjP6Dwzz3020
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 00:34:47 +1000 (AEST)
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6f08ce51e02so1214532a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 07:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715178884; x=1715783684; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=siRVx/snUNjFKCrOeXvo0bmHNPIKe0N1mufovHth3gA=;
        b=UPIaLpzb4btHAAiFTWRouQhA5uzPPJfwhbkNPro4wXnUguJM72J/dQeEotJTWF7R79
         gwDjXLBvCx6Ci4mf1u0a6TXAFfJfg1v+4sgSNM/zbAqJtMHjrZ12dNXKm0Ed40lxp/X/
         +LDN7x9hCadAR1iylA2zj+jCesW6iM5dYcoKMT3Ht7pvaFD8JnywpSxoejNh80C6FMhG
         veq7zMZzMBV0hadT4UB7W5bOhXxrVNZja3/UsYH9j8D/8nho1ifFmf+Do4tp06qjjlEM
         ltmeqgtLw57J+M8+mI0xYizlntCXYjg/ShMop7l0vfWKtABk8EyR8tNXTSPDF/eXFFjK
         pZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715178884; x=1715783684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=siRVx/snUNjFKCrOeXvo0bmHNPIKe0N1mufovHth3gA=;
        b=tuHZ6xfycdQPbxOq3P5zwuDwwUh0tCzhN1tY8GHmYvt9qWgbzZonSn6hzBhn+pjbKT
         g5acHYT3NRh881uVeiTza/ShfyDKm9gzWcYdbNYAaw/jCHIh4M1d7Grw+ehSZMd6KN7q
         DPdNPSAHDH4iAdScSk/xh9b4PDM7tH6l/LIzMk8MC8t5BUv/mjt43bOfpatYU519VQE0
         r2KlOKzvSKRTP8avVBA/ROCgmN6PGOJ46XzMGffJDiTiO4FobwrAOQEQ7MUcMhHJYB9f
         TJLsBMiTdQNSGZuxOD6qwwk+PIw3yrjGBG6On4RbQaFh/ZgucUm/xcxG1DMlgGDN4ld1
         gt1w==
X-Gm-Message-State: AOJu0Yyb/8kcuY1h7Hwiay3Pk1kW3owhh6YlcN/iUVP1ZbcIzI+O5NvF
	KgxWwmH10KKDsiS5Mew/8GzfguP34VE4TE+4k5Cpb7tMG+B4hfFUY5sB53n7uAu01XbnZcF7Urn
	Xe1cVi3LioeEeirQDpnWQtw0cNVjQsZgcv8w+NQ==
X-Google-Smtp-Source: AGHT+IGumxShjVByOQe/R35U/8zQPy0g7+iBzxrPPaEkNW4QM0ked4asufN+qzk9wWvStxQh+HGs93iE8sH2Y6Jxa2U=
X-Received: by 2002:a05:6808:124e:b0:3c9:73a2:6862 with SMTP id
 5614622812f47-3c9852c5e01mr3076178b6e.31.1715178884096; Wed, 08 May 2024
 07:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240503075619.394467-1-mpe@ellerman.id.au>
In-Reply-To: <20240503075619.394467-1-mpe@ellerman.id.au>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 8 May 2024 20:04:31 +0530
Message-ID: <CA+G9fYvo4--rSTHC1Vxdbbe62O6FhL_P2XdcF2Q7ZRku8HjpGg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] powerpc/io: Avoid clang null pointer arithmetic warnings
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: nathan@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 May 2024 at 13:26, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> With -Wextra clang warns about pointer arithmetic using a null pointer.
> When building with CONFIG_PCI=n, that triggers a warning in the IO
> accessors, eg:
>
>   In file included from linux/arch/powerpc/include/asm/io.h:672:
>   linux/arch/powerpc/include/asm/io-defs.h:23:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      23 | DEF_PCI_AC_RET(inb, u8, (unsigned long port), (port), pio, port)
>         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   ...
>   linux/arch/powerpc/include/asm/io.h:591:53: note: expanded from macro '__do_inb'
>     591 | #define __do_inb(port)          readb((PCI_IO_ADDR)_IO_BASE + port);
>         |                                       ~~~~~~~~~~~~~~~~~~~~~ ^
>
> That is because when CONFIG_PCI=n, _IO_BASE is defined as 0.
>
> Although _IO_BASE is defined as plain 0, the cast (PCI_IO_ADDR) converts
> it to void * before the addition with port happens.
>
> Instead the addition can be done first, and then the cast. The resulting
> value will be the same, but avoids the warning, and also avoids void
> pointer arithmetic which is apparently non-standard.
>
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/all/CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org
