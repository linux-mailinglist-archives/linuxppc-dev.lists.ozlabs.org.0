Return-Path: <linuxppc-dev+bounces-7777-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C6A930D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:32:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0hC365gz2xqD;
	Fri, 18 Apr 2025 13:32:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744947163;
	cv=none; b=b85QSPxOGJ/S2nNo8+pBTqS9HIKDwAi+6giPtuz+2PxsZtIydvUEhPpMY8Nv4UvJ7gfGfWBhrm9R6fwb9HP+o5a3asyGqNhEjH7blyfN4iY/Si+KmuSXpeWblZsqKSYbbadVAjyorFBfyLdJAxhpCG4pUTo8s9fKLbYM+mmipkq6JF4fs/eHULoWUGNtj6DC7YSPAsuHn6xLWPuKmS0shuTQX+J+spDGbTavwYwdBOXQgjEbmN4Vaxah4rUN9t3CNLb/UWFwKVHQi+WCTOlOyIDqgBZpJ1xwRy4A2Oc4tlrJIRUk6YDzlDqMn5I1kdUdPv8xcbWqGok5O4cm0aLVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744947163; c=relaxed/relaxed;
	bh=Am3qSE+37xleqfIGr3FojtYrzlwSKp8ZLDqwhi0VPgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ER8604uQPWvPOuGIkcGgPgVimY6fFu1KzXmmJVwyB08GKacOhDvRn7e5ticPgSoaGd4FXQz6xtZyicwSwYlC/4M88DDJMDKdXSzdSR3VZSwoJ7T/kmEbuLb28XZfMiVau3aUQ8/L3h/ekhtxWxxjHcXXTG0GaojQRpztfvykTmFBxZJ8QxbHtTU5RuYbzZvfI17/Fx0HIdMQTm7eE0e1ZgyW9n6/SgAG4GUvQQlahPIqSfceqbfcepi2GGD6ZgZJoAISU3CahR2pyqDLpvkovkfnnuaolj6X6BAtajkylnQ8y46eUbXvtX2WXECxrW33CP2M43Fsk6Rd48CCeVSeQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sr2SG5z+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sr2SG5z+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0hB5sfXz2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:32:42 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04B764A233;
	Fri, 18 Apr 2025 03:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A07C4CEE2;
	Fri, 18 Apr 2025 03:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744947160;
	bh=pKH0iMn/ElSIBHsAfOGxNhjlTOJh60B8ZyUUd2TvSWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sr2SG5z+VUuYx9tif00YQ4lXNJDQnAwS2cDvkeWHH+1dDjsS2xsJGAVflXA6/ugx0
	 YsreR8YIfO9pbQUnd5xqyIK7iDfa6mm8d+b64w67ZiyskrV9BSY5w4eNuG1gIe8aMh
	 /VnOIjxNG2ruThkQpwZSfy/nhIHEMmCw9JPPO7DDUnVyMHs6LCgq7j1FqX+Rh9kZ7N
	 4GyosOjpiwdAVR0Xk/3odPnwV33kADLe1BLf6Cpyx7vL4VB4V9XETfCPvYX5JoGdKg
	 HqxC1RDd1RT1ZgzvfoMCxVk+o5IqKy8Sd7rwMaeTae0bDMeANN2hLnouvr+ZWcbtXB
	 8c/XrREVJrfjg==
Date: Thu, 17 Apr 2025 20:32:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418033236.GB38960@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
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
In-Reply-To: <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 11:12:33AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > config CRYPTO_CURVE25519_NEON
> >        tristate
> > -       depends on KERNEL_MODE_NEON
> > +       depends on CRYPTO && KERNEL_MODE_NEON
> 
> Rather than adding CRYPTO to each symbol, how about grouping all
> the CRYPTO symbols together under one if statement?

I don't think that would be better.  The 'if' would be up to 400 lines long, and
it would be easy for people to miss the context when editing the file.

- Eric

