Return-Path: <linuxppc-dev+bounces-10290-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DBAB08F37
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jul 2025 16:27:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjZyW023Nz307K;
	Fri, 18 Jul 2025 00:27:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::129"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752762466;
	cv=none; b=flHtxpmdm1EK9iSXKaBLwehkzh3BjyTML9iE6RnBye4rwyeOS2+sSeOreK0OopF6nm8NkztARztD7TcUTgRtKO4/DupRMCe1O46RWbHru1A/XEA0HG9f2Zure0f8NsfcFy5NCn9tyG9pCHnJiCHF75CuigXyLhEK3Fkj3fM8l2vEckSza6nu4b2VwFVOHj5txwly6rl8ebanyUJQS/tEHneGI3NbFYFh+n5i3x79VfK3zGtZZbAkVL1UhxLMWAHJiJg5YeC4+ZugPALHZvJC4UJuzn+NAugX6Mn+M+pJP58EPA6iTGnw0utkchujSaK3vji26r0FovZHM4NDEMiyCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752762466; c=relaxed/relaxed;
	bh=S1+MAZvM+N/4+avawJ7fodWecsPBgKeK+9BQEGE2Ung=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bHySy6iWWHQCewOJSVL0H58v19pQ14Bgp423KPy/Ii2HE86n2BHznd11sLtsWE+1FF7OcuTDkARlBBCRyl9KRhB8SKXTy8IiZaep7Oom07S/mlwu41SSwRYzwlOZR6Qz/dEnYDSrbmDnC1lrdF99+SLztTdEyCcRgpMLXTd5aF7uqxnKIGfqaJrsKAsaRuwn07wNh8yOtR+AydpMHvjsHLgiCaQduujhVrMT0wgS/oy9ZbenFQDL0U9mh9D3bThM4bvCr1rJBPOlzpY0sicCtQ4X6/9Qs5HBDvr5+X9j4VRxLThZKxh7KIR+7z9X/8iGRCt2RZk0hH377vG2lelJjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g7aohfnO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=g7aohfnO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjZyT39Xgz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 00:27:44 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-553e5df44f8so901693e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762461; x=1753367261; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S1+MAZvM+N/4+avawJ7fodWecsPBgKeK+9BQEGE2Ung=;
        b=g7aohfnORm6WDEl5Lg5Z0j7a9V8KQ3OjKz2yOH/af58xS/J9RXrQY9xlaSPbdnkrrP
         KdYBtlguoD43Dk3K/LBw2kSN0+sf34MQOehAqKL8O+L8O2aJYITCGL36O0vM71M0UJQW
         VIT2kkWzTTSFYfMnyuyF6Kg6mtKXTjJpPDD6RVugXbPuPsYPbO+OGXkyt7ZZ9ZSeMtpL
         MDWhAMmBhVVxLj4romZfo91bJ+MyURPstHnf7wmIut/hSknoYV2X2+m1FAewA839m5Fj
         7e0Yv2un2oq9y200qeDPrD82mmiU1qEpj8CzqhuZh6mEZK1R7f3/jiCQi5zL3//adq9p
         +Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762461; x=1753367261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S1+MAZvM+N/4+avawJ7fodWecsPBgKeK+9BQEGE2Ung=;
        b=HEz86wsmyW2ovc6c2bm23I65UpznySAgEo3wCRYac3bU8BVO8ggBECuSgVw8o8Euaw
         oW4Rxd22ZVcCTvDjoLpRMlGU/5ldTLR6+moHJuWUZauc8VmZQ1vt3B5xE3Uc8XxFEGXT
         qKVD7f0u8VNFlStpX8JmGPW3tSOigWNxsskprAy0D9lJ50g35zGevhWKJQfGXZw4L8od
         p0QfeQok7CofUQ+ygNmfsA5aA6AIy/OXY5fwq/CVT0FZBjW6xKgbMI3bGlxR/Ciyv9A+
         gn3TVY/e1h1bZmlbYHIUtSzG8HPo967NjB2nZFXZcBx5oTAqTu/4PWfHmUOAXi67Orou
         CVDg==
X-Forwarded-Encrypted: i=1; AJvYcCWvJukOPYDR9pmJ/gI6+UG9OrKp91yMDO9BJVQv4dWZLLPjySstxpSLi9GPGnfwC+f6sJ74vp7b13kIdow=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBfe21ZUODxtWy3ktF78fPELNbW96zgB9A/Pe5+uhSOBMSXENB
	TJ6j03IpBNv/V44ldKxuA6Q0oeqFb0LD6dawDZNy2uGkcghZUy59B254
