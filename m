Return-Path: <linuxppc-dev+bounces-1112-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEBE96F3BF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRp2Nh7z30NP;
	Fri,  6 Sep 2024 21:55:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623734;
	cv=none; b=Zi/O332PnzJI5KvCtmbliZBTX680rCMvoELr5TNK3PkjcMHTIpnDmpckskpdMFCzla2dHQDtbu4dy08OnhRbfaxYn2Gy1Xobksl3IB6t6HoCpN0ektteOgOCUJRReex4OUS6RlKsmy0wyeI8CnIdninnNjir4c5+tQsKfKPn2p5N1/iUjAN6qtx+cvgZO0SIZ2zQGjJADntW5YE/oKJgG6kPdJtRUlZ8aMtRTbJQVQsHxZ+plJbShUcaZGZn7Dmp0KERW1clSIZ3qDpBf1uW4HvuRaITOwqWUmBCIKasREkvIRdjjQc77LSf6gG8KLR0ZxKSzU/mFz+urr+jD4CM2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623734; c=relaxed/relaxed;
	bh=4bG/qw/te9D/TKEgsI8s5Qxc9BCTjNC5kN7Z76OZy7o=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=dYeeWB5FmzlZZx8C2fPeim7izOLzu8Bs+xY/4rw5rvDOuMaUuGY/iy7y8BcTD5VwnYQh5P5dCnLLdr/YGCuT6n5sJjYeVeaM9yx6vgmPmOVLj4QnFzFDP7N+PhPVhnTAD4ZXNjnU/G4PouwpY7/c0uZPfnF/gSyFNgWghJsNUXxrzNfciUKJXujOoNYrm7QhfOPypPywu60/xYpuAI/cj49wnPObYAcdijBVP1aphm3v/p4AMmXpy83WVHrqVB0APtC1jWaCyX53+TYF+v+P2NVyr+FSFG6Kkftrmpl7t9dJ3+cngd4oc8H805v6LOi9Un9nae8FdaynRnZClzf6/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X2R5ny3Q; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X2R5ny3Q;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRp2BVcz30J8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623734;
	bh=4bG/qw/te9D/TKEgsI8s5Qxc9BCTjNC5kN7Z76OZy7o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X2R5ny3QA5RsLYRQTb9ja8oF49nBpCpuq0YYeYsJmldCw8hOeyXkCWtqDxOPjehxc
	 aDNIOlhmZmKpIvdkxJ8GV8e4GMtG27o2z+rLppC/SmblNjvNM96kUKmSL6P2XjUk1A
	 YRzS1mBsI6FenunUBNneX82c7WPNVzJZgUyHo9uy376C+78lg075Tf82anm0C+1d5D
	 RTB1YE0n9tzOCFRFMx/+7XuRXy8qfewhwo6spLOATmP/FUW2nx1GbWkt8rHKzWCx9B
	 dvHiM8NeS8+KtKEqFq5E6cxnMcBviOG89OPVa3DGbBlyWU4T7yXoE2cMol+3R63Hoi
	 4SkJ+iTm2HuDQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRp0qfdz4x89;
	Fri,  6 Sep 2024 21:55:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20240826064217.46658-1-maddy@linux.ibm.com>
References: <20240826064217.46658-1-maddy@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/xmon: Fix tmpstr length check in scanhex
Message-Id: <172562357188.467568.1682181691215108322.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:51 +1000
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

On Mon, 26 Aug 2024 12:12:17 +0530, Madhavan Srinivasan wrote:
> If a function name is greater than 63 char long, xmon command
> may not find them. For example, here is a test that
> executed an illegal instruction in a kernel function and one of
> call stack function has name >63 char long,
> 
> cpu 0x0: Vector: 700 (Program Check) at [c00000000a6577e0]
>     pc: c0000000001aacb8: check__allowed__function__name__for__symbol__r4+0x8/0x10
>     lr: c00000000019c1e0: check__allowed__function__name__for__symbol__r1+0x20/0x40
>     sp: c00000000a657a80
>    msr: 800000000288b033
>   current = 0xc00000000a439900
>   paca    = 0xc000000003e90000	 irqmask: 0x03	 irq_happened: 0x01
> .....
> [link register   ] c00000000019c1e0 check__allowed__function__name__for__symbol__r1+0x20/0x40
> [c00000000a657a80] c00000000a439900 (unreliable)
> [c00000000a657aa0] c0000000001021d8 check__allowed__function__name__for__symbol__r2_resolution_symbol+0x38/0x4c
> [c00000000a657ac0] c00000000019b424 power_pmu_event_init+0xa4/0xa50
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xmon: Fix tmpstr length check in scanhex
      https://git.kernel.org/powerpc/c/0405e128110d47a40443936e68dc32d7bc4ccc0b

cheers

