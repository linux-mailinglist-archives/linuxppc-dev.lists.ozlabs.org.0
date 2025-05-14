Return-Path: <linuxppc-dev+bounces-8569-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11584AB67CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 11:41:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy7f43fvfz2yf2;
	Wed, 14 May 2025 19:41:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747215708;
	cv=none; b=b5sEKgBNMxBaNhiHMb2JqlxZHHAb4TG0NBpP+jgI1sOOpzJ+y9/W6fThyEuLAdaklC1mDxrLm6NcqhRAxuLXVYqWFFDg441lFfQoHHWBr77GRczjUfXyC2cvb/x7R5Jv9z1F7IXUOg97w9Tcs+7h2WaWzJdq2DuE6ZNAQzFCckyj7TUz26TmerG37Irh5W0+dTCdmg48PamdnlZ2Er1Y/DUb0aJrCVkcZsgiaWkw4oCrlAAaYO8dqk+VoZeEq85oj9yFgVZxLFZzrQEsNx3LELl3ubyT+IO+nG1wHik5A9ot3LqJq1JJnwvcvi2yHVveFsfvwiahhwWBsf+M7Ug6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747215708; c=relaxed/relaxed;
	bh=0K2DM5nV5WtDSjS9jWdRAsQawmnoY/TG6puxv5DwAmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=eiYzVdFTMTdVGr3UGXwYOmLYOMhwBdpOUGGrebqlDJCLmw4nBgyMM9vPz0SEo4+ILI4d4Oc4X1qdqmF0JOdEA+itLIg4IwjPFofp3il5fj7sgfP+5DviUZ4AHWQqV0CUsL9df7Cj0gsMkYVOH+ict6ltlL9p861IzHdGW8XgrFrYP7Q4Qvaoq6WLzeK0Ifxu/7O6tblTnXpluLDanVcd+QDAVjrSN5w9HXz/AAcJ5kJCf+4OZzbabmPnY8RcgINNbWamX933ygFL1XH9ukdbIwbyceAkHhz2FOiDQHpVZ9bMUzhr8WgXAPUfLNPLjW4ZeBeLsOc9720i78JNvWvIqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=p9hJyjbA; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=p9hJyjbA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy7f21mMBz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 19:41:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0K2DM5nV5WtDSjS9jWdRAsQawmnoY/TG6puxv5DwAmk=; b=p9hJyjbApouhBcGjnABahtwNoQ
	uEQ0OGw0yEiSl/pRhId/FW1/573aE+v5M6DAHIsjr8rHygIPxQSZlh993gALhgAtFPwwAswBesmRY
	gKcSsoZl1a9VJX5IFC5mKKEpEUpMjbEXxCZ79DANqnje+eHjmrOkEDJgoTXUNSeof8+vXpcQLYxAu
	biALK1ffIYikhFhiPfaFOmpScVO4HCYg1rf05np8UoesycDs93adGDiMqTBkH2vWAMlOzC+pO6+HC
	reZgy5+yE2qLqrAvYXdroA7tsdp8/XpDLYVemHXZEELCcAZ/aW1u5znuVlvBS0WOoj5gV0to2TCDo
	tz4UuOcA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uF8cN-0060fl-2v;
	Wed, 14 May 2025 17:41:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 14 May 2025 17:41:39 +0800
Date: Wed, 14 May 2025 17:41:39 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, dtsen@linux.ibm.com,
	segher@kernel.crashing.org, stable@vger.kernel.org
Subject: Re: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
Message-ID: <aCRlU0J7QoSJs5sy@gondor.apana.org.au>
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
In-Reply-To: <20250514051847.193996-1-ebiggers@kernel.org>
X-Newsgroups: apana.lists.os.linux.cryptoapi
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eric Biggers <ebiggers@kernel.org> wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> As discussed in the thread containing
> https://lore.kernel.org/linux-crypto/20250510053308.GB505731@sol/, the
> Power10-optimized Poly1305 code is currently not safe to call in softirq
> context.  Disable it for now.  It can be re-enabled once it is fixed.
> 
> Fixes: ba8f8624fde2 ("crypto: poly1305-p10 - Glue code for optmized Poly1305 implementation for ppc64le")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
> arch/powerpc/lib/crypto/Kconfig | 1 +
> 1 file changed, 1 insertion(+)

I thought this fix should be enough, no?

https://patchwork.kernel.org/project/linux-crypto/patch/aB8Yy0JGvoErc0ns@gondor.apana.org.au/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

