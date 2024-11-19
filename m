Return-Path: <linuxppc-dev+bounces-3436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555B29D2490
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 12:06:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xt1s21sR3z2yqB;
	Tue, 19 Nov 2024 22:06:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732012194;
	cv=none; b=W9QBR+cAa3w8NU0pfFmrSqGBXAn5lONirt+LyO9G1aWnZihF8fTFEdm5r2jQRiTFiDWrNL1Knd0/nHgb+8c6/d7HQRy8WUuheG7C4LXYdUytl1aDS0H9labh0tZHg1aUpHVTQu1QwP3+5E/5r9BrMeKJ3SzP7PF04T+tYKZcNRwu/v5MSZT7Uf8+M7s4Vs/nFqotfASc8c2ZcWMdqzFHiXhCiPC9B5JxY38+WeZrJ0aevNaKAtXnndTqemp9D/XgevRDIGWQK6x49msf9xnEd60pOZqnD+GmqIWkxa04nI7+hnumOfmxfVcpiRSNOmTow23C04+kpoHWGKsDfB20LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732012194; c=relaxed/relaxed;
	bh=wOw9MHV7KRt1eXKNGVgXOufOASCySN7RIHtVck5/tL4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=NemOVeUBBtAeiF8G/5WCM45NhYOfkPfJJl672rI7XNGBxG3OXuYvZcboMl6U+B+xdI6ZM/tMZmgxMlpIVvYAiuRTTsOOE6eR2IFpForsyRRKir1rkNSUKOuHFiEtLH/Kulfpsb4G4udMdDkw05eKz3/ZHIUgSemp3UtqOTZ9hJHtnyiCF2OOBqYbSrqBwONV+aAeqVIcpXYbON4Y1/ohCTm+gkNVbtTe3lwLot2kEBaYCMwY0EiEBJxUfzhcfmrXyqIKXhhXvEITpZQee96tQGDXtkms28CIDR7TkQZkU7ahWMN+I9VuYZbyCPtbgESIViYzMLlNm89XsHk6Z8zlEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RNQJY+T5; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhihang.shao.iscas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RNQJY+T5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=zhihang.shao.iscas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xt12n4Qhjz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 21:29:52 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21262a191a5so15335ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 02:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732012189; x=1732616989; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOw9MHV7KRt1eXKNGVgXOufOASCySN7RIHtVck5/tL4=;
        b=RNQJY+T5uK4RGZWiZdcGQlq+/7X5pmJMIinWv7qc5NS2aj5490CZ7zxcw97SWaUhUZ
         65va7GxLexsv2K/HLaMV63swOjEIySIJD1tjz1ktSpzKZL3e70qomC21J2Nr4ATu6AQp
         VStzT04Cw8KHQtia0w21Ji4xrWTGMJbZk9l9ncSHe+wlKyKLgZCWOcnB9ZQ10EwVGQFr
         ySdmMO4jDL2DI/woMncdA4NWyKc3G7cgAlpdn5BsdwfLMbYrWyG/gPIF0XhHRvQZHMTh
         O6Wrfux+wG0cBIpwmkipAhPJPN0lYl97Mg2r7ekE2624Ntl0E7Gl/EBOOgAwrXvuUQgv
         q6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732012189; x=1732616989;
        h=content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wOw9MHV7KRt1eXKNGVgXOufOASCySN7RIHtVck5/tL4=;
        b=BHyeRcbyi0noqbuZaUyiTBGqWvoRls45aGTvNIc2QyTwTxxjs6mUS2lkbqgTKOXA6u
         uh4dPrG7BPDwkKQUHnhemWGY86o86aqBroKQaBbq1SSVf0fNBjFpNV38+jSpISFusDow
         RrcCKiavl46rT/Rz47ZuU+x+l5nbK0tXpUQ83LwK96K8xsAjCCX6yxoF3zgCxRou+tbZ
         pVbEne0zOh2kPKxqHRiyZMw+bdIhXAuV73m9fzSXTSjtRbUMWoEHz5/YVpX5SICjGiAZ
         UHL9jXHxDCrKW3w/4gsSPUoVYU7avI+7gaaQyxcFDg+A9tIOKcZfBJMtMKKWflM/ge9m
         kITQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqk0F0qSjHTL78mkDlNiq2DZugDuf4QsmcMutnwBcTNkY0oJbFCccfNuh+tclp6pth9o255WVX2DannS4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzqEwWRDZ0eijGRWJ2StKKnrkbSjrf1pYibGH9UFvSu+Az5RGd3
	Td2hU4zmN87D89cT1iKHsQadKzSd0sK+eFkEz1UEfka/hVYOns32
