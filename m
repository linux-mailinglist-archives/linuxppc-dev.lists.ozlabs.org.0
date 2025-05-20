Return-Path: <linuxppc-dev+bounces-8706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B1BABCD3F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 04:33:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1drc0Nzgz2yLJ;
	Tue, 20 May 2025 12:33:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747708383;
	cv=none; b=ZnJJDGx6r6GSIMSPIQvcosgy1vq9VwgPxqJ28E64mxoaecErv4NiQR4axtR9ppAHHTsdXLLre+yH3E8Xv5s2BcIo7FFwt5GDQy5bYyru8t26H3ylTPXs0rF5vpJiMCrn+A6eybO0JxEvboB2KVH+8x+8uRkQ6KQ9PZ24rT9xkJYx48VW53C9o7YSD7pgN0yr26ZPTD3bi46G4Nc5TyxYYuFoQxEcf/5NZykkEdU9odluHoIvl5aVVXpZu96OBWdj45uXVEcHp6Earl/QuSjcwbtz1l0jOMojwv5CKXsWwBQ7aocbGaml+SQdjKNuIxAcJcZ4c6cvgmltPmEfUQUDpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747708383; c=relaxed/relaxed;
	bh=IEJHYJRcBOOza6rnvYFfZ2/r4z4MC7ZuTGxku3UCA20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8o0SkQTftD3sJ0vzXVF6XGiniHKy7iB6JLFeNh0WCLbkubsmr8e3k2MSfpbj0yvGmoxw3YAbSalD3zXxWWZMfUeKh8RRLLqQB8Y4Jt+e2KGSA99CE2K0Th957RyD1pX35lv1Q8UakiBwmtBhCb8kSK6D8EBdHhv9ZblvtiOY3IyrdbjOaiOKZt63b7USjUaYuGMhE1owsgWnUkXCEWxysdDbxaQXeT86TXWKXpB+ukwuZeJJbdN4yW+TDP9F3jZYD17gAmJ7+SvyyP9IC0HoHepqnGJu7cBMHtktXsCzMlaj140GouzekDrXSs5MUj6hSLj5zJ4zOMEokfF8KLYFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=GSq1gQaS; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=GSq1gQaS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1drZ2kchz2yDM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 12:33:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=IEJHYJRcBOOza6rnvYFfZ2/r4z4MC7ZuTGxku3UCA20=; b=GSq1gQaSwNftG4++AamXlDNuuy
	9e4L+errUG6Td7f0476kvuoYb/r3mNg1qFayKHloRI4jbRqpoKRihYSOsxk+wEKFtEUSADpdMgsW8
	tSsqVHOSLgwFQ2o8M5PzQ2vRS5DdgfpOxVC1m/4AZ2EzkddeIoCoiCUM4xOMGi1+txrnRMot0TEpN
	rfEypLHd+j2TP9MzR5j51vxI8M4UQBVHHDSx7YPj8H97KXy27lAuddWfQvNSeRH4N6Cwv0ZB+cFnD
	FviYyalTnpV3QfSHcb6tV9HuHNCZ6PqgX25+nKCSMlzdxn1rFn4k5xmKs07IwxwWiGuD5Q+je4pEI
	/Oz7E8Nw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uHCmk-007Ox5-2x;
	Tue, 20 May 2025 10:32:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 20 May 2025 10:32:54 +0800
Date: Tue, 20 May 2025 10:32:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, naveen@kernel.org,
	dtsen@linux.ibm.com, segher@kernel.crashing.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] crypto: powerpc/poly1305 - add depends on BROKEN for now
Message-ID: <aCvp1rzh2vV9L4g_@gondor.apana.org.au>
References: <20250514051847.193996-1-ebiggers@kernel.org>
 <aCRlU0J7QoSJs5sy@gondor.apana.org.au>
 <20250514162933.GB1236@sol>
 <aCVNG2lm9x9dzu6x@gondor.apana.org.au>
 <02c22854-eebf-4ad1-b89e-8c2b65ab8236@csgroup.eu>
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
In-Reply-To: <02c22854-eebf-4ad1-b89e-8c2b65ab8236@csgroup.eu>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 03:55:16PM +0200, Christophe Leroy wrote:
> 
> As far as I can see related patches found in linux-next tree were not sent
> to linuxppc-dev@lists.ozlabs.org.

I just checked and it was definitely sent to linuxppc-dev:

Cc: oe-kbuild-all@lists.linux.dev, Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Danny Tsen <dtsen@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>

> Could you resend them, and split out the introduction of
> CONFIG_ARCH_SUPPORTS_INT128 from other parts of patch "crypto:
> powerpc/poly1305 - Add SIMD fallback" and add the lib/tishift.S in the patch
> which adds CONFIG_ARCH_SUPPORTS_INT128 ?

I'll just revert them and mark powerpc/poly1305 as broken.  You
guys can sort it out later.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

