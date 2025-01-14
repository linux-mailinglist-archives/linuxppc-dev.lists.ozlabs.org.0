Return-Path: <linuxppc-dev+bounces-5209-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F72A0FEC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2025 03:27:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YXCh61tmxz3dBW;
	Tue, 14 Jan 2025 13:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736821638;
	cv=none; b=hqE+xH5HoGOMWiHgwMrUJeVODGlAnHATrzUXkubO45OBAG+v/2JNRAapv1bMUjj/eu1DWlZYapZYmL2w8JyoeGnBVATNwtZp8ye4k80uvfja7HXVRUWm4xZ826RiEFe9whWBlgaipYb29t/OR7HHd9dxoCtE63m4JQ4udjDlzkfaDbfah5UOsw6YmAqsFe6nfJ1fg5Mz2cAZaGyaqMhZ0hzZdg9EoB3SJDx5Twc0gmmhT5iWkub7dJW4MUVhSWJjGI8XBIIrpBfzYYLPE8qon7dpQu5eyoGi+hiazGn8yI05agQ6FRT1I87FqKQfgRhS+WPf8lktj44uXxZcvnR0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736821638; c=relaxed/relaxed;
	bh=Q3uCzTDF/NUXWi9pKun3Q1ZeVpbVlQmIUTgvJ2reRXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m2JyWbApqoE03Cr7K6xrh46rv9HtRNJpxYTzxaAKqq9MFG429pwDfSyn0pAvQphpnHJwILqBs+sxI7w2i1XAjhOGp9dkHRXFKUWY28yfOICbkarXl12fZFtIFy5WI8Ou/6LjdV699LJl578tkLwZaryYQ8E/0uDGLjI/gv8RS7T3eeIl0ZjmNpV4yynUXCEts+jkREbBgDDRa01qmyU88KjtI/GpphpWs72QPujZ0sNVC9SvLhaCnxBv98B1kGgOyxaFOWzOHDbhxeAGDugLW/MEKocBB5FBpj67g6q7GmIMazwhnuIfDIycA18w/U6LJDUxKa7MihiB8DkObnEfAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VGmqZ6Yd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=VGmqZ6Yd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YXCh42fH9z3dBG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 13:27:15 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21649a7bcdcso84523285ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 18:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736821632; x=1737426432; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3uCzTDF/NUXWi9pKun3Q1ZeVpbVlQmIUTgvJ2reRXQ=;
        b=VGmqZ6Ydpp7yQ2K/OHh71H18SvDne93Y6KURgIPHCvTaUSvaETL6xTGuPeG71cK6h3
         wdYD54bYitWhXZ2vfnxFTZtFeNgi06iU2Z2UqqzzqHcp1HYSKHtE7T3eaWbMS5xMg5RD
         SH7KGRSblEkvtUdSQJJkrxOdSKJ4lgSBcJhnHuMVMK2a/rjSGr2osXTMxwhREDB37tg4
         Q2axAoAQkrgvMf2o7pXeeBRdEzsbfe3vrpSdan/QzgYoKKX4oUTichNK1qp37gBt4AsR
         NbPCs+1vfZbkZ4ZB29xElYvXWdoCXJf3iiT0R1OmhMpyprekduL05PFtunCU7dbrHBz9
         Zu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736821632; x=1737426432;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3uCzTDF/NUXWi9pKun3Q1ZeVpbVlQmIUTgvJ2reRXQ=;
        b=HdlvxSe+16xqPoqKP9GqTMeg2uyDuYS2fTyH5AarZ1YA8MwQiQh+UyWj4mC1ruX/df
         muPxS1ZMzqhnPmeOrF3gJnfr0rekl6aGPOaCx6ALp35zjANjOH62jsaqryshsYextJPX
         DLWs/fT6Lk8WLW1jqmGp+N1ACNCzyqfBe5CDhDzNmvh2fJ3j30AXz2ul+MVD5zNxB3c4
         uhBR3430Dz2+opbgi5DH/wLLOE4qa8kjSY8xJV4CvhUHV+xUI6/5agBHbd4L+IQrUWQ5
         xLIrQWEBsvPd8UxYhJYbXxwiKHJZ7XwtcihkRfJNL1WzMpC4f4Azn/5xAI88sJnmQQHT
         DtGw==
