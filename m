Return-Path: <linuxppc-dev+bounces-8036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF43A9DE8D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 04:05:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlVKr2DGwz2yS6;
	Sun, 27 Apr 2025 12:05:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745719552;
	cv=none; b=VZxIlaDevuyscImPZNFCwHdCUoBRL2VvCsiIUHMK4o7c84Dxuhe5Rcs2RO2WuFZra1RwPPCqIcyJ5mAYHFccIO+v+k9LM3gnrlwMhdwPo8NWGQIozgUyMI62pM+urLKKYkoUMbTzZSW8QtmHrq8//KR4d9NNnvhzoMJpLxaMzRpScmxq+w4VJNjYSlsjwDcZeC/+htymgp8DZ73yX4aKq76x227Pn8Ar56OpFl5szOaRjQWchONoFMR7HAv5fkHzK7jgDwANGQA6nl/6kqpghZTUyyKnyinom4FHplYmRTgheerS4gQzEC80X6IhK3W0xjZ/PfSWyNSBzPsMYqHEfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745719552; c=relaxed/relaxed;
	bh=Fr6T9H2zAVWfdvJ3K161MQ13R94FK5/vPHjqT3ipS1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hvq99srNFEcXjougw4DgcLLVGuEjfi2Z4YF7P5OlF6h13oJDnoRGginOASl4/vjF4D0JRLlgNEczhsWuFamo+vU1tzqN8ZiKlsLaa6OTkqZa5xLzgWL4POgfDx1+6DfQm6WevuBGywya++8PtkpqLAzDc1meQ5+o+QShyZD665jwqDv985VN5LPIXCkv+Rl1zJMnHWUKUKE5eoaYT/rTA5Lx/z+fSzDnlVqe3rphjvOESIUoykBPA7t6u68ZODqOE5abP61l6a587GPBRHB9F7lU+M3dDtEWZUE87oVUhx5ok8ZEKJx8wrOph0U+alBWB+gutQZFWNnT+Uv60JxpYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sCGIitGd; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sCGIitGd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlVKq33wrz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 12:05:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5EC1A4A150;
	Sun, 27 Apr 2025 02:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3BFBC4CEE2;
	Sun, 27 Apr 2025 02:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745719547;
	bh=ueSM0+6v5DBafLvS0giIuMW8ulfX++okvZjAf4dve3A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sCGIitGddXyxO16n9EzYOnE9TFJ4BfEVtkdwKz80J3E+jJ+T0+5bLKSqz39z0wxx6
	 24UXZR0EAV95qJ5XXRDbMxMqTcdC91UJ7yLt1g+MQAvpXl2yFYqk6BRrAx1lSYwwC8
	 LHzKORO2cK0uy22Iu+7qhNLgVYT6LB5/fpWCPdxXrFFOtVTTL2V9LEsPxWdqhGc2A7
	 i7osVXQPlfyBxVjnBs45A0dvXdXOSHPf+nI4xhzbXVaUZB9uKG1IVo9eUa47IVB0+M
	 NHbrX2DWvuSzqqHrTuZcr4Fs1MlwZNwMqI5u3LGtXpfD1hHL8rZ8mIBjmrzaosKfhS
	 9TnNyl+W7Q6Uw==
Date: Sat, 26 Apr 2025 19:05:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <20250427020550.GG68006@quark>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
 <20250427015041.GF68006@quark>
 <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
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
In-Reply-To: <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 09:52:42AM +0800, Herbert Xu wrote:
> On Sat, Apr 26, 2025 at 06:50:41PM -0700, Eric Biggers wrote:
> >
> > But this one does have a lib/crypto/ interface now.  There's no reason not to
> > use it here.
> 
> I need to maintain a consistent export format between shash and
> ahash

Why?  And how is that relevant here, when the export format should just be
struct sha256_state, as it was before?

- Eric

