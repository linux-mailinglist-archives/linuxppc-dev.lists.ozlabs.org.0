Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0EC5297E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 05:22:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2Lz44RZmz3c8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 13:22:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2Lyb0CHcz3bns
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 13:22:13 +1000 (AEST)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L2Lv53BRsz923h;
 Tue, 17 May 2022 11:19:13 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 17 May 2022 11:22:06 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 11:22:06 +0800
Message-ID: <9b3e61b8-ecab-08ff-a3b6-83d6862ead77@huawei.com>
Date: Tue, 17 May 2022 11:22:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] locking/csd_lock: change csdlock_debug from
 early_param to __setup
Content-Language: en-US
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-arch@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <stable@vger.kernel.org>
References: <20220510094639.106661-1-chenzhongjin@huawei.com>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20220510094639.106661-1-chenzhongjin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500013.china.huawei.com (7.185.36.172)
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
Cc: jgross@suse.com, gor@linux.ibm.com, paulmck@kernel.org,
 peterz@infradead.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 namit@vmware.com, tglx@linutronix.de, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022/5/10 17:46, Chen Zhongjin wrote:
> csdlock_debug uses early_param and static_branch_enable() to enable
> csd_lock_wait feature, which triggers a panic on arm64 with config:
> CONFIG_SPARSEMEM=y
> CONFIG_SPARSEMEM_VMEMMAP=n
> 
> With CONFIG_SPARSEMEM_VMEMMAP=n, __nr_to_section is called in
> static_key_enable() and returns NULL which makes NULL dereference
> because mem_section is initialized in sparse_init() which is later
> than parse_early_param() stage.
> 
> For powerpc this is also broken, because early_param stage is
> earlier than jump_label_init() so static_key_enable won't work.
> powerpc throws an warning: "static key 'xxx' used before call
> to jump_label_init()".
> 
> Thus, early_param is too early for csd_lock_wait to run
> static_branch_enable(), so changes it to __setup to fix these.
> 
> Fixes: 8d0968cc6b8f ("locking/csd_lock: Add boot parameter for controlling CSD lock debugging")
> Cc: stable@vger.kernel.org
> Reported-by: Chen jingwen <chenjingwen6@huawei.com>
> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> ---
> Change v3 -> v4:
> Fix title and description because this fix is also applied
> to powerpc.
> For more detailed arm64 bug report see:
> https://lore.kernel.org/linux-arm-kernel/e8715911-f835-059d-27f8-cc5f5ad30a07@huawei.com/t/
> 
> Change v2 -> v3:
> Add module name in title
> 
> Change v1 -> v2:
> Fix return 1 for __setup
> ---
>  kernel/smp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/smp.c b/kernel/smp.c
> index 65a630f62363..381eb15cd28f 100644
> --- a/kernel/smp.c
> +++ b/kernel/smp.c
> @@ -174,9 +174,9 @@ static int __init csdlock_debug(char *str)
>  	if (val)
>  		static_branch_enable(&csdlock_debug_enabled);
>  
> -	return 0;
> +	return 1;
>  }
> -early_param("csdlock_debug", csdlock_debug);
> +__setup("csdlock_debug=", csdlock_debug);
>  
>  static DEFINE_PER_CPU(call_single_data_t *, cur_csd);
>  static DEFINE_PER_CPU(smp_call_func_t, cur_csd_func);

Ping for review. Thanks！

