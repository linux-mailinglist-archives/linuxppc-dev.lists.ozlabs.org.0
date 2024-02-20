Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C8485C52C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 20:51:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfVR533H2z3dTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 06:51:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfVQd4RJhz3c2V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 06:51:18 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 171D1FEC;
	Tue, 20 Feb 2024 11:51:24 -0800 (PST)
Received: from [172.20.10.9] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47F7F3F73F;
	Tue, 20 Feb 2024 11:50:39 -0800 (PST)
Message-ID: <061b8c8a-51cc-46b0-8a2d-90bf6c6ce5d8@arm.com>
Date: Tue, 20 Feb 2024 20:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/18] arm64/mm: Wire up PTE_CONT for user mappings
Content-Language: en-GB
To: John Hubbard <jhubbard@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20240215103205.2607016-1-ryan.roberts@arm.com>
 <20240215103205.2607016-13-ryan.roberts@arm.com> <Zc9UQy-mtYAzNWm2@arm.com>
 <892caa6a-e4fe-4009-aa33-0570526961c5@arm.com> <Zc-Tqqfksho3BHmU@arm.com>
 <f9fc2b31-11cb-4969-8961-9c89fea41b74@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f9fc2b31-11cb-4969-8961-9c89fea41b74@nvidia.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/02/2024 19:54, John Hubbard wrote:
> On 2/16/24 08:56, Catalin Marinas wrote:
> ...
>>> The problem is that the contpte_* symbols are called from the ptep_* inline
>>> functions. So where those inlines are called from modules, we need to make sure
>>> the contpte_* symbols are available.
>>>
>>> John Hubbard originally reported this problem against v1 and I enumerated all
>>> the drivers that call into the ptep_* inlines here:
>>> https://lore.kernel.org/linux-arm-kernel/b994ff89-1a1f-26ca-9479-b08c77f94be8@arm.com/#t
>>>
>>> So they definitely need to be exported. Perhaps we can tighten it to
> 
> Yes. Let's keep the in-tree modules working.
> 
>>> EXPORT_SYMBOL_GPL(), but I was being cautious as I didn't want to break anything
>>> out-of-tree. I'm not sure what the normal policy is? arm64 seems to use ~equal
>>> amounts of both.
> 
> EXPORT_SYMBOL_GPL() seems appropriate and low risk. As Catalin says below,
> these really are deeply core mm routines, and any module operating at this
> level is not going to be able to survive on EXPORT_SYMBOL alone, IMHO.
> 
> Now, if only I could find an out of tree module to test that claim on... :)
> 
> 
>> I don't think we are consistent here. For example set_pte_at() can't be
>> called from non-GPL modules because of __sync_icache_dcache. OTOH, such
>> driver is probably doing something dodgy. Same with
>> apply_to_page_range(), it's GPL-only (called from i915).
>>
>> Let's see if others have any view over the next week or so, otherwise
>> I'd go for _GPL and relax it later if someone has a good use-case (can
>> be a patch on top adding _GPL).
> 
> I think going directly to _GPL for these is fine, actually.

OK I'll send out a patch to convert these to _GPL on my return on Monday.
Hopefully Andrew will be able to squash the patch into the existing series.

> 
> 
> thanks,

