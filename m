Return-Path: <linuxppc-dev+bounces-8022-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36540A9D98F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 11:07:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl3kv6Bq1z2xnM;
	Sat, 26 Apr 2025 19:07:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745658455;
	cv=none; b=GQzIvw/lqSKoSJs2uF9qcEJv7dkbLRofl4qCdE/TZbTT1zoC2fvKQFHpF7zFYkOaBZGBUafBAEapg3Sr3yUgKZsv1OyBLrZ5cBooGYkrHZzxyDvJSESjW/flB+m02hG9WH9FMYuZxWcLc+26KLRqcMrZT2JfKjnrpzeT18+rqM0SbcE9l0uhlkcqIkz0LNL8moaqf+WsE4glUCbV3/kIuhvf/qXf/o00YdsSdj42VCIiBSWQV45lHx5FiEZTKyNQoVNlCCJebLP339MAAzH9/u2ODFNAzZL5ohRdfHHktian1VlY6ClQhN222yJJPfoL9yRAcDrkrPm+A5F7XB6qXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745658455; c=relaxed/relaxed;
	bh=n4Dlg5dcsRBZhoxPKU7Go31IFMG3GVW7aWlQyuz8bO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S4mWqALMJFAndKDhBLoDnKXjZgpqygxIT47Jd3zchOd0JQbdBLBDza2ykf7S/eh5MDybIGT7eeyU3nlRzoZtGVeXnGke/lnYeVKuKd3umX1S9D7xqRJeCllsCvco/5yvifooB77e/lEtwASgynQbzyi4lDXizXn3Bu9TCT4rM26O30pLKlRl6EpwEr8vgNxWmV/3sbVhTJtVyH8l6GXTQCwUFMxpBC88iIPz0uwkMjdv9jDmSdW4fTIvZa4xxzYSmIgWkIMOlgZ1XOifxC3T0Oj+cG2G/s4wndxg80xPyWOjv90TbRd45GV2gTdS/X+dd+b1ayXOqymDUi2wzyNp5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iYe4NFoq; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iYe4NFoq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl3kt4NdRz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 19:07:34 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 180565C3F69
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 09:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90A4C4CEED
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 09:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745658451;
	bh=buxmpgDAU4rRbUrUPrakdwPyAA4SBheAoAn/RaFjaNY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iYe4NFoqbzJakUpL2a1Z/LN3jzqaUq3m6wX0mgOsNE5ArZ4gofJSd8kuzzJT3onf0
	 AMZpNsMuzVXzozYox/DJP43JL4hqOFx+ePjSNd3izsSNh1nZM2FRWCce5N6SJ6mB8q
	 g7jWvIAsVsfdLVGGw3mtHpy2kkervKAITav/mDRs9sjA/BD31/hfiINg1qSF3yPh8H
	 ggkYKUwDEZR/B3U6IXkxzVGkg5keeio1nepI5b33Wx12arJP1JxFTE8Ji+/Mw+Ixih
	 YYPIbYNHWO2BtHIzeqkjvEn6Pn3QzfwLsMOL0L1MvDR7qPjgaPEak/fMXmQ8o+hqds
	 ckFe2FpwoO/gQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54998f865b8so3019578e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 02:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGSJSJgaj2HEdkP71sLOVr4xxw6LkDs85mpFi7FmO5JM/lhvMXOF1h9l/345tAwVX3K+HOQPAet//Q07U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZePa3/Ez1vOeeomZfG3BbC5F7BxlDvmdjQQGF4jX9i+Bt2UNk
	nEAKzNl1lRMiDiiTlPuhCRTctXIz84KtEksko2McNAvCup3bM4vepmGGth2REalSgID1RxL6Zo/
	BmntJNXzY9nx2XATFar7ud6eGhFQ=
X-Google-Smtp-Source: AGHT+IGJ8kVblFjzzc4iKrNwvB8Li0uKGxlh3w81ehqTxUdVSkCQSygCbDPyUqy8FGBbbYlDPRasDsnkAI7N2GRBzdk=
X-Received: by 2002:a05:6512:308c:b0:54e:81ec:2c83 with SMTP id
 2adb3069b0e04-54e8cbd5977mr1469007e87.18.1745658450215; Sat, 26 Apr 2025
 02:07:30 -0700 (PDT)
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
References: <20250426065041.1551914-1-ebiggers@kernel.org> <20250426065041.1551914-5-ebiggers@kernel.org>
In-Reply-To: <20250426065041.1551914-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 26 Apr 2025 11:07:18 +0200
X-Gmail-Original-Message-ID: <CAMj1kXE1BKGspnSmqFJkqLCMMT+j=ZHEngKqcdOJsQ-LkyQdMg@mail.gmail.com>
X-Gm-Features: ATxdqUGaw6rq_tP-WceTvDry4j7gdc2ygQ9IvUcCsDooEKyi9c3QpD_gnY-Uz9Q
Message-ID: <CAMj1kXE1BKGspnSmqFJkqLCMMT+j=ZHEngKqcdOJsQ-LkyQdMg@mail.gmail.com>
Subject: Re: [PATCH 04/13] crypto: arm64/sha256 - implement library instead of shash
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
> Remove support for SHA-256 finalization from the ARMv8 CE assembly code,
> since the library does not yet support architecture-specific overrides
> of the finalization.  (Support for that has been omitted for now, for
> simplicity and because usually it isn't performance-critical.)
>

This is fine - when I added this, kernel mode neon on arm64 would
eagerly preserve and restore the FP/SIMD state every time, but this is
no longer the case.


> To match sha256_blocks_arch(), change the type of the nblocks parameter
> of the assembly functions from int or 'unsigned int' to size_t.  Update
> the ARMv8 CE assembly function accordingly.  The scalar and NEON
> assembly functions actually already treated it as size_t.
>
> While renaming the assembly files, also fix the naming quirks where
> "sha2" meant sha256, and "sha512" meant both sha256 and sha512.
>

Good idea. Note that the ARM architecture's SHA2 extension only
supports SHA256 not SHA512 (which is a separate extension), so this is
where the confusion came from.


> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/configs/defconfig                  |   1 -
>  arch/arm64/crypto/Kconfig                     |  19 ---
>  arch/arm64/crypto/Makefile                    |  13 +-
>  arch/arm64/crypto/sha2-ce-glue.c              | 138 ----------------
>  arch/arm64/crypto/sha256-glue.c               | 156 ------------------
>  arch/arm64/lib/crypto/.gitignore              |   1 +
>  arch/arm64/lib/crypto/Kconfig                 |   5 +
>  arch/arm64/lib/crypto/Makefile                |   9 +-
>  .../crypto/sha2-armv8.pl}                     |   0
>  .../sha2-ce-core.S => lib/crypto/sha256-ce.S} |  36 +---
>  arch/arm64/lib/crypto/sha256.c                |  75 +++++++++
>  11 files changed, 98 insertions(+), 355 deletions(-)
>  delete mode 100644 arch/arm64/crypto/sha2-ce-glue.c
>  delete mode 100644 arch/arm64/crypto/sha256-glue.c
>  rename arch/arm64/{crypto/sha512-armv8.pl => lib/crypto/sha2-armv8.pl} (100%)
>  rename arch/arm64/{crypto/sha2-ce-core.S => lib/crypto/sha256-ce.S} (80%)
>  create mode 100644 arch/arm64/lib/crypto/sha256.c
>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

