Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0C668D3AF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 11:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9zQK5wDnz3cgv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 21:10:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqL/phTT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqL/phTT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqL/phTT;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqL/phTT;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9zPM1ds9z2xrD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 21:09:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675764547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR0ulCP18stSdAGdIDCbqMw0+hgLOSFlaljh5KnkP+U=;
	b=CqL/phTTY8ycT04Ar7Rfp2K3szix6ooXbJ3RDQP9TkdAx1HJnVCbc7iPGB8IbS1w/DFHjY
	osmDJzydKOoz/ylvcYv1au0XMmKH8I/B9HWdSvnkUcTQZdtvlbFgeW3/1UQCGiQiQnsHCR
	y24YBfRfj1APun5/qGcJb9IauHe+hXc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675764547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZR0ulCP18stSdAGdIDCbqMw0+hgLOSFlaljh5KnkP+U=;
	b=CqL/phTTY8ycT04Ar7Rfp2K3szix6ooXbJ3RDQP9TkdAx1HJnVCbc7iPGB8IbS1w/DFHjY
	osmDJzydKOoz/ylvcYv1au0XMmKH8I/B9HWdSvnkUcTQZdtvlbFgeW3/1UQCGiQiQnsHCR
	y24YBfRfj1APun5/qGcJb9IauHe+hXc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-495-BB48TPXKOsGYo8h5tEZ42A-1; Tue, 07 Feb 2023 05:09:06 -0500
X-MC-Unique: BB48TPXKOsGYo8h5tEZ42A-1
Received: by mail-qt1-f197.google.com with SMTP id x16-20020ac87ed0000000b003b82d873b38so8327554qtj.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 02:09:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR0ulCP18stSdAGdIDCbqMw0+hgLOSFlaljh5KnkP+U=;
        b=5uxrrZ2B2oTN7VIrTMz8N4I/0/Mr2bmYzwXlPRsPD9iXTsorPeWr3vnC12fE71pzIP
         UiBuKgKjm3I6HYXr/LS5OK8rcsKUuxMl5R4jfWc6bjuo41o67U9sV/1XRqTujlEUf7RM
         s1t5H1ChU25m22SNShUWyuyJrzQ5XfqYsaURRGLjef2MbxG7n78Vu4EZKZYGtk+xc0BL
         4y9c6HXTp+krzsiBNbIKu2UvLLLpbfBkq6XHGcvJfjBe+5L69T9DMFREty+zj7GW9GnU
         vT4/E7iggjmgexpl569PIrqSXytxEPM//c3NFk01GYO/ocDdmHMdH47A0675AU84xKqj
         /0VQ==
X-Gm-Message-State: AO0yUKVf9BFEpOdKHToJ3JoZCE+v9Io+B3Dy70mfUmtM7i8AdpG8NksQ
	WddsA1oIsT/m7FAmC3qJIPjugoQ7scc8BRYutTvp09oO6ySwGcW6WSu3wI5Ace9ofdsnFe9GhnL
	wcl8H+YoxZXJhF/KEpB5HrD2lSg==
X-Received: by 2002:a05:622a:1106:b0:3b6:3a12:2bf9 with SMTP id e6-20020a05622a110600b003b63a122bf9mr4752913qty.2.1675764545704;
        Tue, 07 Feb 2023 02:09:05 -0800 (PST)
X-Google-Smtp-Source: AK7set+kMUgLmXDnmLUe9OBwQo0pZwTWJP+zfBA/Ea2dEBA2nMdufvraXZdginHor8Q4n1IhuHpRow==
X-Received: by 2002:a05:622a:1106:b0:3b6:3a12:2bf9 with SMTP id e6-20020a05622a110600b003b63a122bf9mr4752889qty.2.1675764545475;
        Tue, 07 Feb 2023 02:09:05 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de. [109.43.176.120])
        by smtp.gmail.com with ESMTPSA id p13-20020a05620a056d00b007208dd55183sm9072533qkp.40.2023.02.07.02.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:09:04 -0800 (PST)
Message-ID: <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
Date: Tue, 7 Feb 2023 11:09:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, Steven Price <steven.price@arm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Eric Auger <eric.auger@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/02/2023 01.09, Gavin Shan wrote:
> Hi Thomas,
> 
> On 2/3/23 8:42 PM, Thomas Huth wrote:
>> This function only returns normal integer values, so there is
>> no need to declare its return value as "long".
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   arch/arm64/include/asm/kvm_host.h | 4 ++--
>>   arch/arm64/kvm/guest.c            | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h 
>> b/arch/arm64/include/asm/kvm_host.h
>> index 35a159d131b5..b1a16343767f 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -963,8 +963,8 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
>>   int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>                      struct kvm_device_attr *attr);
>> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> -                struct kvm_arm_copy_mte_tags *copy_tags);
>> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> +                   struct kvm_arm_copy_mte_tags *copy_tags);
>>   /* Guest/host FPSIMD coordination helpers */
>>   int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
>> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
>> index cf4c495a4321..80e530549c34 100644
>> --- a/arch/arm64/kvm/guest.c
>> +++ b/arch/arm64/kvm/guest.c
>> @@ -1013,8 +1013,8 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
>>       return ret;
>>   }
>> -long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> -                struct kvm_arm_copy_mte_tags *copy_tags)
>> +int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>> +                   struct kvm_arm_copy_mte_tags *copy_tags)
>>   {
>>       gpa_t guest_ipa = copy_tags->guest_ipa;
>>       size_t length = copy_tags->length;
>>
> 
> It's possible for the function to return number of bytes have been copied.
> Its type is 'size_t', same to 'unsigned long'. So 'int' doesn't have sufficient
> space for it if I'm correct.
> 
> long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>                                  struct kvm_arm_copy_mte_tags *copy_tags)
> {
>          gpa_t guest_ipa = copy_tags->guest_ipa;
>          size_t length = copy_tags->length;
>          :
>          :
> out:
>          mutex_unlock(&kvm->slots_lock);
>          /* If some data has been copied report the number of bytes copied */
>          if (length != copy_tags->length)
>                  return copy_tags->length - length;
>          return ret;
> }

Oh, drat, I thought I had checked all return statements ... this must have 
fallen through the cracks, sorry!

Anyway, this is already a problem now: The function is called from 
kvm_arch_vm_ioctl() (which still returns a long), which in turn is called 
from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the 
return value in an "int r" variable. So the upper bits are already lost there.

Also, how is this supposed to work from user space? The normal "ioctl()" 
libc function just returns an "int" ? Is this ioctl already used in a 
userspace application somewhere? ... at least in QEMU, I didn't spot it yet...

  Thomas

