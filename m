Return-Path: <linuxppc-dev+bounces-3435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124CF9D2489
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2024 12:05:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xt1qk05LFz2yhg;
	Tue, 19 Nov 2024 22:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732010773;
	cv=none; b=PeLQMpJeCOz6eD2p/bOPR3DQKsvrc6Ajy3lWwtZcalQTL6NXRqy0aAWACy0oLb8vDlTvNqK7h+0kRilLR4fxtoyMOzdy0RD9mMUiPRV/Oyf7FHJPQhuxjMLpekxBJfmEKAeUCPVvTmrmKD6Se+SVsBgEqz/j/ysjHOYd419CIDSrwLx7qOLz0j22pSA5l7tAB7sU9QecLbmSHfJAb9Xbe/G+qqSORN6bZMjniXY1tNAs9tcdBWf0V98nnZ0DIGfV7HoiUa4hUTvxfL02ibzcx+R/haM91ZxcVqWPkZxSE8LOmcFOcqofXioNPwAg7qKhs/KDFMEvKSRAZxEh9QaTog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732010773; c=relaxed/relaxed;
	bh=DY7ks8E9k2pdNI9Oq6qHUEeWcXLL+Xc2vEFqd29394w=;
	h=Content-Type:Message-ID:Date:MIME-Version:From:Subject:To:Cc:
	 References:In-Reply-To; b=QtGSmxWiqFmESYTUbyWojk25sO0A8yubsS2fpnlgonq0pWqa49sQ9/RUqvDAVP7UlOF3EYbORWvKLgTSfCC96z5auwxc8q69wn2TjLWBAM/7OAIryWjl9BK6r8JXVuzR9Yv+/8O/+bIcN9vPkL3QwaYqFSnHTmSsDiDNHfdqk+yMCWN+jQ6Kb5gKM3+KFhHMH2OzqcNz4slzQ+jkFVNCbgadpoehq2jMM7hkT0NkTETP6ZSlTWN4145u/tzWfU4O+1aQ+h5alI+k058tmyOzEJxDpCrlufp1YGSr3Izu6B91Ac5GxAB5bU3KC2JCCrGRYH8z9HDVwYFk3BbGjW3uTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J75c+HRI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhihang.shao.iscas@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J75c+HRI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhihang.shao.iscas@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xt0WM0LFzz2yDl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 21:06:06 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7206304f93aso2297157b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2024 02:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732010761; x=1732615561; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:subject:from:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DY7ks8E9k2pdNI9Oq6qHUEeWcXLL+Xc2vEFqd29394w=;
        b=J75c+HRIHU8+F6k/5JYWgkUBRAavFIhhcV3Q+4NZsxAHuhqUQaymnV7ix3uhbunN34
         WlQPnJQcVcHxXC03AcrVznK98p+Aip/Eb18IdAHuWIQ3U+CZPxTAoZVrypFP1puqSBDI
         RyGbXQNbcimz0oiv3gpE7vVnrQFGVeZ7H2lklj9MIeU4/E33Z5ILaMB5ElYvu/iktG4/
         diCuW17sbT4Ff6g1x4VPH/iDafO+zBfDqa72XtaPhixHcjt3RzbaHrYj/Vdg2oCMEvv2
         eU2bsb5EvhnFDEzrzvWnRfeBqQDOxEfg56OHWFP+fO7MAJ+MwReBgTNE5DgSs65SeUrJ
         2Vpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732010761; x=1732615561;
        h=in-reply-to:references:cc:to:subject:from:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DY7ks8E9k2pdNI9Oq6qHUEeWcXLL+Xc2vEFqd29394w=;
        b=uSVR10R9GtIagk+gaID7ZBgWfTAo+6kLwBxHqctEN2NNgWhFzG2ZrlB53Tk0oPAwLW
         JHVsM2Hr6IlgfQ33f9S3vO7hAzk0j2JjSTXx4b9hi3nR7SHXeE1CRgQMdbOeHv18xgwn
         kBkPZ211mNCaP+NprjyUvGI+MG6fpk1KtULGwHdKTGSzXeAChIYCG9rWBn7xIDCWbTKQ
         8028Mb7+mr7lITrRz/ipfnkG4zhVIdzha8X/+fPsOnUv9Wev5mFJJec0V19ykMFgpFdw
         8k5tvt3EQPyAwW81RgwzFcLxmBlVj6Zrz8TzkkrsYPrrg/EOS6P8aqEz/DQmfgt78Brn
         6XBg==
