Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F54862D37
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 02:59:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45jP914lhYzDqQx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2019 10:59:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="00su9rKH"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45jP754qFKzDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2019 10:57:34 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id m4so8541647pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 17:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sAvbwOTyF4/BGaBDFmuxiuwIj3IqOzkFvdnCHCpoQkc=;
 b=00su9rKH22W8sHGxpptlhrbYGhLYR9gn9CojxRQe/LHWpiPXS+xaISOZe3V6mKDgIt
 qxgUOJN1XgoNQdUQkWQI2smvmfQPMmjscTm7YDCvBFrPDBds9p2WpOYqq67FTKyMF6SK
 BglZ7L1fDlDsNdP6cbx4E8KtSGrZhNVrQj8/v1icETQq/6S6C9ANd9EKmQwi4HfyDnuj
 SRAhWuY9GTvoHSQxUkKA49991uGZQUKYtzLGsBLWUrAexeFaD5FF9qSHcEsRsDvc1D2e
 Kk7Oe30KQele1ea7hlohvmbXBIJNuTTDoiGPBvgYDaEKC5SuTTBYCTobCpetVlnbgrH5
 bW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sAvbwOTyF4/BGaBDFmuxiuwIj3IqOzkFvdnCHCpoQkc=;
 b=mn7pryt4LkMj0S/0tKl8bfOm5KVLB7rzenpDgVqQ9YwFyKLvmG1/Ng8VIjbFU0wKUp
 7pZzPkShKBGwT45OHDMhlcLOxot5oyUrxG+UPeqbpbH/Q2K7gKswndvXpvdd2tJy8SkR
 mPYif03P56kky7HYFo5QmQrrksNjeF/TUkUk1dvlUqL37yV9wCRtEF5cV55Byzm+0YKt
 IHPzW1sd1sHvW469zOwN+4btvuLofz/8x4jLR1VkAaehxL8Hs9Og6HWWaqS6R02btZ7A
 UoYGzD6Aa74dAKYVT5o7hFKPwt9VuDmJcRZq72rKFugujgqBvmqyH0YAOULPTyaPDIyI
 x+CA==
X-Gm-Message-State: APjAAAWiGSA0WzjPJcYirkqPZne2ieULUDc0cq61rHd5lyRrvr+I8SJJ
 Jon/xcuCM5Ywg60KdAIKF7MBcg==
X-Google-Smtp-Source: APXvYqzocBs2lIqqRsNf5E5Owr0e7O/ZVt8amc2EW12PJ68ZgjoPilsLZX8mbbu/aGNwDk4RyC0lGQ==
X-Received: by 2002:a63:ee0c:: with SMTP id e12mr21153697pgi.184.1562633851134; 
 Mon, 08 Jul 2019 17:57:31 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y11sm26138446pfb.119.2019.07.08.17.57.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jul 2019 17:57:30 -0700 (PDT)
Subject: Re: [PATCH kernel v3 3/3] powerpc/powernv/ioda2: Create bigger
 default window with 64k IOMMU pages
To: alistair@popple.id.au
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <20190530070355.121802-4-aik@ozlabs.ru> <2908012.2rHUNcR828@townsend>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <8f0b1403-89b7-e16d-dadb-8ae92ee60620@ozlabs.ru>
Date: Tue, 9 Jul 2019 10:57:27 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <2908012.2rHUNcR828@townsend>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/07/2019 17:01, alistair@popple.id.au wrote:
> Hi Alexey,
> 
> Couple of comment/questions below.
> 
>> -    /*
>> -     * Reserve page 0 so it will not be used for any mappings.
>> -     * This avoids buggy drivers that consider page 0 to be invalid
>> -     * to crash the machine or even lose data.
>> -     */
>> -    if (tbl->it_offset == 0)
>> -        set_bit(0, tbl->it_map);
>> +    tbl->it_reserved_start = res_start;
>> +    tbl->it_reserved_end = res_end;
>> +    iommu_table_reserve_pages(tbl);
> 
> Personally I think it would be cleaner to set tbl->it_reserved_start/end in
> iommu_table_reserve_pages() rather than separating the setup like this.


Yeah I suppose...


