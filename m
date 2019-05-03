Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C67821285D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:03:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wNPt2LtjzDqX2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:03:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNK61KvvzDqPW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNK60Ghwz9sBb; Fri,  3 May 2019 16:59:05 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 860b7d2286236170a36f94946d03ca9888d32571
X-Patchwork-Hint: ignore
In-Reply-To: <20181218062041.25198-1-anju@linux.vnet.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/perf: Fix loop exit condition in
 nest_imc_event_init
Message-Id: <44wNK60Ghwz9sBb@ozlabs.org>
Date: Fri,  3 May 2019 16:59:05 +1000 (AEST)
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 anju@linux.vnet.ibm.com, dan.carpenter@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2018-12-18 at 06:20:41 UTC, Anju T Sudhakar wrote:
> The data structure (i.e struct imc_mem_info) to hold the memory address
> information for nest imc units is allocated based on the number of nodes
> in the system.
> 
> nest_imc_event_init() traverse this struct array to calculate the memory
> base address for the event-cpu. If we fail to find a match for the event
> cpu's chip-id in imc_mem_info struct array, then the do-while loop will
> iterate until we crash.
> 
> Fix this by changing the loop exit condition based on the number of 
> non zero vbase elements in the array, since the allocation is done for
> nr_chips + 1.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com> 
> Fixes: 885dcd709ba91 ( powerpc/perf: Add nest IMC PMU support)
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/860b7d2286236170a36f94946d03ca98

cheers
