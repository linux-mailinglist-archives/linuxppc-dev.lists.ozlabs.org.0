Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB2317EEA2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 03:34:04 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bzgB0fgpzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 13:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48bzd50q99zDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 13:32:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C538730E;
 Mon,  9 Mar 2020 19:32:02 -0700 (PDT)
Received: from [10.163.1.203] (unknown [10.163.1.203])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E46843F67D;
 Mon,  9 Mar 2020 19:31:53 -0700 (PDT)
Subject: Re: [PATCH V15] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qian Cai <cai@lca.pw>
References: <61250cdc-f80b-2e50-5168-2ec67ec6f1e6@arm.com>
 <CEEAD95E-D468-4C58-A65B-7E8AED91168A@lca.pw>
 <a45834bc-e6f2-ac21-de9e-1aff67d12797@arm.com>
 <c40d907a-b64b-ae0d-e58f-33dddf0e8edc@c-s.fr>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <2d950d8c-4b23-741e-591f-e22e857c0755@arm.com>
Date: Tue, 10 Mar 2020 08:01:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c40d907a-b64b-ae0d-e58f-33dddf0e8edc@c-s.fr>
Content-Type: text/plain; charset=utf-8
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 03/07/2020 12:35 PM, Christophe Leroy wrote:
> 
> 
> Le 07/03/2020 à 01:56, Anshuman Khandual a écrit :
>>
>>
>> On 03/07/2020 06:04 AM, Qian Cai wrote:
>>>
>>>
>>>> On Mar 6, 2020, at 7:03 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>>>
>>>> Hmm, set_pte_at() function is not preferred here for these tests. The idea
>>>> is to avoid or atleast minimize TLB/cache flushes triggered from these sort
>>>> of 'static' tests. set_pte_at() is platform provided and could/might trigger
>>>> these flushes or some other platform specific synchronization stuff. Just
>>>
>>> Why is that important for this debugging option?
>>
>> Primarily reason is to avoid TLB/cache flush instructions on the system
>> during these tests that only involve transforming different page table
>> level entries through helpers. Unless really necessary, why should it
>> emit any TLB/cache flush instructions ?
> 
> What's the problem with thoses flushes ?
> 
>>
>>>
>>>> wondering is there specific reason with respect to the soft lock up problem
>>>> making it necessary to use set_pte_at() rather than a simple WRITE_ONCE() ?
>>>
>>> Looks at the s390 version of set_pte_at(), it has this comment,
>>> vmaddr);
>>>
>>> /*
>>>   * Certain architectures need to do special things when PTEs
>>>   * within a page table are directly modified.  Thus, the following
>>>   * hook is made available.
>>>   */
>>>
>>> I can only guess that powerpc  could be the same here.
>>
>> This comment is present in multiple platforms while defining set_pte_at().
>> Is not 'barrier()' here alone good enough ? Else what exactly set_pte_at()
>> does as compared to WRITE_ONCE() that avoids the soft lock up, just trying
>> to understand.
>>
> 
> 
> Argh ! I didn't realise that you were writing directly into the page tables. When it works, that's only by chance I guess.
> 
> To properly set the page table entries, set_pte_at() has to be used:
> - On powerpc 8xx, with 16k pages, the page table entry must be copied four times. set_pte_at() does it, WRITE_ONCE() doesn't.
> - On powerpc book3s/32 (hash MMU), the flag _PAGE_HASHPTE must be preserved among writes. set_pte_at() preserves it, WRITE_ONCE() doesn't.
> 
> set_pte_at() also does a few other mandatory things, like calling pte_mkpte()
> 
> So, the WRITE_ONCE() must definitely become a set_pte_at()

Sure, will do. These are part of the clear tests that populates a given
entry with a non zero value before clearing and testing it with pxx_none().
In that context, WRITE_ONCE() seemed sufficient. But pte_clear() might be
closely tied with proper page table entry update and hence a preceding
set_pte_at() will be better.

There are still more WRITE_ONCE() for other page table levels during these
clear tests. set_pmd_at() and set_pud_at() are defined on platforms that
support (and enable) THP and PUD based THP respectively. Hence they could
not be used for clear tests as remaining helpers pmd_clear(), pud_clear(),
p4d_clear() and pgd_clear() still need to be validated with or without
THP support and enablement. We should just leave all other WRITE_ONCE()
instances unchanged. Please correct me if I am missing something here.

> 
> Christophe
> 
