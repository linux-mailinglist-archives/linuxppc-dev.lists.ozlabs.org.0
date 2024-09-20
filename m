Return-Path: <linuxppc-dev+bounces-1488-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D3D97D380
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2024 11:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X96Fy75Cmz2xpp;
	Fri, 20 Sep 2024 19:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726823798;
	cv=none; b=Ia+vu7U/AQjiwJ5u4AsTBZA9W2qJiDTShdhbHyTs5sD7OWIIuR1dukVdMcwLfeomuy2A0bmD0hQycdrvVjrNlRLREYmdoo6+8sbUqWb1ez99+jWaGwxwM4awPrnNcAx4Ayz/p4WDLBJ63ksENyYe9yXOpGOnSFRpdJbEmOjGx/QMYs0G/7bIROJfi5Ir4O9uT9tJOSrT5K9bWCg/IDz/xkjgmV9y1Hia/A744OTIj5FmRbfi177c5D2Tk8pmrQwN3tlEYqG25/fnC0MRrdk8ydxKUJOOa9x3rAZCE7Rkwtvd16rAzQfdqgEVpKuHZe4Y8+yIq6jk9rZjhM7GGoBvBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726823798; c=relaxed/relaxed;
	bh=IA6yN3inZfKzjRZ8fVnZb2zPyxLvv/G18bjmPkyeAS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dOIJ+0bEIRmzsJtzinXRqaFmSwekibSQiq27GJMJIkAEXFkwAHU3caigK9oyzdt0sbMMFQPlmhuUIxZ0tnRDc/PZeTQj1o0dK8sMW3yK81xucqVfEkSuMmCU/HMzFoyA/IU2yUWf1rdkY9i0M8YmsAYbfR8/TUoKLFYXARD+9CjnOloUu2T5wXWNLF/qxkZ4bS4T45m0rvX5TdWyPVzqLn/8hPQF3fnAcrQM1Sk5mYvOw+RCuv44Zfowyo0gxT6acGzhPhtMf4BqxnY4FNiPnBzAu5EOvoywudeAiU7IEfGBWaxVbC1z16dLPpNBsFMakpxARBkvgYR/q2s6elPBiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BC58+kQU; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BC58+kQU;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X96Fy6ttLz2yR1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2024 19:16:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726823795;
	bh=IA6yN3inZfKzjRZ8fVnZb2zPyxLvv/G18bjmPkyeAS4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BC58+kQUHYvhPZ1Al97xWzc5nlJVz9/kxlqWQ924vHUxqa9sNhzS5x4DvnsSOTazK
	 8cVdXcJL0b+IS/S4JY4VlkXGb3ORVwG1f6IhEnKAwmaRIzy0ex3LXbEueEZ+M9WkCo
	 /FuLjdvknPC0BGbvi50t9qU+tXQdQjcUEHJyws1oaNZ2O8R4oje6s+SFl6TeOLKB5B
	 LHZBreNeDVCJ0XtkKwv6ed7nhSBQOINmpmLaFMKijRepN9KbjvAdtLt5tkJ2GtPO75
	 xMVvDtzTGPoxaWAjCE/SoEleQDPnItf9b5amX2MMNZYdihXcBOMEp2x6cqq2SU1kZb
	 Z1kBDIQ/HCyGw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X96Ft01KDz4x7B;
	Fri, 20 Sep 2024 19:16:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <aded2b257018fe654db759fdfa4ab1a0b5426b1b.1726772140.git.christophe.leroy@csgroup.eu>
References: <aded2b257018fe654db759fdfa4ab1a0b5426b1b.1726772140.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/vdso32: Fix use of crtsavres for PPC64
Message-Id: <172682376257.64942.9485115063969411360.b4-ty@ellerman.id.au>
Date: Fri, 20 Sep 2024 19:16:02 +1000
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

On Thu, 19 Sep 2024 20:55:57 +0200, Christophe Leroy wrote:
> crtsavres.S content is encloded by a #ifndef CONFIG_PPC64
> 
> To be used on VDSO32 on PPC64 it's content must available on PPC64 as
> well.
> 
> Replace #ifndef CONFIG_PPC64 by #ifndef __powerpc64__ as __powerpc64__
> is not set when building VDSO32 on PPC64.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/vdso32: Fix use of crtsavres for PPC64
      https://git.kernel.org/powerpc/c/699d53f04829d6b8855ff458f86e4b75ef3e5f0c

cheers