X-Gm-Gg: ASbGnctPMsktvc9WeVOf33zLYrDXSLrnY1RiWxvCkt3jkd1j0eSm7uKE+Xcp+bq0Krt
	/11kLjcywFI2+btVv01bPn2wWZt/42jmr0vDf+SGVWf3CUK+A8PbNBZIwLjL34ga7awRujxZFBy
	fobhwbobdGELyBvc9xU0xxsFJRgrKsk7pNEhGZJdnJuvQT6r+0ED9WyDaHRQYGJgdywlGYfE8Rn
	KAaxPHyUnQ27j4Oalm1mVVFi9QLP0G7dTmqGToPB/Mgsx/boCVZ6yOv+UN5SKYNVASIUc0dfRBc
	RpGpcYIlViXI7+77fVKDaXXnNFZGmAmeGpyrQqjgH+XDrhDY+W+6D4Eh1fwgGLItIfxmHETxHWT
	LnMJBusA1xR+gWm259uVwaVyfChzBY9bmhDj4sgJUQhZKJxFJXlvNfNh+dr1vOhkhmR6k
X-Google-Smtp-Source: AGHT+IHqw++1wkJOZK6ynl4Q5tnH7hMmNdvDCLMPwyvX9yJ+k47Bz9P2wFC8+PCgt0lXOF+TLWoP4g==
X-Received: by 2002:a05:6512:b17:b0:553:ad81:4de1 with SMTP id 2adb3069b0e04-55a23f2d227mr2243765e87.24.1752762460660;
        Thu, 17 Jul 2025 07:27:40 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:27:39 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v3 00/12] kasan: unify kasan_arch_is_ready() and remove arch-specific implementations
Date: Thu, 17 Jul 2025 19:27:20 +0500
Message-Id: <20250717142732.292822-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This patch series addresses the fragmentation in KASAN initialization
across architectures by introducing a unified approach that eliminates
duplicate static keys and arch-specific kasan_arch_is_ready()
implementations.

The core issue is that different architectures have inconsistent approaches
to KASAN readiness tracking:
- PowerPC, LoongArch, and um arch, each implement own kasan_arch_is_ready()
- Only HW_TAGS mode had a unified static key (kasan_flag_enabled)
- Generic and SW_TAGS modes relied on arch-specific solutions
  or always-on behavior

This series implements two-level approach:
1. kasan_enabled() - compile-time check for KASAN configuration
2. kasan_shadow_initialized() - runtime check for shadow memory readiness

Key improvements:
- Unified static key infrastructure across all KASAN modes
- Runtime overhead only for architectures that actually need it
- Compile-time optimization for arch. with early KASAN initialization
- Complete elimination of arch-specific kasan_arch_is_ready()
- Consistent interface and reduced code duplication

Previous v2 thread: https://lore.kernel.org/all/20250626153147.145312-1-snovitoll@gmail.com/

Changes in v3 (sorry for the 3-week gap):

0. Included in TO, CC only KASAN devs and people who commented in v2.

1. Addressed Andrey Konovalov's feedback:
   - Kept separate kasan_enabled() and kasan_shadow_initialized() functions
   - Added proper __wrapper functions with clean separation

2. Addressed Christophe Leroy's performance comments:
   - CONFIG_ARCH_DEFER_KASAN is only selected by architectures that need it
   - No static key overhead for architectures that can enable KASAN early
   - PowerPC 32-bit and book3e get compile-time optimization

3. Addressed Heiko Carstens and Alexander Gordeev s390 comments:
   - s390 doesn't select ARCH_DEFER_KASAN (no unnecessary static key overhead)
   - kasan_enable() is a no-op for architectures with early KASAN setup

4. Improved wrapper architecture:
   - All existing wrapper functions in include/linux/kasan.h now check both
     kasan_enabled() && kasan_shadow_initialized()
   - Internal implementation functions focus purely on core functionality
   - Shadow readiness logic is centralized in headers per Andrey's guidance

Architecture-specific changes:
- PowerPC radix MMU: selects ARCH_DEFER_KASAN for runtime control
- LoongArch: selects ARCH_DEFER_KASAN, removes custom kasan_early_stage
- um: selects ARCH_DEFER_KASAN, removes kasan_um_is_ready
- Other architectures: get compile-time optimization, no runtime overhead

