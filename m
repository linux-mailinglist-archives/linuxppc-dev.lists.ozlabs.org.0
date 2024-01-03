Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 693A8822F7B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jan 2024 15:28:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XzYCGnD3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T4sXY0nm6z3cTH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 01:28:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XzYCGnD3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=alexdeucher@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T4sWk6q3xz3bX5
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 01:28:01 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6dbffc3b1c2so2170634a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jan 2024 06:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704292079; x=1704896879; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a349tfFo0Tz6+yladu1vGz3cOOaSViS9QyeDAzXiKtI=;
        b=XzYCGnD35AS18gYdjA3jl8PKvDdiCK2xx+MWxJQGa730szDFL1TAk0M1x5iR5Z1awq
         /yb6ysdCGuYSl7U7d1esskva+6rzassn/t9D5ogXt+mgYcQVE9mBhy8+CpBg0JCIWGXP
         lR6j7O2NzOEwu1bJutPlonKPy+G92folFTrRoN4CzllpYiDtVJkaq0ytYaBOqzs+sobJ
         6mnzA4tFPuyo/C9RWU8U+Gf8RJD/OXVFu5fDQ+Z5zSyvfQ+GI6/kxCnPh9F1OM4n3UPm
         Rqg7a20lMWQ2mYMJlIQoGNFdG8F3AwHtyxYPps0kJEBhc34XkgRWNiANmfTnQf3NzC4p
         +c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704292079; x=1704896879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a349tfFo0Tz6+yladu1vGz3cOOaSViS9QyeDAzXiKtI=;
        b=lCJ3ML/lEfmxmwEU9GDl9t+1FDzSJG9d0hrxYvUyw1HMIlmKv5+9l+O1Oai0SOOhqX
         fwBFl5Ly0b/+MgjLSVPvUa6lpHxgOemQ2eo+DdXO6dDhJFakL644yTYc1Fp/rS7Mwx8u
         lA/eRLS+B8LokA5a6JXEPqcvW6zrKEr+XKP9iAoD6DSpZxf5OM6V0bGkc/U5+3i9cnDb
         Dj+8WTjyIlfXn9VdtD7f3W17RsUjTc9Ua2XxNWDr0yw0jFhqtnuh+sXP2an5RkVJRtXD
         UgeHenvIyELh+vqMa5d1lix2DAvf35S3+l5B7Xk1bcK0CBj2kyztU7hjDVpNh+aem+yL
         uOIw==
X-Gm-Message-State: AOJu0YxlmkzPyC1PVliseiiaMkAVY32OI/k+v5YWxUhPvM0sTiVpXnKZ
	m+Eby8Q5WEXsW38oBbZzh10XoOigm9Cv8yamzDA=
X-Google-Smtp-Source: AGHT+IHjuxm+WsGold4msvLzUcwvASXsLbNWaImZQEtNmF+UM28LD4T6ctfH3u7LonFz90aecPkvdKH3c/Z8VWiEa/Q=
X-Received: by 2002:a05:6871:2b02:b0:204:32f7:6668 with SMTP id
 dr2-20020a0568712b0200b0020432f76668mr8870200oac.34.1704292078704; Wed, 03
 Jan 2024 06:27:58 -0800 (PST)
