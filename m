Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 104708500E6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 00:53:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWrK7031Zz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Feb 2024 10:53:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWrJh6KSPz3bqh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Feb 2024 10:53:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B35F0DA7;
	Fri,  9 Feb 2024 15:53:15 -0800 (PST)
Received: from [10.57.78.75] (unknown [10.57.78.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F327E3F5A1;
	Fri,  9 Feb 2024 15:52:29 -0800 (PST)
Message-ID: <633af0a7-0823-424f-b6ef-374d99483f05@arm.com>
Date: Fri, 9 Feb 2024 23:52:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/25] Transparent Contiguous PTEs for User Mappings
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <ZcUQqfg39zCS2BAv@FVFF77S0Q05N.cambridge.arm.com>
 <3ba54c94-8e44-4dd6-9a25-2cf81b07336f@arm.com>
 <216aa113-dc3f-45d4-964f-98f80969a927@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <216aa113-dc3f-45d4-964f-98f80969a927@redhat.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/02/2024 22:16, David Hildenbrand wrote:
>>> 1) Convert READ_ONCE() -> ptep_get()
>>> 2) Convert set_pte_at() -> set_ptes()
>>> 3) All the "New layer" renames and addition of the trivial wrappers
>>
>> Yep that makes sense. I'll start prepping that today. I'll hold off reposting
>> until I have your comments on 19-25. I'm also hoping that David will repost the
>> zap series today so that it can get into mm-unstable by mid-next week. Then I'll
>> repost on top of that, hopefully by end of next week, folding in all your
>> comments. This should give planty of time to soak in linux-next.
> 
> Just sent out v2. Will review this series (early) next week.
> 
> Have a great weekend!

Cheers, David - you too!

> 

