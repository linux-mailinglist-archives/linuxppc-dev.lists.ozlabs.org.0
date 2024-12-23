Return-Path: <linuxppc-dev+bounces-4454-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076999FB2E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 17:33:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH3Vb6WkKz2yZ4;
	Tue, 24 Dec 2024 03:33:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.176.79.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734971607;
	cv=none; b=GCQBAVgi3TQtdKodqxKRn2+kw97diVDXxfXAm8yppVnrcVGlRk9v11ubXvGkdmZK5CG6+Ud8/Y7DRxWQ+Or1A1CqG0NvFey3gHx9o5MyDkDoxtueDeuTbv9OPe46GoP212AbqRPNh6eD8tSUSTEMls6Tu6lPXlXC0/lbW1cw7YMoqMzKWLPniueQDdYI/7kAcJYciTGp0pFkgYiZ/jWhIr0TWcJMbh69y7Q4f1J3+7BnT6P3jXJQSd+K/jtEyiW99kWNvYmLNxqg3KBObbQ0szJTTuKhAQ7u9a7ueZBYsmiFBGYAO9T+BuaDTetYsGomObTBSI2OEKS3SSvlvHeQrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734971607; c=relaxed/relaxed;
	bh=UlwxU9yU5UoX8moS94KBcUEK1tmdXrMY1Z1yZrD4Gl4=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RErItgyf/rW72vbRoKlmXBPeXMKFEYtUyWS2PUB8W6pufGo4FOB7XYwjMS+vKlCygLaa9nkraoaQ5Vl+253dDHIRbs3DzwiNVA9j+3xZe6IEhxz1YpydjxrhXtX1ffrz5jXMjQ/fsQul1z/0zWtYz1Ei3DxhLz4HiN8CarB3KrkQPRnGdmo4LHURIJcrxSuZKy6WTdGttq+g2/kFuBgMuL7lKat+LyMGNSJTFo/RnaSASCRlCSfoRL7SVn6YBtcrHfogoIh1ByG3xaDui5hxNTRBzL4T5XnIGpP7HEbbOJ+uROt2VLQPCqUzD8olc1WkTgfKa+Xt/1wuWy77wG+rAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=185.176.79.56; helo=frasgout.his.huawei.com; envelope-from=jonathan.cameron@huawei.com; receiver=lists.ozlabs.org)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH3VZ1dCdz2xxw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 03:33:22 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YH3V50KhNz6K75k;
	Tue, 24 Dec 2024 00:33:01 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E7597140517;
	Tue, 24 Dec 2024 00:33:17 +0800 (CST)
Received: from localhost (10.47.75.118) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 23 Dec
 2024 17:33:16 +0100
Date: Mon, 23 Dec 2024 16:33:14 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yicong Yang <yangyicong@huawei.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>, <linuxppc-dev@lists.ozlabs.org>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<prime.zeng@hisilicon.com>, <linuxarm@huawei.com>,
	<yangyicong@hisilicon.com>, <xuwei5@huawei.com>, <guohanjun@huawei.com>
Subject: Re: [PATCH v10 2/4] arch_topology: Support SMT control for OF based
 system
Message-ID: <20241223163314.00006fed@huawei.com>
In-Reply-To: <20241220075313.51502-3-yangyicong@huawei.com>
References: <20241220075313.51502-1-yangyicong@huawei.com>
	<20241220075313.51502-3-yangyicong@huawei.com>
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
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 20 Dec 2024 15:53:11 +0800
Yicong Yang <yangyicong@huawei.com> wrote:

> From: Yicong Yang <yangyicong@hisilicon.com>
> 
> On building the topology from the devicetree, we've already
> gotten the SMT thread number of each core. Update the largest
> SMT thread number and enable the SMT control by the end of
> topology parsing.
> 
> The core's SMT control provides two interface to the users [1]:
> 1) enable/disable SMT by writing on/off
> 2) enable/disable SMT by writing thread number 1/max_thread_number
> 
> If a system have more than one SMT thread number the 2) may
> not handle it well, since there're multiple thread numbers in the
> system and 2) only accept 1/max_thread_number. So issue a warning
> to notify the users if such system detected.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-devices-system-cpu#n542
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
Hi Yicong,

Apologies that I'm late to the game on this one.

A few comments inline.  Only important one is whether to bail out early
on error from parse_cluster()

Thanks,

Jonathan


> ---
>  drivers/base/arch_topology.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 3ebe77566788..9e81060144c7 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -11,6 +11,7 @@
>  #include <linux/cleanup.h>
>  #include <linux/cpu.h>
>  #include <linux/cpufreq.h>
> +#include <linux/cpu_smt.h>
>  #include <linux/device.h>
>  #include <linux/of.h>
>  #include <linux/slab.h>
> @@ -506,6 +507,10 @@ core_initcall(free_raw_capacity);
>  #endif
>  
>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +
> +/* Maximum SMT thread number detected used to enable the SMT control */
> +static unsigned int max_smt_thread_num;
> +
>  /*
>   * This function returns the logic cpu number of the node.
>   * There are basically three kinds of return values:
> @@ -565,6 +570,17 @@ static int __init parse_core(struct device_node *core, int package_id,
>  		i++;
>  	} while (1);
>  
> +	/*
> +	 * If max_smt_thread_num has been initialized and doesn't match
> +	 * the thread number of this entry, then the system has
> +	 * heterogeneous SMT topology.
> +	 */
> +	if (max_smt_thread_num && max_smt_thread_num != i)
> +		pr_warn_once("Heterogeneous SMT topology is partly supported by SMT control\n");
> +
> +	if (max_smt_thread_num < i)
> +		max_smt_thread_num = i;

Maybe more self documenting if you use min()? I'm not sure...
	max_smt_thread_num = min(max_smt_thread_num, i);


> +
>  	cpu = get_cpu_for_node(core);
>  	if (cpu >= 0) {
>  		if (!leaf) {
> @@ -677,6 +693,16 @@ static int __init parse_socket(struct device_node *socket)
>  	if (!has_socket)
>  		ret = parse_cluster(socket, 0, -1, 0);

Is it appropriate to check ret before setting num threads?
	if (!has_socket) {
		ret = parse_cluster(socket, 0, -1, 0);
		if (ret)
			return ret;
	}
...

	return 0;

>  
> +	/*
> +	 * Notify the CPU framework of the SMT support. Initialize the
> +	 * max_smt_thread_num to 1 if no SMT support detected. A thread
> +	 * number of 1 can be handled by the framework so we don't need
> +	 * to check max_smt_thread_num to see we support SMT or not.
> +	 */
> +	if (!max_smt_thread_num)
> +		max_smt_thread_num = 1;
> +
> +	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);

Trivial but I'd put a blank line here.

>  	return ret;
>  }
>  


