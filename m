Return-Path: <linuxppc-dev+bounces-10653-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E5CB1B663
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 16:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bxG2K1w50z3bkg;
	Wed,  6 Aug 2025 00:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754403993;
	cv=none; b=QHxIAnInX7fAzaQWDUtN/IBIys/LxfKj3KP7AyQ6+wNhCI/CGAbwWgrT3OeP68ftrgcKkwfSrx/Uu2BVQ8gJXApoGmReG0NaVRW7NIB4ZEeIokLpI8Xyli0QKbVGQuTTWSvwlneRcDjlxMurqhx/9HkLOh//op3P032gB4JJlyNxEFIHudwmwQ1MTocyHncjnL8nwJqPzUBJlPYTWhNmO0D6FxsEn5JHeEc8Gg4OslWqlgNk03yn29N+mY9TOTw4wWzR1+ftl1TkEgX9CraNorNj6w2T/lnlS0R6/tnGM5PoHKCnVaviE6DXarSNWlUfwjkExY+8U+bwrZFwIKSIxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754403993; c=relaxed/relaxed;
	bh=pksKKRBtO31JVCyUig2REP3M3oI0Y/m5ILEfob1JeTo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BqMVnTXruJ4htLt6VfEOElAQRAR5f8600V8oAUvDe7yRH/HT31OVz3teHRWalNKI3P9uoFO47oGSq5NZtWVge8JNoIQXQQ7hN/JsbLvDCCg95WcfV3CI+zrIRm8Kt634ISvKhS3s1TjgwYOdQzGZ1BynJu/FJtO4TMSi8WdbW7NzcPljkRBlbdsgUy6yRcTuGm2YSVKw6gQ3ITZNnMKa219va9eBFZkF8j1NdcHby2kOaJVEkosJdY29luS0B4hKsYOdjDP64fCFEDHAUQONXzHEpN2YqBemNgX0GKf9irzCPe5Hiyq37kofEPVZfOGkcIx1S/+6o/1lRkBefTuDrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwkDM602; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mwkDM602;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bxG2J2RRgz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Aug 2025 00:26:32 +1000 (AEST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55b733911b3so6124599e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Aug 2025 07:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754403988; x=1755008788; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pksKKRBtO31JVCyUig2REP3M3oI0Y/m5ILEfob1JeTo=;
        b=mwkDM602qDqn2rElbY7eVSVIITXkPX79hF021e+2IR4cD4OBTpdMu27kx+2O7L/aIC
         kqWTtWk269+rGGNPXJANT1H9tt9wsF8R4H2ximrlRmcJXAYczLcnR0lBNZESSq37+7uq
         +l+suNaitYunlvhCW/75MCdwVSOqbO6tVQgZA+msz2EX48Z3KqDVr+IwYdx0v1JsffBo
         rH1G+8hqmp/gcF7wuxxHU0j5WTQ9Y8LL37IkCx/gzi5zSWZB704auw3/tUhruTgdAdSw
         /auKVwjHe+RD6XysOJhzYNzavNF+7PVOtp3PX4myFCGDK7s/u1RMXDl4c43blfgUHB8i
         +BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754403988; x=1755008788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pksKKRBtO31JVCyUig2REP3M3oI0Y/m5ILEfob1JeTo=;
        b=g9/gZdy0KPGRL8xU/NT/654Upulax9RfALfR+GAa21Me6M50xSelE5/EKYiuX2zwbx
         BY4apKaQIiZ+kgvHZRsRRnPxdw2ZNSB6IUyD0mo0JG752tR883SjP1H3sMJziVeIunet
         cgYMzQCk415rhOUnInEFsT49ysImheOqM7tjw1LKj47AqGvw2Z6vndQNa2oQF42UK19S
         cvhbXhprXMQttBmdbcI9Osh13+VSjV0BkZ4Vgbq7fDjC0+Ev/cUBWdoc2qoiekdkstLb
         V73bLV4/jNX+TTsIKueual1HmM0cj+2924KQI6dxANMy3Ryk9pK6QAJx9+K6xw7J+v1l
         VRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGISbony4Dd/uWXQFCEJbmOLPw8jLAOTx0durWgvxKlvf42q2KvzxGt1pVi6eo9q+kzfqybMQoKcXqSfs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy/fVQCBm6czweZqC1SaoORrG3YVqDP/5vAgHe+QnRustJFU9OC
	dQIpWgEe+kjFMT8wZ899UWvaGkfxoxKB+MrRPjGFK/mj7fFZ1xDvAhhf
X-Gm-Gg: ASbGncupN37a/SHrUjBjyzuhxtlst7yPlhpC//O1yLRzxWZWcNsQY8Hfg3h1NcAdH9G
	UP4CgqZcumI2vysKlKg/WWpsV75tSNZOBHJ1eyTBwNr77i/q0N2sIT0GhphFs/CliVOwE0/KYC2
	E1cRR8+3pGl4N0XQq0zImdQ2a0YiGYed6UXrQR7VOOXKRNftFqiU/r1hFm0mzLR5PQmIZWc1XKI
	gUMi/lH6QBGnsYKDV65Q0f8zMcoNt6xuYtQFDbTq7PhaYeoUNW1IIlQhYSj57/+Bdyv06XJ0kBK
	ho5WmWYk1/xksa11pUVBeHQOPL3E2NpC7YisHR7Y62sxmQR3o1SN7feY4OSlGe9EQubay+itk8r
	lI77zJkDOwQHAY7MSLAu4Q/1J5Ewf/KBYxrVtaOL0QX0Jzq5wlYGpI7yJpsZugXAQZrddvQ==
X-Google-Smtp-Source: AGHT+IGy1WhFbslChqIwW3zDEXwo6CDb6xK1zgNUQQFWNlekigvy4oRcbBK1ihRZGuO8OayIKRf+qA==
X-Received: by 2002:a05:6512:39cc:b0:55b:9647:8e7b with SMTP id 2adb3069b0e04-55b97b75a15mr4601956e87.43.1754403988090;
        Tue, 05 Aug 2025 07:26:28 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:27 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
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
Subject: [PATCH v4 0/9] kasan: unify kasan_arch_is_ready() and remove arch-specific implementations
Date: Tue,  5 Aug 2025 19:26:13 +0500
Message-Id: <20250805142622.560992-1-snovitoll@gmail.com>
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

This series implements two-level approach:
1. kasan_enabled() - compile-time check for KASAN configuration
2. kasan_shadow_initialized() - runtime check for shadow memory readiness

Changes in v4:
- Unified patches where ARCH_DEFER_KASAN is introduced and used
  in the KASAN code (Andrey Ryabinin)
- Fixed kasan_enable() for HW_TAGS mode (Andrey Ryabinin)
- Replaced !kasan_enabled() with !kasan_shadow_initialized() in
  loongarch which selects ARCH_DEFER_KASAN (Andrey Ryabinin)
- Addressed the issue in UML arch, where kasan_init_generic() is
  called before jump_label_init() (Andrey Ryabinin)

Adding in TO additional recipients who developed KASAN in LoongArch, UML.

Tested on:
- powerpc - selects ARCH_DEFER_KASAN
Built ppc64_defconfig (PPC_BOOK3S_64) - OK
Booted via qemu-system-ppc64 - OK

- um - selects ARCH_DEFER_KASAN
Built defconfig with KASAN_INLINE - OK
Built defconfig with STATIC_LINK && KASAN_OUTLINE - OK
Booted ./linux - OK

- loongarch - selects ARCH_DEFER_KASAN
Built defconfig with KASAN_GENERIC - OK
Haven't tested the boot. Asking Loongarch developers to verify - N/A
But should be good, since Loongarch does not have specific "kasan_init()"
call like UML does. It selects ARCH_DEFER_KASAN and calls kasan_init()
in the end of setup_arch() after jump_label_init().

- arm64
Built defconfig, kvm_guest.config with HW_TAGS, SW_TAGS, GENERIC - OK
KASAN_KUNIT_TEST - OK
Booted via qemu-system-arm64 - OK

- x86_64
Built defconfig, kvm_guest.config with KASAN_GENERIC - OK
KASAN_KUNIT_TEST - OK
Booted via qemu-system-x86 - OK

- s390, riscv, xtensa, arm
Built defconfig with KASAN_GENERIC - OK

Previous v3 thread: https://lore.kernel.org/all/20250717142732.292822-1-snovitoll@gmail.com/
Previous v2 thread: https://lore.kernel.org/all/20250626153147.145312-1-snovitoll@gmail.com/

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049

Sabyrzhan Tasbolatov (9):
  kasan: introduce ARCH_DEFER_KASAN and unify static key across modes
  kasan/powerpc: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/arm,arm64: call kasan_init_generic in kasan_init
  kasan/xtensa: call kasan_init_generic in kasan_init
  kasan/loongarch: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/um: select ARCH_DEFER_KASAN and call kasan_init_generic
  kasan/x86: call kasan_init_generic in kasan_init
  kasan/s390: call kasan_init_generic in kasan_init
  kasan/riscv: call kasan_init_generic in kasan_init

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +--
 arch/loongarch/Kconfig                 |  1 +
 arch/loongarch/include/asm/kasan.h     |  7 -----
 arch/loongarch/mm/kasan_init.c         |  8 ++---
 arch/powerpc/Kconfig                   |  1 +
 arch/powerpc/include/asm/kasan.h       | 12 --------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +---
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 +-
 arch/um/Kconfig                        |  1 +
 arch/um/include/asm/kasan.h            |  5 ---
 arch/um/kernel/mem.c                   | 12 ++++++--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 36 +++++++++++++++++-----
 include/linux/kasan.h                  | 42 ++++++++++++++++++++------
 lib/Kconfig.kasan                      |  8 +++++
 mm/kasan/common.c                      | 18 +++++++----
 mm/kasan/generic.c                     | 23 ++++++++------
 mm/kasan/hw_tags.c                     |  9 +-----
 mm/kasan/kasan.h                       | 36 ++++++++++++++++------
 mm/kasan/shadow.c                      | 32 +++++---------------
 mm/kasan/sw_tags.c                     |  4 ++-
 mm/kasan/tags.c                        |  2 +-
 27 files changed, 157 insertions(+), 124 deletions(-)

-- 
2.34.1


