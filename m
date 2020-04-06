Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6089819F725
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 15:43:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wsF71vz7zDr3R
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 23:43:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wrPv5rX2zDr6K
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 23:05:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48wrPr2x9bz9sRY; Mon,  6 Apr 2020 23:05:51 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: abc3fce76adbdfa8f87272c784b388cd20b46049
In-Reply-To: <20200402120401.1115883-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] Revert "powerpc/64: irq_work avoid interrupt when called
 with hardware irqs enabled"
Message-Id: <48wrPr2x9bz9sRY@ozlabs.org>
Date: Mon,  6 Apr 2020 23:05:51 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2020-04-02 at 12:04:01 UTC, Nicholas Piggin wrote:
> This reverts commit ebb37cf3ffd39fdb6ec5b07111f8bb2f11d92c5f.
> 
> That commit does not play well with soft-masked irq state manipulations
> in idle, interrupt replay, and possibly others due to tracing code
> sometimes using irq_work_queue (e.g., in trace_hardirqs_on()). That
> can cause PACA_IRQ_DEC to become set when it is not expected, and be
> ignored or cleared or cause warnings.
> 
> The net result seems to be missing an irq_work until the next timer
> interrupt in the worst case which is usually not going to be noticed,
> however it could be a long time if the tick is disabled, which is
> agains the spirit of irq_work and might cause real problems.
> 
> The idea is still solid, but it would need more work. It's not really
> clear if it would be worth added complexity, so revert this for now
> (not a straight revert, but replace with a comment explaining why we
> might see interrupts happening, and gives git blame something to find).
> 
> Fixes: ebb37cf3ffd3 ("powerpc/64: irq_work avoid interrupt when called with hardware irqs enabled")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/abc3fce76adbdfa8f87272c784b388cd20b46049

cheers
