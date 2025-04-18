Return-Path: <linuxppc-dev+bounces-7799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F0BA93C41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 19:50:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZfMk04gkJz3c56;
	Sat, 19 Apr 2025 03:50:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744998632;
	cv=none; b=W+wt9T5r55nTw7ASCDRGt3Hsq1buVddY9HRIuy4RPvdr7f9B/TE1WI9r1iSezlAnoqDBQtO3LFwcfmJtX12JiGYYGu6xCR5xhmxOql+jd5FLgpt2qfC233wcycvMmg1DyMUGerOdLL2Y31XSdQ97xEuqKGYni0wXbwpGYSVhOpd8MHHNnlgGfHBsb9w/Ygd1h3j4XydWB36fuszZmZMEp4/CrQKXYaWYNiZ4E1GyGljR8nouXfWWvQDesfZETvZqXp6LUY0Tl+FMZBpCSwXxTwY60v3r/416x2T5IOsYeL0Sl3BH4I9xp11C73STWAvAVssyPwmmAzk2FvIilvw+uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744998632; c=relaxed/relaxed;
	bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID; b=jaYXYKC1GF+rfm031tkFeClXaQpteSp5LlV7DHAr1lrLocehaErrGeUAOZwxpiCDx8Ft4VAFB72P9wk2rWTUQsP4nmjEu/M73DPsoPJ69VpTKNtg0t70USROnBw+1T+6XLhDwOEUMYHLx10qf+7m3c4TWiYqWN3bOFxdE8nG0TFyLCLpdngNrmUtI7V7Rkpz5/CZ9wnICVhElW7flk39PkdhiUR9E5/roKQARILS1U0MIOtZw3HpaAcIUkH8OzBASlTrrejz+PciuEUQe65+HEPclYJVldo+7HeaA3+QCN9Cutoy7p4bhE+g9CiYYijpb5FuPKRKDO8ehq8tzVUQLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eRDoCCCs; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org) smtp.mailfrom=dabbelt.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=eRDoCCCs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=dabbelt.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=palmer@dabbelt.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZfMjz2CJjz3c54
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Apr 2025 03:50:30 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22423adf751so24673695ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 10:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1744998628; x=1745603428; darn=lists.ozlabs.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=;
        b=eRDoCCCsw5dGD+Wq9PoyAofu9okUJINmr4TyOZ/s71AlbosnRSieVC0oFGrDm7YcwO
         XVoUvrQoQKkBv9MruYS/45NrgbUqu0M5UJdo44whK+MbSKenVYT9OWzNwTGUdHbRc1EJ
         JGo1WftSq/uzGLOvmlKGQoiwGyIJh4dc2vz32DdON/SYJeg8MSA+oQ0Wc0nUoR9Q0EvP
         1qm9arZw5yChdjb0NQERpLr9Jf+obnUJVNt32njemlqLgSCM6orF9MWHxEtZL8eAySXo
         1/V1FC6AzfVYelPTR2PsM8eF4vGrpxcBSY0KJt+Y8qBzCbC6u4W7zvB34U+DzLW/sSTD
         QnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998628; x=1745603428;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xitBrw85Cpa/PH99l1OqltSYYTa4EEM01UtrGh+UZZU=;
        b=raKe+49is5D+RhZ+j/JmwOfN3eNPXpgBfzdVNF55BtR6ygKW9r6hSi2AhEmIS32NTE
         fua1LOeO5z5U9Zh8t9ELkMQQrjsMItSOU/RyKYmiuUn8FWLuILU/VjyQv0KW7cb2hXiX
         IvTvimj2VU2cXPXDwmgYsGiLJ2VUEZaJnUVi9PIe95Quj884K+L1+2Jk1dzRojIJUlCh
         mpZZwkwEkF1Ew3B/U7K+WXNp8BDXOoFFte5jzAvjOm4/fHEZ6kVgJM9WZVen3lzpuJJh
         fWk+T2L2sDHhMF00NYBaco9xpAJPP7JAoCfhzTTJLetwT8IQ0y572ieJ9UKI5sOdLtnk
         Ufwg==
X-Forwarded-Encrypted: i=1; AJvYcCU0usm5ArPz48hK0m0370W4ac2YRmYlsRsPfUHrATsqDo4NGg0T2MU/Sf7m9zMDjiUX6FBI+A6DYiFap38=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhVGR2iJl2g6TAMBgr8OG/wmeJ3//J/TcwJ5xl+ZInDNP00GO5
	w2Z4gZuUw6gd/6V5iDPOserEXDFx/w/GakskoZiSIqBjeChNb46ZjXERv0KvzGBvlOW3AququfN
	0
X-Gm-Gg: ASbGncs//T8hORsT1b+/Q/pRcmmECoeMfeGwVtt0zONG1SAncUlPTjHzHSHkw2N7blL
	V9jF4fzDKNqZvtAQu+2HETxA4wsydKEox6ZogL9H/KcmWr9BCF2J6uxPkZC7T6lFhYl8jiBbL80
	lBsI25HUtQ6u2mQdRwos6J970wbDNAZapfxxC5mkjPVbgbhPmJLXMFokYhKkoBBPuJZu5RmAkYV
	qRrq4XtmlA8+8O8SeFvAvJ+5NPx1zKzlB10tvvaWTtD1hFanz7KU4uLS/yId6jS+bUan8rCTmJ+
	9yyv+Pw4PRHpmFSodr7xxgmkicB/xPQ5Ew==
