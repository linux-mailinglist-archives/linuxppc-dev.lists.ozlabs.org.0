Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7C179E33
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 04:22:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Xwz53Mg8zDqml
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 14:22:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=yanaijie@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XwxX64yZzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 14:20:48 +1100 (AEDT)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D406473EA218C9E97C2D;
 Thu,  5 Mar 2020 11:20:45 +0800 (CST)
Received: from [127.0.0.1] (10.173.221.195) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0;
 Thu, 5 Mar 2020 11:20:39 +0800
Subject: Re: [PATCH v3 5/6] powerpc/fsl_booke/64: clear the original kernel if
 randomized
To: Scott Wood <oss@buserror.net>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <christophe.leroy@c-s.fr>, <benh@kernel.crashing.org>, <paulus@samba.org>,
 <npiggin@gmail.com>, <keescook@chromium.org>,
 <kernel-hardening@lists.openwall.com>
References: <20200206025825.22934-1-yanaijie@huawei.com>
 <20200206025825.22934-6-yanaijie@huawei.com>
 <5737c82b1ab4c80e53904e4846694884ca429569.camel@buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <71e25bac-bdf6-a754-c0f8-c9d99a393085@huawei.com>
Date: Thu, 5 Mar 2020 11:20:38 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <5737c82b1ab4c80e53904e4846694884ca429569.camel@buserror.net>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.221.195]
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
Cc: linux-kernel@vger.kernel.org, zhaohongjiang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2020/3/5 5:53, Scott Wood 写道:
> On Thu, 2020-02-06 at 10:58 +0800, Jason Yan wrote:
>> The original kernel still exists in the memory, clear it now.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Scott Wood <oss@buserror.net>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>   arch/powerpc/mm/nohash/kaslr_booke.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c
>> b/arch/powerpc/mm/nohash/kaslr_booke.c
>> index c6f5c1db1394..ed1277059368 100644
>> --- a/arch/powerpc/mm/nohash/kaslr_booke.c
>> +++ b/arch/powerpc/mm/nohash/kaslr_booke.c
>> @@ -378,8 +378,10 @@ notrace void __init kaslr_early_init(void *dt_ptr,
>> phys_addr_t size)
>>   	unsigned int *__kaslr_offset = (unsigned int *)(KERNELBASE + 0x58);
>>   	unsigned int *__run_at_load = (unsigned int *)(KERNELBASE + 0x5c);
>>   
>> -	if (*__run_at_load == 1)
>> +	if (*__run_at_load == 1) {
>> +		kaslr_late_init();
>>   		return;
>> +	}
> 
> What if you're here because kexec set __run_at_load (or
> CONFIG_RELOCATABLE_TEST is enabled), not because kaslr happened?
> 

Nothing will happen because kaslr_late_init() only clears memory when
kernstart_virt_addr is not KERNELBASE. When __run_at_load is set then
KASLR will not take effect.

> -Scott
> 
> 
> 
> .
> 

