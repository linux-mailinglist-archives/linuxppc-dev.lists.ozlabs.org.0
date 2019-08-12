Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547C89F75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 15:19:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466byz4ydvzDqMW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 23:19:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466btM2RDPzDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 23:15:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 466btK49TZz9sN6; Mon, 12 Aug 2019 23:15:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: b9ee5e04fd77898208c51b1395fa0b5e8536f9b6
In-Reply-To: <bef479514f4c08329fa649f67735df8918bc0976.1565268248.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Chris Packham <Chris.Packham@alliedtelesis.co.nz>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64e: drop stale call to smp_processor_id() which
 hangs SMP startup
Message-Id: <466btK49TZz9sN6@ozlabs.org>
Date: Mon, 12 Aug 2019 23:15:05 +1000 (AEST)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-08-08 at 12:48:26 UTC, Christophe Leroy wrote:
> Santa commit ebb9d30a6a74 ("powerpc/mm: any thread in one core can be
> the first to setup TLB1") removed the need to know the cpu_id in
> early_init_this_mmu(), but the call to smp_processor_id() which was
> marked __maybe_used remained.
> 
> Since commit ed1cd6deb013 ("powerpc: Activate
> CONFIG_THREAD_INFO_IN_TASK") thread_info cannot be reached before mmu
> is properly set up.
> 
> Drop this stale call to smp_processor_id() which make SMP hang
> when CONFIG_PREEMPT is set.
> 
> Reported-by: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
> Fixes: ebb9d30a6a74 ("powerpc/mm: any thread in one core can be the first to setup TLB1")
> Link: https://github.com/linuxppc/issues/issues/264
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: stable@vger.kernel.org

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/b9ee5e04fd77898208c51b1395fa0b5e8536f9b6

cheers
