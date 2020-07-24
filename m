Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF2E22D05C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:14:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BD24g1M9wzDrRC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 07:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iMiGlJIh; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rbl6rw9g; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BD22F5PnrzF1Tj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jul 2020 07:11:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595625105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgk0E/B+fKLI4HapciZOOHShfeB4adj+yNndqo5HAqc=;
 b=iMiGlJIhDIn2HDHYXq42UTQ8WnJdHCIAiBmnHGQFnHqFp6QnrqFQjFJRoMDjnzaj46t4FE
 IjZcHE0WPHuvL47mHf3PTeVyq4bNj2Rb/m8fNjcfYNkqIWtFdRUQLPNiu0ENgNwoc3qHgP
 3FYNh6V44bH2+YFGBtOP9obf/Q3Rf+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595625106;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tgk0E/B+fKLI4HapciZOOHShfeB4adj+yNndqo5HAqc=;
 b=Rbl6rw9gld4NUyOMWs426gnD2KkNGHazCj42p/wDb/LJC9yLi0a1WoY97t6kL12m6T7+p6
 HoN6UJKdsuclu23thJ67ZlVhKv55UIYBPLlrAYgIOS+JLVIRDQZtAewinZbvGIPbE5yUaD
 hWLAaFJ6JYlljR+34klkBD+RmcXCEYE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-EvQuSqI9Np-gVoJuVaSCpw-1; Fri, 24 Jul 2020 17:11:41 -0400
X-MC-Unique: EvQuSqI9Np-gVoJuVaSCpw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6ED61106B251;
 Fri, 24 Jul 2020 21:11:39 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-203.rdu2.redhat.com [10.10.117.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9267410013C2;
 Fri, 24 Jul 2020 21:11:36 +0000 (UTC)
Subject: Re: [PATCH v4 0/6] powerpc: queued spinlocks and rwlocks
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200724131423.1362108-1-npiggin@gmail.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <f568c8aa-29b5-dbe9-47b8-ee12ce55cb31@redhat.com>
Date: Fri, 24 Jul 2020 17:11:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200724131423.1362108-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 Ingo Molnar <mingo@redhat.com>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/24/20 9:14 AM, Nicholas Piggin wrote:
> Updated with everybody's feedback (thanks all), and more performance
> results.
>
> What I've found is I might have been measuring the worst load point for
> the paravirt case, and by looking at a range of loads it's clear that
> queued spinlocks are overall better even on PV, doubly so when you look
> at the generally much improved worst case latencies.
>
> I have defaulted it to N even though I'm less concerned about the PV
> numbers now, just because I think it needs more stress testing. But
> it's very nicely selectable so should be low risk to include.
>
> All in all this is a very cool technology and great results especially
> on the big systems but even on smaller ones there are nice gains. Thanks
> Waiman and everyone who developed it.
>
> Thanks,
> Nick
>
> Nicholas Piggin (6):
>    powerpc/pseries: move some PAPR paravirt functions to their own file
>    powerpc: move spinlock implementation to simple_spinlock
>    powerpc/64s: implement queued spinlocks and rwlocks
>    powerpc/pseries: implement paravirt qspinlocks for SPLPAR
>    powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
>      lock hint
>    powerpc: implement smp_cond_load_relaxed
>
>   arch/powerpc/Kconfig                          |  15 +
>   arch/powerpc/include/asm/Kbuild               |   1 +
>   arch/powerpc/include/asm/atomic.h             |  28 ++
>   arch/powerpc/include/asm/barrier.h            |  14 +
>   arch/powerpc/include/asm/paravirt.h           |  87 +++++
>   arch/powerpc/include/asm/qspinlock.h          |  91 ++++++
>   arch/powerpc/include/asm/qspinlock_paravirt.h |   7 +
>   arch/powerpc/include/asm/simple_spinlock.h    | 288 ++++++++++++++++
>   .../include/asm/simple_spinlock_types.h       |  21 ++
>   arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
>   arch/powerpc/include/asm/spinlock_types.h     |  17 +-
>   arch/powerpc/lib/Makefile                     |   3 +
>   arch/powerpc/lib/locks.c                      |  12 +-
>   arch/powerpc/platforms/pseries/Kconfig        |   9 +-
>   arch/powerpc/platforms/pseries/setup.c        |   4 +-
>   include/asm-generic/qspinlock.h               |   4 +
>   16 files changed, 588 insertions(+), 321 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/paravirt.h
>   create mode 100644 arch/powerpc/include/asm/qspinlock.h
>   create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
>   create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
>   create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
>
That patch series looks good to me. Thanks for working on this.

For the series,

Acked-by: Waiman Long <longman@redhat.com>

