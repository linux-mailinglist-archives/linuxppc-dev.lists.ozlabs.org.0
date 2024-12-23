Return-Path: <linuxppc-dev+bounces-4455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C0D9FB2EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 17:34:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH3XJ0PD6z2yZN;
	Tue, 24 Dec 2024 03:34:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734971696;
	cv=none; b=YAsttuy49yp3cc96FN9C/qlsIOqcTKzkvKVHxVQXno33GbelHfOgdjIeDJHXVfb6QxjN1SY8D6+tph+MSHL0BkBH6kfgjUAfO5QQmJePfHvicb7tSbB7+0jrFGApg5F6+JawekB0D1LhHh+cKTxwhgqAAor0U0sUFL0LpDE60L7gBXfrcw0WODK4Zij5S7iLM4MpvXU6dbwaBF7p1mObceIzHD9S59heZM0O6TIhjXqpgISAvL1UEDX0OHoL5e22bl4c/TtUfQnukqc/Mop59WnBoP8XfuBKaSdZtLooe79O9Nx/eQwqWFaxjaF2R7kxcoR8Va+okvsuTEJH3Cd0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734971696; c=relaxed/relaxed;
	bh=iVYJ8ouxXEJ32vKRS7dpUfPVWa7BlVRd+beBSZ+Z43o=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=juk6mRxpIuND0ZMU/GyruZYojxjj5e6REU43nUXhZlSxynJqNMZzjMUJL1yAnWXDXCKugiSTkb5vBgRONeoivn/990dXZMFmulMF6U9fx97/4OGQly1ewAif88E0RS39dBe2DUXiVW1a1ZdVRyPRz5OURrF2Icv98RVUKozh1oEBJWfDUXSpVxywANrZV9EM0/cjB+owZED4NT4iAdA8SdvsY2JKti60jYyckaMNI7MP9ixgHwZjpUoEdrABSeUmqVpOLCXiQ5Y2RuJp1k8sN9a7t+9t0PaSzaxOkxdHNqzjVEkPLWMYTDZLA9U7xCziiocdyHzATi5jGrq69JAy8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH3XG6TZXz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 03:34:54 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3Wv2jWzz6K6jC;
	Tue, 24 Dec 2024 00:34:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 508A2140517;
	Tue, 24 Dec 2024 00:34:52 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:34:50 +0100
Date: Mon, 23 Dec 2024 16:34:48 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <yangyicong@hisilicon.com>,
	<linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: Re: [PATCH v10 1/4] cpu/SMT: Provide a default
 topology_is_primary_thread()
Message-ID: <20241223163448.00004354@huawei.com>
In-Reply-To: <a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-2-yangyicong@huawei.com>
	<a5690fee-3019-f26c-8bad-1d95e388e877@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.75.118]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 20 Dec 2024 15:59:27 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> On 2024/12/20 15:53, Yicong Yang wrote:
