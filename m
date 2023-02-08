Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB34168EEBC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 13:17:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBfCC5QzKz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 23:17:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KlkuZW6R;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZV3b0JZR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KlkuZW6R;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZV3b0JZR;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBfBB4fHpz2xYL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 23:16:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675858604;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjMSi9ok1TzHSDU3w1PUUtKMgZdBUc/PnFmrcylWMYk=;
	b=KlkuZW6RhOdKFBjinnEPhFgicj410BCsjLmi+eGEwia8fLYfZFxmvq5+DSS/BIZkJ4fiCG
	ccEKi8rIszNOr7TOF0po7Uw8kredEb5NHgvc/YQhLoWT4PohyQ71vHP104d06qh8tYjFB4
	jAdJuQxp79flS4z2uRGbNR5DT6ogz80=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675858605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rjMSi9ok1TzHSDU3w1PUUtKMgZdBUc/PnFmrcylWMYk=;
	b=ZV3b0JZR/JUqJyeWKigVedVfdIEFJQb9oKPjro9HOQ9it10MZEhIKBsN/1xmzYlXO4nuEI
	3wh1HQvf5JzIaMR9eCnyJDbzH5DyvH5OwVZkgWHrt8TcZbXrjRE9DSUCR4PobchF9cV/nM
	bYVhCJ0AFmhBQtVdTnlTcV2ZZ588JmY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-QhO7dUKhNtyPZnrZ6jz2ow-1; Wed, 08 Feb 2023 07:16:43 -0500
X-MC-Unique: QhO7dUKhNtyPZnrZ6jz2ow-1
Received: by mail-qt1-f199.google.com with SMTP id x16-20020ac87ed0000000b003b82d873b38so10666061qtj.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Feb 2023 04:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjMSi9ok1TzHSDU3w1PUUtKMgZdBUc/PnFmrcylWMYk=;
        b=IStavQKgZctS9yuuabxczkrsYDw7o6zrrm+l58tGGx9VFDsMpVpGYEWo66L0NZV4Hz
         GittO6nFn6znwa6DcockKjpy4jIoihRSEWLoHxrl8ePEHDQjAnqFZk7d6wbvcZs3w5Hs
         yWJb/B+KGVbMHH7dyPEG6D/e6xuUWM8X6H5DT1WEGFPJq/F4M0dxfhefZM0Hp5prL9+S
         EDkJQ0PU8oVT38bw1+TvXDetKhY6B4QxqyE3fPkHiro0QX2vEgmfDQcreIVe9/BD87GQ
         eoaO9ZroxGe9hKzlEDRiFU/ZRJWUNOtWH0UZDlwWt5zI/XhkSE9rN7gh74pwSl/801uZ
         NFbQ==
X-Gm-Message-State: AO0yUKWvAQK/BRXQVkbKbquYG3WhZ8o5eW7Xul6Tz/wR1oP2rJ6lZoEq
	XqKaFXP4FnqU9lU9p+YjT2iOlBdQJVSGBmryOlXkvmNy3VO1jMTasPfL7cmO9PAyhJzMTC3qSBq
	YXtdXGkxanHzG4wEylVSoljLyOg==
X-Received: by 2002:a05:6214:2348:b0:56b:ef8e:18ec with SMTP id hu8-20020a056214234800b0056bef8e18ecmr12324933qvb.12.1675858603323;
        Wed, 08 Feb 2023 04:16:43 -0800 (PST)
X-Google-Smtp-Source: AK7set9NZULWqTl2Mcke9STbzAhWv2Gmx/BViB8dl8z0WU3BjxNZZ22NA4XHXc1de+u8uoed8iFu9Q==
X-Received: by 2002:a05:6214:2348:b0:56b:ef8e:18ec with SMTP id hu8-20020a056214234800b0056bef8e18ecmr12324890qvb.12.1675858603023;
        Wed, 08 Feb 2023 04:16:43 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-177-253.web.vodafone.de. [109.43.177.253])
        by smtp.gmail.com with ESMTPSA id 22-20020ac85616000000b003b630456b8fsm11264751qtr.89.2023.02.08.04.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 04:16:42 -0800 (PST)
