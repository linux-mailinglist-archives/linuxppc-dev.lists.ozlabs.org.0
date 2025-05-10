Return-Path: <linuxppc-dev+bounces-8485-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5A1AB215E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 May 2025 07:50:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvZhs0zyzz3bn0;
	Sat, 10 May 2025 15:50:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746856221;
	cv=none; b=K2pGWySMlnnHQAULUZ+c0VdK0XNgjw2UdA//7cem8uQr/Pc7d2HPp17NYtrcXV1zPrQaxgZOvf+VvUDnvTWDqp6s/lJvYiBJwtZ4GJ4hysSsFQv7G8HaAIe4hcBnluSVX+eSiIQNeSx/PE0gkD3GKrcrTyZsuSZWOfl3NnVGPl8BROt1qVepvh+2oTWj/+HduQ22VXrYinXAo41OtvbexlrleJPZ8oSfrkN/izM62tIYmc+PpftnP33PNWnjXmKhxanZ/lpgCb/ZlW0wmmdqZM96piAKaBz5UlFLoY0qpQe6SKvXzNiOBjzeadAnfh7d2E8NscnKj3ZM8JzS7n04sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746856221; c=relaxed/relaxed;
	bh=azZatDGZZpa1dscuRnN8VaQxezld54QPSyC77iPnC+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjeCubi87sYgo50Xjkttq4YywOmgxkH8dkOCK8tLlyqdex3xT+Rp0EP5AhCDSvEONAeGhsWidxxQHT4DxZUswWhx47EMjL9osox/EalBeoHywa+nVQWTLeq4IPZsGNvo52VLCFOVC92ZTa3JERq5QEeHz7t0kKTYBaUUd4z2CB1ueZn+frYuxqiwdarbL/eke4vOHHjwWjORld/Ve5RouTBLRm8gBxSCTdp85TV9hrNxpJovU/G1AGMVSXXJKjLvpcAi+0+jBwxRzj/SgQhvxAgLnB4SZnVEVbdO7ScSZx/dJ66MfvKsJWPT88jEwWCC6qAyfkl0d0NiMUOZZy1ZEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=O9LEAxNF; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=O9LEAxNF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvZhr433rz3bmc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 15:50:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=azZatDGZZpa1dscuRnN8VaQxezld54QPSyC77iPnC+o=; b=O9LEAxNFgjfYzF6/4roi700fIf
	Szl/UWmaQ7VB8/ZBy7HcdrCV68zwSC0KIDUKYB3Ot6Ml9UrLhe+tI3IXp9oGEE5XN5C1g35srK7gL
	x1YyWjLP51vi45v6W+uI41lu0wefnKq0o5eb3iZB98OSH7mVGXuCgPSc9PkSXXgbwrupLq+7YBUns
	/q9q0U+YWOF3C9/Y2xNfmEK2EDOjXGzSaaE+pkiacA8q3ipAlym+luF2lUFSwEt1/43GLRwWsaCTT
	Qfat69zKmFbU4AQtJwbfFSoJkobpBv9QB/yRQJessX23KWLSTyIaTG/WKH+uMYcTLYb8OmRzCTxgf
	nYtYvV2A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uDd62-00518M-2n;
	Sat, 10 May 2025 13:50:03 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 10 May 2025 13:50:02 +0800
Date: Sat, 10 May 2025 13:50:02 +0800
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
Message-ID: <aB7pCuT2wfEe_xby@gondor.apana.org.au>
References: <37cf099e-d5c2-40d8-bc31-77e1f9623b1c@linux.ibm.com>
 <aByX_Y64C6lVRR8M@gondor.apana.org.au>
 <f66620e2-77e3-4713-a946-ddb2c8a0bccb@linux.ibm.com>
 <aByiNZNxqyTerdYG@gondor.apana.org.au>
 <1d2c2fdc-5c36-4d4e-8b25-8289b865726d@linux.ibm.com>
 <aB31DI4QBBZuQObQ@gondor.apana.org.au>
 <20250510044450.GA505731@sol>
 <aB7fvi_FBdnmLUON@gondor.apana.org.au>
 <20250510053308.GB505731@sol>
 <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
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
In-Reply-To: <aB7o2SiwNLfBTgQk@gondor.apana.org.au>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 10, 2025 at 01:49:13PM +0800, Herbert Xu wrote:
>
> Did I do something wrong?

OK perhaps it's just that the qemu emulation being slow.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

