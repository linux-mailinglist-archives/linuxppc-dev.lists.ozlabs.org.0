Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D761526AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 08:10:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48CCPs4P9KzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 18:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=UEcN8lJl; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48CCN246tYzDqGT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 18:08:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48CCMy2cvlz9vC0w;
 Wed,  5 Feb 2020 08:08:46 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UEcN8lJl; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Y1E3cpL1tbsk; Wed,  5 Feb 2020 08:08:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48CCMy1Z4Xz9vC0v;
 Wed,  5 Feb 2020 08:08:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1580886526; bh=wk1eSZfKa/uCgbSeaHgMYGqmJFfEX4IDkxY2j1qLt5w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UEcN8lJl+hLeHllKoyJOwY62yfGvvpmIqaeajwXBqXqBdkh2b1rqwxDMOC6P57IRn
 3w1aFHGTQBExTzJaDV7Etbho4vLzNy5nTSwMEQSCiODyjwktRyijUsuLyYoZpRc621
 k8X4gKws4MWvQRplmTxxdcKt7iEUv8gGqfMo7lCA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 03A518B820;
 Wed,  5 Feb 2020 08:08:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SuJQpOUhv6DV; Wed,  5 Feb 2020 08:08:46 +0100 (CET)
Received: from [172.25.230.107] (unknown [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B90FA8B778;
 Wed,  5 Feb 2020 08:08:46 +0100 (CET)
Subject: Re: [PATCH 2/3] powerpc/sysfs: Show idle_purr and idle_spurr for
 every CPU
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
 <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b26cedb0-8b12-71b6-63d2-990186cd49e5@c-s.fr>
Date: Wed, 5 Feb 2020 08:08:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/11/2019 à 13:01, Gautham R. Shenoy a écrit :
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> On Pseries LPARs, to calculate utilization, we need to know the
> [S]PURR ticks when the CPUs were busy or idle.
> 
> The total PURR and SPURR ticks are already exposed via the per-cpu
> sysfs files /sys/devices/system/cpu/cpuX/purr and
> /sys/devices/system/cpu/cpuX/spurr.
> 
> This patch adds support for exposing the idle PURR and SPURR ticks via
> /sys/devices/system/cpu/cpuX/idle_purr and
> /sys/devices/system/cpu/cpuX/idle_spurr.

Might be a candid question, but I see in arch/powerpc/kernel/time.c that 
PURR/SPURR are already taken into account by the kernel to calculate 
utilisation when CONFIG_VIRT_CPU_ACCOUNTING_NATIVE is selected.

As far as I understand, you are wanting to expose this to userland to 
redo the calculation there. What is wrong with the values reported by 
the kernel ?

Christophe

> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>   arch/powerpc/kernel/sysfs.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
> index 80a676d..42ade55 100644
> --- a/arch/powerpc/kernel/sysfs.c
> +++ b/arch/powerpc/kernel/sysfs.c
> @@ -1044,6 +1044,36 @@ static ssize_t show_physical_id(struct device *dev,
>   }
>   static DEVICE_ATTR(physical_id, 0444, show_physical_id, NULL);
>   
> +static ssize_t idle_purr_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct cpu *cpu = container_of(dev, struct cpu, dev);
> +	unsigned int cpuid = cpu->dev.id;
> +	struct lppaca *cpu_lppaca_ptr = paca_ptrs[cpuid]->lppaca_ptr;
> +	u64 idle_purr_cycles = be64_to_cpu(cpu_lppaca_ptr->wait_state_cycles);
> +
> +	return sprintf(buf, "%llx\n", idle_purr_cycles);
> +}
> +static DEVICE_ATTR_RO(idle_purr);
> +
> +DECLARE_PER_CPU(u64, idle_spurr_cycles);
> +static ssize_t idle_spurr_show(struct device *dev,
> +			       struct device_attribute *attr, char *buf)
> +{
> +	struct cpu *cpu = container_of(dev, struct cpu, dev);
> +	unsigned int cpuid = cpu->dev.id;
> +	u64 *idle_spurr_cycles_ptr = per_cpu_ptr(&idle_spurr_cycles, cpuid);
> +
> +	return sprintf(buf, "%llx\n", *idle_spurr_cycles_ptr);
> +}
> +static DEVICE_ATTR_RO(idle_spurr);
> +
> +static void create_idle_purr_spurr_sysfs_entry(struct device *cpudev)
> +{
> +	device_create_file(cpudev, &dev_attr_idle_purr);
> +	device_create_file(cpudev, &dev_attr_idle_spurr);
> +}
> +
>   static int __init topology_init(void)
>   {
>   	int cpu, r;
> @@ -1067,6 +1097,8 @@ static int __init topology_init(void)
>   			register_cpu(c, cpu);
>   
>   			device_create_file(&c->dev, &dev_attr_physical_id);
> +			if (firmware_has_feature(FW_FEATURE_SPLPAR))
> +				create_idle_purr_spurr_sysfs_entry(&c->dev);
>   		}
>   	}
>   	r = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "powerpc/topology:online",
> 
