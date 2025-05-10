Return-Path: <linuxppc-dev+bounces-8484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A75F7AB2159
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 May 2025 07:49:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvZh31qnlz3blH;
	Sat, 10 May 2025 15:49:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746856179;
	cv=none; b=iEO9MB+siSe4CvkOaOa1TBKuwczsZqwHO1k/EEyj4XgO/8oXOy+JJDqSeJfNsz3OWc46l/MNNbL07fj16OmffQW3U3oLxGnOvcqCz76fwp6ke+Yf2zX3y4Q3zVakC4ehFlHXG5gsv8IZzhL9l3odzW27pro0VOXw+PrtNTf2agciqshKthlRJ2fwCRuCudtHA+29rjKgikeyyn/8Seoj6QlOq4SFuPysV487vIf2R8PykKxqeXZ4LH6GQV3Uc5hW8ysEfZZdkQ13e6DP7zpok6gL05vnqMnn3rJAGTcAu5a6nFoQ7Ms494S2vN3OW33ljDhtLqu/P4FqTR5fSNd20g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746856179; c=relaxed/relaxed;
	bh=RXh0QFVMABOW8IlNIfg12VYz/znZ1YLDkFmTDAQ4dNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeRef4yVYBI/bPiK+CfVAANhwxv9ZokZeZM2RejXJdjZ61GeGZ3yPYzEN5YgTNYpotrrA2478H+TvE2YSEZF/627YAPdJRNogly940lWV+WUL9gridurl9DzfMcELvoJ/+WhoDomzye1d6kkjOYkIjfPg8VvujKiBFo97cZWcfWaOobnSvQjFtOrMhGd288IZV2cIKRqTZ43/5uvdlZfIZ3oz6KOu6BfrRBw0d0NuUX42apDb1sER6GEyEGgAnvKX6RCm3jjOnzGbQwoVeJfX9mUgABD/8fX7I0EYSR7KJrrc1J9A+iZbBq4kQlkGh48BZFOjBx4+18g88wGxXOI7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=LPQAFjKy; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=LPQAFjKy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvZh151v5z3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 15:49:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RXh0QFVMABOW8IlNIfg12VYz/znZ1YLDkFmTDAQ4dNM=; b=LPQAFjKygEyIyig8xIFhuy9obS
	52c3Q/U7QgoKias8lincusco3CDDbuUY1Eqp9kMpu4+td/th70eOrnhr5efyfkzt80EOay4/GHeP5
	PWuaiSMgv6vJDHCzi7kYRFUyOZGH+7cCqZo0jMRPLNtTd+84oaSGx4n527RgZBsj6FuLgSMqBjolZ
	NytOdJ+eUvpsylAxwoLijqAO5iVy/V2kl8aHx6YyWsuBTl/cWmckLLr2SUioK0LYEY0N7bfST7kTE
	LmXh8WkodE+PAXFEeKo7Xz8P/G5Hn8EcF1ESODdWQGkSKayAadXQXJchjA1aCEhqxsnYyIbok8adS
	btv0exgg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDd5F-00517o-2e;
	Sat, 10 May 2025 13:49:14 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 May 2025 13:49:13 +0800
Date: Sat, 10 May 2025 13:49:13 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [v2 PATCH] crypto: powerpc/poly1305 - Add poly1305_emit_arch
 wrapper
