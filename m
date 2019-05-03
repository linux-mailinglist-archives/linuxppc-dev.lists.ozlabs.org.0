Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E8F128D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:29:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wP002KF3zDqYX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:29:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKM6RTbzDqTJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKM3RTJz9s9y; Fri,  3 May 2019 16:59:19 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 7ae3f6e130e8dc6188b59e3b4ebc2f16e9c8d053
X-Patchwork-Hint: ignore
In-Reply-To: <20190409044005.26446-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/watchdog: Use hrtimers for per-CPU heartbeat
Message-Id: <44wNKM3RTJz9s9y@ozlabs.org>
Date: Fri,  3 May 2019 16:59:19 +1000 (AEST)
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
 Ravikumar Bangoria <ravi.bangoria@in.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-04-09 at 04:40:05 UTC, Nicholas Piggin wrote:
> Using a jiffies timer creates a dependency on the tick_do_timer_cpu
> incrementing jiffies. If that CPU has locked up and jiffies is not
> incrementing, the watchdog heartbeat timer for all CPUs stops and
> creates false positives and confusing warnings on local CPUs, and
> also causes the SMP detector to stop, so the root cause is never
> detected.
> 
> Fix this by using hrtimer based timers for the watchdog heartbeat,
> like the generic kernel hardlockup detector.
> 
> Cc: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Reported-by: Ravikumar Bangoria <ravi.bangoria@in.ibm.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Tested-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Reported-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/7ae3f6e130e8dc6188b59e3b4ebc2f16

cheers
