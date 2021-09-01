Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3343FD5D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 10:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzyJw44vmz2yRS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 18:44:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=hjUn6tSB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=hjUn6tSB; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzyJF55Wnz2xXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 18:43:25 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id
 mw10-20020a17090b4d0a00b0017b59213831so4115055pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=jifE2Va9ngQVAsLiT6zsdqzc3alMTgVxLxw4d+gYC7c=;
 b=hjUn6tSBjVMyCEFXDGiHzQbvgBVfJfqWQUUhcCQ9dYwx2x4AlzQoWGJwPEylu6i3PL
 oXctYcv0W45J+6OsxfEKbY6Wrk+CjPvEtPyKpzGuj2EjezsZPmjoobLJcaLN1a6LFeyI
 T8HNz4SxTD8Xg3jJ8ZLv2BsznfDnNe9T2IEK3CgUot97C8w19ROdMzb67o54FNCLcFIN
 KEHV7evbhjv9FQzLbkl78FJ+jGtVft2z1W9+vWQh4BJme4IGZBQIX9Ealmym3NTSSt4/
 Rwk914Y3RT+fXPevPN5OxTEsSVQVJHxlNbbJP1ey7zBNsZSlkgOgcOB9eURqVeJ1cG56
 4XJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jifE2Va9ngQVAsLiT6zsdqzc3alMTgVxLxw4d+gYC7c=;
 b=GhxiZKDbq49qh0tyMGVrl9P/fW/CIOSCfymhUcq4HbomkYwE0kzxQOmLNyuBEq8rlY
 cMM2Ipen3WZbRJKOQ9sBhnm+5pzSVx/tUOC38u+rj0W1Vh7/zRgs9T1lxVA6NcfEtUry
 Ueyd/CQxfGqGp8vzwUk3p344GRcXSGUgcKmG5ysB83337cIBurAognTYcjuDFq9nNL8k
 F2QG094e7vteONOAq09ONSRagJJIu52X6if2eYuD28JiojzAJud15QH/VutFzZ1DGs5R
 5uitAMNxmoWsc16hghkrf2vGs1doeyMWZCUAAkRlFkvDPWCfNIO5ir3aENS75rAu7U9W
 50XQ==
X-Gm-Message-State: AOAM533eUiB6/S9iksx2plA+BFZWhzab3D710eetxTKoDSfUUXdVaE1i
 m7OgRuJuXouzYvnbrvlEmKGuig==
X-Google-Smtp-Source: ABdhPJxETG81vftSZB2RUO0c8C8UNQNcTK0CdjrctNYeUQ2KjZrYdKB/cIN20h/a2ZaIoK2Q+uGIug==
X-Received: by 2002:a17:902:74c3:b0:132:287a:c052 with SMTP id
 f3-20020a17090274c300b00132287ac052mr8684453plt.32.1630485803503; 
 Wed, 01 Sep 2021 01:43:23 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with UTF8SMTPSA id t23sm5191221pjs.16.2021.09.01.01.43.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 01:43:23 -0700 (PDT)
Message-ID: <2fe01488-5a9b-785e-7c05-1d527dead18d@ozlabs.ru>
Date: Wed, 1 Sep 2021 18:43:18 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3S HV: Make unique debugfs nodename
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Fabiano Rosas <farosas@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210707041344.3803554-1-aik@ozlabs.ru>
 <be02290c-60a0-48af-0491-61e8a6d5b7b7@ozlabs.ru>
 <87pmubu306.fsf@linux.ibm.com>
 <a1be1913-f564-924b-1750-03efa859a0b1@ozlabs.ru>
In-Reply-To: <a1be1913-f564-924b-1750-03efa859a0b1@ozlabs.ru>
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



On 24/08/2021 18:37, Alexey Kardashevskiy wrote:
> 
> 
> On 18/08/2021 08:20, Fabiano Rosas wrote:
>> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
>>
>>> On 07/07/2021 14:13, Alexey Kardashevskiy wrote:
>>
>>> alternatively move this debugfs stuff under the platform-independent
>>> directory, how about that?
>>
>> That's a good idea. I only now realized we have two separate directories
>> for the same guest:
>>
>> $ ls /sys/kernel/debug/kvm/ | grep $pid
>> 19062-11
>> vm19062
>>
>> Looks like we would have to implement kvm_arch_create_vcpu_debugfs for
>> the vcpu information and add a similar hook for the vm.
> 
> Something like that. From the git history, it looks like the ppc folder 
> was added first and then the generic kvm folder was added but apparently 
> they did not notice the ppc one due to natural reasons :)
> 
> If you are not too busy, can you please merge the ppc one into the 
> generic one and post the patch, so we won't need to fix these 
> duplication warnings again? Thanks,



Turns out it is not that straight forward as I thought as the common KVM 
debugfs entry is created after PPC HV KVM created its own and there is 
no obvious way to change the order (no "post init" hook in kvmppc_ops).

Also, unlike the common KVM debugfs setup, we do not allocate structures 
to support debugfs nodes so we do not leak anything to bother with a 
mutex like 85cd39af14f4 did.

So I'd stick to the original patch to reduce the noise in the dmesg, and 
it also exposes lpid which I find rather useful for finding the right 
partition scope tree in partition_tb.

Michael?


> 
> 
> 
>>>> ---
>>>>    arch/powerpc/kvm/book3s_hv.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c 
>>>> b/arch/powerpc/kvm/book3s_hv.c
>>>> index 1d1fcc290fca..0223ddc0eed0 100644
>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>> @@ -5227,7 +5227,7 @@ static int kvmppc_core_init_vm_hv(struct kvm 
>>>> *kvm)
>>>>        /*
>>>>         * Create a debugfs directory for the VM
>>>>         */
>>>> -    snprintf(buf, sizeof(buf), "vm%d", current->pid);
>>>> +    snprintf(buf, sizeof(buf), "vm%d-lp%ld", current->pid, lpid);
>>>>        kvm->arch.debugfs_dir = debugfs_create_dir(buf, 
>>>> kvm_debugfs_dir);
>>>>        kvmppc_mmu_debugfs_init(kvm);
>>>>        if (radix_enabled())
>>>>
> 

-- 
Alexey
