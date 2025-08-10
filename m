Return-Path: <linuxppc-dev+bounces-10782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3AD0B1FA07
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Aug 2025 14:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0Hr20qf9z3cZ0;
	Sun, 10 Aug 2025 22:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::132"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754830690;
	cv=none; b=HUl+eAfaDSkK2oGtXayZ4TKiYiBnNKVIeyf+LJs2dXTobrlY/Y//utGB7Q3rYpgbyKQPs6EofpSpObLgdgiyZ2V68HsXbfr0Gp6LeK+K/IB/9J4uqrQ9z3BDE9BMZUYOX2pvnU+Gx/cAwMBKn3ZuT1B785gzoKolTT9bN46B4xA0jVTpb8gYDLFOyrPF8iL/7WbYAB5lF76WjVVqyCnfkIc36W/a3c/WxZCddQwpgPx9gb5KJOUCncbEcYlY+XJwNiArX62aVcZKMdRK9q2MlGeS7r9OedEKGsun9M44gRMH3xXE3dP1nj/nu5UeMKZihMnq1dkfQ0Ga4H/DF9PMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754830690; c=relaxed/relaxed;
	bh=fLpTR6tAuSk7MmdRr1bx3cY7Ji1Fi9DhOlpvPdNYklM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EyFlYKSrpV5gBFkJLW7oQINvoT0VESk6holmALO2nDjGQQycCvhYLRMu7DFTkplaRikrhxYGd8YOfYjceR/x0IbsHfB3I81sNIHpHSiA5SxKFxlSklY8EWo41GGYX2ohUaqlTSMAT1Pft9ljCDl/PMTp3srcDuPIceyTS2At+hIQwhnIlReWHCrINKZvHkPuQ38OkqQPNR5j6XeQUPQoebVh9cmgS2cwVufiX/Ckcldy/2MPI+YlDB90RRHG1ZMP12rTvUl++3jrTmVZfY0pjvwkeTpqHVnCW06U0F+9x3Ju8rbV2+QG+ft88zHU24kO/rgNHtbpg4kV3htQpaBrtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VGKcjg0v; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VGKcjg0v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0Hr02Fqyz3cYd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 22:58:06 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-55cbf9a78dbso2443612e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Aug 2025 05:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754830680; x=1755435480; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fLpTR6tAuSk7MmdRr1bx3cY7Ji1Fi9DhOlpvPdNYklM=;
        b=VGKcjg0vtjQUPDcIVT8aYbu7Yhx7Jf9EQa4aiddmu0kj4vQSgeohvSlxHJcI2cchz/
         f2MrD1pDZ2vAJmmjSm5ILVsm2KziViJwADnAvcPraBe6sJ6fzXFcLw4ZUfKWzqkzEw8T
         qEHb2JBpZ+QRRaaYaDpJi+VKGOLWjwD6A5IvablyMJPib2DaTgotbxDcojhR8Bpt5kTR
         qeT6oDirrlsNy91NN2pQN2pUozap36FSkI9ZBbvlQYexABtHiOZ4M9UQ6BXxXDCTtk8N
         ddAQOo6BPa6LcK3bZS9UDecriJlSS+EMINxBruXsCBqDA3bVHew+XoNJ0MeE/euWbtzV
         Expw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754830680; x=1755435480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLpTR6tAuSk7MmdRr1bx3cY7Ji1Fi9DhOlpvPdNYklM=;
        b=WdnWAWwjGaGGoMjSiqjoR4qryxG3U+mySLNvQiM5nfsr5hrTf0HnpQwA156eJZD1gH
         Au8lr3jjepyX/aLPUgPSxp+bx2mATMSOTSveNGwwjANERIEtUIHsKgchlM1V+2XifFAW
         8sDQBwWntACj0bpMXLMepH0100D+Yi9N8hKlyUKNez6qPQjRWAhLnVac07t8XuwlJC9g
         iepM6pYhs93kTRSN3od1FTPGtb441ZwzlERk0b89s4y/sdWn+2PLec5xq2oxi92tcAxq
         ERHsZ7iP+KsgXVa1foFtc1OdKPn5IOiXGDSxEax4+1NAvkgfvEKhwtzXwsqbA0L5ZBFX
         tjbg==
