Return-Path: <linuxppc-dev+bounces-4706-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E943A02668
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 14:23:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRZcx2PG2z301x;
	Tue,  7 Jan 2025 00:23:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736169809;
	cv=none; b=DNy/BKx0iGhRGzbGUAvtbdyga0pvbgV1sKILUBjLB5bhpUj/AduOpB9cZnAN/phYtRqWhnCzhJ5VYDqOUSGjRrxQ0g8/SlJT9t3SPbUdDapjqvLzY+ZVInM3uY+2FiGvEJHZBZ3CoHvVBbPAFfqImK6V9rLPXBa30MQohLBvVV8T695DEEzktdCbPSr+aEqON5DwnWHhFKTw7kIC6Rx3dXyDK+UeNvBHIQCoXRXeUV8cLT3CA1O0rFDMVpm74RMv0qQ9SsOPoMbDI60b85YaTKdu1xHDyP6a80C13Cb/WygtyW3wq7Z6add6uTzE4g3VKkOFOjvVJC1Qdve6W0SDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736169809; c=relaxed/relaxed;
	bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QUss7Ed/5HKXGD0wA87OfuBqJa4GgOboSeLQglkbCCLBU/aB2qRAbtaN28b9UdLdeq+m0PzMn+yQMA5iNiUOyvCNWA5PaIZ8EX3wn8ZojmKunk5Wwg2sl+wajk3/FCxnyIwPvW6nTlZj/2ysr0wdbph734IAmvoxq+A/RoPPORQ3m8Xb3eLKbAqXStB/Z6E6vDIFGX/GUWyDQOSGuR33Tb6dU4bD/EF4IHi9AnBxer2aK/m/2c6jXo7b22NSfo/ebsFTgiJ1Kl7Il1Tv2h53VsEO8BEQygtl44s2fp0que4SRQnbBJHT2zudZ8WZUdubPMm4gfm6VvMLSXCWgbAjkg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gMNa1wbn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gMNa1wbn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRZcv1cmqz300V
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 00:23:25 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216728b1836so186444765ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 05:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736169803; x=1736774603; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
        b=gMNa1wbnHXxmjOZDc2/neafiqoX0UxpK+7hlEgmQPoBPrxS4YNTCndlb7kLWCfqyRN
         AOMVTPUnlaRdPcqitu3uFJ0i7DShahG8Dbo1/rYVyleV2bA4BX/UFsFB/YAwLgw0DHLt
         QCQJmTsCzL7F7ID3pcy1RO5v5KwE/pvCTW00pZPTpudvwUb9htQMBwvS1FWAVEBb046T
         fGMMGdauYZTS7ivg08c37KJuI6U8IWhSJvKgELXFz2JPjkjxHfTaaGaA1x4gPwM68XRl
         82lG6Wid+ccMKbKG6zTp7Rn2snpVqg4ZOmxaQjeZMhJ4BIL2ZBNkrYn9p64HDjs9DvCJ
         STKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736169803; x=1736774603;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=af8Jbj+kqP+p1W8uyVyt9V0YBDVs6Wu8XxDGXWv1rDo=;
        b=t30rwi5+uwllbOdLxXn/XfLOd62yE4sjcX9tapMEo5P0AIX144Z8XQljy7ayfjhvyP
         2042myobCaiHwkkveM90Z3X8cvstgZAEbuy8pMzFfAuzchjsbClB4LOxPotEdaujEkLx
         YjbgQL1TVdikwX+lDyZtc9iFKhyeDsU6a7D2CsqK81vNtbui8u44L/IcqG0tkZmak6WU
         vnGU88wZTq9UZ84YJ/ea9H7j4PtIk683WXEFY3LErAuPyHi9X7180opD73dnMW3qr5dE
         jbhugC0QKuHffWPoK0wvY+8nGWDTWod/RSKPBeg9XgWvXQzJZqNZyMbDLgSmxkhl+bbh
         OGWQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5jynjERrfk0J3i0spu263sUOPPpooQLB4WlseNakmVC7UqXDT/tPTd6vOILo16+M9Wt2hMeVyuOfsxVQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNazDLhKVMD0rBr2TKqv2JefCYovX55wkS0tpy22X3B6pozq/B
	w6b+ldnGojE78yWsfnMMZhfVVUgkPvryqExIOSanLdSHfy3mC+lhXpTrv31J1mA=
