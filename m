Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAE43B3E3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 10:08:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GB8km4TJjz3c0W
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 18:08:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jK0/NpFV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jK0/NpFV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=jK0/NpFV; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=jK0/NpFV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GB8kG5sXQz2yXc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 18:07:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624608447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=jK0/NpFVp4oMevRWYSWRsakDd42UE7hcTrOSylVlUYAqVgsIs2eTQFyCFvYaWOH9l1dgJX
 mI7hL8T9her949OZD1uxufDCANXBHrAxm9IEBE7IonhGDYPdzNzgM7FXtZFO9w0a6oyyFP
 5LtcrHhGQfQ6TBgTfUyWYAOPQ16cXJA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624608447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=jK0/NpFVp4oMevRWYSWRsakDd42UE7hcTrOSylVlUYAqVgsIs2eTQFyCFvYaWOH9l1dgJX
 mI7hL8T9her949OZD1uxufDCANXBHrAxm9IEBE7IonhGDYPdzNzgM7FXtZFO9w0a6oyyFP
 5LtcrHhGQfQ6TBgTfUyWYAOPQ16cXJA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-3B_DZ_5uPey863ztk6Csdw-1; Fri, 25 Jun 2021 04:07:25 -0400
X-MC-Unique: 3B_DZ_5uPey863ztk6Csdw-1
Received: by mail-ej1-f70.google.com with SMTP id
 lt4-20020a170906fa84b0290481535542e3so2827141ejb.18
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 01:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WsuZzmc69l3ui1BgglnMF86Cw0fADvcr/OA+7H4A20w=;
 b=sSDo+kyemkE1ylD+1L5LhpYKD8q8BNrlHfyK1G2sFRkva2JFczUmhkVH0ZX5EtcrL7
 +Bgp/sL0K1yy139RrKWYNESDoMDQVZdYX2OjAsIhIZMT9HRsZ8MsrmEmwoSBRO8V3WH7
 j6eqy8/2Z1198v75tjzWBAROTIpVMlmKt+d25jIGk4QyA79FetqQEprWMocOW3U1mP0u
 JXh9bvI3khtOMyuXMx6Fg6m2TM9FXH7mNlQxZQ7OOePfCeUkoR9fqQOleU8UMksFYbPU
 nKAB4Ln7nQ87SVvTl0xbajq1d3i7Nqzc3+SuNMcScZgiltU2BpjvOV0QX4A+efauMjiu
 CPCQ==
X-Gm-Message-State: AOAM533cwqfrTt9ycoiE48VtNEkTvsCDDbb/FDRg65Mq1363ex+4bf/3
 KHNur8K7BpiGQEKxRnEzCJqLDGz0rac05v2yZj7GIhnJOR+MYzHSVXP47lgd5l0kDVVjdw+sWW/
 FlmqY6cTASuhMikrEpyjzCveeIg==
X-Received: by 2002:a17:907:96a8:: with SMTP id
 hd40mr9411652ejc.546.1624608443912; 
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVB3z+OXWUecb9ahGrJESZcqrbKx9pnQ6XoxJ6GZ25cMxxTZOEeAuP3MqM1WxvBDGMvZ/qcw==
X-Received: by 2002:a17:907:96a8:: with SMTP id
 hd40mr9411623ejc.546.1624608443667; 
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id cf3sm1879380edb.39.2021.06.25.01.07.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:07:23 -0700 (PDT)
Subject: Re: [PATCH v2 1/5] KVM: do not allow mapping valid but non-refcounted
 pages
To: Christian Borntraeger <borntraeger@de.ibm.com>,
 David Stevens <stevensd@chromium.org>, Marc Zyngier <maz@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, Nick Piggin <npiggin@gmail.com>
References: <20210625073616.2184426-1-stevensd@google.com>
 <20210625073616.2184426-2-stevensd@google.com>
 <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5e865b84-7b8f-bd2d-5e74-f46b257ad858@redhat.com>
Date: Fri, 25 Jun 2021 10:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <183b71c1-6bb0-8d05-e2ce-e452253259a8@de.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: kvm-ppc@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zhenyu Wang <zhenyuw@linux.intel.com>,
 linux-mips@vger.kernel.org, James Morse <james.morse@arm.com>,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu,
 Zhi Wang <zhi.a.wang@intel.com>, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/06/21 09:58, Christian Borntraeger wrote:
> 
> 
> On 25.06.21 09:36, David Stevens wrote:
>> From: Nicholas Piggin <npiggin@gmail.com>
>>
>> It's possible to create a region which maps valid but non-refcounted
>> pages (e.g., tail pages of non-compound higher order allocations). These
>> host pages can then be returned by gfn_to_page, gfn_to_pfn, etc., family
>> of APIs, which take a reference to the page, which takes it from 0 to 1.
>> When the reference is dropped, this will free the page incorrectly.
>>
>> Fix this by only taking a reference on the page if it was non-zero,
>> which indicates it is participating in normal refcounting (and can be
>> released with put_page).
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> I guess this would be the small fix for stable? Do we want to add that cc?
> 
> Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>

Yes, this one is going to Linus today.  The rest is for 5.15.

Paolo

>> ---
>>   virt/kvm/kvm_main.c | 19 +++++++++++++++++--
>>   1 file changed, 17 insertions(+), 2 deletions(-)
>>
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 3dcc2abbfc60..f7445c3bcd90 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -2175,6 +2175,13 @@ static bool vma_is_valid(struct vm_area_struct 
>> *vma, bool write_fault)
>>       return true;
>>   }
>>
>> +static int kvm_try_get_pfn(kvm_pfn_t pfn)
>> +{
>> +    if (kvm_is_reserved_pfn(pfn))
>> +        return 1;
>> +    return get_page_unless_zero(pfn_to_page(pfn));
>> +}
>> +
>>   static int hva_to_pfn_remapped(struct vm_area_struct *vma,
>>                      unsigned long addr, bool *async,
>>                      bool write_fault, bool *writable,
>> @@ -2224,13 +2231,21 @@ static int hva_to_pfn_remapped(struct 
>> vm_area_struct *vma,
>>        * Whoever called remap_pfn_range is also going to call e.g.
>>        * unmap_mapping_range before the underlying pages are freed,
>>        * causing a call to our MMU notifier.
>> +     *
>> +     * Certain IO or PFNMAP mappings can be backed with valid
>> +     * struct pages, but be allocated without refcounting e.g.,
>> +     * tail pages of non-compound higher order allocations, which
>> +     * would then underflow the refcount when the caller does the
>> +     * required put_page. Don't allow those pages here.
>>        */
>> -    kvm_get_pfn(pfn);
>> +    if (!kvm_try_get_pfn(pfn))
>> +        r = -EFAULT;
>>
>>   out:
>>       pte_unmap_unlock(ptep, ptl);
>>       *p_pfn = pfn;
>> -    return 0;
>> +
>> +    return r;
>>   }
>>
>>   /*
>>
> 

