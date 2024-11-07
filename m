Return-Path: <linuxppc-dev+bounces-2971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC9F9C004F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 09:45:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkbHW5BfKz3bn8;
	Thu,  7 Nov 2024 19:45:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730969111;
	cv=none; b=iYg7yPI5Y63kpjR2qS4FxragmbmuAx8plTe8eljTfPMpuvgF7WBZS9Vtyr0AfwS3tW0YpF5qm6Ge8QYeVxym1Y17+nJmluUryVxLlbdlWlJOmdCXPteiTAmmvn7OgMxaCjB/5n5/Aty+lVCXuxWWhx4jja/2lqkjBdGy922O8wjVqxpNo5ohn1eGx+gWmMbKWlnlkewxtBWbXY+p3gJA5XbwWH5KWSwi1+l21OZQ1US2+rKV/oDAn+UHh8VAUxuJO0IK/gKnqKHi+WcM7U1OmdG6a8qlTaKZs5AL1wIXxYuw1t+mORQDkYfU9+ockjkEbKvg72COcEFND3AqyNiG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730969111; c=relaxed/relaxed;
	bh=xuCkB4IT45fiDSen6HBmo5m24raNgR0WbBheuYXHj48=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dcLOoDC7Ht2oMsimE/nN7pEFsorB7C2Ivu7Twb4KyEqGSRTuKWWYDvMrKGUUbIohJ089SrPVvf93/Snr+ogkoZpRfFqzVzly5p++sGhllHytDdx4wrMJ1IQ1E68Vp3evkyEEzXZePsHrJ12xuIcKB1jqGKYA3VNsyLbby4HXOId024DLLAGrKH5kx/emupM74aWNQll0cnF93z4d1WOQjR/FX0ZhVwP7bxLZQEITCKlJwWT4yf2rgLxM/EYDqfwe4AgfLgwRk1lpjXX6o9gK6gvo1NnAsQqMMDpEfZdFA16SLISYexvlAhKP+bN5dizNZRDF5ZymGt4/c2/rkkWLnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C1cGx6WA; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=C1cGx6WA;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkbHW06S1z3bmf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 19:45:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1730969099;
	bh=xuCkB4IT45fiDSen6HBmo5m24raNgR0WbBheuYXHj48=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=C1cGx6WA2WXIbxxPWljmss5H/ehl5/wsZCreilGCT2r1R4zjDYFGIUR055+yop2yW
	 hb4QjTjddYAkqDXUc9Er4C6ovWNKKgjRMWi4EAXDbxyitGBshec3/NAAvSVCJHFE/4
	 3Z5/jcV3MCYRQ2LMRqXk/wuJKXsInjvhDkw0jvQ46kBRpny6T0iY64CQ+RG9f9ky+u
	 X3/nWaqTzJTmz8EwOWVCkz4ZBXAvvRYb82Cxp2PrjkkjxLYLe5UJiWe2h7WD89elIh
	 bHYWvCVxiPzxixOWE7JKfAqfz2rpA43mLB6vJBE5tyDgS7Tr6XXvF7Jeel5/BSajmP
	 ZYWiJSmAqvOyw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XkbHH3whTz4x8f;
	Thu,  7 Nov 2024 19:44:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20241009051701.132282-1-mpe@ellerman.id.au>
References: <20241009051701.132282-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Drop IPI_PRIORITY from asm-offsets
Message-Id: <173096894646.18315.14561851107667021729.b4-ty@ellerman.id.au>
Date: Thu, 07 Nov 2024 19:42:26 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 09 Oct 2024 16:17:00 +1100, Michael Ellerman wrote:
> The last use of IPI_PRIORITY in asm was removed in commit 37f55d30df2e
> ("KVM: PPC: Book3S HV: Convert kvmppc_read_intr to a C function").
> 
> 

Applied to powerpc/next.

[1/1] powerpc/64: Drop IPI_PRIORITY from asm-offsets
      https://git.kernel.org/powerpc/c/5e296fc37e1afa3fb38b886fe2bf7737777d0f61

cheers