X-Forwarded-Encrypted: i=1; AJvYcCXaYe5yxswPm7WXuOqZMrmko2flloIInDxIXgFTaxuKIjsFRKkXmwHV0D2KifN+UJtceQMV2F6ItOaqGOk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxaMgkzO9XSq3DJwa+HzSQd93vA1uIpX+n7sQT88C6PSwnBwxQy
	ZCuUf1+GHeLA8QsYlBbQ0JwsxK4Za8D3JqwcaagnTKRGxncl3OoU
X-Google-Smtp-Source: AGHT+IFT4BMLmkXKJORBY2EfB2CvEM2MtqN/c5DLUhyhaDMkKiX5WYF0AmFoH8cuQsMAUI17tLj0gw==
X-Received: by 2002:a05:6a00:2188:b0:724:603f:1f9e with SMTP id d2e1a72fcca58-7247709d5dcmr21893235b3a.22.1732010760559;
        Tue, 19 Nov 2024 02:06:00 -0800 (PST)
Received: from [192.168.1.9] ([106.47.210.193])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770eefe7sm7652277b3a.31.2024.11.19.02.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Nov 2024 02:06:00 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------NxZT9xa4S606GZGNU3dCRni5"
Message-ID: <860a6acc-2c39-4eb1-8113-a3753f6531fc@gmail.com>
Date: Tue, 19 Nov 2024 18:05:58 +0800
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------NxZT9xa4S606GZGNU3dCRni5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024/11/17 8:22, Eric Biggers wrote:

