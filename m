Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF68994A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:12:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DlLL5JjYzDrP4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 23:12:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DlGY0WdpzDrC0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 23:08:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46DlGX5qJ5z9sNk; Thu, 22 Aug 2019 23:08:52 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c784be435d5dae28d3b03db31753dd7a18733f0c
In-Reply-To: <1557906352-29048-1-git-send-email-ego@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/pseries: Fix cpu_hotplug_lock acquisition in
 resize_hpt()
Message-Id: <46DlGX5qJ5z9sNk@ozlabs.org>
Date: Thu, 22 Aug 2019 23:08:52 +1000 (AEST)
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-05-15 at 07:45:52 UTC, "Gautham R. Shenoy" wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> The calls to arch_add_memory()/arch_remove_memory() are always made
> with the read-side cpu_hotplug_lock acquired via
> memory_hotplug_begin().  On pSeries,
> arch_add_memory()/arch_remove_memory() eventually call resize_hpt()
> which in turn calls stop_machine() which acquires the read-side
> cpu_hotplug_lock again, thereby resulting in the recursive acquisition
> of this lock.
...
> 
> Fix this issue by
>   1) Requiring all the calls to pseries_lpar_resize_hpt() be made
>      with cpu_hotplug_lock held.
> 
>   2) In pseries_lpar_resize_hpt() invoke stop_machine_cpuslocked()
>      as a consequence of 1)
> 
>   3) To satisfy 1), in hpt_order_set(), call mmu_hash_ops.resize_hpt()
>      with cpu_hotplug_lock held.
> 
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/c784be435d5dae28d3b03db31753dd7a18733f0c

cheers
