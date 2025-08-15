Return-Path: <linuxppc-dev+bounces-11061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A98E7B28167
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Aug 2025 16:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c3PKs13Zgz3cgW;
	Sat, 16 Aug 2025 00:16:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755267377;
	cv=none; b=RTTs8WMQU0lBBGBRlz5w2oJ36AbFHjQLx2BxIjLtrluN5e+yxpnuUtd6vpS0VDKRg7kGe1+HvjXWSauS9SzGLM4tN9/S4zKRpPzXfqAuROw7g/Sz51R+3MnNeJjYan+JAl5uNlF20N4TljkyIcqLeHtAd9VrKd+nYYEBemui4g7aCPOzSkuBRxp99ErpiBMiOKCUs3EufRB+miQFtUlzVyvpgZGMggJ4/4keWdhx8zlgXC5OP6VEJovU1EqXSHQp6jKxxnvN3sXC7MK+0kg97bhX66pgJSbjHjPo6Nl65cMSsAvlQNGBwmYXPU1grwwLnXqqpdfJCO12UITGGxwlYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755267377; c=relaxed/relaxed;
	bh=XDxHrD3TX9AedrU5KLSEMO2f62ogJmkuypzBhYFI+es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY7KD3oGT76rY9vADGLg9aN4ChInWN8q730kv7RElv+w0Uiv+Po9ygg3f8rw9MuOjtgUDD2TUP64QR6Hh3nRINRGhGmi6Cqdxq/UkNuUlohxo45Vx5UVe5TZ1ktRFe4xWYtITNQyO1gO6FDCSPJoJc27mVrQsjlUonCW3mTNdJEuxf7nLgHbFqfOil81TXRmFneEDSYO8ePIBl/A+IymGht7F1omxf82nwIkRxUT4mjkQ10qjdJQzx03BQGgs/JwLWDehKF82jHsmLp3AkkzyHkQou1vA6SScQKAga0tq9nEpgBB5ZN1AhgqWpOg9Q0rjUHB4AMZ3m38+oYicuj/+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PQ0jZW3G; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PQ0jZW3G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c3PKn6LhCz3cgT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Aug 2025 00:16:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=XDxHrD3TX9AedrU5KLSEMO2f62ogJmkuypzBhYFI+es=; b=PQ0jZW3Gt/YKfyB7A9r1pgw76l
	rQduqzGPLkQ6qEnBZFb6+RR2IWvSJxDQkyXws/quSXO6w3t0Y/GauRAzWcz+vfu9vAXu8+r9WtEqz
	pO1M0U1IYfbHyn7ovx/CqXvlDxUowuK2hwhgEOC5/5/xSqZaGha3kCpLP1sWAyzpgpLxJ6kIeqhUy
	8N1Ntpnt10+ZtqxNTwXRffrvqjsxlIuwiaqwN4OZu95RYXqeHs6lc2RhU1zyeSMWjzT9B8d81/qL2
	S0LnmRilElUK6EZHNhjBzN7tq3Au2y7CfHhIfaYnLxoi+IPnPoi/JsU02NkSYL7vRkxf5Tryc4mth
	L8aoK0Tg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvDx-0000000Gje9-2EVx;
	Fri, 15 Aug 2025 14:16:05 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 83BC03002ED; Fri, 15 Aug 2025 16:16:04 +0200 (CEST)
Date: Fri, 15 Aug 2025 16:16:04 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <kees@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/17] Add __attribute_const__ to ffs()-family
 implementations
Message-ID: <20250815141604.GD3289052@noisy.programming.kicks-ass.net>
References: <20250804163910.work.929-kees@kernel.org>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 04, 2025 at 09:43:56AM -0700, Kees Cook wrote:
> Hi,
> 
> While tracking down a problem where constant expressions used by
> BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
> initializer was convincing the compiler that it couldn't track the state
> of the prior statically initialized value. Tracing this down found that
> ffs() was used in the initializer macro, but since it wasn't marked with
> __attribute_const__, the compiler had to assume the function might
> change variable states as a side-effect (which is not true for ffs(),
> which provides deterministic math results).
> 
> Add KUnit tests for the family of functions and then add __attribute_const__
> to all architecture implementations and wrappers.
> 
> -Kees
> 
> [1] https://github.com/KSPP/linux/issues/364
> 
> Kees Cook (17):
>   KUnit: Introduce ffs()-family tests
>   bitops: Add __attribute_const__ to generic ffs()-family
>     implementations
>   csky: Add __attribute_const__ to ffs()-family implementations
>   x86: Add __attribute_const__ to ffs()-family implementations
>   powerpc: Add __attribute_const__ to ffs()-family implementations
>   sh: Add __attribute_const__ to ffs()-family implementations
>   alpha: Add __attribute_const__ to ffs()-family implementations
>   hexagon: Add __attribute_const__ to ffs()-family implementations
>   riscv: Add __attribute_const__ to ffs()-family implementations
>   openrisc: Add __attribute_const__ to ffs()-family implementations
>   m68k: Add __attribute_const__ to ffs()-family implementations
>   mips: Add __attribute_const__ to ffs()-family implementations
>   parisc: Add __attribute_const__ to ffs()-family implementations
>   s390: Add __attribute_const__ to ffs()-family implementations
>   xtensa: Add __attribute_const__ to ffs()-family implementations
>   sparc: Add __attribute_const__ to ffs()-family implementations
>   KUnit: ffs: Validate all the __attribute_const__ annotations

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