The series maintains full backward compatibility while providing optimal
performance for each architecture's needs.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049

=== Current mainline KUnit status

To see if there is any regression, I've tested via compiling a kernel
with CONFIG_KASAN_KUNIT_TEST and running QEMU VM. There are failing tests
in SW_TAGS and GENERIC modes in arm64:

arm64 CONFIG_KASAN_HW_TAGS:
	# kasan: pass:62 fail:0 skip:13 total:75
	# Totals: pass:62 fail:0 skip:13 total:75
	ok 1 kasan

arm64 CONFIG_KASAN_SW_TAGS=y:
	# kasan: pass:65 fail:1 skip:9 total:75
	# Totals: pass:65 fail:1 skip:9 total:75
	not ok 1 kasan
	# kasan_strings: EXPECTATION FAILED at mm/kasan/kasan_test_c.c:1598
	KASAN failure expected in "strscpy(ptr, src + KASAN_GRANULE_SIZE, KASAN_GRANULE_SIZE)", but none occurred

arm64 CONFIG_KASAN_GENERIC=y, CONFIG_KASAN_OUTLINE=y:
	# kasan: pass:61 fail:1 skip:13 total:75
	# Totals: pass:61 fail:1 skip:13 total:75
	not ok 1 kasan
	# same failure as above

x86_64 CONFIG_KASAN_GENERIC=y:
	# kasan: pass:58 fail:0 skip:17 total:75
	# Totals: pass:58 fail:0 skip:17 total:75
	ok 1 kasan

=== Testing with patches

Testing in v3:

- Compiled every affected arch with no errors:

$ make CC=clang LD=ld.lld AR=llvm-ar NM=llvm-nm STRIP=llvm-strip \
	OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
	HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld \
	ARCH=$ARCH

$ clang --version
ClangBuiltLinux clang version 19.1.4
Target: x86_64-unknown-linux-gnu
Thread model: posix

- make ARCH=um produces the warning during compiling:
	MODPOST Module.symvers
	WARNING: modpost: vmlinux: section mismatch in reference: \
		kasan_init+0x43 (section: .ltext) -> \
		kasan_init_generic (section: .init.text)

AFAIU, it's due to the code in arch/um/kernel/mem.c, where kasan_init()
is placed in own section ".kasan_init", which calls kasan_init_generic()
which is marked with "__init".

- Booting via qemu-system- and running KUnit tests:

* arm64  (GENERIC, HW_TAGS, SW_TAGS): no regression, same above results.
* x86_64 (GENERIC): no regression, no errors

Sabyrzhan Tasbolatov (12):
  lib/kasan: introduce CONFIG_ARCH_DEFER_KASAN option
  kasan: unify static kasan_flag_enabled across modes
  kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/arm64: call kasan_init_generic in kasan_init
  kasan/arm: call kasan_init_generic in kasan_init
  kasan/xtensa: call kasan_init_generic in kasan_init
  kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/x86: call kasan_init_generic in kasan_init
  kasan/s390: call kasan_init_generic in kasan_init
  kasan/riscv: call kasan_init_generic in kasan_init
  kasan: add shadow checks to wrappers and rename kasan_arch_is_ready

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +--
 arch/loongarch/Kconfig                 |  1 +
 arch/loongarch/include/asm/kasan.h     |  7 -----
 arch/loongarch/mm/kasan_init.c         |  7 ++---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 --------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +---
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 +-
 arch/um/Kconfig                        |  1 +
 arch/um/include/asm/kasan.h            |  5 ---
 arch/um/kernel/mem.c                   |  4 +--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 34 ++++++++++++++++-----
 include/linux/kasan.h                  | 42 ++++++++++++++++++++------
 lib/Kconfig.kasan                      |  8 +++++
 mm/kasan/common.c                      | 18 +++++++----
 mm/kasan/generic.c                     | 23 ++++++++------
 mm/kasan/hw_tags.c                     |  9 +-----
 mm/kasan/kasan.h                       | 36 ++++++++++++++++------
 mm/kasan/shadow.c                      | 32 +++++---------------
 mm/kasan/sw_tags.c                     |  2 ++
 26 files changed, 146 insertions(+), 120 deletions(-)

-- 
2.34.1