Message-ID: <ac8073a3-868f-a923-4cb8-fda4785e7484@redhat.com>
Date: Wed, 8 Feb 2023 13:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Steven Price <steven.price@arm.com>, Cornelia Huck <cohuck@redhat.com>,
 Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
 <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
 <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com> <87zg9oleyb.fsf@redhat.com>
 <ce11001e-dbe5-8694-71a5-841f4d614456@arm.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <ce11001e-dbe5-8694-71a5-841f4d614456@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Eric Auger <eric.auger@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/02/2023 12.51, Steven Price wrote:
> On 08/02/2023 08:49, Cornelia Huck wrote:
>> On Wed, Feb 08 2023, Gavin Shan <gshan@redhat.com> wrote:
>>
>>> On 2/7/23 9:09 PM, Thomas Huth wrote:
>>>> Oh, drat, I thought I had checked all return statements ... this must have fallen through the cracks, sorry!
>>>>
>>>> Anyway, this is already a problem now: The function is called from kvm_arch_vm_ioctl() (which still returns a long), which in turn is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the return value in an "int r" variable. So the upper bits are already lost there.
> 
> Sorry about that, I was caught out by kvm_arch_vm_ioctl() returning long...

That's why I'm trying to fix that return type mess with my series, to avoid 
such problems in the future :-)

>>>> Also, how is this supposed to work from user space? The normal "ioctl()" libc function just returns an "int" ? Is this ioctl already used in a userspace application somewhere? ... at least in QEMU, I didn't spot it yet...
>>>>
>>
>> We will need it in QEMU to implement migration with MTE (the current
>> proposal simply adds a migration blocker when MTE is enabled, as there
>> are various other things that need to be figured out for this to work.)
>> But maybe other VMMs already use it (and have been lucky because they
>> always dealt with shorter lengths?)
>>
>>>
>>> The ioctl command KVM_ARM_MTE_COPY_TAGS was merged recently and not used
>>> by QEMU yet. I think struct kvm_arm_copy_mte_tags::length needs to be
>>> '__u32' instead of '__u64' in order to standardize the return value.
>>> Something like below. Documentation/virt/kvm/api.rst::section-4.130
>>> needs update accordingly.
>>>
>>>      struct kvm_arm_copy_mte_tags {
>>>           __u64 guest_ipa;
>>>           __u32 pad;
>>>           __u32 length;
>>>           void __user *addr;
>>>           __u64 flags;
>>>           __u64 reserved[2];
>>>     };
>>
>> Can we do this in a more compatible way, as we are dealing with an API?
>> Like returning -EINVAL if length is too big?
>>
> 
> I agree the simplest fix for the problem is simply to reject any
> lengths>INT_MAX:
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index cf4c495a4321..94aed7ce85c4 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -1032,6 +1032,13 @@ long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
>   	if (copy_tags->flags & ~KVM_ARM_TAGS_FROM_GUEST)
>   		return -EINVAL;
> 
> +	/*
> +	 * ioctl returns int, so lengths above INT_MAX cannot be
> +	 * represented in the return value
> +	 */
> +	if (length > INT_MAX)
> +		return -EINVAL;
> +
>   	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
>   		return -EINVAL;
> 
> This could also be fixed in a useable way by including a new flag which
> returns the length in an output field of the ioctl structure. I'm
> guessing a 2GB limit would be annoying to work around.

I agree that checking for length > INT_MAX is likely the best thing to do 
here right now. I'll add that in v2 of my series.

But actually, this might even be a good thing from another point of view (so 
I'm not sure whether your idea with the flag should really be pursued): The 
code here takes a mutex and then runs a while loop that depends on the 
length - which could cause the lock to be held for a rather long time if 
length is a 64-bit value. Forcing the user space to limit the length here 
could help to avoid taking the lock for too long.

  Thomas

