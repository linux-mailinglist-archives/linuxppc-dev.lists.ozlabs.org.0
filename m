Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B39891438
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:26:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=XUDqfxt0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5X641JV0z3vlQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 18:26:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=XUDqfxt0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5X3j5j3fz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 18:24:48 +1100 (AEDT)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-5d8b519e438so1258828a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 00:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697083; x=1712301883; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9VxbCTgzZ80UmziOWsKJFOvNNy0Qw1c5wWNUXcCD38=;
        b=XUDqfxt0xqi8v2KjlBEjpgqAfnPt2PJShrB3rbLveabMZw2uWnUEf4MqTHE549AnkY
         y29PUGiCWnKfF09oDWwC1yOF7EbkDH47SITRQDBHQrMBJO1X3wKY3+fKPyda95vLPUn6
         LbiOAQbJd0pyHIjVze4+glMc5u4mC6iyEnKjnetHN7Evfgk53Gxt4HjyV+Onh2EY9BQz
         2Esn2F3ylsCDQtHJpVpE74hA4b728o4IkVueqjk9kWNXQdD2bHtQul+wSQT6L/SynUKH
         k8MkVc30o4LBzoYvYk5hVzm2diJZlYlueq4pdWjsemUNUanen1jo+7JUMbaK1kHPaERT
         NDXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697083; x=1712301883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9VxbCTgzZ80UmziOWsKJFOvNNy0Qw1c5wWNUXcCD38=;
        b=twxuUE9/F1FQ0IU5HN++w3KT3gRs3/N+dU+poGA8g5q+/Nq3IqAAKtTsJk8pZ3CguK
         S1ZOEJ5ZzC7AifmfUsdSgbKJ4OXhEpVHCU5tazYFZvryGL/l4YVRgYUmIHjOceqHs5nw
         dRYO7NxUuCklnxEDXHI9+Ijg2YifUanYRUaGcZjAEYhSRUr7a7cuZaWFCQKpG66Cbf6m
         7vwdcz7IOris0aOJQTjXwrm6/a+O5THH0y9i0lhzzX1kFUs0vtGjQUsDvMJrurRZa5CC
         dIg52Uf5roaERhw72xn09ZAX0B5gqtqzPEVvNKuRmzEwoETu2ygSPKf7TcziOQPzvDtO
         xSPw==
X-Forwarded-Encrypted: i=1; AJvYcCXukTR9PLkH2U34e9fVaYX/8BNhI3oaVU1XwrJ2DCwRdqLjrKWS4cC5TDWteHdgvoleGSof3ZVD5m3qvFI3PrKi28Fzrvq+Zpt8YUPtKw==
X-Gm-Message-State: AOJu0YyC6/eHThv60RhRVdvebk+QGR8lc8VZDJE+7jS6DnsUR9IXLhKM
	kCQc0cJboW1gilXoosEpBoTSxxSVkKaLaLCHrob5fuQKUXVDgHiPVSfkVC/QFDs=
X-Google-Smtp-Source: AGHT+IEb5QR4f0wxokXnCFueIg3e5DUC8zxXcfXICifgdBJpQrnHEBOFNWDHzDiuuKhBOVbgthprFw==
X-Received: by 2002:a05:6a20:ce4d:b0:1a3:c460:1a4f with SMTP id id13-20020a056a20ce4d00b001a3c4601a4fmr1590367pzb.59.1711697083202;
        Fri, 29 Mar 2024 00:24:43 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:42 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [PATCH v4 00/15] Unified cross-architecture kernel-mode FPU API
Date: Fri, 29 Mar 2024 00:18:15 -0700
Message-ID: <20240329072441.591471-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series unifies the kernel-mode FPU API across several architectures
by wrapping the existing functions (where needed) in consistently-named
functions placed in a consistent header location, with mostly the same
semantics: they can be called from preemptible or non-preemptible task
context, and are not assumed to be reentrant. Architectures are also
expected to provide CFLAGS adjustments for compiling FPU-dependent code.
For the moment, SIMD/vector units are out of scope for this common API.

This allows us to remove the ifdeffery and duplicated Makefile logic at
each FPU user. It then implements the common API on RISC-V, and converts
a couple of users to the new API: the AMDGPU DRM driver, and the FPU
self test.

