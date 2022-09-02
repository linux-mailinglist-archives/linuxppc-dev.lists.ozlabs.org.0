Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00A5AB692
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 18:30:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK3Kj2VXrz3c4Q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 02:30:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MK3KF316wz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 02:29:37 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 282GRT1B016993;
	Fri, 2 Sep 2022 11:27:29 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 282GRS0W016992;
	Fri, 2 Sep 2022 11:27:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 2 Sep 2022 11:27:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/math-emu: Remove -w build flag and fix warnings
Message-ID: <20220902162728.GS25951@gate.crashing.org>
References: <a7384eafc6a27aea15bdc9e8f9a12aac593fccb7.1662113301.git.christophe.leroy@csgroup.eu> <35c86b7ca823954c6cd593acc3690dc3748da9b1.1662113301.git.christophe.leroy@csgroup.eu> <YxIjM/jdLajq4dFk@dev-arch.thelio-3990X> <20220902155954.GP25951@gate.crashing.org> <YxIrRJz3+fkzogay@dev-arch.thelio-3990X>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxIrRJz3+fkzogay@dev-arch.thelio-3990X>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Fri, Sep 02, 2022 at 09:11:48AM -0700, Nathan Chancellor wrote:
> On Fri, Sep 02, 2022 at 10:59:54AM -0500, Segher Boessenkool wrote:
> > Maybe add -Wno-implicit-fallthrough?  This code is a copy from outside
> > the kernel, no one has ever wanted to maintain it, if nothing else (the
> > more politically correct formulation is "we cannot as easily pick up
> > improvements from upstream if we modify stuff").
> 
> Sure, we could do something like this if you preferred:
> 
> diff --git a/arch/powerpc/math-emu/Makefile b/arch/powerpc/math-emu/Makefile
> index 26fef2e5672e..ed775747a2a5 100644
> --- a/arch/powerpc/math-emu/Makefile
> +++ b/arch/powerpc/math-emu/Makefile
> @@ -16,3 +16,7 @@ obj-$(CONFIG_SPE)		+= math_efp.o
>  
>  CFLAGS_fabs.o = -fno-builtin-fabs
>  CFLAGS_math.o = -fno-builtin-fabs
> +
> +ifdef CONFIG_CC_IS_CLANG
> +ccflags-remove-y := $(CONFIG_CC_IMPLICIT_FALLTHROUGH)
> +endif

That is a GCC warning as well.  It needs some $(call cc-option ...)
thing then, though (GCC versions of more than two or so years ago are
supported as well).

> At the same time, I see other modifications to these files that appear
> to be for the kernel only so I suspect that this is already in the "we
> cannot as easily pick up improvements from upstream" category,
> regardless of that diff.

So maybe someone should really maintain this stuff, bring it up to some
reasonably modern state?  :-)


Segher
