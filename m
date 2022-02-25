Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE04C51A0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 23:37:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K54RM2Wvyz3cH2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 09:37:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4K54Qy1Fysz2ymc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 09:37:29 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 21PMXKWJ022487;
 Fri, 25 Feb 2022 16:33:20 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 21PMXJBw022486;
 Fri, 25 Feb 2022 16:33:19 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 25 Feb 2022 16:33:19 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] powerpc: fix build errors
Message-ID: <20220225223319.GT614@gate.crashing.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
 <20220223135820.2252470-2-anders.roxell@linaro.org>
 <1645670923.t0z533n7uu.astroid@bobo.none>
 <1645678884.dsm10mudmp.astroid@bobo.none>
 <20220224171207.GM614@gate.crashing.org>
 <1645748601.idp48wexp9.astroid@bobo.none>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645748601.idp48wexp9.astroid@bobo.none>
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

On Fri, Feb 25, 2022 at 10:32:02AM +1000, Nicholas Piggin wrote:
> Excerpts from Segher Boessenkool's message of February 25, 2022 3:12 am:
> > On Thu, Feb 24, 2022 at 03:05:28PM +1000, Nicholas Piggin wrote:
> >> + * gcc 10 started to emit a .machine directive at the beginning of generated
> >> + * .s files, which overrides assembler -Wa,-m<cpu> options passed down.
> >> + * Unclear if this behaviour will be reverted.
> > 
> > It will not be reverted.  If you need a certain .machine for some asm
> > code, you should write just that!
> 
> It should be reverted because it breaks old binutils which did not have
> the workaround patch for this broken gcc behaviour. And it is just
> unnecessary because -m option can already be used to do the same thing.
> 
> Not that I expect gcc to revert it.

Nothing will happen if you do not file a bug report.  And do read the
bug reporting instructions first please.

> >> +#ifdef CONFIG_CC_IS_GCC
> >> +#if (GCC_VERSION >= 100000)
> >> +#if (CONFIG_AS_VERSION == 23800)
> >> +asm(".machine any");
> >> +#endif
> >> +#endif
> >> +#endif
> >> +#endif /* __ASSEMBLY__ */
> > 
> > Abusing toplevel asm like this is broken and you *will* end up with
> > unhappiness all around.
> 
> It actually unbreaks things and reduces my unhappiness.

It is broken.  You will need -fno-toplevel-reorder, and you really do
not want that, if you *can* use it in the kernel even.

> It's only done 
> for broken compiler versions and only where as does not have the 
> workaround for the breakage.

What compiler versions?  Please file a PR.


Segher
