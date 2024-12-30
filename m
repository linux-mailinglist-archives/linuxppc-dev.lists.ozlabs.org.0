Return-Path: <linuxppc-dev+bounces-4512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F46C9FE238
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 04:12:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM1P24H0Zz2yjR;
	Mon, 30 Dec 2024 14:12:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735528342;
	cv=none; b=kAgfT2NeC//Xgy4iZLfdweX6tM0OPX22FlFN67XuXnW9+KBzmKGcE+PJgZDsXqRomHmBOPQ/a8fdXvyLpQ7SO/3tr5sfDGh28TNBgwXwwNMLA2G8kyP0JdCyIWhpugoULi7xz8puZfTG5NPYvgK0TJr9CqljNSSqt9KvlYDJtQqQoAZqtRsUy47Sqh5ZZUqLcKdTGZq/P6il9OcHm+HSvgbJHTmp5j1cEwCmZyULEb20Kmb9/Sc44OsXKNNf0Wtxo1bHo7o9cWSkTgET0cRL0StPezIDredMYWPFYDPrRbYK56A/4ZIRhcvwfO7RqPfcpRgh8JND4kuccsbOBaTk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735528342; c=relaxed/relaxed;
	bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxhstXk0iZpjACK/8hcMdgBfvA1S9/Exzncc4M7PIeHHuFEsYOhSnt+foagCZNdXEPLs/CAwOlHsC8gzsqyqqRc3GZOpb8eyBK7zYvwDHStD05ESls7vO0oMcKdBseipMR+j3wOGkkW/is0T5VBePk+AuxnHt+ikjzzVB6dthx1QL5AO/nH5VBmVErhWODfga3EBQMXwK7qHk7NeKjY7Xfk1IINA964ZCbHwD98A8oblJU2RevjSt+/UE1CYrmOkQlE4Y/5mnMx/6l7bCZYD3fuo3+FpOP56Sy5MANFmmmnWZ6XfzfbICBrx+WaaGcdJGZqf9W1SV2w+/Oh5dHBoyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ioqswVOB; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=ioqswVOB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM1P0229Xz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 14:12:17 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2166f1e589cso136672255ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Dec 2024 19:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735528335; x=1736133135; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=ioqswVOBKJi8jGzAXtDUe/gxAnfwIEfP1ZqwZfhEssYHU40gVS0+upPf4tfCfKQCVZ
         YTjN+hopmsLeAui/Veme+u/xWpVK3UMqEa7u55Mf9GwDUOQ14iMOqJm2BnitflV9Neb/
         mJnMwSL5j43+V+YNicwc5bmTRCfGyafVfB1bdRFlAmwTFGFh3mOeLFFEL6lwkd61hd5F
         FuenXMoyPiZ1HDjf2kEfQBsqV1kZN/4bY68RQXQI9uPHcY3M8j/1qe+HdgP40sqU5i/2
         a+B/xfPg6CFTONhwnUh0chyY/R5NzWbPfs1OrT/beJo9kNQ2LEq8Y1g8zcT/n0Y8Pmci
         m9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735528335; x=1736133135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=00MV44O/wLuPQ/RpQp8S/rpHXiOskq9DnLB00pReqmw=;
        b=mq89FUk7/ER9279YkNnQ09Mog3MGo62tV7zWJDVFAw0uY+b0y9rRZt8bOcF3ycucvy
         SLBL5McEvk+S17ClHNNu8cAOxjaSV/3E+St2yKYTuiEwMMLiQxc9DLmUUjfKmqTbofXe
         Z3T0rmTlATRqxAvfCinDJYN8TeZn2I/En0DR1nWPTNW7R+tzsRZTJBuPKZoLf4bf0l+5
         N00C3xhPEyAecGjhE8jiMaDVzzkdbOashaiQ7i4F+M/8KPxQ5PWAd3/RJ7RRKYKSmuGD
         AkUBw+I+n4OW6icxaFNaUouKlcjRmOIeGYbR8FMtdKmMWkk/qASJJ31kSegrmbObrwBt
         3w3g==
