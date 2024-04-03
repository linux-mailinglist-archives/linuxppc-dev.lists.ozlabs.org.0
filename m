Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D6896F5A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 14:51:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EVuG3iRb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8l4m5Wjwz3vsp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Apr 2024 23:51:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EVuG3iRb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=ckoenig.leichtzumerken@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8l413xNZz3vp0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Apr 2024 23:51:12 +1100 (AEDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-41569f1896dso19616955e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Apr 2024 05:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712148669; x=1712753469; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29BgQt41fxpDRMixAlECbaCmewv1mm5rdtRovSAulMA=;
        b=EVuG3iRbx90e4M4tEph5jBXxramPHDwKqOMRlzfGn+uH4yx4zXMiBpShFgK6tEbUHC
         3EYDbEi5rs6ikgoYOljwXXC6BLCd9yjgzDRIvWQj6r2pxa+BFJeY9gUAUPqvj8BMYu2R
         MLAJqfAzjsRoy2FYHhy+zsAGFvbR+BoFhqr6GjJfq40K8I78QyQn03OE7LakeLDlciGl
         CErjiq4VFAKjHbXDwLx71crgMhi1t3WAuw+eIqCpt+tPdxujLhXy4PoYI0ahSyhX1xwr
         VPON6XHJ89/v5v7y+9r+TfNOUzPZBFqXxBusFSEwt0cTTCchXUHTtoKrRtwPewvkO4I/
         WibA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148669; x=1712753469;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29BgQt41fxpDRMixAlECbaCmewv1mm5rdtRovSAulMA=;
        b=NgxyW0tjhhUDjWIUCZ7vu7KBEZkpDNQHK8X26FhvgJbolIN22cjEhYasUSBufsGEOf
         Sw9tbYbD3tEC30NW+WEADK0VK5pEwA1aGrUSF8NQPKWlsZ+oEcKnbSilE/bp/lfYX9Bv
         4XAJwQ6LQWlnDz4ZARaxPZ/8eXMZnJPiUPa8H1i5KrsiJqz93aL1R4wlrgjU7U9iEAV2
         T6Eyq9XPIz7stiyx5pNL3W46+A5YYxWRL8gEY3K5cpU3mLaAcuDLaq7tFdOIGx5MnMNU
         QbgtnCNmMGKB2zJUETgpwZbqC+5+mTalHLf8rqgqWfBbGwmf7/jSE0WcLOmNEJ5TXilQ
         zkpg==
X-Forwarded-Encrypted: i=1; AJvYcCULqU6hdwZqyPCwKF4fZuMFX14wGRJ3k8eMKwOK5iN8NpOlrrKzbmDpi6K0femXo4PJofPb/R+QZ4O/b/Mgjt3eFhkTjLzTQG8JlfufXQ==
X-Gm-Message-State: AOJu0Yy+gnbmoVx1gLRzBL5j8AtChpMplh2afIx9Cah85VE9aIBjpws/
	QBmw0JFmbSgWjDSR4DD+p+SnsMNjLnjK09dIIqs6aNRuWlwzUjke
X-Google-Smtp-Source: AGHT+IGiMxFFkzEMKwErZDGMsEh8QQujgECEb7hAYrnmXSB8PanQ6hfDeg6f6lJ/1vv3KfoIi9fU0w==
X-Received: by 2002:a05:600c:5710:b0:414:9103:e38c with SMTP id jv16-20020a05600c571000b004149103e38cmr10494666wmb.22.1712148669149;
        Wed, 03 Apr 2024 05:51:09 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id dj11-20020a0560000b0b00b003437799a373sm3724238wrb.83.2024.04.03.05.51.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 05:51:08 -0700 (PDT)
Message-ID: <0c95aa84-63e6-41be-8c70-3a6dadefd682@gmail.com>
Date: Wed, 3 Apr 2024 14:51:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] Unified cross-architecture kernel-mode FPU API
To: Samuel Holland <samuel.holland@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org
References: <20240329072441.591471-1-samuel.holland@sifive.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I only skimmed over the platform patches and spend only a few minutes on 
the amdgpu stuff.

 From what I've seen this series seems to make perfect sense to me, I 
just can't fully judge everything.

