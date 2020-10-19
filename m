Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C2929322C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 01:59:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFYd64FG6zDqVk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 10:59:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=maskray@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=D5mtZZgB; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFYb55kbwzDqQr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 10:57:15 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id o9so640370plx.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 16:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQSNC12yNalFEtN5vp/6lAiD5EYqFyhFHtMV06l0mhw=;
 b=D5mtZZgBdmMFz1/OmwmTHKRYAqc4qukIOkrzwVLtP0ZCCuS1DRbIRlmDdu9XO/6+Ja
 W+yTxUOJMdu5e+gYDYpjbvM7B/KJgxDmvPZ0WXKxL4FDfLN+PBEFV7lK6STui0Xl6s0h
 cGgKq0rF0QMg36WnwIg4nazdYc5vI3tQFluQUlP+ebgr1wXaiVAKe4/CXS0dU79tL/cp
 v+X+lLTHvl78t+ors7pCG8rK5TR1fmbW1bE0+ctHkrcIyEgGHzPacGJRV3g7dqGhviVL
 K3ths2/ZIvHaEwjulGQbcdK+4ZHA4LcGsyHFTg18NfPkgPb6YwZbOqWXYP5uYWmGKbKF
 2ZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQSNC12yNalFEtN5vp/6lAiD5EYqFyhFHtMV06l0mhw=;
 b=nng81yNCLhJFg1JYc1l0SyR4XgKsNPyZUfVAQcTjkI5D9KK//4VvJzmIrXWkBNw3SK
 oY8JWzpYZOn2oQ/wqxwTsIZ/z3VcLsuV+qUtXlBk75pMLudAPi7hAD2B7qU7ALPiXnD2
 bFjUWk4SNM5hDUzk6wx9Hv/kpq4/KA9pZWUEVs0ROSh4/+RQgewsIONCT1syvdkBF2yd
 8hbQlTq2zXBZL585JxvtvcqnIJutWrLWZvkPXEH7Tzb8sQ0amTzgSAn923YH74KGty5C
 vIp7+lPHZbxGCA4vG+yRYEmLQfA5mX3sX8HlL0cvLhe8nrT3JDv5jzvWbY2n9q2CJimM
 S1rA==
X-Gm-Message-State: AOAM532rAnTVFYwt7JjQRRk/9iuf1F4Rr4+0LTKonOl+l1tOQGPh3pP8
 NUXSb+M57P5c8WCOC0qUnV6vRBXiF96fTkPmx+w4Kg==
X-Google-Smtp-Source: ABdhPJxvDcf/4qz/36OhKXPc7T5pFcqqwlWartR0Gcc7fOK7U9MGWXyvG4enWKuOQ3MhyaEyrvYBdAFC/1kAKIuDDCs=
X-Received: by 2002:a17:90a:8002:: with SMTP id b2mr248558pjn.47.1603151830680; 
 Mon, 19 Oct 2020 16:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20201017000151.150788-1-morbo@google.com>
In-Reply-To: <20201017000151.150788-1-morbo@google.com>
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date: Mon, 19 Oct 2020 16:56:59 -0700
Message-ID: <CAFP8O3+Mg6B4WnDzAnT43132JTbtKgkK7JFwm8Sqhc1m0CzY1g@mail.gmail.com>
Subject: Re: [PATCH] powerpc/boot: move the .got section to after the .dynamic
 section
To: Bill Wendling <morbo@google.com>
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
Cc: Alan Modra <amodra@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 16, 2020 at 5:01 PM Bill Wendling <morbo@google.com> wrote:
>
> Both .dynamic and .got are RELRO sections and should be placed together,
> and LLD emits an error:
>
>   ld.lld: error: section: .got is not contiguous with other relro sections
>
> Place them together to avoid this.
>
> Cc: Fangrui Song <maskray@google.com>
> Cc: Alan Modra <amodra@gmail.com>
> Signed-off-by: Bill Wendling <morbo@google.com>
> ---
>  arch/powerpc/boot/zImage.lds.S | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
> index a21f3a76e06f..d6f072865627 100644
> --- a/arch/powerpc/boot/zImage.lds.S
> +++ b/arch/powerpc/boot/zImage.lds.S
> @@ -34,6 +34,17 @@ SECTIONS
>      __dynamic_start = .;
>      *(.dynamic)
>    }
> +
> +#ifdef CONFIG_PPC64_BOOT_WRAPPER
> +  . = ALIGN(256);
> +  .got :
> +  {
> +    __toc_start = .;
> +    *(.got)
> +    *(.toc)
> +  }
> +#endif
> +
>    .hash : { *(.hash) }
>    .interp : { *(.interp) }
>    .rela.dyn :
> @@ -76,16 +87,6 @@ SECTIONS
>      _esm_blob_end =  .;
>    }
>
> -#ifdef CONFIG_PPC64_BOOT_WRAPPER
> -  . = ALIGN(256);
> -  .got :
> -  {
> -    __toc_start = .;
> -    *(.got)
> -    *(.toc)
> -  }
> -#endif

The kernel does not require this but normally all read-only sections
precede SHF_WRITE sections.
.dynamic and .got have the SHF_WRITE flag and should be placed here.

Ideally, the order is: R RX RW(RELRO) RW(non-RELRO)  (LLD order)

For comparison:
GNU ld -z separate-code order: R RX R RW(RELRO) RW(non-RELRO) (GNU
ld>=2.31 enables -z separate-code by default for Linux x86)
GNU ld -z noseparate-code order: RX RW(RELRO) RW(non-RELRO)

(AFAIK The only reason .dynamic is writable is due to DT_DEBUG (whose
purpose is questionable nowadays). mips .dynamic is read-only. LLD has
an option -z rodynamic to make .dynamic readonly)

>    . = ALIGN(4096);
>    .bss       :
>    {
> --
> 2.29.0.rc1.297.gfa9743e501-goog
>
