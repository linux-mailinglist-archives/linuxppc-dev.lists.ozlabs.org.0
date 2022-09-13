Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9ED5B6DA0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 14:51:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRjyj6c7nz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 22:51:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jGIh/hBB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20210112.gappssmtp.com header.i=@ozlabs-ru.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=jGIh/hBB;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRjy011fzz2xgN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 22:51:01 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso11229419pjd.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 05:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=m+eZZoFLZFj4EhrhLyyE+g7R7dkUsiwp1ctUGIB8Xyc=;
        b=jGIh/hBBHB9qngcxAiPKVlNnWoA+4zhrJlHf/7cC6XoKAdqrYm5GcLRzVI69z0CV39
         /w+Q5i/tkVixk74+Fp4Lhjc8bBaLEBt9cSXeJzBNcWGk1bbmt29VXx+sb3d/UPOKmUs8
         jtRkKfovsQvEtIMaRisgVTCoGaJAv2JiZu7sapDlXUUZejKRyep20zGPtVQAb1dAtjVO
         WKha2N36Mc9SKwfEVzRvas+JtOgsGBDvIwik+fsnWhTupgkW+Pqr195kPR6g7BM4ZnZd
         Bct9AUdOeRH9TAsfLZeB06sIYcOcAirND6uDCVUvlUoMTIWP43dr1J+vIaudr10e4A6O
         G5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=m+eZZoFLZFj4EhrhLyyE+g7R7dkUsiwp1ctUGIB8Xyc=;
        b=vYYmg53vfUS1Pxm9EEJDuEVcWA2rBPaMMFnS/0zB8m3YN42UOuus9R5Jxf6bluGbxQ
         j7rga0zF+5YYjZ10431yN1geXb7kDxXhsMQ0s6vUfX5AxfTZkFu9fFmJACGJwBoZDtpI
         eXXkQ5TGcnAo777cyobzHYtHBTm1WZxa+c93dGvCVUkCozMAT7UsdzsqHiz2UZkZ/eDt
         kHX0ybLB/ucQ6ZJ0UpPzgACrxIyiFbpLQ2OKMqDAuo5wLkdoXSjft2zMehIXQyQAws08
         wbaq8v1glFyOf5be0B6/N7uTTltO/xh3vUEeOun/pXgenBfNhgl5wUsx8m+kaHX88H+S
         3wpQ==
X-Gm-Message-State: ACgBeo01DA+RATsn+0eQtmKLpo8MZnyO2HiZL+5Dhgnr4mGT66jYLQwb
	xcox9k9NL3NqAENOsKu02pkZMA==
X-Google-Smtp-Source: AA6agR6b0dbrm/dWvV5TmvZeUsJCtL2b/PeHdCl4glygOlKhuTzGMSEz5loOjhBvm1OoAAz40VEAKw==
X-Received: by 2002:a17:902:c245:b0:178:3912:f1f7 with SMTP id 5-20020a170902c24500b001783912f1f7mr7946684plg.75.1663073458500;
        Tue, 13 Sep 2022 05:50:58 -0700 (PDT)
Received: from [192.168.10.153] (ppp121-45-204-168.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.204.168])
        by smtp.gmail.com with ESMTPSA id i12-20020a170902c94c00b00176da1aae5asm8419873pla.70.2022.09.13.05.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 05:50:57 -0700 (PDT)
Message-ID: <59dfb450-5a91-f27b-6edf-0adfa89729b7@ozlabs.ru>
Date: Tue, 13 Sep 2022 22:50:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:104.0) Gecko/20100101
 Thunderbird/104.0
Subject: Re: [PATCH kernel] KVM: PPC: Make KVM_CAP_IRQFD_RESAMPLE platform
 dependent
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: kvm-ppc@vger.kernel.org
References: <20220504074807.3616813-1-aik@ozlabs.ru>
 <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
In-Reply-To: <0d4bb0fa-10c6-3f5a-34c8-293144b3fdbb@ozlabs.ru>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ping? It's been a while and probably got lost :-/

