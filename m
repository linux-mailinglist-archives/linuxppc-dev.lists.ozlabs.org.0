Return-Path: <linuxppc-dev+bounces-9822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE578AEA28F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 17:32:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSjNW3CKyz30Qk;
	Fri, 27 Jun 2025 01:32:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750951931;
	cv=none; b=LIksHzWrrGliZ2FvUnO1+3/sLGuKYyvyvBR7r8mDr8fA/FMvJAoJqz6BIUoQAi9DjqscGceFTAg0Kj7vPRheBGdTDYeVU7qMEHVzd37M4oHxCTOvlyAcjchAhCQKixKALmsJeBqgyStn92lR9F3r7SEV1n5cylWscU5enq8FzdbnRxm/9yS2sVzLmHT0PO8d0FMfgAaKpyvMxYMNSn0Gi5QZ7+olaaHCJ9MLLGuflSCZbIGsBDTtGzPMpW8By41fiDjHl+zTQ0HMckWviYJxmMA8Am3DWEv4qLK2jfsyYUHT7w5ud4eMKs3Nj8JbBnKfxGHImgOQU3fYavM6ARUjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750951931; c=relaxed/relaxed;
	bh=YMfAvEP2mtW3abNAfjIslAPajM3CO1XTnrCn/94UwT0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Esb+ZNrCYcFXHJw8v/+YnKiEO00NB2yylMSrDV5/denk8va8l5g0SzFxkHJ2PxSx5mBhO0bRIlBs0H4R9e1XfYZrgaij2D/BjiGs4EK4i9innl+w0HlFYdtHNcGoHGTBHwmH7A1TWCEpYXdrQNggs4JYFM/SjrWryw+9ZztVQGu9sCzEZig9EyHsFBk4+TPx9DemAlEArSFravLuqD/ioOIIL6jodQCG186r6q6iZaDhHd1heTmbtGHyN1PGy6leeTsIuriMkqz/cKpD4xPmQ81w5c4OGmmrAggbMitl0VxSPvMIfpXATYnysr1tCuLDeVoaFCRjVksisdoyCzfnZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GfVSbF8F; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GfVSbF8F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=snovitoll@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSjNT4ncJz30Pg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 01:32:09 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32cd0dfbd66so9020251fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 08:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750951925; x=1751556725; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMfAvEP2mtW3abNAfjIslAPajM3CO1XTnrCn/94UwT0=;
        b=GfVSbF8Fnj25F/zcSZPnqQMa+XNIcnL06jYg7K5Y2tU5PQMoRNuyozpcl9GK4qZWaM
         YTHl5N0rt6DFl/bfp8b0xkgAeFvpfuCkGnXA0YmkO5dDVoAZmS1jg7VTfsEsIiDeDmod
         i7+bynx52zXpB9KiDVnhHMNNdlb6mxCPOWcIkx7EOGBIoXJzDh5BrrigvdLsHi9n7l6E
         fcXsPmr7GY1lHoQiha9/uyehj1JLB0NRsC5lq6WftvJsWj+KKB4j8IUw7j2xf8S1Skhg
         KSgpDmAKHxPqWdI77KLkIBlv6jhSgJw40mYTAQm6VyoYV5BHS+FzsaX+WnQ0L653X8FQ
         ytvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951925; x=1751556725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMfAvEP2mtW3abNAfjIslAPajM3CO1XTnrCn/94UwT0=;
        b=QbbStUoverccPlpYzHyAQWEi6qTygtQVQxknXtOX0+Nsrqf5iFSYzkYi8w3gZA2t4G
         ZZmNLRnKvkMrrZDJ7D7UNDhGArVJV/vNRrvwgUMKwWEflaLcl0DPNbGuKvIfU5PForns
         gMm/5Im66nFbIp56p/rSh+02Pjh2CEU2sQbCnRWqEE2v3chNX0cv10t6CODFpgssnhtq
         jPHooNhNV8YYATRPTgPwNK89wI4IDfHLZyYvkA1pkGCrSAWoDP5XywXnLBHNkGZBYzKS
         MNteGMTVxG16DjxPHeXoY+3zXBB2WUY6YltOC+N6v7y5D6Tko5elHNkjbRFuynami6xE
         I8TQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHndp40M1jPyYDdw+oEQlyo+7KiyJZkUDrqbePMxZ4ISZ4B9wgOgDATzsYPOoa7amMzzHogQHLEbxHYy4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxK2wgOrjjO9WELvVuuQW1FULdB7SyBXYc2HkrZXO7q1dwyXEUO
	AWCiFlkOsQ7QRZdQajabjYxWMnmVpkC9j+m/hwPciu/HTcHPsMM1ID0H