X-Forwarded-Encrypted: i=1; AJvYcCVwQse+ZpwzlfHixIy7nmeMKDs7NKPB4bEujdXpJ/2yTo6n4opsNe2CRa3vgvFGD5iAj629BQQ98OEA5Fs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaTTKPIWJIWlXWHSjkwdrj1y2zBL86HjPllmwRHTwzovdLTskm
	X+Clm6ZLMPcankN1vfV0KpUnUJbbQvHwDUoJ+k94d8UwDkD5p/ZUCK+T
X-Gm-Gg: ASbGncutcspd6QqqXAvbpyPJ1kxHgJDtw5RTY5PY+LDC4VFPKc+X1e+beR9o1YlBJFj
	ZoT6/GGirTVxMwMgUhn1LLD5teMzMGClNGZr94RcLlDG/993//I6keoMlue5jreb6tI1U/rYy3/
	JCQE/067eCT4DQa6RJs2Umps6LxmQ1JvZ5a70DGk4zqq000UYm5pHAARCp60u7NC39lYJZ9C544
	KvxNeiXJsZTnHPzFs9+Y7zjiBm6WbeGxCA+YgYkdERvO7PDxBWUtNf9QtUBljtVUm6PYO+lRpFX
	IWQ7l+aBKsKlCdak40Z54V00i4Y/M4t1Nihp2k2rFI6oYgMPFnk3ZR0lJQqAbBawc6yw6iVPaRN
	H9Jxc/VHGmX3x/j9SagKZWHsmZz6VQXtyQDRELA==
X-Google-Smtp-Source: AGHT+IGP/4+VH4qZJqmI6pqOQcdamwMMjmUjwyAr9JTcQGvwe1pb2iGdV8kKhr91VYx69eEOJbHKcQ==
X-Received: by 2002:a05:6512:2313:b0:55b:8397:cffd with SMTP id 2adb3069b0e04-55cc00ada77mr2589766e87.9.1754830679327;
        Sun, 10 Aug 2025 05:57:59 -0700 (PDT)
