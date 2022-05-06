Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD41A51CF29
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 05:02:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvb2W4YJPz3cDx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 13:02:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kvb253NTXz3bd9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 13:01:44 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=30; SR=0;
 TI=SMTPD_---0VCQ-60L_1651806089; 
Received: from 30.32.96.193(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCQ-60L_1651806089) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 06 May 2022 11:01:31 +0800
Message-ID: <6c8a5b23-e470-63ca-cc82-f8b5ff1bafaf@linux.alibaba.com>
Date: Fri, 6 May 2022 11:02:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/3] mm: change huge_ptep_clear_flush() to return the
 original pte
To: Mike Kravetz <mike.kravetz@oracle.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <a9038435d408cd7b9defe143537de668dfdf03be.1651216964.git.baolin.wang@linux.alibaba.com>
 <495c4ebe-a5b4-afb6-4cb0-956c1b18d0cc@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <495c4ebe-a5b4-afb6-4cb0-956c1b18d0cc@oracle.com>
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de,
 borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, svens@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/6/2022 7:15 AM, Mike Kravetz wrote:
> On 4/29/22 01:14, Baolin Wang wrote:
>> It is incorrect to use ptep_clear_flush() to nuke a hugetlb page
>> table when unmapping or migrating a hugetlb page, and will change
>> to use huge_ptep_clear_flush() instead in the following patches.
>>
>> So this is a preparation patch, which changes the huge_ptep_clear_flush()
>> to return the original pte to help to nuke a hugetlb page table.
>>
>> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
>> ---
>>   arch/arm64/include/asm/hugetlb.h   |  4 ++--
>>   arch/arm64/mm/hugetlbpage.c        | 12 +++++-------
>>   arch/ia64/include/asm/hugetlb.h    |  4 ++--
>>   arch/mips/include/asm/hugetlb.h    |  9 ++++++---
>>   arch/parisc/include/asm/hugetlb.h  |  4 ++--
>>   arch/powerpc/include/asm/hugetlb.h |  9 ++++++---
>>   arch/s390/include/asm/hugetlb.h    |  6 +++---
>>   arch/sh/include/asm/hugetlb.h      |  4 ++--
>>   arch/sparc/include/asm/hugetlb.h   |  4 ++--
>>   include/asm-generic/hugetlb.h      |  4 ++--
>>   10 files changed, 32 insertions(+), 28 deletions(-)
> 
> The above changes look straight forward.
> Happy that you Cc'ed impacted arch maintainers so they can at least
> have a look.
> 
> The only user of huge_ptep_clear_flush() today is hugetlb_cow/wp() in
> mm/hugetlb.c.  Any reason why you did not change that code?  At least

Cause we did not use the return value of huge_ptep_clear_flush() in 
mm/hugetlb.c.

> cast the return of huge_ptep_clear_flush() to void with a comment?

Sure. Will add an explicit casting in next version.

> Not absolutely necessary.
> 
> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>

Thanks.
