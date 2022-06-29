Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF86355FCFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 12:19:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LXyBT62FCz3dy7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 20:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=gongruiqi1@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LXrFz08bXz2yw3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 15:52:19 +1000 (AEST)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LXrBZ1KwczhYrL;
	Wed, 29 Jun 2022 13:49:26 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 29 Jun 2022 13:51:42 +0800
Received: from [10.67.108.157] (10.67.108.157) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 29 Jun 2022 13:51:42 +0800
Message-ID: <6c274345-3370-16c8-f5f1-68521de0f51a@huawei.com>
Date: Wed, 29 Jun 2022 13:51:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] stack: Declare {randomize_,}kstack_offset to fix Sparse
 warnings
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Kees Cook
	<keescook@chromium.org>, Marco Elver <elver@google.com>
References: <20220629032939.2506773-1-gongruiqi1@huawei.com>
 <ca0fa9d2-64dd-0e77-71b6-3673e353c316@csgroup.eu>
From: Gong Ruiqi <gongruiqi1@huawei.com>
In-Reply-To: <ca0fa9d2-64dd-0e77-71b6-3673e353c316@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.108.157]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 29 Jun 2022 20:19:09 +1000
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Xiu Jianfeng <xiujianfeng@huawei.com>, "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2022/06/29 13:10, Christophe Leroy wrote:
> 
> 
> Le 29/06/2022 à 05:29, GONG, Ruiqi a écrit :
>> Fix the following Sparse warnings that got noticed when the PPC-dev
>> patchwork was checking another patch (see the link below):
>>
>> init/main.c:862:1: warning: symbol 'randomize_kstack_offset' was not declared. Should it be static?
>> init/main.c:864:1: warning: symbol 'kstack_offset' was not declared. Should it be static?
>>
>> Which in fact are triggered on all architectures that have
>> HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET support (for instances x86, arm64
>> etc).
>>
>> Link: https://lore.kernel.org/lkml/e7b0d68b-914d-7283-827c-101988923929@huawei.com/T/#m49b2d4490121445ce4bf7653500aba59eefcb67f
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: Xiu Jianfeng <xiujianfeng@huawei.com>
>> Signed-off-by: GONG, Ruiqi <gongruiqi1@huawei.com>
>> ---
>>   init/main.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/init/main.c b/init/main.c
>> index e2490387db2b..6aa0fb2340cc 100644
>> --- a/init/main.c
>> +++ b/init/main.c
>> @@ -101,6 +101,10 @@
>>   #include <linux/stackdepot.h>
>>   #include <net/net_namespace.h>
>>
>> +#ifdef CONFIG_RANDOMIZE_KSTACK_OFFSET
> 
> You don't need this #ifdef, there is already one inside 
> linux/randomize_kstack.h
> 

Ah yes, I didn't notice the config was there already. I will send a new
version. Thanks for your reminder!

>> +#include <linux/randomize_kstack.h>
>> +#endif
>> +
>>   #include <asm/io.h>
>>   #include <asm/bugs.h>
>>   #include <asm/setup.h>
>> --
>> 2.25.1