> This patchset is also available in git via:
>
>      git fetchhttps://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-t10dif-lib-v1
>
> This patchset updates the kernel's CRC-T10DIF library functions to be
> directly optimized for x86, arm, arm64, and powerpc without taking an
> unnecessary and inefficient detour through the crypto API.  It follows
> the same approach that I'm taking for CRC32 in the patchset
> https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org
>
> This patchset also adds a CRC KUnit test suite that covers multiple CRC
> variants, and deletes some older ad-hoc tests that are obsoleted by it.
>
> This patchset has several dependencies including my CRC32 patchset and
> patches queued in several trees for 6.13.  It can be retrieved from git
> using the command given above.  This is targeting 6.14.
>
> Eric Biggers (11):
>    lib/crc-t10dif: stop wrapping the crypto API
>    lib/crc-t10dif: add support for arch overrides
>    crypto: crct10dif - expose arch-optimized lib function
>    x86/crc-t10dif: expose CRC-T10DIF function through lib
>    arm/crc-t10dif: expose CRC-T10DIF function through lib
>    arm64/crc-t10dif: expose CRC-T10DIF function through lib
>    powerpc/crc-t10dif: expose CRC-T10DIF function through lib
>    lib/crc_kunit.c: add KUnit test suite for CRC library functions
>    lib/crc32test: delete obsolete crc32test.c
>    powerpc/crc: delete obsolete crc-vpmsum_test.c
>    MAINTAINERS: add entry for CRC library
>
>   MAINTAINERS                                   |  11 +
>   arch/arm/Kconfig                              |   1 +
>   arch/arm/crypto/Kconfig                       |  11 -
>   arch/arm/crypto/Makefile                      |   2 -
>   arch/arm/crypto/crct10dif-ce-glue.c           | 124 ---
>   arch/arm/lib/Makefile                         |   3 +
>   .../crc-t10dif-core.S}                        |   0
>   arch/arm/lib/crc-t10dif-glue.c                |  77 ++
>   arch/arm64/Kconfig                            |   1 +
>   arch/arm64/configs/defconfig                  |   1 -
>   arch/arm64/crypto/Kconfig                     |  10 -
>   arch/arm64/crypto/Makefile                    |   3 -
>   arch/arm64/crypto/crct10dif-ce-glue.c         | 132 ---
>   arch/arm64/lib/Makefile                       |   3 +
>   .../crc-t10dif-core.S}                        |   0
>   arch/arm64/lib/crc-t10dif-glue.c              |  78 ++
>   arch/m68k/configs/amiga_defconfig             |   1 -
>   arch/m68k/configs/apollo_defconfig            |   1 -
>   arch/m68k/configs/atari_defconfig             |   1 -
>   arch/m68k/configs/bvme6000_defconfig          |   1 -
>   arch/m68k/configs/hp300_defconfig             |   1 -
>   arch/m68k/configs/mac_defconfig               |   1 -
>   arch/m68k/configs/multi_defconfig             |   1 -
>   arch/m68k/configs/mvme147_defconfig           |   1 -
>   arch/m68k/configs/mvme16x_defconfig           |   1 -
>   arch/m68k/configs/q40_defconfig               |   1 -
>   arch/m68k/configs/sun3_defconfig              |   1 -
>   arch/m68k/configs/sun3x_defconfig             |   1 -
>   arch/powerpc/Kconfig                          |   1 +
>   arch/powerpc/configs/powernv_defconfig        |   1 -
>   arch/powerpc/configs/ppc64_defconfig          |   2 -
>   arch/powerpc/crypto/Kconfig                   |  20 -
>   arch/powerpc/crypto/Makefile                  |   3 -
>   arch/powerpc/crypto/crc-vpmsum_test.c         | 133 ---
>   arch/powerpc/lib/Makefile                     |   3 +
>   .../crc-t10dif-glue.c}                        |  69 +-
>   .../{crypto => lib}/crct10dif-vpmsum_asm.S    |   2 +-
>   arch/s390/configs/debug_defconfig             |   1 -
>   arch/x86/Kconfig                              |   1 +
>   arch/x86/crypto/Kconfig                       |  10 -
>   arch/x86/crypto/Makefile                      |   3 -
>   arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ---
>   arch/x86/lib/Makefile                         |   3 +
>   arch/x86/lib/crc-t10dif-glue.c                |  51 ++
>   .../{crypto => lib}/crct10dif-pcl-asm_64.S    |   0
>   crypto/Kconfig                                |   1 +
>   crypto/Makefile                               |   3 +-
>   crypto/crct10dif_common.c                     |  82 --
>   crypto/crct10dif_generic.c                    |  82 +-
>   include/linux/crc-t10dif.h                    |  28 +-
>   lib/Kconfig                                   |  43 +-
>   lib/Kconfig.debug                             |  20 +
>   lib/Makefile                                  |   2 +-
>   lib/crc-t10dif.c                              | 156 +---
>   lib/crc32test.c                               | 852 ------------------
>   lib/crc_kunit.c                               | 428 +++++++++
>   .../testing/selftests/arm64/fp/kernel-test.c  |   3 +-
>   57 files changed, 867 insertions(+), 1748 deletions(-)
>   delete mode 100644 arch/arm/crypto/crct10dif-ce-glue.c
>   rename arch/arm/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
>   create mode 100644 arch/arm/lib/crc-t10dif-glue.c
>   delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
>   rename arch/arm64/{crypto/crct10dif-ce-core.S => lib/crc-t10dif-core.S} (100%)
>   create mode 100644 arch/arm64/lib/crc-t10dif-glue.c
>   delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c
>   rename arch/powerpc/{crypto/crct10dif-vpmsum_glue.c => lib/crc-t10dif-glue.c} (50%)
>   rename arch/powerpc/{crypto => lib}/crct10dif-vpmsum_asm.S (99%)
>   delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
>   create mode 100644 arch/x86/lib/crc-t10dif-glue.c
>   rename arch/x86/{crypto => lib}/crct10dif-pcl-asm_64.S (100%)
>   delete mode 100644 crypto/crct10dif_common.c
>   delete mode 100644 lib/crc32test.c
>   create mode 100644 lib/crc_kunit.c

