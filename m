Return-Path: <linuxppc-dev+bounces-2827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A2E9BB1C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 11:55:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhpKD446Jz2xrJ;
	Mon,  4 Nov 2024 21:55:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730717728;
	cv=none; b=nRF2Hf08UMVYSev/QmA+GMlR52opbVICkVhSp2o4i1aNai9x6lpOse9xWtDSGsEky0dpfDR+DtqTgQ1IASqnyAkf2B0aVdZNoup57mDsANp9TOvus6yS7GVPGSUNupeHNKFEqbqYVwvZbxiQPCXsdZgZbg36SA0YcP1gfcegZ6Gfkh4rCcJZH2LlEhp6yDpihx1XA8FuL4ccZUDENdqIGphtbtXaKy8xyD/d07oAOH2sAVf6DPMFJeopqjtSS/cFt08I5DMmTYr5amqjulLAurTithjRMtq4hobEINmFDnq64iJljMla5uTzayJm+RnDV1QH1nvn68oOIDeL7A6Y9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730717728; c=relaxed/relaxed;
	bh=0y/BHzMpgtNQY/m9htna2CTEfpV1lk9uBvppiDVkNEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A2zTeV6t2aQbemOG/xNym6jWFxbqJzhgLMfdvkxzL4tM8GVUrX9s3niKrtBLkymBOVkM0RO49bEEgmYEbQeotS+D2MbsEZflk2ciRJy6sIX3W2fUoxobuIgsUcpe6kkficT5MJ+r4V8g3YRYypJgZWd1KZT83ba3DXzVoQTMMALjvI+xlwrOUjzABlUlLL2CvFBRFx0sb/eqXX3P3dd94gAB7vk2vIV0pUdks8WSzupOrE3uXVpC8Hq1t+okgUewzmSjWbwS819NabpWSc7GoZ8zO5GrVDNR4TEigCl0L/w63YxNEDazDEnKCFH8LU2aeO3/8mblv7mPHDuM+yFP+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mluckDeM; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mluckDeM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhpKB4y8tz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 21:55:26 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 62A295C54A9
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 10:54:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 951E4C4CED8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717721;
	bh=Xsd60VaJMVJJJZwPYCiMbYDsq4aVLjYnOCS09bBiIXw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mluckDeMk6i5aN2XBOA1zfp0B5xurNz8wOuuO6UKYkZqld8M1vPhMjikatVUxYIq1
	 o/o2n4QC5unxoa1BCq0QEJuuUGosOaiWVlAfms7oPabM1IPV7T5QCnjD432LtwU6jM
	 qNyRNziXoq7Y5K909RLvlKf7uf+1MvZd6Ak8eCwV7pk3wdhybH+DxGdKIZqFxDiZgi
	 /iQnjicc1WrBfd1q+/hj/6yterw6uw+CgPyujA3SNAenk3a2+tEKgLA1Q7vvvsnEYL
	 Fa4fRc5HTw91i3Ikfsm6UaVHVMpdSHGkU3B2sp1paNLh1UwprUskCBwrZH7BP89RDz
	 Po3mKNTx8CmzQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso58861361fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 02:55:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVQeZzbxLj7UzcQywA5HqLbMU1KzgJltn5Zjsw8NagQUNwkuEF660hkCPvSAHz+so8rrm2IssyI8qJ19I8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyGtZyv0PzR5H3G/PH5/L9sUnWvuK9X7rMaClld0tqF2Bxr7PMK
	8YprMwlyvn8Djg1czayWb85XGjuQo2h/8i8/AaJ/zDUwYLvP9ouzVEyyu6uyyp//vu/9Zmz/Xj8
	2v3z1FHSDLct7WCl6guRcE+FaScE=
X-Google-Smtp-Source: AGHT+IFk0/CXdpRr9EA2xNrpgIcdFsD8CEdy30mzTFb0ZlXY/QnyWMuejDDml1MTkf5LmjGORWJ2C6sLEZMa+NCqqXc=
X-Received: by 2002:a2e:be9f:0:b0:2fb:8c9a:fe3f with SMTP id
 38308e7fff4ca-2fedb7c8904mr72976731fa.22.1730717719875; Mon, 04 Nov 2024
 02:55:19 -0800 (PST)
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
References: <20241103223154.136127-1-ebiggers@kernel.org> <20241103223154.136127-4-ebiggers@kernel.org>
In-Reply-To: <20241103223154.136127-4-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 11:55:08 +0100
X-Gmail-Original-Message-ID: <CAMj1kXErAGvJ+ZK1SMQQKVbbZVhjxaWzn0gmV-xxtsoWSuwT9g@mail.gmail.com>
Message-ID: <CAMj1kXErAGvJ+ZK1SMQQKVbbZVhjxaWzn0gmV-xxtsoWSuwT9g@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] lib/crc32: expose whether the lib is really
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

