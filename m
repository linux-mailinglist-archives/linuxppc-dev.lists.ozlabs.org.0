Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDA9B0512
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 23:03:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TDs838ZHzF3xj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 07:03:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=ndesaulniers@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="o7jCP9O6"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TDqW5w6GzF3rl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 07:02:14 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id b13so14453847pfo.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 14:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BmSGku8jGWaQdEnWgjS8EmzhMwO0vQvjKEtMVStz3ho=;
 b=o7jCP9O619jk1A8fcSgzAWayhUVzV5ZQt3XJGgqVC4Cr2Y27xwM0ppsCKWoztQnBFe
 tlxVQygRIqQmFJPuPR0h2TaKn4X28eymj7iEHy5QfNAzcyw+h1PHy6PhWu/NIY0vZMBD
 n8pKo9xFCJvpTQpvkgIwlpo9ZNi2ZaT4Bkcdn6IxwAkMN5z2jFsk2bu8EFNjZl6wMEPv
 YZC/7ZBuOj536hHif/679mreNnVxNJUZkYm1f6nUwWPEsPE5MNIzLc6w4DQkazrLePDv
 5uZcD2N56xzSI7oEnq+PfQ5t/ZsBvVzrsSMF1zLSk6B4FwV1Anb0Q3Zq6mkj+Sm0LfyE
 8ZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BmSGku8jGWaQdEnWgjS8EmzhMwO0vQvjKEtMVStz3ho=;
 b=EjpjQl0kx5fsdO7CzyC/rpJpFa6FGtbBdSU1RguiLJlqMXE/PFAYhPt8PuIWAZLB56
 sWhTs/fP4r6xPVDStiJv99a+RB91tze0FCLeaxl9JIVu4ATX9MPsw4FMG6sQmT3Yn9o0
 MCjUQUZfO3FrQevANLhiSlMtnsJN6I+KCuAMRHT6izLnh3CRXUq7DJlcyoB6DFuFW12s
 fWLaSnvj2zVwxhQjZR06ZhXcNxfjtq97cIPCk/gyRcEb4J8p1+KcdMZHBE7oEUfB0BRi
 Yw0gWspG77VuViwtuohcCDC2xj3j4bnzmQvpVYngw+mQAl8JAHymDnbP0tlwfdnsKSJI
 KL8Q==
X-Gm-Message-State: APjAAAV8kg9LXq6o0srFKdrgVLJbDBtmLQYk/CHhzgrfSeRwm39PelL3
 mKfr6Czn1pm/G2DCnyu+PeOKgNRhQchiFmW7LhZ0Iw==
X-Google-Smtp-Source: APXvYqypx9sTdaUqWPw1cVmR3te2mC9wx57XFuE4p0MZXxepRD5h/5pwdXHJeHB20U1iiWL6kUo2AHVEcIsr6mTHga0=
X-Received: by 2002:a65:690b:: with SMTP id s11mr34339694pgq.10.1568235730928; 
 Wed, 11 Sep 2019 14:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20190911182049.77853-4-natechancellor@gmail.com>
In-Reply-To: <20190911182049.77853-4-natechancellor@gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Sep 2019 14:01:59 -0700
Message-ID: <CAKwvOdnh+YoACaX4Oxk7ZiEQAQ2VgA6W=Dtbk7gzK5yJduFvGQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 11, 2019 at 11:21 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> r370454 gives LLVM the ability to convert certain loops into a reference
> to bcmp as an optimization; this breaks prom_init_check.sh:
>
>   CALL    arch/powerpc/kernel/prom_init_check.sh
> Error: External symbol 'bcmp' referenced from prom_init.c
> make[2]: *** [arch/powerpc/kernel/Makefile:196: prom_init_check] Error 1
>
> bcmp is defined in lib/string.c as a wrapper for memcmp so this could be
> added to the whitelist. However, commit 450e7dd4001f ("powerpc/prom_init:
> don't use string functions from lib/") copied memcmp as prom_memcmp to
> avoid KASAN instrumentation so having bcmp be resolved to regular memcmp
> would break that assumption. Furthermore, because the compiler is the
> one that inserted bcmp, we cannot provide something like prom_bcmp.
>
> To prevent LLVM from being clever with optimizations like this, use
> -ffreestanding to tell LLVM we are not hosted so it is not free to make
> transformations like this.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/647
> Link: https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002

The above link doesn't work for me (HTTP 404).  PEBKAC?
https://github.com/llvm/llvm-project/commit/5c9f3cfec78f9e9ae013de9a0d092a68e3e79e002

> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
>
> New patch in the series so no previous version.
>
>  arch/powerpc/kernel/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 19f19c8c874b..aa78b3f6271e 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -21,7 +21,7 @@ CFLAGS_prom_init.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  CFLAGS_btext.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>  CFLAGS_prom.o += $(DISABLE_LATENT_ENTROPY_PLUGIN)
>
> -CFLAGS_prom_init.o += $(call cc-option, -fno-stack-protector)
> +CFLAGS_prom_init.o += $(call cc-option, -fno-stack-protector) -ffreestanding
>
>  ifdef CONFIG_FUNCTION_TRACER
>  # Do not trace early boot code
> --
> 2.23.0
>


-- 
Thanks,
~Nick Desaulniers