X-Gm-Gg: ASbGnctzNkBQWM0G34JwUEZ9BcDl2nZKkW95hI79SLDn5C3ShZE3PjkMQIzvDZjHJYk
	bq+JvWLj4VFwKETL3wYTWXELJ+v5grMT13hKYwoy2jZOZys7dh1HMm3n/1/GIMW9a/WfXEFqz4W
	goEoOx0XGwh76ue4hEhLjfx3c1MM6Uv2L+zzhLjG66/dkB4UjY5xvvLCtHQ4wsdnHeb+0/L5Txh
	ivKLQJ8S+4VBhrDjhYj9Q+aDyyG8pBIb5Q8/mDct4RyN7gISfiNFh2yK/QqVjWZdGevz7GgZnmz
	86lD+08WSAR+vXVIZ0lgnH9IE9DF9DEVC2C7grckp4ZkK7zVGOH/JYmdLYdmgjAaTgVMbgb+pMw
	iogw28xqrkgqZcydTver07m7TCE3OAvJ9PCxRdAUU
X-Google-Smtp-Source: AGHT+IHpXirYmk7XDZLOi1Ssi0yS8Ocf718QqXqkpNJ7oPQlT+uR1sIDO9gdQg1tyNmCsb6VEaTfFA==
X-Received: by 2002:a05:6512:1589:b0:554:f76a:baba with SMTP id 2adb3069b0e04-554fdcbb935mr2999055e87.3.1750951924452;
        Thu, 26 Jun 2025 08:32:04 -0700 (PDT)
Received: from localhost.localdomain (2.135.54.165.dynamic.telecom.kz. [2.135.54.165])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2ce1fasm42792e87.174.2025.06.26.08.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 08:32:03 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	glider@google.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	akpm@linux-foundation.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com
Cc: arnd@arndb.de,
	rppt@kernel.org,
	geert@linux-m68k.org,
	mcgrof@kernel.org,
	guoweikang.kernel@gmail.com,
	tiwei.btw@antgroup.com,
	kevin.brodsky@arm.com,
	benjamin.berg@intel.com,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	snovitoll@gmail.com
Subject: [PATCH v2 00/11] kasan: unify kasan_arch_is_ready with kasan_enabled
Date: Thu, 26 Jun 2025 20:31:36 +0500
Message-Id: <20250626153147.145312-1-snovitoll@gmail.com>
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

This patch series unifies the kasan_arch_is_ready() and kasan_enabled()
interfaces by extending the existing kasan_enabled() infrastructure to
work consistently across all KASAN modes (Generic, SW_TAGS, HW_TAGS).

Currently, kasan_enabled() only works for HW_TAGS mode using a static key,
while other modes either return IS_ENABLED(CONFIG_KASAN) (compile-time
constant) or rely on architecture-specific kasan_arch_is_ready()
implementations with custom static keys and global variables.

This leads to:
- Code duplication across architectures  
- Inconsistent runtime behavior between KASAN modes
- Architecture-specific readiness tracking

After this series:
- All KASAN modes use the same kasan_flag_enabled static key
- Consistent runtime enable/disable behavior across modes
- Simplified architecture code with unified kasan_init_generic() calls
- Elimination of arch specific kasan_arch_is_ready() implementations
- Unified vmalloc integration using kasan_enabled() checks

