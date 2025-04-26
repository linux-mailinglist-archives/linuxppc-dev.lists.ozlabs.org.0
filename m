Return-Path: <linuxppc-dev+bounces-8024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E4015A9D99C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 11:11:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl3py3jtrz2xHX;
	Sat, 26 Apr 2025 19:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745658666;
	cv=none; b=fGrK5lBFZmkcNLDcDrAX9sf2VcrM/cxiwTtNryQZtTjrvikft3N+qzMcwG1TBnJtV1FukE2t3K+ChK7ppWxHRvx5Fyg/+k/51BOWTsqOG/wRe6nwc1VkYQCBNg4NQz8rqjTPJUpyu2SVXBrdV1FWQKpOH44b2BqWV+sj4DVVIziby9SDJhYZQCS18v+9wVXE7qk5nOLrnce0UFYBwvx4m8bNllKNtNG6KHJAPgjp3+X+rb12n9CEDGT9trlhQq7xCk201XjBvpmKANKkVcEjp2XdBpu98hVAZoaAgeFcxKoN7UUKWWXjw9vee6ua75uCFeZkqCmCtdT+fi5X71fVoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745658666; c=relaxed/relaxed;
	bh=rTCpnJo/wLXrkH36khfXlnTNieOc0Xo7xnmwF/6qG5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4OFHwu+BFtkzqnCzKaOlnKJZxALwP1ZzOXLKJbNzQ6H/dWmP9QG9ANWL9W5fk8xPk20W+0/33BRuqCqVEe1PRf8Lga4Bh57Ep2YmARJ3U6FnpuprfAfy0ES46OkYXauYfjXUsphq9zWPo0+scE+MLSufmwENPZ1EYIf5rs6OQTPvmetnTkja07v0WS42K1EwJFwQakW2ZQfuGyuTFwbF5toWjZCaZbETubWO56wB+0yaaFxwd66gNdLOZbk4gq2MfwiY878jzyo/6Plo5b3TVDW+c3roysFZtmq39J3Cri8R0sWU0HxXu5B4i4f0uygpBDQcsJuG7WZ8D++2prQeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bpo8Q55o; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Bpo8Q55o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl3px5Ch4z2xDD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 19:11:05 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC7595C2978
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 09:08:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CBDC4CEEC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 09:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658663;
	bh=FtQjZM5OpR8eTj/Tk+/peoGkalxU+ZbYVlDYxiH1EPI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Bpo8Q55o67h7IwV7XIqnLMwJzS5hk0JlwLkWShp8X/AuNAuzFZIGLbhEhwmORDQll
	 utyYeCKtBH02BDpXzFi5Q1FKvNhyPsZBt461UT/aAjxLE4OiGapNZriDHHI8l+7QXr
	 n9eotkJikcjBuB5HJJspSA4xt66VwS5Fo+237shW5zLiSgUeEOqQVBAqBD1KGKoxqD
	 moj7nfOPSMrCmLKbKDLYqEowYy+npb3+2hA2IE87vcQa2omMyyLmyXIFr7iaKWGtR4
	 336OAdWEBAX7Zrbd0jqsolxYv5QUou7cyANxX79PsDPK/IGBihIfL/m1APtOMPUOki
	 +UAtUVW0IVm+A==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54298ec925bso4061013e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 02:11:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJyPxspRi5rerHbPHOyuf1T1w35W6srrLCSQhQliACYZUS7X6xI2flrVQXafTmQvqdq2JrZk75F4zGNBo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXbCbe+tVL6Jl47HPUs1SMAIdHMCvFsyd1nELQ25jIP1D4u9S9
	na13+DZR4noto25faqsGaBvk5J9g30X/6hd7tU78yFpTgebiSWflR7f6C7OYSYY8hICEfxlFS9y
	HEwgLt93kX21hGFIzKyuSDeNNVxk=
X-Google-Smtp-Source: AGHT+IHLH5VeWV0U4iLUEk8k7RFRILjWBSdawBeD90fjLlL8DQGJ5x0W8iCulQNonT8aL01WrKimT1BHnCLrasm95sk=
X-Received: by 2002:a2e:a5c9:0:b0:30b:bba5:ac18 with SMTP id
 38308e7fff4ca-31905b6a5f0mr15804561fa.3.1745658661713; Sat, 26 Apr 2025
 02:11:01 -0700 (PDT)
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
References: <20250426065041.1551914-1-ebiggers@kernel.org> <20250426065041.1551914-3-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-3-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 26 Apr 2025 11:10:50 +0200
X-Gmail-Original-Message-ID: <CAMj1kXG+stJai+pQqAL7QwZHXV2a-hP4jjQKH7O2cBm1GK2aOA@mail.gmail.com>
X-Gm-Features: ATxdqUFDuzRMzSvvkZhhFNt-cqI-JOG2ysnGNbi6gxycTT7GyUoo4km_JN24bFc
Message-ID: <CAMj1kXG+stJai+pQqAL7QwZHXV2a-hP4jjQKH7O2cBm1GK2aOA@mail.gmail.com>
Subject: Re: [PATCH 02/13] crypto: arm/sha256 - implement library instead of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, 
	linux-s390@vger.kernel.org, x86@kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 26 Apr 2025 at 08:51, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.
>
> To merge the scalar, NEON, and CE code all into one module cleanly, add
> !CPU_V7M as a direct dependency of the CE code.  Previously, !CPU_V7M
> was only a direct dependency of the scalar and NEON code.  The result is
> still the same because CPU_V7M implies !KERNEL_MODE_NEON, so !CPU_V7M
> was already an indirect dependency of the CE code.
>
> To match sha256_blocks_arch(), change the type of the nblocks parameter
> of the assembly functions from int to size_t.  The assembly functions
> actually already treated it as size_t.
>
> While renaming the assembly files, also fix the naming quirk where
> "sha2" meant sha256.  (SHA-512 is also part of SHA-2.)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm/configs/exynos_defconfig             |   1 -
>  arch/arm/configs/milbeaut_m10v_defconfig      |   1 -
>  arch/arm/configs/multi_v7_defconfig           |   1 -
>  arch/arm/configs/omap2plus_defconfig          |   1 -
>  arch/arm/configs/pxa_defconfig                |   1 -
>  arch/arm/crypto/Kconfig                       |  21 ----
>  arch/arm/crypto/Makefile                      |   8 +-
>  arch/arm/crypto/sha2-ce-glue.c                |  87 --------------
>  arch/arm/crypto/sha256_glue.c                 | 107 ------------------
>  arch/arm/crypto/sha256_glue.h                 |   9 --
>  arch/arm/crypto/sha256_neon_glue.c            |  75 ------------
>  arch/arm/lib/crypto/.gitignore                |   1 +
>  arch/arm/lib/crypto/Kconfig                   |   6 +
>  arch/arm/lib/crypto/Makefile                  |   8 +-
>  arch/arm/{ => lib}/crypto/sha256-armv4.pl     |   0
>  .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  10 +-
>  arch/arm/lib/crypto/sha256.c                  |  64 +++++++++++
>  17 files changed, 84 insertions(+), 317 deletions(-)
>  delete mode 100644 arch/arm/crypto/sha2-ce-glue.c
>  delete mode 100644 arch/arm/crypto/sha256_glue.c
>  delete mode 100644 arch/arm/crypto/sha256_glue.h
>  delete mode 100644 arch/arm/crypto/sha256_neon_glue.c
>  rename arch/arm/{ => lib}/crypto/sha256-armv4.pl (100%)
>  rename arch/arm/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (91%)
>  create mode 100644 arch/arm/lib/crypto/sha256.c
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