On Sun, 3 Nov 2024 at 23:34, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Make the CRC32 library export a function crc32_optimizations() which
> returns flags that indicate which CRC32 functions are actually executing
> optimized code at runtime.
>
> This will be used to determine whether the crc32[c]-$arch shash
> algorithms should be registered in the crypto API.  btrfs could also
> start using these flags instead of the hack that it currently uses where
> it parses the crypto_shash_driver_name.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  arch/arm64/lib/crc32-glue.c  | 10 ++++++++++
>  arch/riscv/lib/crc32-riscv.c | 10 ++++++++++
>  include/linux/crc32.h        | 15 +++++++++++++++
>  3 files changed, 35 insertions(+)
>
> diff --git a/arch/arm64/lib/crc32-glue.c b/arch/arm64/lib/crc32-glue.c
> index d7f6e1cbf0d2..15c4c9db573e 100644
> --- a/arch/arm64/lib/crc32-glue.c
> +++ b/arch/arm64/lib/crc32-glue.c
> @@ -83,7 +83,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
>
>         return crc32_be_arm64(crc, p, len);
>  }
>  EXPORT_SYMBOL(crc32_be_arch);
>
> +u32 crc32_optimizations(void)
> +{
> +       if (alternative_has_cap_likely(ARM64_HAS_CRC32))
> +               return CRC32_LE_OPTIMIZATION |
> +                      CRC32_BE_OPTIMIZATION |
> +                      CRC32C_OPTIMIZATION;
> +       return 0;
> +}
> +EXPORT_SYMBOL(crc32_optimizations);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("arm64-optimized CRC32 functions");
> diff --git a/arch/riscv/lib/crc32-riscv.c b/arch/riscv/lib/crc32-riscv.c
> index a3ff7db2a1ce..53d56ab422c7 100644
> --- a/arch/riscv/lib/crc32-riscv.c
> +++ b/arch/riscv/lib/crc32-riscv.c
> @@ -295,7 +295,17 @@ u32 __pure crc32_be_arch(u32 crc, const u8 *p, size_t len)
>  legacy:
>         return crc32_be_base(crc, p, len);
>  }
>  EXPORT_SYMBOL(crc32_be_arch);
>
> +u32 crc32_optimizations(void)
> +{
> +       if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBC))
> +               return CRC32_LE_OPTIMIZATION |
> +                      CRC32_BE_OPTIMIZATION |
> +                      CRC32C_OPTIMIZATION;
> +       return 0;
> +}
> +EXPORT_SYMBOL(crc32_optimizations);
> +
>  MODULE_LICENSE("GPL");
>  MODULE_DESCRIPTION("Accelerated CRC32 implementation with Zbc extension");
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 58c632533b08..e9bd40056687 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -35,10 +35,25 @@ static inline u32 __pure __crc32c_le(u32 crc, const u8 *p, size_t len)
>         if (IS_ENABLED(CONFIG_CRC32_ARCH))
>                 return crc32c_le_arch(crc, p, len);
>         return crc32c_le_base(crc, p, len);
>  }
>
> +/*
> + * crc32_optimizations() returns flags that indicate which CRC32 library
> + * functions are using architecture-specific optimizations.  Unlike
> + * IS_ENABLED(CONFIG_CRC32_ARCH) it takes into account the different CRC32
> + * variants and also whether any needed CPU features are available at runtime.
> + */
> +#define CRC32_LE_OPTIMIZATION  BIT(0) /* crc32_le() is optimized */
> +#define CRC32_BE_OPTIMIZATION  BIT(1) /* crc32_be() is optimized */
> +#define CRC32C_OPTIMIZATION    BIT(2) /* __crc32c_le() is optimized */
> +#if IS_ENABLED(CONFIG_CRC32_ARCH)
> +u32 crc32_optimizations(void);
> +#else
> +static inline u32 crc32_optimizations(void) { return 0; }
> +#endif
> +
>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
>   *                   sequences of bytes, seq1 and seq2 with lengths len1
>   *                   and len2, crc32_le() check values were calculated
>   *                   for each, crc1 and crc2.
> --
> 2.47.0
>
>

