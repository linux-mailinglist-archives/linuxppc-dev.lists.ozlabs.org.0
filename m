Return-Path: <linuxppc-dev+bounces-10742-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3EEB1DD8E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 21:40:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bycvc0Swfz2yf3;
	Fri,  8 Aug 2025 05:40:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754595627;
	cv=none; b=VrkjE+NGaCzd6LNVZiqqzeMoRtpnyQjLb3HQsLBnfH8ofQmsAt4CvuRm8lECeMvzhP3r7WS5LarHmO1fac5IZUASU6DQYiXAEmeHQCjqfW6UJ1Gy0+eTiowmiW1yHDCe+um0DqGZpoK2ekpoPRguvbclYwZo/madymGJuO4I9ewZITG8pBS3jZBuzamonKQB6HOQdSmQLSCTqLTijl+adephzqVjzi8JhuHVp9K+GSzXVXCMIpOKAT8NIvUg9NZY9l/RObzebNdbpi7viEwe/7F/6UDU05thBw29/bJsU9hKdAltoSsx0o6kRIW2IdJq1qqOmZjI3ME7gnGAVnC+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754595627; c=relaxed/relaxed;
	bh=ZxujgbgbPZueP+pnQ5s6H3MUryeO1an975QxEYXuWHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ozxFagrpDcggRZCWGD6mm79E3NlvAvl0MpD+9zVM+7mjy2EbAJ+wzuQa0sF1KDlWP3C/r9vMS3rTdKXrR5sp67oSvKZaQf2c1FwgK8EkPX9xlooe1rBXJaimOoP/iAbDWXufDx5IcC5Xrq5T5G4PIJG9lg3MAxF6jNMzNx2ClHhnYu7YAr/N2+KGwRcvOBc1PYAKnxoFCkjkS2apEbIvjAW0nB3TENoKF8OQlALizDvi8rySeSBfN9VaeR3CNyQmEOLaoBberI7eYFcDXzv4mmRcG/jgkDdEZDTflaO5nm9OSo6tuWcRSkW70JVooiHziSGFl1mP/BIZR5Hqq67ObA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=frVYjR6w; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=frVYjR6w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bycvZ5bvlz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Aug 2025 05:40:25 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55b975b459aso1309405e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Aug 2025 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595619; x=1755200419; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxujgbgbPZueP+pnQ5s6H3MUryeO1an975QxEYXuWHk=;
        b=frVYjR6wvtObn0s4eHPVYXieZIQ4ObdbbelzwIy/IfkP/qqHgbib0VP6H9yoSYCpO/
         KmYY9Wwx3HJLpenqnWOj4OMs1xgcsiqx/H/QRfr7vtlszUD2ThxtW9vZQSmdeIHzbABB
         RkxJxkwtJIs5eyzgilGzBJaoNnIx8AkzgZchbNrrqBs6toqaM0Y45kjGgbICdM66o2sW
         Xv78k3wh/GGrpnmGysSx76L65GnT7MYaKPSVWstEvwb2Qq2Ks3eSvGvGZQZB+tHhjOhi
         Rd+0vplGLCqErLrykMrkiZtZXjkjPCFH9tyT8PBdE2nB9fO5zEdmDz9+vNKiWY+jChjl
         ZJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595619; x=1755200419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZxujgbgbPZueP+pnQ5s6H3MUryeO1an975QxEYXuWHk=;
        b=T4LNW/7qhpSxDz9iBAtBlLML7uWchYfoipEGqoPgMEnNacr/Kns52hVS9V0WgekUc9
         dkdpmWJC5ac9msc+yMi/BGSHXdO5T5qdo7aZt1z61zO4rOS27vwgQE+broPj3l3u9e+K
         go3DrAPny6y87mc1aM3tgT8ydaslwXq5WLjIvdfRaxN5mxKdjNpkb4sdGrqiMQkMKaNu
         c2Ff/tjFJhuxr7z0Bks3l0MRGgW+5ASKZL9tjoW/VvyakJFX0PqyoH7kMjuh+5/lKtym
         rfx2WrGpx/YmICEqwDFHO8A5ky7SnKQ3mH22qfL95JQO67qV31u5Ko3Gb6elEFJrUmHm
         khRA==
X-Forwarded-Encrypted: i=1; AJvYcCWCK9O8fcO6+wAx+qqfRSHPsbwBzvOZ/uTb3J7DoE4nbOIfjV3lQSfeBKTm239Lu3eaXMeNnwTM8DM0UTE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwT365zRlp8yCznfqCXKipspzqZ5zwyFCGb7StKvXbLu/JvssdJ
	nvBnR/+IHHR9auRNLgN0Ww1c5/GEc2RyzlbHIzavuJHO2oTpo6cPtZaj
X-Gm-Gg: ASbGncsTnuufrVci3iIjZkWb4dMH+I058JEi2pvt83Zxa+oKOXyrPLz59sH6ddg8baQ
	cCZw0rpo57gF4vuRPHt4NdQLIpjjhAS/rzz0Fs8bsptDUcJ95XTf2wCxNcEdSt+u2dlnTbz9t71
	pQfTU77Po27qaW8z/dBZRB7Uk5ofU/0Xtc6147jiK3ua3avGY3D1efyMBo9KovDGuX1T59SZ6ih
	aR+Z1O48mGw1VbKmNwzkZOHTMRedu+wr8iUbDf5X+ZU3omLDgyS8+K5aStS2dHd7yJ2Ts5IF/Tp
	evm0RVbYNSO8ibvmYlEfi76UbCEeGkYvscrxiRnX9PsWN/90iFXYA4EFnoLdkWhohQ0h1X50c0G
	YzvkqPS/NQsnrwxyrR+I65QsGRSJgdXyZsjbjhyg+yJuDczp3ClYKnZOzJfmgxp+jpA+wbw==
X-Google-Smtp-Source: AGHT+IE3k4ZwCdWcT+X+hcq7vhHbrmZfaduJaslrnOP/WdlfOXcdLd8Kfq+JS+ZAkrsMnQsJjZ39NA==
X-Received: by 2002:a05:6512:3d09:b0:55b:57e8:16c4 with SMTP id 2adb3069b0e04-55cc012c003mr7357e87.30.1754595619107;
        Thu, 07 Aug 2025 12:40:19 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88c98c2asm2793570e87.77.2025.08.07.12.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 12:40:18 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	bhe@redhat.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	davidgow@google.co,
	glider@google.com,
	dvyukov@google.com
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
Subject: [PATCH v5 0/2] kasan: unify kasan_enabled() and remove arch-specific implementations
Date: Fri,  8 Aug 2025 00:40:10 +0500
Message-Id: <20250807194012.631367-1-snovitoll@gmail.com>
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
 arch/um/kernel/mem.c                   | 10 ++++++--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 32 ++++++++++++++++++--------
 include/linux/kasan.h                  |  6 +++++
 lib/Kconfig.kasan                      |  8 +++++++
 mm/kasan/common.c                      | 17 ++++++++++----
 mm/kasan/generic.c                     | 19 +++++++++++----
 mm/kasan/hw_tags.c                     |  9 +-------
 mm/kasan/kasan.h                       |  8 ++++++-
 mm/kasan/shadow.c                      | 12 +++++-----
 mm/kasan/sw_tags.c                     |  1 +
 mm/kasan/tags.c                        |  2 +-
 27 files changed, 107 insertions(+), 76 deletions(-)

-- 
2.34.1


