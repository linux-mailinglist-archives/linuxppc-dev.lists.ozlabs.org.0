Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3E47892DD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 03:07:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXdw96Kflz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 11:07:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXdvf2R9Jz2ypy
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 11:07:09 +1000 (AEST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.55])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RXdsj5kCdz1L9Gp;
	Sat, 26 Aug 2023 09:05:29 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 26 Aug 2023 09:07:01 +0800
Message-ID: <2e047e5a-d833-4c6b-8b7c-85d29e19ceed@huawei.com>
Date: Sat, 26 Aug 2023 09:07:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rfc v2 04/10] s390: mm: use try_vma_locked_page_fault()
Content-Language: en-US
To: Heiko Carstens <hca@linux.ibm.com>, Alexander Gordeev
	<agordeev@linux.ibm.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-5-wangkefeng.wang@huawei.com>
 <ZOcR4Z1WnCy1vl9T@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <20230824083225.10112-A-hca@linux.ibm.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <20230824083225.10112-A-hca@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm100001.china.huawei.com (7.185.36.93)
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, And
 rew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/8/24 16:32, Heiko Carstens wrote:
> On Thu, Aug 24, 2023 at 10:16:33AM +0200, Alexander Gordeev wrote:
>> On Mon, Aug 21, 2023 at 08:30:50PM +0800, Kefeng Wang wrote:
>>> Use new try_vma_locked_page_fault() helper to simplify code.
>>> No functional change intended.
>>>
>>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>>> ---
>>>   arch/s390/mm/fault.c | 66 ++++++++++++++++++--------------------------
>>>   1 file changed, 27 insertions(+), 39 deletions(-)
> ...
>>> -	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
>>> -	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>>> -		vma_end_read(vma);
>>> -	if (!(fault & VM_FAULT_RETRY)) {
>>> -		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>>> -		if (likely(!(fault & VM_FAULT_ERROR)))
>>> -			fault = 0;
>>
>> This fault fixup is removed in the new version.
> ...
> 
>>> +		vmf.vm_flags = VM_WRITE;
>>> +	if (vmf.vm_flags == VM_WRITE)
>>> +		vmf.flags |= FAULT_FLAG_WRITE;
>>> +
>>> +	fault = try_vma_locked_page_fault(&vmf);
>>> +	if (fault == VM_FAULT_NONE)
>>> +		goto lock_mm;
>>
>> Because VM_FAULT_NONE is set to 0 it gets confused with
>> the success code of 0 returned by a fault handler. In the
>> former case we want to continue, while in the latter -
>> successfully return. I think it applies to all archs.
> ...
>> FWIW, this series ends up with kernel BUG at arch/s390/mm/fault.c:341!
> 

I didn't test and only built, this is a RFC to want to know whether
the way to add three more numbers into vmf and using vmf in arch's page
fault is feasible or not.

> Without having looked in detail into this patch: all of this is likely
> because s390's fault handling is quite odd. Not only because fault is set
> to 0, but also because of the private VM_FAULT values like
> VM_FAULT_BADCONTEXT. I'm just cleaning up all of this, but it won't make it
> for the next merge window.

Sure, if re-post, will drop the s390's change, but as mentioned above, 
the abstract of the generic vma locked and changes may be not perfect,
let's wait for more response.

Thanks all.

> 
> Therefore I'd like to ask to drop the s390 conversion of this series, and
> if this series is supposed to be merged the s390 conversion needs to be
> done later. Let's not waste more time on the current implementation,
> please.
