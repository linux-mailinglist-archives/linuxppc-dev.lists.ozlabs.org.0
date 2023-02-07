Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F4C68D2CD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 10:29:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9yWp25fgz2xm3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 20:29:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S9xDg8J/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S9xDg8J/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S9xDg8J/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S9xDg8J/;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9ySY3NCmz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 20:26:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675762009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/F3qfr1H23q3phH6cljEmKpLs439z5etAwPY/FDcZlA=;
	b=S9xDg8J/ybIMa0er2wIJQ35rbFTNl4c7a4vT6O3QNXRhvs/KaG7B3j8jr1XP3rJt/+BPka
	andEgZ4bEyy0VRqMAY4OiW6p5SD9UkM/48thxWe0KGxe0Sbw9PIg9RjdcnztpdU99OEUpj
	D577eXMyqmzei7uPZCJkFD8E7vh9zkY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675762009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/F3qfr1H23q3phH6cljEmKpLs439z5etAwPY/FDcZlA=;
	b=S9xDg8J/ybIMa0er2wIJQ35rbFTNl4c7a4vT6O3QNXRhvs/KaG7B3j8jr1XP3rJt/+BPka
	andEgZ4bEyy0VRqMAY4OiW6p5SD9UkM/48thxWe0KGxe0Sbw9PIg9RjdcnztpdU99OEUpj
	D577eXMyqmzei7uPZCJkFD8E7vh9zkY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-xDQ__YMPOgGgfAPHRIaf6A-1; Tue, 07 Feb 2023 04:26:45 -0500
X-MC-Unique: xDQ__YMPOgGgfAPHRIaf6A-1
Received: by mail-qt1-f198.google.com with SMTP id cr22-20020a05622a429600b003b694a9f291so8182770qtb.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Feb 2023 01:26:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/F3qfr1H23q3phH6cljEmKpLs439z5etAwPY/FDcZlA=;
        b=viXBPQZf/Enw3n/XnUx9DkA5o6Yny4bnq2PlEuvvJTLptdDQskWql8UF6YndzdYI0G
         nFKIuvGyL9uuShVQaJ8sc6ff+zzsRss/pXQXNOw5tEtDxnWySmtqxT7Ey57ms74Psf6Q
         0LOWFtQ9r8SagQPpFIhs/GiC4eTKe9C4SNB1Xc6FA64HIpBguc1zSvqjOXDy/SqDXupM
         60fpj4nYQpBl0NICncBZUwiKuvHcQeWLvyue1KJZgB8TZqb0VLII+8miMzSeD75kiNSB
         1xizUSx/qlXGx1D0NoEc8uHgcscvALa5b+qqMlMu4f1ZraYFKFHhz7vDYPzXwlvJa5QG
         lfzA==
X-Gm-Message-State: AO0yUKXzsdBr2FSilnkxPqowSbzNoZm0kanecZH1C+ONvxRrnleVGStN
	9RmRYZ7g8Vqszkrt9iOex5qhmRbIzI4+8AeNHaGb1qgRXhyT8QKb0IzeYl7613JHLfg3lKVGOfJ
	YFwjXQIDaRDyGtpmxsq6UV8KegQ==
X-Received: by 2002:a05:622a:188d:b0:3b9:a441:37f3 with SMTP id v13-20020a05622a188d00b003b9a44137f3mr3131478qtc.64.1675762004532;
        Tue, 07 Feb 2023 01:26:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8bB7OmE4JZ0vH4S5PaJ9NaK/oiOhz8aqf0f6ynkAzsxoZg5CO1XDpfEPDTS/rewIBCUB+dtA==
X-Received: by 2002:a05:622a:188d:b0:3b9:a441:37f3 with SMTP id v13-20020a05622a188d00b003b9a44137f3mr3131454qtc.64.1675762004253;
        Tue, 07 Feb 2023 01:26:44 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de. [109.43.176.120])
        by smtp.gmail.com with ESMTPSA id dl12-20020a05620a1d0c00b0071323d3e37fsm9034385qkb.133.2023.02.07.01.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 01:26:43 -0800 (PST)
Message-ID: <579f432d-6100-0ba1-5ba4-f72349ec9173@redhat.com>
Date: Tue, 7 Feb 2023 10:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/7] KVM: x86: Improve return type handling in
 kvm_vm_ioctl_get_nr_mmu_pages()
To: Sean Christopherson <seanjc@google.com>
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-3-thuth@redhat.com> <Y91JAb0kKBYQjO8a@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Y91JAb0kKBYQjO8a@google.com>
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/02/2023 18.48, Sean Christopherson wrote:
> On Fri, Feb 03, 2023, Thomas Huth wrote:
>> kvm_vm_ioctl_get_nr_mmu_pages() tries to return a "unsigned long" value,
>> but its caller only stores ther return value in an "int" - which is also
>> what all the other kvm_vm_ioctl_*() functions are returning. So returning
>> values that do not fit into a 32-bit integer anymore does not work here.
>> It's better to adjust the return type, add a sanity check and return an
>> error instead if the value is too big.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   arch/x86/kvm/x86.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index da4bbd043a7b..caa2541833dd 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -6007,8 +6007,11 @@ static int kvm_vm_ioctl_set_nr_mmu_pages(struct kvm *kvm,
>>   	return 0;
>>   }
>>   
>> -static unsigned long kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
>> +static int kvm_vm_ioctl_get_nr_mmu_pages(struct kvm *kvm)
>>   {
>> +	if (kvm->arch.n_max_mmu_pages > INT_MAX)
>> +		return -EOVERFLOW;
>> +
>>   	return kvm->arch.n_max_mmu_pages;
>>   }
> 
> My vote is to skip this patch, skip deprecation, and go straight to deleting
> KVM_GET_NR_MMU_PAGES.  The ioctl() has never worked[*], and none of the VMMs I
> checked use it (QEMU, Google's internal VMM, kvmtool, CrosVM).

I guess I'm living too much in the QEMU world where things need to be 
deprecated first before removing them ;-)
But sure, if everybody agrees that removing this directly is fine, too, I 
can do this in v2.

  Thomas


PS: Has there ever been a discussion about the other deprecated interfaces 
in include/uapi/linux/kvm.h ? Most of the stuff there seems to be from 2009 
... so maybe it's time now to remove that, too?

