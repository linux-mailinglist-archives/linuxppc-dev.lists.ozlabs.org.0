Return-Path: <linuxppc-dev+bounces-8031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D99CAA9DE35
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 03:06:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlT1p3dnDz2yj1;
	Sun, 27 Apr 2025 11:06:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745716014;
	cv=none; b=CyZEFsebWZY1ZZEpiby6c9+eGvmohuxtnXQ/YA2Kl36UafuKIauohgoC0scgDr5lERVBfTZusiHCid6/j07OShj+CieIPYHjVuYnDekGl3sxCscn6h57a/8dIn8yOHKvR0Cp6g8QPSee+sfxswO2MA7EYqtrWw/QLfpFQjU6wUzWnZ4VFw+TAtY9IGcrJQyyEO9iE2SOSq2hQoSCU5SCKINyAHk/Pz52hB9x+zZxSN+iB1G71fsFJ3DNpHpTrQDzjVaBhC+zp3+CNerHIP8gsjWSfwIweslr7f1U0IRcqlKbm5zSYWDgJ1pwr99naYzUbIq7dMhz0t1AggleTD+cHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745716014; c=relaxed/relaxed;
	bh=jYBIW8eL1CHTTgYqVhOJdPq6bgjz5FSbg7i5wPZVhNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=XfiquRXUFS57v2uARwD8zfcIcZN4xsX9Xtyi6JqzgPA4e+RQeNDF4LL5nUttWCIE+9W8bgPECmAwq5iZE0bEkq9W1TwOqHHLy5joYw9dZeqJjEiDeOinpdF6sjwUQvdFcc4r7k7wNYmiZZAcSQ4eVBjbdZnL+UMd7J2APB6tBlYLJ1ezsTsKywgdh+MqDfWOmc4LJuzW899dPwgrxXzBgBQ5mMc+/orValgl9Tqvi9P28vA0aJMb0beX25Z7ovAKd+Py5I3AGpWlafIhsyLwznaKnZrZrITR4RPz1GB6uxxqmvveKqyoEhlrxHrGQYbsVXeBoStpg1LatSXNoDQglw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=ZBrOvF8Q; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=ZBrOvF8Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlT1n4t6Hz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 11:06:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jYBIW8eL1CHTTgYqVhOJdPq6bgjz5FSbg7i5wPZVhNg=; b=ZBrOvF8Qo8J4cuQs3xdMmfCOmr
	a75wN5BWC+Ggi02u2OkOXrfsQ9WcEbBmShuNkPBIwY5k8gKcO64kwqMOWu5SPYtCvTaxpGgh1merV
	okY/E4Dc3UjeuouK5DAuujPEUKJfgmyff4qyX0PDfV+qHY82qO5T9bV8EaMigXon62TNK2EShmvTo
	ycU37GIkPwCW2lxYAvbAPFbfWsCtQGn/1V5XhZLm7Uc2ZJ/D0WP+sndPm7ZWFW45zCDDyvSMrD663
	EmNxoqe0ba9PaADtu/SUu+jI7XAmTYVSPafPQOTMCQhhe/7wTYd2mJVuiomGfs3Ucf7Lp5k0I/HvN
	DyF1yCTQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8qTr-001JP9-0H;
	Sun, 27 Apr 2025 09:06:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 09:06:51 +0800
Date: Sun, 27 Apr 2025 09:06:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 01/13] crypto: sha256 - support arch-optimized lib and
 expose through shash
Message-ID: <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
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
In-Reply-To: <20250426065041.1551914-2-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi,apana.lists.os.linux.kernel
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
>
> +static int crypto_sha256_update_arch(struct shash_desc *desc, const u8 *data,
> +                                    unsigned int len)
> +{
> +       sha256_update(shash_desc_ctx(desc), data, len);
> +       return 0;
> +}

Please use the block functions directly in the shash implementation.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

