Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F801215EF1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jul 2020 20:41:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B0vYX6cqGzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 04:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=longman@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=NncC+SeT; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=SEd4OqZi; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B0vWV1HwCzDqb0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 04:40:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594060801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGfzwKmfId0nPt6AjeRSKqUxZBg1dc0lbe/SE6/v6yI=;
 b=NncC+SeT6Hdb3T1ZKv3cUKPtJJgPS0Ok5WWDoUjzK+rIJOW8bzHXp4wEmGlZ070R8ZvNap
 t1zO0idWjW//u/T8PsWXIwv9u52t6xJzvlO6mcsdzBpP6/Fq45g4XfdwowAcdtqYyDlme3
 pPiVCmF3l41od2F3GlCTHjathk3iT54=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594060802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGfzwKmfId0nPt6AjeRSKqUxZBg1dc0lbe/SE6/v6yI=;
 b=SEd4OqZi59qPaaMHMVZh54jkLIOkHY2FtHfBvrs/rG8BigbX4RLZmWc13FJpvU0Q0d1S0+
 hEcTo0L1hSaJtHFUcGpSpqC5YiR+AvC/nF/JMJDaAoqncyrxrVMZQLqbdUaiulOVeTmhRP
 2gb7lHze2zVXEqobd97lfbiPQMT2iaA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ZRiGS6MdOQm63DvY3owoAw-1; Mon, 06 Jul 2020 14:39:57 -0400
X-MC-Unique: ZRiGS6MdOQm63DvY3owoAw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 597AF8014D4;
 Mon,  6 Jul 2020 18:39:55 +0000 (UTC)
Received: from llong.remote.csb (ovpn-117-98.rdu2.redhat.com [10.10.117.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 150B52C2BC;
 Mon,  6 Jul 2020 18:39:54 +0000 (UTC)
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706043540.1563616-1-npiggin@gmail.com>
From: Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
Date: Mon, 6 Jul 2020 14:39:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200706043540.1563616-1-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/20 12:35 AM, Nicholas Piggin wrote:
> v3 is updated to use __pv_queued_spin_unlock, noticed by Waiman (thank you).
>
> Thanks,
> Nick
>
> Nicholas Piggin (6):
>    powerpc/powernv: must include hvcall.h to get PAPR defines
>    powerpc/pseries: move some PAPR paravirt functions to their own file
>    powerpc: move spinlock implementation to simple_spinlock
>    powerpc/64s: implement queued spinlocks and rwlocks
>    powerpc/pseries: implement paravirt qspinlocks for SPLPAR
>    powerpc/qspinlock: optimised atomic_try_cmpxchg_lock that adds the
>      lock hint
>
>   arch/powerpc/Kconfig                          |  13 +
>   arch/powerpc/include/asm/Kbuild               |   2 +
>   arch/powerpc/include/asm/atomic.h             |  28 ++
>   arch/powerpc/include/asm/paravirt.h           |  89 +++++
>   arch/powerpc/include/asm/qspinlock.h          |  91 ++++++
>   arch/powerpc/include/asm/qspinlock_paravirt.h |   7 +
>   arch/powerpc/include/asm/simple_spinlock.h    | 292 +++++++++++++++++
>   .../include/asm/simple_spinlock_types.h       |  21 ++
>   arch/powerpc/include/asm/spinlock.h           | 308 +-----------------
>   arch/powerpc/include/asm/spinlock_types.h     |  17 +-
>   arch/powerpc/lib/Makefile                     |   3 +
>   arch/powerpc/lib/locks.c                      |  12 +-
>   arch/powerpc/platforms/powernv/pci-ioda-tce.c |   1 +
>   arch/powerpc/platforms/pseries/Kconfig        |   5 +
>   arch/powerpc/platforms/pseries/setup.c        |   6 +-
>   include/asm-generic/qspinlock.h               |   4 +
>   16 files changed, 577 insertions(+), 322 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/paravirt.h
>   create mode 100644 arch/powerpc/include/asm/qspinlock.h
>   create mode 100644 arch/powerpc/include/asm/qspinlock_paravirt.h
>   create mode 100644 arch/powerpc/include/asm/simple_spinlock.h
>   create mode 100644 arch/powerpc/include/asm/simple_spinlock_types.h
>
This patch looks OK to me.

I had run some microbenchmark on powerpc system with or w/o the patch.

On a 2-socket 160-thread SMT4 POWER9 system (not virtualized):

5.8.0-rc4
=========

Running locktest with spinlock [runtime = 10s, load = 1]
Threads = 160, Min/Mean/Max = 77,665/90,153/106,895
Threads = 160, Total Rate = 1,441,759 op/s; Percpu Rate = 9,011 op/s

Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
Threads = 160, Min/Mean/Max = 47,879/53,807/63,689
Threads = 160, Total Rate = 860,192 op/s; Percpu Rate = 5,376 op/s

Running locktest with spinlock [runtime = 10s, load = 1]
Threads = 80, Min/Mean/Max = 242,907/319,514/463,161
Threads = 80, Total Rate = 2,555 kop/s; Percpu Rate = 32 kop/s

Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
Threads = 80, Min/Mean/Max = 146,161/187,474/259,270
Threads = 80, Total Rate = 1,498 kop/s; Percpu Rate = 19 kop/s

Running locktest with spinlock [runtime = 10s, load = 1]
Threads = 40, Min/Mean/Max = 646,639/1,000,817/1,455,205
Threads = 40, Total Rate = 4,001 kop/s; Percpu Rate = 100 kop/s

Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
Threads = 40, Min/Mean/Max = 402,165/597,132/814,555
Threads = 40, Total Rate = 2,388 kop/s; Percpu Rate = 60 kop/s

5.8.0-rc4-qlock+
================

Running locktest with spinlock [runtime = 10s, load = 1]
Threads = 160, Min/Mean/Max = 123,835/124,580/124,587
Threads = 160, Total Rate = 1,992 kop/s; Percpu Rate = 12 kop/s

Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
Threads = 160, Min/Mean/Max = 254,210/264,714/276,784
Threads = 160, Total Rate = 4,231 kop/s; Percpu Rate = 26 kop/s

Running locktest with spinlock [runtime = 10s, load = 1]
Threads = 80, Min/Mean/Max = 599,715/603,397/603,450
Threads = 80, Total Rate = 4,825 kop/s; Percpu Rate = 60 kop/s

Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
Threads = 80, Min/Mean/Max = 492,687/525,224/567,456
Threads = 80, Total Rate = 4,199 kop/s; Percpu Rate = 52 kop/s

Running locktest with spinlock [runtime = 10s, load = 1]
Threads = 40, Min/Mean/Max = 1,325,623/1,325,628/1,325,636
Threads = 40, Total Rate = 5,299 kop/s; Percpu Rate = 132 kop/s

Running locktest with rwlock [runtime = 10s, r% = 50%, load = 1]
Threads = 40, Min/Mean/Max = 1,249,731/1,292,977/1,342,815
Threads = 40, Total Rate = 5,168 kop/s; Percpu Rate = 129 kop/s

On systems on large number of cpus, qspinlock lock is faster and more fair.

With some tuning, we may be able to squeeze out more performance.

Cheers,
Longman

