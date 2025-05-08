Return-Path: <linuxppc-dev+bounces-8452-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25711AB0226
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 20:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ztg7g4htRz3bNt;
	Fri,  9 May 2025 04:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746727615;
	cv=none; b=eo0y91dKgDDqm3l7jzMbjn4jpJtuuC+5il8N/r/8vcXktQ6GXY4ARk07ywb/5TVtQPaV8KGc0VGAR7R9uGx1t8N+s8eu3ftrRKv+Z16Oxg9dC8f4FgtVcxmK5HxKrttHmW1v15z9rlmra87mYL/PrEACmQODDbLg2zXWL3+fxCuC5sRBnRb+PoPtChtD+sc8xJDBATYXg3ID3Y5S7ALy6BkNzflCbN7qDWZOd9U7SMkkjngTlp+Yoj9HAUuOaSJaDtZY7YGmO9+XogepQqTOGrdpAvVMltIWT5hDqOnC9JF5L+lth2opPT4430YPAXIcEtYG8lSHPwrPRrLPzIZcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746727615; c=relaxed/relaxed;
	bh=jxTFmNOX3bSQwoSwj3xy6KKdXMm3LG/6UFBryfdpRHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmZl9IEeZofFWB7WCFqg7vNP73a8i5kqV9BG43pCnRM/5/kq3BSYUm/WhxtA2QWBa5a5JX+nCzlcd8/QfQuaF29kDMGALtIHb5EmqdQUtkbdbbgQvSgAaNisz1WGEmjKPg1kTbhK8JyMFira2XeOyGasRGEurdty7TNAd+tJiCiKvov9XVaPsSfJGoBOKXXWWAPCxHy/b2u4AElNl5Bn/iYbbFsGITA+j8v7BOD/0dekVz1S6iqiPbsOY63vIphqWnYp+u4bg4kZbBThJ1QhfPSXYzevsCCPl5kC9JoyXGUmCaqUGrI9ruhCaYsC9I6hoQW4WcGZPJ33bxLI/1aCXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z6qe3Xtz; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z6qe3Xtz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ztg7f3y80z307K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 04:06:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0432C4A1DF;
	Thu,  8 May 2025 18:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4981EC4CEE7;
	Thu,  8 May 2025 18:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746727611;
	bh=T3fd8i3e9m2qTXLSzLMLI6WreQFWFZts5ieUhzAtv50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6qe3XtzC0dgxeaQP4aahmUFX24uY2iZ3t2sb6neITe69z8y/KsV14e0Un9m1jGK2
	 /tEnt3sdoHSmcStSrNJVclL2CaRyAjciHa73CCjMdKHpFD9blJNdWaOeeI77jtdubT
	 DjtKSPu29fda7idtTVch/6nzYVK1BqOW14ORfPccTGLKQkDdqmisXANhvptuC0tB9O
	 TerEWeAPM8x2xKoI4x/n0y4Zk27bbk+n6O4fipuNoakdGt6dvd4xUAiMHt3nza9IMh
	 HApWd5IFoifI1COGvPPwFJuVoSUh2d1oXeBxiuf/SD+xDmuqoXrGs3cG3w0fU5dfXY
	 FVGqTmzoMkKbQ==
Date: Thu, 8 May 2025 18:06:49 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>, Jason@zx2c4.com,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 07/13] crypto: riscv/sha256 - implement library
 instead of shash
Message-ID: <20250508180649.GA570496@google.com>
References: <20250428170040.423825-8-ebiggers@kernel.org>
 <mhng-0b1a0c43-eff8-4ea0-9aaa-46727504555c@palmer-ri-x1c9a>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mhng-0b1a0c43-eff8-4ea0-9aaa-46727504555c@palmer-ri-x1c9a>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 08, 2025 at 10:45:39AM -0700, Palmer Dabbelt wrote:
> 
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> I assume you want to keep these all together somewhere, so I'm going to 
> drop it from the RISC-V patchwork.

Thanks!  Yes, this series was already applied to "cryptodev"
(https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/log/).

- Eric

