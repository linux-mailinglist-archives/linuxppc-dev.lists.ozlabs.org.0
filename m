Return-Path: <linuxppc-dev+bounces-4697-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C1EA023BF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 12:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRWVQ54pTz2xMQ;
	Mon,  6 Jan 2025 22:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736161358;
	cv=none; b=PLS/onTWL/zoqnsR3flY8tsDWFwSRlCaOx/ZJzv7MTM8Iz3xxIjXXmlSevtNxcUUllziSz+qubrdi6T6HPVX7idDGusZqCNE8p3DARgu6GBE15PmlH2rKRnE6NPlW1/vxT0WLrtd2noPOjllmKbnvngspUCDJlKgPZxvtYLTi1mC1f8/LFB4/fT0/nniA/FybUvzzXHEXoA3SfFnx719OQjlL1J4A/HQJEBXxcSNbeTMFAuJOyy70Qx7YS2fIUUJS6HXnrDvUZStdQYx4kfjcZ/rODuyPfeY3B0xrA3i70rcfUqSd73k3D+qS85dDKG9uAHFudOVlRuirp+KJSl8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736161358; c=relaxed/relaxed;
	bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4Gft51iB7Na5U/1LzsL787PT8XBl1dkm/Fhh9EdF5g7d/jLgo/X7o2nnrEO0aE2MnID5X3K1xLkeyT+kQ4hN4RIgwBJiwgXvyR8KlxBBRasK5wQLcbQ8gmfVany+9n1n1Gbzuj9VwAvQ+/sqalXgq3vYN+Tp6zpqZu7d6YlFZAU4zC7rgtkXVj6X6tlSncD+nhMyuRuLNCHuRkGZ/O8Mhix3nQ403lY6LWvONGKDeMAbXkrT6l5uivDr6HGw9z1+cUFc279LaJMFjOlaaXzboXQK+bi9DtrTlMZgvHUe05At+yRer7/aBzbnoTYPqHvozO0fGYKYJUR8J84azqpbA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DcBEOlSl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DcBEOlSl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRWVP4Hvpz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 22:02:36 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216426b0865so198439795ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 03:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736161353; x=1736766153; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=DcBEOlSlAUz9Ec20skd00yTzUeA/s1AUC7cObQ0JBCpyTXsoLgyNLNK0pMpbs7lsLE
         ZpvQPY92LfyTQPb7WWPk9load3bWEinJVEpMeHjWOtG+I5AMnGuzFthKbtr+0IKC7sXd
         Yt8gnMdNe/lfMTkx8ar7iHQvdGPkFpXrENYPQsB+ZR74b2G23dMGlBi9t6C1/qR/0Z79
         kav5IfljcrOP4FFMDEFlrm43ymXPxO7R/YrL2DzNMBfuYFfhzYz80/Z0lJ7Imf+ch4Oy
         lN9ty1b5FE6yIM2axgEdagtoiuL8QT9NxcIpFtLp1PcNMDiwGoS3ZYwJMKvt2sdq1fEy
         ni3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736161353; x=1736766153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PtS7kKDFbbWBE6dlgb91yolih02/BD7li/VWMu2pf+Q=;
        b=kQhzxA7+9cDyFWL8ie29JTwDTr2+5qFv5hd60uhTsjsc21kCG8mm7gU17vsXI2yDIw
         l95xp6oS73DqV0KhJyui6fmXgIQu2yh1S7Tghx3WKxnuWFyGqMNOTmNTLQNO5Qf7lS6W
         DkGIaGWKvBB4IWpdh23XDjMWi7x1ZIMzCs44Jh7jej6L14D+Z1Lguf+oXlXAHCQfwNYt
         YP2NUBEFzvQyI9vSJPP0FTuO92K3DUuTjFCGeDLmH/A0H3LondIpx08GPPB+NyFYv0mA
         nsS9dadDk6JW3ex2vW4ljoO4zOTrafVOXAwqJcbfypB+hdQ1cAP10X/0xchY09XCPpXa
         jawA==
X-Forwarded-Encrypted: i=1; AJvYcCVrYTgkhcNhbe563/Qr58w2n9S8fmkZoEWvVl9xbmmLlaNUuevYl1J+4DkBDzLoIr1hQwYlEIC4A84GtkY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyyTOMg70utJP85dCaVhdwZ+7OKnOS8a/mnLDH/vRbu3Z3YqhYm
	dWRBi9yOGw0cwN5GRvMu5qJIy8DMjUxo5nxaOk7IOPYBE+ib592nvmDtF3BiWgA=
X-Gm-Gg: ASbGnct/Lqz1n1dAsJvwobgfzbrcC6GVukBvIvp4g+Shmq4TcDFObMwc9C+ljAyQRwP
	k/5U5I4wqjMuHlj9RNoOzZFxUA3wuoAL4UNw08aYO3fUi8M21M/R5rVkmpG1F0EKrJzYsdnxAiK
	2sJbcnegWwFWPpqdFfSlWWqiwTwRfQQb9r1CmZB459iNTmaFADrcR5kqlVZQbdzYq2Q845Gd0cS
	7vl0j+ZjvpApBcg0D8cazI2qdcFaPXv+QbSvcQfz49JC5yNdWNmiQiHPELLWRgEfvdNGGs/Ps8W
	EjzLHA==
X-Google-Smtp-Source: AGHT+IFCeOw2arXEHpOUWAGun1CKXf9/XTpPQ1dFbIMLlKInW35U2LjXZ6DtTEzjdru/7w1/tbEHpw==
X-Received: by 2002:a05:6a00:4644:b0:725:b347:c3cc with SMTP id d2e1a72fcca58-72abdeb9c33mr83929136b3a.23.1736161353534;
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816464sm31123318b3a.40.2025.01.06.03.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 03:02:33 -0800 (PST)
Message-ID: <2d16f0fe-9c7f-4229-b7b5-ffa3ab1b1143@bytedance.com>
Date: Mon, 6 Jan 2025 19:02:17 +0800
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
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of PxD
 to __tlb_remove_table()
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
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
 <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/6 18:36, Alexander Gordeev wrote:
> On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
>> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
>> PMD|PUD|P4D to __tlb_remove_table().
> 
> The above and Subject are still incorrect: pagetable_dtor() is
> called from pagetable_dtor_free(), not from __tlb_remove_table().

Hmm, __tlb_remove_table() calls pagetable_dtor_free(), so moving to
pagetable_dtor_free() means moving to __tlb_remove_table(). Right?
And the main purpose of this patch is also to move pagetable_dtor()
to __tlb_remove_table(). So I think this description makes sense?

> 
> ...
>> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
>> index 569de24d33761..c73b89811a264 100644
>> --- a/arch/s390/mm/pgalloc.c
>> +++ b/arch/s390/mm/pgalloc.c
>> @@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>>   	return table;
>>   }
>>   
>> -static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
>> +static void pagetable_dtor_free(struct ptdesc *ptdesc)
>>   {
>>   	pagetable_dtor(ptdesc);
>>   	pagetable_free(ptdesc);
>> @@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>>   
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }
>>   
>>   void __tlb_remove_table(void *table)
>>   {
>>   	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>> -	struct page *page = ptdesc_page(ptdesc);
>>   
>> -	if (compound_order(page) == CRST_ALLOC_ORDER) {
>> -		/* pmd, pud, or p4d */
>> -		pagetable_free(ptdesc);
>> -		return;
>> -	}
>> -	pagetable_pte_dtor_free(ptdesc);
>> +	pagetable_dtor_free(ptdesc);
>>   }

