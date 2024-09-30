Return-Path: <linuxppc-dev+bounces-1688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856D98A0EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 13:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHJtt6ZcCz2y8B;
	Mon, 30 Sep 2024 21:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727696197;
	cv=none; b=DxzSgvJANzytoqoObujmTP8ir/SB7Ysnn1ZQCU8HyD6kRebHMDyL9ZtzogztGuWyW5WQ7vyHC683BdnywFNXtIjbZbaZv5ppbf9pW0QgCv+mM8JG47+fcKSKmS+Vr3H9pqCHhc2vP7JedPsub08X7acmPg4VDl4NocHKHX31gYdcCHImO4XdP3XjDnEQkllWoqiQ6PD21ssDLkXE7GCLKCCVhC9T8cViPt8CLBIMHjAdprupNFbhkFKSPR3iL7pMF5EwIA8fQlmVrDRnxNyFMoow5U/fCCiuD6ZIuv4qOQBxIEWQBFp2wjGD0em66y6nhFZZ3eTmPaqBsf+DteWBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727696197; c=relaxed/relaxed;
	bh=2VX6c6YK1omHm0CY6LFLrfYKCzrajpypR+D1bELxrmE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mqfAZe2Ro5R4TT3e7NK9QnTQdygvZSeGx5sYUfx2aCCI6xzIp5RsN6/tRelADNKp8uS52VlWaNfj1qcs5XLFNFhHVQ1pkDwyM+r9nwbHkC1zhFWo/26VQUvXzTD5y/2P2SB8sSx1/KN1m+ADclAE10T2JzxDgvOl/wfSEFn29bzm5h7HGmwjuuifANC7cIZn/c8gRqQUTiQ8eS1NbtUz6pBkOUCAZxLiuD6IaYoyEZJKIV+Btu2Cs7WgLYUt5coZVB6BcljWIuP9OlWs3EEzGVLouM9SQ3thgZLgPwQPx1TgYty4VVYobaUUCCteIjrSBGPMkh9GV0C6swEIpI1K2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Wp9Jl8D7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Wp9Jl8D7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHJtq6Ky3z2xtb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 21:36:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1727696193;
	bh=2VX6c6YK1omHm0CY6LFLrfYKCzrajpypR+D1bELxrmE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Wp9Jl8D7TyU5Fse4gmcS2J39/Gx630a8reaLcnTTLSGlL2Q8y6Akbbbsb9wGGZl/a
	 qMNmS2QgeZq6HiwykdShnutKMS3MAxJam1NpPL+2aV+rcUt+zXNagWkZ5YA9Jpyxa6
	 z7qmg2QdNzKiYOC4r455J2wxoG1M0O1B+7Wl1eu2bRhuF5i2y9I+OsowjBJSJ5A0JC
	 hyUfNc+LWsdtNSTNOWtbpgNcWWnLL5ZpTOh/BHQJUYo6ckEv7XWjfdyN8vYikp8zwM
	 ZXAcrAo3xC7p0X+40iy9LwUYLN2X/vNsKuXdA0N45l1FEsAXqErJgri1LbPg22+WWz
	 HCcNhwDC2LCug==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHJtm73pJz4wbR;
	Mon, 30 Sep 2024 21:36:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, "Jason A. Donenfeld" <Jason@zx2c4.com>
In-Reply-To: <20240925175021.1526936-2-Jason@zx2c4.com>
References: <20240925175021.1526936-2-Jason@zx2c4.com>
Subject: Re: [PATCH] powerpc/vdso: allow r30 in vDSO code generation of getrandom
Message-Id: <172769616489.25733.8173629873068528485.b4-ty@ellerman.id.au>
Date: Mon, 30 Sep 2024 21:36:04 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 25 Sep 2024 19:50:22 +0200, Jason A. Donenfeld wrote:
> For gettimeofday, -ffixed-r30 was passed to work around a bug in Go
> code, where the vDSO trampoline forgot to save and restore this register
> across function calls. But Go requires a different trampoline for every
> call, and there's no reason that new Go code needs to be broken and add
> more bugs.  So remove -ffixed-r30 for getrandom.
> 
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/vdso: allow r30 in vDSO code generation of getrandom
      https://git.kernel.org/powerpc/c/4b058c9f281f5b100efbf665dd5a1a05e1654d6d

cheers

