Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC837892D7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 02:57:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXdhc5bYrz3cPN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 10:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=wangkefeng.wang@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXdh611wwz2yW6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 10:57:05 +1000 (AEST)
Received: from dggpemm100001.china.huawei.com (unknown [172.30.72.57])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RXdZy6d9WztRf4;
	Sat, 26 Aug 2023 08:52:42 +0800 (CST)
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm100001.china.huawei.com (7.185.36.93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 26 Aug 2023 08:56:28 +0800
Message-ID: <26989657-3ad9-48c5-9863-12993b78141c@huawei.com>
Date: Sat, 26 Aug 2023 08:56:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rfc v2 01/10] mm: add a generic VMA lock-based page fault
 handler
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
References: <20230821123056.2109942-1-wangkefeng.wang@huawei.com>
 <20230821123056.2109942-2-wangkefeng.wang@huawei.com>
 <ZOcC7RsYy5yJLgNb@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <ZOcC7RsYy5yJLgNb@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, "H . Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, willy@infradead.org, Ingo Molnar <mingo@redhat.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, surenb@google.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven
  Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2023/8/24 15:12, Alexander Gordeev wrote:
> On Mon, Aug 21, 2023 at 08:30:47PM +0800, Kefeng Wang wrote:
> 
> Hi Kefeng,
> 
>> The ARCH_SUPPORTS_PER_VMA_LOCK are enabled by more and more architectures,
>> eg, x86, arm64, powerpc and s390, and riscv, those implementation are very
>> similar which results in some duplicated codes, let's add a generic VMA
>> lock-based page fault handler try_to_vma_locked_page_fault() to eliminate
>> them, and which also make us easy to support this on new architectures.
>>
>> Since different architectures use different way to check vma whether is
>> accessable or not, the struct pt_regs, page fault error code and vma flags
>> are added into struct vm_fault, then, the architecture's page fault code
>> could re-use struct vm_fault to record and check vma accessable by each
>> own implementation.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
...
>> +
>> +vm_fault_t try_vma_locked_page_fault(struct vm_fault *vmf)
>> +{
>> +	vm_fault_t fault = VM_FAULT_NONE;
>> +	struct vm_area_struct *vma;
>> +
>> +	if (!(vmf->flags & FAULT_FLAG_USER))
>> +		return fault;
>> +
>> +	vma = lock_vma_under_rcu(current->mm, vmf->real_address);
>> +	if (!vma)
>> +		return fault;
>> +
>> +	if (arch_vma_access_error(vma, vmf)) {
>> +		vma_end_read(vma);
>> +		return fault;
>> +	}
>> +
>> +	fault = handle_mm_fault(vma, vmf->real_address,
>> +				vmf->flags | FAULT_FLAG_VMA_LOCK, vmf->regs);
>> +
>> +	if (!(fault & (VM_FAULT_RETRY | VM_FAULT_COMPLETED)))
>> +		vma_end_read(vma);
> 
> Could you please explain how vma_end_read() call could be conditional?

The check is added for swap and userfault, see

https://lkml.kernel.org/r/20230630211957.1341547-4-surenb@google.com
> 
>> +
>> +	if (fault & VM_FAULT_RETRY)
>> +		count_vm_vma_lock_event(VMA_LOCK_RETRY);
>> +	else
>> +		count_vm_vma_lock_event(VMA_LOCK_SUCCESS);
>> +
>> +	return fault;
>> +}
>> +
>>   #endif /* CONFIG_PER_VMA_LOCK */
>>   
>>   #ifndef __PAGETABLE_P4D_FOLDED
