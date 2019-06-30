Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0699B5AF7B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 10:47:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45c3z13h3HzDqxQ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2019 18:47:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45c3ln3fXszDqfd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 18:37:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45c3ln2bnFz9sND; Sun, 30 Jun 2019 18:37:25 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 9c9f8fb71feed144973a70455e0a4ee3da57ed2a
X-Patchwork-Hint: ignore
In-Reply-To: <20190610063229.32560-1-anju@linux.vnet.ibm.com>
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc/perf: Use cpumask_last() to determine the
 designated cpu for nest/core units.
Message-Id: <45c3ln2bnFz9sND@ozlabs.org>
Date: Sun, 30 Jun 2019 18:37:25 +1000 (AEST)
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
Cc: ego@linux.vnet.ibm.com, anju@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-06-10 at 06:32:29 UTC, Anju T Sudhakar wrote:
> Nest and core imc(In-memory Collection counters) assigns a particular
> cpu as the designated target for counter data collection.
> During system boot, the first online cpu in a chip gets assigned as
> the designated cpu for that chip(for nest-imc) and the first online cpu
> in a core gets assigned as the designated cpu for that core(for core-imc).
> 
> If the designated cpu goes offline, the next online cpu from the same
> chip(for nest-imc)/core(for core-imc) is assigned as the next target,
> and the event context is migrated to the target cpu.
> Currently, cpumask_any_but() function is used to find the target cpu.
> Though this function is expected to return a `random` cpu, this always
> returns the next online cpu.
> 
> If all cpus in a chip/core is offlined in a sequential manner, starting
> from the first cpu, the event migration has to happen for all the cpus
> which goes offline. Since the migration process involves a grace period,
> the total time taken to offline all the cpus will be significantly high.
> 
> Example:
> In a system which has 2 sockets, with
> NUMA node0 CPU(s):     0-87
> NUMA node8 CPU(s):     88-175
> 
> Time taken to offline cpu 88-175:
> real    2m56.099s
> user    0m0.191s
> sys     0m0.000s
> 
> Use cpumask_last() to choose the target cpu, when the designated cpu
> goes online, so the migration will happen only when the last_cpu in the
> mask goes offline. This way the time taken to offline all cpus in a
> chip/core can be reduced.
> 
> With the patch, 
> 
> Time taken  to offline cpu 88-175:
> real    0m12.207s
> user    0m0.171s
> sys     0m0.000s
> 
> 
> Offlining all cpus in reverse order is also taken care because,
> cpumask_any_but() is used to find the designated cpu if the last cpu in
> the mask goes offline. Since cpumask_any_but() always return the first
> cpu in the mask, that becomes the designated cpu and migration will happen
> only when the first_cpu in the mask goes offline.
> 
> Example:
> With the patch,
> 
> Time taken to offline cpu from 175-88:
> real    0m9.330s
> user    0m0.110s
> sys     0m0.000s
> 
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/9c9f8fb71feed144973a70455e0a4ee3da57ed2a

cheers