X-Gm-Gg: ASbGncvhqhCcwOG9V3Gta3G9yxey9w8hUSI3gj/CLRQz/b9Wl6gxxNXn5ojUgJ9Ep8n
	nDFOURTGUEXAIw49MaWHaQlFGEeTKP+nba7hqQHDbcVnoqACWRsB5apfuWCaQ/qgOkJEVxWRkl2
	Va/ng2uYCanWyqAF9ZtStfZhTA7hiK5L9Mgz8+VD8aqqjupv97hgJoRHgDAXMJpul4dqj5IuTXw
	Yo/l7Ym+Ong8VwAPmMXKmlvkfWF8d40szeH6sLcHsGoNrcH7NI59HqeuOSUUgSZ4qIhNPkZXPTZ
	+AXGIFLcWakvf4izJuD4u0GjRWpb5wSjINTjrmT+MLTNK/tWujiD
X-Google-Smtp-Source: AGHT+IE/ZrXmD5LZyqp5+IF7XucHWltqSucrfnZMLD6UEt/qaBj6OXgwMq9je0lWMbXPRWlni+TKWA==
X-Received: by 2002:a05:6a20:2d07:b0:1e1:b44f:cff1 with SMTP id adf61e73a8af0-1e5e07f9c06mr81291446637.33.1736169803320;
        Mon, 06 Jan 2025 05:23:23 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:d64:296c:a8f3:f81e:f88b? ([2409:8a28:f44:d64:296c:a8f3:f81e:f88b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c149sm31371677b3a.191.2025.01.06.05.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 05:23:22 -0800 (PST)
Message-ID: <bce4bb4e-459a-44c8-945b-8889149377fd@bytedance.com>
Date: Mon, 6 Jan 2025 21:23:10 +0800
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
Subject: Re: [PATCH v4 07/15] mm: pgtable: introduce pagetable_dtor()
Content-Language: en-US
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <8ada95453180c71b7fca92b9a9f11fa0f92d45a6.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uxwiEhYHDqdTh3@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <e1de887c-6193-48ee-a9b3-04c8a0cdda45@bytedance.com>
 <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3vOZ18jcCpHIcPD@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/6 20:36, Alexander Gordeev wrote:
> On Mon, Jan 06, 2025 at 06:55:58PM +0800, Qi Zheng wrote:
>>>> +static inline void pagetable_dtor(struct ptdesc *ptdesc)
>>>> +{
>>>> +	struct folio *folio = ptdesc_folio(ptdesc);
>>>> +
>>>> +	ptlock_free(ptdesc);
>>>> +	__folio_clear_pgtable(folio);
>>>> +	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>> +}
>>>> +
>>>
>>> If I am not mistaken, it is just pagetable_pte_dtor() rename.
>>> What is the point in moving the code around?
>>
>> No, this is to unify pagetable_p*_dtor() into pagetable_dtor(), so
>> that we can move pagetable_dtor() to __tlb_remove_table(), and then
>> ptlock and PTE page can be freed together through RCU, which is
>> also the main purpose of this patch series.
> 
> I am only talking about this patch. pagetable_dtor() code above is
> the same pagetable_pte_dtor() below - it is only the function name
> that changed. So why to move the function body? Anyway, that is

Ah, I just don't want to put pagetable_dtor() in between
pagetable_pte_ctor() and ___pte_offset_map(), so I moved it above
pagetable_pte_ctor(). No other special reason. ;)

Thanks!

> just a nit.
> 
>> Thanks!
> 
>>>> -static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
>>>> -{
>>>> -	struct folio *folio = ptdesc_folio(ptdesc);
>>>> -
>>>> -	ptlock_free(ptdesc);
>>>> -	__folio_clear_pgtable(folio);
>>>> -	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
>>>> -}
> 
> Thank you!

