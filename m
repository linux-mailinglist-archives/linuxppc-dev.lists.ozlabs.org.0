Return-Path: <linuxppc-dev+bounces-5666-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CCA217E4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 08:11:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjYGd6rv2z30PF;
	Wed, 29 Jan 2025 18:11:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738134665;
	cv=none; b=Y3ScwRfjM3Cvmt8lOWDx6IWpExsvBdLpi/9RhDgR23KhcA339ETgyd0cVqNuP/9Hj6AXjvrI3nFf+rtnxB8huUoq9oXivl/8v9vn8qKYiTxnKn5h4q2hPjWQ73Ruy/5qYoK9HdnrKVX0Y1S2bmBf85m5EhfVyCu+l/d4st9wIo9fLaEAfdsRfMuZQGtncltgnHoh9mKEDqP+Pavf/hztqXyX7ow1Cj2FBNpMFWwbEFcMW9scav7ppO1ka7tMIpiNDR9QG3CuPjtHisInUCuLy32sYEYr6bC8+QGiMQWxGda1W4hbjpxkjIeWXHPT8XVYOGscHcue4T513NAF6ekvww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738134665; c=relaxed/relaxed;
	bh=1aNq0dkqNxCdNVcTtAlKlP/hLnjSybioZuZ3ghshyNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRTnZjJj9E7nDWHS/OTwC9g6MMeZHMA4N0oZoLcdsxH9S0jz9yHhGoBHfMiz5/qKEnMMb7ahydzXKg//Z/nhGjCPrgf3ivh9bZm32h3D2VnAV2fs2+bnen/FL2Mztq+cHCLGkFtZDUvvNfCd9rDb2ffSF2aSo66TixIGX3Fds0X2cbExrEoU6ilRO9y/xtgJZ93yRR/3zc2ir46r3Ruh9pJvLgzq0MAX9nU4PzrW5bzZnKsiRVgfoTw2Dhvz8rZoN5vJ9WW7X29tCIVZm4v6evIGhWke18caSHQCKFUf3lsYoO6m0v/b8QifugaiD7BSLx8dOpZRuTUndEjK2dAwVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=jryz+81m; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=jryz+81m;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjYGY19F3z2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 18:11:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738134651;
	bh=1aNq0dkqNxCdNVcTtAlKlP/hLnjSybioZuZ3ghshyNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jryz+81mKqSf4l29UH/0bKiQ9XmM5H2/ig9fdiKpIkZkjhbm3n/BZEaX+qUcyOA82
	 dZjrSzt8NQaBsZNyhShdi0Hhwv97uCys1aNfzhQJeFHBgrom+Duzo1N4N/vYamfthM
	 DIcyW0Xw2PqKHv0g80WNlw7pn5WRfIQo6ujsfKBp1iDAk8fqt33tvw9KjJTLCDdeOI
	 CnLGO0kH4hDdEx/R6UpdE7EaXihlE8uP+Ykclw6p/9bUE2hR/SvoLY18BBs8DCy1aw
	 TiIcAyE6HAJyFTwmB7qQdvGwRz766UmMctQaozNduXIxuqeEveW0dc/yZuAL/9bjmh
	 JQlqCycPqh2bQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4YjYGM2HN8z4wxx; Wed, 29 Jan 2025 18:10:51 +1100 (AEDT)
Date: Wed, 29 Jan 2025 17:49:10 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/5] powerpc/microwatt: Define an idle power-save function
Message-ID: <Z5nPZs3FTJ15XGVI@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lfyDQbGjxYT_eF@thinks.paulus.ozlabs.org>
 <D7EBXLB9JMZU.2T4WD5BP9C1GD@gmail.com>
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
In-Reply-To: <D7EBXLB9JMZU.2T4WD5BP9C1GD@gmail.com>
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 04:06:03PM +1000, Nicholas Piggin wrote:
> On Wed Jan 29, 2025 at 8:52 AM AEST, Paul Mackerras wrote:
> > This uses the 'wait' instruction to pause instruction execution when
> > idle until an interrupt occurs.
> >
> > Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> > ---
> >  arch/powerpc/platforms/microwatt/setup.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/platforms/microwatt/setup.c
> > index 5e1c0997170d..97828a99780d 100644
> > --- a/arch/powerpc/platforms/microwatt/setup.c
> > +++ b/arch/powerpc/platforms/microwatt/setup.c
> > @@ -34,10 +34,19 @@ static void __init microwatt_setup_arch(void)
> >  	microwatt_rng_init();
> >  }
> >  
> > +static void microwatt_idle(void)
> > +{
> > +	if (!prep_irq_for_idle())
> > +		return;
> > +
> > +	__asm__ __volatile__ ("wait");
> > +}
> 
> Does wait cause MSR[EE] to be set? If not, do you need to use
> prep_irq_for_idle_irqsoff() here maybe?

The wait instruction doesn't do anything to MSR[EE], but a pending
external interrupt (or any asynchronous exception condition) will
terminate the wait regardless of MSR[EE].

So yes, it does like I should be using prep_irq_for_idle_irqsoff().

Thanks,
Paul.

