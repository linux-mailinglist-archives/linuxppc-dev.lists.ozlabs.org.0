Return-Path: <linuxppc-dev+bounces-3378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1C19D03A9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjC0QVCz3blR;
	Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846334;
	cv=none; b=ist51OPrLKynr1nGZINYNDzLhowcJDnaCeQJKjQEwONkz5smwp8YVd6pyN97k4IDW32k2oNlbZzAKocjVu4ADI26yPzVTed8aJ7ZXmXHm79OvlZJpI9eur9LvXKeOTqm6e14KdcZFvruZvyWBedDFGJNom2zKJqKwMSDikzm/oCi3NGdaIR3CxF5Dw3BsrpYlHdP+xMRT7QLFxfDSn/KrgpVOmj1Hq33lYHXskUtUSEUKvNJSF9vrCF/LlODgKI2qeGX6WERRj9+4V5DMgErEIOCjZHOznn4zkB2U90D0BzQzP0E4oiIO1wyAoMcK1Hfxf51h6Zrib0rior0r+k/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846334; c=relaxed/relaxed;
	bh=HGgnCTCXwP4OrmTnK9Oqhd8tRZhqUQEP+dxgV3DGjeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U3F6V5OyTHaq+wy4EcfIJSkoC7Rt5lnZ6mLVKOJzeQzOB1RJfp4XDkSO1xHMZef1x3iC6YD+QPaOk5dGwRkr9kU+LcVp8CYPKm2e3BmOq0nKiJ/X1CR9fXGIAwyeYh5NbfeSIPaLIUB/pzxEORHAc4NhfaD1A4O++8zHaO5FvWrJGGh9Juq2Dp3IGnH8NIrh9PrQmM4aJqlE+5XOBEC8u0MSn7jXsriRZT77km1h3GSumxxx7xDUXLbXvru+ankifa2XkXzGrcmg8+CDyNiZFnPTjmqnrN8j8JeqRao1Pns4xjX4FV6L5YxuV97WSbZd9y96kILYTpClyfQIr5M7wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X3LV9JaN; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=X3LV9JaN;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqj93CBjz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846330;
	bh=HGgnCTCXwP4OrmTnK9Oqhd8tRZhqUQEP+dxgV3DGjeA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=X3LV9JaN9rgdcQyvGUysuOaglV2fBBnBa5ymXTkTxk3Wn4d02/dZHF5jS8b0QfDEo
	 l0T7uirI3xS7r9yLdsnh9i7ElxKN9C4TRtqRyEJTzANWgcLfBkxKOPCU/Kb23Hitdy
	 AJWvSSb1mbhpzVGMMSAQ6JtdSTnXQJTo5cWyjmf5fIOhuKc0sROYtubSSzFJuWdLck
	 gNeNH5BTnWDzmO4WQ5e3Pg9WF6ybC6HrHdW9ibzPbMXjbNLpIREfdfdbLVWG/MbTJv
	 4qN0iL75dhCjHbQfy/H3Uh9Ln5m97NjcPvBCacP4r0gM+hUfpdxf65KUhWXTz5SnYH
	 UjGS1M8B/mmag==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqj63CJdz4xfQ;
	Sun, 17 Nov 2024 23:25:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: arnd@arndb.de, nathan@kernel.org
In-Reply-To: <20241107112646.32401-1-mpe@ellerman.id.au>
References: <20241107112646.32401-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/Makefile: Allow overriding CPP
Message-Id: <173184539769.890800.9757249015382880714.b4-ty@ellerman.id.au>
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

On Thu, 07 Nov 2024 22:26:46 +1100, Michael Ellerman wrote:
> Unlike all other arches, powerpc doesn't allow the user to override CPP,
> because it sets it unconditionally in the arch Makefile. This can lead
> to strange build failures.
> 
> Instead add the required flags to KBUILD_CPPFLAGS, which are passed
> to CPP, CC and AS invocations by the generic Makefile logic.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/Makefile: Allow overriding CPP
      https://git.kernel.org/powerpc/c/a5371018eefdd81f4152926a6d2b9480a75ac2a6

cheers

