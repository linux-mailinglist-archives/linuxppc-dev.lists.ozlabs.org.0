Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 942A04C3356
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 18:16:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4KMH6Svhz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 04:16:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K4KLp5ykWz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 04:16:18 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21OHC9uw018499;
 Thu, 24 Feb 2022 11:12:09 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21OHC8Yn018496;
 Thu, 24 Feb 2022 11:12:08 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 24 Feb 2022 11:12:07 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
Message-ID: <20220224171207.GM614@gate.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645678884.dsm10mudmp.astroid@bobo.none>
User-Agent: Mutt/1.4.2.3i
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 24, 2022 at 03:05:28PM +1000, Nicholas Piggin wrote:
> + * gcc 10 started to emit a .machine directive at the beginning of generated
> + * .s files, which overrides assembler -Wa,-m<cpu> options passed down.
> + * Unclear if this behaviour will be reverted.

It will not be reverted.  If you need a certain .machine for some asm
code, you should write just that!

> +#ifdef CONFIG_CC_IS_GCC
> +#if (GCC_VERSION >= 100000)
> +#if (CONFIG_AS_VERSION == 23800)
> +asm(".machine any");
> +#endif
> +#endif
> +#endif
> +#endif /* __ASSEMBLY__ */

Abusing toplevel asm like this is broken and you *will* end up with
unhappiness all around.


Segher
