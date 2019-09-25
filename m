Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 916D5BDCD2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:14:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46db6Y34nhzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:14:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dZwJ5t0TzDqZQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:05:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46dZwJ4fsTz9sPc; Wed, 25 Sep 2019 21:05:20 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 3a83f677a6eeff65751b29e3648d7c69c3be83f3
In-Reply-To: <20190911223155.16045-1-mdroth@linux.vnet.ibm.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] KVM: PPC: Book3S HV: use smp_mb() when
 setting/clearing host_ipi flag
Message-Id: <46dZwJ4fsTz9sPc@ozlabs.org>
Date: Wed, 25 Sep 2019 21:05:20 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-09-11 at 22:31:55 UTC, Michael Roth wrote:
> On a 2-socket Power9 system with 32 cores/128 threads (SMT4) and 1TB
> of memory running the following guest configs:
...
> To handle both cases, this patch splits kvmppc_set_host_ipi() into
> separate set/clear functions, where we execute smp_mb() prior to
> setting host_ipi flag, and after clearing host_ipi flag. These
> functions pair with each other to synchronize the sender and receiver
> sides.
> 
> With that change in place the above workload ran for 20 hours without
> triggering any lock-ups.
> 
> Fixes: 755563bc79c7 ("powerpc/powernv: Fixes for hypervisor doorbell handling") # v4.0
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Paul Mackerras <paulus@ozlabs.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: kvm-ppc@vger.kernel.org
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>

Applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/3a83f677a6eeff65751b29e3648d7c69c3be83f3

cheers
