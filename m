Return-Path: <linuxppc-dev+bounces-1239-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F75A974C8B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2024 10:24:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X3YWx3Wcxz2xY6;
	Wed, 11 Sep 2024 18:24:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::af"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726043069;
	cv=none; b=kj+LAA9P/mb4VZDsGm6gspreuYHTk6ABQJD3mztjPRBHjYrXfVBYb087qamlR+P8GShU505XWzbAYV0A+QZ8eAfWGDoV6Ilh7+E/QKM3FLUvKbcqA3DcckNzE6qTlamQOCM8t4JiKZbhCbiB0PocQfBUc0nlMDKd63WkQNq59hqsnVw6buSdpGzsCCsN02ZbRLvrPur2jdSF8GAPHF0rUUJK8iQlj/8ZgL0h78ixqECD0r9uXwEAO/4pJo6oGSOy48LzQ2E2zyqlZMRhW+C94Ad70dT3dkP07lm/WWtELWceMjo/1ZZJ/+NjPFNtCBi3HvOEJBkDfKfgy2dBICY7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726043069; c=relaxed/relaxed;
	bh=/1TI8bsOlziGCU+hlwwiFofGLl9oRjkXX9zj1uFoMWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWCzXPPH81IndPsfli+0oLcayTKasCoZD7DEgI1Gb/TXGO9K9timjgIyEeMyuojwCgCqaJVRnmSdzLRxdLIMTEZlwM51mbTpzo8VbwLdVP6jnyvMqN7nW7x2JOIv30dkKOWsG/XtT1lffxNl9y+2WA/eX0y9VkmC/5phY86QcvKYVASAU/zKuF2xKu/55HTOoF22hGBjkxteCmCq3ESOks+nu3gkAKAW7PNkcHykhh34mYKe0RtQyCBXjOrat7foa0N6FIPYEuYH2xfg5I84X6UblMEZQXlYhJrxvhBCl8cROH07SyIuJ5pOxLsbQQJxfBER1szg3l8j5laoifsljA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RZFxghiL; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::af; helo=out-175.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RZFxghiL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::af; helo=out-175.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-175.mta0.migadu.com (out-175.mta0.migadu.com [IPv6:2001:41d0:1004:224b::af])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X3YWx1Zdsz2xX4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2024 18:24:28 +1000 (AEST)
Date: Wed, 11 Sep 2024 10:24:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1726043047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/1TI8bsOlziGCU+hlwwiFofGLl9oRjkXX9zj1uFoMWU=;
	b=RZFxghiLIKxKCgLnibfFH4ohiv33HX3hbHVAGyIE8JlT9bIGx4BVzkUhVwpdBmmzi5vbnx
	FXAdcQ+RcA1B0CKKjMtElVrxXAM+19onH2byFb5ATKCVdXi3TiCVL7kt+yNLzMeWmiseys
	DJ3Cud9yYsRK1+D+SAwjKYJhn87Te1Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
	pbonzini@redhat.com, thuth@redhat.com, lvivier@redhat.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, nrb@linux.ibm.com, atishp@rivosinc.com, 
	cade.richard@berkeley.edu, jamestiotio@gmail.com
Subject: Re: [kvm-unit-tests PATCH v2 3/4] configure: Support cross compiling
 with clang
Message-ID: <20240911-99a010a84e453f4362566c6b@orel>
References: <20240904105020.1179006-6-andrew.jones@linux.dev>
 <20240904105020.1179006-9-andrew.jones@linux.dev>
 <D430ZV4FP2GE.3B7VE2I37RPXX@gmail.com>
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
In-Reply-To: <D430ZV4FP2GE.3B7VE2I37RPXX@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Sep 11, 2024 at 10:24:34AM GMT, Nicholas Piggin wrote:
> On Wed Sep 4, 2024 at 8:50 PM AEST, Andrew Jones wrote:
> > When a user specifies the compiler with --cc assume it's already
> > fully named, even if the user also specifies a cross-prefix. This
> > allows clang to be selected for the compiler, which doesn't use
> > prefixes, but also still provide a cross prefix for binutils. If
> > a user needs a prefix on the compiler that they specify with --cc,
> > then they'll just have to specify it with the prefix prepended.
> 
> Makes sense.
> 
> > Also ensure user provided cflags are used when testing the compiler,
> > since the flags may drastically change behavior, such as the --target
> > flag for clang.
> 
> Could be a separate patch but no big deal.
> 
> >
> > With these changes it's possible to cross compile for riscv with
> > clang after configuring with
> >
> >  ./configure --arch=riscv64 --cc=clang --cflags='--target=riscv64' \
> >              --cross-prefix=riscv64-linux-gnu-
> 
> Nice. Perhaps add a recipe to README?

Sure.

> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
drew

