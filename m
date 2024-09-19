Return-Path: <linuxppc-dev+bounces-1447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E66997C318
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 05:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8LRl0cBRz2y8V;
	Thu, 19 Sep 2024 13:22:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726716147;
	cv=none; b=TJQBY1UtP5MvgL8SqzO6a362YJBgQW2N2saMtXQLfVyWVZB6isPHk4lTvFlCvMAiaebQ4LE4wMKxuaVnl1sf+Xq2+J1ABcfeIwyA0HX31fsJLKEO2J0bPqQTemr4D5qdw94UPUG85NYsA/eq/c0rj74nz/j2RiBhIj2qEPLY4HaX2/BzBOJmvxKxWt03XsEMMPy7VNc9Yaofrh1bgJH+alrEbV71lpNzm33zyqguAilaGwTf5W8Z0bu2xkPNFFKcjyGfrJqvGQ2SyFwo4qd8X7U1sbBAzrf7ODYdMmowwPwtelQfpuqfx2ZVE5eADb5LsgXggCEYKMe6PJ9zd8SkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726716147; c=relaxed/relaxed;
	bh=c8VbFbjPDCjQdNyPpd7p1p2RZzRMh7jmSHZ4g7e58ow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HycQYOgO9gNBscq7sPhsSdW4z1RrumIhq468pH9DHjxTtESTmLgwbWLUdqDWvBFu+OQkF0x0WO287nh/BQIoFwYIKZbZ9J9e4La6O50b2sMAd/N/p4Bj5g38QostnZSqtfbHvnaCkZvDi9T+pO2EmcDD2rK1GP/e2zgkBnRjDSYW1GO2wf8Ydt4OdWZSZq7PMr21SiMRk0kDXJgyW19+II7fvzmBGV7fIJ8ybeeSvPb4QHdgN1Sd8DPtKphmvh6HXqFs8CMVwhBqzuZGYyljKjFjOcr0PVL9fhxIs84fKjx+NwrZiiwa98hGKI2OoJd5j66TSzzzfFmelohPhgRvgg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VZET/QVX; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VZET/QVX;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8LRk0lM4z2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 13:22:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1726716145;
	bh=c8VbFbjPDCjQdNyPpd7p1p2RZzRMh7jmSHZ4g7e58ow=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VZET/QVX0x8oS3aYNgKSxqmq8PZ7vtmyTG7ucf9sMvtCLJkEghkAhkhPGvtZG+VZN
	 O+PX8AdCfwZqWUT+fPnFkoa+dRa6d4x1UKR9y6SZqDgt/Y6YQlr01LjZP1LbLjBfLX
	 BKd5VD0MMFNUOfWWLcaoDGosfDuEV4snljAr/fUNy8MimHbynSF2BYYf9bpkHy+6vN
	 5JqftDQEtxcgowRDreE8KHUKYfB5t/jHBFFOBfGcQ6wDNsngft20ZfKPsCbEPJD3UM
	 NfbCIRBZ7EkyU1o4fWY97O7AhpNA5BvJKBL8cv8iSpD+3WMz8MN+aSrbXOo7y8YoiF
	 CF/PegYVWUE0Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X8LRj5mQxz4xWZ;
	Thu, 19 Sep 2024 13:22:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
Cc: Luming Yu <luming.yu@shingroup.cn>
Subject: Re: [RFC PATCH] powerpc/tlb: enable arch want batched unmap tlb flush
In-Reply-To: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
References: <9BC3D1299ECE8428+20240918092515.2121-2-luming.yu@shingroup.cn>
Date: Thu, 19 Sep 2024 13:22:21 +1000
Message-ID: <87wmj8pbte.fsf@mail.lhotse>
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
> From: Yu Luming <luming.yu@gmail.com>
>
> ppc always do its own tracking for batch tlb.

I don't think it does? :)

I think you're referring to the batch handling in 
arch/powerpc/include/asm/book3s/64/tlbflush-hash.h ?

But that's only used for 64-bit Book3S with the HPT MMU.

> By trivially enabling
> the ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH in ppc, ppc arch can re-use
> common code in rmap and reduce overhead and do optimization it could not
> have without a tlb flushing context at low architecture level.
>
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>  arch/powerpc/Kconfig                |  1 +
>  arch/powerpc/include/asm/tlbbatch.h | 30 +++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 arch/powerpc/include/asm/tlbbatch.h

This doesn't build:

  https://github.com/linuxppc/linux-snowpatch/actions/runs/10919442655

Can you please follow the instructions here:

  https://github.com/linuxppc/wiki/wiki/Testing-with-GitHub-Actions

Which describe how to fork our CI tree that has Github Actions
preconfigured, then you can apply your patches on top and push to github
and it will do some test builds for you. Notably it will do 32-bit
builds which is what broke here.

cheers

