Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56883823F13
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 10:56:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OHFkUtqf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5MRs2zkBz3cTL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 20:56:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OHFkUtqf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=chenhuacai@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5MR40ZdJz2yky
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 20:55:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 77017CE16FD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 09:55:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C12CC433D9
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 09:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704362139;
	bh=NUKoeng2TtOuvmS1QuUleD7BGl+JqWw7EjY22X+zMeE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OHFkUtqftfj+SZv9SeaQruKnYEQ+cq+CUVLhdhS4ctC5mJde61oZpomnZp+ecLocl
	 edGdjmqnCNVqcSE+r/1BHCS9HtiWkfJlVSxkDAqPGjrXpj3m1RESX+i8Du30XCZhoc
	 Phx4BiVKMLfV6iWckC4A+sp0BbGfUzv2NrDh9iOsqfiDWgJJBXqcmWjicme7o2UqjD
	 OMdDO97BJHjpoD64eKNTbxVRZi2a6R+/ZwjD90Vah4KdwTLgLKFVkFiJMEVPIBQPIC
	 QoCG2KHOziSdqLfOlz01MyVVY2UGekeYO2k3gZN/0V0FQCNOuMwCjTEqTwRZOK3QMU
	 ZsLwm/ZTJ1jcQ==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28ac851523so36308666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jan 2024 01:55:39 -0800 (PST)
X-Gm-Message-State: AOJu0Yy3nr98WcrdzeWP+CeBUEBwOxkGR7QQFU3AqqNrUD6aptX2N8H8
	6ygBt+M/EFkkC22tbyEplPxAcIChu3wFY4dSNG4=
X-Google-Smtp-Source: AGHT+IEKmcnwqgygVH9sZZQyzsnOvSR/gqjMEXN+FYG4pXKZGSTboqY34lxGfMFTo2QI4qDTuxyc5MRzDYiHeKc4cMU=
X-Received: by 2002:a17:906:a94:b0:a28:9633:d599 with SMTP id
 y20-20020a1709060a9400b00a289633d599mr160134ejf.18.1704362137704; Thu, 04 Jan
 2024 01:55:37 -0800 (PST)
MIME-Version: 1.0
References: <20231228014220.3562640-1-samuel.holland@sifive.com> <20231228014220.3562640-8-samuel.holland@sifive.com>
In-Reply-To: <20231228014220.3562640-8-samuel.holland@sifive.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 4 Jan 2024 17:55:32 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
Message-ID: <CAAhV-H5TJPqRcgS6jywWDSNsCvd-PsVacgxgoiF-fJ00ZnS4uA@mail.gmail.com>
Subject: Re: [PATCH v2 07/14] LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
To: Samuel Holland <samuel.holland@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, WANG Xuerui <git@xen0n.name>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi, Samuel,

On Thu, Dec 28, 2023 at 9:42=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> LoongArch already provides kernel_fpu_begin() and kernel_fpu_end() in
> asm/fpu.h, so it only needs to add kernel_fpu_available() and export
> the CFLAGS adjustments.
>
> Acked-by: WANG Xuerui <git@xen0n.name>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> (no changes since v1)
>
>  arch/loongarch/Kconfig           | 1 +
>  arch/loongarch/Makefile          | 5 ++++-
>  arch/loongarch/include/asm/fpu.h | 1 +
>  3 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index ee123820a476..65d4475565b8 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -15,6 +15,7 @@ config LOONGARCH
>         select ARCH_HAS_CPU_FINALIZE_INIT
>         select ARCH_HAS_FORTIFY_SOURCE
>         select ARCH_HAS_KCOV
> +       select ARCH_HAS_KERNEL_FPU_SUPPORT if CPU_HAS_FPU
>         select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>         select ARCH_HAS_PTE_SPECIAL
> diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
> index 4ba8d67ddb09..1afe28feaba5 100644
> --- a/arch/loongarch/Makefile
> +++ b/arch/loongarch/Makefile
> @@ -25,6 +25,9 @@ endif
>  32bit-emul             =3D elf32loongarch
>  64bit-emul             =3D elf64loongarch
>
> +CC_FLAGS_FPU           :=3D -mfpu=3D64
> +CC_FLAGS_NO_FPU                :=3D -msoft-float
We will add LoongArch32 support later, maybe it should be -mfpu=3D32 in
that case, and do other archs have the case that only support FP32?

Huacai

> +
>  ifdef CONFIG_DYNAMIC_FTRACE
>  KBUILD_CPPFLAGS +=3D -DCC_USING_PATCHABLE_FUNCTION_ENTRY
>  CC_FLAGS_FTRACE :=3D -fpatchable-function-entry=3D2
> @@ -46,7 +49,7 @@ ld-emul                       =3D $(64bit-emul)
>  cflags-y               +=3D -mabi=3Dlp64s
>  endif
>
> -cflags-y                       +=3D -pipe -msoft-float
> +cflags-y                       +=3D -pipe $(CC_FLAGS_NO_FPU)
>  LDFLAGS_vmlinux                        +=3D -static -n -nostdlib
>
>  # When the assembler supports explicit relocation hint, we must use it.
> diff --git a/arch/loongarch/include/asm/fpu.h b/arch/loongarch/include/as=
m/fpu.h
> index c2d8962fda00..3177674228f8 100644
> --- a/arch/loongarch/include/asm/fpu.h
> +++ b/arch/loongarch/include/asm/fpu.h
> @@ -21,6 +21,7 @@
>
>  struct sigcontext;
>
> +#define kernel_fpu_available() cpu_has_fpu
>  extern void kernel_fpu_begin(void);
>  extern void kernel_fpu_end(void);
>
> --
> 2.42.0
>
>
