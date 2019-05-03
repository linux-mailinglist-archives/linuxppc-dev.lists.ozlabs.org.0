Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ED012912
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 09:49:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wPR574gvzDqVc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 17:49:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wNKW2dwhzDqPb
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 16:59:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 44wNKV3pwlz9sPV; Fri,  3 May 2019 16:59:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 44wNKV0SlRz9sPX; Fri,  3 May 2019 16:59:26 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: d6e8a150850601277039a548ffcdddd1bfe3e365
X-Patchwork-Hint: ignore
In-Reply-To: <155656174872.20636.6539465047019566013.stgit@jupiter>
To: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 1/3] powernv/mce: reduce mce console logs to lesser
 lines.
Message-Id: <44wNKV0SlRz9sPX@ozlabs.org>
Date: Fri,  3 May 2019 16:59:26 +1000 (AEST)
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-04-29 at 18:15:48 UTC, Mahesh Salgaonkar wrote:
> Also add cpu number while displaying mce log. This will help cleaner logs
> when mce hits on multiple cpus simultaneously.
> 
> before the changes the mce o/p was:
> 
> [  127.223515] Severe Machine check interrupt [Recovered]
> [  127.223530]   NIP [d00000000ba80280]: insert_slb_entry.constprop.0+0x278/0x2c0 [mcetest_slb]
> [  127.223539]   Initiator: CPU
> [  127.223544]   Error type: SLB [Multihit]
> [  127.223550]     Effective address: d00000000ba80280
> 
> After this patch series changes the mce o/p will be:
> 
> [  471.959843] MCE: CPU80: machine check (Warning) Host SLB Multihit [Recovered]
> [  471.959870] MCE: CPU80: NIP: [d00000000b550280] insert_slb_entry.constprop.0+0x278/0x2c0 [mcetest_slb]
> [  471.959892] MCE: CPU80: Probable software error (some chance of hardware cause)
> 
> UE in host application:
> 
> [ 1001.831517] MCE: CPU48: machine check (Severe) Host UE Load/Store DAR: 00007fffc6079a80 paddr: 0000000f8e260000 [Not recovered]
> [ 1001.831518] MCE: CPU48: PID: 4584 Comm: find NIP: [0000000010023368]
> [ 1001.831519] MCE: CPU48: Hardware error
> 
> and for MCE in Guest:
> 
> [ 1289.447571] MCE: CPU80: machine check (Warning) Guest SLB Multihit DAR: 000001001b6e0320 [Recovered]
> [ 1289.447615] MCE: CPU80: PID: 24765 Comm: qemu-system-ppc Guest NIP: [00007fffa309dc60]
> [ 1289.447634] MCE: CPU80: Probable software error (some chance of hardware cause)
> 
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/d6e8a150850601277039a548ffcdddd1

cheers
