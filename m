Return-Path: <linuxppc-dev+bounces-1105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208496F3B3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:55:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRl1pc5z308V;
	Fri,  6 Sep 2024 21:55:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623731;
	cv=none; b=VCN6a2j13KbOuBaTC69c/JK+sHrzOSUafeampAY3j+eo+cbIFeS2dCj/cNCQ7KyyLbboJ3HfNseWQWlOPg03RLSG/ItiY2YYruJZieqM5C5NLnKCGT3XuSx4zXAC5SxjqARaCS5eWvrJP5y0loktTCrvBCWzBjzBe24fYZh7AYy2HBbifU24iSm1/TNKWE92mEoGxq2rhG1Xiuv71f9iizCevcqDE1jzw44S6aeqozsSm70KbLop/gx+dTP5GXwiCHDkUsDhNKW5AMPFpQKpX0BifT43yQGbGufGOVtmt5yH0/9xYQ5TjuLvMK8/siuhzU9NJGVnB0+ngtQdpTyNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623731; c=relaxed/relaxed;
	bh=DbMztvvaFPoOtSRqVj+TzOFz2xGU/sv7nl4ktpugczI=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=h4q503xsCu6ZDz9Tud3j9SZF6kljA+OPdZK72ZoOjufgViUBv6HHOxt0iHaGraY3c1MXrrpgHRinSQOjtZZlvro7gJCXMJPVPQa7+mu7DPnWN2VscA6dVzI1frnmfbM/q/L4JY/KZEugdH3TInfVQaGPxDOSaEDJavQIijta+ArGi5h5upQv/UFK9jrEek+X5y/W0cwZ6Kl1XQTS0JWhf9Osrlig9cpjlDoEEuk7sBQTujr4ZBhLUaz+gEnA01qF9Qud+qVzqm2MmaBrAZ8WvmrxxDqUTeV1fL8sP41lSqTWYbO5D9lX9wijy3AyNj06k5KYjbTOrj5eZA1dt7/q3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U5p5gFX7; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U5p5gFX7;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRl1dRMz304N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623731;
	bh=DbMztvvaFPoOtSRqVj+TzOFz2xGU/sv7nl4ktpugczI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U5p5gFX7B72T6vilbey+jJoTLmSbQx7c23SCrWmgP1za3RogGR3OF6ZFseL8Qb7YS
	 C6F0U76hceuSe3AGIhulZAE3SqOt4Zy4YHJI7HAAvJbGdveco2Xrn4/4K/gwstul8J
	 4ZFgebXNa7idllP29yQT3+f6N9cAenz1tz/r5kOSeu8I/vFZyw78hvjXu6j1sA4ICT
	 skozskyEwyJM3r8jqaxZMv7ON5tkeo5bOtf0yfeDhTLqw/TpBBjuJUypfGKV1eTqEj
	 MxYY5+uICD8qySjCIvgyuOpQx6rrJotKcs6vSd803i4K4xciAoxOmnbFu0eXR/LBM9
	 u0u0HK6VlacEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRk6qSlz4x8c;
	Fri,  6 Sep 2024 21:55:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <2439d50b019f758db4a6d7b238b06441ab109799.1724156805.git.christophe.leroy@csgroup.eu>
References: <2439d50b019f758db4a6d7b238b06441ab109799.1724156805.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/32: Implement validation of emergency stack
Message-Id: <172562357202.467568.4678514155829068407.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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

On Tue, 20 Aug 2024 14:26:54 +0200, Christophe Leroy wrote:
> VMAP stack added an emergency stack on powerpc/32 for when there is
> a stack overflow, but failed to add stack validation for that
> emergency stack. That validation is required for show stack.
> 
> Implement it.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Implement validation of emergency stack
      https://git.kernel.org/powerpc/c/dca5b1d69aea36ab559d9ca13729370007c60df1

cheers

