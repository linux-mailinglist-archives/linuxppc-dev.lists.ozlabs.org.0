Return-Path: <linuxppc-dev+bounces-2828-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB359BB1DC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2024 11:57:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhpM76J4sz2yJ5;
	Mon,  4 Nov 2024 21:57:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730717827;
	cv=none; b=Y7l5+t0rHjfPrT3JSaNFXRCf5Eb8SLl5XnmxNZOiWXbI+vnZNaCfYTRn1Ajidpni4AJPV4yN4R/j8UfNOr6/0PSKIwMVldGQoCXgX2a3UM17Nfu9VM1V/rV+ecrx5elsqiZ2vomOtJnqQbf5aR0jcKQMEpQgZvVFRu66u9axyKzoMDS3b80WUJOG9rpEQraOzihAUaqEzltXE9xS9CLu7YHmQU04adbELF9vPZUtRm/hYFGAjWiW/v5lyKveaBOukqaiUsEzwQe317dpztDfdlJBNx15RzI3KHddRAtjT4I6XiLVzA80xd0cFyu2rCC1a2WMs7za3QX0sCphJx2VXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730717827; c=relaxed/relaxed;
	bh=nx6Wwnblco5hB2GQvRaC9H5nZFcrOej/pxY8FjnCmy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mfKN1YWjohohc1GqGi/Ih+liBZcZGlALZ9RDE0l/t6hP40LoJfGCzEB3LwVBfjmMrI9cvbmSUJYo7NZ9JoQwsBLapSufHEeNFHk4uuqdkCIArmupe4CdFMEMPqT4dJXdbpRfsR+xQPMmTus9V+zuw+m5jiYwKiCEiYckli5uST3j8f3o4yhSLnuLaV34mQ3NjZdpGIGcdUu+YIrNqRM6fefpsfNN+0WUDCnI2mVQX8c8bEAFw+wyNjEwW8aEvq0g4PO6Vy6u6hPKtCNU7gsKnwnQ7se/X7eEtcz8T/x9Q6Yo6NXlEBgmNxpMrD5NaSj/TVKWBNC4GFA1m4RmrRc+cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EADOQrSt; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=EADOQrSt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XhpM654gdz2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 21:57:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F176A42D8D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 10:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2168FC4CECE
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Nov 2024 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730717818;
	bh=6qFxuwoqjmsBXA5afiRPckV6EYzE55EhM//TIyBTrQ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EADOQrSt03YURgotEa0RPC+Q+iLgiLTpyDunuCSyI8JrnJ8j4YEhKIdjW/X9XmfJY
	 sTCnqIY+Z2AkNeyzcvIvr+dGT6FfLBfZvlbrdb8z2SiV9hm+elSOB97O2rE7ro9EXq
	 0i/CQC7v2klAcuIyDxn2pg7/smSOsw0dT4Hhws9swr3/XRUtzPo+CxQGrrBX7df8D/
	 5J0t2oN4EkGyZAZoiEf4JRfD6nAiE3emF0OuGcBGMMWHNR23yXfKnSbJVb11OHm5BV
	 KUm+3gkbO7B14khPoblQ7uBvr3V7hMm9Omm80Fu2OU58gX+loUjMi/2DNHEoGYci8U
	 QgiPNae8TP/uQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so40103331fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Nov 2024 02:56:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKvUt8pL0I7ddZwYC8SiWCya3w+JsP/Sq30LWKbqfdqT8NMJHBe1d9iDDzuUKQ6V0w5rl2x0aHxl1Yd9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwqEk0W3+35Rjr41AnMeXZsWvASDqCXMEwO+f+wp8CwtIa4pNaX
	BJlonDZctit/t0E8lAaVqR2UI2mZ71xmATb6Uqm0O9FwxPJLqWP7SBd3wDwjh+xFlX6o39oNLFF
	co9qIRApJo4aNrF5J6Wu9XvONAz4=
X-Google-Smtp-Source: AGHT+IGbnKnh4aAfaULtSCmiukLUpnKZU5MlHxJghtOAuKX/zIcXfbKXe/xSvudBsLa83HeLXpJgE1iAQVUbiw2PNrM=
X-Received: by 2002:a05:651c:1508:b0:2fa:fc41:cf80 with SMTP id
 38308e7fff4ca-2fedb7ecd4amr43930581fa.43.1730717816511; Mon, 04 Nov 2024
 02:56:56 -0800 (PST)
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
References: <20241103223154.136127-1-ebiggers@kernel.org> <20241103223154.136127-5-ebiggers@kernel.org>
In-Reply-To: <20241103223154.136127-5-ebiggers@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 4 Nov 2024 11:56:45 +0100
X-Gmail-Original-Message-ID: <CAMj1kXH3C1xP7865V-mJ+3=FDHTR-df909=7jift_Z6dmp58Gw@mail.gmail.com>
Message-ID: <CAMj1kXH3C1xP7865V-mJ+3=FDHTR-df909=7jift_Z6dmp58Gw@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] crypto: crc32 - don't unnecessarily register
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

On Sun, 3 Nov 2024 at 23:32, Eric Biggers <ebiggers@kernel.org> wrote:
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
> (It would also make sense to change btrfs to test the crc32_optimization
> flags itself, so that it doesn't have to use the weird hack of parsing
> the driver name.  This change still makes sense either way though.)
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  crypto/crc32_generic.c  | 8 ++++++--
>  crypto/crc32c_generic.c | 8 ++++++--
>  2 files changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/crypto/crc32_generic.c b/crypto/crc32_generic.c
> index cc064ea8240e..783a30b27398 100644
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
> +       num_algs = 1 + ((crc32_optimizations() & CRC32_LE_OPTIMIZATION) != 0);
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
> index 04b03d825cf4..985da981d6e2 100644
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
> +       num_algs = 1 + ((crc32_optimizations() & CRC32C_OPTIMIZATION) != 0);
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