Message-ID: <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
References: <aBtF2jVZQwxGiHVk@gondor.apana.org.au>
 <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
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
In-Reply-To: <20250510053308.GB505731@sol>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 09, 2025 at 10:33:08PM -0700, Eric Biggers wrote:
>
> Yes, the PowerPC Poly1305 code incorrectly uses VSX without first checking
> crypto_simd_usable().  And PowerPC also doesn't support VSX in softirqs, or at
> least it doesn't claim to (it doesn't override may_use_simd(), so it gets the
> default from include/asm-generic/simd.h which returns false in softirq context).
> Maybe add 'depends on BROKEN' to CRYPTO_POLY1305_P10 for now, and give the
> PowerPC folks (Cc'ed) a chance to fix this before removing the code.

I just noticed something weird with this code, running a speed
test using "modprobe tcrypt mode=217" shows that the p10 version
of poly1305 is way slower than the generic:

qemu P9 CPU:

May 10 13:36:46 test-p10 kernel: [   59.585264][  T374] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-generic,poly1305-generic)) encryption
May 10 13:36:46 test-p10 kernel: [   59.586011][  T374] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1374 cycles (16 bytes)
May 10 13:36:46 test-p10 kernel: [   59.587446][  T374] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1359 cycles (64 bytes)
May 10 13:36:46 test-p10 kernel: [   59.588025][  T374] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 1778 cycles (256 bytes)
May 10 13:36:46 test-p10 kernel: [   59.588639][  T374] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 2323 cycles (512 bytes)
May 10 13:36:46 test-p10 kernel: [   59.589342][  T374] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 31624 cycles (1024 bytes)
May 10 13:36:46 test-p10 kernel: [   59.594178][  T374] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 4408 cycles (1420 bytes)
May 10 13:36:46 test-p10 kernel: [   59.595317][  T374] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 9719 cycles (4096 bytes)
May 10 13:36:46 test-p10 kernel: [   59.597512][  T374] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 20168 cycles (8192 bytes)
May 10 13:36:46 test-p10 kernel: [   59.604616][  T374] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-generic,poly1305-generic)) decryption
May 10 13:36:46 test-p10 kernel: [   59.604916][  T374] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1356 cycles (16 bytes)
May 10 13:36:46 test-p10 kernel: [   59.605564][  T374] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1393 cycles (64 bytes)
May 10 13:36:46 test-p10 kernel: [   59.608308][  T374] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 1845 cycles (256 bytes)
May 10 13:36:46 test-p10 kernel: [   59.609002][  T374] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 2392 cycles (512 bytes)
May 10 13:36:46 test-p10 kernel: [   59.612109][  T374] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 3349 cycles (1024 bytes)
May 10 13:36:46 test-p10 kernel: [   59.613289][  T374] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 4418 cycles (1420 bytes)
May 10 13:36:46 test-p10 kernel: [   59.616233][  T374] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 21600 cycles (4096 bytes)
May 10 13:36:46 test-p10 kernel: [   59.620221][  T374] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 20013 cycles (8192 bytes)

qemu P10 CPU:

May 10 13:40:56 test-p10 kernel: [   91.672877][  T392] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-powerpc,poly1305-generic)) encryption
May 10 13:40:56 test-p10 kernel: [   91.674615][  T392] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1471 cycles (16 bytes)
May 10 13:40:56 test-p10 kernel: [   91.680240][  T392] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1733 cycles (64 bytes)
May 10 13:40:56 test-p10 kernel: [   91.682975][  T392] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 3248 cycles (256 bytes)
May 10 13:40:56 test-p10 kernel: [   91.684445][  T392] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 15211 cycles (512 bytes)
May 10 13:40:56 test-p10 kernel: [   91.687603][  T392] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 20500 cycles (1024 bytes)
May 10 13:40:56 test-p10 kernel: [   91.690926][  T392] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 10159 cycles (1420 bytes)
May 10 13:40:56 test-p10 kernel: [   91.695009][  T392] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 25917 cycles (4096 bytes)
May 10 13:40:56 test-p10 kernel: [   91.701320][  T392] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 63352 cycles (8192 bytes)
May 10 13:40:56 test-p10 kernel: [   91.713863][  T392] tcrypt: testing speed of multibuffer rfc7539esp(chacha20,poly1305) (rfc7539esp(chacha20-powerpc,poly1305-generic)) decryption
May 10 13:40:56 test-p10 kernel: [   91.714182][  T392] tcrypt: test 0 (288 bit key, 16 byte blocks): 1 operation in 1502 cycles (16 bytes)
May 10 13:40:56 test-p10 kernel: [   91.714871][  T392] tcrypt: test 1 (288 bit key, 64 byte blocks): 1 operation in 1778 cycles (64 bytes)
May 10 13:40:56 test-p10 kernel: [   91.715508][  T392] tcrypt: test 2 (288 bit key, 256 byte blocks): 1 operation in 3322 cycles (256 bytes)
May 10 13:40:56 test-p10 kernel: [   91.716463][  T392] tcrypt: test 3 (288 bit key, 512 byte blocks): 1 operation in 20980 cycles (512 bytes)
May 10 13:40:56 test-p10 kernel: [   91.720775][  T392] tcrypt: test 4 (288 bit key, 1024 byte blocks): 1 operation in 8000 cycles (1024 bytes)
May 10 13:40:56 test-p10 kernel: [   91.724348][  T392] tcrypt: test 5 (288 bit key, 1420 byte blocks): 1 operation in 10155 cycles (1420 bytes)
May 10 13:40:56 test-p10 kernel: [   91.727952][  T392] tcrypt: test 6 (288 bit key, 4096 byte blocks): 1 operation in 27711 cycles (4096 bytes)
May 10 13:40:56 test-p10 kernel: [   91.735306][  T392] tcrypt: test 7 (288 bit key, 8192 byte blocks): 1 operation in 52874 cycles (8192 bytes)

Did I do something wrong?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