Good job. It's great to see the code being simplified.

I still want to submit an optimization patchabout CRC-T10DIFfor RISC-V.

I don't know if it would be more appropriate for me to rewrite a patch 
after your patch is officially applied.

What do you think?

--------------NxZT9xa4S606GZGNU3dCRni5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 2024/11/17 8:22, Eric Biggers wrote:</p>
    <blockquote type="cite"
      cite="mid:20241117002244.105200-1-ebiggers@kernel.org">
      <pre wrap="" class="moz-quote-pre">This patchset is also available in git via:

    git fetch <a class="moz-txt-link-freetext"
href="https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git">https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git</a> crc-t10dif-lib-v1

This patchset updates the kernel's CRC-T10DIF library functions to be
directly optimized for x86, arm, arm64, and powerpc without taking an
unnecessary and inefficient detour through the crypto API.  It follows
the same approach that I'm taking for CRC32 in the patchset
<a class="moz-txt-link-freetext"
href="https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org">https://lore.kernel.org/linux-crypto/20241103223154.136127-1-ebiggers@kernel.org</a>

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
 .../{crypto =&gt; lib}/crct10dif-vpmsum_asm.S    |   2 +-
 arch/s390/configs/debug_defconfig             |   1 -
 arch/x86/Kconfig                              |   1 +
 arch/x86/crypto/Kconfig                       |  10 -
 arch/x86/crypto/Makefile                      |   3 -
 arch/x86/crypto/crct10dif-pclmul_glue.c       | 143 ---
 arch/x86/lib/Makefile                         |   3 +
 arch/x86/lib/crc-t10dif-glue.c                |  51 ++
 .../{crypto =&gt; lib}/crct10dif-pcl-asm_64.S    |   0
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
 rename arch/arm/{crypto/crct10dif-ce-core.S =&gt; lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm/lib/crc-t10dif-glue.c
 delete mode 100644 arch/arm64/crypto/crct10dif-ce-glue.c
 rename arch/arm64/{crypto/crct10dif-ce-core.S =&gt; lib/crc-t10dif-core.S} (100%)
 create mode 100644 arch/arm64/lib/crc-t10dif-glue.c
 delete mode 100644 arch/powerpc/crypto/crc-vpmsum_test.c
 rename arch/powerpc/{crypto/crct10dif-vpmsum_glue.c =&gt; lib/crc-t10dif-glue.c} (50%)
 rename arch/powerpc/{crypto =&gt; lib}/crct10dif-vpmsum_asm.S (99%)
 delete mode 100644 arch/x86/crypto/crct10dif-pclmul_glue.c
 create mode 100644 arch/x86/lib/crc-t10dif-glue.c
 rename arch/x86/{crypto =&gt; lib}/crct10dif-pcl-asm_64.S (100%)
 delete mode 100644 crypto/crct10dif_common.c
 delete mode 100644 lib/crc32test.c
 create mode 100644 lib/crc_kunit.c</pre>
    </blockquote>
    <p><span style="white-space: pre-wrap">Good job. It's great to see the code being simplified. </span></p>
    <p><span style="white-space: pre-wrap">I still want to submit an optimization patch</span><span
      style="white-space: pre-wrap"> about CRC-T10DIF</span><span
      style="white-space: pre-wrap"> for RISC-V. </span></p>
    <p><span style="white-space: pre-wrap">I don't know if it would be more appropriate for me to rewrite a patch after your patch is officially applied. </span></p>
    <p><span style="white-space: pre-wrap">What do you think?
</span><span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------NxZT9xa4S606GZGNU3dCRni5--

