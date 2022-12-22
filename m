Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C1665459A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 18:22:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdHFJ0FQcz3bVD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 04:22:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=oaxbYeHT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=oaxbYeHT;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NdHDL6RGzz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Dec 2022 04:21:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FB2361CC7;
	Thu, 22 Dec 2022 17:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A31C433D2;
	Thu, 22 Dec 2022 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1671729708;
	bh=gMuNx/ETzj/pkU8IgNrRcwRUZ5VOS050gceZG8hotd0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oaxbYeHTTs0NTDHc1u4zsA/7HQBinJcPSMs3s/KVnxc//k0Ntz1pPgpR2Dmr88gAU
	 WZZBXxDL6Tc0QjJMc73INnk/0KOkuFbF7iNB59sbgWiBpJYnibIJSSo4sqTI8wPaJQ
	 JdMD0wV8Cbb5JpT60P63Yh/T9dCr1NIuxhm2H/M4=
Date: Thu, 22 Dec 2022 09:21:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Message-Id: <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org, Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org, openrisc@lists.librecores.org, loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Dec 2022 12:46:16 +0100 Andrzej Hajda <andrzej.hajda@intel.com> wrote:

> Hi all,
> 
> I hope there will be place for such tiny helper in kernel.
> Quick cocci analyze shows there is probably few thousands places
> where it could be useful.

So to clarify, the intent here is a simple readability cleanup for
existing open-coded exchange operations.  The intent is *not* to
identify existing xchg() sites which are unnecessarily atomic and to
optimize them by using the non-atomic version.

Have you considered the latter?

> I am not sure who is good person to review/ack such patches,

I can take 'em.

> so I've used my intuition to construct to/cc lists, sorry for mistakes.
> This is the 2nd approach of the same idea, with comments addressed[0].
> 
> The helper is tiny and there are advices we can leave without it, so
> I want to present few arguments why it would be good to have it:
> 
> 1. Code readability/simplification/number of lines:
> 
> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> -       previous_min_rate = evport->qos.min_rate;
> -       evport->qos.min_rate = min_rate;
> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);
> 
> For sure the code is more compact, and IMHO more readable.
> 
> 2. Presence of similar helpers in other somehow related languages/libs:
> 
> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>     helper (__xchg(&x, 0)), which is the same as private helper in
>     i915 - fetch_and_zero, see latest patch.
> b) C++ [2]: 'exchange' from utility header.
> 
> If the idea is OK there are still 2 qestions to answer:
> 
> 1. Name of the helper, __xchg follows kernel conventions,
>     but for me Rust names are also OK.

I like replace(), or, shockingly, exchange().

But...   Can we simply make swap() return the previous value?

	previous_min_rate = swap(&evport->qos.min_rate, min_rate);


