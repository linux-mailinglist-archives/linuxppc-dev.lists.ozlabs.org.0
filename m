Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E41C6829CD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 15:52:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=i4C5p4qA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T99kj36klz3cTT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 01:52:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=i4C5p4qA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T99jr2bzdz30fm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 01:51:42 +1100 (AEDT)
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7beda6a274bso57671939f.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 06:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1704898299; x=1705503099; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UlRr87AfARWxTIrPYo3v1voc73TzaNkp96EPHRmj2xU=;
        b=i4C5p4qA8WJC8+auQQrVYBQrnUp1OGZqqV5kRczddmjQbNBvK+N0ITv28LiGnPRMnv
         ItxZLJil4lDlx5FDfXQy+MdFZFoMO33Qp+7izXYYtCbP6sS2JS/7+yi4Htk81Ty20ufI
         +qgZYoKVMhuHM+JQOsGMC3iC2tFBIZ6nZJRDUGdYJnUAFaj8lBDxMXVJaZkLWuUiJil0
         XHJqU2WupAcwfaHAXJHqvMYMUGwt7f8rVkWSrQL25jIXuLqVPSQnPY9vXJ0/K868DPBE
         m3qn7caQzL5GwAdlzH11879kR5o+jw12jcUXVv2nWd6egnmsXPuikDZtkKZ4YtW3f1A6
         yzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704898299; x=1705503099;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlRr87AfARWxTIrPYo3v1voc73TzaNkp96EPHRmj2xU=;
        b=sJgT2LWHWJkr1qVGuWPJiksn79dJv3rp0/Hs/q/cy8/Pv++zk1oWP8iX6dGRKKa5ad
         kK2s05xMXHo3KvXeik2WjBBWyViuUu8CAIsV/3HP/Dh9V8nN+Y7iUyl6awTpycghv9SQ
         PQWYRlIiz1Df2t0ClnEvGL/Z+VmVnISZpv3r3O7xdq23CLJEVRdla+pOKw68u4/HPUUW
         HzB1ZeWAm/syN+/M4vzt99fS+ATFooID1/Llq9FkHjpfs6WY1IgEGLv/0B7X+l3aeCnG
         AIUZFitfwcFei6dP96HgBLqcHuTLfu8tLPuP+CfPwkjOv2og0la3/qP3jQn19Fb+WCwD
         QwFw==
X-Gm-Message-State: AOJu0YyMnPwlDu6ikl69MwlFgULTtGUYmysrPNaYh1NDl0KAqbLkzmrh
	/qEBgxACw2v9Fzunk+VaImAAnGbjjfSaxg==
X-Google-Smtp-Source: AGHT+IESMcbobMlRjbgJYfocjXsZ0yo/qo6i1dK8eo1VFgWRNLIDb9r8HTjU5OKJKjNYljfVT1tLPg==
X-Received: by 2002:a05:6602:131d:b0:7bc:838:6665 with SMTP id h29-20020a056602131d00b007bc08386665mr986219iov.28.1704898299159;
        Wed, 10 Jan 2024 06:51:39 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id k12-20020a02c64c000000b0046e304dc641sm1319869jan.95.2024.01.10.06.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:51:38 -0800 (PST)
Date: Wed, 10 Jan 2024 06:51:38 -0800 (PST)
X-Google-Original-Date: Wed, 10 Jan 2024 06:51:33 PST (-0800)
Subject: Re: [PATCH v2 10/14] riscv: Add support for kernel-mode FPU
In-Reply-To: <20231228014220.3562640-11-samuel.holland@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-3e4b97f6-8310-487e-9f9a-1d19d6e42a1e@palmer-ri-x1c9>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, samuel.holland@sifive.com, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Dec 2023 17:42:00 PST (-0800), samuel.holland@sifive.com wrote:
> This is motivated by the amdgpu DRM driver, which needs floating-point
> code to support recent hardware. That code is not performance-critical,
> so only provide a minimal non-preemptible implementation for now.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
> Changes in v2:
>  - Remove RISC-V architecture-specific preprocessor check
>
>  arch/riscv/Kconfig                  |  1 +
>  arch/riscv/Makefile                 |  3 +++
>  arch/riscv/include/asm/fpu.h        | 16 ++++++++++++++++
>  arch/riscv/kernel/Makefile          |  1 +
>  arch/riscv/kernel/kernel_mode_fpu.c | 28 ++++++++++++++++++++++++++++
>  5 files changed, 49 insertions(+)
>  create mode 100644 arch/riscv/include/asm/fpu.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 24c1799e2ec4..4d4d1d64ce34 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -27,6 +27,7 @@ config RISCV
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_KCOV
> +	select ARCH_HAS_KERNEL_FPU_SUPPORT if FPU
>  	select ARCH_HAS_MMIOWB
>  	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>  	select ARCH_HAS_PMEM_API
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index a74be78678eb..2e719c369210 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -81,6 +81,9 @@ KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
>
>  KBUILD_AFLAGS += -march=$(riscv-march-y)
>
> +# For C code built with floating-point support, exclude V but keep F and D.
> +CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
> +
>  KBUILD_CFLAGS += -mno-save-restore
>  KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
>
> diff --git a/arch/riscv/include/asm/fpu.h b/arch/riscv/include/asm/fpu.h
> new file mode 100644
> index 000000000000..91c04c244e12
> --- /dev/null
> +++ b/arch/riscv/include/asm/fpu.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2023 SiFive
> + */
> +
> +#ifndef _ASM_RISCV_FPU_H
> +#define _ASM_RISCV_FPU_H
> +
> +#include <asm/switch_to.h>
> +
> +#define kernel_fpu_available()	has_fpu()
> +
> +void kernel_fpu_begin(void);
> +void kernel_fpu_end(void);
> +
> +#endif /* ! _ASM_RISCV_FPU_H */
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index fee22a3d1b53..662c483e338d 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
>  obj-$(CONFIG_FPU)		+= fpu.o
> +obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
>  obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
>  obj-$(CONFIG_SMP)		+= smpboot.o
>  obj-$(CONFIG_SMP)		+= smp.o
> diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
> new file mode 100644
> index 000000000000..0ac8348876c4
> --- /dev/null
> +++ b/arch/riscv/kernel/kernel_mode_fpu.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 SiFive
> + */
> +
> +#include <linux/export.h>
> +#include <linux/preempt.h>
> +
> +#include <asm/csr.h>
> +#include <asm/fpu.h>
> +#include <asm/processor.h>
> +#include <asm/switch_to.h>
> +
> +void kernel_fpu_begin(void)
> +{
> +	preempt_disable();
> +	fstate_save(current, task_pt_regs(current));
> +	csr_set(CSR_SSTATUS, SR_FS);
> +}
> +EXPORT_SYMBOL_GPL(kernel_fpu_begin);
> +
> +void kernel_fpu_end(void)
> +{
> +	csr_clear(CSR_SSTATUS, SR_FS);
> +	fstate_restore(current, task_pt_regs(current));
> +	preempt_enable();
> +}
> +EXPORT_SYMBOL_GPL(kernel_fpu_end);

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

assuming you want to keep these together -- it touches a lot of stuff, 
so LMK if you want me to pick something up.

Thanks!
