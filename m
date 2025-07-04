Return-Path: <linuxppc-dev+bounces-10118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19EAF9415
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 15:27:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYZDc1cCjz3blH;
	Fri,  4 Jul 2025 23:27:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751635632;
	cv=none; b=Z1beOL8q7cp4rtAwcoEgyORNvxLzIvnmNqT9vCTrNXMAkOEh6Ua0gD9uDjjpmnWSUJB30sgVp6WHWCEqsZvRXlaFycQLlmwD/Js3QA2d7o3XCOy3hrQ4WzRYozbZjO0sKNDE5vnT3Bd40HIJQEFYlLw0T76NTDXxgr8eWQw2Z3HN775hDUzjaQqn9w2KPTo6eMNkpdBAicrXis7YUhcxJ0UI5ZYSai2HNU9Hn+XPi231OTB29fDScRtF0oyiY3eDz+1b0rmrFoYFKNF9c9rQB+T5xvZy+HCzc1+lEDF/BoTQB3HaV428/TrjDpqn9m9xiJUpM5zvbS71W9EryKVXxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751635632; c=relaxed/relaxed;
	bh=Y67omdNsRzGiYfKThMM73Sspj4UJQkYkveftpUDTVCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B5zj5T/lPnFyuxHyPHYJNB4uSDnKl/Uu/3x3cRQHrJVKXOuLSfXA6ri+Dyz6CeOUSpYT0qV+AKppqiKWsu6TREIFzCaWUZOqKT9M+qCzs0NHs9Do624wAnEgtDswIUKDNxvLqe6J5fN65fNZLTKdKo49Sf66aCbG6C27y9o/t7ZlojDqAB2ww2e+GxWefiPTslDZgXG+KRYTbwCQScxwjUXXs8SvbtgLDdLFsBOKbF+F42br5Z5iLD/Xx7iZOsSAhfaUBvx8RKvTpnpSMeOh0hLkPHyhDJBEN6dDu0pjPCiDQNGB+d/qqpjMP3YTnZTa4JOQpCYGljJYvtt9RixQbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lu0fEi+g; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lu0fEi+g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYZDZ6RtLz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 23:27:10 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D83B4408A
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 13:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AF1C4AF0C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jul 2025 13:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751635628;
	bh=UmMK4vWBWCkUTxLdUKXC8/KSjdp8rccHH64kZT4FmmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lu0fEi+gQsq8IUwn6EEfu/eI1rogJbit7P7CqTe0KP86Hy+4bXK37MxUdwohdMj7J
	 BIljCNK7dh5Q+/SSrlI6W10bclsGAg7d7FkAeKju8IDrpBStrpPkZnkXRG4yB7rO6+
	 McdqYfs4MnyQ0tuim5erEKaX0MenHVTu+HbQVW6J5lRzj2AxzinKbWZG9k0qsR0/lZ
	 7bZdRuTweHSHHVfLL/y8T0loZmktCIhTCXGmjmKvBZ1sMpdPKBNCUEcAOVg/OKR0QN
	 0qE28/95dJUOrDVnsJuKAdTEjv1KZ57WKoL0GJxEIF4hRZDjNS2Np6UYRK2EU3VxUm
	 sJKGqlCd7WAtA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-55502821bd2so1101951e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Jul 2025 06:27:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXu6HuaW/AcumUt8UyQ3G80h+G3dvExe0I6AdIWkz+MG3+14LepnptEbP8bCsexuDtkckoSxfxSra6R2ps=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGaluUbqK4tNNL2JCNaJfaP73b3mpChpLFMENzydvR8XUSyOWo
	z2Yq1kqtjxZUwUWLfmKIeQKtjjJoioYQwC32B9C6cAu2yzn2aJWohJRPYNZpu51p1HMaI2nplBn
	MHtGyn+NctrLtv6bM7cBtIhGGtsFwtPI=
