Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7EAD520CD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 06:26:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky4jw4Nqtz3brb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:26:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky4jS3plxz3bfH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 14:26:02 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R271e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04357;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VCp29EM_1652156751; 
Received: from 30.15.214.13(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCp29EM_1652156751) by smtp.aliyun-inc.com(127.0.0.1);
 Tue, 10 May 2022 12:25:53 +0800
Message-ID: <0db300f4-8a91-b330-5c6f-bbc63cf2f151@linux.alibaba.com>
Date: Tue, 10 May 2022 12:26:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 0/3] Fix CONT-PTE/PMD size hugetlb issue when unmapping
 or migrating
To: Andrew Morton <akpm@linux-foundation.org>
References: <cover.1652147571.git.baolin.wang@linux.alibaba.com>
 <20220509210404.6a43aff15d0d6b3af0741001@linux-foundation.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20220509210404.6a43aff15d0d6b3af0741001@linux-foundation.org>
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
 linux-mips@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, will@kernel.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, gor@linux.ibm.com, deller@gmx.de,
 ysato@users.osdn.me, catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 arnd@arndb.de, hca@linux.ibm.com, songmuchun@bytedance.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 svens@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/10/2022 12:04 PM, Andrew Morton wrote:
> On Tue, 10 May 2022 11:45:57 +0800 Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
> 
>> Hi,
>>
>> Now migrating a hugetlb page or unmapping a poisoned hugetlb page, we'll
>> use ptep_clear_flush() and set_pte_at() to nuke the page table entry
>> and remap it, and this is incorrect for CONT-PTE or CONT-PMD size hugetlb
>> page,
> 
> It would be helpful to describe why it's wrong.  Something like "should
> use huge_ptep_clear_flush() and huge_ptep_clear_flush() for this
> purpose"?

Sorry for the confusing description. I described the problem explicitly 
in each patch's commit message.

https://lore.kernel.org/all/ea5abf529f0997b5430961012bfda6166c1efc8c.1652147571.git.baolin.wang@linux.alibaba.com/
https://lore.kernel.org/all/730ea4b6d292f32fb10b7a4e87dad49b0eb30474.1652147571.git.baolin.wang@linux.alibaba.com/

> 
>> which will cause potential data consistent issue. This patch set
>> will change to use hugetlb related APIs to fix this issue, please find
>> details in each patch. Thanks.
> 
> Is a cc:stable needed here?  And are we able to identify a target for a
> Fixes: tag?

I think need a cc:stable tag, however I am not sure the target fixes 
tag, since we should trace back to the introduction of CONT-PTE/PMD 
hugetlb? 66b3923a1a0f ("arm64: hugetlb: add support for PTE contiguous bit")
