Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD905359C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 09:05:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8bRj4QL6z3bkF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 17:05:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=chenzhongjin@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 957 seconds by postgrey-1.36 at boromir; Fri, 27 May 2022 17:05:16 AEST
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8bRJ0QjRz2yn2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 17:05:15 +1000 (AEST)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.55])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4L8b4Z3QVBzDqT6;
	Fri, 27 May 2022 14:49:02 +0800 (CST)
Received: from dggpemm500013.china.huawei.com (7.185.36.172) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 27 May 2022 14:49:08 +0800
Received: from [127.0.0.1] (10.67.108.67) by dggpemm500013.china.huawei.com
 (7.185.36.172) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 27 May
 2022 14:49:08 +0800
Message-ID: <fd69f464-4cc9-859e-d38d-bda85e6b33a6@huawei.com>
Date: Fri, 27 May 2022 14:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4] locking/csd_lock: change csdlock_debug from
 early_param to __setup
Content-Language: en-US
To: <paulmck@kernel.org>
References: <20220510094639.106661-1-chenzhongjin@huawei.com>
 <9b3e61b8-ecab-08ff-a3b6-83d6862ead77@huawei.com>
 <20220518011101.GK1790663@paulmck-ThinkPad-P17-Gen-1>
From: Chen Zhongjin <chenzhongjin@huawei.com>
In-Reply-To: <20220518011101.GK1790663@paulmck-ThinkPad-P17-Gen-1>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.67]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
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
Cc: linux-arch@vger.kernel.org, jgross@suse.com, gor@linux.ibm.com, peterz@infradead.org, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, namit@vmware.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2022/5/18 9:11, Paul E. McKenney wrote:
> On Tue, May 17, 2022 at 11:22:04AM +0800, Chen Zhongjin wrote:
>> On 2022/5/10 17:46, Chen Zhongjin wrote:
>>> csdlock_debug uses early_param and static_branch_enable() to enable
>>> csd_lock_wait feature, which triggers a panic on arm64 with config:
>>> CONFIG_SPARSEMEM=y
>>> CONFIG_SPARSEMEM_VMEMMAP=n
>>>
>>> With CONFIG_SPARSEMEM_VMEMMAP=n, __nr_to_section is called in
>>> static_key_enable() and returns NULL which makes NULL dereference
>>> because mem_section is initialized in sparse_init() which is later
>>> than parse_early_param() stage.
>>>
>>> For powerpc this is also broken, because early_param stage is
>>> earlier than jump_label_init() so static_key_enable won't work.
>>> powerpc throws an warning: "static key 'xxx' used before call
>>> to jump_label_init()".
>>>
>>> Thus, early_param is too early for csd_lock_wait to run
>>> static_branch_enable(), so changes it to __setup to fix these.
>>>
>>> Fixes: 8d0968cc6b8f ("locking/csd_lock: Add boot parameter for controlling CSD lock debugging")
>>> Cc: stable@vger.kernel.org
>>> Reported-by: Chen jingwen <chenjingwen6@huawei.com>
>>> Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
>>> ---
>>> Change v3 -> v4:
>>> Fix title and description because this fix is also applied
>>> to powerpc.
>>> For more detailed arm64 bug report see:
>>> https://lore.kernel.org/linux-arm-kernel/e8715911-f835-059d-27f8-cc5f5ad30a07@huawei.com/t/
>>>
>>> Change v2 -> v3:
>>> Add module name in title
>>>
>>> Change v1 -> v2:
>>> Fix return 1 for __setup
>>> ---
>>>  kernel/smp.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/kernel/smp.c b/kernel/smp.c
>>> index 65a630f62363..381eb15cd28f 100644
>>> --- a/kernel/smp.c
>>> +++ b/kernel/smp.c
>>> @@ -174,9 +174,9 @@ static int __init csdlock_debug(char *str)
>>>  	if (val)
>>>  		static_branch_enable(&csdlock_debug_enabled);
>>>  
>>> -	return 0;
>>> +	return 1;
>>>  }
>>> -early_param("csdlock_debug", csdlock_debug);
>>> +__setup("csdlock_debug=", csdlock_debug);
>>>  
>>>  static DEFINE_PER_CPU(call_single_data_t *, cur_csd);
>>>  static DEFINE_PER_CPU(smp_call_func_t, cur_csd_func);
>>
>> Ping for review. Thanks！
> 
> I have pulled it into -rcu for testing and further review.  It might
> well need to go through some other path, though.
>> 								Thanx, Paul
> .

So did it have any result? Do we have any idea to fix that except delaying the
set timing? I guess that maybe not using static_branch can work for this, but it
still needs to be evaluated for performance influence of not enabled situation.

Best,
Chen

