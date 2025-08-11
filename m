Return-Path: <linuxppc-dev+bounces-10819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB349B213CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 20:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c12Wb1HSYz3cmw;
	Tue, 12 Aug 2025 04:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754935291;
	cv=none; b=FEYdfhfnbopChizdmbE2xUjrZveOA4LJ5+vfJN3u5lycUy6QvZuBK8zR7Bq2D7Ce4e+Y9StBy4q9iGxjBlguUVpKVBbwr55fIIf0DyYOlLPxsBWfTEFXOBXHDE5etqK5eOuJzzHhHN/58h0BYjqIXP6pe9e7urusOQduUo8iqbLraUPrQlh0Ur9p6Pa2VPSfXTbubmokAAmuhmVJrr/cg6jPd/Wlvg1e0GaoFyYRfdHOxswiy/eZ4WCpewllFfuOwh+Oco5iXJWJpZDxxlvYV++wno+biqknTpN4D1jblrQxYmRXlflue7a0KVwfqS2n324xFrsow6VBiFZySbeZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754935291; c=relaxed/relaxed;
	bh=Utp41nigf8qwg3TGCeD7rU7db4o6+GuWmMBaFCTtmoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mxaj2fSbLVQCoiOqItC4pMVULcZ7f9Pc38ynXIy4MLVkH9tDAX8ha+gi4ebR9AJZEw8HiR1ZZzBYBalikKhgXP+DqUazlHslXSBKtbBbSwzLm+NKHRR1sOiIFinzmNx3YZLxhzS1KWHM3VJLCUJ3wX2MI8SkArHA+gHzUGSs7W/NOB0508Ul2A/b/rEU7qYCrTJIgLlsugJ4l1rjpOcOORnk5fA2oKVeeV2mzuV/ylDSn4RepekcSOYJS3hYTF5p7dig1IKJ+Wg602CmianCjpLiYNlgHFzJ4fKmLqM2+V5ou/XlOmOvXui15LEcGf5f/nF73v+wVyt4JRk/dMjMMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X5EXUN2p; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=X5EXUN2p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c12WZ4fB2z3cmg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 04:01:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 96663601FA;
	Mon, 11 Aug 2025 18:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A15AC4CEED;
	Mon, 11 Aug 2025 18:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754935288;
	bh=oaStqyeej7yqSzgI8HKKqj00CWEPmn5WsFskP+XUK+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X5EXUN2pGcp6CPXoxCDazABPuA3K/Ss0elSgvoV3BfFwp7d5jrU5QSyxDUELmOMd2
	 sM4EMfjt4Zp80NM2W42zzXwNk38urPB/VDMqcB99ruw2QxEIbE/jt9IAHtqC9Y84Rh
	 6MEfDvxGuyyB8BbiiRsZBcdtxQkMZnyFQl/XLxG56uNmacJ7XAeKWk76tzsp/j0PUl
	 PYb5DK6m3mxfYIAjxvof4AFHKCQ0Bf/ULogD17GOdSH64J65XFTdvKKiG2IUr1XE5l
	 VUozKpvR83OAufVEPGOiRtZxoMi2WQQrV3lVogX3uzxXDfbhqBKBfe9L88ohsPpeQ3
	 CC+YdkmSomrYQ==
Date: Mon, 11 Aug 2025 11:00:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 0/7] MD5 library functions
Message-ID: <20250811180026.GG1268@sol>
References: <20250805222855.10362-1-ebiggers@kernel.org>
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
In-Reply-To: <20250805222855.10362-1-ebiggers@kernel.org>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 03:28:48PM -0700, Eric Biggers wrote:
> This series is targeting libcrypto-next and can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git md5-lib-v2
> 
> This series introduces a library API for MD5 and HMAC-MD5 and
> reimplements the crypto_shash "md5" and "hmac(md5)" on top of it.
> 
> The library API will also be usable directly by various in-kernel users
> that are stuck with MD5 due to having to implement legacy protocols.
> 
> This should again look quite boring and familiar, as it mirrors the
> SHA-1 and SHA-2 changes closely.
> 
> Changed in v2:
>   - Kept the architecture-optimized MD5 code, since unfortunately there
>     were objections to removing it.
> 
> Eric Biggers (7):
>   lib/crypto: md5: Add MD5 and HMAC-MD5 library functions
>   lib/crypto: mips/md5: Migrate optimized code into library
>   mips: cavium-octeon: Move octeon-crypto.c into parent dir
>   lib/crypto: powerpc/md5: Migrate optimized code into library
>   lib/crypto: sparc/md5: Migrate optimized code into library
>   crypto: md5 - Wrap library and add HMAC support
>   lib/crypto: tests: Add KUnit tests for MD5 and HMAC-MD5

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

Reviews and acks still greatly appreciated, of course!

- Eric