So feel free to add Acked-by: Christian König <christian.koenig@amd.com> 
but I strongly suggest that Harry and Rodrigo take a look as well.

Regards,
Christian.

Am 29.03.24 um 08:18 schrieb Samuel Holland:
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
>
> Previous versions:
> v3: https://lore.kernel.org/linux-kernel/20240327200157.1097089-1-samuel.holland@sifive.com/
> v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
> v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
> v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/
>
> Changes in v4:
>   - Add missed CFLAGS changes for recov_neon_inner.c
>     (fixes arm build failures)
>   - Fix x86 include guard issue (fixes x86 build failures)
>
> Changes in v3:
>   - Rebase on v6.9-rc1
>   - Limit riscv ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT
>
> Changes in v2:
>   - Add documentation explaining the built-time and runtime APIs
>   - Add a linux/fpu.h header for generic isolation enforcement
>   - Remove file name from header comment
>   - Clean up arch/arm64/lib/Makefile, like for arch/arm
>   - Remove RISC-V architecture-specific preprocessor check
>   - Split altivec removal to a separate patch
>   - Use linux/fpu.h instead of asm/fpu.h in consumers
>   - Declare test_fpu() in a header
>
> Michael Ellerman (1):
>    drm/amd/display: Only use hard-float, not altivec on powerpc
>
> Samuel Holland (14):
>    arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
>    ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>    arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
>    lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
>    LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    x86/fpu: Fix asm/fpu/types.h include guard
>    x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
>    riscv: Add support for kernel-mode FPU
>    drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
>    selftests/fpu: Move FP code to a separate translation unit
>    selftests/fpu: Allow building on other architectures
>
>   Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
>   Documentation/core-api/index.rst              |  1 +
>   Makefile                                      |  5 ++
>   arch/Kconfig                                  |  6 ++
>   arch/arm/Kconfig                              |  1 +
>   arch/arm/Makefile                             |  7 ++
>   arch/arm/include/asm/fpu.h                    | 15 ++++
>   arch/arm/lib/Makefile                         |  3 +-
>   arch/arm64/Kconfig                            |  1 +
>   arch/arm64/Makefile                           |  9 ++-
>   arch/arm64/include/asm/fpu.h                  | 15 ++++
>   arch/arm64/lib/Makefile                       |  6 +-
>   arch/loongarch/Kconfig                        |  1 +
>   arch/loongarch/Makefile                       |  5 +-
>   arch/loongarch/include/asm/fpu.h              |  1 +
>   arch/powerpc/Kconfig                          |  1 +
>   arch/powerpc/Makefile                         |  5 +-
>   arch/powerpc/include/asm/fpu.h                | 28 +++++++
>   arch/riscv/Kconfig                            |  1 +
>   arch/riscv/Makefile                           |  3 +
>   arch/riscv/include/asm/fpu.h                  | 16 ++++
>   arch/riscv/kernel/Makefile                    |  1 +
>   arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
>   arch/x86/Kconfig                              |  1 +
>   arch/x86/Makefile                             | 20 +++++
>   arch/x86/include/asm/fpu.h                    | 13 ++++
>   arch/x86/include/asm/fpu/types.h              |  6 +-
>   drivers/gpu/drm/amd/display/Kconfig           |  2 +-
>   .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
>   drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
>   drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
>   include/linux/fpu.h                           | 12 +++
>   lib/Kconfig.debug                             |  2 +-
>   lib/Makefile                                  | 26 +------
>   lib/raid6/Makefile                            | 33 +++-----
>   lib/test_fpu.h                                |  8 ++
>   lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
>   lib/test_fpu_impl.c                           | 37 +++++++++
>   38 files changed, 348 insertions(+), 193 deletions(-)
>   create mode 100644 Documentation/core-api/floating-point.rst
>   create mode 100644 arch/arm/include/asm/fpu.h
>   create mode 100644 arch/arm64/include/asm/fpu.h
>   create mode 100644 arch/powerpc/include/asm/fpu.h
>   create mode 100644 arch/riscv/include/asm/fpu.h
>   create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
>   create mode 100644 arch/x86/include/asm/fpu.h
>   create mode 100644 include/linux/fpu.h
>   create mode 100644 lib/test_fpu.h
>   rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
>   create mode 100644 lib/test_fpu_impl.c
>

