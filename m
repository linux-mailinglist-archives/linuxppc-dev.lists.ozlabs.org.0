Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80595309146
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 02:33:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DSGtZ38HqzDq6k
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 12:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=cy.fan@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSGs16PYhzDrdW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 12:31:45 +1100 (AEDT)
Received: from dggeme718-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4DSGq01PKHz5M4d;
 Sat, 30 Jan 2021 09:30:04 +0800 (CST)
Received: from [10.174.177.223] (10.174.177.223) by
 dggeme718-chm.china.huawei.com (10.1.199.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Sat, 30 Jan 2021 09:31:38 +0800
Subject: Re: [PATCH] powerpc: remove unneeded semicolons
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20210125095338.1719405-1-cy.fan@huawei.com>
 <87v9bgc6al.fsf@mpe.ellerman.id.au>
From: Chengyang Fan <cy.fan@huawei.com>
Message-ID: <686a4fd1-cbe8-4c60-ea5c-e64b00f5b608@huawei.com>
Date: Sat, 30 Jan 2021 09:31:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <87v9bgc6al.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.177.223]
X-ClientProxiedBy: dggeme715-chm.china.huawei.com (10.1.199.111) To
 dggeme718-chm.china.huawei.com (10.1.199.114)
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
Cc: joe@perches.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Although they are harmless, I think we should keep the consistency of 
kernel coding style.

Thanks


On 2021/1/29 19:48, Michael Ellerman wrote:
> Chengyang Fan <cy.fan@huawei.com> writes:
>> Remove superfluous semicolons after function definitions.
> Is there a good reason why?
>
> I realise they're superfluous, but they're also harmless as far as I'm
> aware.
>
> cheers
>
>>   arch/powerpc/include/asm/book3s/32/mmu-hash.h       |  2 +-
>>   arch/powerpc/include/asm/book3s/64/mmu.h            |  2 +-
>>   arch/powerpc/include/asm/book3s/64/tlbflush-radix.h |  2 +-
>>   arch/powerpc/include/asm/book3s/64/tlbflush.h       |  2 +-
>>   arch/powerpc/include/asm/firmware.h                 |  2 +-
>>   arch/powerpc/include/asm/kvm_ppc.h                  |  6 +++---
>>   arch/powerpc/include/asm/paca.h                     |  6 +++---
>>   arch/powerpc/include/asm/rtas.h                     |  2 +-
>>   arch/powerpc/include/asm/setup.h                    |  6 +++---
>>   arch/powerpc/include/asm/simple_spinlock.h          |  4 ++--
>>   arch/powerpc/include/asm/smp.h                      |  2 +-
>>   arch/powerpc/include/asm/xmon.h                     |  4 ++--
>>   arch/powerpc/kernel/prom.c                          |  2 +-
>>   arch/powerpc/kernel/setup.h                         | 12 ++++++------
>>   arch/powerpc/platforms/powernv/subcore.h            |  2 +-
>>   arch/powerpc/platforms/pseries/pseries.h            |  2 +-
>>   16 files changed, 29 insertions(+), 29 deletions(-)
> .
