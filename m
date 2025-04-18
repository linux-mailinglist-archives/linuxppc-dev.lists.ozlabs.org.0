Return-Path: <linuxppc-dev+bounces-7774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE978A930A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:12:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0F02Vj5z2yfx;
	Fri, 18 Apr 2025 13:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744945956;
	cv=none; b=AWO4XTrXLAqX8wXpKJXkjTBwAodFZpLNNBBcGIwUcxKRqVasfLlmR6oSnW3FKBRphrlgeQwboVvnSBdGjytvSQqpqrUDeQG0/E2jc3L/RyPZI5hSaFucRrz+U8ktq5Nb9P9DlILb5eGtk7qby6OzWGN+dcKoeNMA0GMpTp1+EpVc6YGFLMx/M+PJGJN/PUwHsHgeQC13z8i/E0EAlM0/kkLaPgvKJwSbc4yfMavv3cv3cpzXEyAHjJwwMyLuH+Pj1I2CeFulEWjwowaf9Ada28j8aOWAk5DEm+Gb4BWDeicYGZRDhbIGPJbHebzi4kzsLm1Wc8RVXiwXBpXmDK3DIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744945956; c=relaxed/relaxed;
	bh=qq3IJ8JynJU7O/u61XzBFurm3qauuCX8QJaB8lmSmMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=lkcPFY0QSiF+RmRErOrhuSAajjLQG9Y51qFZ/BnmixeC2mtiv+MSeVvFjMYnH4ORX5ddF1NdlcCe4IkY7KcviJD4fWSlSlc7nPcP5ZNKMjFFlviIv5XtnOjjRVwAMb1KIWAV6fiR9dDLvMXp6kyEYyVjB6wz/D+J2CE57LriDXrcZFKk1nYgyMNHh7kVQUOFdFsyNobPsFSzBK4qlg6TXRtzJHwGE3a9BPEE7NGNgrXL7XZkmGD87ZDgeXmZlEb8kdvqoKgwYIv9s0V4QD+LWro0tGVuGtqGGPXtfnvbaA+7/AtC1kb+Kz3IP3sMFU4rzedwQqg0DHrXeQasChz+ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=lB9E6cNu; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=lB9E6cNu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0Dz5KWgz2xGp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:12:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qq3IJ8JynJU7O/u61XzBFurm3qauuCX8QJaB8lmSmMc=; b=lB9E6cNuSpcyi+wIu4AqMWeil0
	alzcTCb8M0sQjC3ocdCcpRZ7ehcuXZCrNwyx1ktrooWWCIj9iFB6ayBnatRwq92K37AmhyCcFpXLM
	OR9e6IryCcw4t9lLbx+iOgIT/J6/Nf7SPfzVxH+nsHHDbyUlxK9gArH9xK0tEh68vW8tpZqshwV60
	srqfoeG+JXGqwaRw7MJ5peD3FZ4dVqaCTIk4WCfXtFicKq71IJL7/pd35ZfY6eJZdKDcfGOtNV+RZ
	uMoaQcAjSWR5DbCKLE+VpsD4RlHlZGjqodehTXvdjY2oZGusKWENmpVPPhYzvxILIptYXb2DLX0SE
	9vbdVKHg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5c9Z-00GeXp-1B;
	Fri, 18 Apr 2025 11:12:34 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:12:33 +0800
Date: Fri, 18 Apr 2025 11:12:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
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
In-Reply-To: <20250417182623.67808-2-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
>
> config CRYPTO_CURVE25519_NEON
>        tristate
> -       depends on KERNEL_MODE_NEON
> +       depends on CRYPTO && KERNEL_MODE_NEON

Rather than adding CRYPTO to each symbol, how about grouping all
the CRYPTO symbols together under one if statement?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

