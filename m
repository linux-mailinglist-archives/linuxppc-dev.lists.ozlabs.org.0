Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BD9612E6D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 01:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0vbq131nz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 11:46:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=chenlifu@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0vbC1dFmz2xbK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 11:45:53 +1100 (AEDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N0vSf0bQxzmVXy;
	Mon, 31 Oct 2022 08:40:18 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 08:45:17 +0800
Received: from [10.67.111.195] (10.67.111.195) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 31 Oct 2022 08:45:17 +0800
Message-ID: <8478195c-6d6e-d5ac-40f8-ab764419881e@huawei.com>
Date: Mon, 31 Oct 2022 08:45:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 -next] powerpc/powermac: Fix symbol not declared
 warnings
To: <benh@kernel.crashing.org>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <nick.child@ibm.com>,
	<zhengzucheng@huawei.com>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <paulus@samba.org>, <rppt@kernel.org>,
	<akpm@linux-foundation.org>, <oohall@gmail.com>
References: <20220819130616.2030769-1-chenlifu@huawei.com>
From: chenlifu <chenlifu@huawei.com>
In-Reply-To: <20220819130616.2030769-1-chenlifu@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.111.195]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

在 2022/8/19 21:06, Chen Lifu 写道:
> 1. ppc_override_l2cr and ppc_override_l2cr_value are only used in
>     l2cr_init() function, remove them and used *l2cr directly.
> 2. has_l2cache is not used outside of the file, so mark it static and
>     do not initialise statics to 0.
> 
> Fixes the following warning:
> 
> arch/powerpc/platforms/powermac/setup.c:74:5: warning: symbol 'ppc_override_l2cr' was not declared. Should it be static?
> arch/powerpc/platforms/powermac/setup.c:75:5: warning: symbol 'ppc_override_l2cr_value' was not declared. Should it be static?
> arch/powerpc/platforms/powermac/setup.c:76:5: warning: symbol 'has_l2cache' was not declared. Should it be static?
> 
> Signed-off-by: Chen Lifu <chenlifu@huawei.com>
> ---
>   arch/powerpc/platforms/powermac/setup.c | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
> index 04daa7f0a03c..49faa066b372 100644
> --- a/arch/powerpc/platforms/powermac/setup.c
> +++ b/arch/powerpc/platforms/powermac/setup.c
> @@ -68,13 +68,11 @@
>   
>   #include "pmac.h"
>   
>   #undef SHOW_GATWICK_IRQS
>   
> -int ppc_override_l2cr = 0;
> -int ppc_override_l2cr_value;
> -int has_l2cache = 0;
> +static int has_l2cache;
>   
>   int pmac_newworld;
>   
>   static int current_root_goodness = -1;
>   
> @@ -234,26 +232,21 @@ static void __init l2cr_init(void)
>   
>   		for_each_of_cpu_node(np) {
>   			const unsigned int *l2cr =
>   				of_get_property(np, "l2cr-value", NULL);
>   			if (l2cr) {
> -				ppc_override_l2cr = 1;
> -				ppc_override_l2cr_value = *l2cr;
>   				_set_L2CR(0);
> -				_set_L2CR(ppc_override_l2cr_value);
> +				_set_L2CR(*l2cr);
> +				printk(KERN_INFO "L2CR overridden (0x%x), "
> +				       "backside cache is %s\n",
> +				       *l2cr, ((*l2cr) & 0x80000000) ?
> +				       "enabled" : "disabled");
>   			}
>   			of_node_put(np);
>   			break;
>   		}
>   	}
> -
> -	if (ppc_override_l2cr)
> -		printk(KERN_INFO "L2CR overridden (0x%x), "
> -		       "backside cache is %s\n",
> -		       ppc_override_l2cr_value,
> -		       (ppc_override_l2cr_value & 0x80000000)
> -				? "enabled" : "disabled");
>   }
>   #endif
>   
>   static void __init pmac_setup_arch(void)
>   {

Friendly ping ...

