Return-Path: <linuxppc-dev+bounces-7781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA2A930EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:41:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0tD70Npz2yhG;
	Fri, 18 Apr 2025 13:41:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744947684;
	cv=none; b=fozY+h0IsYDrqzX83ABtnv2Y+u4ppqrlYNhTMAMlsyqpCgTjsY767ZjIHSI4eSo7I+XO0epQpAUclMSrL7gMZlWEKBI5owFRXKzObnT3J1rfopG/3EnqGMNOGrLjBBRueqdM2t+qJz8PFnUMKFdXk6/o/7CnbnP7gpRWkEIIo7a4H9VQ4hStiZARYVlteWlN2yWHJOtcXSh+GqTYzmMNI9n9MHF+bRP3MAX8vH7liHbMjs2epn3c1lnIon8iApId0H7EOKeBZmN97lht0a1qQWjTrObqG72qY1yv9h2zPix8Ib/fnA9cPNwz9ItITJR6XMte/w03L/86BmEFBV72pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744947684; c=relaxed/relaxed;
	bh=DeLdxRY2vHoEKdWJ6sFRDUQGcMLf7d+q/0pRxlVp8JU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0BLM2QMNRam3gOAaVhnUkg9LUg+pIh0fl2yjFJ21GBCYM+p02WFVSofVIz3Vd9QsSEYCnsx+8Yh69gr5d5O3mErf5/7oVJrRJHSLiPMesatdrrF+bYCbeUzbsRH7xCEinrpOPA97K/zU15e1VCwpm5nL2+BTGO6OEez8beRX51AUzxk0e4WNafi+5greNaAiYKB+Els0/aD6Kbyi0sbjaN+j7uuGuvAKe8xIt9MpNRilypi90DuVnwL9UwfOyTNumzgipoz0ae3RU3VgEj7Hhxqd26MfXAtk6+pa4a7Nv6l8pYgfkP1g6qMSHNQe9/hMplaBdnr3DjmDB/xmgj3lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=VXq5/xSO; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=VXq5/xSO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0tD2Xwbz2ydx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:41:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DeLdxRY2vHoEKdWJ6sFRDUQGcMLf7d+q/0pRxlVp8JU=; b=VXq5/xSOluY3RsxfcvuVGjWtZR
	7jvkDa6bj3M1EaAcxKxQY1WDgoWtxg/rm+6XAbBrtL/22i8+WyfgIn92PWApVLEpoDfegP0QpPOHV
	j49Y4XDyIw1sIIkoEwstoQy941i447cYR8qbCXF/sECr1WK62m3qCFnYJ70WAowk7ZhpqPurKZXYy
	QmRJZLHzlF1wf0IN5hkkxnn1hHHtG0hLnxes0shefNdMuya+B9FXC2X7iO7mGssssJqcNQsVxqf5u
	e6j7zakwSXnJ9DlD7H7sHRU6fBUhGHklvmSKWQIcNMVdPm4+5+iJiZ2Hqul+k2BQgzx4AOyJ+YYD8
	8L9xBumA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cbR-00Gek0-2H;
	Fri, 18 Apr 2025 11:41:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:41:21 +0800
Date: Fri, 18 Apr 2025 11:41:21 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 8/9] crypto: x86/chacha - remove the skcipher algorithms
Message-ID: <aAHJ4X95vIujLPpu@gondor.apana.org.au>
References: <20250405182609.404216-9-ebiggers@kernel.org>
 <aAHF0X2I5ydEJK1p@gondor.apana.org.au>
 <20250418033829.GC38960@quark.localdomain>
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
In-Reply-To: <20250418033829.GC38960@quark.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 08:38:29PM -0700, Eric Biggers wrote:
>
> Well, I forgot that an empty module_exit needs to be kept around for the module
> to be removable.  I'll send a patch that adds these back in, though I'm doubtful
> that anyone ever removes these modules in practice.

I just tried to remove chacha_x86_64 in order to make sure that I
was actually using the arch-optimised version of chacha and that's
how I noticed.

I remove the algorithm modules all the time because it's much easier
to rebuild one module rather than the whole kernel.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

