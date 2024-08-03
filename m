Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B60619466FC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 05:02:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbSDf5FDkz3fp9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2024 13:02:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=loongson.cn (client-ip=114.242.206.163; helo=mail.loongson.cn; envelope-from=maobibo@loongson.cn; receiver=lists.ozlabs.org)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WbSDF15Nyz3cTL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2024 13:02:19 +1000 (AEST)
Received: from loongson.cn (unknown [10.20.42.62])
	by gateway (Coremail) with SMTP id _____8DxyOm1na1my+EGAA--.23976S3;
	Sat, 03 Aug 2024 11:02:13 +0800 (CST)
Received: from [10.20.42.62] (unknown [10.20.42.62])
	by front1 (Coremail) with SMTP id qMiowMCxwuGwna1mXuwAAA--.5506S3;
	Sat, 03 Aug 2024 11:02:10 +0800 (CST)
Subject: Re: [PATCH v12 64/84] KVM: LoongArch: Mark "struct page" pfns dirty
 only in "slow" page fault path
To: Sean Christopherson <seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-65-seanjc@google.com>
 <a039b758-d4e3-3798-806f-25bceb2f33a5@loongson.cn>
 <Zq00OYowF5kc9QFE@google.com>
From: maobibo <maobibo@loongson.cn>
Message-ID: <345d89c1-4f31-6b49-2cd4-a0696210fa7c@loongson.cn>
Date: Sat, 3 Aug 2024 11:02:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <Zq00OYowF5kc9QFE@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qMiowMCxwuGwna1mXuwAAA--.5506S3
X-CM-SenderInfo: xpdruxter6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoWxJFyfAryfKw1fGw43AFyrGrX_yoW5uw17pF
	WUCFWqkFs5tryYyrZrt39IvrWrK39xKr1xX3W7J34Fkas0qr1IqF10grWfWFyUA3yfAayS
	qr4UKF9xuFZ8AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUd529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUPFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
	k0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jw0_GFylx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUShiSDUUUU
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2024/8/3 上午3:32, Sean Christopherson wrote:
> On Fri, Aug 02, 2024, maobibo wrote:
>> On 2024/7/27 上午7:52, Sean Christopherson wrote:
>>> Mark pages/folios dirty only the slow page fault path, i.e. only when
>>> mmu_lock is held and the operation is mmu_notifier-protected, as marking a
>>> page/folio dirty after it has been written back can make some filesystems
>>> unhappy (backing KVM guests will such filesystem files is uncommon, and
>>> the race is minuscule, hence the lack of complaints).
>>>
>>> See the link below for details.
>>>
>>> Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
>>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>>> ---
>>>    arch/loongarch/kvm/mmu.c | 18 ++++++++++--------
>>>    1 file changed, 10 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
>>> index 2634a9e8d82c..364dd35e0557 100644
>>> --- a/arch/loongarch/kvm/mmu.c
>>> +++ b/arch/loongarch/kvm/mmu.c
>>> @@ -608,13 +608,13 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
>>>    		if (kvm_pte_young(changed))
>>>    			kvm_set_pfn_accessed(pfn);
>>> -		if (kvm_pte_dirty(changed)) {
>>> -			mark_page_dirty(kvm, gfn);
>>> -			kvm_set_pfn_dirty(pfn);
>>> -		}
>>>    		if (page)
>>>    			put_page(page);
>>>    	}
>>> +
>>> +	if (kvm_pte_dirty(changed))
>>> +		mark_page_dirty(kvm, gfn);
>>> +
>>>    	return ret;
>>>    out:
>>>    	spin_unlock(&kvm->mmu_lock);
>>> @@ -915,12 +915,14 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
>>>    	else
>>>    		++kvm->stat.pages;
>>>    	kvm_set_pte(ptep, new_pte);
>>> -	spin_unlock(&kvm->mmu_lock);
>>> -	if (prot_bits & _PAGE_DIRTY) {
>>> -		mark_page_dirty_in_slot(kvm, memslot, gfn);
>>> +	if (writeable)
>> Is it better to use write or (prot_bits & _PAGE_DIRTY) here?  writable is
>> pte permission from function hva_to_pfn_slow(), write is fault action.
> 
> Marking folios dirty in the slow/full path basically necessitates marking the
> folio dirty if KVM creates a writable SPTE, as KVM won't mark the folio dirty
> if/when _PAGE_DIRTY is set.
> 
> Practically speaking, I'm 99.9% certain it doesn't matter.  The folio is marked
> dirty by core MM when the folio is made writable, and cleaning the folio triggers
> an mmu_notifier invalidation.  I.e. if the page is mapped writable in KVM's
yes, it is. Thanks for the explanation. kvm_set_pfn_dirty() can be put 
only in slow page fault path. I only concern with fault type, read fault 
type can set pte entry writable however not _PAGE_DIRTY at stage-2 mmu 
table.

> stage-2 PTEs, then its folio has already been marked dirty.
Considering one condition although I do not know whether it exists 
actually. user mode VMM writes the folio with hva address firstly, then 
VCPU thread *reads* the folio. With primary mmu table, pte entry is 
writable and _PAGE_DIRTY is set, with secondary mmu table(state-2 PTE 
table), it is pte_none since the filio is accessed at first time, so 
there will be slow page fault path for stage-2 mmu page table filling.

Since it is read fault, stage-2 PTE will be created with 
_PAGE_WRITE(coming from function hva_to_pfn_slow()), however _PAGE_DIRTY 
is not set. Do we need call kvm_set_pfn_dirty() at this situation?

Regards
Bibo Mao

