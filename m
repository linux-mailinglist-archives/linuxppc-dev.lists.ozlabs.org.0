Return-Path: <linuxppc-dev+bounces-1507-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E3C97DC67
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Sep 2024 11:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X9kYM0bhJz2xps;
	Sat, 21 Sep 2024 19:32:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726911127;
	cv=none; b=aluN9gBiuDSgYku4tGFEsl7xgSzI160L82et6LT+HucsAQABr9a39WhpGEc0B2igEmWsFy19St7n3RgKpcxrH/73hmH3phK02uKoAVIhw0IsuxoKUTD8YvYAuBoVoOsS6fkjnIcZ07ZZFwCcYgYXwRttONEW7dih3nc0bl1PjkNc+wgeoPQizlWN/5/vsCqjnPNnGoSN5gPrHVkVHzGLgNkHL/82m23D6j4RD+9X383kE1JMonIsAZCdcGD4AplqkDgRwvDiDr36+recVdBnbQF6OfZAYsCicx+6qNc81bidsGx3phZ9iFw5uj5jcrgAmZyoY8f/hhPyq3fgY3HW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726911127; c=relaxed/relaxed;
	bh=vjE19+EA/AopPzWy7APV3m/MroOy6WxqyOwkBypTXlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eg+19dTMh4Mhy/RmvWTda/aAbL5kgQHJCDVRlKvOzvCUh94lXROzCV8wAHCGmO0XGB6w+KSOMX4CKLexD5SmN2XQC8GFXQV//BlSZ0fb5d8B4GelcRnn9bOCf4siU/G7kK0MfOhL8oRHI2J7k3tb9UhZqWSa+vien9FQUVsJVBv43gFvnvil0i3DfbrBtHTuaaQIUmOELHyL4w905dRihGgS7XEy0/YIc4AIE5AHO8Xh10yiPP7aHKGpGqm1NIHB9BAWlqLrvGLkmydx/eIV+O9wkVOGRRRRvPnDDhRm8v+f/eQe9eFwvuX6Ue8Ueg8ZasYCB+qFrifzquQQvlNNIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=B4jB1mQr; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=B4jB1mQr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X9kYL0pF4z2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2024 19:32:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vjE19+EA/AopPzWy7APV3m/MroOy6WxqyOwkBypTXlE=; b=B4jB1mQrvycPEIxXWp9oKEB6FE
	r3PmgGys6yEuDajmiBGW6LtMY9h2RINQSDIZe5a50C5vU/l1ThmC1rKJsa/sxHndsUrvDX8dPYfiO
	DnV9ajAgYzXpvurCVzoEABSoI5u7Do5cSEEy8w8vz8O8FeO9XNQ/C2HZsWAgvU24lF/EyqRG2TqHO
	DtHvXciIerbMn59YDFRhHzLCzrID9vudyrppiUT5/EL7jRZJwIDPkOheD1Vp4dcKASoA8AEHdBbac
	m0hWL6MU3YC96dTpKxLuGVsabCACOrC+X/iA4Gd8Vtsyo0rdcL/uKBZ6GN+fPbRh1EY8VNbybvh43
	1n8cWfSg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1srwIu-003kPm-0D;
	Sat, 21 Sep 2024 17:31:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 21 Sep 2024 17:31:37 +0800
Date: Sat, 21 Sep 2024 17:31:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: linux-crypto@vger.kernel.org, stable@vger.kernel.org, leitao@debian.org,
	nayna@linux.ibm.com, appro@cryptogams.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com
Subject: Re: [PATCH v3] crypto: Removing CRYPTO_AES_GCM_P10.
Message-ID: <Zu6SeXGNAqzVJuPS@gondor.apana.org.au>
References: <20240919113637.144343-1-dtsen@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240919113637.144343-1-dtsen@linux.ibm.com>

On Thu, Sep 19, 2024 at 07:36:37AM -0400, Danny Tsen wrote:
> Data mismatch found when testing ipsec tunnel with AES/GCM crypto.
> Disabling CRYPTO_AES_GCM_P10 in Kconfig for this feature.
> 
> Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
> Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
> Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
> 
> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
> ---
>  arch/powerpc/crypto/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

