Return-Path: <linuxppc-dev+bounces-8038-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA43A9DF10
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 07:21:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlZgP330mz2y8p;
	Sun, 27 Apr 2025 15:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745731281;
	cv=none; b=TOpigiLLYv0kyl8PvG21DeW9ZnQ4M9tGS4v+ExAGUKABmDnJLVQZtaX7UzTd2GuKqd5dOLh7cTcfxzqdNeBgRLxB2G00IMeZdHg9rKLzyR927DAx4A/4QI4M8m+gFa+1IRM34Pu6kZ7eIk0CenjVhBBxV2WfLst6vbOR4Ape2kkJ8guJqKKcRpbCINlZKxFHtVJFUpvPN/ub8QpQPfkmMSHacOQnWb9nEPI1nAwzVAtFeIhVDJu8hSauPyCq2/NqsfWGVD6Ip77JTPaOs+M0/mOV0X4QDgLu7IvV42VTklVydL0qSJxu1oIQ8Ms5v81MIIP5mFMv8zXiJDnl1blhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745731281; c=relaxed/relaxed;
	bh=Pl2+iJoLEKyoEY1+QMbzNQxE4vs1/OpqeGo2MbFswoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUiDASsjvIW6ylMfX8e+1l3egZ5ms1flJUQY6UKGtm8Lw+idZ3KVWdK8fGd0JDRNuHxDxaozO3Gqvalrs5r/Omrc57HcHPkIk5L+4yj69i4F250gniWtt69tIBxNWYtFK7DGr0D3rxkbhWmfO1Axx/R2c+lEGj7it+55jZBehFbjoW1Pxr4dGyOo5vVrOtnj2QCyEt9sYT5Mtkj8eS6U3n774yuZVxR39mmS8fC7LzkcBFKjErh5yuQnPbXk3HR/grJ0WmgSDhANz6qwTlm1NN0y2n8fsatced0FvhZ7qSqh/xf/nLMkctbwVRs+W1Rj94kwm5k/s+ES915dQU1z4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=dGnaoUBg; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=dGnaoUBg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlZgM4G4kz2xCW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 15:21:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Pl2+iJoLEKyoEY1+QMbzNQxE4vs1/OpqeGo2MbFswoc=; b=dGnaoUBgwG+MFM/UgCXPevwWE5
	1SBPXmQTDAAc/9iOYOSD/BlyZtCEk3qq8qm0xiPTxGOsP0Dv0Cw7NIlflY5pITkraHSwdkFx7tBEu
	kNOVMTuERLnZjhJ97P/WUb5iDMqM7BFVuNjR2p1i8CPh29AUn0QzldJUQHx63UY9Gtj4dZFw+4J60
	7EAM3fs081VqfaaOkty5cnDU3lpHYiWRncdhaPEG3RRHmegrSfjx8TOlUtTKeao0saw22Kz+s2kbK
	iDNll0edL8bDHDIHJMTq0JiEhdzcGql3p4Was7EPbmHmk5EEwlBqueiaFepnGV2nfCTSxBFlxEi4C
	UTWU99PQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8uRz-001KyE-1U;
	Sun, 27 Apr 2025 13:21:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 13:21:11 +0800
Date: Sun, 27 Apr 2025 13:21:11 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH 11/13] crypto: x86/sha256 - implement library instead of
 shash
Message-ID: <aA2-x-grUfoulkDf@gondor.apana.org.au>
References: <20250426065041.1551914-1-ebiggers@kernel.org>
 <20250426065041.1551914-12-ebiggers@kernel.org>
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
In-Reply-To: <20250426065041.1551914-12-ebiggers@kernel.org>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 25, 2025 at 11:50:37PM -0700, Eric Biggers wrote:
>
> +void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
> +			const u8 *data, size_t nblocks)
> +{
> +	if (static_branch_likely(&have_sha256_x86) && crypto_simd_usable()) {
> +		kernel_fpu_begin();
> +		static_call(sha256_blocks_x86)(state, data, nblocks);
> +		kernel_fpu_end();
> +	} else {
> +		sha256_blocks_generic(state, data, nblocks);
> +	}
> +}
> +EXPORT_SYMBOL(sha256_blocks_arch);

Because of the back-reference to sha256_blocks_generic, I get
this with a fully modular build:

depmod: ERROR: Cycle detected: libsha256 -> sha256_x86_64 -> libsha256
depmod: ERROR: Found 2 modules in dependency cycles!

I'm going to split libsha256 up into the block function and the
lib API.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

