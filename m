Return-Path: <linuxppc-dev+bounces-8035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5539FA9DE7F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 03:52:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlV2n1S3mz2ynf;
	Sun, 27 Apr 2025 11:52:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745718769;
	cv=none; b=HrZAzX1X2AEKucFiAL4lO1N6dg1ZROTX0kvB+esI2HLgaat+fglI4Uev0rMGTQ8QztD/K1fubR1bi4MA1JXmVPovQaVMdj/aiPMkvXR2iK2BIlnyED8nU6wkRWGiNFEAqTtwLilgkg5qBjdWl7DfKa60gMjeYPaBZoczX997gY+opKBZWaImL44+Qjw4pNCXHiasCPT4Kup9OdhHuRIzQrI2XfdEBC7wK40DYkBc8Q0iiSC+MleLb/Usy2WCWAqu9yRXW92D5YqTa7orRfJ8K4FMo/NbnWllxITqaJ7Z/5khwWtswCDkByov+25LsEt3vTuPO8aGnB52sJnxK0oGbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745718769; c=relaxed/relaxed;
	bh=Zwo3jEIV5k/S6BSvnMP3awGiGO3YuYSgcBWh6GzkBJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hS7ka80hwJbMx2ndQXKMsUK+HxyGDKYURZrrLI45X3lggrOrJ8gzLta4gmMedggpXrBSmtbcDaFCK+F5YYuBPARsQ+ekZJ++75SgdAga+1aJO3uquqgQWiC85FFlJnkpcQO5YSlgsNbf0kePkCA5QoB72DFkECRGbcpyBGGWmiu5bsuePyTL1HsPrP/MmO+0foV95A3Qtje7erep8zd2hxqN77QPQC2amu+UWflDOznv82RNDMI4gnVbIabcd8d4bjU1xylU9WgX2q2/ITLddSuu5rQcwH/nLQzb/FrTbbWOmrCctTY/Lr0/brQoSKZ2c/sUhE1OsMAnpOiJPuIqCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=j7FUrS/b; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=j7FUrS/b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlV2m0k3Tz2ylr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 11:52:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Zwo3jEIV5k/S6BSvnMP3awGiGO3YuYSgcBWh6GzkBJQ=; b=j7FUrS/bY4ibLdXLkJxLUn+ap5
	YhYCpvwpzWdwYop+FOw+Y1rOXudXjrwxEmnvmuQoFhLfW/xwyB50Gj6j035cgOlkI2pmok7ipo2yH
	25crQAk4HTUDesTLMo7qHFGYzbAASFxvnGQgg1Yx5fJujYLkrX8wcSZOOx/WstQN0ioo/Yu8kjWRX
	y9Efcu9GP9BIzj65j++fzzaDauW3eyZ5HRZghn2s7hWiTSLsZpnyu/fgvMYsmPtHmO1P6YKr9X6Fh
	F0mWE3mIuF/Q39gr1a+q4vMiZIu/8G4U/MEIKnjcDFpzIhveaSK5y3NMx6iD7OCc6Ph2xD56WW+5t
	Vjg6IEZw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u8rCE-001JpW-2y;
	Sun, 27 Apr 2025 09:52:44 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 27 Apr 2025 09:52:42 +0800
Date: Sun, 27 Apr 2025 09:52:42 +0800
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
Message-ID: <aA2N6oJ9fQYQUtD4@gondor.apana.org.au>
References: <20250426065041.1551914-2-ebiggers@kernel.org>
 <aA2DKzOh8xhCYY8C@gondor.apana.org.au>
 <20250427011228.GC68006@quark>
 <aA2FqGSHWNO8cRLD@gondor.apana.org.au>
 <20250427015041.GF68006@quark>
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
In-Reply-To: <20250427015041.GF68006@quark>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Apr 26, 2025 at 06:50:41PM -0700, Eric Biggers wrote:
>
> But this one does have a lib/crypto/ interface now.  There's no reason not to
> use it here.

I need to maintain a consistent export format between shash and
ahash, and the easiest way to do that is to use the shash partial
block handling.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

