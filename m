Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC0751E30E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 03:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kw90l0LHFz3cFS
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 11:32:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kw90K6jFsz3brj
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 11:32:16 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R461e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=30; SR=0;
 TI=SMTPD_---0VCUCndB_1651887123; 
Received: from 30.236.9.83(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCUCndB_1651887123) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 07 May 2022 09:32:05 +0800
Message-ID: <971cfb54-f5a6-921c-b0c5-195a5daed0fb@linux.alibaba.com>
Date: Sat, 7 May 2022 09:32:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 unmapping
To: Mike Kravetz <mike.kravetz@oracle.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <c91e04ebb792ef7b72966edea8bd6fa2dfa5bfa7.1651216964.git.baolin.wang@linux.alibaba.com>
 <f64f0d4f-f0fc-f07c-3c17-96f124da21e4@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <f64f0d4f-f0fc-f07c-3c17-96f124da21e4@oracle.com>
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



On 5/7/2022 2:55 AM, Mike Kravetz wrote:
> On 4/29/22 01:14, Baolin Wang wrote:
>> On some architectures (like ARM64), it can support CONT-PTE/PMD size
>> hugetlb, which means it can support not only PMD/PUD size hugetlb:
>> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
>> size specified.
>>
>> When unmapping a hugetlb page, we will get the relevant page table
>> entry by huge_pte_offset() only once to nuke it. This is correct
>> for PMD or PUD size hugetlb, since they always contain only one
>> pmd entry or pud entry in the page table.
>>
>> However this is incorrect for CONT-PTE and CONT-PMD size hugetlb,
>> since they can contain several continuous pte or pmd entry with
>> same page table attributes, so we will nuke only one pte or pmd
>> entry for this CONT-PTE/PMD size hugetlb page.
>>
>> And now we only use try_to_unmap() to unmap a poisoned hugetlb page,
> 
> Since try_to_unmap can be called for non-hugetlb pages, perhaps the following
> is more accurate?
> 
> try_to_unmap is only passed a hugetlb page in the case where the
> hugetlb page is poisoned.

Yes, will update in next version.

> It does concern me that this assumption is built into the code as
> pointed out in your discussion with Gerald.  Should we perhaps add
> a VM_BUG_ON() to make sure the passed huge page is poisoned?  This
> would be in the same 'if block' where we call
> adjust_range_if_pmd_sharing_possible.
Good point. Will do in next version. Thanks.