X-Forwarded-Encrypted: i=1; AJvYcCUu1GccbKHck3sdzDtWX0pxKwf/lNBJ7v2WpdvlpbBJrx53fdF/NiiTQ5IE+C4QLciGrNOzttKdCKAOjn8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywv3OrvEbn5ocH797TszZWTjJZRv+m3tl03r5ZopTGomKFpooDW
	0LJ1feeAsVlmdAXjKY5POSt2QLW4e1fdsVnTkjvOsYzz/RqEqV4IGU9JsyVMd60=
X-Gm-Gg: ASbGncu5FGRK71wrb4J0ij5tN5Ze4MR/Ibho/HDCWBlzaRUVr1wWQy4Dokfl5HKQn0U
	97peM+/sfou4hYazyVXMcju6NbAG9/1PdeImfgi+oUPv1yiOMc/dCtZSHzy4jVoqUJ6MISOvgOZ
	dPeuRnWPL3qbJ5O+KJzFDoPMoQR6KhKSmSVoxv2BIvFt1cNPOifkF2Zz9BnGQUEOAdxUBi5Zj17
	L0uOWwDMFA+EFl9td1YM45jQH5h7V5b4IdPSNgODOAjzpm2V8y6gsen+yStiwoI4Z2HQZMEXcw+
	UbPO
X-Google-Smtp-Source: AGHT+IFszANM2ttg3bHXqwu4kokOxCLHcRwKXlC7FRtBmzrGdqYoySfArdJur+xTrJx3xY86w59zAA==
X-Received: by 2002:a05:6a20:7f8a:b0:1db:de38:294b with SMTP id adf61e73a8af0-1e88d2f6820mr38362107637.38.1736821632027;
        Mon, 13 Jan 2025 18:27:12 -0800 (PST)
Received: from [10.84.148.23] ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4056a5e8sm6847007b3a.53.2025.01.13.18.26.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jan 2025 18:27:11 -0800 (PST)
Message-ID: <a017d072-943f-4008-bb1d-7be438804a44@bytedance.com>
Date: Tue, 14 Jan 2025 10:26:54 +0800
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
Subject: Re: [PATCH v5 05/17] arm64: pgtable: use mmu gather to free p4d level
 page table
To: Will Deacon <will@kernel.org>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, kevin.brodsky@arm.com,
 alex@ghiti.fr, andreas@gaisler.com, palmer@dabbelt.com, tglx@linutronix.de,
 david@redhat.com, jannh@google.com, hughd@google.com, yuzhao@google.com,
 willy@infradead.org, muchun.song@linux.dev, vbabka@kernel.org,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, rientjes@google.com,
 vishal.moola@gmail.com, arnd@arndb.de, aneesh.kumar@kernel.org,
 npiggin@gmail.com, dave.hansen@linux.intel.com, rppt@kernel.org,
 ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <3fd48525397b34a64f7c0eb76746da30814dc941.1736317725.git.zhengqi.arch@bytedance.com>
 <20250113162600.GA14101@willie-the-truck>
Content-Language: en-US
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250113162600.GA14101@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Will,

On 2025/1/14 00:26, Will Deacon wrote:
> On Wed, Jan 08, 2025 at 02:57:21PM +0800, Qi Zheng wrote:
>> Like other levels of page tables, also use mmu gather mechanism to free
>> p4d level page table.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> Cc: linux-arm-kernel@lists.infradead.org
>> ---
>>   arch/arm64/include/asm/pgalloc.h |  1 -
>>   arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
>> index 2965f5a7e39e3..1b4509d3382c6 100644
>> --- a/arch/arm64/include/asm/pgalloc.h
>> +++ b/arch/arm64/include/asm/pgalloc.h
>> @@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
>>   	__pgd_populate(pgdp, __pa(p4dp), pgdval);
>>   }
>>   
>> -#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
>>   #else
>>   static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
>>   {
>> diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
>> index a947c6e784ed2..445282cde9afb 100644
>> --- a/arch/arm64/include/asm/tlb.h
>> +++ b/arch/arm64/include/asm/tlb.h
>> @@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
>>   }
>>   #endif
>>   
>> +#if CONFIG_PGTABLE_LEVELS > 4
>> +static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
>> +				  unsigned long addr)
>> +{
>> +	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
>> +
>> +	if (!pgtable_l5_enabled())
>> +		return;
>> +
>> +	pagetable_p4d_dtor(ptdesc);
>> +	tlb_remove_ptdesc(tlb, ptdesc);
>> +}
> 
> Should we update p4d_free() to call the destructor, too? It looks like
> it just does free_page() atm.

The patch #3 introduces the generic p4d_free() and lets arm64 to use it.
The patch #4 adds the destructor to generic p4d_free(). So IIUC, there
is no problem here.

Thanks!

> 
> Will