On 18/05/2022 16:27, Alexey Kardashevskiy wrote:
> 
> 
> On 5/4/22 17:48, Alexey Kardashevskiy wrote:
>> When introduced, IRQFD resampling worked on POWER8 with XICS. However
>> KVM on POWER9 has never implemented it - the compatibility mode code
>> ("XICS-on-XIVE") misses the kvm_notify_acked_irq() call and the native
>> XIVE mode does not handle INTx in KVM at all.
>>
>> This moved the capability support advertising to platforms and stops
>> advertising it on XIVE, i.e. POWER9 and later.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>
>>
>> Or I could move this one together with KVM_CAP_IRQFD. Thoughts?
> 
> 
> Ping?
> 
>>
>> ---
>>   arch/arm64/kvm/arm.c       | 3 +++
>>   arch/mips/kvm/mips.c       | 3 +++
>>   arch/powerpc/kvm/powerpc.c | 6 ++++++
>>   arch/riscv/kvm/vm.c        | 3 +++
>>   arch/s390/kvm/kvm-s390.c   | 3 +++
>>   arch/x86/kvm/x86.c         | 3 +++
>>   virt/kvm/kvm_main.c        | 1 -
>>   7 files changed, 21 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 523bc934fe2f..092f0614bae3 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -210,6 +210,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>       case KVM_CAP_SET_GUEST_DEBUG:
>>       case KVM_CAP_VCPU_ATTRIBUTES:
>>       case KVM_CAP_PTP_KVM:
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +    case KVM_CAP_IRQFD_RESAMPLE:
>> +#endif
>>           r = 1;
>>           break;
>>       case KVM_CAP_SET_GUEST_DEBUG2:
>> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
>> index a25e0b73ee70..0f3de470a73e 100644
>> --- a/arch/mips/kvm/mips.c
>> +++ b/arch/mips/kvm/mips.c
>> @@ -1071,6 +1071,9 @@ int kvm_vm_ioctl_check_extension(struct kvm 
>> *kvm, long ext)
>>       case KVM_CAP_READONLY_MEM:
>>       case KVM_CAP_SYNC_MMU:
>>       case KVM_CAP_IMMEDIATE_EXIT:
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +    case KVM_CAP_IRQFD_RESAMPLE:
>> +#endif
>>           r = 1;
>>           break;
>>       case KVM_CAP_NR_VCPUS:
>> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
>> index 875c30c12db0..87698ffef3be 100644
>> --- a/arch/powerpc/kvm/powerpc.c
>> +++ b/arch/powerpc/kvm/powerpc.c
>> @@ -591,6 +591,12 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>           break;
>>   #endif
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +    case KVM_CAP_IRQFD_RESAMPLE:
>> +        r = !xive_enabled();
>> +        break;
>> +#endif
>> +
>>       case KVM_CAP_PPC_ALLOC_HTAB:
>>           r = hv_enabled;
>>           break;
>> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
>> index c768f75279ef..b58579b386bb 100644
>> --- a/arch/riscv/kvm/vm.c
>> +++ b/arch/riscv/kvm/vm.c
>> @@ -63,6 +63,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>       case KVM_CAP_READONLY_MEM:
>>       case KVM_CAP_MP_STATE:
>>       case KVM_CAP_IMMEDIATE_EXIT:
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +    case KVM_CAP_IRQFD_RESAMPLE:
>> +#endif
>>           r = 1;
>>           break;
>>       case KVM_CAP_NR_VCPUS:
>> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
>> index 156d1c25a3c1..85e093fc8d13 100644
>> --- a/arch/s390/kvm/kvm-s390.c
>> +++ b/arch/s390/kvm/kvm-s390.c
>> @@ -564,6 +564,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, 
>> long ext)
>>       case KVM_CAP_SET_GUEST_DEBUG:
>>       case KVM_CAP_S390_DIAG318:
>>       case KVM_CAP_S390_MEM_OP_EXTENSION:
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +    case KVM_CAP_IRQFD_RESAMPLE:
>> +#endif
>>           r = 1;
>>           break;
>>       case KVM_CAP_SET_GUEST_DEBUG2:
>> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
>> index 0c0ca599a353..a0a7b769483d 100644
>> --- a/arch/x86/kvm/x86.c
>> +++ b/arch/x86/kvm/x86.c
>> @@ -4273,6 +4273,9 @@ int kvm_vm_ioctl_check_extension(struct kvm 
>> *kvm, long ext)
>>       case KVM_CAP_SYS_ATTRIBUTES:
>>       case KVM_CAP_VAPIC:
>>       case KVM_CAP_ENABLE_CAP:
>> +#ifdef CONFIG_HAVE_KVM_IRQFD
>> +    case KVM_CAP_IRQFD_RESAMPLE:
>> +#endif
>>           r = 1;
>>           break;
>>       case KVM_CAP_EXIT_HYPERCALL:
>> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> index 70e05af5ebea..885e72e668a5 100644
>> --- a/virt/kvm/kvm_main.c
>> +++ b/virt/kvm/kvm_main.c
>> @@ -4293,7 +4293,6 @@ static long 
>> kvm_vm_ioctl_check_extension_generic(struct kvm *kvm, long arg)
>>   #endif
>>   #ifdef CONFIG_HAVE_KVM_IRQFD
>>       case KVM_CAP_IRQFD:
>> -    case KVM_CAP_IRQFD_RESAMPLE:
>>   #endif
>>       case KVM_CAP_IOEVENTFD_ANY_LENGTH:
>>       case KVM_CAP_CHECK_EXTENSION_VM:
> 

-- 
Alexey
