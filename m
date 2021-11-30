Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850C462D26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 07:54:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3Cd75BR9z3cN1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 17:54:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3Ccd1zg8z2yg5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 17:54:06 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4J3CYk04yNz8vg4;
 Tue, 30 Nov 2021 14:51:38 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:53:35 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:53:34 +0800
Message-ID: <617f11ad-3033-473f-162e-cb7ecd67a78a@huawei.com>
Date: Tue, 30 Nov 2021 14:53:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 0/4] mm: percpu: Cleanup percpu first chunk funciton
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <YaVaTwjiZmWz8PKY@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaVaTwjiZmWz8PKY@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
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


On 2021/11/30 6:55, Dennis Zhou wrote:
> Hello,
>
> On Sun, Nov 21, 2021 at 05:35:53PM +0800, Kefeng Wang wrote:
>> When support page mapping percpu first chunk allocator on arm64, we
>> found there are lots of duplicated codes in percpu embed/page first
>> chunk allocator. This patchset is aimed to cleanup them and should
>> no funciton change, only test on arm64.
>>
>> Kefeng Wang (4):
>>    mm: percpu: Generalize percpu related config
>>    mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
>>    mm: percpu: Add generic pcpu_fc_alloc/free funciton
>>    mm: percpu: Add generic pcpu_populate_pte() function
>>
>>   arch/arm64/Kconfig             |  20 +----
>>   arch/ia64/Kconfig              |   9 +--
>>   arch/mips/Kconfig              |  10 +--
>>   arch/mips/mm/init.c            |  14 +---
>>   arch/powerpc/Kconfig           |  17 +---
>>   arch/powerpc/kernel/setup_64.c |  92 +--------------------
>>   arch/riscv/Kconfig             |  10 +--
>>   arch/sparc/Kconfig             |  12 +--
>>   arch/sparc/kernel/smp_64.c     | 105 +-----------------------
>>   arch/x86/Kconfig               |  17 +---
>>   arch/x86/kernel/setup_percpu.c |  66 ++-------------
>>   drivers/base/arch_numa.c       |  68 +---------------
>>   include/linux/percpu.h         |  13 +--
>>   mm/Kconfig                     |  12 +++
>>   mm/percpu.c                    | 143 +++++++++++++++++++++++++--------
>>   15 files changed, 165 insertions(+), 443 deletions(-)
>>
>> -- 
>> 2.26.2
>>
> I've made a few comments. I think this will be a little bit of a
> challenge to get through due to it touching so many architectures. For
> ease, it probably makes sense to run it through mny tree, but we'll need
> explicit acks as I mentioned.
>
> I like getting rid of the pcpu_alloc_bootmem()/pcpu_free_bootmem()
> functions. However, let's keep the implementation identical to x86.
ok , will change patch3 in v2
>
>
> I don't think we should get rid of the populate_pte_fn(). I'm not
> comfortable changing x86's implementation. Simply offer a NULL, and if
> NULL use the default.

As replied in patch4, we use __weak method, and x86's implementation is

not changed in patch4, is this ok?

>
> Do you have a tree that intel pulls? I suggest cleaning up the patches
> and pushing to a remote branch that they pick up. That would have caught
> the mips typo. Send a PR creating a file in [1] for your branch, github
> is fine. Basic validation needs to be done before I can pick this up
> too on more than arm64.

Ok, x86/arm64/riscv are tested, but I don't has ppc/mips/sparc compliler.

I will try to push new version into github and test by lkp.

Thanks.

>
> [1] https://github.com/intel/lkp-tests/tree/master/repo/linux
>
> Thanks,
> Dennis
> .
