Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9801F540220
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 17:08:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHYfG4GwDz3bsl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 01:08:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHYdn5lZHz308m
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jun 2022 01:08:27 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 257F47UF002507;
	Tue, 7 Jun 2022 10:04:08 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 257F46r6002505;
	Tue, 7 Jun 2022 10:04:06 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 7 Jun 2022 10:04:06 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: outside array bounds error on ppc64_defconfig, GCC 12.1.0
Message-ID: <20220607150406.GF25951@gate.crashing.org>
References: <YpbUcPrm61RLIiZF@debian.me> <87mtepns81.fsf@mpe.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mtepns81.fsf@mpe.ellerman.id.au>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Yang Li <yang.lee@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 07, 2022 at 12:05:18PM +1000, Michael Ellerman wrote:
> > arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside array bounds of 'union <anonymous>[1]' [-Werror=array-bounds]
> >   287 |                 up[3] = tmp;
> >       |                 ~~~~~~^~~~~
> 
> This happens because we have a generic byte reverse function
> (do_byte_reverse()), that takes a size as a parameter. So it will
> reverse 8, 16, 32 bytes etc.
> 
> In some cases the compiler can see that we're passing a pointer to
> storage that is smaller than 32 bytes, but it isn't convinced that the
> size parameter is also smaller than 32 bytes.
> 
> Which I think is reasonable, the code that sets the size is separate
> from this code, so the compiler can't really deduce that it's safe.
> 
> I don't see a really simple fix. I tried clamping the size parameter to
> do_byte_reverse() with max(), but that didn't work :/

-Wno-error or at least -Wno-error=array-bounds is a good, simple fix.


Segher
