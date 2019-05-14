Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8191C394
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 09:02:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4537t32SYBzDqJ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 17:02:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4537qS49bLzDqKM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 17:00:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4537qS0Z2pz9sML;
 Tue, 14 May 2019 17:00:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RESEND PATCH] powerpc/pseries: Fix cpu_hotplug_lock acquisition
 in resize_hpt
In-Reply-To: <1557480294-808-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1557480294-808-1-git-send-email-ego@linux.vnet.ibm.com>
Date: Tue, 14 May 2019 17:00:19 +1000
Message-ID: <877eattta4.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

"Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
>
> During a memory hotplug operations involving resizing of the HPT, we
> invoke a stop_machine() to perform the resizing. In this code path, we
> end up recursively taking the cpu_hotplug_lock, first in
> memory_hotplug_begin() and then subsequently in stop_machine(). This
> causes the system to hang.

This implies we have never tested a memory hotplug that resized the HPT.
Is that really true? Or did something change?

> With lockdep enabled we get the following
> error message before the hang.
>
>   swapper/0/1 is trying to acquire lock:
>   (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: stop_machine+0x2c/0x60
>
>   but task is already holding lock:
>   (____ptrval____) (cpu_hotplug_lock.rw_sem){++++}, at: mem_hotplug_begin+0x20/0x50

Do we have the full stack trace?

>   other info that might help us debug this:
>    Possible unsafe locking scenario:
>
>          CPU0
>          ----
>     lock(cpu_hotplug_lock.rw_sem);
>     lock(cpu_hotplug_lock.rw_sem);
>
>    *** DEADLOCK ***
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
> ---
>
> Rebased this one against powerpc/next instead of linux/master.
>
>  arch/powerpc/mm/book3s64/hash_utils.c | 9 ++++++++-
>  arch/powerpc/platforms/pseries/lpar.c | 8 ++++++--
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 919a861..d07fcafd 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -38,6 +38,7 @@
>  #include <linux/libfdt.h>
>  #include <linux/pkeys.h>
>  #include <linux/hugetlb.h>
> +#include <linux/cpu.h>
>  
>  #include <asm/debugfs.h>
>  #include <asm/processor.h>
> @@ -1928,10 +1929,16 @@ static int hpt_order_get(void *data, u64 *val)
>  
>  static int hpt_order_set(void *data, u64 val)
>  {
> +	int ret;
> +
>  	if (!mmu_hash_ops.resize_hpt)
>  		return -ENODEV;
>  
> -	return mmu_hash_ops.resize_hpt(val);
> +	cpus_read_lock();
> +	ret = mmu_hash_ops.resize_hpt(val);
> +	cpus_read_unlock();
> +
> +	return ret;
>  }
>  
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_hpt_order, hpt_order_get, hpt_order_set, "%llu\n");
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index 1034ef1..2fc9756 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -859,7 +859,10 @@ static int pseries_lpar_resize_hpt_commit(void *data)
>  	return 0;
>  }
>  
> -/* Must be called in user context */
> +/*
> + * Must be called in user context. The caller should hold the

I realise you're just copying that comment, but it seems wrong. "user
context" means userspace. I think it means "process context" doesn't it?

Also "should" should be "must" :)

> + * cpus_lock.
> + */
>  static int pseries_lpar_resize_hpt(unsigned long shift)
>  {
>  	struct hpt_resize_state state = {
> @@ -913,7 +916,8 @@ static int pseries_lpar_resize_hpt(unsigned long shift)
>  
>  	t1 = ktime_get();
>  
> -	rc = stop_machine(pseries_lpar_resize_hpt_commit, &state, NULL);
> +	rc = stop_machine_cpuslocked(pseries_lpar_resize_hpt_commit,
> +				     &state, NULL);
>  
>  	t2 = ktime_get();

cheers
