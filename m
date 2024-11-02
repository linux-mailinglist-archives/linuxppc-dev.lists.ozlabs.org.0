Return-Path: <linuxppc-dev+bounces-2767-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6379B9E5E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2024 10:45:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XgXsl0VF5z2yFK;
	Sat,  2 Nov 2024 20:45:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730540747;
	cv=none; b=TPqV9JZkV51SLUn2cNFxB/BTXTc+aG6jFU9AN6kiZr0hRXaMwE+e8woI7JA1ZSSEyS43CAEvkcoc/unsdH20ZgFd3sZXF++W+oAXx7NCQzGLuntgCA57RWAga5jaftc0iXNpnb37HquZUorSsCsoa43tJ6FFj8pEmAKyiSaChWBTUYFF5xI54HJ5KOlRfnqEUB3Ce6RDSZIklGA02nLFJHW+lvzH0uGIXF5FBw/B5lX9Ed00rDAidHt+pjijF1ZPR8bNrcmKSZo1/Y7239+SJB3go5WmIzPDKOSp8FSh8+GOHGrh33PfTVzPlUMVd8rhWmeu6b3lvdRuOpuVK8208A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730540747; c=relaxed/relaxed;
	bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oXj3W2hJyIL1BwUeaTOoykjwx0Nu2LzRyBqPb7EXuRlL8lCKp9Xgs6U4o7MV+wNMjfU/2vQiMFx99+gTJQ44BFg6h6GtIJTbqyUanX7uxcIUGdFrWI/Ov18AP9RegyXHhB7qIlivqmQrAZ6Vb7KwMQqyeU48Z7yY5hQ5Jp1m19BoBoKYcKJpaIGZirP+VnyY17Elxp0T3eiWNj5OnrCZUHE/94H6uf6e5fPWz9Bl6PHdTv72+IMgeDbazba1I947sAlGMwySDLbAKTh68u3/v9N0Y0/8Y8LiNZHeWsgUuKU2EJk5UDR0uv2cyn8JArgSPNfsOjcVQGTS23WXP4hS8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Q5Mjntzp; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Q5Mjntzp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgXsh2Q56z2xy6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 20:45:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jpcaovD1uzHZkdDMg5tZvb0Z9OfX74OLNrLMh/vslrg=; b=Q5MjntzpHzBvczROcNsYoj+25t
	CTplAOz4OXNjmKbeHRPSkC2PF8/2CQ+S9+BpzdDOraNgbvJHl1b2XbDV1IX3zldrAMVgbCnIPBjj6
	0IWTAu3B1HtaRzbcItOeEI76Vhr65Zdrv6Hj7PnTJ9akLQTMtM7LE6EHbcKkj/xmU2QzOxWp4th0u
	J1y5NQ3M1+7fbEZEPyWTXBC1K0HGtCKB8/SuT1fdvssCL8+XduxOZjD+6GgoigCaoEwTAJWXor6+8
	4zJNFOI8kfLHoCcjY0lPk4C6G5wnEcy3WATqplhANsESpNXFLLJLZUN4OEO8S1bcBapdvZR08K4kj
	Lwh8InsQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t7AhE-00Dxdz-0Y;
	Sat, 02 Nov 2024 17:45:29 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 02 Nov 2024 17:45:28 +0800
Date: Sat, 2 Nov 2024 17:45:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: ardb@kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
Message-ID: <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
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
In-Reply-To: <20241026040958.GA34351@sol.localdomain>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel,apana.lists.os.linux.scsi
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
>
> While testing this patchset I notice that none of the crypto API drivers for
> crc32 or crc32c even need to be loaded on my system anymore, as everything on my
> system that uses those algorithms (such as ext4) just uses the library APIs now.
> That makes the "check /proc/crypto" trick stop working anyway.

What's stopping us from removing them altogether?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

