Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4211A47F9FF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 04:51:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMkHR0Qbyz3c8G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 14:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=heying24@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 997 seconds by postgrey-1.36 at boromir;
 Mon, 27 Dec 2021 14:51:08 AEDT
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMkH06Cxtz2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 14:51:04 +1100 (AEDT)
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JMjtX425Wzcc5l;
 Mon, 27 Dec 2021 11:33:24 +0800 (CST)
Received: from [10.67.110.136] (10.67.110.136) by
 dggeme756-chm.china.huawei.com (10.3.19.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.20; Mon, 27 Dec 2021 11:33:51 +0800
Subject: Re: [PATCH] powerpc/sysdev/of_rtc: Fix possible memory leak in
 of_instantiate_rtc
From: He Ying <heying24@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
References: <20211103014717.162886-1-heying24@huawei.com>
Message-ID: <be9e4adc-748b-cada-54df-a8d52515c3a8@huawei.com>
Date: Mon, 27 Dec 2021 11:33:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20211103014717.162886-1-heying24@huawei.com>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.136]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping. Any ideas about this patch?

ÔÚ 2021/11/3 9:47, He Ying Ð´µÀ:
> If of_address_to_resource() in of_instantiate_rtc() fails, previously
> allocated memory res is not freed. Add missing kfree() for it.
>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>   arch/powerpc/sysdev/of_rtc.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/sysdev/of_rtc.c b/arch/powerpc/sysdev/of_rtc.c
> index 1f408d34a6a7..23b896996c2f 100644
> --- a/arch/powerpc/sysdev/of_rtc.c
> +++ b/arch/powerpc/sysdev/of_rtc.c
> @@ -44,6 +44,7 @@ void __init of_instantiate_rtc(void)
>   				printk(KERN_ERR "OF RTC: Error "
>   				       "translating resources for %pOF\n",
>   				       node);
> +				kfree(res);
>   				continue;
>   			}
>   
