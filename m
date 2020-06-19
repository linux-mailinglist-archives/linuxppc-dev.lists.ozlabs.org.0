Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C58A1FFFBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 03:36:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p1cC1XMTzDrPG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 11:36:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49p1ZV007tzDrKq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 11:34:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 238DFD6E;
 Thu, 18 Jun 2020 18:34:50 -0700 (PDT)
Received: from [10.163.81.119] (unknown [10.163.81.119])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 216703F73C;
 Thu, 18 Jun 2020 18:34:41 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V3 (RESEND) 0/3] arm64: Enable vmemmap mapping from device
 memory
To: Mike Rapoport <rppt@linux.ibm.com>
References: <1592442930-9380-1-git-send-email-anshuman.khandual@arm.com>
 <20200618085641.GE6493@linux.ibm.com>
Message-ID: <27f8c6f9-3970-6f02-dff4-7ca15bee7138@arm.com>
Date: Fri, 19 Jun 2020 07:04:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200618085641.GE6493@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 x86@kernel.org, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Pavel Tatashin <pasha.tatashin@soleen.com>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/18/2020 02:26 PM, Mike Rapoport wrote:
> On Thu, Jun 18, 2020 at 06:45:27AM +0530, Anshuman Khandual wrote:
>> This series enables vmemmap backing memory allocation from device memory
>> ranges on arm64. But before that, it enables vmemmap_populate_basepages()
>> and vmemmap_alloc_block_buf() to accommodate struct vmem_altmap based
>> alocation requests.
>>
>> This series applies on 5.8-rc1.
>>
>> Pending Question:
>>
>> altmap_alloc_block_buf() does not have any other remaining users in
>> the tree after this change. Should it be converted into a static
>> function and it's declaration be dropped from the header
>> (include/linux/mm.h). Avoided doing so because I was not sure if there
>> are any off-tree users or not.
> 
> Well, off-tree users probably have an active fork anyway so they could
> switch to vmemmap_alloc_block_buf()...

Sure, will make the function a static and remove it's declaration
from the header.

> 
> Regardless, can you please update Documentation/vm/memory-model.rst to
> keep it in sync with the code?
Sure, will do.
