Return-Path: <linuxppc-dev+bounces-1421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A550B97B00E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2024 14:23:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X7LXg2rN1z2xHr;
	Tue, 17 Sep 2024 22:23:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726575795;
	cv=none; b=KD54N/ZpvQmqLsecj8/qFd+aTpOtfzRH7UUmn0Go5I05ROL6nVpmwZ4CWM+l99IjthUY9amUOr303MGC3EHCRyBSahn2gzTFTI/Eh6FIb/B/eDyMI5u9B4TzRm4qwjez1GHKln3vFcwrTAo+ypze2xzHR1P9VNaGUGTaisfpHSWFGDknP6G/NbHcTbwWz3fogQZCf+BG0fiOwGyH1eC9IcbO5PSgC5h5JIM6ZZpfCYQ9q93RIWcdoG2Gu/XwJgo1//288QvnmuMou6taF6J5fuf6Is5IYkclenVmxx1MUnIbyPYkORMwfMoqarzDDvR1Kq/mfKELW+4HIb8Wi+Mftg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726575795; c=relaxed/relaxed;
	bh=0bi3sJBjfynW3WRvY/YGmOO8QFbRlU3vuAc8jYbMyEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZOViuCV38SlMmgLns9DU4/WU6NEnOpcW5IM+N8wABsloCrxPlv4Zrc4UHnZWu3DXRRnLf2b18hZdyC4DQYb4SXY6nmeyYhF+VMZYnGkgu7Q5BkD6PSmuMKnXdJQAU9nYsWI8XKolikpb5DJNtPmnEsDmA9LCaAz+CdcCmA/6cSpoLpiIRV2HhzPWkimMlen2IKS4TZtlR1MQrk9facfPlspGzavnrEOA+JnkaF+kPoXeZubbCGKnXUpWH2aIWMzTEWZBhytxO1ijNXi61WUZ0PzP3ZpTwgEZuTIaiPvHXziQKhODvyOsnxdeG5wiFVhvf2AkITCW6Maq8pQ402MsTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mPPjWi5w; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mPPjWi5w;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X7LXf3kkkz2xHb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2024 22:23:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726575793;
	bh=0bi3sJBjfynW3WRvY/YGmOO8QFbRlU3vuAc8jYbMyEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mPPjWi5wVA+k+8lSVo+2j+RhsB6zuSt6/ZF1HThWEveQsbr9FbAUpIIqkIPO7nrVT
	 i6FS3RKhMTvyYsGcwvYkUhVE9hD9IsbFk7/qYhdhB8fuNh8PmfyX7GrL8XiI4oimyn
	 FckbwCUMSfdD3WyWaCa5aXO/77DJwa6k4fpwTYdftSHoAVKUBsLEAq53RodwskOZNK
	 /SwRsyXz70TQrEPuZfZqHTp245LG+oIiD7ryJ+F92hXgJI8S6yw/COom0qgz0BksXZ
	 cAjwZGLfqo4EGuLPjsY5Ngsfoedib00BBnp2hXRe6+sW4erpYIAHF+VbLazsOJsg/C
	 bAyHLjT+pA73g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X7LXd07qVz4wd0;
	Tue, 17 Sep 2024 22:23:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org
In-Reply-To: <20240827063651.28985-1-mpe@ellerman.id.au>
References: <20240827063651.28985-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] MAINTAINERS: powerpc: Add Maddy
Message-Id: <172657576220.2195991.5150370893686687282.b4-ty@ellerman.id.au>
Date: Tue, 17 Sep 2024 22:22:42 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tue, 27 Aug 2024 16:36:51 +1000, Michael Ellerman wrote:
> Maddy will be helping out with upstream maintenance, add him as a
> reviewer.
> 
> 

Applied to powerpc/next.

[1/1] MAINTAINERS: powerpc: Add Maddy
      https://git.kernel.org/powerpc/c/b77d36bb9a3de774950ba712a0e47f9d33c6f6d7

cheers

