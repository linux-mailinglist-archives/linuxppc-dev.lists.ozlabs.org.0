Return-Path: <linuxppc-dev+bounces-11845-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9494DB4784F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Sep 2025 01:30:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cK8bd37Syz3ccS;
	Sun,  7 Sep 2025 09:30:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757201453;
	cv=none; b=T4XtqqYZuidiPbk8dtnPw93swtJlwz0eEgeFNyP2jfyIdJ7QaKfvcl9K0JiEdsLNEvsXWXsrMv0dF9nv/GwGjZMY6dsNvhLQHBwJC4tH6kZ+5RTEHeMHtwlYYDT4H6jNcW0wLuQ+mwPD8cZMso3/NQeHRxjo3Us6p2Ab86+3odpMXiBzyuqhj3NsoSZ9jp2BFybcytRx5C4of467ElxyQrGkEO21dsd+ECCReTMw47eZ0OAJKZe43+st5Whcw56y2A9R4Ka2olcv0vgsJvaCOJfpwLkzz+GOY6X+/eXrrCCh+M+NXJJfE/R05qrb6reiw4KV3262+mw2r5JsLnIGYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757201453; c=relaxed/relaxed;
	bh=708BMybgUVX8T0kzkl/T8rQ5M+KnoydnWW00G5kbvEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o38PCEDo/A3Ai0HXzuqJVBBT9HhGEz9VQ/6xyuPPryEATy0e30RhmH3Cmlg4AtofX9bhDUkwqpKO/McLuuTZFJM0nlFwYoWgOg3rLoGVezq6afpYQUqucdj600q7axXNoRg9e7Dg+D3+aDY7Lr1D7S9jM2vZyEJcgx1Bs609wE9blEeqso5BwPY1CMWcYouNGqCONWIr7yxkuCtrdH+yoaDCBeukcKtIJp7SwtuUQ0444Z8jSZpbNBLUA4j860K8PzMXlj0ysJ3vvhM34si9dyHY6LRgzAzYxs0LIhq2bOGPlNPd7DirhWkLqOba/c1RVuHR8OmPO6LTotQsWCYA1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LxUu0HkE; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LxUu0HkE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cK8bc5BX0z3cc0
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Sep 2025 09:30:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E19D940753;
	Sat,  6 Sep 2025 23:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413B8C4CEE7;
	Sat,  6 Sep 2025 23:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757201450;
	bh=q1iTThsw7oKpa0zcQPp1lbL8O39eXWUFrfG8Gq7JLkI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxUu0HkE0H8avOiTvooj1Fk/dhVtoRl4Q5BJPmUo6coiGIpXS6RA++E+vyWuiIjI4
	 L55/6QXlwlNPzafdqyJ7tTIlwAZHQU9PqiixX04vyP+5hWCqout9j2LZcphH4BEd86
	 TTdRhs/xeUGOQwpo0GLSjDHlAVShMWNfYe3jVuYYCmc/CRAFmNrM3XcyxISCAO2Pih
	 sFMnCpATcCPr87LzBvkVjd/LUfa5YnRCPpFck68LgJ0JppDpzCBzAsTe5yGmovA8rY
	 pYFEJyDkwNb30v/YpGdYH68O+7CHyW/L+o7wqjjevHsIhEbzCLyZ5fQ3T+PFCIQKwN
	 bJMqX/vv6aTVQ==
Date: Sat, 6 Sep 2025 16:30:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 07/12] lib/crypto: tests: Migrate Curve25519 self-test
 to KUnit
Message-ID: <20250906233048.GA109599@quark>
References: <20250906213523.84915-1-ebiggers@kernel.org>
 <20250906213523.84915-8-ebiggers@kernel.org>
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
In-Reply-To: <20250906213523.84915-8-ebiggers@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 06, 2025 at 02:35:18PM -0700, Eric Biggers wrote:
> +static struct kunit_case curve25519_test_cases[] = {
> +	KUNIT_CASE(test_curve25519),
> +	KUNIT_CASE(test_curve25519_basepoint),
> +	{},
> +};
> +
> +static struct kunit_suite curve25519_test_suite = {
> +	.name = "curve25519",
> +	.test_cases = curve25519_test_cases,
> +};
> +kunit_test_suite(curve25519_test_suite);

Correction: there should be a module description and license here.

MODULE_DESCRIPTION("KUnit tests and benchmark for Curve25519");
MODULE_LICENSE("GPL");

- Eric

