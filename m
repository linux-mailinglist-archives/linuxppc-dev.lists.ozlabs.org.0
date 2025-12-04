Return-Path: <linuxppc-dev+bounces-14588-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC2ECA2677
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 06:26:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMNKW61MSz2xFS;
	Thu, 04 Dec 2025 16:26:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764825999;
	cv=none; b=GVStIte3l8kDrFql7KTvCbvE9FD7aCRYICI3X0cyzIAeyOwkSJcBy6wHBpx0dil9c1SKklXBw4W8aiYlmEhAZ+v9LxkVKshTaWyU/97IHIZZuqqDP5imzmM/Ugrlzola4ZD+NruVzoCVQk3/TfxTcxMFBM829RGQiMgkntOuyEhcJdnlD6Ru96Fc5L0/2aONuGu2tgaqo1/gzZQ5ZiiyplwSAULNpfhzomwBko1WPcQ0Zv3/BdgLO9GhRNNgV2YlfAsbcG+BCfAo+RrFa0p3z8q/9pJZHRikDZeN9QOKFTTDMsQWi/wkRAIDP+EuBg34YmakEWg94fLQ/N+iJKzoww==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764825999; c=relaxed/relaxed;
	bh=K0Grv1Va+x0sJ/0g9wgFwBpEp9cwhWm39UVuKbjacKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LxtVTARR/WDMHx7ZG3oCPvliJRP0MXMu7via5Op1LUt/jnPW2ZmLOHl/VSvIu+SfI53tfcftxKYOvfUdoCRmICBxkzRru5WKC1JQw5dVyDJjYexlPW9z3hekn9XRviyRmL8UrW65h5F2sASTdzuF93KZgjiyKUIvddI7Fd1mRujzOfWdzNlJQqseiPlt/ZBhtpip1bvXSPkLb8zNL9JSJS0xf7Rr0W4ySkKjVQIeajQH2JDbijYHJrkZKdhTLVK4cn3UfMaMGAVYDGEZy50tbdkgXlPOwkb8OpXO71ErJN1Jt6Y1S3nEMbrdHzkTeoWhpfcQPeRmu+/0KOL0hQbFvg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMNKV4wZfz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 16:26:36 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEB83339;
	Wed,  3 Dec 2025 21:25:56 -0800 (PST)
Received: from [10.164.18.78] (unknown [10.164.18.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 80D2B3F59E;
	Wed,  3 Dec 2025 21:25:54 -0800 (PST)
Message-ID: <2c2b3382-7bdb-41a9-b48e-4fa9a44312ba@arm.com>
Date: Thu, 4 Dec 2025 10:55:51 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] mm: enable lazy_mmu sections to nest
To: Kevin Brodsky <kevin.brodsky@arm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251124132228.622678-1-kevin.brodsky@arm.com>
 <20251124132228.622678-9-kevin.brodsky@arm.com>
 <23dcf752-0b75-45a7-84f8-25bddf97af08-agordeev@linux.ibm.com>
 <703cbee6-a813-4970-9232-34ee91ed8961@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <703cbee6-a813-4970-9232-34ee91ed8961@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 03/12/25 1:50 PM, Kevin Brodsky wrote:
> On 28/11/2025 14:55, Alexander Gordeev wrote:
>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>> + * currently enabled.
>> The in_lazy_mmu_mode() name looks ambiguous to me. When the lazy MMU mode
>> is paused are we still in lazy MMU mode? The __task_lazy_mmu_mode_active()
>> implementation suggests we are not, while one could still assume we are,
>> just paused.
>>
>> Should in_lazy_mmu_mode() be named e.g. as in_active_lazy_mmu_mode() such
>> a confusion would not occur in the first place.
> 
> I see your point, how about is_lazy_mmu_mode_active()?

Agreed - is_lazy_mmu_mode_active() seems better.