X-Google-Smtp-Source: AGHT+IHTtFpIUh9V1D/hgIg7h0JnpsXp9Bovo24GVumcqsEBZfrWrJPuzOPDear/0hml7HCNfS1GQA==
X-Received: by 2002:a17:903:98f:b0:221:7eae:163b with SMTP id d9443c01a7336-22c53627298mr52330365ad.46.1744998628042;
        Fri, 18 Apr 2025 10:50:28 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fde845sm19513745ad.236.2025.04.18.10.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:50:27 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:50:27 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Apr 2025 10:50:25 PDT (-0700)
Subject:     Re: [PATCH 08/15] crypto: riscv - remove CRYPTO dependency of library functions
In-Reply-To: <20250417182623.67808-9-ebiggers@kernel.org>
CC: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
  linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
  linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, Jason@zx2c4.com,
  Ard Biesheuvel <ardb@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-78030c23-f066-4b83-8d7b-c1720725199d@palmer-ri-x1c9a>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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

On Thu, 17 Apr 2025 11:26:16 PDT (-0700), ebiggers@kernel.org wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Continue disentangling the crypto library functions from the generic
> crypto infrastructure by removing the unnecessary CRYPTO dependency of
> CRYPTO_CHACHA_RISCV64.  To do this, make arch/riscv/crypto/Kconfig be
> sourced regardless of CRYPTO, and explicitly list the CRYPTO dependency
> in the symbols that do need it.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/Kconfig        |  2 ++
>  arch/riscv/crypto/Kconfig | 12 ++++++------
>  crypto/Kconfig            |  3 ---
>  3 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index bbec87b79309..baa7b8d98ed8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -1349,8 +1349,10 @@ source "drivers/cpuidle/Kconfig"
>
>  source "drivers/cpufreq/Kconfig"
>
>  endmenu # "CPU Power Management"
>
> +source "arch/riscv/crypto/Kconfig"
> +
>  source "arch/riscv/kvm/Kconfig"
>
>  source "drivers/acpi/Kconfig"
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> index 27a1f26d41bd..08547694937c 100644
> --- a/arch/riscv/crypto/Kconfig
> +++ b/arch/riscv/crypto/Kconfig
> @@ -2,11 +2,11 @@
>
>  menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
>
>  config CRYPTO_AES_RISCV64
>  	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_ALGAPI
>  	select CRYPTO_LIB_AES
>  	select CRYPTO_SKCIPHER
>  	help
>  	  Block cipher: AES cipher algorithms
> @@ -25,43 +25,43 @@ config CRYPTO_CHACHA_RISCV64
>  	select CRYPTO_LIB_CHACHA_GENERIC
>  	default CRYPTO_LIB_CHACHA_INTERNAL
>
>  config CRYPTO_GHASH_RISCV64
>  	tristate "Hash functions: GHASH"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_GCM
>  	help
>  	  GCM GHASH function (NIST SP 800-38D)
>
>  	  Architecture: riscv64 using:
>  	  - Zvkg vector crypto extension
>
>  config CRYPTO_SHA256_RISCV64
>  	tristate "Hash functions: SHA-224 and SHA-256"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_SHA256
>  	help
>  	  SHA-224 and SHA-256 secure hash algorithm (FIPS 180)
>
>  	  Architecture: riscv64 using:
>  	  - Zvknha or Zvknhb vector crypto extensions
>  	  - Zvkb vector crypto extension
>
>  config CRYPTO_SHA512_RISCV64
>  	tristate "Hash functions: SHA-384 and SHA-512"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_SHA512
>  	help
>  	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
>
>  	  Architecture: riscv64 using:
>  	  - Zvknhb vector crypto extension
>  	  - Zvkb vector crypto extension
>
>  config CRYPTO_SM3_RISCV64
>  	tristate "Hash functions: SM3 (ShangMi 3)"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_HASH
>  	select CRYPTO_LIB_SM3
>  	help
>  	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
>
> @@ -69,11 +69,11 @@ config CRYPTO_SM3_RISCV64
>  	  - Zvksh vector crypto extension
>  	  - Zvkb vector crypto extension
>
>  config CRYPTO_SM4_RISCV64
>  	tristate "Ciphers: SM4 (ShangMi 4)"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	depends on CRYPTO && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_ALGAPI
>  	select CRYPTO_SM4
>  	help
>  	  SM4 block cipher algorithm (OSCCA GB/T 32907-2016,
>  	  ISO/IEC 18033-3:2010/Amd 1:2021)
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 2467dba73372..8c334c9f2081 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1424,13 +1424,10 @@ endmenu
>
>  config CRYPTO_HASH_INFO
>  	bool
>
>  if !KMSAN # avoid false positives from assembly
> -if RISCV
> -source "arch/riscv/crypto/Kconfig"
> -endif
>  if S390
>  source "arch/s390/crypto/Kconfig"
>  endif
>  if SPARC
>  source "arch/sparc/crypto/Kconfig"

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I'm assuming you want to take this with the rest, thanks!

