Return-Path: <linuxppc-dev+bounces-7780-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9439DA930E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 05:39:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf0qv3N4vz3bsL;
	Fri, 18 Apr 2025 13:39:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744947563;
	cv=none; b=lAsi+OqvmBwz5IbO9saX/Bpq7jpTEAoASDVzhMXL3LOkpxGPz5NT9frfp1aBW7UquGbl1DyLhyarCIPpxhXAqJKk47mPHXyNwhlGBEP/16FnLcuDX00kLa6Drv+I/qiOSXnG6ygAWXudFUsGPlNjc2rXRBBRee2Evow35mKLD+unUZp533tDiRmZHh9s6ar7M6aKCngswadYvgNHusQDt9vl3bqOg/6u4QeCsvXfSnMSsBst5FYHdnlh9ePJuCl+ebrmhpmPi+HQZLM7cqUl4iLf2DBdR6kdf5C+fQ2AiRLy0pTKU6TYc707xkYv5WDC4uGnJoqx6kTozm+7WBJnig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744947563; c=relaxed/relaxed;
	bh=ypo01vEghGy27nPQeItYqzxY2hP/jSSCN3P/bWLwnyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oa26pZnsDXgc4oZIes/u43jnz3ubuEfY5NGW2iViU09SjOfaR8hNTVTNMFHldFnBURfYjUg9p/Js+tCu/A4Bra8s9sVhyBHFBEKhrpQl8pE4GOR2Jqb2HufP7aUUSnjaH9H4A+5BavHBtJ6sSPfXa7TLAU9FXF7ieSSCEa+TUzhSRFYwTMyrFYyP2pIRlFixxbh36cUUlZ3x2uRaboK69Pthb0XEMm0bve8MWm0ZbuL3kWuBN8wqvBH2IlW1+sXPqFO65gu3hw+tqnlBm9AjeMlMJZq+40xjR5iqVKbVv87ZlcW/sOXzPTTyPfbXPk0jeKLjirQFtULQcunnZ2Y4pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=MWds7QQ5; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=MWds7QQ5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf0qt65gcz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 13:39:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ypo01vEghGy27nPQeItYqzxY2hP/jSSCN3P/bWLwnyg=; b=MWds7QQ5JPbuMv2nNP62mZrmbF
	Bq+va6ic3n9cE4To97pskQEOiYEgsVK/Xh8YuuAOKuIIID1z2Vq3HbZxQR+CYja/g25SPlAkVRUl+
	H9u9EF0MzbL5Mi8IsgXzItMNafiBhN+YDzET3Y9HViK1SEU7axHGeYqC9LhSPKWfG7EfR+Nvr10pf
	3g47jJR3eiFrDSksGYzS1b0S2RXn9rrEZ0+/URVOKCvjVfjHiqO3FGvkTbRRop+Bjj9y62pQPQXVh
	sey566NEI3Y5b5FUM0KMzQX/NoqvpplvIJxlE3X8eh9UpsQuZaJN/320owLJMMOldzgO3/MGmbseG
	rBqKJH2Q==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5cZU-00Gejm-1k;
	Fri, 18 Apr 2025 11:39:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 11:39:20 +0800
Date: Fri, 18 Apr 2025 11:39:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAHJaH69Ngr0Ojh2@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHCIL_sYIS_1JQH@gondor.apana.org.au>
 <20250418032845.GA38960@quark.localdomain>
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
In-Reply-To: <20250418032845.GA38960@quark.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 08:28:45PM -0700, Eric Biggers wrote:
>
> Only x86 and s390 support KMSAN.

OK that's subtle but I'm glad it's not an issue.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

