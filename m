Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B13EE4D9996
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 11:52:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHqww4pzZz30KL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 21:52:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHqwW1F9vz2y7M
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 21:51:54 +1100 (AEDT)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KHqtf5yXjzfZ6h;
 Tue, 15 Mar 2022 18:50:18 +0800 (CST)
Received: from [10.174.179.215] (10.174.179.215) by
 canpemm500007.china.huawei.com (7.192.104.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 15 Mar 2022 18:51:45 +0800
Subject: Re: [PATCH -next] powerpc/eeh: Add correct inline functions
To: Christophe Leroy <christophe.leroy@csgroup.eu>, <ruscur@russell.cc>,
 <oohall@gmail.com>, <mpe@ellerman.id.au>, <benh@kernel.crashing.org>,
 <paulus@samba.org>, <sbobroff@linux.ibm.com>
References: <20210331125313.24036-1-yuehaibing@huawei.com>
 <2f2cafaa-e1f3-7f75-10a5-b8edb6de26d7@csgroup.eu>
From: YueHaibing <yuehaibing@huawei.com>
Message-ID: <52316466-6482-f69e-8f65-4767a7dc6336@huawei.com>
Date: Tue, 15 Mar 2022 18:51:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2f2cafaa-e1f3-7f75-10a5-b8edb6de26d7@csgroup.eu>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 canpemm500007.china.huawei.com (7.192.104.62)
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

On 2022/3/15 17:42, Christophe Leroy wrote:
> 
> 
> Le 31/03/2021 à 14:53, YueHaibing a écrit :
>> pseries_eeh_add_device_early()/pseries_eeh_add_device_tree_early() is
>> never used since adding, however pseries_eeh_init_edev() and
>> pseries_eeh_init_edev_recursive() need their inline versions.
>>
>> Fixes: b6eebb093cad ("powerpc/eeh: Make early EEH init pseries specific")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> Those inline are not needed at all:
> - pseries_eeh_init_edev_recursive() is only called from files build wich CONFIG_HOTPLUG_PCI_RPA which depends on CONFIG_PSERIES and CONFIG_EEH
> - pseries_eeh_init_edev() is used exclusively in
> arch/powerpc/platforms/pseries/eeh_pseries.c and should be made static.
> 
> Can you update your patch ?

OK, will do it in v2.
> 
> Thanks
> Christophe
> 
>> ---
>>   arch/powerpc/include/asm/eeh.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
>> index b1a5bba2e0b9..0b6c2a6711d3 100644
>> --- a/arch/powerpc/include/asm/eeh.h
>> +++ b/arch/powerpc/include/asm/eeh.h
>> @@ -357,8 +357,8 @@ static inline int eeh_phb_pe_create(struct pci_controller *phb) { return 0; }
>>   void pseries_eeh_init_edev(struct pci_dn *pdn);
>>   void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
>>   #else
>> -static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
>> -static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn) { }
>> +static inline void pseries_eeh_init_edev(struct pci_dn *pdn) { }
>> +static inline void pseries_eeh_init_edev_recursive(struct pci_dn *pdn) { }
>>   #endif
>>     #ifdef CONFIG_PPC64
> .
