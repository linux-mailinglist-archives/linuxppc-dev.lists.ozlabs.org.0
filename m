Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D386E94BA27
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 11:55:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfj8y5qkQz2yvn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 19:55:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=steven.price@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfj8B52XKz2xjY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 19:55:06 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA0441042;
	Thu,  8 Aug 2024 02:55:01 -0700 (PDT)
Received: from [10.1.26.21] (e122027.cambridge.arm.com [10.1.26.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A95173F6A8;
	Thu,  8 Aug 2024 02:54:29 -0700 (PDT)
Message-ID: <fbcbd4da-cab5-420e-b8b6-bf04e27bf69c@arm.com>
Date: Thu, 8 Aug 2024 10:54:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest
 memory while KVM is dirty logging
To: Catalin Marinas <catalin.marinas@arm.com>,
 Sean Christopherson <seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
 <20240726235234.228822-3-seanjc@google.com> <ZrOfB8bOdSJVcWFr@arm.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ZrOfB8bOdSJVcWFr@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/08/2024 17:21, Catalin Marinas wrote:
> On Fri, Jul 26, 2024 at 04:51:11PM -0700, Sean Christopherson wrote:
>> Disallow copying MTE tags to guest memory while KVM is dirty logging, as
>> writing guest memory without marking the gfn as dirty in the memslot could
>> result in userspace failing to migrate the updated page.  Ideally (maybe?),
>> KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
>> and presumably the only use case for copy MTE tags _to_ the guest is when
>> restoring state on the target.
>>
>> Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
>> Signed-off-by: Sean Christopherson <seanjc@google.com>
>> ---
>>  arch/arm64/kvm/guest.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index e1f0ff08836a..962f985977c2 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>  
>>  	mutex_lock(&kvm->slots_lock);
>>  
>> +	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
>> +		ret = -EBUSY;
>> +		goto out;
>> +	}
> 
> There are ways to actually log the page dirtying but I don't think
> it's worth it. AFAICT, reading the tags still works and that's what's
> used during migration (on the VM where dirty tracking takes place).
> 
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> 

Looks sensible to me - my initial thought was "why would a VMM do
that?". But it would make sense to actually return a failure rather than
letting the VMM shoot itself in the foot.

If there's actually a use-case then we could look at making the dirty
tracking work, but I'm not convinced there is a good reason.

Reviewed-by: Steven Price <steven.price@arm.com>

Thanks,

Steve