X-Google-Smtp-Source: AGHT+IHbXsSqxiQQgTganngCHyLYaDZCz1QOmHZXPSAjSWrJrmUK1ng5PlRRa0qT4YG3miebycXJXkcbsNGhKOePUQw=
X-Received: by 2002:a05:6512:3da6:b0:553:d8ca:4fcb with SMTP id
 2adb3069b0e04-556dbf81a40mr784811e87.21.1751635626524; Fri, 04 Jul 2025
 06:27:06 -0700 (PDT)
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
References: <20250630160645.3198-1-ebiggers@kernel.org>
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 4 Jul 2025 15:26:54 +0200
X-Gmail-Original-Message-ID: <CAMj1kXGTSfgVoqpmC=5z1kuAHw_JXo=rCEEFy4tRJdwAb2ExZA@mail.gmail.com>
X-Gm-Features: Ac12FXyPp6fnvKb4WZAS9lUDfLS7Jj9PzhxOzqBaJq_NKIJbrn4XwJZRpCZIh-c
Message-ID: <CAMj1kXGTSfgVoqpmC=5z1kuAHw_JXo=rCEEFy4tRJdwAb2ExZA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] SHA-256 library improvements
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 30 Jun 2025 at 18:09, Eric Biggers <ebiggers@kernel.org> wrote:
>
> This series is also available at:
>
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git sha256-lib-cleanup-v2
>
> This series improves the SHA-224 and SHA-256 library code to be
> consistent with what I did for SHA-384 and SHA-512.  This includes:
>
> - Use stronger typing in the SHA-224 and SHA-256 functions.
>
> - Add support for HMAC-SHA224 and HMAC-SHA256.  (I'll send a separate
>   patch with KUnit test cases for this.)
>
> - Make the old-school crypto API's support for sha224 and sha256 just
>   use the actual library API, instead of unsafe low-level functions.
>
> - Consolidate the CPU-based SHA-224 and SHA-256 code into a single
>   module, with better inlining and dead code elimination.
>
> - Properly document the SHA-224 and SHA-256 functions.
>
> - Other changes to synchronize the code with SHA-384 and SHA-512.
>
> Changed in v2:
> - Dropped sha224_kunit.c changes; it will be added later in the history
> - Dropped some patches that I folded into the SHA-512 series
> - Removed redundant checks of IS_ENABLED(CONFIG_KERNEL_MODE_NEON)
> - Removed obsolete setting of -DARCH for sha256.o
> - Fixed a commit title to mention sha256 instead of sha512
> - Excluded HMAC-SHA{224,256} code from purgatory, where it isn't needed
>
> Eric Biggers (14):
>   libceph: Rename hmac_sha256() to ceph_hmac_sha256()
>   cxl/test: Simplify fw_buf_checksum_show()
>   lib/crypto: sha256: Reorder some code
>   lib/crypto: sha256: Remove sha256_blocks_simd()
>   lib/crypto: sha256: Add sha224() and sha224_update()
>   lib/crypto: sha256: Make library API use strongly-typed contexts
>   lib/crypto: sha256: Propagate sha256_block_state type to
>     implementations
>   lib/crypto: sha256: Add HMAC-SHA224 and HMAC-SHA256 support
>   crypto: sha256 - Wrap library and add HMAC support
>   crypto: sha256 - Use same state format as legacy drivers
>   lib/crypto: sha256: Remove sha256_is_arch_optimized()
>   lib/crypto: sha256: Consolidate into single module
>   lib/crypto: sha256: Sync sha256_update() with sha512_update()
>   lib/crypto: sha256: Document the SHA-224 and SHA-256 API
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>


