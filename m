Return-Path: <linuxppc-dev+bounces-7784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2993A9349A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 10:25:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf7BK6NV0z2yrC;
	Fri, 18 Apr 2025 18:25:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=144.6.53.87
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744964745;
	cv=none; b=O3sYmaqgDhlLwTlMjurnpSHdFeokutAeAe0YaYb+TybbDqQoMvyHGCAKmo2Z+CBX22P62EU/2X+tOoZGpEAe7maa7oQqjcTrjnG1oKdH2ZzAeb8woZlSNUj4e1C4/8Qqyd2n1hO8ZG2x+1LS07mBCw83SibLLFttggzq0yj8iEJZrFyvOVY9gsKh0+wjy/on2OsL1EkXZhcdQemaJe/XUG4DexwoQi3jk9F2TkRLjqOaNt+KaB0eLteLAcX5Ct2LYwZhuZle8GYUUW4gkDAJM+ee5lrHZ3wHq4qDN4UGl+FvVrlaQf1AjYjht/mV+vwE0r8sKt/oS525SDW988Lp1g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744964745; c=relaxed/relaxed;
	bh=hlkg+5jDRBY5wNNnTe1hqoMZ0WqQC2CXlXJOinsVxyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFOwxhLL0xuCiQmSHaGlwv3nn40k7imWla1MKFF/qq3M+JhnOj6vw/tlwvql2s6MBok+Dukg+TCv+2GvBlhdz2YsKB9nEkyZ80N9eFkLHzsg1kwMDCOkZ5KCRk+DSY0bvseHNa3ydYsxp1y4cjq42+Uz6Krxjy+bi5PsSntS3bWQzkh44NXiFO9iTUEP16TdhWkSYFIZCNRrf1QBPdjHbNxpnHr465SEbdx76afnNBlLJW0WOVO6FFKLd7fsH1dl0W6d0YfEYHXStgVlV4tfHkFfbCk+YlIEhTg4rrQC6ymWjElZv3oLU6E01daTO+lMlNFPiz9vsa8TaaaBcQ3aDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=kpcJ1aZe; dkim-atps=neutral; spf=pass (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org) smtp.mailfrom=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hmeau.com header.i=@hmeau.com header.a=rsa-sha256 header.s=formenos header.b=kpcJ1aZe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=144.6.53.87; helo=abb.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf7BK0Yp1z2ySN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 18:25:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=hlkg+5jDRBY5wNNnTe1hqoMZ0WqQC2CXlXJOinsVxyU=; b=kpcJ1aZefOCOmEslLOYgO5//QM
	Ln6pMr5koiDKWOj7at3DmuXW/+yNTQNemE32nJCw0tUBk2lSSos3j+agdtU8LJ1QmGrITb33TVv2P
	ax7x7ihD9o/9/iRWIG6o5huDo+sjBvBM8N/+4rmITe3RGNDZD3kJRIZDt9wM6vSrDQAsM8CtmlaSX
	oieCkebA9MArb2/oiKMgpHGYdSRIx5EULaGWGCnkwKjcIqfjRnqi6KVnMh+uDMtW/pKGRh9+DYB8j
	6L7OlrJk5uGTHv5eg8RoWUkRMy9N+wd4fu7ENI0N1H5rEEfkOX/zcPw1G7vGUetKFspJKMJxaHYWr
	x44+Tchg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u5h2a-00GhP1-29;
	Fri, 18 Apr 2025 16:25:41 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Apr 2025 16:25:40 +0800
Date: Fri, 18 Apr 2025 16:25:40 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
	x86@kernel.org, Jason@zx2c4.com, ardb@kernel.org
Subject: Re: [PATCH 01/15] crypto: arm - remove CRYPTO dependency of library
 functions
Message-ID: <aAIMhLD3UMM41JkT@gondor.apana.org.au>
References: <20250417182623.67808-2-ebiggers@kernel.org>
 <aAHDIRlSNLsYYZmW@gondor.apana.org.au>
 <20250418033236.GB38960@quark.localdomain>
 <aAHJRszwcQ4UyQ2e@gondor.apana.org.au>
 <20250418040931.GD38960@quark.localdomain>
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
In-Reply-To: <20250418040931.GD38960@quark.localdomain>
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 09:09:31PM -0700, Eric Biggers wrote:
>
> arch/$ARCH/lib/crypto/ is the "right" way to do it, mirroring lib/crypto/.  I
> was just hoping to avoid a 4-deep directory.  But we can do it.

You can do that in a follow-up, assuming nothing else pops for this
series.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

