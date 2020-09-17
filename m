Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C8426DB4E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:17:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsbZ75StGzDqbs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsZSn4C30zDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:27:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BsZSl0HLFz9sVf; Thu, 17 Sep 2020 21:27:34 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v5 00/10] Coregroup support on Powerpc
Message-Id: <160034201134.3339803.10634582499637013510.b4-ty@ellerman.id.au>
Date: Thu, 17 Sep 2020 21:27:34 +1000 (AEST)
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Anton Blanchard <anton@au1.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 10 Aug 2020 12:48:24 +0530, Srikar Dronamraju wrote:
> Changelog v4->v5:
> v4: http://lore.kernel.org/lkml/20200727053230.19753-1-srikar@linux.vnet.ibm.com/t/#u
> 
> Changelog v4 ->v5:
> powerpc/smp: Optimize start_secondary
> 	Retain cache domain, no need for generalization
> 		 (Michael Ellerman, Peter Zijlstra,
> 		 Valentin Schneider, Gautham R. Shenoy)
> 
> [...]

Applied to powerpc/next.

[01/10] powerpc/smp: Fix a warning under !NEED_MULTIPLE_NODES
        https://git.kernel.org/powerpc/c/d0fd24bbd27619d7b8d4da26a19a2027931ae9fc
[02/10] powerpc/smp: Merge Power9 topology with Power topology
        https://git.kernel.org/powerpc/c/2ef0ca54d97f40f7621d595ac5479bd7fa076bfa
[03/10] powerpc/smp: Move powerpc_topology above
        https://git.kernel.org/powerpc/c/5e93f16ae48b728775496429c6db53d0bf8cdd9b
[04/10] powerpc/smp: Move topology fixups into a new function
        https://git.kernel.org/powerpc/c/3c6032a8fe99547d31b2b57715e303a67d1b0c66
[05/10] powerpc/smp: Dont assume l2-cache to be superset of sibling
        https://git.kernel.org/powerpc/c/f6606cfdfbcda00ce8a6e63c8fc13c93e73ac059
[06/10] powerpc/smp: Optimize start_secondary
        https://git.kernel.org/powerpc/c/caa8e29da59926bef099b46ab6280333d583e944
[07/10] powerpc/numa: Detect support for coregroup
        https://git.kernel.org/powerpc/c/f9f130ff2ec93c5949576bbfb168cc9530c23649
[08/10] powerpc/smp: Allocate cpumask only after searching thread group
        https://git.kernel.org/powerpc/c/6e086302816b2ced602bc99641eb0189c05f018a
[09/10] powerpc/smp: Create coregroup domain
        https://git.kernel.org/powerpc/c/72730bfc2a2b91a525f38dfc830f598bdb95f216
[10/10] powerpc/smp: Implement cpu_to_coregroup_id
        https://git.kernel.org/powerpc/c/fa35e868f9ddcbb7984fd5ab7f91aef924fa8543

cheers
