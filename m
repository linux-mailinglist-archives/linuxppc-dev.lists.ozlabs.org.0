Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E15321334
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 10:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DkcWg1DQKz3cQT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Feb 2021 20:36:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=nb05F34q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=nb05F34q; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DkcWF3xH6z30LN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 20:36:06 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id s23so5376001pji.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Feb 2021 01:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=FnEerRpW5BAZvcW0wU2c3GCcw8qOL5tMBEYtJeF0tIs=;
 b=nb05F34qbgNJ/BOFgPMS+kpLGz8ty5iT12LTxdWg+GfkNQD0HxssJlWOFM1RQ/yf0Q
 T2GwOvdAG0Tj0rNBsK9+3wdyxIfm/FPi23nrEcaRvUItErcfyBK0nx+ep25HRbmwQDnL
 vKiZIKVjm6GkmWvlF8rHpxFIu/q5Pfc2iagqYsrQUGaYWeYJ3ndIDV/5N3+YiFqsN9RI
 6EgB8hlPnhgm0K9lVBvK+cIp06LzS7El/AWj2trwpG/KK9YtoIS/KmO6hQ5cZOsaw6p/
 WZS0gMg3sYU2A+85EWWREGI6PA8KsRCZwF0OnWRarmIUC0ynmJqQbylk6REotmT2HwL7
 h4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=FnEerRpW5BAZvcW0wU2c3GCcw8qOL5tMBEYtJeF0tIs=;
 b=eB3X2NXcuFQKifvJODMOU3HdjLlJd+rCx9tbKT3xRDy0j213OmXJk5sDDBzS5NT67i
 W8yN/CYH57dvWaiPb1rTRAtIrQu+J85xI+r7vwF+IIQtCLkssnUfdqCoXRTzbgFFILLW
 OeaDR5sAzzeRWIGTWWnL/jSGU/KdgnQva2fssPuJzs93kc1C4jGAk3I885khaJVMQl04
 dnrYJVgDS36GkBprx28qsYSr8K7nUeA9fpVxF3BMTym4YS9pyqGmcZw+Orm7KBL6aRfr
 TomM+eUvRWKdGhTods7qnpJ2B6uuEW/TtEpqicQRCEbPrLQjA4G7dth0E67B/Tbd5vTH
 WGIg==
X-Gm-Message-State: AOAM531PEQMy2r60CJplVj5EcAJKQoNFDUdpeXVghpxR1nNfaSAWphmp
 5ZDAiFjF+OnNAoBaC+anQKkt/g==
X-Google-Smtp-Source: ABdhPJwuVvCodbcpAoHrGz1702fAkmKXXQ9sp2PN/DkFOkG4cteWa7NAssoG0ZbRrndJYu0di600jw==
X-Received: by 2002:a17:902:7782:b029:e3:2881:9eeb with SMTP id
 o2-20020a1709027782b02900e328819eebmr20981856pll.29.1613986563269; 
 Mon, 22 Feb 2021 01:36:03 -0800 (PST)
Received: from [192.168.10.153] (124-171-107-241.dyn.iinet.net.au.
 [124.171.107.241])
 by smtp.gmail.com with UTF8SMTPSA id 137sm18026425pgb.80.2021.02.22.01.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 01:36:02 -0800 (PST)
Message-ID: <38a0c3a4-3e18-f6e6-2d57-440978471964@ozlabs.ru>
Date: Mon, 22 Feb 2021 20:35:58 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:85.0) Gecko/20100101
 Thunderbird/85.0
Subject: Re: [PATCH kernel] powerpc/iommu: Annotate nested lock for lockdep
Content-Language: en-US
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20210216032000.21642-1-aik@ozlabs.ru>
 <49b1f5cb-107c-296f-c339-13e627a73d6d@linux.ibm.com>
 <7eaa747c-ebe1-14db-20f0-f115f9b85ba7@ozlabs.ru>
In-Reply-To: <7eaa747c-ebe1-14db-20f0-f115f9b85ba7@ozlabs.ru>
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



On 20/02/2021 14:49, Alexey Kardashevskiy wrote:
> 
> 
> On 18/02/2021 23:59, Frederic Barrat wrote:
>>
>>
>> On 16/02/2021 04:20, Alexey Kardashevskiy wrote:
>>> The IOMMU table is divided into pools for concurrent mappings and each
>>> pool has a separate spinlock. When taking the ownership of an IOMMU 
>>> group
>>> to pass through a device to a VM, we lock these spinlocks which triggers
>>> a false negative warning in lockdep (below).
>>>
>>> This fixes it by annotating the large pool's spinlock as a nest lock.
>>>
>>> ===
>>> WARNING: possible recursive locking detected
>>> 5.11.0-le_syzkaller_a+fstn1 #100 Not tainted
>>> --------------------------------------------
>>> qemu-system-ppc/4129 is trying to acquire lock:
>>> c0000000119bddb0 (&(p->lock)/1){....}-{2:2}, at: 
>>> iommu_take_ownership+0xac/0x1e0
>>>
>>> but task is already holding lock:
>>> c0000000119bdd30 (&(p->lock)/1){....}-{2:2}, at: 
>>> iommu_take_ownership+0xac/0x1e0
>>>
>>> other info that might help us debug this:
>>>   Possible unsafe locking scenario:
>>>
>>>         CPU0
>>>         ----
>>>    lock(&(p->lock)/1);
>>>    lock(&(p->lock)/1);
>>> ===
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>   arch/powerpc/kernel/iommu.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>> index 557a09dd5b2f..2ee642a6731a 100644
>>> --- a/arch/powerpc/kernel/iommu.c
>>> +++ b/arch/powerpc/kernel/iommu.c
>>> @@ -1089,7 +1089,7 @@ int iommu_take_ownership(struct iommu_table *tbl)
>>>       spin_lock_irqsave(&tbl->large_pool.lock, flags);
>>>       for (i = 0; i < tbl->nr_pools; i++)
>>> -        spin_lock(&tbl->pools[i].lock);
>>> +        spin_lock_nest_lock(&tbl->pools[i].lock, 
>>> &tbl->large_pool.lock);
>>
>>
>> We have the same pattern and therefore should have the same problem in 
>> iommu_release_ownership().
>>
>> But as I understand, we're hacking our way around lockdep here, since 
>> conceptually, those locks are independent. I was wondering why it 
>> seems to fix it by worrying only about the large pool lock. That loop 
>> can take many locks (up to 4 with current config). However, if the dma 
>> window is less than 1GB, we would only have one, so it would make 
>> sense for lockdep to stop complaining. Is it what happened? In which 
>> case, this patch doesn't really fix it. Or I'm missing something :-)
> 
> 
> My rough undestanding is that when spin_lock_nest_lock is called first 
> time, it does some magic with lockdep classes somewhere in 
> __lock_acquire()/register_lock_class() and right after that the nested 
> lock is not the same as before and it is annotated so  we cannot lock 
> nested locks without locking the nest lock first and no (re)annotation 
> is needed. I'll try to poke this code once again and see, it is just was 
> easier with p9/nested which is gone for now because of little snow in 
> one of the southern states :)


Turns out I have good imagination and in fact it does print this huge 
warning in the release hook as well so v2 is coming. Thanks,


> 
> 
>>
>>    Fred
>>
>>
>>
>>>       iommu_table_release_pages(tbl);
>>>
> 

-- 
Alexey
