Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668E212190
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 12:50:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yFHr563YzDqcY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:50:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=rND6qhP5; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yFFd4zB3zDqx1
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 20:48:53 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 874412075D;
 Thu,  2 Jul 2020 10:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593686931;
 bh=g1cKP96vnhwpBadUWi+K/NTNmduKoAdrQtOe2iZfYXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rND6qhP59jK5UT3eXdMAPYj3XlxaRqljjqiK6gfVkN56KQRkwXJI42Wa2o9R7S9C4
 VFijU4tvdYZpSIS8Qv0WJJv8LFLP7+yGyqLBBAyv8zPZtGwUf/Wc5UzxBctdMWfWvP
 z8yinVoQFqZAzTvxE9QCVMXFJXdbBY07btq8tQFU=
Date: Thu, 2 Jul 2020 11:48:46 +0100
From: Will Deacon <will@kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/64s: implement queued spinlocks and rwlocks
Message-ID: <20200702104845.GB16418@willie-the-truck>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-6-npiggin@gmail.com>
 <20200702080219.GB16113@willie-the-truck>
 <1593685459.r2tfxtfdp6.astroid@bobo.none>
 <20200702103506.GA16418@willie-the-truck>
 <1593686722.w9psaqk7yp.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593686722.w9psaqk7yp.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 08:47:05PM +1000, Nicholas Piggin wrote:
> Excerpts from Will Deacon's message of July 2, 2020 8:35 pm:
> > On Thu, Jul 02, 2020 at 08:25:43PM +1000, Nicholas Piggin wrote:
> >> Excerpts from Will Deacon's message of July 2, 2020 6:02 pm:
> >> > On Thu, Jul 02, 2020 at 05:48:36PM +1000, Nicholas Piggin wrote:
> >> >> diff --git a/arch/powerpc/include/asm/qspinlock.h b/arch/powerpc/include/asm/qspinlock.h
> >> >> new file mode 100644
> >> >> index 000000000000..f84da77b6bb7
> >> >> --- /dev/null
> >> >> +++ b/arch/powerpc/include/asm/qspinlock.h
> >> >> @@ -0,0 +1,20 @@
> >> >> +/* SPDX-License-Identifier: GPL-2.0 */
> >> >> +#ifndef _ASM_POWERPC_QSPINLOCK_H
> >> >> +#define _ASM_POWERPC_QSPINLOCK_H
> >> >> +
> >> >> +#include <asm-generic/qspinlock_types.h>
> >> >> +
> >> >> +#define _Q_PENDING_LOOPS	(1 << 9) /* not tuned */
> >> >> +
> >> >> +#define smp_mb__after_spinlock()   smp_mb()
> >> >> +
> >> >> +static __always_inline int queued_spin_is_locked(struct qspinlock *lock)
> >> >> +{
> >> >> +	smp_mb();
> >> >> +	return atomic_read(&lock->val);
> >> >> +}
> >> > 
> >> > Why do you need the smp_mb() here?
> >> 
> >> A long and sad tale that ends here 51d7d5205d338
> >> 
> >> Should probably at least refer to that commit from here, since this one 
> >> is not going to git blame back there. I'll add something.
> > 
> > Is this still an issue, though?
> > 
> > See 38b850a73034 (where we added a similar barrier on arm64) and then
> > c6f5d02b6a0f (where we removed it).
> > 
> 
> Oh nice, I didn't know that went away. Thanks for the heads up.
> 
> I'm going to say I'm too scared to remove it while changing the
> spinlock algorithm, but I'll open an issue and we should look at 
> removing it.

Makes sense to me -- it certainly needs a deeper look! In the meantime,
please put some of this in a comment next to the barrier.

Cheers,

Will
