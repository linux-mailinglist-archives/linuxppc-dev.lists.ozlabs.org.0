Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B2F752EED
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 03:53:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2Dys1Y1Cz3c96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 11:53:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2DyL0659z30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 11:52:53 +1000 (AEST)
Received: from dggpemm500001.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4R2DxQ4ZhTz18LhT;
	Fri, 14 Jul 2023 09:52:10 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 09:52:45 +0800
Message-ID: <6f06f7d5-7d84-815e-699b-eef684e014b0@huawei.com>
Date: Fri, 14 Jul 2023 09:52:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH rfc -next 01/10] mm: add a generic VMA lock-based page
 fault handler
Content-Language: en-US
To: Suren Baghdasaryan <surenb@google.com>, Matthew Wilcox
	<willy@infradead.org>
References: <20230713095339.189715-1-wangkefeng.wang@huawei.com>
 <20230713095339.189715-2-wangkefeng.wang@huawei.com>
 <ZLAjFQGgcjt4ykS7@casper.infradead.org>
 <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <CAJuCfpGBaAJof=5-Xh1saoN9dhOauMiHBZzb0crVNn9OyOeZHw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, WANG Xuerui <kernel@xen0n.name>, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>
 , Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/7/14 4:12, Suren Baghdasaryan wrote:
> On Thu, Jul 13, 2023 at 9:15 AM Matthew Wilcox <willy@infradead.org> wrote:
>>
>>> +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret)
>>> +{
>>> +     struct vm_area_struct *vma;
>>> +     vm_fault_t fault;
>>
>>
>> On Thu, Jul 13, 2023 at 05:53:29PM +0800, Kefeng Wang wrote:
>>> +#define VM_LOCKED_FAULT_INIT(_name, _mm, _address, _fault_flags, _vm_flags, _regs, _fault_code) \
>>> +     _name.mm                = _mm;                  \
>>> +     _name.address           = _address;             \
>>> +     _name.fault_flags       = _fault_flags;         \
>>> +     _name.vm_flags          = _vm_flags;            \
>>> +     _name.regs              = _regs;                \
>>> +     _name.fault_code        = _fault_code
>>
>> More consolidated code is a good idea; no question.  But I don't think
>> this is the right way to do it.

I agree it is not good enough, but the arch's vma check acess has
different implementation, some use vm flags, some need fault code and
regs, and some use both :(

>>
>>> +int __weak arch_vma_check_access(struct vm_area_struct *vma,
>>> +                              struct vm_locked_fault *vmlf);
>>
>> This should be:
>>
>> #ifndef vma_check_access
>> bool vma_check_access(struct vm_area_struct *vma, )
>> {
>>          return (vma->vm_flags & vm_flags) == 0;
>> }
>> #endif
>>
>> and then arches which want to do something different can just define
>> vma_check_access.

Ok, I could convert to use this way.

>>
>>> +int try_vma_locked_page_fault(struct vm_locked_fault *vmlf, vm_fault_t *ret)
>>> +{
>>> +     struct vm_area_struct *vma;
>>> +     vm_fault_t fault;
>>
>> Declaring the vmf in this function and then copying it back is just wrong.
>> We need to declare vm_fault_t earlier (in the arch fault handler) and
>> pass it in.

Actually I passed the vm_fault_t *ret(in the arch fault handler), we
could directly use *ret instead of a new local variable, and no copy.
> 
> Did you mean to say "we need to declare vmf (struct vm_fault) earlier
> (in the arch fault handler) and pass it in." ?
> 
>>   I don't think that creating struct vm_locked_fault is the
>> right idea either.

As mentioned above for vma check access, we need many arguments for a 
function, a new struct looks possible better, is there better solution
or any suggestion?

Thanks.

>>
>>> +     if (!(vmlf->fault_flags & FAULT_FLAG_USER))
>>> +             return -EINVAL;
>>> +
>>> +     vma = lock_vma_under_rcu(vmlf->mm, vmlf->address);
>>> +     if (!vma)
>>> +             return -EINVAL;
>>> +
>>> +     if (arch_vma_check_access(vma, vmlf)) {
>>> +             vma_end_read(vma);
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     fault = handle_mm_fault(vma, vmlf->address,
>>> +                             vmlf->fault_flags | FAULT_FLAG_VMA_LOCK,
>>> +                             vmlf->regs);
>>> +     *ret = fault;
>>> +
>>> +     if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>>> +             vma_end_read(vma);
>>> +
>>> +     if ((fault & VM_FAULT_RETRY))
>>> +             count_vm_vma_lock_event(VMA_LOCK_RETRY);
>>> +     else
>>> +             count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>>   #endif /* CONFIG_PER_VMA_LOCK */
>>>
>>>   #ifndef __PAGETABLE_P4D_FOLDED
>>> --
>>> 2.27.0
>>>
>>>
