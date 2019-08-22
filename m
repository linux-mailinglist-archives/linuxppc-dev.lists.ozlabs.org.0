Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3F6994E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:25:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DldN0RhTzDqXZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGc6JF2zDrPt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:08:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGc4v5Jz9sNy; Thu, 22 Aug 2019 23:08:56 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 8f51e3929470942e6a8744061254fdeef646cd36
In-Reply-To: <20190724084638.24982-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/5] powerpc/64s/radix: Fix memory hotplug section page
 table creation
Message-Id: <46DlGc4v5Jz9sNy@ozlabs.org>
Date: Thu, 22 Aug 2019 23:08:56 +1000 (AEST)
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
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-24 at 08:46:34 UTC, Nicholas Piggin wrote:
> create_physical_mapping expects physical addresses, but creating and
> splitting these mappings after boot is supplying virtual (effective)
> addresses. This can be irritated by booting with mem= to limit memory
> then probing an unused physical memory range:
> 
>   echo <addr> > /sys/devices/system/memory/probe
> 
> This mostly works by accident, firstly because __va(__va(x)) == __va(x)
> so the virtual address does not get corrupted. Secondly because pfn_pte
> masks out the upper bits of the pfn beyond the physical address limit,
> so a pfn constructed with a 0xc000000000000000 virtual linear address
> will be masked back to the correct physical address in the pte.
> 
> Cc: Reza Arbab <arbab@linux.vnet.ibm.com>
> Fixes: 6cc27341b21a8 ("powerpc/mm: add radix__create_section_mapping()")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/8f51e3929470942e6a8744061254fdeef646cd36

cheers
