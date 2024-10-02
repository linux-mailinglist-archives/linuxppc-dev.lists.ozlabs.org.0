Return-Path: <linuxppc-dev+bounces-1724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BCA98D05A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2024 11:39:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJVCG3j8wz2xpn;
	Wed,  2 Oct 2024 19:39:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727859622;
	cv=none; b=ksWSHOIllObCGurMSCdr6I/FtG1PlY9PFn1/lwEY0AL35WIEoTbIEk5oSaRJQm6J86FappMvLMLM52Igh0IIpJSSCZUPWHTLa9u58mI0vCM66/aWOVpJ2IfvrBlEfa6bzwajRIJOfE6wlC9EhNirK03o2xVE3R8Ch82I6RPHP+3qrEP8UE8N4+H+NGw91i74cwnqgeabAB4NIZAHFRYmIymMU2w/a/P+DRP0I6KJuloY1V0aNw4QBzugGAT7YD8Yu4Oj6GoFSOUG3E5EG65uynSJULIUjiN2BRkpJlQvL63bC3pE2UF+kUxscTXQ20NZhP1nF7Pna1Rp0rpQJ6yUgA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727859622; c=relaxed/relaxed;
	bh=JobR5A+SF1SfOE5ovpFuN/8jyIiqbSV9U/dgwI+evhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECPg9QP7QHZW454vx3AfkTHM3iEJNLkih7V2gPAD8n/p/R8MtbrEk7SqOsHC1M5AGV3Qq1ggK2qALZlqGh9iqG00K/PSpY03hRacLHRxbxi9nrTnuj5nU+9FD83dHxi7Sy1QeUBzrcVdFanGBJf29fmBliXllIBAtoP5jToV7mE/dUk3egrlN6gcFqxZ5jDiUJ3eBIH3OvFsBcS0e2sSgiIsFUu83o4RnCzCMxdCCS4JlGQyBwd5qmjYZCAvkqhAdcf0twHgOYyw/OrG8bRK2tqVlnHG1V76BkhUGzpj2xaCBfEixAhzEbPOCux8hFAQJ31LInOErND5IgdC7unNfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qU2hNTYp; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MTzAfauK; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=qU2hNTYp;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=MTzAfauK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 352 seconds by postgrey-1.37 at boromir; Wed, 02 Oct 2024 19:00:21 AEST
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJTKd4sBwz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2024 19:00:21 +1000 (AEST)
Date: Wed, 2 Oct 2024 10:54:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727859264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JobR5A+SF1SfOE5ovpFuN/8jyIiqbSV9U/dgwI+evhg=;
	b=qU2hNTYpZpQgEXPt7S0Rvj3tFXmQ5SeE9x8asf3njKHyJ+VPmFr2F4qnWiHEDyWTRyuHrE
	PfNnTMFO1inQeGbqllz4dcr61/D5yCMGnHZKyb7VySl2tBrCE0vbDozHckNVS6x88vKtMO
	ryrrczliw2Yh20QdSm6qphQqi1DV5m2BHtEltzrfs6IDLIia09SuJM+I9RV+8oDbHk07jq
	N30MR6zYeRb4SMZo84rMTy6L2OYiSNoNkWYKh2oHYFqCVh8v5GCs5vNzQYs7b2d6ZrjVhP
	cVmaRuMwQGJM08mD+3nOI5PULU+1y+OTBUmsWrSFwpzXjZXuIeSGZQjQZ+PelQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727859264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JobR5A+SF1SfOE5ovpFuN/8jyIiqbSV9U/dgwI+evhg=;
	b=MTzAfauKUjCdh/YxPqYaKvjpvutELxxOfxPWbM14XN0SrKbq6l08hbxYHoxyyAeujSVDZd
	toiwLTE5nnhBYhBQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Jason@zx2c4.com
Subject: Re: [PATCH 1/2] powerpc/vdso: Add a page for non-time data
Message-ID: <20241002104334-b655500b-901b-42db-a2c8-582e10826889@linutronix.de>
References: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
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
In-Reply-To: <0557d3ec898c1d0ea2fc59fa8757618e524c5d94.1727858295.git.christophe.leroy@csgroup.eu>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Christophe,

On Wed, Oct 02, 2024 at 10:39:28AM GMT, Christophe Leroy wrote:
> The page containing VDSO time data is swapped with the one containing
> TIME namespace data when a process uses a non-root time namespace.
> For other data like powerpc specific data and RNG data, it means
> tracking whether time namespace is the root one or not to know which
> page to use.
> 
> Simplify the logic behind by moving time data out of first data page
> so that the first data page which contains everything else always
> remains the first page. Time data is in the second or third page
> depending on selected time namespace.
> 
> While we are playing with get_datapage macro, directly take into
> account the data offset inside the macro instead of adding that offset
> afterwards.

FYI

I am currently working on a series to unify the storage of the
VDSO data for most architectures, including powerpc.
This will also include a dedicated rng data page.

That generic infrastructure would replace the need for Patch 1.
Obviously, if your series gets applied, I can adapt mine for that.

If you are about to also modify other architectures in a similar way,
we may want to coordinate.

> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/vdso_datapage.h | 24 +++++++-----------------
>  arch/powerpc/kernel/vdso.c               | 16 ++++++++++------
>  arch/powerpc/kernel/vdso/cacheflush.S    |  2 +-
>  arch/powerpc/kernel/vdso/datapage.S      |  4 ++--
>  arch/powerpc/kernel/vdso/getrandom.S     |  3 +--
>  arch/powerpc/kernel/vdso/gettimeofday.S  |  5 ++---
>  arch/powerpc/kernel/vdso/vdso32.lds.S    |  2 +-
>  arch/powerpc/kernel/vdso/vdso64.lds.S    |  2 +-
>  8 files changed, 25 insertions(+), 33 deletions(-)


Thomas

