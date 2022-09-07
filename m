Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6F35B08AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 17:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN5xD6fk2z304n
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 01:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qt/Chd6D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qt/Chd6D;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN5wY4r65z304n
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 01:37:17 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5228061991;
	Wed,  7 Sep 2022 15:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922C8C433D6;
	Wed,  7 Sep 2022 15:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662565031;
	bh=vtoi41T7HL2fEFTBKkEZXYNHSG++nCpiruoytw57su0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qt/Chd6DIwyNMDkjUi5IOPkN6GQvt2AYAxPCoVhtRe1zeQC+JnK7ctjaPQuQd9gm+
	 nd5t/wg9rwttPvIVgLMqYAprzufEM3fjNJSzvdjHzI8Y3cFXgsEpFehvUIUt+ihxNW
	 CVB2w9tQ7omCtkZbLLZ6q2z49Gg2lDRchEFGgQM1ANsXkLxcEtYDoGBTI0kpU/yKrC
	 dYD3Z2ivMzvn67vJOPDGWRPUkeFvOCarYAUZDuyQhsBPMmtiaysN4FMOCNDUQIBWAS
	 qLvrPwrmOF08nHqZIkHq/JD1VJp4ysixp6C/kBPupDX5jM2wvSfv5I7I2uKdFoiuMN
	 NARJUMj/LhAXw==
Date: Wed, 7 Sep 2022 08:37:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Fix plpks crash on non-pseries
Message-ID: <Yxi6pZf7M8LFeIAw@dev-arch.thelio-3990X>
References: <20220907065038.1604504-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220907065038.1604504-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 07, 2022 at 04:50:38PM +1000, Michael Ellerman wrote:
> As reported[1] by Nathan, the recently added plpks driver will crash if
> it's built into the kernel and booted on a non-pseries machine, eg
> powernv:
> 
>   kernel BUG at arch/powerpc/kernel/syscall.c:39!
>   Oops: Exception in kernel mode, sig: 5 [#1]
>   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
>   ...
>   NIP system_call_exception+0x90/0x3d0
>   LR  system_call_common+0xec/0x250
>   Call Trace:
>     0xc0000000035c3e10 (unreliable)
>     system_call_common+0xec/0x250
>   --- interrupt: c00 at plpar_hcall+0x38/0x60
>   NIP:  c0000000000e4300 LR: c00000000202945c CTR: 0000000000000000
>   REGS: c0000000035c3e80 TRAP: 0c00   Not tainted  (6.0.0-rc4)
>   MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 28000284  XER: 00000000
>   ...
>   NIP plpar_hcall+0x38/0x60
>   LR  pseries_plpks_init+0x64/0x23c
>   --- interrupt: c00
> 
> On powernv Linux is the hypervisor, so a hypercall just ends up going to
> the syscall path, which BUGs if the syscall (hypercall) didn't come from
> userspace.
> 
> The fix is simply to not probe the plpks driver on non-pseries machines.
> 
> [1] https://lore.kernel.org/linuxppc-dev/Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X/
> 
> Fixes: 2454a7af0f2a ("powerpc/pseries: define driver for Platform KeyStore")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!

> ---
>  arch/powerpc/platforms/pseries/plpks.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platforms/pseries/plpks.c
> index 52aaa2894606..f4b5b5a64db3 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -17,6 +17,7 @@
>  #include <linux/string.h>
>  #include <linux/types.h>
>  #include <asm/hvcall.h>
> +#include <asm/machdep.h>
>  
>  #include "plpks.h"
>  
> @@ -457,4 +458,4 @@ static __init int pseries_plpks_init(void)
>  
>  	return rc;
>  }
> -arch_initcall(pseries_plpks_init);
> +machine_arch_initcall(pseries, pseries_plpks_init);
> -- 
> 2.37.2
> 
