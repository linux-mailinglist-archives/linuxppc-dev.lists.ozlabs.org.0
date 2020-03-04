Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B225B178B2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 08:16:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XQD75kwHzDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 18:16:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=frLZ0cOj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XQBH0Q8szDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 18:15:02 +1100 (AEDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D1CE621739
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 07:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583306100;
 bh=y/uI56ETxOiF6to8G8JqcU7y5zIAtMZUIPSNK75yQaA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=frLZ0cOjqoDMu/nKrqwr5M/2S0Lg54WCLE57WKjKfgOG4t8G2LcgVlMX8j6p634LX
 dnYDdohb3/f5iLpotWSgwS1JYAQxqB7eXsDCFLauTYZ55KdQM2AIrhB9CCbO6CK+mc
 uMtxUrMe7/de//Ec3ztgKeH/3lwWnQtU2/xq+juY=
Received: by mail-wr1-f50.google.com with SMTP id v2so969133wrp.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2020 23:14:59 -0800 (PST)
X-Gm-Message-State: ANhLgQ38gIwu/c3qfqpAFcWI2GrGg3OYZyPhN1/MNKMOUU9LMMGllRkL
 lFSWw6J7PptkhbQsaQPU0J9Z+ymRO44qHVsIFyb00g==
X-Google-Smtp-Source: ADFU+vsGlLQvbg2b4VyvIhLZsuwvT9bOKvkSVXVxtjdU8xD0muWLXxDg79EArj7HfEYPCjiH5EOmTfKn41X99UZ6YzE=
X-Received: by 2002:adf:f84a:: with SMTP id d10mr2585836wrq.208.1583306093565; 
 Tue, 03 Mar 2020 23:14:53 -0800 (PST)
MIME-Version: 1.0
References: <1583289211-5420-1-git-send-email-nayna@linux.ibm.com>
In-Reply-To: <1583289211-5420-1-git-send-email-nayna@linux.ibm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 4 Mar 2020 08:14:42 +0100
X-Gmail-Original-Message-ID: <CAKv+Gu831SRo+Di6WgKTex40TcOVqNQAdeNLtfQpPdgnvrxucw@mail.gmail.com>
Message-ID: <CAKv+Gu831SRo+Di6WgKTex40TcOVqNQAdeNLtfQpPdgnvrxucw@mail.gmail.com>
Subject: Re: [PATCH v2] ima: add a new CONFIG for loading arch-specific
 policies
To: Nayna Jain <nayna@linux.ibm.com>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Philipp Rudo <prudo@linux.ibm.com>,
 linux-integrity <linux-integrity@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 4 Mar 2020 at 03:34, Nayna Jain <nayna@linux.ibm.com> wrote:
>
> Every time a new architecture defines the IMA architecture specific
> functions - arch_ima_get_secureboot() and arch_ima_get_policy(), the IMA
> include file needs to be updated. To avoid this "noise", this patch
> defines a new IMA Kconfig IMA_SECURE_AND_OR_TRUSTED_BOOT option, allowing
> the different architectures to select it.
>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Philipp Rudo <prudo@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

for the x86 bits, but I'm not an x86 maintainer. Also, you may need to
split this if you want to permit arch maintainers to pick up their
parts individually.


> ---
> v2:
> * Fixed the issue identified by Mimi. Thanks Mimi, Ard, Heiko and Michael for
> discussing the fix.
>
>  arch/powerpc/Kconfig           | 1 +
>  arch/s390/Kconfig              | 1 +
>  arch/x86/Kconfig               | 1 +
>  include/linux/ima.h            | 3 +--
>  security/integrity/ima/Kconfig | 9 +++++++++
>  5 files changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 497b7d0b2d7e..a5cfde432983 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -979,6 +979,7 @@ config PPC_SECURE_BOOT
>         bool
>         depends on PPC_POWERNV
>         depends on IMA_ARCH_POLICY
> +       select IMA_SECURE_AND_OR_TRUSTED_BOOT
>         help
>           Systems with firmware secure boot enabled need to define security
>           policies to extend secure boot to the OS. This config allows a user
> diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
> index 8abe77536d9d..4a502fbcb800 100644
> --- a/arch/s390/Kconfig
> +++ b/arch/s390/Kconfig
> @@ -195,6 +195,7 @@ config S390
>         select ARCH_HAS_FORCE_DMA_UNENCRYPTED
>         select SWIOTLB
>         select GENERIC_ALLOCATOR
> +       select IMA_SECURE_AND_OR_TRUSTED_BOOT if IMA_ARCH_POLICY
>
>
>  config SCHED_OMIT_FRAME_POINTER
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index beea77046f9b..7f5bfaf0cbd2 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -230,6 +230,7 @@ config X86
>         select VIRT_TO_BUS
>         select X86_FEATURE_NAMES                if PROC_FS
>         select PROC_PID_ARCH_STATUS             if PROC_FS
> +       select IMA_SECURE_AND_OR_TRUSTED_BOOT   if EFI && IMA_ARCH_POLICY
>
>  config INSTRUCTION_DECODER
>         def_bool y
> diff --git a/include/linux/ima.h b/include/linux/ima.h
> index 1659217e9b60..aefe758f4466 100644
> --- a/include/linux/ima.h
> +++ b/include/linux/ima.h
> @@ -30,8 +30,7 @@ extern void ima_kexec_cmdline(const void *buf, int size);
>  extern void ima_add_kexec_buffer(struct kimage *image);
>  #endif
>
> -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
> -       || defined(CONFIG_PPC_SECURE_BOOT)
> +#ifdef CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
>  extern bool arch_ima_get_secureboot(void);
>  extern const char * const *arch_get_ima_policy(void);
>  #else
> diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
> index 3f3ee4e2eb0d..d17972aa413a 100644
> --- a/security/integrity/ima/Kconfig
> +++ b/security/integrity/ima/Kconfig
> @@ -327,3 +327,12 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>         depends on IMA_MEASURE_ASYMMETRIC_KEYS
>         depends on SYSTEM_TRUSTED_KEYRING
>         default y
> +
> +config IMA_SECURE_AND_OR_TRUSTED_BOOT
> +       bool
> +       depends on IMA
> +       depends on IMA_ARCH_POLICY

Doesn't the latter already depend on the former?

> +       default n
> +       help
> +          This option is selected by architectures to enable secure and/or
> +          trusted boot based on IMA runtime policies.
> --
> 2.13.6
>
