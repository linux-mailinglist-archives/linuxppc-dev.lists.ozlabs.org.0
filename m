Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B93FE8B6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 07:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0V1271w5z2yNr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 15:32:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=MfxsRipP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::529;
 helo=mail-pg1-x529.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=MfxsRipP; dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0V0H6ttPz2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 15:31:24 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id w8so743477pgf.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 22:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JnfRFT5cGQON1porM5TsyHMCnu1AD+Z9R9PTnGkoCRw=;
 b=MfxsRipP8toGzFUC+AXMbc9EN3kdJLP+mfCDduwiD42To7foPxBCU36YQML4tX4XOw
 Xk1UZVUVknGGLDqfhWzxEc8fUXVJADeY6KC2ZEA0eMNqGUpDrtIpTvvrZIbPV3gygnnH
 2F5U/3DPfUmsm86sAwm6pCphF1+0cFyD3etTaGidx+OL2uEGO/jrWQtNdRala/8viaKr
 5Wn2jjbZPa5uKRMtU1UtTPvjXBLBVaiX6H9xg9GRBIJ0Ffiv7Mx/+YqNzlFBQPUlH+uB
 VQS0kfWEWaOaaF0bABB8oqP8KX6xqNWqZLmIIsGD06NuYB8dp0WHM+hd91M+br2UEJHF
 4/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JnfRFT5cGQON1porM5TsyHMCnu1AD+Z9R9PTnGkoCRw=;
 b=AZi37hfNaQuinukZVIBlzGO3+KWOJ9/6Smy0aj6qV53mOMT8dNVD9wdwl7OwON5O8F
 u81DLzrx2hf9nLBdpAbAqI7JX4iacl5RtjTDJZeD3pcvoxilAdlnohPDcqGfu4lGK/tl
 Px7kCucqNeRwM64W3lwK3z4VxqsRBblRl/0+c9JmXlSOT+lWZkUZEZVnu8Or5pXNxB1U
 X4S9w31A+WYK8ay/8FtNGuQ5+PtXCokFndm8p1gU/ASSjUkPMppSJZvl+dGVggErhDa4
 2lrLMeJBwm6IYTNveQX1AZgmelspVvr17+/aB0fXit8k4Z2JTix1sdNZCT3iRxVbTWb8
 mIVA==
X-Gm-Message-State: AOAM530pq8GS2hv/fLgKezDVswtwB+E7/Am62c88Y0sT0RWRiAe/y8EN
 YILQkx+yi2Ur+JzJ0FulkA1HhA==
X-Google-Smtp-Source: ABdhPJyHNgu5yKytrzSh73Ye5fwnOwcrpcl3VMRMIzomrZJ+aH/g+uvi3a1TKz4CPv07fNn1u/rDbw==
X-Received: by 2002:a63:1e4e:: with SMTP id p14mr1462580pgm.261.1630560681199; 
 Wed, 01 Sep 2021 22:31:21 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id s14sm867387pgf.4.2021.09.01.22.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 22:31:20 -0700 (PDT)
Message-ID: <4af71498-30ac-04e2-4fa7-f13d23acb03c@ozlabs.ru>
Date: Thu, 2 Sep 2021 15:31:14 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
 <87pmubu306.fsf@linux.ibm.com>
 <a1be1913-f564-924b-1750-03efa859a0b1@ozlabs.ru>
 <2fe01488-5a9b-785e-7c05-1d527dead18d@ozlabs.ru>
 <87lf4gv0hf.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87lf4gv0hf.fsf@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/09/2021 00:23, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> On 24/08/2021 18:37, Alexey Kardashevskiy wrote:
>>>
>>>
>>> On 18/08/2021 08:20, Fabiano Rosas wrote:
>>>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>>>
>>>>> On 07/07/2021 14:13, Alexey Kardashevskiy wrote:
>>>>
>>>>> alternatively move this debugfs stuff under the platform-independent
>>>>> directory, how about that?
>>>>
>>>> That's a good idea. I only now realized we have two separate directories
>>>> for the same guest:
>>>>
>>>> $ ls /sys/kernel/debug/kvm/ | grep $pid
>>>> 19062-11
>>>> vm19062
>>>>
>>>> Looks like we would have to implement kvm_arch_create_vcpu_debugfs for
>>>> the vcpu information and add a similar hook for the vm.
>>>
>>> Something like that. From the git history, it looks like the ppc folder
>>> was added first and then the generic kvm folder was added but apparently
>>> they did not notice the ppc one due to natural reasons :)
>>>
>>> If you are not too busy, can you please merge the ppc one into the
>>> generic one and post the patch, so we won't need to fix these
>>> duplication warnings again? Thanks,
>>
>>
>>
>> Turns out it is not that straight forward as I thought as the common KVM
>> debugfs entry is created after PPC HV KVM created its own and there is
>> no obvious way to change the order (no "post init" hook in
>> kvmppc_ops).
> 
> That is why I mentioned creating a hook similar to
> kvm_create_vcpu_debugfs in the common KVM code. kvm_create_vm_debugfs or
> something.

ah sorry I missed that :-/


> Alternatively, maybe kvm_create_vm_debugfs could be moved earlier into
> kvm_create_vm, before kvm_arch_post_init_vm and we could move our code
> into kvm_arch_post_init_vm.

kvm_arch_create_vcpu_debugfs() or kvm_arch_post_init_vm() will still 
require hooks in kvmppc_ops and such bikeshedding may take a while :)


>>
>> Also, unlike the common KVM debugfs setup, we do not allocate structures
>> to support debugfs nodes so we do not leak anything to bother with a
>> mutex like 85cd39af14f4 did.
>>
>> So I'd stick to the original patch to reduce the noise in the dmesg, and
>> it also exposes lpid which I find rather useful for finding the right
>> partition scope tree in partition_tb.
>>
>> Michael?
>>
>>
>>>
>>>
>>>
>>>>>> ---
>>>>>>     arch/powerpc/kvm/book3s_hv.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c
>>>>>> b/arch/powerpc/kvm/book3s_hv.c
>>>>>> index 1d1fcc290fca..0223ddc0eed0 100644
>>>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>>>> @@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm
>>>>>> *kvm)
>>>>>>         /*
>>>>>>          * Create a debugfs directory for the VM
>>>>>>          */
>>>>>> -    snprintf(buf, sizeof(buf), "vm%d", current->pid);
>>>>>> +    snprintf(buf, sizeof(buf), "vm%d-lp%ld", current->pid, lpid);
>>>>>>         kvm->arch.debugfs_dir = debugfs_create_dir(buf,
>>>>>> kvm_debugfs_dir);
>>>>>>         kvmppc_mmu_debugfs_init(kvm);
>>>>>>         if (radix_enabled())
>>>>>>
>>>

-- 
Alexey
