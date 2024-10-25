Return-Path: <linuxppc-dev+bounces-2608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 887449B1069
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 22:47:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZvx122jJz2yMX;
	Sat, 26 Oct 2024 07:47:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729889253;
	cv=none; b=RSNYdXWCq/hnS5DavGwa/ZTH6NE083uG53Ysz9KDvWykl9rUrsarXsEz4OBCR39H9O9e/kmNLjf0JuASc75872Jd/hBPO5TE2S0g7v+SJtRRPcQR2iThhhHlwNHz/1bs4LTw7wndVLnaELEnBnSI1tEQXlF9OKcliArAPPKltF8gw/7LrnHD/qJmXTjOZJo0CsCuon4JFDqGWbI0+WjYQxuICwu0ZJ1F5Vm7BGEMor4vQVyjVnK1lu11zXq/p3BHSthq9eZfXVZGJYYFP3F6Cd4PvIV5RWmve5yErXGjfaDHzHSPU69sLPzkk6kweZM6bbI+aL70TxLMdMYLwzrf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729889253; c=relaxed/relaxed;
	bh=zd5Anit6yA3HTeMzXbpU7mXaEYKhVeL/IUZRK50Rwjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H/kgqo85Na9Zzjy3UMvnp1qlTx/VB+q/mdQT03t5+q3UPfNMRrZAjP5nP6+uCSgFRpNWbWYrvDnU5SgWv14ckc0GMohErkeGrgyYlr0dyot9s2ASAZjdxxJlSAkVkXvaC1gSeeF2ZPfYpJ79DlDpu3bdyhyu7dFnYYWyDqLSdrkcTJQK5b64g0SsklBVipc/Au+oCqi9iptyEmNxe5kFjI7gb0hJnUmwS2lAECJYOrWnfXujYYKyZo3vB8BJZjA11ODgC4WohhcnbyDcljzIHIvnKaqV2yT4Lhfw+cc4iMvLzemZ82PeI4HQ7PtnJz5G+YdH+fY6At+R/MkK+kw32w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gekfskCv; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gekfskCv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZvwz6H7cz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 07:47:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5202A430C4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 20:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF5DC4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 20:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729889248;
	bh=Tfo5X6uc3w/hrU+iP8PZcK2t41JlU/D+FAY3HHNYJHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gekfskCvWOfIqlAZ/aSuuXFxlPUBLAq/1J8u7BRk+K9IG78a6VWhRP79Fdow15YPf
	 44uCMphVFXEm62CFfo0bnfd3n1CW10JYtALJafsVUKuPU3z4maXZ5sT1Bb2UV9pycN
	 TGG3d8+d3WVZMhgB/k7H5BucarzeptU7ro6s0+7jd2rjHTv2j/nmLH6oV/WpNORUDA
	 xnh/zY6v5NxPpq11QA6EDyZllc/Y/OnW+6atxbqNYXt6wo/B0emCq9krojm4qbnglg
	 hOSv/XbGNEBeJM/x1STwgIFbH8+hKzyAcfr+T2d5ym7TYHf4gr/dfs1497Uiengm5Q
	 UWHjgLfRLSMlw==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fb518014b9so20319091fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 13:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfhG7d6+zDZ9TbAVSV0ZTGYXJQoJ7sT1StWHciifXjMYB0RogfRjgASvOxth8Bwx9vJj0lTEpTxJud2mo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxP4Iiel+pUicWBvem6xIesZqm5/UTm9oETfdq8E7Io+BA7mRVv
	PAo5x6Wm1N43fIH2hleFmZ0O8moDGvmd/8R2jRPMsg56Igabiw9UDo/Pet50DNrWzPLe+JdBJS+
	rF30ZYPsA4f64JDJ8xvIJ0PbqiSs=
X-Google-Smtp-Source: AGHT+IEp6Dx2HlT+U0iGzL8ulgjfv3Yq0fFTV7/qQsnbI5MKZCd6PlYP7CAgGzk4GX/wuTuxR8r9WXnoQ2sPlcjTw1A=
X-Received: by 2002:a05:651c:2123:b0:2fb:45cf:5eef with SMTP id
 38308e7fff4ca-2fcbe04dc90mr3314601fa.30.1729889246941; Fri, 25 Oct 2024
 13:47:26 -0700 (PDT)
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
References: <20241025191454.72616-1-ebiggers@kernel.org> <20241025191454.72616-5-ebiggers@kernel.org>
In-Reply-To: <20241025191454.72616-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 25 Oct 2024 22:47:15 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
Message-ID: <CAMj1kXEsq7iJThqZ7WA00ei4m59vpC23wPM+Mrj9W+HXfk-aSg@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	sparclinux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 25 Oct 2024 at 21:15, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of registering the crc32-$arch and crc32c-$arch algorithms if
> the arch-specific code was built, only register them when that code was
> built *and* is not falling back to the base implementation at runtime.
>
> This avoids confusing users like btrfs which checks the shash driver
> name to determine whether it is crc32c-generic.
>

I think we agree that 'generic' specifically means a C implementation
that is identical across all architectures, which is why I updated my
patch to export -arch instead of wrapping the C code in yet another
driver just for the fuzzing tests.

So why is this a problem? If no optimizations are available at
runtime, crc32-arch and crc32-generic are interchangeable, and so it
shouldn't matter whether you use one or the other.

You can infer from the driver name whether the C code is being used,
not whether or not the implementation is 'fast', and the btrfs hack is
already broken on arm64.

> (It would also make sense to change btrfs to test the crc32_optimization
> flags itself, so that it doesn't have to use the weird hack of parsing
> the driver name.  This change still makes sense either way though.)
>

Indeed. That hack is very dubious and I'd be inclined just to ignore
this. On x86 and arm64, it shouldn't make a difference, given that
crc32-arch will be 'fast' in the vast majority of cases. On other
architectures, btrfs may use the C implementation while assuming it is
something faster, and if anyone actually notices the difference, we
can work with the btrfs devs to do something more sensible here.


> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/crc32_generic.c  | 8 ++++++--
>  crypto/crc32c_generic.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
> index cc064ea8240e..cecd01e4d6e6 100644
> --- a/crypto/crc32_generic.c
> +++ b/crypto/crc32_generic.c
> @@ -155,19 +155,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(u32),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations & CRC32_LE_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32_mod_init);
>  module_exit(crc32_mod_fini);
>
> diff --git a/crypto/crc32c_generic.c b/crypto/crc32c_generic.c
> index 04b03d825cf4..47d694da9d4a 100644
> --- a/crypto/crc32c_generic.c
> +++ b/crypto/crc32c_generic.c
> @@ -195,19 +195,23 @@ static struct shash_alg algs[] = {{
>         .base.cra_ctxsize       = sizeof(struct chksum_ctx),
>         .base.cra_module        = THIS_MODULE,
>         .base.cra_init          = crc32c_cra_init,
>  }};
>
> +static int num_algs;
> +
>  static int __init crc32c_mod_init(void)
>  {
>         /* register the arch flavor only if it differs from the generic one */
> -       return crypto_register_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       num_algs = 1 + ((crc32_optimizations & CRC32C_OPTIMIZATION) != 0);
> +
> +       return crypto_register_shashes(algs, num_algs);
>  }
>
>  static void __exit crc32c_mod_fini(void)
>  {
> -       crypto_unregister_shashes(algs, 1 + IS_ENABLED(CONFIG_CRC32_ARCH));
> +       crypto_unregister_shashes(algs, num_algs);
>  }
>
>  subsys_initcall(crc32c_mod_init);
>  module_exit(crc32c_mod_fini);
>
> --
> 2.47.0
>
>

