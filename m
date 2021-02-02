Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C5130D0B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 02:23:36 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVkTd16sjzDwm7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:23:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com;
 envelope-from=dingtianhong@huawei.com; receiver=<UNKNOWN>)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVNN86JZ1zDr4m
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 22:47:23 +1100 (AEDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DVNKq0sXyzMSry;
 Tue,  2 Feb 2021 19:45:35 +0800 (CST)
Received: from [10.174.177.80] (10.174.177.80) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 19:47:04 +0800
Subject: Re: [PATCH v12 01/14] ARM: mm: add missing pud_page define to 2-level
 page tables
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>, Nicholas Piggin
 <npiggin@gmail.com>
References: <20210202110515.3575274-1-npiggin@gmail.com>
 <20210202110515.3575274-2-npiggin@gmail.com>
 <20210202111319.GL1463@shell.armlinux.org.uk>
From: Ding Tianhong <dingtianhong@huawei.com>
Message-ID: <d1f661f2-f473-1dd8-94cc-fe76714249b5@huawei.com>
Date: Tue, 2 Feb 2021 19:47:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20210202111319.GL1463@shell.armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.80]
X-CFilter-Loop: Reflected
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021/2/2 19:13, Russell King - ARM Linux admin wrote:
> On Tue, Feb 02, 2021 at 09:05:02PM +1000, Nicholas Piggin wrote:
>> diff --git a/arch/arm/include/asm/pgtable.h b/arch/arm/include/asm/pgtable.h
>> index c02f24400369..d63a5bb6bd0c 100644
>> --- a/arch/arm/include/asm/pgtable.h
>> +++ b/arch/arm/include/asm/pgtable.h
>> @@ -166,6 +166,9 @@ extern struct page *empty_zero_page;
>>  
>>  extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
>>  
>> +#define pud_page(pud)		pmd_page(__pmd(pud_val(pud)))
>> +#define pud_write(pud)		pmd_write(__pmd(pud_val(pud)))
> 
> As there is no PUD, does it really make sense to return a valid
> struct page (which will be the PTE page) for pud_page(), which is
> several tables above?
> 
--- a/arch/arm/include/asm/pgtable-2level.h
+++ b/arch/arm/include/asm/pgtable-2level.h

+static inline int pud_none(pud_t pud)
+{
+          return 0;
+}

I think it could be fix like this.

Ding
