Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3BD68E357
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 23:17:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBHZ33kwCz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 09:17:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZuaJ/62r;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZuaJ/62r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=gshan@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZuaJ/62r;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZuaJ/62r;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBHY414F6z309T
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 09:16:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675808211;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mDzj9wY10naxVKPq3dw471YFh0Oey/zqoDGX1F3TBV0=;
	b=ZuaJ/62rUQ1xHlWodH7Nt87xRjxw2f6Ndrf7Q4pvFJI2xt4QNamvEnlq8/vpae4gfU5P+d
	nf84YH1PmRPfQcqsAHAr2NgRSH3qvUFlZ52Ngd8zSnPYJSYpsaaTF3/f73PHHaSa+iXn6O
	k0p4AlWdoRRFGJMHI8XY3jpXAcoWU5c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675808211;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mDzj9wY10naxVKPq3dw471YFh0Oey/zqoDGX1F3TBV0=;
	b=ZuaJ/62rUQ1xHlWodH7Nt87xRjxw2f6Ndrf7Q4pvFJI2xt4QNamvEnlq8/vpae4gfU5P+d
	nf84YH1PmRPfQcqsAHAr2NgRSH3qvUFlZ52Ngd8zSnPYJSYpsaaTF3/f73PHHaSa+iXn6O
	k0p4AlWdoRRFGJMHI8XY3jpXAcoWU5c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-RK1-NUkyMxK1ld44RDxq2g-1; Tue, 07 Feb 2023 17:16:46 -0500
X-MC-Unique: RK1-NUkyMxK1ld44RDxq2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B99329AA2CE;
	Tue,  7 Feb 2023 22:16:45 +0000 (UTC)
Received: from [10.64.54.63] (vpn2-54-63.bne.redhat.com [10.64.54.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D56C15BA0;
	Tue,  7 Feb 2023 22:16:39 +0000 (UTC)
Subject: Re: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
To: Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Steven Price <steven.price@arm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
 <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com>
Date: Wed, 8 Feb 2023 09:16:36 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Eric Auger <eric.auger@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/7/23 9:09 PM, Thomas Huth wrote:
> On 07/02/2023 01.09, Gavin Shan wrote:
>> Hi Thomas,
>>
>> On 2/3/23 8:42 PM, Thomas Huth wrote:
>>> This function only returns normal integer values, so there is
>>> no need to declare its return value as "long".
>>>
>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>> ---
>>>   arch/arm64/include/asm/kvm_host.h | 4 ++--
>>>   arch/arm64/kvm/guest.c            | 4 ++--
>>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>>> index 35a159d131b5..b1a16343767f 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -963,8 +963,8 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>>>   int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>>                      struct kvm_device_attr *attr);
>>> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> -                struct kvm_arm_copy_mte_tags *copy_tags);
>>> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> +                   struct kvm_arm_copy_mte_tags *copy_tags);
>>>   /* Guest/host FPSIMD coordination helpers */
>>>   int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
>>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>>> index cf4c495a4321..80e530549c34 100644
>>> --- a/arch/arm64/kvm/guest.c
>>> +++ b/arch/arm64/kvm/guest.c
>>> @@ -1013,8 +1013,8 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>>       return ret;
>>>   }
>>> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> -                struct kvm_arm_copy_mte_tags *copy_tags)
>>> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>> +                   struct kvm_arm_copy_mte_tags *copy_tags)
>>>   {
>>>       gpa_t guest_ipa = copy_tags->guest_ipa;
>>>       size_t length = copy_tags->length;
>>>
>>
>> It's possible for the function to return number of bytes have been copied.
>> Its type is 'size_t', same to 'unsigned long'. So 'int' doesn't have sufficient
>> space for it if I'm correct.
>>
>> long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>>                                  struct kvm_arm_copy_mte_tags *copy_tags)
>> {
>>          gpa_t guest_ipa = copy_tags->guest_ipa;
>>          size_t length = copy_tags->length;
>>          :
>>          :
>> out:
>>          mutex_unlock(&kvm->slots_lock);
>>          /* If some data has been copied report the number of bytes copied */
>>          if (length != copy_tags->length)
>>                  return copy_tags->length - length;
>>          return ret;
>> }
> 
> Oh, drat, I thought I had checked all return statements ... this must have fallen through the cracks, sorry!
> 
> Anyway, this is already a problem now: The function is called from kvm_arch_vm_ioctl() (which still returns a long), which in turn is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the return value in an "int r" variable. So the upper bits are already lost there.
> 
> Also, how is this supposed to work from user space? The normal "ioctl()" libc function just returns an "int" ? Is this ioctl already used in a userspace application somewhere? ... at least in QEMU, I didn't spot it yet...
> 

The ioctl command KVM_ARM_MTE_COPY_TAGS was merged recently and not used
by QEMU yet. I think struct kvm_arm_copy_mte_tags::length needs to be
'__u32' instead of '__u64' in order to standardize the return value.
Something like below. Documentation/virt/kvm/api.rst::section-4.130
needs update accordingly.

    struct kvm_arm_copy_mte_tags {
         __u64 guest_ipa;
         __u32 pad;
         __u32 length;
         void __user *addr;
         __u64 flags;
         __u64 reserved[2];
   };

Thanks,
Gavin

