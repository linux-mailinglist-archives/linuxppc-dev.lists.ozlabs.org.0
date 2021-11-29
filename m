Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C868460CF5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:06:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vcx41bFz308v
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2VcS70C3z2ynK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:06:30 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.56])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J2VYG4jL9z1DJgC;
 Mon, 29 Nov 2021 11:03:46 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 11:06:24 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Mon, 29 Nov 2021 11:06:23 +0800
Message-ID: <073253ba-f5c5-c64c-f8cb-6fb39f35af0e@huawei.com>
Date: Mon, 29 Nov 2021 11:06:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <4fecd1ac-6c0a-f0fa-1ffb-18f3f266809d@huawei.com> <YaRA6o0pHU6/206a@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaRA6o0pHU6/206a@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme710-chm.china.huawei.com (10.1.199.106) To
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
Cc: linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, cl@linux.com, will@kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/11/29 10:54, Dennis Zhou wrote:
> On Mon, Nov 29, 2021 at 10:51:18AM +0800, Kefeng Wang wrote:
>> Hi Dennis and all maintainers, any comments about the changes, many thanks.
>>
>> On 2021/11/21 17:35, Kefeng Wang wrote:
>>> When support page mapping percpu first chunk allocator on arm64, we
>>> found there are lots of duplicated codes in percpu embed/page first
>>> chunk allocator. This patchset is aimed to cleanup them and should
>>> no funciton change, only test on arm64.
>>>
>>> Kefeng Wang (4):
>>>     mm: percpu: Generalize percpu related config
>>>     mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
>>>     mm: percpu: Add generic pcpu_fc_alloc/free funciton
>>>     mm: percpu: Add generic pcpu_populate_pte() function
>>>
>>>    arch/arm64/Kconfig             |  20 +----
>>>    arch/ia64/Kconfig              |   9 +--
>>>    arch/mips/Kconfig              |  10 +--
>>>    arch/mips/mm/init.c            |  14 +---
>>>    arch/powerpc/Kconfig           |  17 +---
>>>    arch/powerpc/kernel/setup_64.c |  92 +--------------------
>>>    arch/riscv/Kconfig             |  10 +--
>>>    arch/sparc/Kconfig             |  12 +--
>>>    arch/sparc/kernel/smp_64.c     | 105 +-----------------------
>>>    arch/x86/Kconfig               |  17 +---
>>>    arch/x86/kernel/setup_percpu.c |  66 ++-------------
>>>    drivers/base/arch_numa.c       |  68 +---------------
>>>    include/linux/percpu.h         |  13 +--
>>>    mm/Kconfig                     |  12 +++
>>>    mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
>>>    15 files changed, 165 insertions(+), 443 deletions(-)
>>>
> Hi Kefang,
>
> I apologize for the delay. It's a holiday week in the US + I had some
> personal things come up at the beginning of last week. I'll have it
> reviewed by tomorrow.
It's great to hear about your reply,  thanks.
>
> Thanks,
> Dennis
> .
