Return-Path: <linuxppc-dev+bounces-1599-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD10D98696A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 01:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDXmz3sWtz2y64;
	Thu, 26 Sep 2024 09:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727306515;
	cv=none; b=Aau5hWGmoV+ErRRQE+EyAG9+fhUaqRNpMWcSy5sdWbiD9Mx0kBU45cV1Qve7X0ZBKlDkrkE5XLr/EHqy3HMuo1K64Svu4TBWKuU7cP5+4kf5A9HON1GcDHD2VOufFevEesZrJeplk3LDBrTvrecxkPjGuz/1jzEeTLF1qewUUcGQ0ha0qIvi7qhQz1VFXf3wevIYRk2y8tP2xLj0Nfm3CMJ6rd3pOQjD2ZW9uMuatCu0ZoGdQPzdAAIWNt0NFD3yAKOs/CcIfC9HXjvC/wl7VHC9WPq+yuiBb/od1yidr4MIFQ8HQjdRogRYsuxPnmp92PLEr32gT2THK1MEnz8BLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727306515; c=relaxed/relaxed;
	bh=l1rIEx6r7LFI89mz+YbUek5pVG0RBPcusOKLUr9q4Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rt2Xpi4XeI+ERe6WDC82QCKd5xvnp002fKjWJ9uCKAAlmrNVThyWmOi3s5a92sy+UwlEVbdlf9pnmyQXFR/gaNLm+vJBZFeoWkQKHoevUeb2F3Lcio54AWMIKRlfeg+7utd02fWgajl2I0Yn3EFkbMPlo33VnMa4eMv5FhYoqxcwZthNiRYdyNl4Lejsd70gJsNEuzR26z+Q22bvFsruCxJu8J2f3auvIadnNTHrSF3f/JurynjkkqDAe/9nGkWc7GWasVjeEbdo4O4GYSSgNgj7pTclVi/15oZRFb8DSNiS1Gge77ggnBe2g+jQnlRx+hjJvid4ypdozK/F46aysQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=LpW4lwKG; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=ioc0=qx=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=LpW4lwKG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=ioc0=qx=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDXmx4rthz2xjQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 09:21:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 389DB5C5DB0;
	Wed, 25 Sep 2024 23:21:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B86C4CEC3;
	Wed, 25 Sep 2024 23:21:50 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="LpW4lwKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1727306508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l1rIEx6r7LFI89mz+YbUek5pVG0RBPcusOKLUr9q4Lk=;
	b=LpW4lwKGZcJ0nctLlEHqhIjGWVjRT8POFVxfQjwDSNvUM2nGL5OMj/8+VhM6CyFqpGMhJq
	c95zWLvkDGhn1Lr4wA4AAFCk4YiB19k4H+ZsXKjtqxAo6LwUKLUtCvJzQwuGH7KHiVAbRa
	QA08dTMK3lsSt20hcH5hZPxY5vznKqs=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 41b1a950 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Wed, 25 Sep 2024 23:21:47 +0000 (UTC)
Date: Thu, 26 Sep 2024 01:21:45 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: allow r30 in vDSO code generation of
 getrandom
Message-ID: <ZvSbCayu8QNySN7K@zx2c4.com>
References: <20240925175021.1526936-2-Jason@zx2c4.com>
 <ZvRYs-WYz2qHZjhy@zx2c4.com>
 <e52a4a07-de2d-4f8f-bc03-3a441152797d@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e52a4a07-de2d-4f8f-bc03-3a441152797d@csgroup.eu>

On Wed, Sep 25, 2024 at 08:48:31PM +0200, Christophe Leroy wrote:
> 
> 
> Le 25/09/2024 à 20:38, Jason A. Donenfeld a écrit :
> > On Wed, Sep 25, 2024 at 07:50:22PM +0200, Jason A. Donenfeld wrote:
> >> For gettimeofday, -ffixed-r30 was passed to work around a bug in Go
> >> code, where the vDSO trampoline forgot to save and restore this register
> >> across function calls. But Go requires a different trampoline for every
> >> call, and there's no reason that new Go code needs to be broken and add
> >> more bugs.  So remove -ffixed-r30 for getrandom.
> > 
> > Strangely, I am _unable to_ make the Go code not crash with this patch
> > applied. I'm not quite sure what I'm doing wrong yet, or if this points
> > to another issue.
> 
> Do you mean that without this patch the Go code works and with this 
> patch it crashes ? That's strange taken into account that the chacha 
> function plays up with r30 regardless of this patch.

Yea, that's what I meant.

It turned out to be a Go runtime bug, which won't affect other vDSO
functions but does affect getrandom(). I fixed the issue and sent a
patch up to Google. So this is not the kernel's issue.

Therefore, this patch can move forward.

Jason

