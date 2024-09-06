Return-Path: <linuxppc-dev+bounces-1130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E708E96F742
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 16:46:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0fDp5XyKz300M;
	Sat,  7 Sep 2024 00:46:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725633978;
	cv=none; b=AzmLav7h6Zp3fvSxkNFW2DToSAXNwzc5ULh10t1xqDa/oxJfHO0TvdyscxrPOQDB0sM3ul8qSfwD4bCPU93raOf+m1hiLEnpDvgq+/+JQxLX1Owr3jR6XZj/j+fkBC+LTx6dELhjaFi4+3MHFQzjAdobRLeoJ9OKWUq/8uOUs3nBECnwj2zYvasG6f9OCHUx7LEc4zfLChhc+ksw6XqADqWKXFSG226ya/pZrfN6O1iya24Kr9zBzHA3GeuCTRV4uW+00F9/CxT8VrVOp5k5kdsZKvg+SI+q/7nOiMag0SlJ9FrZAxJNwQHYceu+elkkr0unnOwA7dPNUuzKYy38uA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725633978; c=relaxed/relaxed;
	bh=LQaqdd4gn6hwyJ6X/+wp06IeAX1AuCwE2tKJcvmByYs=;
	h=DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To; b=IjuH/PjcJr/ciZQ2/dDStwdNzIsehg6cOiHk1TsyxK6aU67wi/MsotX13BFU6XBks8sZbKjlucJ+V4AfbctV1K2kQDVNGOlpKasW1LybKQnfZvwrQudeRHjaMZ4eUvMQ80i0MEwAbLBTiPKMeKMXl2KMdmxUOvGcjA/lWW1R+TZ/3fy0/FIzWANdKBgVKsP/qAT/LHRZxOC06TwcnfGmrUBOcR+rfXKF8Jl/0uhIo2BshENHX5HzpeJNLiwO1qheNM7DoaaGk1XQGiiGnyyn1Ps0hvsIUNZC+uxRsgKZsSFeNlDTNPcXhIIBlJEY9FR3JUslMMjhIDDQ98AQAVDmDA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=hdkchmhx; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=hdkchmhx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=v4y+=qe=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0fDm5gfmz2yn1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 00:46:16 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15ED3A404BD;
	Fri,  6 Sep 2024 14:46:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C37EC4CEC4;
	Fri,  6 Sep 2024 14:46:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="hdkchmhx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725633970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LQaqdd4gn6hwyJ6X/+wp06IeAX1AuCwE2tKJcvmByYs=;
	b=hdkchmhxBGCbaIA9Ddy8tLE2V3TigvEtRRSSeTX9BsM7QQ4qIJuX0ADLJbDVgWmYlSonvd
	Bz0qYCzSkg8NdulUBcB2nO4r2j8iwwSNGQko0n9UdoJdiRM6FT6m7IIdYnvEifxsZ47cna
	AwAA+oz9pguT0Yk6OmB338aNuSS3wI0=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 89574607 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 6 Sep 2024 14:46:10 +0000 (UTC)
Date: Fri, 6 Sep 2024 16:46:07 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrei Vagin <avagin@gmail.com>
Subject: Re: [PATCH 2/2] Fixup for 3279be36b671 ("powerpc/vdso: Wire up
 getrandom() vDSO implementation on VDSO32")
Message-ID: <ZtsVry_LL2jjeLJ3@zx2c4.com>
References: <700dbf296d02e32376329774be35cfbead08041d.1725611321.git.christophe.leroy@csgroup.eu>
 <ffd7fc255e194d1e2b0aa3d9d129e826c53219d4.1725611321.git.christophe.leroy@csgroup.eu>
 <ZtsMpcV7iLYoytdJ@zx2c4.com>
 <795db5f1-c266-4fb3-a51b-c2b3745d334b@csgroup.eu>
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
In-Reply-To: <795db5f1-c266-4fb3-a51b-c2b3745d334b@csgroup.eu>

On Fri, Sep 06, 2024 at 04:26:32PM +0200, Christophe Leroy wrote:
> And thanks for playing up with it while I was sleeping and getting ideas 
> too.
> 
> Did you learn powerpc assembly during the night or did you know it already ?

I don't really know ppc assembly. I had perused the tree over the last
week and gotten some feel for it when reviewing patches, but I don't
have anything memorized (except, perhaps, the eieio instruction [1,2]).
Last night after sending the first broken patch I went out to play (I
play jazz guitar ~every night these days), and the whole time I kept
thinking about the problem. So first thing I did when I got home was try
to fake my way through some ppc asm. A fun mini project for me.

[1] https://lore.kernel.org/lkml/Pine.LNX.4.33.0110120919130.31677-100000@penguin.transmeta.com/
[2] https://lore.kernel.org/lkml/alpine.LFD.2.00.0904141006170.18124@localhost.localdomain/

> At the end I ended up with something which I think is simple enough for 
> a backport to stable.

It seems like a good patch indeed, and hopefully small enough that
Michael will let me carry in my tree for 6.12, per the plan.

> On the long run I wonder if we should try to find a more generic 
> solution for getrandom instead of requiring each architecture to handle 
> it. On gettimeofday the selection of the right page is embeded in the 
> generic part, see for instance :
> 
> static __maybe_unused __kernel_old_time_t
> __cvdso_time_data(const struct vdso_data *vd, __kernel_old_time_t *time)
> {
> 	__kernel_old_time_t t;
> 
> 	if (IS_ENABLED(CONFIG_TIME_NS) &&
> 	    vd->clock_mode == VDSO_CLOCKMODE_TIMENS)
> 		vd = __arch_get_timens_vdso_data(vd);
> 
> 	t = READ_ONCE(vd[CS_HRES_COARSE].basetime[CLOCK_REALTIME].sec);
> 
> 	if (time)
> 		*time = t;
> 
> 	return t;
> }
> 
> and powerpc just provides:
> 
> static __always_inline
> const struct vdso_data *__arch_get_timens_vdso_data(const struct 
> vdso_data *vd)
> {
> 	return (void *)vd + (1U << CONFIG_PAGE_SHIFT);
> }

It's tempting, but maybe a bit tricky. LoongArch, for example, doesn't
have this problem at all, because the layout of their vvars doesn't
require it. So the vd->clock_mode access is unnecessary.

> Or another solution could be to put random data in a third page that is 
> always at the same place regardless of timens ?

Maybe that's the easier way, yea. Potentially wasteful, though.

Jason