>  arch/mips/cavium-octeon/Kconfig               |   6 -
>  arch/mips/cavium-octeon/crypto/Makefile       |   1 -
>  arch/riscv/purgatory/purgatory.c              |   8 +-
>  arch/s390/purgatory/purgatory.c               |   2 +-
>  arch/x86/purgatory/purgatory.c                |   2 +-
>  crypto/Kconfig                                |   4 +-
>  crypto/Makefile                               |   1 -
>  crypto/sha256.c                               | 371 +++++++++-------
>  crypto/testmgr.c                              |  12 +
>  drivers/char/tpm/tpm2-sessions.c              |  12 +-
>  drivers/crypto/img-hash.c                     |   4 +-
>  drivers/crypto/starfive/jh7110-hash.c         |   8 +-
>  include/crypto/internal/sha2.h                |  66 ---
>  include/crypto/sha2.h                         | 390 +++++++++++++++--
>  kernel/kexec_file.c                           |  10 +-
>  lib/crypto/Kconfig                            |  34 +-
>  lib/crypto/Makefile                           |  39 +-
>  lib/crypto/arm/Kconfig                        |   7 -
>  lib/crypto/arm/Makefile                       |   8 +-
>  lib/crypto/arm/sha256-armv4.pl                |  20 +-
>  lib/crypto/arm/sha256-ce.S                    |   2 +-
>  lib/crypto/arm/sha256.c                       |  64 ---
>  lib/crypto/arm/sha256.h                       |  46 ++
>  lib/crypto/arm64/Kconfig                      |   6 -
>  lib/crypto/arm64/Makefile                     |   9 +-
>  lib/crypto/arm64/sha2-armv8.pl                |   2 +-
>  lib/crypto/arm64/sha256-ce.S                  |   2 +-
>  lib/crypto/arm64/sha256.c                     |  75 ----
>  lib/crypto/arm64/sha256.h                     |  57 +++
>  lib/crypto/arm64/sha512.h                     |   6 +-
>  .../crypto/mips/sha256.h                      |  20 +-
>  lib/crypto/powerpc/Kconfig                    |   6 -
>  lib/crypto/powerpc/Makefile                   |   3 -
>  lib/crypto/powerpc/{sha256.c => sha256.h}     |  19 +-
>  lib/crypto/riscv/Kconfig                      |   8 -
>  lib/crypto/riscv/Makefile                     |   3 -
>  .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   2 +-
>  lib/crypto/riscv/sha256.c                     |  67 ---
>  lib/crypto/riscv/sha256.h                     |  42 ++
>  lib/crypto/s390/Kconfig                       |   6 -
>  lib/crypto/s390/Makefile                      |   3 -
>  lib/crypto/s390/sha256.c                      |  47 --
>  lib/crypto/s390/sha256.h                      |  28 ++
>  lib/crypto/sha256-generic.c                   | 138 ------
>  lib/crypto/sha256.c                           | 413 ++++++++++++++++--
>  lib/crypto/sparc/Kconfig                      |   8 -
>  lib/crypto/sparc/Makefile                     |   4 -
>  lib/crypto/sparc/{sha256.c => sha256.h}       |  37 +-
>  lib/crypto/x86/Kconfig                        |   8 -
>  lib/crypto/x86/Makefile                       |   3 -
>  lib/crypto/x86/sha256-avx-asm.S               |   2 +-
>  lib/crypto/x86/sha256-avx2-asm.S              |   2 +-
>  lib/crypto/x86/sha256-ni-asm.S                |   2 +-
>  lib/crypto/x86/sha256-ssse3-asm.S             |   2 +-
>  lib/crypto/x86/sha256.c                       |  80 ----
>  lib/crypto/x86/sha256.h                       |  55 +++
>  net/ceph/messenger_v2.c                       |  12 +-
>  tools/testing/cxl/test/mem.c                  |  21 +-
>  58 files changed, 1307 insertions(+), 1008 deletions(-)
>  delete mode 100644 include/crypto/internal/sha2.h
>  delete mode 100644 lib/crypto/arm/sha256.c
>  create mode 100644 lib/crypto/arm/sha256.h
>  delete mode 100644 lib/crypto/arm64/sha256.c
>  create mode 100644 lib/crypto/arm64/sha256.h
>  rename arch/mips/cavium-octeon/crypto/octeon-sha256.c => lib/crypto/mips/sha256.h (76%)
>  rename lib/crypto/powerpc/{sha256.c => sha256.h} (76%)
>  delete mode 100644 lib/crypto/riscv/sha256.c
>  create mode 100644 lib/crypto/riscv/sha256.h
>  delete mode 100644 lib/crypto/s390/sha256.c
>  create mode 100644 lib/crypto/s390/sha256.h
>  delete mode 100644 lib/crypto/sha256-generic.c
>  delete mode 100644 lib/crypto/sparc/Kconfig
>  delete mode 100644 lib/crypto/sparc/Makefile
>  rename lib/crypto/sparc/{sha256.c => sha256.h} (53%)
>  delete mode 100644 lib/crypto/x86/sha256.c
>  create mode 100644 lib/crypto/x86/sha256.h
>
> --
> 2.50.0
>

