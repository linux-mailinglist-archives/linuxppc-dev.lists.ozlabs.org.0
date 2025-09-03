Return-Path: <linuxppc-dev+bounces-11648-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FD0B41236
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 04:13:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGmP137zwz2xlM;
	Wed,  3 Sep 2025 12:13:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756865605;
	cv=none; b=ia4kHfxg+iUnpO+Mu4kq6j5zOeA0NkCgi0Ovj4Q6y/4urQ9uIGyXuE2BoT5xxqu2UDvEcQkw1krwZue8pHnN4YyTfuYFe8RsRVm9AJnps0zGh0YZFtYeYrFRkvGu3aemLxmq996faFgxETp9nxwqMBkave+LLLMkchAGbDvqfe5onUydEIODtPM7+d5PnVfToNkNvsO0wtnPMF7LpanT4m7G5BkYpWDD9gNf4MsoLOva0G3tK/ZX+vHzKVWMcnWnCNnpCZ3Gg3KRuMnrBJbID9u1GcZTF9mMpZpS8l9O6Vq2vF69Gx9yTm+WqIwjqBrkQXAqbMsCf8LDYwlsZloMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756865605; c=relaxed/relaxed;
	bh=xTPwfw9HNw2Tf9e1a6QTCMUKDo0XtNL9djjLt4Lq5H4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKo+OftA3hfqJpJmZUEHfo+Z+wtHq8Z4HOaEzZYUsPu0HHJUypXDtfvJm7TwKkuDJyNmIZ59RUe8byUJ1z9LzczbtD6TBb+xiSnpoyHKeVJ9ZTd0bxnVuqWbQNWqIYIgFhPatM7egpUn9ahRb8kXxytF6TSm0MdOv8IVGkzOXhzqnBUU2QO8DRwIghGSC4bLHowwp+Ma9frE2cpTn5fVDlJcqZ5Kq5ciUMFCNtsT+d8USeVb0hLxxtZTedqFS4i0H+jqgMdoGGfZ/xUp9FhJffrRSXSuryH4Dm0kJBkKUdqCT/q6IH+/lVrj9DvuNilgFrPX8ugMOHYifrYbI/g92g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I2T/DDg4; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I2T/DDg4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGmP03VG2z2xgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 12:13:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 35FFE44811;
	Wed,  3 Sep 2025 02:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB390C4CEED;
	Wed,  3 Sep 2025 02:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756865602;
	bh=zyVMQLH4t1KwmbWNdntt9uhUCwn5poLa8UFhIZx/Pnk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2T/DDg4H3W2Qnd6UfRqBJJq2wFkaiwudQpczhYMpOVzwyf/KBVJzBWYVfqVM0ENk
	 qYR1qUloo7QHSld2UKIRIHi/cCLrO+IySgGM91h1lq7OkDzS++ShWlr52g3PgnfyH+
	 670IUhCaWtoae06dTZyRo7eeWbzqdGefKEnFg810WEtMJ1b52l2yDPQ4Y29ToCCd8N
	 GWIWqlda9QeWhbEv8qUYwwAcB27bvNB7TBS/8plpKYrOoOZX5aPxm2zMSrbth+0iAW
	 CJdwgsG3L9Syy83WtDqLRnus2h9Fmo1OdWQY3gYYTgiPen6zgsMJuB8VSuHPz9Zs/T
	 dnc6RMZ9+DXeg==
Date: Tue, 2 Sep 2025 19:12:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/6] lib/crypto: curve25519: Consolidate into single
 module
Message-ID: <20250903021211.GA6491@sol>
References: <20250901201815.594177-1-ebiggers@kernel.org>
 <20250901201815.594177-6-ebiggers@kernel.org>
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
In-Reply-To: <20250901201815.594177-6-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 01, 2025 at 01:18:14PM -0700, Eric Biggers wrote:
> diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
> index 7e4e66f30a7a6..c0f3b64489dd6 100644
> --- a/lib/crypto/tests/Kconfig
> +++ b/lib/crypto/tests/Kconfig
> @@ -11,13 +11,14 @@ config CRYPTO_LIB_BLAKE2S_KUNIT_TEST
>  	  KUnit tests for the BLAKE2s cryptographic hash function.
>  
>  config CRYPTO_LIB_CURVE25519_KUNIT_TEST
>  	tristate "KUnit tests for Curve25519" if !KUNIT_ALL_TESTS
>  	depends on KUNIT
> -	default KUNIT_ALL_TESTS
> +	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
>  	select CRYPTO_LIB_BENCHMARK_VISIBLE
>  	select CRYPTO_LIB_CURVE25519
> +	select CRYPTO_LIB_CURVE25519_GENERIC
>  	help
>  	  KUnit tests for Curve25519.

Small correction above: adding 'select CRYPTO_LIB_CURVE25519_GENERIC'
is unnecessary here.

- Eric