MIME-Version: 1.0
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jan 2024 09:27:47 -0500
Message-ID: <CADnq5_Pub0UULb6UqO2g+Eo6RCy=gqtWLN9txjEyp2Gmw9idww@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Unified cross-architecture kernel-mode FPU API
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 28, 2023 at 5:11=E2=80=AFAM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> This series unifies the kernel-mode FPU API across several architectures
> by wrapping the existing functions (where needed) in consistently-named
> functions placed in a consistent header location, with mostly the same
> semantics: they can be called from preemptible or non-preemptible task
> context, and are not assumed to be reentrant. Architectures are also
> expected to provide CFLAGS adjustments for compiling FPU-dependent code.
> For the moment, SIMD/vector units are out of scope for this common API.
>
> This allows us to remove the ifdeffery and duplicated Makefile logic at
> each FPU user. It then implements the common API on RISC-V, and converts
> a couple of users to the new API: the AMDGPU DRM driver, and the FPU
> self test.
>
> The underlying goal of this series is to allow using newer AMD GPUs
> (e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
> GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
> FPU support.

Series is:
Acked-by: Alex Deucher <alexander.deucher@amd.com>

>
> Previous versions:
> v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.=
holland@sifive.com/
> v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.=
holland@sifive.com/
>
> Changes in v2:
>  - Add documentation explaining the built-time and runtime APIs
>  - Add a linux/fpu.h header for generic isolation enforcement
>  - Remove file name from header comment
>  - Clean up arch/arm64/lib/Makefile, like for arch/arm
>  - Remove RISC-V architecture-specific preprocessor check
>  - Split altivec removal to a separate patch
>  - Use linux/fpu.h instead of asm/fpu.h in consumers
>  - Declare test_fpu() in a header
>
> Michael Ellerman (1):
>   drm/amd/display: Only use hard-float, not altivec on powerpc
>
> Samuel Holland (13):
>   arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
>   ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>   arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>   lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
>   LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>   riscv: Add support for kernel-mode FPU
>   drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
>   selftests/fpu: Move FP code to a separate translation unit
>   selftests/fpu: Allow building on other architectures
>
>  Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
>  Documentation/core-api/index.rst              |  1 +
>  Makefile                                      |  5 ++
>  arch/Kconfig                                  |  6 ++
>  arch/arm/Kconfig                              |  1 +
>  arch/arm/Makefile                             |  7 ++
>  arch/arm/include/asm/fpu.h                    | 15 ++++
>  arch/arm/lib/Makefile                         |  3 +-
>  arch/arm64/Kconfig                            |  1 +
>  arch/arm64/Makefile                           |  9 ++-
>  arch/arm64/include/asm/fpu.h                  | 15 ++++
>  arch/arm64/lib/Makefile                       |  6 +-
>  arch/loongarch/Kconfig                        |  1 +
>  arch/loongarch/Makefile                       |  5 +-
>  arch/loongarch/include/asm/fpu.h              |  1 +
>  arch/powerpc/Kconfig                          |  1 +
>  arch/powerpc/Makefile                         |  5 +-
>  arch/powerpc/include/asm/fpu.h                | 28 +++++++
>  arch/riscv/Kconfig                            |  1 +
>  arch/riscv/Makefile                           |  3 +
>  arch/riscv/include/asm/fpu.h                  | 16 ++++
>  arch/riscv/kernel/Makefile                    |  1 +
>  arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
>  arch/x86/Kconfig                              |  1 +
>  arch/x86/Makefile                             | 20 +++++
>  arch/x86/include/asm/fpu.h                    | 13 ++++
>  drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
>  drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
>  drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
>  include/linux/fpu.h                           | 12 +++
>  lib/Kconfig.debug                             |  2 +-
>  lib/Makefile                                  | 26 +------
>  lib/raid6/Makefile                            | 31 ++------
>  lib/test_fpu.h                                |  8 ++
>  lib/{test_fpu.c =3D> test_fpu_glue.c}           | 37 ++-------
>  lib/test_fpu_impl.c                           | 37 +++++++++
>  37 files changed, 343 insertions(+), 190 deletions(-)
>  create mode 100644 Documentation/core-api/floating-point.rst
>  create mode 100644 arch/arm/include/asm/fpu.h
>  create mode 100644 arch/arm64/include/asm/fpu.h
>  create mode 100644 arch/powerpc/include/asm/fpu.h
>  create mode 100644 arch/riscv/include/asm/fpu.h
>  create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
>  create mode 100644 arch/x86/include/asm/fpu.h
>  create mode 100644 include/linux/fpu.h
>  create mode 100644 lib/test_fpu.h
>  rename lib/{test_fpu.c =3D> test_fpu_glue.c} (71%)
>  create mode 100644 lib/test_fpu_impl.c
>
> --
> 2.42.0
>
