Return-Path: <linuxppc-dev+bounces-3367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE69C9D0390
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:26:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqht2C6fz2ytm;
	Sun, 17 Nov 2024 23:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846318;
	cv=none; b=ikTRvmXgF7NsX94ZGdKrOWmT4ZtvV6Sygb/QkUfRgh6GFzy3oRZUptR1wjiVkuToPhzXwp+I/Anqs8ko3JahVzrYYgzjCfPdzQ6tn33761ZEeoHQTODjfrIXQWoMieoekhK7LZqMGhadWYOthL1t62Pz41mhj6vcJAMBhHR6/IOCkzNZcJ1z7F3z92PFrOK5nKGz2Ek5hfrFA39lsUeaPWkoxZ/3HnSN5UUBSrrMkv8V8nEclQH0Efx86YuaIbrqbCt31yLSHewbMPJa7UTTxXBvzbsWSnVCzTivmm7DQl41ADRGIPS8zbrhn6EEbJFDEfa2MAtMd/0Y9SCGX893QA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846318; c=relaxed/relaxed;
	bh=jz791sS+NK3Na/jj4ifogAgINHbZs4h/a9Lbtzcsx+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DSyJ6QTCMv4LebFnpvBNE2J533085CyDO8CGo/sCj701GI2KGFPezkp051Wisqxm3/e+xnaZuDuq8pj9ByorJJCymr4XVR3rFOZHVxAnHWRg7+MLb7HdRtfIxi6JQ05TV9RSe3mJiUaVsIt/lYaAHUpGBYU6yhq++T5bvlWF/HTcvGp8MkNLkUzD/LC4SuPGrYMS+Sxb7gDw34yO+F/ljV+AZ69ILsMJu0OMbPyB57YvM+XcIXSRbhuNLv+hRIxUF6QQySVQXNWGI8cJcRNFvF9A03Ho44QlJs378WsTqoNYmx63pt9kx991pq7QkgBlx7yehImIVVaN1JEfF7urxA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mZ+nMSpg; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mZ+nMSpg;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhs2mMrz3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846314;
	bh=jz791sS+NK3Na/jj4ifogAgINHbZs4h/a9Lbtzcsx+4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mZ+nMSpgx3NecPPnFTZbYEFzlJCfDyvIlPRQ33sE3+IPoJuaEXaPnvXmBHNvHzNqL
	 k+6x5hNLqjI5Cy3H8PjAl0RNCrlNUOEi2wNvHWQOBQFaBaitj6IWKDYqyxA8SJQCBN
	 JjZ+5BR8TKxujLwiIMZB7Bjlr37/2NZM78AcGn49/1fbsWvbf6tIiXg+yeyn0wEp41
	 sub1Y0Dv2ttPSDri+88HzQ75wA2huyJGdldExkBd2pDxdYWItNGwAO9s08iXZZUzPB
	 nnRmQfOmB+ZkfGLLzXtZqdh4/jO30NeRC3hlMEM8Y63WwJNh4rFIP3wG17n6ePkVtd
	 fkaVOAWb/jk/g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhp2R7Fz4xf4;
	Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Simon Horman <horms@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20241014-ep8248e-pa-fmt-v1-1-009ea0dcc18f@kernel.org>
References: <20241014-ep8248e-pa-fmt-v1-1-009ea0dcc18f@kernel.org>
Subject: Re: [PATCH] powerpc/ep8248e: Use %pa to format resource_size_t
Message-Id: <173184539761.890800.204622629429690296.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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

On Mon, 14 Oct 2024 11:55:03 +0100, Simon Horman wrote:
> The correct format string for resource_size_t is %pa which
> acts on the address of the variable to be formatted [1].
> 
> [1] https://elixir.bootlin.com/linux/v6.11.3/source/Documentation/core-api/printk-formats.rst#L229
> 
> Introduced by commit 9d9326d3bc0e ("phy: Change mii_bus id field to a string")
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/ep8248e: Use %pa to format resource_size_t
      https://git.kernel.org/powerpc/c/bfd9c145533ba9cb6f504670aa8e75542c8ee54f

cheers

