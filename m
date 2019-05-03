Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E390212813
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 08:53:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wNC4219nzDqZ2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 16:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wN6g5MzJzDqPP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wN6g3cqXz9sBr; Fri,  3 May 2019 16:50:03 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 10d91611f426d4bafd2a83d966c36da811b2f7ad
X-Patchwork-Hint: ignore
In-Reply-To: <20190412143053.18567-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v9 1/2] powerpc/64s: reimplement book3s idle code in C
Message-Id: <44wN6g3cqXz9sBr@ozlabs.org>
Date: Fri,  3 May 2019 16:50:03 +1000 (AEST)
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-04-12 at 14:30:52 UTC, Nicholas Piggin wrote:
> Reimplement Book3S idle code in C, moving POWER7/8/9 implementation
> speific HV idle code to the powernv platform code.
> 
> Book3S assembly stubs are kept in common code and used only to save
> the stack frame and non-volatile GPRs before executing architected
> idle instructions, and restoring the stack and reloading GPRs then
> returning to C after waking from idle.
> 
> The complex logic dealing with threads and subcores, locking, SPRs,
> HMIs, timebase resync, etc., is all done in C which makes it more
> maintainable.
> 
> This is not a strict translation to C code, there are some
> significant differences:
> 
> - Idle wakeup no longer uses the ->cpu_restore call to reinit SPRs,
>   but saves and restores them itself.
> 
> - The optimisation where EC=ESL=0 idle modes did not have to save GPRs
>   or change MSR is restored, because it's now simple to do. ESL=1
>   sleeps that do not lose GPRs can use this optimization too.
> 
> - KVM secondary entry and cede is now more of a call/return style
>   rather than branchy. nap_state_lost is not required because KVM
>   always returns via NVGPR restoring path.
> 
> - KVM secondary wakeup from offline sequence is moved entirely into
>   the offline wakeup, which avoids a hwsync in the normal idle wakeup
>   path.
> 
> Performance measured with context switch ping-pong on different
> threads or cores, is possibly improved a small amount, 1-3% depending
> on stop state and core vs thread test for shallow states. Deep states
> it's in the noise compared with other latencies.
> 
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc topic/ppc-kvm, thanks.

https://git.kernel.org/powerpc/c/10d91611f426d4bafd2a83d966c36da8

cheers