X-Forwarded-Encrypted: i=1; AJvYcCVbjSHsZ8KZnOcFDUXXcvXTzuTgQVenrvy5EQaLA7xY+ntvK655NlNoggYpzIFq0MIerpapdZkGkJqOQ2w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YysHM5TBZTnzfmqHQjnD9VDTbZKI2/Z943P3OwR+LHz78Y0vt3y
	W2g+f61pscG9km1YF649jtWPpxGX9noxsYeWXKxUAKWqGgGqjr4LoPXOtnd6aOo=
X-Gm-Gg: ASbGncsO70bVD30e27VDffaiHh90+V90GybuGlD9NybBJiUwuGkb8PqTCdKSbd2rEGs
	yxe2js60iq/BBvmxWKbvxgWblVvYmQhuegBhRuB3VZcWiE01w+2MXp8izTB4SCLBp3zpxlEVbAM
	VEpakUvg48elsTy49AJ3SVbCFvuGoO6tRJAF2O+9SN9SNRmfDjyxCFTnprvnHv/YuSo4ebJmI1V
	f1MP2UgQwQ8GnsY8WXGUsObYSj7eeCPLO1gpjT9yWc72ne9+AQIyPfRbvvtnLQNx2Dtoc5nmpj/
	PEa+Lw==
X-Google-Smtp-Source: AGHT+IHVtuGTDJKnXgo1JS5AtVrvj0I/cg1dyieo6seko5BYBtWvsXqnYPIAVAFKhaTndzKmWg8VgQ==
X-Received: by 2002:a05:6a20:9185:b0:1e5:7db5:d6e7 with SMTP id adf61e73a8af0-1e5e083f019mr66304616637.46.1735528334820;
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb45sm18191842b3a.88.2024.12.29.19.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 19:12:14 -0800 (PST)
Message-ID: <9cac5690-c570-4d43-a6bc-2b59b85497ae@bytedance.com>
Date: Mon, 30 Dec 2024 11:12:00 +0800
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
Subject: Re: [PATCH v3 15/17] mm: pgtable: remove tlb_remove_page_ptdesc()
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>, akpm@linux-foundation.org,
 kevin.brodsky@arm.com, peterz@infradead.org
Cc: agordeev@linux.ibm.com, tglx@linutronix.de, david@redhat.com,
 jannh@google.com, hughd@google.com, yuzhao@google.com, willy@infradead.org,
 muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
 <b37435768345e0fcf7ea358f69b4a71767f0f530.1734945104.git.zhengqi.arch@bytedance.com>
 <Z2_EPmOTUHhcBegW@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z2_EPmOTUHhcBegW@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Mike,

On 2024/12/28 17:26, Mike Rapoport wrote:
> On Mon, Dec 23, 2024 at 05:41:01PM +0800, Qi Zheng wrote:
>> Here we are explicitly dealing with struct page, and the following logic
>> semms strange:
>>
>> tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));
>>
>> tlb_remove_page_ptdesc
>> --> tlb_remove_page(tlb, ptdesc_page(pt));
>>
>> So remove tlb_remove_page_ptdesc() and make callers call tlb_remove_page()
>> directly.
> 
> Please don't. The ptdesc wrappers are there as a part of reducing the size
> of struct page project [1].
> 
> For now struct ptdesc overlaps struct page, but the goal is to have them
> separate and always operate on struct ptdesc when working with page tables.

OK, so tlb_remove_page_ptdesc() and tlb_remove_ptdesc() are somewhat
intermediate products of the project.

Hi Andrew, can you help remove [PATCH v3 15/17], [PATCH v3 16/17] and
[PATCH v3 17/17] from the mm-unstable branch?

For [PATCH v3 17/17], I can send it separately later, or Kevin Brodsky
can help do this in his patch series. ;)

Thanks,
Qi

> 
> [1] https://kernelnewbies.org/MatthewWilcox/Memdescs
>   


