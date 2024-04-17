Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 788268A80EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 12:28:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DEFiqQxJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKHDX1mnCz3vZc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 20:28:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DEFiqQxJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKHCs3KyCz3d2x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 20:27:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BA453CE12BC;
	Wed, 17 Apr 2024 10:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 700D2C072AA;
	Wed, 17 Apr 2024 10:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713349653;
	bh=Kn55+1luOn7/FcJIZC3jmFgE9ttr5he8xI+XlEEncLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEFiqQxJikBmYetX669hS5i6+49i3etN/k12je52FNMd3AEbvv6F/WNPUq4XpQdoH
	 Pey9pRqtiFJ6ZxfPQ423YXzhUgKPNN3izpgUPmfhSH392RRB8V2FKSTFmIHWgO2YDI
	 Sq617YCRsZmA0CIAvVcsIiUoP5kU0WivRAEhT+ltkgYR1Yee6GjwffBnzUIarIYMIK
	 E6qzV1Hnmi+O1f/Kfgb/q5y9fprLgHc72diHQ5D2U0BubxRr+HHAGUqHFRkVP4etDR
	 26iQbeBlx0rNDDsiSS9E06RKRgp8VGfBsjSIy0CC0K2Pul/0wqDpMY2iFVuSYryWRk
	 Peq5m7BlJk+Uw==
Date: Wed, 17 Apr 2024 12:27:30 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 RESEND 0/5] sched/vtime: vtime.h headers cleanup
Message-ID: <Zh-kEvJbNR2krwmx@localhost.localdomain>
References: <cover.1712760275.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1712760275.git.agordeev@linux.ibm.com>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le Wed, Apr 10, 2024 at 05:09:43PM +0200, Alexander Gordeev a écrit :
> Hi All,
> 
> There are no changes since the last post, just a re-send.
> 
> v2:
> - patch 4: commit message reworded (Heiko)
> - patch 5: vtime.h is removed from Kbuild scripts (PowerPC only) (Heiko)
> 
> v1:
> Please find a small cleanup to vtime_task_switch() wiring.
> I split it into smaller patches to allow separate PowerPC
> vs s390 reviews. Otherwise patches 2+3 and 4+5 could have
> been merged.
> 
> I tested it on s390 and compile-tested it on 32- and 64-bit
> PowerPC and few other major architectures only, but it is
> only of concern for CONFIG_VIRT_CPU_ACCOUNTING_NATIVE-capable
> ones (AFAICT).
> 
> Thanks!

It probably makes sense to apply the whole series to the scheduler tree.
Does any powerpc or s390 maintainer oppose to that?

Thanks.

> 
> 
> Alexander Gordeev (5):
>   sched/vtime: remove confusing arch_vtime_task_switch() declaration
>   sched/vtime: get rid of generic vtime_task_switch() implementation
>   s390/vtime: remove unused __ARCH_HAS_VTIME_TASK_SWITCH leftover
>   s390/irq,nmi: include <asm/vtime.h> header directly
>   sched/vtime: do not include <asm/vtime.h> header
> 
>  arch/powerpc/include/asm/Kbuild    |  1 -
>  arch/powerpc/include/asm/cputime.h | 13 -------------
>  arch/powerpc/kernel/time.c         | 22 ++++++++++++++++++++++
>  arch/s390/include/asm/vtime.h      |  2 --
>  arch/s390/kernel/irq.c             |  1 +
>  arch/s390/kernel/nmi.c             |  1 +
>  include/asm-generic/vtime.h        |  1 -
>  include/linux/vtime.h              |  5 -----
>  kernel/sched/cputime.c             | 13 -------------
>  9 files changed, 24 insertions(+), 35 deletions(-)
>  delete mode 100644 include/asm-generic/vtime.h
> 
> -- 
> 2.40.1
> 
