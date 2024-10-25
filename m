Return-Path: <linuxppc-dev+bounces-2607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFC09B0FD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 22:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZvbh3hpMz2xCd;
	Sat, 26 Oct 2024 07:32:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729888352;
	cv=none; b=oxlUsYe+KAlPTZv1lVIgBVpIVknBStH1ueALYKVQM3gI+Tivjj7K7YewUzzidlUoZlRntsneZdJJ6SR7VmWbQiTEM4rBMTn3gsUJ4FWjx/S2LWOYLxXgUN9s6hFOY5SgaeNa9YnXYhNTsC0vPOSkilXWi0RsmJ/4Usb4DO1RKgSYyG3feMW1dOEvhKuqe5Ql8bD0gCG1ocBXIa6HvFvjhneVJcWHIJWzFUx7JitqFvs2O2lYeaKvuISroKCcu9YM62KznG2qsx4VFAicHgtOLIwpKslLOguQtjF2PnF2yBl9QwbvwFTX4jQ2KN6Ovz0MbLGJ+Pbun5/H0F3ctPh3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729888352; c=relaxed/relaxed;
	bh=cTUERFsy8K5/pl07EUDBeFnq3I9Zkbo0oaQDqVJpurU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1Wfe4VD7WK9s/xCxAqXEbFR/zCDPBAm5JtHMHWMwZQNqSuqmzUdkMX04N/xg/UTBJwD5iMl1uGwFxLXpR+7CW6DzF7pkH7frV/bjVLfBvR5p/bciJgEwOXeqN4AsGlaDEwssaGiNW3Xt17rTn3iY+EPjpoJ/GfcWU66oJ9JC2BSjdGspuJUl0btPzXlC0vdQABdQAdZx49EuDTcYaImVSFe61VODJZrVb/3K5yhksm/y7Sx/SO5LXIxyuErElIMNgtjG5AIbBio84FVvd2pjjUFe+w1fYu3zoZucP7DWbo5cSaemesiorvvrsDd98T8wm9f5EFV5/Ve/SiEgPjLtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQe2ZQ+t; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qQe2ZQ+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZvbf3QJQz2xBk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 07:32:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3E6E5C53A7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 20:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52BDC4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729888347;
	bh=ZOwjJ8kzzckhcIYE8j5hMZsSJUKc5cYu8yXf20E0HuM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qQe2ZQ+tSWetaoVGslaOuLKxN45AkmR2qZL3ILBwg0inR1U0Bmqzc2I/H0SPNy1q+
	 xqhvZ1lVsaUgvK+i94ztGpOyctfsh9xsUmDl7oWGF8DsRY0dU+ALpo3kC2CFzgTRCs
	 d1Gn2syKnR1u3PGOMFPA5PNTxrRkzCzY8B16NsRjasHVCOlyrTHAR42WYFBMOtUfdG
	 GuwI0SitSv5h2cI0j6gOREAiw+lsj8YMWu7ap7hTnjYpP9sp1h+2oosiZ+DKa4ioms
	 DkdlTrqAnhayaHpQbacjuHAxvBZczD1BLzN5cmfWkxHDMqhlulxn98YRbq9P+Xq7+2
	 Z2GT/dJ3wtK6A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so23763081fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 13:32:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWBUug0manHH4xCIlcIERbm1Bqe9cxXcK3kJj7TfhjoUAXd4KDl/Ugad5/owoGijPW4zxSuARqI2A6Jobw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx7M8OpsXuisI3yRyAZb2Lu8HB8Zrf5C8jfactaqeuKjF7LsAFN
	Wgf5iImE/rg9Fc79XpyEm/lv13ecG4ZTNhAUNWGsNmQyNFLFpbownJASr3pj0B470CadEKFl6tE
	o1jwMAS4MB3asbQB9OwO80A9/ScI=
X-Google-Smtp-Source: AGHT+IHWDYSNqGzTxA1yucLBJm6V+3waey3TQHM3kNvlUas/obIoVX4SuU3pAE8hqdaCjuOs8zy+d7cgGIIryFN5WyY=
X-Received: by 2002:a05:651c:50b:b0:2f9:cc40:6afe with SMTP id
 38308e7fff4ca-2fcbdfae574mr3209411fa.14.1729888345976; Fri, 25 Oct 2024
 13:32:25 -0700 (PDT)
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
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-4-ebiggers@kernel.org>
In-Reply-To: <20241025191454.72616-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 22:32:14 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
Message-ID: <CAMj1kXFoer+_yZJWtqBVYfYnzqL9X9bbBRomCL3LDqRcYJ6njQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] lib/crc32: expose whether the lib is really
 optimized at runtime
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Make the CRC32 library export some flags that indicate which CRC32
> functions are actually executing optimized code at runtime.  Set these
> correctly from the architectures that implement the CRC32 functions.
>
> This will be used to determine whether the crc32[c]-$arch shash
> algorithms should be registered in the crypto API.  btrfs could also
> start using these flags instead of the hack that it currently uses where
> it parses the crypto_shash_driver_name.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/arm64/lib/crc32-glue.c  | 15 +++++++++++++++
>  arch/riscv/lib/crc32-riscv.c | 15 +++++++++++++++
>  include/linux/crc32.h        | 15 +++++++++++++++
>  lib/crc32.c                  |  5 +++++
>  4 files changed, 50 insertions(+)
>
...
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 58c632533b08..bf26d454b60d 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
>         if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                 return crc32c_le_arch(crc, p, len);
>         return crc32c_le_base(crc, p, len);
>  }
>
> +/*
> + * crc32_optimizations contains flags that indicate which CRC32 library
> + * functions are using architecture-specific optimizations.  Unlike
> + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> + * variants and also whether any needed CPU features are available at runtime.
> + */
> +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +extern u32 crc32_optimizations;
> +#else
> +#define crc32_optimizations 0
> +#endif
> +

Wouldn't it be cleaner to add a new library function for this, instead
of using a global variable?

>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
>   *                   sequences of bytes, seq1 and seq2 with lengths len1
>   *                   and len2, crc32_le() check values were calculated
>   *                   for each, crc1 and crc2.
> diff --git a/lib/crc32.c b/lib/crc32.c
> index 47151624332e..194de73f30f8 100644
> --- a/lib/crc32.c
> +++ b/lib/crc32.c
> @@ -336,5 +336,10 @@ u32 __pure crc32_be_base(u32 crc, const u8 *p, size_t len)
>  {
>         return crc32_be_generic(crc, p, len, crc32table_be, CRC32_POLY_BE);
>  }
>  #endif
>  EXPORT_SYMBOL(crc32_be_base);
> +
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +u32 crc32_optimizations;
> +EXPORT_SYMBOL(crc32_optimizations);
> +#endif
> --
> 2.47.0
>
>

