Return-Path: <linuxppc-dev+bounces-7776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3FAA930CB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:28:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0bm23wJz2ylr;
	Fri, 18 Apr 2025 13:28:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744946932;
	cv=none; b=P59J0OyLq5LX3Jna/9Ql3rPHpe7cnUF5jcj7xJx3Dox36LmAd+Ur13VQadounBySEPeE8Klrgvx2raZ8zlsQDtDLKEk2Z+LIUYF5YFyHlXwkcMpA7x/jyPafbxgN3X6JUgiZLwp5bUYV/NgFw2PeErh+ilsxAQWBh7cfEkQVCX6G2QzhPJs696NRAplZKv+BO6hjN1qbTDws731g+guwOA7vWfuqEdWxolOSgnVCO5QDYzT4FbmpiX6OrXmwBCfm1JESqsBrJLBrHTciKUAbVNViXJJd6ySMSV4yUwBeo5cHY3+si2BA7FI4SAd2bvM8P8z6tkdpqrh8Ygwk1nzp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744946932; c=relaxed/relaxed;
	bh=ZDZz8zS561FtX+iixxPJldXseasTt9hoE3qXWPq515U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENsqy8nVS7Q13/sfiCnGWKqPt0SB9vfU5Cg9fiQvbWr1Fcjda9tfkNQKOjo+N5t16bWVH7a6lXBjNNbY5M9RQr8wPkuHlmeQep28S8IdzbjiMkDJrIKkdl2k/TH+W9KiPDDUGqH9ttCUXV++Jh7tY2FCkZXBSnGOgnq7IzSwEI0L9fLTEve3qlnqGJjtT23j5TG78aDPeYASo8j56KducaoubM3WIiLQAGJ9fmS7gK0XlKclRDHiCAGl7RyFjUV2yzmFPO5ywnxS6/WhB2Kmg7MJCF0HCBVy4n2wfFJuU6nm4QeOGvnYCjjhy5NfiyCpTmF893OfTi1QJmAj6rKRGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S90kDL67; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S90kDL67;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0bl1PFlz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:28:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD564A4B1AE;
	Fri, 18 Apr 2025 03:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CD9C4CEE2;
	Fri, 18 Apr 2025 03:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744946927;
	bh=paa/9NZKZKpdwfQILoGguW2nvATTkdoCMaZ8TYAofx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S90kDL67H31uSpEv4ZrQD4HD18zmryec0gLnj6+7QnaMN47KnnOiTpqryL9vUNJ0A
	 OOlF1S+mKh49+xCZJuOOZXg0mYOqjU0Q39rMBTaO7x4ZZ6rpyfpPUNEX8HBVkfOsLD
	 EY0RfFI9paylTf22uMjv+BqRmKRkmXOwmB9ECQuP3FNHB5Wy7t4nZwSuepETOw2lRW
	 Qz6m6UZdgJj7wiKuWat9qhSWie5OoLWjIimkGMx6zHjaxZh+mzrUBzik42/Ul41jJB
	 R4/dQdFwKtEZseJeVkLQbr6lQOpHAW5m/VQwglLYHWTuPTm5l0lXEg+EXy1tPH0mfa
	 VY0mvYrHgNZ8g==
Date: Thu, 17 Apr 2025 20:28:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <20250418032845.GA38960@quark.localdomain>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
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
In-Reply-To: <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Apr 18, 2025 at 11:08:16AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> > index 25ed6f1a7c7a..86fcce738887 100644
> > --- a/arch/arm/Kconfig
> > +++ b/arch/arm/Kconfig
> > @@ -1753,5 +1753,7 @@ config ARCH_HIBERNATION_POSSIBLE
> >        bool
> >        depends on MMU
> >        default y if ARCH_SUSPEND_POSSIBLE
> > 
> > endmenu
> > +
> > +source "arch/arm/crypto/Kconfig"
> 
> ...
> 
> > diff --git a/crypto/Kconfig b/crypto/Kconfig
> > index 9322e42e562d..cad71f32e1e3 100644
> > --- a/crypto/Kconfig
> > +++ b/crypto/Kconfig
> > @@ -1424,13 +1424,10 @@ endmenu
> > 
> > config CRYPTO_HASH_INFO
> >        bool
> > 
> > if !KMSAN # avoid false positives from assembly
> > -if ARM
> > -source "arch/arm/crypto/Kconfig"
> > -endif
> 
> So this removes the KMSAN check.  Is it still needed or not?
> 

Only x86 and s390 support KMSAN.

- Eric

