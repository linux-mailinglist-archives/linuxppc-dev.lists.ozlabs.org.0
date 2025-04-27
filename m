Return-Path: <linuxppc-dev+bounces-8063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F162A9E369
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 16:07:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlpL90gDJz2xQ5;
	Mon, 28 Apr 2025 00:07:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745762833;
	cv=none; b=GEugjKufZmanRBk6jTTygQ263F/9OOentgq7uPxnV7g2T4HMwZDajfNz4nF480mIaSr1MPw5cs4PxMbsB5KM/f9yFPjan93/PGWI926c9VGy1a7+Z3eUJRWWfGR87bbMa4mAXVC6R2I1CGYnleafhDeYNWhR6YwXa5cqrH7vJno/WxNxFh8Am3l9zgjntewL+rrpbNDB9RHpyHWAieDol4Rt7+5yG1yO1KTxIJHSeUTsb06UFszMmB17lOGyKgKBfcDqjrqr94E6pUZxZmMIR8Fuo6w4ru31/7e1wlx0NbCfovzjs2nMVlKGP0057uI8cmb9R1SaMNQTg4XT1BB7XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745762833; c=relaxed/relaxed;
	bh=bjaQCYAZZv7TZCyYcpymHM3x4tGRpcCplG+gYWSYS9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgOBCJKSr4AXHU5deDO7gH24hluPMA1sKw/PnUz7b00L1meh0RCoh2a8UmpjoK5AThpgmW+7yZqPbKQzg8kzQ+wCDlWpHAMjiPR5S6TA5YeTR5tm5GVhBBniPMRlNqA52KHKZTa01XQOp6aRyHU8rjPkPA184DiZd1ogMdwTmAQt2fSOD6rj3pOcPmqRYPtHuOgI+leWilkFn2BbQCe7B7Q31VD17d/YST0WJi1tcWvzhBMMQiiXg3ryCiLXqi0ze4tehdXGfBCR41FhWHyE9qeflx/Fc/4yt1DLzuuSI/U7ioycIxCaUB8eN62JbKh3/87WPk1A9FpjTpPc0phFcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Y5RhSc5/; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=Y5RhSc5/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlpL66gPGz2xKd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 00:07:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bjaQCYAZZv7TZCyYcpymHM3x4tGRpcCplG+gYWSYS9Y=; b=Y5RhSc5/FybI7zmz9SHjUsOJyt
	6y13MP9+31En+C9RdXh+jvvPfmcEs8+ugf/lrbM+EuMyfHqK2AbcS8TSq6nIW/o0J5hLQbnKW2dwO
	5PDPeGJ0dMiB+I1jO7FLhSzAAUHoGPP0xtZH8fUgS54mB21PslHj4y/wIynDPQmglvHJFPSzYGQUS
	e6SLa2lor/mFtkN8PODNuoz4j9cgiiqr6ML354CiGk2KNJSUINJ8HzdvV/YfmSH+b2/2lTMTZ+f9n
	8+V6BnpZAT4ZOKXfyim5oaRqg6ehnl6jo5JsXrJNniEO3jfXP0RfbAfbnaxToW16RVxQ/wE8t43b+
	zz+/7N0Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u92ev-001PEG-1R;
	Sun, 27 Apr 2025 22:07:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 22:07:05 +0800
Date: Sun, 27 Apr 2025 22:07:05 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org,
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [v2 PATCH 00/13] Architecture-optimized SHA-256 library API
Message-ID: <aA46Cfr7p6dMXwvU@gondor.apana.org.au>
References: <cover.1745734678.git.herbert@gondor.apana.org.au>
 <20250427123514.GA1161@quark>
 <aA4mAlozk3RvxvTe@gondor.apana.org.au>
 <20250427125641.GB1161@quark>
 <20250427131138.GC1161@quark>
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
In-Reply-To: <20250427131138.GC1161@quark>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Apr 27, 2025 at 06:11:38AM -0700, Eric Biggers wrote:
>
> By the way, as I mentioned in my cover letter:
> 
>     For now the SHA-256 library is well-covered by the crypto_shash
>     self-tests, but I plan to add a test for the library directly later.
> 
> But due to your gratuitous changes where crypto_shash is no longer built on top
> of the normal SHA-256 library API, that's no longer the case.
> 
> So while I do still plan to add a SHA-256 library test anyway, I don't see the
> reason for not also making crypto_shash just do the right thing.

OK at least this objection makes sense.

I'll add an additional sha256 shash implementation that wraps
around the lib/sha256 interface so we don't lose that testing
coverage.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

