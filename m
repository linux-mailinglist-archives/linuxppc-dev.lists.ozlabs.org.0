Return-Path: <linuxppc-dev+bounces-7562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC35EA828F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Apr 2025 16:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZXmJC3HKYz2xS2;
	Thu, 10 Apr 2025 00:57:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744210635;
	cv=none; b=RlunsciLStF8u6Px82qU1+BaV7rRGMlJQSS/GQ2FCt/ixVZiNkr4zsA8Ps8dkXm2cX3EGsSR4u7/k6kyJcRzJvLaQeK9mhd71GpSsoIyxQLqF+eWXQbsPZHwgQEnKs9mAUF4V+d6ZRaeZOsT4XKYcw4GkmDuCOs+VaSkiLS3a438qMyiCAANrTen32J0FNxcIwGFTyAUoe2JCzeLLpwAXOtyL7ZXAGrxjcjWozQrzP0zDlPWvqzK//RdPTGFOeQh+VJi9k/Xbp563a+9yvYoISzGJiV931zu8Y5936irppN6uT2M4ht4bdYd3IVWPHIe1i3GA+MoeEzXsBe6QgNODw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744210635; c=relaxed/relaxed;
	bh=XTxp3qW+KPuzf+zXWuGUYa2ldWHd+1dpKttsCAAJnR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gtGHtqz3QTEkdfieo7+gMdMUJfZAtBwuTEYUGuc8jfAzsfqIXaXZOC70gPiRAGj3wG9Jq7mRgGNSFpNswHfMNv0Odl9mCUexpUueaWrTrk6jJTEJD45DsBXOUVwJniTvrGjB68+t9BjSfL7i3oWRaxP//+gJzQcd+rxQwPNkWIH/12M+E512seMr7OjhxBlMFexdUwwG2hMyjjbE3BvPTxxTGkYEa+tuW4XTmeXAN960XyyHpvnO3h4e6WSnCvui33oIZJPY9sLEo0ex7v5flNkaqyLwBJOFObrIJ/mht5Nv5X3kYfS/p5OGJfw0Dev/NKtr9iCeqz7FLdFZJK7+tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L/l7la2Y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L/l7la2Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=ryabinin.a.a@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZXmJB0P2Cz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Apr 2025 00:57:12 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30bec442a25so8990991fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Apr 2025 07:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744210630; x=1744815430; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XTxp3qW+KPuzf+zXWuGUYa2ldWHd+1dpKttsCAAJnR4=;
        b=L/l7la2YtYgxrROLVFJDYitPo9HnRaLixEhR+heKN1yNN2Ee6Oxcuxp/x1Dysba/EM
         oNkr7g5nx0Mc2Dg6r8L+vi52c8dv0SMqNYlpQKNR7VbLKz/jb8kubzQlSiv0Gj1yqeGj
         /PsIYVYv9Xv6Z7py5aQ91be19jHzgLqVEhnuK8iVklOjb0eGi5baMu/3puIdH6oaNPAV
         kAuw2BHqesPnzn+YdDe6w+2q5kGwc6tYZxuj6O6NJQt6qhzp1dyRjtrWjIZ8VwNDYmWv
         ci8KZ9CwkPiJHyVmqRy+LESxDmBORraA17h/i5v+JocoegA4FYuVMv5Nq99DCQI9bH0T
         zIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744210630; x=1744815430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTxp3qW+KPuzf+zXWuGUYa2ldWHd+1dpKttsCAAJnR4=;
        b=tnCgyBUzzK9OYUIucrVxo2ahky1bbD9JHAgV5QCXriK1xmyKwIrZ8v+Ojep30ReDTy
         KTxkDmmTuTilyvi7dTjcQg+WClv4YxBD4Qm8SIthbKEzyrqIVBXWaU0FAh2mw267NSpe
         SWn2AJ3bmiidizlX6OMZoOEow9ZxH/yHsoGhYOwLKQFoMn3DNZ7ltpDLsAgKL54meHOD
         ByaUBdcoDWfTbD8CKLEOfNyCBruzljHp9il/DBJzBcgvb31A9UFfrE3+LyQXxsDrQXMV
         relUV5o4GVK/vGlxIyl/lIqbR71EmDnNckiY8jm4oiLTWuxBDnuX3Vje50vNL6QsAxpf
         istw==
X-Forwarded-Encrypted: i=1; AJvYcCVvudrAmu/LcixSJ4WR0m8tNhrawr6fS9H6RDdp4gvd6uxWA0OAYvRlDxYHomehn2L7Xvne1R42Nofu5xI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwMg87ylzn4ZougpqQVfYjUdqy4FegGCy+CvUTVY8TUQvU+Mmtg
	+FCZM569kgyqux8Mkt6DM1w3mQcfYGbbD/LXE1lgrGWpMH7DjvFc
