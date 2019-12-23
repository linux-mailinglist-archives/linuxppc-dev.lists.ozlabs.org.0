Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 560D4129BD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 00:34:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47hbKd732GzDqBv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 10:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="RdtIPnl/"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47hbHq39pwzDq5W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 10:32:51 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id n9so2011920pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2019 15:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qa4milD+at6iDMHR+vlULbDQ6N5AE7zu9KtE6CnzKxg=;
 b=RdtIPnl/Eq8IfdBvLV2Vxn5I6blf52az6cdiGT2AG77GPNnqbRw91w0rrmp9DSMeU4
 RS5CflihqChPn5Lz/XslJ+jPxBW1pmArU9+xxZwBnFc0AMu3MaZ6Vygpa83WAFSx33J7
 FQ17uP4BdCxK7alOk2ofbGNbyvFWLUI2udmSTGQ1bu5I4wHpmxnC9mtOD7FuvWtUu1b5
 C/kazyJL8TX83ARCCanSdDxeaugqJf9+Rk1n1keMG/XDBQz0NDbYCKe0OUKdcLNO/WJ+
 Z2aeMa3/EdDhUyqR83JIORzFSYk6T2uKuaZ4bdUkjaG6iIBCdTcbeoK+hlWOHiaW+4fT
 LfQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qa4milD+at6iDMHR+vlULbDQ6N5AE7zu9KtE6CnzKxg=;
 b=h3M0U8gfi3RtZWFl6JQLuDSDf4YpcZjdbcyV8F28jo20vGRRnKSsoVVac8Sk+FfZzj
 uZO1qTTr6OnC4mrln12YUPaFe2odTsvx00LA5psg0wWDe2e65P1uOFG+Wyigik/Rv1NE
 spzZ3WVPtxvqvSHk5hd4zX1lm7NzNfxC4GkejloG6D6tNFSmhdey6oOSzXrgss9FBHSl
 AkdcjAopQ/muTuAMEUAkbKd63GB7BiRafw2kgc1E/BaiX+MXfbDM7sNlqLimRkMkmb2S
 y5KoE21fyfM9aIYWvp5g6Z3mYdKAALy2qEtcEx/yZxpjGsR2C9LQNfyMaaVAMrilSpjg
 IEIQ==
X-Gm-Message-State: APjAAAUpFvKvZD035zZkb1W8leBkIPrFsawVgO86UKl4xp2tXA45QOzw
 Ooy++8MLWif34QGpgB4Bzv7i2n/ZnF4=
X-Google-Smtp-Source: APXvYqyoXWQsmAiUxv7hZM63WH4OPGLwyZKcUxBtoqYtfvQUhHzChOulpjqbqZsY7wK/+dpW8stULg==
X-Received: by 2002:a65:55cc:: with SMTP id k12mr34932448pgs.184.1577143967869; 
 Mon, 23 Dec 2019 15:32:47 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 2sm596278pjh.19.2019.12.23.15.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2019 15:32:47 -0800 (PST)
Subject: Re: [PATCH kernel v3] powerpc/book3s64: Fix error handling in
 mm_iommu_do_alloc()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20191223060351.26359-1-aik@ozlabs.ru>
 <87mubjl27j.fsf@mpe.ellerman.id.au>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <56e98c75-ea44-6805-4bd3-c41620834e9e@ozlabs.ru>