X-Google-Smtp-Source: AGHT+IGjPmgZGITjgIZAbFEZh1xtuft53899R6LA7gUtB/vv0OHvViNr8Z67ILi49wQx8T2CgbcBnQ==
X-Received: by 2002:a17:902:cec5:b0:20c:ce9c:bbb0 with SMTP id d9443c01a7336-211d0c94220mr253936545ad.0.1732012189520;
        Tue, 19 Nov 2024 02:29:49 -0800 (PST)
Received: from [192.168.1.9] ([106.47.210.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211d0f47adbsm71274335ad.223.2024.11.19.02.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 02:29:48 -0800 (PST)
Message-ID: <72406e89-7dee-4063-ad8a-1d63ddc5bfe6@gmail.com>
Date: Tue, 19 Nov 2024 18:29:45 +0800
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zhihang Shao <zhihang.shao.iscas@gmail.com>
Subject: Re: [PATCH 00/11] Wire up CRC-T10DIF library functions to
 arch-optimized code
To: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024/11/17 8:22, Eric Biggers wrote:

This patchset is also available in git via:

     git fetch 
https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git 
crc-t10dif-lib-v1

This patchset updates the kernel's CRC-T10DIF library functions to be
directly optimized for x86, arm, arm64, and powerpc without taking an
unnecessary and inefficient detour through the crypto API.  It follows
the same approach that I'm taking for CRC32 in the patchset
https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org

This patchset also adds a CRC KUnit test suite that covers multiple CRC
variants, and deletes some older ad-hoc tests that are obsoleted by it.

This patchset has several dependencies including my CRC32 patchset and
patches queued in several trees for 6.13.  It can be retrieved from git
using the command given above.  This is targeting 6.14.

Eric Biggers (11):
   lib/crc-t10dif: stop wrapping the crypto API
   lib/crc-t10dif: add support for arch overrides
   crypto: crct10dif - expose arch-optimized lib function
   x86/crc-t10dif: expose CRC-T10DIF function through lib
   arm/crc-t10dif: expose CRC-T10DIF function through lib
   arm64/crc-t10dif: expose CRC-T10DIF function through lib
   powerpc/crc-t10dif: expose CRC-T10DIF function through lib
   lib/crc_kunit.c: add KUnit test suite for CRC library functions
   lib/crc32test: delete obsolete crc32test.c
   powerpc/crc: delete obsolete crc-vpmsum_test.c
   MAINTAINERS: add entry for CRC library

  MAINTAINERS                                   |  11 +
  arch/arm/Kconfig                              |   1 +
  arch/arm/crypto/Kconfig                       |  11 -
  arch/arm/crypto/Makefile                      |   2 -
  arch/arm/crypto/crct10dif-ce-glue.c           | 124 ---
  arch/arm/lib/Makefile                         |   3 +
  .../crc-t10dif-core.S}                        |   0
  arch/arm/lib/crc-t10dif-glue.c                |  77 ++
  arch/arm64/Kconfig                            |   1 +
  arch/arm64/configs/defconfig                  |   1 -
  arch/arm64/crypto/Kconfig                     |  10 -
  arch/arm64/crypto/Makefile                    |   3 -
  arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ---
  arch/arm64/lib/Makefile                       |   3 +
  .../crc-t10dif-core.S}                        |   0
  arch/arm64/lib/crc-t10dif-glue.c              |  78 ++
  arch/m68k/configs/amiga_defconfig             |   1 -
  arch/m68k/configs/apollo_defconfig            |   1 -
  arch/m68k/configs/atari_defconfig             |   1 -
  arch/m68k/configs/bvme6000_defconfig          |   1 -
  arch/m68k/configs/hp300_defconfig             |   1 -
  arch/m68k/configs/mac_defconfig               |   1 -
  arch/m68k/configs/multi_defconfig             |   1 -
  arch/m68k/configs/mvme147_defconfig           |   1 -
  arch/m68k/configs/mvme16x_defconfig           |   1 -
  arch/m68k/configs/q40_defconfig               |   1 -
  arch/m68k/configs/sun3_defconfig              |   1 -
  arch/m68k/configs/sun3x_defconfig             |   1 -
  arch/powerpc/Kconfig                          |   1 +
  arch/powerpc/configs/powernv_defconfig        |   1 -
  arch/powerpc/configs/ppc64_defconfig          |   2 -
  arch/powerpc/crypto/Kconfig                   |  20 -
  arch/powerpc/crypto/Makefile                  |   3 -
  arch/powerpc/crypto/crc-vpmsum_test.c         | 133 ---
  arch/powerpc/lib/Makefile                     |   3 +
  .../crc-t10dif-glue.c}                        |  69 +-
  .../{crypto => lib}/crct10dif-vpmsum_asm.S    |   2 +-
  arch/s390/configs/debug_defconfig             |   1 -
  arch/x86/Kconfig                              |   1 +
  arch/x86/crypto/Kconfig                       |  10 -
  arch/x86/crypto/Makefile                      |   3 -
  arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ---
  arch/x86/lib/Makefile                         |   3 +
  arch/x86/lib/crc-t10dif-glue.c                |  51 ++
  .../{crypto => lib}/crct10dif-pcl-asm_64.S    |   0
  crypto/Kconfig                                |   1 +
  crypto/Makefile                               |   3 +-
  crypto/crct10dif_common.c                     |  82 --
  crypto/crct10dif_generic.c                    |  82 +-
  include/linux/crc-t10dif.h                    |  28 +-
  lib/Kconfig                                   |  43 +-
  lib/Kconfig.debug                             |  20 +
  lib/Makefile                                  |   2 +-
  lib/crc-t10dif.c                              | 156 +---
  lib/crc32test.c                               | 852 ------------------
  lib/crc_kunit.c                               | 428 +++++++++
  .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
  57 files changed, 867 insertions(+), 1748 deletions(-)
  delete mode 100644 arch/arm/crypto/crct10dif-ce-glue.c
  rename arch/arm/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} 
(100%)
  create mode 100644 arch/arm/lib/crc-t10dif-glue.c
  delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
  rename arch/arm64/{crypto/crct10dif-ce-core.S => 
lib/crc-t10dif-core.S} (100%)
  create mode 100644 arch/arm64/lib/crc-t10dif-glue.c
  delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c
  rename arch/powerpc/{crypto/crct10dif-vpmsum_glue.c => 
lib/crc-t10dif-glue.c} (50%)
  rename arch/powerpc/{crypto => lib}/crct10dif-vpmsum_asm.S (99%)
  delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
  create mode 100644 arch/x86/lib/crc-t10dif-glue.c
  rename arch/x86/{crypto => lib}/crct10dif-pcl-asm_64.S (100%)
  delete mode 100644 crypto/crct10dif_common.c
  delete mode 100644 lib/crc32test.c
  create mode 100644 lib/crc_kunit.c

Good job. It's great to see the code being simplified.

I still want to submit an optimization patch about CRC-T10DIF for RISC-V.

I don't know if it would be more appropriate for me to rewrite a patch 
after your patch is officially applied.

What do you think?