Received: from localhost.localdomain ([2a03:32c0:2e:37dd:bfc4:9fdc:ddc6:5962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c9908esm3804561e87.76.2025.08.10.05.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 05:57:58 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	christophe.leroy@csgroup.eu,
	bhe@redhat.com,
	hca@linux.ibm.com,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.com,
	glider@google.com,
	dvyukov@google.com,
	alexghiti@rivosinc.com
Cc: alex@ghiti.fr,
	agordeev@linux.ibm.com,
	vincenzo.frascino@arm.com,
	elver@google.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v6 0/2] kasan: unify kasan_enabled() and remove arch-specific implementations
Date: Sun, 10 Aug 2025 17:57:44 +0500
Message-Id: <20250810125746.1105476-1-snovitoll@gmail.com>
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
- PowerPC, LoongArch, and UML arch, each implement own kasan_arch_is_ready()
- Only HW_TAGS mode had a unified static key (kasan_flag_enabled)
- Generic and SW_TAGS modes relied on arch-specific solutions
  or always-on behavior

Changes in v6:
- Call kasan_init_generic() in arch/riscv _after_ local_flush_tlb_all()
- Added more details in git commit message
- Fixed commenting format per coding style in UML (Christophe Leroy)
- Changed exporting to GPL for kasan_flag_enabled (Christophe Leroy)
- Converted ARCH_DEFER_KASAN to def_bool depending on KASAN to avoid
        arch users to have `if KASAN` condition (Christophe Leroy)
- Forgot to add __init for kasan_init in UML

Changes in v5:
- Unified patches where arch (powerpc, UML, loongarch) selects
  ARCH_DEFER_KASAN in the first patch not to break
  bisectability. So in v5 we have 2 patches now in the series instead of 9.
- Removed kasan_arch_is_ready completely as there is no user
- Removed __wrappers in v4, left only those where it's necessary
  due to different implementations

Tested on:
- powerpc - selects ARCH_DEFER_KASAN
Built ppc64_defconfig (PPC_BOOK3S_64) - OK
Booted via qemu-system-ppc64 - OK

I have not tested in v4 powerpc without KASAN enabled.

In v4 arch/powerpc/Kconfig it was:
	select ARCH_DEFER_KASAN			if PPC_RADIX_MMU

and compiling with ppc64_defconfig caused:
  lib/stackdepot.o:(__jump_table+0x8): undefined reference to `kasan_flag_enabled'

I have fixed it in v5 via adding KASAN condition:
	select ARCH_DEFER_KASAN			if KASAN && PPC_RADIX_MMU

- um - selects ARCH_DEFER_KASAN

KASAN_GENERIC && KASAN_INLINE && STATIC_LINK
	Before:
		In file included from mm/kasan/common.c:32:
		mm/kasan/kasan.h:550:2: error: #error kasan_arch_is_ready only works in KASAN generic outline mode!
		550 | #error kasan_arch_is_ready only works in KASAN generic outline mode

	After (with auto-selected ARCH_DEFER_KASAN):
		./arch/um/include/asm/kasan.h:29:2: error: #error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!
		29 | #error UML does not work in KASAN_INLINE mode with STATIC_LINK enabled!

KASAN_GENERIC && KASAN_OUTLINE && STATIC_LINK && 
	Before:
		./linux boots.

	After (with auto-selected ARCH_DEFER_KASAN):
		./linux boots.

KASAN_GENERIC && KASAN_OUTLINE && !STATIC_LINK
	Before:
		./linux boots

	After (with auto-disabled !ARCH_DEFER_KASAN):
		./linux boots

- loongarch - selects ARCH_DEFER_KASAN
Built defconfig with KASAN_GENERIC - OK
Haven't tested the boot. Asking Loongarch developers to verify - N/A
But should be good, since Loongarch does not have specific "kasan_init()"
call like UML does. It selects ARCH_DEFER_KASAN and calls kasan_init()
in the end of setup_arch() after jump_label_init().

Previous v5 thread: https://lore.kernel.org/all/20250807194012.631367-1-snovitoll@gmail.com/
Previous v4 thread: https://lore.kernel.org/all/20250805142622.560992-1-snovitoll@gmail.com/
Previous v3 thread: https://lore.kernel.org/all/20250717142732.292822-1-snovitoll@gmail.com/
Previous v2 thread: https://lore.kernel.org/all/20250626153147.145312-1-snovitoll@gmail.com/

Sabyrzhan Tasbolatov (2):
  kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
  kasan: call kasan_init_generic in kasan_init

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +---
 arch/loongarch/Kconfig                 |  1 +
 arch/loongarch/include/asm/kasan.h     |  7 ------
 arch/loongarch/mm/kasan_init.c         |  8 +++----
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 ----------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +----
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 ++-
 arch/um/Kconfig                        |  1 +
 arch/um/include/asm/kasan.h            |  5 ++--
 arch/um/kernel/mem.c                   | 13 ++++++++---
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 32 ++++++++++++++++++--------
 include/linux/kasan.h                  |  6 +++++
 lib/Kconfig.kasan                      | 12 ++++++++++
 mm/kasan/common.c                      | 17 ++++++++++----
 mm/kasan/generic.c                     | 19 +++++++++++----
 mm/kasan/hw_tags.c                     |  9 +-------
 mm/kasan/kasan.h                       |  8 ++++++-
 mm/kasan/shadow.c                      | 12 +++++-----
 mm/kasan/sw_tags.c                     |  1 +
 mm/kasan/tags.c                        |  2 +-
 27 files changed, 113 insertions(+), 77 deletions(-)

-- 
2.34.1


