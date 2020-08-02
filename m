Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2586123571A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 15:27:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKMJQ0YJJzDqHS
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 23:27:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKMDX599gzDqGC
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 23:24:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BKMDX1fdQz9sTH; Sun,  2 Aug 2020 23:24:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200727060947.10060-1-npiggin@gmail.com>
References: <20200727060947.10060-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/hash: Fix hash_preload running with
 interrupts enabled
Message-Id: <159637464092.36914.6525874063162012837.b4-ty@ellerman.id.au>
Date: Sun,  2 Aug 2020 23:24:11 +1000 (AEST)
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Jul 2020 16:09:47 +1000, Nicholas Piggin wrote:
> Commit 2f92447f9f96 ("powerpc/book3s64/hash: Use the pte_t address from the
> caller") removed the local_irq_disable from hash_preload, but it was
> required for more than just the page table walk: the hash pte busy bit is
> effectively a lock which may be taken in interrupt context, and the local
> update flag test must not be preempted before it's used.
> 
> This solves apparent lockups with perf interrupting __hash_page_64K. If
> get_perf_callchain then also takes a hash fault on the same page while it
> is already locked, it will loop forever taking hash faults, which looks like
> this:
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s/hash: Fix hash_preload running with interrupts enabled
      https://git.kernel.org/powerpc/c/909adfc66b9a1db21b5e8733e9ebfa6cd5135d74

cheers