The underlying goal of this series is to allow using newer AMD GPUs
(e.g. Navi) on RISC-V boards such as SiFive's HiFive Unmatched. Those
GPUs need CONFIG_DRM_AMD_DC_FP to initialize, which requires kernel-mode
FPU support.

Previous versions:
v3: https://lore.kernel.org/linux-kernel/20240327200157.1097089-1-samuel.holland@sifive.com/
v2: https://lore.kernel.org/linux-kernel/20231228014220.3562640-1-samuel.holland@sifive.com/
v1: https://lore.kernel.org/linux-kernel/20231208055501.2916202-1-samuel.holland@sifive.com/
v0: https://lore.kernel.org/linux-kernel/20231122030621.3759313-1-samuel.holland@sifive.com/

Changes in v4:
 - Add missed CFLAGS changes for recov_neon_inner.c
   (fixes arm build failures)
 - Fix x86 include guard issue (fixes x86 build failures)

Changes in v3:
 - Rebase on v6.9-rc1
 - Limit riscv ARCH_HAS_KERNEL_FPU_SUPPORT to 64BIT

Changes in v2:
 - Add documentation explaining the built-time and runtime APIs
 - Add a linux/fpu.h header for generic isolation enforcement
 - Remove file name from header comment
 - Clean up arch/arm64/lib/Makefile, like for arch/arm
 - Remove RISC-V architecture-specific preprocessor check
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers
 - Declare test_fpu() in a header

Michael Ellerman (1):
  drm/amd/display: Only use hard-float, not altivec on powerpc

Samuel Holland (14):
  arch: Add ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  ARM: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  arm64: crypto: Use CC_FLAGS_FPU for NEON CFLAGS
  lib/raid6: Use CC_FLAGS_FPU for NEON CFLAGS
  LoongArch: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  x86/fpu: Fix asm/fpu/types.h include guard
  x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
  riscv: Add support for kernel-mode FPU
  drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
  selftests/fpu: Move FP code to a separate translation unit
  selftests/fpu: Allow building on other architectures

 Documentation/core-api/floating-point.rst     | 78 +++++++++++++++++++
 Documentation/core-api/index.rst              |  1 +
 Makefile                                      |  5 ++
 arch/Kconfig                                  |  6 ++
 arch/arm/Kconfig                              |  1 +
 arch/arm/Makefile                             |  7 ++
 arch/arm/include/asm/fpu.h                    | 15 ++++
 arch/arm/lib/Makefile                         |  3 +-
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/Makefile                           |  9 ++-
 arch/arm64/include/asm/fpu.h                  | 15 ++++
 arch/arm64/lib/Makefile                       |  6 +-
 arch/loongarch/Kconfig                        |  1 +
 arch/loongarch/Makefile                       |  5 +-
 arch/loongarch/include/asm/fpu.h              |  1 +
 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/Makefile                         |  5 +-
 arch/powerpc/include/asm/fpu.h                | 28 +++++++
 arch/riscv/Kconfig                            |  1 +
 arch/riscv/Makefile                           |  3 +
 arch/riscv/include/asm/fpu.h                  | 16 ++++
 arch/riscv/kernel/Makefile                    |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c           | 28 +++++++
 arch/x86/Kconfig                              |  1 +
 arch/x86/Makefile                             | 20 +++++
 arch/x86/include/asm/fpu.h                    | 13 ++++
 arch/x86/include/asm/fpu/types.h              |  6 +-
 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 35 +--------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 +--------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 +--------
 include/linux/fpu.h                           | 12 +++
 lib/Kconfig.debug                             |  2 +-
 lib/Makefile                                  | 26 +------
 lib/raid6/Makefile                            | 33 +++-----
 lib/test_fpu.h                                |  8 ++
 lib/{test_fpu.c => test_fpu_glue.c}           | 37 ++-------
 lib/test_fpu_impl.c                           | 37 +++++++++
 38 files changed, 348 insertions(+), 193 deletions(-)
 create mode 100644 Documentation/core-api/floating-point.rst
 create mode 100644 arch/arm/include/asm/fpu.h
 create mode 100644 arch/arm64/include/asm/fpu.h
 create mode 100644 arch/powerpc/include/asm/fpu.h
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c
 create mode 100644 arch/x86/include/asm/fpu.h
 create mode 100644 include/linux/fpu.h
 create mode 100644 lib/test_fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

-- 
2.44.0