> > From: Yicong Yang <yangyicong@hisilicon.com>
> > 
> > Currently if architectures want to support HOTPLUG_SMT they need to
> > provide a topology_is_primary_thread() telling the framework which
> > thread in the SMT cannot offline. However arm64 doesn't have a
> > restriction on which thread in the SMT cannot offline, a simplest
> > choice is that just make 1st thread as the "primary" thread. So
> > just make this as the default implementation in the framework and
> > let architectures like x86 that have special primary thread to
> > override this function (which they've already done).
> > 
> > There's no need to provide a stub function if !CONFIG_SMP or
> > !CONFIG_HOTPLUG_SMP. In such case the testing CPU is already
> > the 1st CPU in the SMT so it's always the primary thread.
> > 
> > Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> > ---
> > As questioned in v9 [1] whether this works on architectures not using
> > CONFIG_GENERIC_ARCH_TOPOLOGY, hacked on LoongArch VM and this also works.
> > Architectures should use this on their own situation.
> > [1] https://lore.kernel.org/linux-arm-kernel/427bd639-33c3-47e4-9e83-68c428eb1a7d@arm.com/
> > 
> > [root@localhost smt]# uname -m
> > loongarch64
> > [root@localhost smt]# pwd
> > /sys/devices/system/cpu/smt
> > [root@localhost smt]# cat ../possible 
> > 0-3
> > [root@localhost smt]# cat ../online 
> > 0-3
> > [root@localhost smt]# cat control 
> > on
> > [root@localhost smt]# echo off > control 
> > [root@localhost smt]# cat control 
> > off
> > [root@localhost smt]# cat ../online 
> > 0,2
> > [root@localhost smt]# echo on > control 
> > [root@localhost smt]# cat control 
> > on
> > [root@localhost smt]# cat ../online 
> > 0-3  
> 
> Tested with below code using the topology_is_primary_thread() introduced
> in this patch. Tested on an ACPI-based QEMU VM emulating SMT2.
Nice bit of testing.

Given it all seems fine. FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
(for original patch, not the longarch one!)

> 
> Subject: [PATCH] LoongArch: Support HOTPLUG_SMT on ACPI-based system
> 
> Support HOTPLUG_SMT on ACPI-based system using generic
> topology_is_primary_thread().
> 
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> ---
>  arch/loongarch/Kconfig       |  1 +
>  arch/loongarch/kernel/acpi.c | 26 ++++++++++++++++++++++++--
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
> index dae3a9104ca6..bed1b0640b97 100644
> --- a/arch/loongarch/Kconfig
> +++ b/arch/loongarch/Kconfig
> @@ -172,6 +172,7 @@ config LOONGARCH
>  	select HAVE_SYSCALL_TRACEPOINTS
>  	select HAVE_TIF_NOHZ
>  	select HAVE_VIRT_CPU_ACCOUNTING_GEN if !SMP
> +	select HOTPLUG_SMT if HOTPLUG_CPU
>  	select IRQ_FORCED_THREADING
>  	select IRQ_LOONGARCH_CPU
>  	select LOCK_MM_AND_FIND_VMA
> diff --git a/arch/loongarch/kernel/acpi.c b/arch/loongarch/kernel/acpi.c
> index 382a09a7152c..e642b0de57e7 100644
> --- a/arch/loongarch/kernel/acpi.c
> +++ b/arch/loongarch/kernel/acpi.c
> @@ -15,9 +15,11 @@
>  #include <linux/memblock.h>
>  #include <linux/of_fdt.h>
>  #include <linux/serial_core.h>
> +#include <linux/xarray.h>
>  #include <asm/io.h>
>  #include <asm/numa.h>
>  #include <asm/loongson.h>
> +#include <linux/cpu_smt.h>
> 
>  int acpi_disabled;
>  EXPORT_SYMBOL(acpi_disabled);
> @@ -175,8 +177,12 @@ int pptt_enabled;
> 
>  int __init parse_acpi_topology(void)
>  {
> +	int thread_num, max_smt_thread_num = 1;
> +	struct xarray core_threads;
>  	int cpu, topology_id;
> +	void *entry;
> 
> +	xa_init(&core_threads);
>  	for_each_possible_cpu(cpu) {
>  		topology_id = find_acpi_cpu_topology(cpu, 0);
>  		if (topology_id < 0) {
> @@ -184,19 +190,35 @@ int __init parse_acpi_topology(void)
>  			return -ENOENT;
>  		}
> 
> -		if (acpi_pptt_cpu_is_thread(cpu) <= 0)
> +		if (acpi_pptt_cpu_is_thread(cpu) <= 0) {
>  			cpu_data[cpu].core = topology_id;
> -		else {
> +		} else {
>  			topology_id = find_acpi_cpu_topology(cpu, 1);
>  			if (topology_id < 0)
>  				return -ENOENT;
> 
>  			cpu_data[cpu].core = topology_id;
> +
> +			entry = xa_load(&core_threads, topology_id);
> +			if (!entry) {
> +				xa_store(&core_threads, topology_id,
> +					 xa_mk_value(1), GFP_KERNEL);
> +			} else {
> +				thread_num = xa_to_value(entry);
> +				thread_num++;
> +				xa_store(&core_threads, topology_id,
> +					 xa_mk_value(thread_num), GFP_KERNEL);
> +
> +				if (thread_num > max_smt_thread_num)
> +					max_smt_thread_num = thread_num;
> +			}
>  		}
>  	}
> 
>  	pptt_enabled = 1;
> 
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
> +	xa_destroy(&core_threads);
>  	return 0;
>  }
> 


