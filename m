Return-Path: <linuxppc-dev+bounces-1113-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7924C96F3C1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRp5P8Rz30RK;
	Fri,  6 Sep 2024 21:55:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623734;
	cv=none; b=N7Q8kekzByLlLDf9wzdhpP3/Cjcrc/NPDYO0uDiuDlsogtvN5Ml5up2qD5BPpGMGMgjrIrZ1mZl3O+0loD2fUhhLUFCJqyA/lqqt0o+wnO7V81hZcOYNiV/QoIIHvw3RvQ/T1e5IJwQIydo3Rgki4FJP6oCo/G8/Vz+MgsG5CcZSNlKZUlBQVggfAU8ysmwDQ7afVYn2tmxNQKx0KYKxVvuO8FPoRRcc3TmPlSPGBtMXTO5oCmfYG1IadAq1D5qOnASWsx8BiINIkEzVomIZ+d/dWPKgI83vco8drdrvwwCR9wuU+Tdd7Fp1e+kTxpjnf7DTepCpLXl4NQpLODIfvg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623734; c=relaxed/relaxed;
	bh=HbLSLDwtNtHBvubA7eoLA/XeUtucQLAa2/TXy3ZwGRQ=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=YCiFfToC4HezDHHXpJByWCHlguQtWekpOT/VTZA1kAH+hAnJougIaR6dVxa4BfBYfgX5qKLzLfQoKFxco0g04TTyvoPQro/w62iqj5N5sd1Z5q7yz6jj5ywN/5L5gvXLCYXqXh5PXDuMwf5M8N/abmOaT2m0JwXMX492pypLglqA96W/Hdj9Q1jkMeu2Ifksxun07ahzsEfvyreax2kiDy/PlUWGklI0qJ7SmJo7R/K+c1PU+tHdYNZulrtmReRqI/9EZoj8QnpNACJKsIQljhiSh/3WHew9Zt+b/io0qnLH7AU1Q/3kPoMejOUOlACAlvjc/64KRhjGEHUVfhyiDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rgu0NKxJ; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rgu0NKxJ;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRp5Ckvz30Np
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623734;
	bh=HbLSLDwtNtHBvubA7eoLA/XeUtucQLAa2/TXy3ZwGRQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rgu0NKxJgrGyefSWAvTmKS7gaFjEvGkpgeswCpQ4RlVDhgWR54/hPjyotar8JmIbF
	 MX2/ArJ+qwgFlVfD/jySUXj/EjpygJyddqRqTiUmyr8eyMGpg4MNCQCazJRefULYxr
	 T0fpV0w/axyqLpFAZ1iH2pfEu/Wa7m0yYNfS7LjJSSLN0flRk1ZGBz9KRxLpU7yMMZ
	 ilzjEyPxaLnbOdc5x3ADIwkWmnP2WJQtGY1zfOVbXjJ/OngDlE5kRz6zFbI9x/psgy
	 QwS7aWtO3DvjsbCZ7gk5N7uTlgYUOZNx968n2ueaPn/bo4UXIlfgJ2uAN5GX6jOCO3
	 daFHgBHJQDxew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRp4Bqqz4x3q;
	Fri,  6 Sep 2024 21:55:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Cc: aneesh.kumar@kernel.org
In-Reply-To: <20240823032911.1238471-1-mpe@ellerman.id.au>
References: <20240823032911.1238471-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/mm/64s: Move THP reqs into a separate symbol
Message-Id: <172562357218.467568.14363675526657403608.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
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

On Fri, 23 Aug 2024 13:29:10 +1000, Michael Ellerman wrote:
> Move the Kconfig symbols related to transparent hugepages (THP) under a
> separate config symbol, separate from CONFIG_PPC_BOOK3S_64.
> 
> The new symbol is automatically enabled if CONFIG_PPC_BOOK3S_64 is
> enabled, so there is no behaviour change, except for the existence of
> the new PPC_THP symbol.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/mm/64s: Move THP reqs into a separate symbol
      https://git.kernel.org/powerpc/c/f61d413a1c1feaa4cd04fca840564ab90124bec4
[2/2] powerpc/mm/64s: Restrict THP to Radix or HPT w/64K pages
      https://git.kernel.org/powerpc/c/87def77bb5f4b61d47538a34bb2b2cb7db3c037b

cheers

