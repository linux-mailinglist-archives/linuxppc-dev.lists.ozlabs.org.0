Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B717258EDD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Aug 2022 16:04:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2sB75TVtz3bln
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 00:04:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M2s9k3D9lz2xmn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Aug 2022 00:03:53 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 27ADuNcA006903;
	Wed, 10 Aug 2022 08:56:23 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 27ADuLhX006902;
	Wed, 10 Aug 2022 08:56:21 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 10 Aug 2022 08:56:21 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCHv3, resend] powerpc: mm: radix_tlb: rearrange the if-else block
Message-ID: <20220810135621.GX25951@gate.crashing.org>
References: <20220810114318.3220630-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810114318.3220630-1-anders.roxell@linaro.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev, ndesaulniers@google.com, linux-kernel@vger.kernel.org, nathan@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Aug 10, 2022 at 01:43:18PM +0200, Anders Roxell wrote:
> Clang warns:
> 
> arch/powerpc/mm/book3s64/radix_tlb.c:1191:23: error: variable 'hstart' is uninitialized when used here [-Werror,-Wuninitialized]
>                                 __tlbiel_va_range(hstart, hend, pid,
>                                                   ^~~~~~
> arch/powerpc/mm/book3s64/radix_tlb.c:1175:23: note: initialize the variable 'hstart' to silence this warning

This note often is bad advice: hiding problems instead of investigating
and solving them.  Bah.

If silencing warnings is your goal, look no further than "-w" :-)

> Rework the 'if (IS_ENABLE(CONFIG_TRANSPARENT_HUGEPAGE))' so hstart/hend
> always gets initialized, this will silence the warnings. That will also
> simplify the 'else' path. Clang is getting confused with these warnings,
> but the warnings is a false-positive.

If it is, please report that bug to clang?  It says "*is* uninitialized
when used here", there can not be false positives to statements like
that.  If the analysis was heutistical it should say "may be" or such.


Segher
