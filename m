Return-Path: <linuxppc-dev+bounces-7775-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BEFA930BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:24:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0VF1m5dz2ygm;
	Fri, 18 Apr 2025 13:24:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744946645;
	cv=none; b=Qgyh+FYyTwEsmRX1MnoDywY2bwzbSTMh6w4K/LQXc4QlmRq0R80vl4/TyAM3RSCCBvyBsYuGKsicxQ+dl4UZKFvyP0idc8IBCt+KYw/3pIHoObXGnhpl2X7vIOeYypKTq55HwHRzq7I5cSgoeLL+WvXG/cI7NK0hXMC728GcphstUmlU4GBVlK0yJFNv6agDhcG9Vl1Xfvmx3GUZbnFftM0iAVR8//+/tvJwFi1NeOEFJrPYwrvHr5ygjvLXSNYzQw1ySsc+ULZ2ZxWoo1hhFiXwvIEd0nMMCtmiNAglASS+QmlsQKnDjmC32sgNt8R79Ezqzu9rYo2xiuYa6mOIDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744946645; c=relaxed/relaxed;
	bh=Knan138NdmDVR2CPp6B1Qzbr7MQKu8dC2FLjkzzbmvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OiTp0DKtO7OtROEh1j3GkSSxpQDrav28QFc8v5rTrI674P5x6xERYCXz0LIphIbVYakQgBPQ94KjWgQza+vcT1N42tjw0KCu2Aioke14h06Fbs5duXhHoM7dlFdeXxkzo2YQY7vZ4+CxAJ+58v0iMoF+1gm5F+A5/gapp++dsy+dKdKALVIHtbmhBiQqy/A7ti7HejXZ3Om1P6vDSjtz85/YD4BzNS1j6kJLQDHFUCVDWpWDpXLxkjUBSSJvIZAx6poUnU/hyKiYZUIkFYmRSr1eEgSJdzaN5eFdW1urlTLzGi9MPPypVntlikJAEQdDiKmv37YTxMiueOQ9klijCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Ez6H9+ae; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Ez6H9+ae;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0VD1jK6z2ybQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:24:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Knan138NdmDVR2CPp6B1Qzbr7MQKu8dC2FLjkzzbmvI=; b=Ez6H9+aeRufRaBW4KKs6TPV5rc
	/oGb4UfCcPzduHjQnNyKHxy1droB9vh99WEubgJTKYlrwvLCjkkgjHxnJvGSHFEaDyNsclRpwc1Qs
	Cff94MmADxhIheCuAX3VjYAbtcKNwLjxn8YHYFZmQthiylFdl7PKYwOcyZUqwFbEznpb/pqqHww24
	acLyNI3vutChyZ5dcDugMElCr+iaDZqZGGzOMWF1E3KrL2c9R/ivnrdJPpi1EHCbMgucJtJiv4WjA
	/lmyWUibeMw+8o8sNujxq/GZWsvpcObxg73E3FjEzh76LAPfRp9q6WsuheEUa8W3mPwpRoLiAxFLw
	MiZJjYEQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cKf-00Gebr-1J;
	Fri, 18 Apr 2025 11:24:02 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:24:01 +0800
Date: Fri, 18 Apr 2025 11:24:01 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405182609.404216-9-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
>
> -static void __exit chacha_simd_mod_fini(void)
> -{
> -       if (IS_REACHABLE(CONFIG_CRYPTO_SKCIPHER) && boot_cpu_has(X86_FEATURE_SSSE3))
> -               crypto_unregister_skciphers(algs, ARRAY_SIZE(algs));
> -}
> -
> arch_initcall(chacha_simd_mod_init);
> -module_exit(chacha_simd_mod_fini);

Why did you remove the ability to remove the module?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

