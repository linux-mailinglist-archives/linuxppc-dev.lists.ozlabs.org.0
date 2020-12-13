Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AAC2D8DD5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Dec 2020 15:12:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cv6110LjKzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Dec 2020 01:12:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=nFttyLKx; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cv5yd5GW4zDqVW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Dec 2020 01:10:33 +1100 (AEDT)
Date: Sun, 13 Dec 2020 09:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607868630;
 bh=S0NZCKTHXO1/XgTBibTeHKY2NyaV+jWp9oZjgvuSOZg=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=nFttyLKxDFdTzDqG+uV+ZMYwIDraCwmT1csa8RGjNQtB2KNQuC3CWvsr8XvQHFTkX
 bOVfEZ3hZGq/q87besC+Bjzp/UHT9BZ6/avesb9g234GUTyQ6mz9ZdKVWLvvWayKcR
 5IsZC3of1cWOok1XpWOR2jKmC5sWYP7UWQbjwfCJNcyT1mEousS3/8Iz7qmQngrF+E
 UBfwNFX/Xim1w8qNAQxV89tayOf16Xozhta7DOpqMYNyp+n+eIU7Y985xkZoMGJ7UI
 W/Q6SnFz+H4jXIWSjxGFg8FVH/fANHjQkaleEJRhOabM6QD83DoUX7CgAE554wRsQU
 Zom91bCLKheaA==
From: Sasha Levin <sashal@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH AUTOSEL 5.9 27/39] sched/idle: Fix arch_cpu_idle() vs
 tracing
Message-ID: <20201213141029.GQ643756@sasha-vm>
References: <20201203132834.930999-1-sashal@kernel.org>
 <20201203132834.930999-27-sashal@kernel.org>
 <20201203145442.GC9994@osiris>
 <20201203171015.GN2414@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201203171015.GN2414@hirez.programming.kicks-ass.net>
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
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-csky@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 06:10:15PM +0100, Peter Zijlstra wrote:
>On Thu, Dec 03, 2020 at 03:54:42PM +0100, Heiko Carstens wrote:
>> On Thu, Dec 03, 2020 at 08:28:21AM -0500, Sasha Levin wrote:
>> > From: Peter Zijlstra <peterz@infradead.org>
>> >
>> > [ Upstream commit 58c644ba512cfbc2e39b758dd979edd1d6d00e27 ]
>> >
>> > We call arch_cpu_idle() with RCU disabled, but then use
>> > local_irq_{en,dis}able(), which invokes tracing, which relies on RCU.
>> >
>> > Switch all arch_cpu_idle() implementations to use
>> > raw_local_irq_{en,dis}able() and carefully manage the
>> > lockdep,rcu,tracing state like we do in entry.
>> >
>> > (XXX: we really should change arch_cpu_idle() to not return with
>> > interrupts enabled)
>> >
>> > Reported-by: Sven Schnelle <svens@linux.ibm.com>
>> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> > Reviewed-by: Mark Rutland <mark.rutland@arm.com>
>> > Tested-by: Mark Rutland <mark.rutland@arm.com>
>> > Link: https://lkml.kernel.org/r/20201120114925.594122626@infradead.org
>> > Signed-off-by: Sasha Levin <sashal@kernel.org>
>>
>> This patch broke s390 irq state tracing. A patch to fix this is
>> scheduled to be merged upstream today (hopefully).
>> Therefore I think this patch should not yet go into 5.9 stable.
>
>Agreed.

I'll also grab b1cae1f84a0f ("s390: fix irq state tracing"). Thanks!

-- 
Thanks,
Sasha
