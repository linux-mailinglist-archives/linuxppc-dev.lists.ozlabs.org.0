Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B56A1E204F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 13:02:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WWJ14gLxzDqPj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 21:02:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=vt5WbMWz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WWG33FgnzDqDc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 21:00:26 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11BA12084C;
 Tue, 26 May 2020 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590490824;
 bh=W+yADIr6cx+w8qOoQumX4ZVB1TVjc19ruDQ1PWLl28I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vt5WbMWzXjehA4waBQOmrw7WLh+CtEoSxwGAAUyXopo0qVpcSqNLY8no2gOSz6N+R
 AnkU44LcCC0h+PEDfKOk6lAJOo4P7UmrBJVkcrxt/yl5knBJ28pmjqCXH26MePMXfW
 fuI/PUq54l4wosco1j7MtzMuGpYFPTAkxpgT1IEc=
Date: Tue, 26 May 2020 13:00:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Santosh Sivaraj <santosh@fossix.org>
Subject: Re: [PATCH v4 3/6] asm-generic/tlb, arch: Invert
 CONFIG_HAVE_RCU_TABLE_INVALIDATE
Message-ID: <20200526110022.GB2838783@kroah.com>
References: <20200520083025.229011-1-santosh@fossix.org>
 <20200520083025.229011-4-santosh@fossix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520083025.229011-4-santosh@fossix.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 02:00:22PM +0530, Santosh Sivaraj wrote:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> commit 96bc9567cbe112e9320250f01b9c060c882e8619 upstream
> 
> Make issuing a TLB invalidate for page-table pages the normal case.
> 
> The reason is twofold:
> 
>  - too many invalidates is safer than too few,
>  - most architectures use the linux page-tables natively
>    and would thus require this.
> 
> Make it an opt-out, instead of an opt-in.
> 
> No change in behavior intended.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: <stable@vger.kernel.org> # 4.19
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> [santosh: prerequisite for upcoming tlbflush backports]
> ---
>  arch/Kconfig         | 2 +-
>  arch/powerpc/Kconfig | 1 +
>  arch/sparc/Kconfig   | 1 +
>  arch/x86/Kconfig     | 1 -
>  mm/memory.c          | 2 +-
>  5 files changed, 4 insertions(+), 3 deletions(-)

Why did you not also change arch/arm64/Kconfig and
include/asm-generic/tlb.h like the original patch changed?

Why can those files be ignored/left out?  You need to explain that in
the backport section, all you said was "prerequisite..." and did not say
why you changed this patch.

Please fix up, and make sure you do the same for all of the other
patches in this series for when you resend it.

thanks,

greg k-h
