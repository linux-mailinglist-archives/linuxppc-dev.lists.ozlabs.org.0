Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536A395390
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 03:06:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FtcYv6Bsyz30CX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 May 2021 11:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FtcYY6Rjbz2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 May 2021 11:06:09 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FtcRq29ZCz1BGCy;
 Mon, 31 May 2021 09:01:11 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 09:05:50 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 09:05:50 +0800
Subject: Re: [PATCH 11/15] powerpc: convert to setup_initial_init_mm()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20210529105504.180544-1-wangkefeng.wang@huawei.com>
 <20210529105504.180544-12-wangkefeng.wang@huawei.com>
 <20210529181630.Horde.rvXKyt8t9f8DiqTVTuSKUw3@messagerie.c-s.fr>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <db14dd02-7259-a818-8c6c-7c98ff3ec7ea@huawei.com>
Date: Mon, 31 May 2021 09:05:49 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210529181630.Horde.rvXKyt8t9f8DiqTVTuSKUw3@messagerie.c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/5/30 0:16, Christophe Leroy wrote:
> Kefeng Wang <wangkefeng.wang@huawei.com> a écrit :
>
>> Use setup_initial_init_mm() helper to simplify code.
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>  arch/powerpc/kernel/setup-common.c | 5 +----
>>  1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/setup-common.c 
>> b/arch/powerpc/kernel/setup-common.c
>> index 046fe21b5c3b..c046d99efd18 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -928,10 +928,7 @@ void __init setup_arch(char **cmdline_p)
>>
>>      klp_init_thread_info(&init_task);
>>
>> -    init_mm.start_code = (unsigned long)_stext;
>> -    init_mm.end_code = (unsigned long) _etext;
>> -    init_mm.end_data = (unsigned long) _edata;
>> -    init_mm.brk = klimit;
>> +    setup_initial_init_mm(_stext, _etext, _edata, _end);
>
> This looks wrong, should be klimit instead of _end IIUC

see  arch/powerpc/kernel/setup-common.c:

unsigned long klimit = (unsigned long) _end;

the setup_initial_init_mm helper [1] should use the original _end


+static inline void setup_initial_init_mm(char *start_code,
+					 char *end_code,
+					 char *end_data,
+					 char *brk)
+{
+	init_mm.start_code = (unsigned long)start_code;
+	init_mm.end_code = (unsigned long)end_code;
+	init_mm.end_data = (unsigned long)end_data;
+	init_mm.brk = (unsigned long)brk;
+}

[1] https://lkml.org/lkml/2021/5/29/84

>
>>
>>      mm_iommu_init(&init_mm);
>>      irqstack_early_init();
>> -- 
>> 2.26.2
>
>
> .
>
