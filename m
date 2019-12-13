Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A311ECCE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 22:23:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZNvP1N5QzDrKb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 08:23:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZNph382ZzDqw1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 08:19:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 47ZNph0MYTz9sP3; Sat, 14 Dec 2019 08:19:40 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47ZNpg6rD7z9sPW; Sat, 14 Dec 2019 08:19:39 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 14c73bd344da60abaf7da3ea2e7733ddda35bbac
In-Reply-To: <20191213035036.6913-1-mpe@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v5 1/2] powerpc/vcpu: Assume dedicated processors as
 non-preempt
Message-Id: <47ZNpg6rD7z9sPW@ozlabs.org>
Date: Sat, 14 Dec 2019 08:19:39 +1100 (AEDT)
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
Cc: juri.lelli@redhat.com, parth@linux.ibm.com, pauld@redhat.com,
 srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com, Ihor.Pasichnyk@ibm.com,
 longman@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-12-13 at 03:50:35 UTC, Michael Ellerman wrote:
> From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> 
> With commit 247f2f6f3c70 ("sched/core: Don't schedule threads on
> pre-empted vCPUs"), the scheduler avoids preempted vCPUs to schedule
> tasks on wakeup. This leads to wrong choice of CPU, which in-turn
> leads to larger wakeup latencies. Eventually, it leads to performance
> regression in latency sensitive benchmarks like soltp, schbench etc.
> 
> On Powerpc, vcpu_is_preempted() only looks at yield_count. If the
> yield_count is odd, the vCPU is assumed to be preempted. However
> yield_count is increased whenever the LPAR enters CEDE state (idle).
> So any CPU that has entered CEDE state is assumed to be preempted.
> 
> Even if vCPU of dedicated LPAR is preempted/donated, it should have
> right of first-use since they are supposed to own the vCPU.
...
> 
> Waiman Long suggested using static_keys.
> 
> Fixes: 247f2f6f3c70 ("sched/core: Don't schedule threads on pre-empted vCPUs")
> Cc: stable@vger.kernel.org # v4.18+
> Reported-by: Parth Shah <parth@linux.ibm.com>
> Reported-by: Ihor Pasichnyk <Ihor.Pasichnyk@ibm.com>
> Tested-by: Juri Lelli <juri.lelli@redhat.com>
> Acked-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Acked-by: Phil Auld <pauld@redhat.com>
> Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> Tested-by: Parth Shah <parth@linux.ibm.com>
> [mpe: Move the key and setting of the key to pseries/setup.c]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Series applied to powerpc fixes.

https://git.kernel.org/powerpc/c/14c73bd344da60abaf7da3ea2e7733ddda35bbac

cheers
