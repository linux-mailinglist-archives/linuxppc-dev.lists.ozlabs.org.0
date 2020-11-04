Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A92A6023
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 10:06:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR14B1p2mzDqWv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 20:06:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR11q06yCzDqWF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:04:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=h14XOFR8; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4CR11p5v83z8tXJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 20:04:46 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4CR11p4YWbz9sVM; Wed,  4 Nov 2020 20:04:46 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=h14XOFR8; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4CR11n5sVKz9sTK
 for <linuxppc-dev@ozlabs.org>; Wed,  4 Nov 2020 20:04:45 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 183D52220B;
 Wed,  4 Nov 2020 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604480682;
 bh=fiKr+4M13c3O/9I8tqfhGSntV11bltH8OUZ8CPb8g+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h14XOFR8+DlEMu/Wr1h6LbSob/cRFLVeP6h0rJYASP+TVNgPKkIgDMKreBSU8nPaU
 s9G0pXru898BZUhzP9bsk9BAV2Egp2aw8jgAZH1D4NBcEjCxNu3R6DD83p3TI4Omhq
 qznu5xHb51B/aP8xQUT4NhnDDTIPIeZ8GMwWEKVQ=
Date: Wed, 4 Nov 2020 10:05:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4.19] mm: fix exec activate_mm vs TLB shootdown and lazy
 tlb switching race
Message-ID: <20201104090533.GA1588160@kroah.com>
References: <20201104011406.598487-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201104011406.598487-1-mpe@ellerman.id.au>
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
Cc: peterz@infradead.org, linuxppc-dev@ozlabs.org, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 04, 2020 at 12:14:06PM +1100, Michael Ellerman wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> commit d53c3dfb23c45f7d4f910c3a3ca84bf0a99c6143 upstream.
> 
> Reading and modifying current->mm and current->active_mm and switching
> mm should be done with irqs off, to prevent races seeing an intermediate
> state.
> 
> This is similar to commit 38cf307c1f20 ("mm: fix kthread_use_mm() vs TLB
> invalidate"). At exec-time when the new mm is activated, the old one
> should usually be single-threaded and no longer used, unless something
> else is holding an mm_users reference (which may be possible).
> 
> Absent other mm_users, there is also a race with preemption and lazy tlb
> switching. Consider the kernel_execve case where the current thread is
> using a lazy tlb active mm:
> 
>   call_usermodehelper()
>     kernel_execve()
>       old_mm = current->mm;
>       active_mm = current->active_mm;
>       *** preempt *** -------------------->  schedule()
>                                                prev->active_mm = NULL;
>                                                mmdrop(prev active_mm);
>                                              ...
>                       <--------------------  schedule()
>       current->mm = mm;
>       current->active_mm = mm;
>       if (!old_mm)
>           mmdrop(active_mm);
> 
> If we switch back to the kernel thread from a different mm, there is a
> double free of the old active_mm, and a missing free of the new one.
> 
> Closing this race only requires interrupts to be disabled while ->mm
> and ->active_mm are being switched, but the TLB problem requires also
> holding interrupts off over activate_mm. Unfortunately not all archs
> can do that yet, e.g., arm defers the switch if irqs are disabled and
> expects finish_arch_post_lock_switch() to be called to complete the
> flush; um takes a blocking lock in activate_mm().
> 
> So as a first step, disable interrupts across the mm/active_mm updates
> to close the lazy tlb preempt race, and provide an arch option to
> extend that to activate_mm which allows architectures doing IPI based
> TLB shootdowns to close the second race.
> 
> This is a bit ugly, but in the interest of fixing the bug and backporting
> before all architectures are converted this is a compromise.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> [mpe: Manual backport to 4.19 due to membarrier_exec_mmap(mm) changes]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/20200914045219.3736466-2-npiggin@gmail.com
> ---
>  arch/Kconfig |  7 +++++++
>  fs/exec.c    | 15 ++++++++++++++-
>  2 files changed, 21 insertions(+), 1 deletion(-)

Now queued up, thanks!

greg k-h
