Return-Path: <linuxppc-dev+bounces-1463-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6192D97C98B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 14:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8b5R0QGvz2yGh;
	Thu, 19 Sep 2024 22:52:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726750347;
	cv=none; b=cLh8ZpbxK9mbeWLsvMcN9qCPg/0/UgOVjxhI34wGPMrUMiA1+hmrEJNSjIk5moJ/tWRsZctXy2TtRf1X0mGhi0E8VuKL7aKPcF+0TVhGE1Lum/jMyeLtz/wXZHRI/8heq5e52r4LFfexAaBS0CTIyYQ/Vs0kWmgN8q2/OO4bo8a0KTgwcUZVysMzPXhLYsnyw+S+WT+kxkcTMoqkhq/dO9gY1qk1RniiEgD8xjU5V0E08Dp5LadBIoFIgL36LkupGmifqO0MMjYFsr0ypkp1+JU4y9aPzOlLDqYG4AXsa/neqzeVVISs5Ad7uzPaTyV/yGjYn3p7N+c+u9pwVfeCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726750347; c=relaxed/relaxed;
	bh=YdfaTvkQDBi4PXl8ldsfHZrG66LfS85qUpPVnUW7PhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UCowwsA/l9uYX2+HoWVKqgwdUI4Qj7F2eoEC0D2Dcg00CqXf6hg8Lqukcs465pSZQdcdcNAnYSHmxvkjVkP6zegmVrw7L8LJnVSGFxSnljwH70c11C/EXyMUdcWWQzUoGs7SRhoHoSYoJzypDf3/MBL+zSLxdK/GeRqw5jINZeW2pjiQdPQYB9xr8dpPEJc+omx8BLhCCyb/kP09kXwQAU7TYsDHHy1GV9ohPwjjsRLt4Ftfv1evholoZ6ddXqumj8D9xWcbx45v/6bTmAgN3kIbe0+Mc67o0V8zXMg0M0D9sGd5OM0KjggNQ8+hFhKuWJ7GoWCgFmcxlDkKdSPAhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cEkP6PDQ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cEkP6PDQ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8b5Q3dgYz2yGd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 22:52:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726750342;
	bh=YdfaTvkQDBi4PXl8ldsfHZrG66LfS85qUpPVnUW7PhQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cEkP6PDQe/cGBgTv9xjFn5FgrS7hVSmWVy0zMzRWqw09WZXJO0jznZ8GNsNkK4Tud
	 lP3vMJ9RHxCdEFxHBY8sK6jHAtIV2x/sm5uYnl+1VdEn8W33TfUUNJc/EB2XgzVFFp
	 QulvhH0tGFKYz3ehJ1BRy6PmIgTt8oD6Fb6WB4gnqotpOWgM8zsEauceb4CzuY/dxO
	 QqgMehIOEd3FRkx9N1OK7ceGLK3yfe+j6kyvopQ3pE/1F/eUacccfnLtluJ88tYwhm
	 IZ0/jc9OWlX0UJOwL1T9CQDHLxnQbwogGSY6JOK/CCkNsRaAvPSXcT4XtqeTrr5fG3
	 A0v6Ki80FR4lQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8b5L1MZhz4x5M;
	Thu, 19 Sep 2024 22:52:21 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luming Yu <luming.yu@shingroup.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
Subject: Re: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
In-Reply-To: <040533E1233A67C4+ZuugYFMsPMaDAjI9@HX09040029.powercore.com.cn>
References: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
 <87wmj8pbte.fsf@mail.lhotse>
 <040533E1233A67C4+ZuugYFMsPMaDAjI9@HX09040029.powercore.com.cn>
Date: Thu, 19 Sep 2024 22:52:21 +1000
Message-ID: <87ldznreka.fsf@mail.lhotse>
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

Luming Yu <luming.yu@shingroup.cn> writes:
> On Thu, Sep 19, 2024 at 01:22:21PM +1000, Michael Ellerman wrote:
>> Luming Yu <luming.yu@shingroup.cn> writes:
>> > From: Yu Luming <luming.yu@gmail.com>
>> >
>> > ppc always do its own tracking for batch tlb.
>> 
>> I don't think it does? :)
>> 
>> I think you're referring to the batch handling in 
>> arch/powerpc/include/asm/book3s/64/tlbflush-hash.h ?
>> 
>> But that's only used for 64-bit Book3S with the HPT MMU.
>> 
>> > By trivially enabling
>> > the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
>> > common code in rmap and reduce overhead and do optimization it could not
>> > have without a tlb flushing context at low architecture level.
>> >
>> > Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
>> > ---
>> >  arch/powerpc/Kconfig                |  1 +
>> >  arch/powerpc/include/asm/tlbbatch.h | 30 +++++++++++++++++++++++++++++
>> >  2 files changed, 31 insertions(+)
>> >  create mode 100644 arch/powerpc/include/asm/tlbbatch.h
>> 
>> This doesn't build:
>> 
>>   https://github.com/linuxppc/linux-snowpatch/actions/runs/10919442655
>> 
>> Can you please follow the instructions here:
>> 
>>   https://github.com/linuxppc/wiki/wiki/Testing-with-GitHub-Actions
>> 
>> Which describe how to fork our CI tree that has Github Actions
>> preconfigured, then you can apply your patches on top and push to github
>> and it will do some test builds for you. Notably it will do 32-bit
>> builds which is what broke here.

> thanks, I will take a look and do this for next patch before posting on mailing list. :-)
> 
> Ideally it should also include qemu boot tests for targets that must work.
 
Those scripts do qemu boots of pseries p8/p9, powernv p8/p9, 44x,
e5500, g5, and mac99.

It doesn't boot full distros because that's too slow for Github Actions,
so it doesn't catch all bugs, but it's better than nothing.

> I think we could also need a powerpc yocto recipe as well to make
> patch test more customizable
> and reproducible than fedora/Debian distro. I've been searching for it
> for a while, but I couldn't find a useful one. Maybe I need to come up
> one of my own to facilitate the ci test bot ideas.

I've never used Yocto, not sure if it does/did support powerpc.

Buildroot can build powerpc images with lots of packages included.

cheers