> 
>>
>>      /* We only split the IOMMU table if we have 1GB or more of space */
>>      if ((tbl->it_size << tbl->it_page_shift) >= (1UL * 1024 * 1024 * 
>> 1024))
>> @@ -727,12 +755,7 @@ static void iommu_table_free(struct kref *kref)
>>          return;
>>      }
>>
>> -    /*
>> -     * In case we have reserved the first bit, we should not emit
>> -     * the warning below.
>> -     */
>> -    if (tbl->it_offset == 0)
>> -        clear_bit(0, tbl->it_map);
>> +    iommu_table_release_pages(tbl);
>>
>>      /* verify that table contains no entries */
>>      if (!bitmap_empty(tbl->it_map, tbl->it_size))
>> @@ -1037,8 +1060,7 @@ int iommu_take_ownership(struct iommu_table *tbl)
>>      for (i = 0; i < tbl->nr_pools; i++)
>>          spin_lock(&tbl->pools[i].lock);
>>
>> -    if (tbl->it_offset == 0)
>> -        clear_bit(0, tbl->it_map);
>> +    iommu_table_reserve_pages(tbl);
>>
>>      if (!bitmap_empty(tbl->it_map, tbl->it_size)) {
>>          pr_err("iommu_tce: it_map is not empty");
>> @@ -1068,9 +1090,7 @@ void iommu_release_ownership(struct iommu_table 
>> *tbl)
>>
>>      memset(tbl->it_map, 0, sz);
>>
>> -    /* Restore bit#0 set by iommu_init_table() */
>> -    if (tbl->it_offset == 0)
>> -        set_bit(0, tbl->it_map);
>> +    iommu_table_release_pages(tbl);
> 
> Are the above two changes correct? 


No they are not, this is a bug. Thanks for spotting, repost is coming.



> From the perspective of code 
> behaviour this
> seems to swap the set/clear_bit() calls. For example above you are 
> replacing
> set_bit(0, tbl->it_map) with a call to iommu_table_release_pages() which 
> does
> clear_bit(0, tbl->it_map) instead.
> 
> - Alistair
> 
>>      for (i = 0; i < tbl->nr_pools; i++)
>>          spin_unlock(&tbl->pools[i].lock);
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c
>> b/arch/powerpc/platforms/powernv/pci-ioda.c index
>> 126602b4e399..ce2efdb3900d 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -2422,6 +2422,7 @@ static long 
>> pnv_pci_ioda2_setup_default_config(struct
>> pnv_ioda_pe *pe) {
>>      struct iommu_table *tbl = NULL;
>>      long rc;
>> +    unsigned long res_start, res_end;
>>
>>      /*
>>       * crashkernel= specifies the kdump kernel's maximum memory at
>> @@ -2435,19 +2436,46 @@ static long
>> pnv_pci_ioda2_setup_default_config(struct pnv_ioda_pe *pe) * DMA 
>> window can
>> be larger than available memory, which will
>>       * cause errors later.
>>       */
>> -    const u64 window_size = min((u64)pe->table_group.tce32_size, 
>> max_memory);
>> +    const u64 maxblock = 1UL << (PAGE_SHIFT + MAX_ORDER - 1);
>>
>> -    rc = pnv_pci_ioda2_create_table(&pe->table_group, 0,
>> -            IOMMU_PAGE_SHIFT_4K,
>> -            window_size,
>> -            POWERNV_IOMMU_DEFAULT_LEVELS, false, &tbl);
>> +    /*
>> +     * We create the default window as big as we can. The constraint is
>> +     * the max order of allocation possible. The TCE tableis likely to
>> +     * end up being multilevel and with on-demand allocation in place,
>> +     * the initial use is not going to be huge as the default window 
>> aims
>> +     * to support cripplied devices (i.e. not fully 64bit DMAble) only.
>> +     */
>> +    /* iommu_table::it_map uses 1 bit per IOMMU page, hence 8 */
>> +    const u64 window_size = min((maxblock * 8) << PAGE_SHIFT, 
>> max_memory);
>> +    /* Each TCE level cannot exceed maxblock so go multilevel if 
>> needed */
>> +    unsigned long tces_order = ilog2(window_size >> PAGE_SHIFT);
>> +    unsigned long tcelevel_order = ilog2(maxblock >> 3);
>> +    unsigned int levels = tces_order / tcelevel_order;
>> +
>> +    if (tces_order % tcelevel_order)
>> +        levels += 1;
>> +    /*
>> +     * We try to stick to default levels (which is >1 at the moment) in
>> +     * order to save memory by relying on on-demain TCE level 
>> allocation.
>> +     */
>> +    levels = max_t(unsigned int, levels, POWERNV_IOMMU_DEFAULT_LEVELS);
>> +
>> +    rc = pnv_pci_ioda2_create_table(&pe->table_group, 0, PAGE_SHIFT,
>> +            window_size, levels, false, &tbl);
>>      if (rc) {
>>          pe_err(pe, "Failed to create 32-bit TCE table, err %ld",
>>                  rc);
>>          return rc;
>>      }
>>
>> -    iommu_init_table(tbl, pe->phb->hose->node);
>> +    /* We use top part of 32bit space for MMIO so exclude it from DMA */
>> +    res_start = 0;
>> +    res_end = 0;
>> +    if (window_size > pe->phb->ioda.m32_pci_base) {
>> +        res_start = pe->phb->ioda.m32_pci_base >> tbl->it_page_shift;
>> +        res_end = min(window_size, SZ_4G) >> tbl->it_page_shift;
>> +    }
>> +    iommu_init_table_res(tbl, pe->phb->hose->node, res_start, res_end);
>>
>>      rc = pnv_pci_ioda2_set_window(&pe->table_group, 0, tbl);
>>      if (rc) {
> 

-- 
Alexey
