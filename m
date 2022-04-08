Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DACB64F8BF5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 04:42:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZMwN6jXTz3bp8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 12:42:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KZMvx5d0nz2xBf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 12:41:47 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23C5811FB;
 Thu,  7 Apr 2022 19:41:15 -0700 (PDT)
Received: from [192.168.0.8] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 51A463F718;
 Thu,  7 Apr 2022 19:41:12 -0700 (PDT)
Message-ID: <a84bdc2a-2656-0474-4a14-5532c29f9043@arm.com>
Date: Fri, 8 Apr 2022 08:11:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V4 0/7] mm/mmap: Drop arch_vm_get_page_prot() and
 arch_filter_pgprot()
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
References: <20220407103251.1209606-1-anshuman.khandual@arm.com>
 <20220407162024.7747ee14092d04082f13aa9d@linux-foundation.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220407162024.7747ee14092d04082f13aa9d@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/8/22 04:50, Andrew Morton wrote:
> On Thu,  7 Apr 2022 16:02:44 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> protection_map[] is an array based construct that translates given vm_flags
>> combination. This array contains page protection map, which is populated by
>> the platform via [__S000 .. __S111] and [__P000 .. __P111] exported macros.
>> Primary usage for protection_map[] is for vm_get_page_prot(), which is used
>> to determine page protection value for a given vm_flags. vm_get_page_prot()
>> implementation, could again call platform overrides arch_vm_get_page_prot()
>> and arch_filter_pgprot(). Some platforms override protection_map[] that was
>> originally built with __SXXX/__PXXX with different runtime values.
>>
>> Currently there are multiple layers of abstraction i.e __SXXX/__PXXX macros
>> , protection_map[], arch_vm_get_page_prot() and arch_filter_pgprot() built
>> between the platform and generic MM, finally defining vm_get_page_prot().
>>
>> Hence this series proposes to drop later two abstraction levels and instead
>> just move the responsibility of defining vm_get_page_prot() to the platform
>> (still utilizing generic protection_map[] array) itself making it clean and
>> simple.
>>
>> This first introduces ARCH_HAS_VM_GET_PAGE_PROT which enables the platforms
>> to define custom vm_get_page_prot(). This starts converting platforms that
>> define the overrides arch_filter_pgprot() or arch_vm_get_page_prot() which
>> enables for those constructs to be dropped off completely.
>>
>> The series has been inspired from an earlier discuss with Christoph Hellwig
>>
>> https://lore.kernel.org/all/1632712920-8171-1-git-send-email-anshuman.khandual@arm.com/
>>
>> This series applies on 5.18-rc1 after the following patch.
>>
>> https://lore.kernel.org/all/1643004823-16441-1-git-send-email-anshuman.khandual@arm.com/
> 
> Confusing.  That patch is already in 5.18-rc1.
Ahh, my bad, forgot to delete these lines here in the cover letter.
This series just applies cleanly on 5.18-rc1 without dependency.

> But the version which was merged (24e988c7fd1ee701e) lacked the change
> to arch/arm64/Kconfig.  I seem to recall that this patch went through a
> few issues and perhaps the arm64 change was dropped.  Can you please
> check?

ARCH_HAS_FILTER_PGPROT on arm64 got dropped off via another commit i.e
6e2edd6371a4 ("arm64: Ensure execute-only permissions are not allowed
without EPAN").

> 
> (It would be easier for me to track all this down if the original patch
> had had cc:linux-mm.  Please cc linux-mm!
Sure, will do. Please do let me know if there is anything else that needs
to be taken care.
