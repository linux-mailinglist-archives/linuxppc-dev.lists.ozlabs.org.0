Return-Path: <linuxppc-dev+bounces-1121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D70F896F3DB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:58:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZWX5XgHz307y;
	Fri,  6 Sep 2024 21:58:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623928;
	cv=none; b=F/oUVVSRZWBRahClEJGfIXGzcwBbxltR5sv3PMm39PAH9oz4CAoCnBLtUSj8nzmuNY1LY3kx9AeXpB2RexHe06xejDGufaquwlrm6cX0AznDxwmJhsloXDKe/jAgOjCssyW+q1Yh0sFtu+tUfUrLzo+ccTACXEQQ2hMb2jv1OSMtTIelWA3krxI3eeIq6MPMnheI8b/PoY0433J2ecxDGWaL0jNmwNk05PzqerbGox9CHKxWN20vdOkABbkk9iroaDYFoYhok857F0LpS+uOBDpzstdZayHroNWAj18o/CERh/U5p4YD2cxTVL6c0QCnn62TMP9HXKivv4r4VTjYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623928; c=relaxed/relaxed;
	bh=cldesPwGA3cZ3Mnb0PpJcexZU9oMOQA4ghaP4EakUWc=;
	h=DKIM-Signature:From:To:In-Reply-To:References:Subject:Message-Id:
	 Date:MIME-Version:Content-Type; b=jsML2kyvgXKrjy1FTkrJ0aJw5QFIZQPu5Htj047U6p7YfM457npLQa7maEIcmXPpyZJMqB++c/Eui3DW22s/hcKjd8UdjIsscTmzCksZJJHkcCf7j7RaLhkRExdBjrhrZICmQZdUPCmRLsLn7LOs2KucJ9NHP6u1pyPgaBlS49RIyL5HJeoo+WiAZQwfaj8B2e8a7L8wWMN8j09PhOTYg6Oaxb6yaW0jnp1/QS+YAod3UmQ4QpaBp67X0LPs20Ml6ROSd3BG9+iHtw5PV6otBKHkxDcGCAs6lSFwc9W/UiZcn3lgvrns+9gu7lDeJBt9aDou2reqZ36sFvu4hkKxFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=P/6kSFOx; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=P/6kSFOx;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZWX5BVMz307f
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:58:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623928;
	bh=cldesPwGA3cZ3Mnb0PpJcexZU9oMOQA4ghaP4EakUWc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=P/6kSFOxg8uOxdsmJiaEGAZdb8+7xUaZaff7jG8LaOCfEShMfx61tEPKXmGKT+sJv
	 CSoz+p1ARNsn0FExzPC27np14MKQvqyDxJOoMVgIeKw1ag6BHz3fMIuRYAG8BfP0Gt
	 HhMOTL5Va2sAxdz6ns2Gpe81rWuAgmdgIOK+KfZ3D942BmR3/zV5K/lxDr4hVzuB1E
	 h+vheTexdhgX235LsYLkZC4MuvONyZaGhmE6LYsVYKx/RmKqvMXERolo7xU4vDKNww
	 Vg3NRmzZOf+CdSsjyDDtAt82yz6Bb5stZm793QW0TqN9A39iDGqLwFwlOLjBt2+kyB
	 PGUkOndvlm+Ig==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZWX48DNz4wy9;
	Fri,  6 Sep 2024 21:58:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, alexs@kernel.org
In-Reply-To: <20240816093313.327268-1-alexs@kernel.org>
References: <20240816093313.327268-1-alexs@kernel.org>
Subject: Re: [PATCH] KVM: PPC: remove unused varible
Message-Id: <172562385033.469466.5795969470712332228.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:57:30 +1000
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

On Fri, 16 Aug 2024 17:33:12 +0800, alexs@kernel.org wrote:
> During build testing, we found a error:
> /arch/powerpc/kvm/book3s_hv.c:4052:17: error: variable 'loops' set but not used [-Werror,-Wunused-but-set-variable]
>                 unsigned long loops = 0;
> 1 error generated.
> 
> Remove the unused variable could fix this.
> 
> [...]

Applied to powerpc/topic/ppc-kvm.

[1/1] KVM: PPC: remove unused varible
      https://git.kernel.org/powerpc/c/46765aaec4d78b9fef59e647ab228283991de075

cheers

