Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CAB22E6D3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 09:44:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFWym3869zDr2N
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 17:44:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4BFWb02QmQzDqpr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 17:26:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFWZy5Z2Tz9sRW; Mon, 27 Jul 2020 17:26:50 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200724131423.1362108-1-npiggin@gmail.com>
References: <20200724131423.1362108-1-npiggin@gmail.com>
Subject: Re: [PATCH v4 0/6] powerpc: queued spinlocks and rwlocks
Message-Id: <159583478430.602200.10525784837560757158.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 17:26:50 +1000 (AEST)
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Michal Suchánek <msuchanek@suse.de>, Will Deacon <will@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Jul 2020 23:14:17 +1000, Nicholas Piggin wrote:
> Updated with everybody's feedback (thanks all), and more performance
> results.
> 
> What I've found is I might have been measuring the worst load point for
> the paravirt case, and by looking at a range of loads it's clear that
> queued spinlocks are overall better even on PV, doubly so when you look
> at the generally much improved worst case latencies.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/pseries: Move some PAPR paravirt functions to their own file
      https://git.kernel.org/powerpc/c/20d444d06f97504d165b08558678b4737dcefb02
[2/6] powerpc: Move spinlock implementation to simple_spinlock
      https://git.kernel.org/powerpc/c/12d0b9d6c843e7dbe739ebefcf16c7e4a45e4e78
[3/6] powerpc/64s: Implement queued spinlocks and rwlocks
      https://git.kernel.org/powerpc/c/aa65ff6b18e0366db1790609956a4ac7308c5668
[4/6] powerpc/pseries: Implement paravirt qspinlocks for SPLPAR
      https://git.kernel.org/powerpc/c/20c0e8269e9d515e677670902c7e1cc0209d6ad9
[5/6] powerpc/qspinlock: Optimised atomic_try_cmpxchg_lock() that adds the lock hint
      https://git.kernel.org/powerpc/c/2f6560e652dfdbdb59df28b45a3458bf36d3c580
[6/6] powerpc: Implement smp_cond_load_relaxed()
      https://git.kernel.org/powerpc/c/49a7d46a06c30c7beabbf9d1a8ea1de0f9e4fdfe

cheers
