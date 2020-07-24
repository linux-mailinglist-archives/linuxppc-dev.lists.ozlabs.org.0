Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E7822C79E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:14:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCrmw2bFgzDrFl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:14:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgC1ZffzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgB1cwsz9sTC; Fri, 24 Jul 2020 23:24:38 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3 0/4] powerpc/mm/radix: Memory unplug fixes
Message-Id: <159559695973.1657499.17782985054188665494.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:38 +1000 (AEST)
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
Cc: Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jul 2020 18:49:21 +0530, Aneesh Kumar K.V wrote:
> This is the next version of the fixes for memory unplug on radix.
> The issues and the fix are described in the actual patches.
> 
> Changes from v2:
> - Address review feedback
> 
> Changes from v1:
> - Added back patch to drop split_kernel_mapping
> - Most of the split_kernel_mapping related issues are now described
>   in the removal patch
> - drop pte fragment change
> - use lmb size as the max mapping size.
> - Radix baremetal now use memory block size of 1G.
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/mm/radix: Fix PTE/PMD fragment count for early page table mappings
      https://git.kernel.org/powerpc/c/645d5ce2f7d6cb4dcf6a4e087fb550e238d24283
[2/4] powerpc/mm/radix: Free PUD table when freeing pagetable
      https://git.kernel.org/powerpc/c/9ce8853b4a735c8115f55ac0e9c2b27a4c8f80b5
[3/4] powerpc/mm/radix: Remove split_kernel_mapping()
      https://git.kernel.org/powerpc/c/d6d6ebfc5dbb4008be21baa4ec2ad45606578966
[4/4] powerpc/mm/radix: Create separate mappings for hot-plugged memory
      https://git.kernel.org/powerpc/c/af9d00e93a4f062c5f160325d7b8f33336f6744e

cheers
