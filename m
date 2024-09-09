Return-Path: <linuxppc-dev+bounces-1163-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9B5970DFD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 08:40:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2HJT48Wmz2xfT;
	Mon,  9 Sep 2024 16:40:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725864009;
	cv=none; b=nkTDaF35Yv+9wNpFLPZYN10l3wk5vi58wMNE3vqJQmBj1fbTUaWteYjifRFnS7WRaWYO6PO8a/9VKZUEJlnStFYvHEL5PWUpfLIdEa/kx076seGn3JVvelXO1XTw2oZCMdfaWR+KU9dWlmkkRzLCmbdzQzByPPpj4dARrfQ1uWJmRAwmgvA3mamfi0meMBBexopUeP+0Ssa4MMspzfpG/CDwviP3kV4t+pOCImPn9KiLUysIirKCGuHdJxKYv1RQ/RGw7CE5aA9miZYfWGQp0cFmSNcuVbWf8zgAFOQk5B9pJaZhbUHRJEJ6lLpMqljaYL+KQOZFP1fC6+cvCatWmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725864009; c=relaxed/relaxed;
	bh=6PbbI4EATTD/OrTPSWHrhxuPyO3m+IU1wrsU9S79Rm0=;
	h=DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:Date:
	 Message-ID:MIME-Version:Content-Type; b=SrBn4+PQ0LZ/mhjOaSqL9QVXix54Dbxev0d7GUbg0y6PopKshds0aJ1ZLFZHkOHyoct8rOiRsmDBRFthe0+vtRatGCHkATY3JHJgpa/xxBi0wSqvY2Lop/QpKYYGrfmqVagz6HtNzP0lbDYlAhthBDbFoCahPo06JowK7t7gs5w1/5eWcySWuXxGAiMjpLmHwVaLzMRyC99A1FpGSQIFOH5HuJuxUgREeK90MZv8LsHT1CtfpLTznPV7JaDI026DmxdwfEDa1SAPyOf0gR45Yojh5Z6UysHRDSOjkkn448887Hrwjr1xJ3u2nOPgNYOC1aBqbaN+AGPptVwdIjoDFw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V9dqjOT5; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=V9dqjOT5;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2HJS6KwXz2xZT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Sep 2024 16:40:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725864005;
	bh=6PbbI4EATTD/OrTPSWHrhxuPyO3m+IU1wrsU9S79Rm0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V9dqjOT5cG2Z/ik0KS2Ug814aSRbGFjOwq9SedHMMKCwpDrApwYz0ArGViy5Lb/a6
	 yyUPuQILPkjStOT8poYnkXv2Jooq74dG20gBuKXWTIdbtJfuzKXTK1LVngFS+qL47Y
	 plgL18Xfd9FhnusGMn98V4drs3aZqenn6kZzlW+KAAn68oBd1MaE8NVVkazwUXht2r
	 y2quNbgbn/OHE5rKZB9Fx2hIk0Mg2qRd4DwRBh0Sau3G8FCHg4cobRsRqgbBZ3xziP
	 FB93Q+bcT6tCTUMRm6xjrcCEfb6yStHAyYy1QsneaiFUFc7x2lJo9kSs8Zj/PeDUv+
	 ly/dIYijM2sMA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2HJL6vpQz4w2F;
	Mon,  9 Sep 2024 16:40:02 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dave Vasilevsky <dave@vasilevsky.ca>, glaubitz@physik.fu-berlin.de,
 bhe@redhat.com, linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Reimar =?utf-8?Q?D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: Re: [PATCH] crash: Default to CRASH_DUMP=n when support for it is
 unlikely
In-Reply-To: <c04fe24a-26e6-44b5-a2dd-00eac589e36b@vasilevsky.ca>
References: <20240823125156.104775-1-dave@vasilevsky.ca>
 <c04fe24a-26e6-44b5-a2dd-00eac589e36b@vasilevsky.ca>
Date: Mon, 09 Sep 2024 16:40:02 +1000
Message-ID: <87ed5t49fh.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

Dave Vasilevsky <dave@vasilevsky.ca> writes:
> I received a notification from Patchwork that my patch is now in the
> state "Handled Elsewhere".[0] Does that mean someone merged it
> somewhere? Or that I should be using a different mailing list? Or
> something else?
>
> I'd appreciate some guidance.

It was sent/Cc'ed to linuxppc-dev, so it was picked up by the linuxppc
patchwork, which is fine and normal.

Because it touches many arches I don't plan to merge it, I would expect
the kexec maintainers to take it.

So I marked it as "Handled Elsewhere" in the linuxppc patchwork - ie.
not handled via the powerpc tree.

That doesn't mean anyone else has merged it, it just means I haven't and
don't plan to.

cheers

