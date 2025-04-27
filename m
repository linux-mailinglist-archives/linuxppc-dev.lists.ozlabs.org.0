Return-Path: <linuxppc-dev+bounces-8059-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B30A3A9E2FE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 14:35:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlmJ30xhzz2yjN;
	Sun, 27 Apr 2025 22:35:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745757315;
	cv=none; b=GL+NZsd7PXD8cBGmctl+efUkfXsDV62UHu7d41YWbFJ5h307Qmn6CoLKBjSiT40cTsr8xYtdE0N/tRlGRact3YoA/pedaIjvkRu56OWjilXTn00VzFl6EigD52qH8/JC2t1neDSLu1NSXRx7vwg6s7SW2muaOig/TLuU7UDIIFh8oGoQI08CaNX+gdEHa7+x2cwB870Qs4A5OKubLmEhMXenV0he1q42WfqR+YgO6l1xJnLTqVwiLLymmvWNQ21vK/cQfWgoWzD4PxBo0Fv6fijIm3idKbvw/c8EEM99cA260uydEVGE6/Jf0yAv9XKLgTOeJzO8/zkz0hVFiKGH+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745757315; c=relaxed/relaxed;
	bh=x8f4t4nt9rsCTVCnIU404yqWxVU1T55YRezryjfEQVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNS+BMBHxm5pTXL3TUfVuW/Xo9eb+PWEYV3MLwQSUWzl9zD281s9OpUm8x4Kv+9U+2B0lwOOZPUar0FFmqIHeCO8RIpx769OFEL2bjrsJ/Mm3VreQtlw0IVawjYnMOD6A0NbgBBMFbUs7im/11Gmib3zGx+e5pBe6zhkY+9V1Gam/5FGCW/HoidU+CvAo/byl5VBIYkvXmQU+ZcqlYEmc3MSAKXsUqCl3tpDyseB+t0n82kslpOR0f/gikey4Xnxh4yBKYdIXnsbmI3MIMs9zCYMTL6EZBKAkdA96Kv4Aa7Yk+Tjss9X4PTdS3scsyikurbb+gs3vLFnV9idNg9zEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z/bC3K8g; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z/bC3K8g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlmJ22CL7z2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 22:35:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2469BA41B78;
	Sun, 27 Apr 2025 12:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C871EC4CEE3;
	Sun, 27 Apr 2025 12:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745757309;
	bh=+fG06d9jSSQdeLJWYT8qSWyP0TU2u5CifNzbFJ/XfgY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/bC3K8gVx5897sx0m9B41J6wHjyFDFZgASHs9iyreaRRk2MKpyYUHIChH0IMZ+YE
	 CzZkzcFERGfABqvMeyokm38y2VZH1t5PXI3jqlNLj31O6QzfV4ZyHuWpQD5SufL8sh
	 rMNwaM4baXS3hhq65SxgADqCkLMyuW5V/NMVsX9ArKa0gLMzlxZ3ipvrpf8J83tU+o
	 uflwveBrQ+n/Bix3Mc+6fn73BsQynQkFCU+yjw5oweub/OLg/mgN4a2AvYIkGcsQxu
	 WG/oK62LsN1zFPX/8VNMqn7nvg/p7bTy/cbZYyeFB1PCxyrBqaBIAWTWK+La5mkmHu
	 OvCP4g5GpgVHQ==
Date: Sun, 27 Apr 2025 05:35:14 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <20250427123514.GA1161@quark>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
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
In-Reply-To: <cover.1745734678.git.herbert@gondor.apana.org.au>
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 02:30:41PM +0800, Herbert Xu wrote:
> Changes in v2:
> - Rebase on top of lib partial block helper series.
> - Restore the block-only shash implementation of sha256.
> - Move the SIMD hardirq test out of the block functions so that
>   it is only done for the lib/crypto interface.
> - Split the lib/crypto sha256 module to break cycle in allmod build.
> 
> This is based on
> 
> 	https://patchwork.kernel.org/project/linux-crypto/list/?series=957415

Well, barely a day and you've already ruined my patch series.  Now instead of a
clean design where the crypto_shash API is built on top of the normal library
API (sha256_update() etc.), there's now a special low-level API
"sha256_choose_blocks()" just for shash that it's built on top of instead, for
no good reason.  You're also still pushing your broken BLOCK_HASH_UPDATE_BLOCKS
macro that doesn't work with size_t, and putting my name on your broken code
that uses it.

And yes, sorry about the allmodconfig build error.  It just means that the
generic code needs to be split into its own module, like how curve25519 works.
I'll post a new version with that fixed and your gratuitous changes undone.

- Eric

