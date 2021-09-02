Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 717AC3FE88B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 06:25:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0SXZ1tJRz2yp2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 14:25:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=RxbL8dN2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=RxbL8dN2; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0SWt0dxmz2xry
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 14:25:11 +1000 (AEST)
Received: by mail-pj1-x1033.google.com with SMTP id
 f11-20020a17090aa78b00b0018e98a7cddaso540881pjq.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 21:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=o/fdA9EiQAmnjCZwLE6dEup3eAwqC+a9XVZ0mxlaGiM=;
 b=RxbL8dN2qZkf2mEv2PmrK4gxrU8XmkYq8nc1/8Kvb3SVXXcPYRbTkkjcWCWqR/Qm14
 Vt7XAcc/y1RrzND0fZwF69pUbP8yZJNc2m9/gt2NIs2xkhABxvVTEf2P7Pbmsd2O2Egv
 AQi9sZvGKgshwe4seCdOJ1iqigt1AWzyVCkC1mROqMj/ybHleMbZ6980qm7GxGHaSOA+
 MWtbpQ6674CECRxd1L/dDDV+U+l7Je8cmA1hGHrvYrry5j60pZfkTKlOJNAW0qrbNgRY
 d3solZPvG6Wl6nVj+9e/qY48RraFq/mojIED4S7Dw9JRHLaw7vL6rz9FVL2iDs8QXDlr
 GApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=o/fdA9EiQAmnjCZwLE6dEup3eAwqC+a9XVZ0mxlaGiM=;
 b=nJgbkJXH9GpvqEYUe5RgQjIPtw+2h0bqKqAU2z4KNcLlXoxlcYvk816Gl6uFsmz9hz
 uI4k8s9Kz8TxVvb6H7RY3kh7ziYfMqnrK2uaVvXI+wt2yluZZVT587yEK0eBY7oWvkFN
 uB8PDi/j/GSF5oPO51dX+dWEiROVwUueQ/3pnZevVoPHmKWfH7FvhBcOGfPz8o29DpQB
 wa2UdJHeykKMYXnkN+tqPx05DckX8ImesrDTI9TGmDlQqbtqZ9w+6meMPBHOTSX/qFvN
 zqlm5OZ4IfvxMy6U5PtyVOQTuFMOl/JMthBsCAs+yHcB+ghHmBwO7OhTswJvnQuCIsa0
 d5eg==
X-Gm-Message-State: AOAM533uxM5N7SsR8qYBtqFedqqojOxbVlY/j50SqOis+cGnJR9E679Z
 7FY5x2wR2m1d8VkyBPurIkekLA==
X-Google-Smtp-Source: ABdhPJwcbWkTnTvfgneRQA2NLuCqjbeOV7NKEUCvFLXhAVerLpVk540v9Y8BlwnhrT4TAhyL2WUeYQ==
X-Received: by 2002:a17:90a:b795:: with SMTP id
 m21mr1483001pjr.143.1630556708274; 
 Wed, 01 Sep 2021 21:25:08 -0700 (PDT)
Received: from [192.168.10.23] (124-171-108-209.dyn.iinet.net.au.
 [124.171.108.209])
 by smtp.gmail.com with ESMTPSA id c123sm526061pfc.50.2021.09.01.21.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 21:25:07 -0700 (PDT)
Message-ID: <a72edcd2-a990-a549-2f31-dab134bef6a6@ozlabs.ru>
Date: Thu, 2 Sep 2021 14:25:03 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:92.0) Gecko/20100101
 Thunderbird/92.0
Subject: Re: [PATCH kernel] KVM: PPC: Book3S: Suppress warnings when
 allocating too big memory slots
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210901084512.1658628-1-aik@ozlabs.ru>
 <87fsuouysc.fsf@linux.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <87fsuouysc.fsf@linux.ibm.com>
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
Cc: kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 02/09/2021 00:59, Fabiano Rosas wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> The userspace can trigger "vmalloc size %lu allocation failure: exceeds
>> total pages" via the KVM_SET_USER_MEMORY_REGION ioctl.
>>
>> This silences the warning by checking the limit before calling vzalloc()
>> and returns ENOMEM if failed.
>>
>> This does not call underlying valloc helpers as __vmalloc_node() is only
>> exported when CONFIG_TEST_VMALLOC_MODULE and __vmalloc_node_range() is not
>> exported at all.
>>
>> Spotted by syzkaller.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>>   arch/powerpc/kvm/book3s_hv.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 474c0cfde384..a59f1cccbcf9 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -4830,8 +4830,12 @@ static int kvmppc_core_prepare_memory_region_hv(struct kvm *kvm,
>>   	unsigned long npages = mem->memory_size >> PAGE_SHIFT;
>>
>>   	if (change == KVM_MR_CREATE) {
>> -		slot->arch.rmap = vzalloc(array_size(npages,
>> -					  sizeof(*slot->arch.rmap)));
>> +		unsigned long cb = array_size(npages, sizeof(*slot->arch.rmap));
> 
> What does cb mean?

"count of bytes"

This is from my deep Windows past :)

https://docs.microsoft.com/en-us/windows/win32/stg/coding-style-conventions


> 
>> +
>> +		if ((cb >> PAGE_SHIFT) > totalram_pages())
>> +			return -ENOMEM;
>> +
>> +		slot->arch.rmap = vzalloc(cb);
>>   		if (!slot->arch.rmap)
>>   			return -ENOMEM;
>>   	}

-- 
Alexey
