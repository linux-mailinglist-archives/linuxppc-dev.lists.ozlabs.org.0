Return-Path: <linuxppc-dev+bounces-8707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10229ABCD59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 04:41:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1f2X3kC4z2ySg;
	Tue, 20 May 2025 12:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747708900;
	cv=none; b=L5gX52ptiG4toZfd5PzOG1G9m2BKkoCADVw2O6mDX+gdPbqSfC0rJdPg5BmEUbfevP0euah3AHg/9jBTGFKRR76PlaTpiW6UxGDNfGClsQHSVGZ4tPswF97KqWzwtWe7yj1aY76GjPwemLIOZIRKOLEE+QrTtudkGitvMH9JF+ShKmFM1mbIxRMyVTRm2ck186zigyL4GtfeDAIBu8nqoEs3/Gf+Mv4Se8zUs1mEYX3ygLa5wrPKXQPLjyrF1MFPSAOX8/v86hfLclAFr6d8I8hm8i7CnLTjYZjoVLCzN5Jg61BpVgKDiJsEAw/ONgVVCdPaBiOegruMHWAdBl5ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747708900; c=relaxed/relaxed;
	bh=mbmHatBgibtORGz9noxsxSToIgfOSiUJWWrCAu+1y1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q7kURFpNTyTldse13SvtpRtyasKLEgjulIfhzJzWJBWbzYD3I3GoxNJJAfOWNc9iX7XE/yrvhVJYWUgqCAARqm6461DRzfjwp2ghbnvO3+apHLW3i5gczOLDYZZi6nBVpmTCU+4jRvps08qK8XobiSqHjJj2mAPgEWVLLulHFNCwZ038CCRW63tQLHnExPpYNFOgs8iPYByiJrkq/AH1olR8/JvrAO+MpUngxvKL2KpLWkbCQ9lg6u0A9/jupE19V3ZMnazmah28F6KfFhEFE6XlROyH5yODYO0yplQWzXDg7h9rZ98hYxwOtudwhQnehFpIXXrOf89h32ghzKgAJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=omqUSEff; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=omqUSEff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1f2W5qztz2ySJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 12:41:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=mbmHatBgibtORGz9noxsxSToIgfOSiUJWWrCAu+1y1g=; b=omqUSEffP5SSHEifldCkpDAuF0
	/U9n2kP+47uJLCJQDY9awYQsUUUGHR+6Ojb4w2XVYn1LqJKHGdwnmWa8cF5J/GA9ztkf4ZzXjPxxp
	BuB78/QBN6VCQgS97Iye9+Kaed6cm7GBzzWKE1ZvDMNc77zUUmy9LdNopr95s0SXSVxEzTIeoDueg
	+qDZeL3Zo8WlbMPFiqc7bTEefWlF4AmMra5HBu4p4dQvtaFRCDTbJfcx09Lx9AhMJDkT8EZ2wU2O7
	Fy7ku6CuyYzZ/W0q1S0yNHmCKO1hYwCA9qtFG8LtETboCNqhiVQPmZa3htpzTSSoSHs6afBNWWRXd
	+lX3oQBw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uHCvB-007Ozg-1S;
	Tue, 20 May 2025 10:41:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 20 May 2025 10:41:37 +0800
Date: Tue, 20 May 2025 10:41:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, Danny Tsen <dtsen@linux.ibm.com>,
	Segher Boessenkool <segher@kernel.crashing.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
Message-ID: <aCvr4UeJ1cK6jF0c@gondor.apana.org.au>
References: <20250514051847.193996-1-ebiggers@kernel.org>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 14, 2025 at 05:18:47AM +0000, Eric Biggers wrote:
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
>  arch/powerpc/lib/crypto/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