X-Gm-Gg: ASbGncsBG0TG3qI6ged4HgSbixoW1MHRJOOD0plYAlXQNzASkluRiHKrAFMdiv4KL/o
	yVFKHy3Lv/eG6D338D1xkYqZIhD5Bdeg34n2qxFXxdu5JkvPZywlQ88FBcQkmoiZH8HHb6LE9jq
	JWvT+JvPoSKK7yC5iWB1JB/sXkcuBCBO0TBX6qDeiLwGzj/ZzqBLXOMTtHkIJIesJ/DQ0k9mvm+
	93YbeJIDT88ymyv6kDbb/oIx6QBmwHyX/iMAqBzAW1/dqjk46Q0hsDKS3cY6wwHPR9Tg+B/2Ju/
	q9MSqtqb2YMQPB/2L2ER8cVeL7CpLjRcNnBJELqhpeQAQ9qwSdnE93izAWpukZbUXLursA==
X-Google-Smtp-Source: AGHT+IG7fk9emZaqKs/kKGowvaUASd2CDo9SSBq5dR2zvDPKxRK4W1C4hr7cqLTnQPNN0OUJNfi0kg==
X-Received: by 2002:a05:651c:221a:b0:30d:62c1:3bfc with SMTP id 38308e7fff4ca-30f4387ba49mr2911011fa.7.1744210629436;
        Wed, 09 Apr 2025 07:57:09 -0700 (PDT)
Received: from [172.27.52.232] (auburn-lo423.yndx.net. [93.158.190.104])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d61csm1929521fa.7.2025.04.09.07.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 07:57:09 -0700 (PDT)
Message-ID: <02d570de-001b-4622-b4c4-cfedf1b599a1@gmail.com>
Date: Wed, 9 Apr 2025 16:56:29 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] kasan: Avoid sleepable page allocation from atomic
 context
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins
 <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
 Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, kasan-dev@googlegroups.com, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, stable@vger.kernel.org
References: <cover.1744128123.git.agordeev@linux.ibm.com>
 <2d9f4ac4528701b59d511a379a60107fa608ad30.1744128123.git.agordeev@linux.ibm.com>
 <3e245617-81a5-4ea3-843f-b86261cf8599@gmail.com>
 <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Language: en-US
From: Andrey Ryabinin <ryabinin.a.a@gmail.com>
In-Reply-To: <Z/aDckdBFPfg2h/P@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/9/25 4:25 PM, Alexander Gordeev wrote:
> On Wed, Apr 09, 2025 at 04:10:58PM +0200, Andrey Ryabinin wrote:
> 
> Hi Andrey,
> 
>>> @@ -301,7 +301,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
>>>  	if (likely(!pte_none(ptep_get(ptep))))
>>>  		return 0;
>>>  
>>> -	page = __get_free_page(GFP_KERNEL);
>>> +	page = __get_free_page(GFP_ATOMIC);
>>>  	if (!page)
>>>  		return -ENOMEM;
>>>  
>>
>> I think a better way to fix this would be moving out allocation from atomic context. Allocate page prior
>> to apply_to_page_range() call and pass it down to kasan_populate_vmalloc_pte().
> 
> I think the page address could be passed as the parameter to kasan_populate_vmalloc_pte().

We'll need to pass it as 'struct page **page' or maybe as pointer to some struct, e.g.:
struct page_data {
 struct page *page;
};


So, the kasan_populate_vmalloc_pte() would do something like this:

kasan_populate_vmalloc_pte() {
	if (!pte_none)
		return 0;
	if (!page_data->page)
		return -EAGAIN;

	//use page to set pte

        //NULLify pointer so that next kasan_populate_vmalloc_pte() will bail
	// out to allocate new page
	page_data->page = NULL; 
}

And it might be good idea to add 'last_addr' to page_data, so that we know where we stopped
so that the next apply_to_page_range() call could continue, instead of starting from the beginning. 


> 
>> Whenever kasan_populate_vmalloc_pte() will require additional page we could bail out with -EAGAIN,
>> and allocate another one.
> 
> When would it be needed? kasan_populate_vmalloc_pte() handles just one page.
> 

apply_to_page_range() goes over range of addresses and calls kasan_populate_vmalloc_pte()
multiple times (each time with different 'addr' but the same '*unused' arg). Things will go wrong
if you'll use same page multiple times for different addresses.


> Thanks!