Date: Tue, 24 Dec 2019 10:32:42 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <87mubjl27j.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Jan Kara <jack@suse.cz>, kvm-ppc@vger.kernel.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/12/2019 22:18, Michael Ellerman wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> 
>> The last jump to free_exit in mm_iommu_do_alloc() happens after page
>> pointers in struct mm_iommu_table_group_mem_t were already converted to
>> physical addresses. Thus calling put_page() on these physical addresses
>> will likely crash.
>>
>> This moves the loop which calculates the pageshift and converts page
>> struct pointers to physical addresses later after the point when
>> we cannot fail; thus eliminating the need to convert pointers back.
>>
>> Fixes: eb9d7a62c386 ("powerpc/mm_iommu: Fix potential deadlock")
>> Reported-by: Jan Kara <jack@suse.cz>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> Changes:
>> v3:
>> * move pointers conversion after the last possible failure point
>> ---
>>  arch/powerpc/mm/book3s64/iommu_api.c | 39 +++++++++++++++-------------
>>  1 file changed, 21 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/book3s64/iommu_api.c b/arch/powerpc/mm/book3s64/iommu_api.c
>> index 56cc84520577..ef164851738b 100644
>> --- a/arch/powerpc/mm/book3s64/iommu_api.c
>> +++ b/arch/powerpc/mm/book3s64/iommu_api.c
>> @@ -121,24 +121,6 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>>  		goto free_exit;
>>  	}
>>  
>> -	pageshift = PAGE_SHIFT;
>> -	for (i = 0; i < entries; ++i) {
>> -		struct page *page = mem->hpages[i];
>> -
>> -		/*
>> -		 * Allow to use larger than 64k IOMMU pages. Only do that
>> -		 * if we are backed by hugetlb.
>> -		 */
>> -		if ((mem->pageshift > PAGE_SHIFT) && PageHuge(page))
>> -			pageshift = page_shift(compound_head(page));
>> -		mem->pageshift = min(mem->pageshift, pageshift);
>> -		/*
>> -		 * We don't need struct page reference any more, switch
>> -		 * to physical address.
>> -		 */
>> -		mem->hpas[i] = page_to_pfn(page) << PAGE_SHIFT;
>> -	}
>> -
>>  good_exit:
>>  	atomic64_set(&mem->mapped, 1);
>>  	mem->used = 1;
>> @@ -158,6 +140,27 @@ static long mm_iommu_do_alloc(struct mm_struct *mm, unsigned long ua,
>>  		}
>>  	}
>>  
>> +	if (mem->dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) {
> 
> Couldn't you avoid testing this again ...
> 
>> +		/*
>> +		 * Allow to use larger than 64k IOMMU pages. Only do that
>> +		 * if we are backed by hugetlb. Skip device memory as it is not
>> +		 * backed with page structs.
>> +		 */
>> +		pageshift = PAGE_SHIFT;
>> +		for (i = 0; i < entries; ++i) {
> 
> ... by making this loop up to `pinned`.
> 
> `pinned` is only incremented in the loop that does the GUP, and there's
> a check that pinned == entries after that loop.
> 
> So when we get here we know pinned == entries, and if pinned is zero
> it's because we took the (dev_hpa != MM_IOMMU_TABLE_INVALID_HPA) case at
> the start of the function to get here.
> 
> Or do you think that's too subtle to rely on?


I had 4 choices:

1. for (;i < pinned;)

2. if (dev_hpa == MM_IOMMU_TABLE_INVALID_HPA) (dev_hpa is a function
parameter)

3. if (mem->dev_hpa == MM_IOMMU_TABLE_INVALID_HPA)

4. if (mem->hpages)


The function is already ugly. 3) seemed as the most obvious way of
telling what is going on here: "we have just initialized @mem and it is
not for a device memory, lets finish the initialization".

I could rearrange the code even more but since there is no NVLink3
coming ever, I'd avoid changing it more than necessary. Thanks,


> 
> cheers
> 
>> +			struct page *page = mem->hpages[i];
>> +
>> +			if ((mem->pageshift > PAGE_SHIFT) && PageHuge(page))
>> +				pageshift = page_shift(compound_head(page));
>> +			mem->pageshift = min(mem->pageshift, pageshift);
>> +			/*
>> +			 * We don't need struct page reference any more, switch
>> +			 * to physical address.
>> +			 */
>> +			mem->hpas[i] = page_to_pfn(page) << PAGE_SHIFT;
>> +		}
>> +	}
>> +
>>  	list_add_rcu(&mem->next, &mm->context.iommu_group_mem_list);
>>  
>>  	mutex_unlock(&mem_list_mutex);
>> -- 
>> 2.17.1

-- 
Alexey