This addresses the bugzilla issue [1] about making
kasan_flag_enabled and kasan_enabled() work for Generic mode,
and extends it to provide true unification across all modes.

[1] https://bugzilla.kernel.org/show_bug.cgi?id=217049

=== Current mainline KUnit status

To see if there is any regression, I've tested first on the following
commit 739a6c93cc75 ("Merge tag 'nfsd-6.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux").

Tested via compiling a kernel with CONFIG_KASAN_KUNIT_TEST and running
QEMU VM. There are failing tests in SW_TAGS and GENERIC modes in arm64:

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

Testing in v2:

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

=== NB

I haven't tested the kernel boot on the following arch. due to the absence
of qemu-system- support on those arch on my machine, so I defer this to
relevant arch people to test KASAN initialization:
- loongarch
- s390
- um
- xtensa
- powerpc
- riscv

Code changes in v2:
- Replace the order of patches. Move "kasan: replace kasan_arch_is_ready
	with kasan_enabled" at the end to keep the compatibility.
- arch/arm, arch/riscv: add 2 arch. missed in v1
- arch/powerpc: add kasan_init_generic() in other kasan_init() calls:
	arch/powerpc/mm/kasan/init_32.c
	arch/powerpc/mm/kasan/init_book3e_64.c
- arch/um: add the proper header `#include <linux/kasan.h>`. Tested
	via compiling with no errors. In the v1 arch/um changes were acked-by
	Johannes Berg, though I don't include it due to the changed code in v2.
- arch/powerpc: add back `#ifdef CONFIG_KASAN` deleted in v1 and tested
	the compilation.
- arch/loongarch: update git commit message about non-standard flow of
	calling kasan_init_generic()

Sabyrzhan Tasbolatov (11):
  kasan: unify static kasan_flag_enabled across modes
  kasan/arm64: call kasan_init_generic in kasan_init
  kasan/arm: call kasan_init_generic in kasan_init
  kasan/xtensa: call kasan_init_generic in kasan_init
  kasan/loongarch: call kasan_init_generic in kasan_init
  kasan/um: call kasan_init_generic in kasan_init
  kasan/x86: call kasan_init_generic in kasan_init
  kasan/s390: call kasan_init_generic in kasan_init
  kasan/powerpc: call kasan_init_generic in kasan_init
  kasan/riscv: call kasan_init_generic in kasan_init
  kasan: replace kasan_arch_is_ready with kasan_enabled

 arch/arm/mm/kasan_init.c               |  2 +-
 arch/arm64/mm/kasan_init.c             |  4 +---
 arch/loongarch/include/asm/kasan.h     |  7 -------
 arch/loongarch/mm/kasan_init.c         |  7 ++-----
 arch/powerpc/include/asm/kasan.h       | 13 -------------
 arch/powerpc/mm/kasan/init_32.c        |  2 +-
 arch/powerpc/mm/kasan/init_book3e_64.c |  2 +-
 arch/powerpc/mm/kasan/init_book3s_64.c |  6 +-----
 arch/riscv/mm/kasan_init.c             |  1 +
 arch/s390/kernel/early.c               |  3 ++-
 arch/um/include/asm/kasan.h            |  5 -----
 arch/um/kernel/mem.c                   |  4 ++--
 arch/x86/mm/kasan_init_64.c            |  2 +-
 arch/xtensa/mm/kasan_init.c            |  2 +-
 include/linux/kasan-enabled.h          | 22 ++++++++++++++++------
 include/linux/kasan.h                  |  6 ++++++
 mm/kasan/common.c                      | 15 +++++++++++----
 mm/kasan/generic.c                     | 17 ++++++++++++++---
 mm/kasan/hw_tags.c                     |  7 -------
 mm/kasan/kasan.h                       |  6 ------
 mm/kasan/shadow.c                      | 15 +++------------
 mm/kasan/sw_tags.c                     |  2 ++
 22 files changed, 66 insertions(+), 84 deletions(-)

-- 
2.34.1


