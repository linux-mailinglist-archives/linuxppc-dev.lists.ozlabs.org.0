Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B163166BD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 13:33:05 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbK0r3684zDvZb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 23:33:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbJmj5sCGzDskQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:22:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KObzDRCb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DbJmc1bdvz9rx8;
 Wed, 10 Feb 2021 23:22:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612959744;
 bh=2Ov6iemsANUI2gypY77W7/LHcnmKUBkyNADpwAMuplA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KObzDRCbUHa1LGMrLRXVRCUnQ2czdTvxYKWw9ndaBtuubsYzf+ONZ9abyEE7C68ga
 h3+vokNuB7Ql6isHoLlTGbY78DJqEZ+ZH99Eg1d2nSVvz9hXT9ALMx5NWvP38Uyc91
 652oX9IVfla+zjqxUSdJ3h75KC9ZZHrD/826jYskd9ud+iiTdYuoQOTArmKgBJl2+m
 F10/nL+aL1iJAOt0aGajg1e5M3dK9ZkhX/hS6uYNPkl2uvJgxNHqn9cBUODA6FTGKo
 k6baeYjLhMQFoNwYG1/fh/x8peQfxlJjAmn3ZA2f6ftE5aNev7AfSjlqMNobDr3/2X
 t+jXFol6AjCAQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests/powerpc: Fix L1D flushing tests for Power10
In-Reply-To: <20210210052242.2862462-1-ruscur@russell.cc>
References: <20210210052242.2862462-1-ruscur@russell.cc>
Date: Wed, 10 Feb 2021 23:22:19 +1100
Message-ID: <87pn18nmdg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:
> The rfi_flush and entry_flush selftests work by using the PM_LD_MISS_L1
> perf event to count L1D misses.  The value of this event has changed
> over time:
>
> - Power7 uses 0x400f0
> - Power8 and Power9 use both 0x400f0 and 0x3e054
> - Power10 uses only 0x3e054
>
> Update these selftests to use the value 0x3e054 on P10 and later,
> fixing the tests from finding 0 events.

I wonder if we can just use the cache events that the kernel knows
about.

ie, switch the type to PERF_TYPE_HW_CACHE and the event to
PERF_COUNT_HW_CACHE_MISSES.

That would end up using the same event on power7 and power8:

$ git grep PERF_COUNT_HW_CACHE_MISSES arch/powerpc/perf/power{7,8,9,10}*.c
arch/powerpc/perf/power7-pmu.c: [PERF_COUNT_HW_CACHE_MISSES] =                  PM_LD_MISS_L1,
arch/powerpc/perf/power8-pmu.c: [PERF_COUNT_HW_CACHE_MISSES] =                  PM_LD_MISS_L1,
arch/powerpc/perf/power9-pmu.c: [PERF_COUNT_HW_CACHE_MISSES] =                  PM_LD_MISS_L1_FIN,
arch/powerpc/perf/power10-pmu.c:        [PERF_COUNT_HW_CACHE_MISSES] =                  PM_LD_MISS_L1,
arch/powerpc/perf/power10-pmu.c:        [PERF_COUNT_HW_CACHE_MISSES] =                  PM_LD_DEMAND_MISS_L1_FIN,

On power9 and power10 it's using slightly different events. But I think
it should still work, because these tests just counts misses
with/without the various flushes enabled.

The distinction between loads that miss at execute vs finish shouldn't
matter, but you'd need to test.

The advantage would be we wouldn't then need to update the test again
for future CPUs.

cheers
