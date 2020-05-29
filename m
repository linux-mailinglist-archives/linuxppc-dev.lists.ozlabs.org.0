Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B01E720F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 03:26:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y6NT6sJYzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 11:26:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y6Lf2YHgzDqYd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 11:24:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: by ozlabs.org (Postfix)
 id 49Y6Lc5m18z9sSn; Fri, 29 May 2020 11:24:56 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49Y6Lc3prxz9sSm;
 Fri, 29 May 2020 11:24:56 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 1/4] powerpc/64s: Don't init FSCR_DSCR in __init_FSCR()
Date: Fri, 29 May 2020 11:24:55 +1000
Message-ID: <1626791.NDfB26j6xz@townsend>
In-Reply-To: <20200527145843.2761782-1-mpe@ellerman.id.au>
References: <20200527145843.2761782-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linuxppc-dev@ozlabs.org, mikey@neuling.org, npiggin@gmail.com,
 jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For what it's worth I tested this series on Mambo PowerNV and it seems to 
correctly enable/disable the prefix FSCR bit based on the cpu feature so feel 
free to add:

Tested-by: Alistair Popple <alistair@popple.id.au>

Mikey is going to test out pseries.

- Alistair

On Thursday, 28 May 2020 12:58:40 AM AEST Michael Ellerman wrote:
> __init_FSCR() was added originally in commit 2468dcf641e4 ("powerpc:
> Add support for context switching the TAR register") (Feb 2013), and
> only set FSCR_TAR.
> 
> At that point FSCR (Facility Status and Control Register) was not
> context switched, so the setting was permanent after boot.
> 
> Later we added initialisation of FSCR_DSCR to __init_FSCR(), in commit
> 54c9b2253d34 ("powerpc: Set DSCR bit in FSCR setup") (Mar 2013), again
> that was permanent after boot.
> 
> Then commit 2517617e0de6 ("powerpc: Fix context switch DSCR on
> POWER8") (Aug 2013) added a limited context switch of FSCR, just the
> FSCR_DSCR bit was context switched based on thread.dscr_inherit. That
> commit said "This clears the H/FSCR DSCR bit initially", but it
> didn't, it left the initialisation of FSCR_DSCR in __init_FSCR().
> However the initial context switch from init_task to pid 1 would clear
> FSCR_DSCR because thread.dscr_inherit was 0.
> 
> That commit also introduced the requirement that FSCR_DSCR be clear
> for user processes, so that we can take the facility unavailable
> interrupt in order to manage dscr_inherit.
> 
> Then in commit 152d523e6307 ("powerpc: Create context switch helpers
> save_sprs() and restore_sprs()") (Dec 2015) FSCR was added to
> thread_struct. However it still wasn't fully context switched, we just
> took the existing value and set FSCR_DSCR if the new thread had
> dscr_inherit set. FSCR was still initialised at boot to FSCR_DSCR |
> FSCR_TAR, but that value was not propagated into the thread_struct, so
> the initial context switch set FSCR_DSCR back to 0.
> 
> Finally commit b57bd2de8c6c ("powerpc: Improve FSCR init and context
> switching") (Jun 2016) added a full context switch of the FSCR, and
> added an initialisation of init_task.thread.fscr to FSCR_TAR |
> FSCR_EBB, but omitted FSCR_DSCR.
> 
> The end result is that swapper runs with FSCR_DSCR set because of the
> initialisation in __init_FSCR(), but no other processes do, they use
> the value from init_task.thread.fscr.
> 
> Having FSCR_DSCR set for swapper allows it to access SPR 3 from
> userspace, but swapper never runs userspace, so it has no useful
> effect. It's also confusing to have the value initialised in two
> places to two different values.
> 
> So remove FSCR_DSCR from __init_FSCR(), this at least gets us to the
> point where there's a single value of FSCR, even if it's still set in
> two places.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/kernel/cpu_setup_power.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/cpu_setup_power.S
> b/arch/powerpc/kernel/cpu_setup_power.S index a460298c7ddb..f91ecb10d0ae
> 100644
> --- a/arch/powerpc/kernel/cpu_setup_power.S
> +++ b/arch/powerpc/kernel/cpu_setup_power.S
> @@ -184,7 +184,7 @@ _GLOBAL(__restore_cpu_power9)
> 
>  __init_FSCR:
>  	mfspr	r3,SPRN_FSCR
> -	ori	r3,r3,FSCR_TAR|FSCR_DSCR|FSCR_EBB
> +	ori	r3,r3,FSCR_TAR|FSCR_EBB
>  	mtspr	SPRN_FSCR,r3
>  	blr




