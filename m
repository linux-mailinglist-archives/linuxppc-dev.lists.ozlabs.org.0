Return-Path: <linuxppc-dev+bounces-13333-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C519C0E0EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 14:33:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwDwm0fmMz2ytT;
	Tue, 28 Oct 2025 00:33:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761572007;
	cv=none; b=LdLh+gmsIsK7bQ3KXiQK7AUjdkNlfw9SVi1PpZGZUq/R4GminEICoXgUDYJsoLhxlkIE5H1sbKG6QGC29rBe57JdhZHy+MNh5IX9lbBihrnTSIpcolT0BY8ZwJDQLn560qz1Fz1ThzgpXQ4WDPG3BpBGQ7SHfNtjYGc7hTTOGmuv6tkiyfib5cYSD6YU5I25vQzlAU57/sfp0hlvOpeEGUd4Xj6slofvFTmPLjgScErtptx9lkG5xhJZ9+RByt7QFRxBnBu4dAZbCUT+v+vny7aQfU9ZDOCJRHl5TzQLr8y/xM77NiCjsOgTcFeXK02PnJaxIReJjxogRWGeno9/eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761572007; c=relaxed/relaxed;
	bh=LZIV7DiVBQ9ZGj7Mw+AxaUbETtcLCEViFbmC0IEP6UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FcqSBmuYlNoWvK4jGMLWD4nL8NfsyEeG7kbd/Sp8eJg6Yd6pW+ZmPaptDQiJOLFX8OAMF7Zf6E4lFCAdht9PspeqCXHs9bhxGzb2no/EggqdbVt5DfEskpnEEnFtagDf6XwQYMHPGvbNNpK++A1mb6SUWQMchGa82fshZStglQ4kmUC4J9B+kPGWP3s3sZYLn5xBr/4z2NN1Pyos910UAWaGd/TdIgLiK2qh8dvWsZOPgnwyauXYx9UWB/o1PE/NezrixTc7EP14j9puPjVThVemlViktzQFCfJ2S8GSZE+AXW5OgVfV4K/Mo8sgR+wkOg2m+TtDMabX+R7wXTKV3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwDwk5v0Fz2ypW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 00:33:25 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A07175D;
	Mon, 27 Oct 2025 06:32:44 -0700 (PDT)
Received: from [10.57.68.196] (unknown [10.57.68.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5AF3F673;
	Mon, 27 Oct 2025 06:32:45 -0700 (PDT)
Message-ID: <2be0732d-d8fb-424d-bc4e-443cc49d0092@arm.com>
Date: Mon, 27 Oct 2025 14:32:42 +0100
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
Subject: Re: [PATCH v3 11/13] x86/xen: use lazy_mmu_state when
 context-switching
To: David Hildenbrand <david@redhat.com>,
 Demi Marie Obenour <demiobenour@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-12-kevin.brodsky@arm.com>
 <f0067f35-1048-4788-8401-f71d297f56f3@redhat.com>
 <348e5f1c5a90e4ab0f14b4d997baf7169745bf04.camel@infradead.org>
 <70723f4a-f42b-4d94-9344-5824e48bfad1@redhat.com>
 <3ff4aaeb-61ce-4b72-ba90-1b66374b1b95@gmail.com>
 <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6c9bd0c6-0968-41ac-b0b4-53c881748cfb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 27/10/2025 13:29, David Hildenbrand wrote:
> On 25.10.25 00:52, Demi Marie Obenour wrote:
>> On 10/24/25 10:51, David Hildenbrand wrote:
>>> On 24.10.25 16:47, David Woodhouse wrote:
>>>> On Thu, 2025-10-23 at 22:06 +0200, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> We currently set a TIF flag when scheduling out a task that is in
>>>>>> lazy MMU mode, in order to restore it when the task is scheduled
>>>>>> again.
>>>>>>
>>>>>> The generic lazy_mmu layer now tracks whether a task is in lazy MMU
>>>>>> mode in task_struct::lazy_mmu_state. We can therefore check that
>>>>>> state when switching to the new task, instead of using a separate
>>>>>> TIF flag.
>>>>>>
>>>>>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>>>>>> ---
>>>>>
>>>>>
>>>>> Looks ok to me, but I hope we get some confirmation from x86 / xen
>>>>> folks.
>>>>
>>>>
>>>> I know tglx has shouted at me in the past for precisely this reminder,
>>>> but you know you can test Xen guests under QEMU/KVM now and don't need
>>>> to actually run Xen? Has this been boot tested?
>>>
>>> And after that, boot-testing sparc as well? :D
>>>
>>> If it's easy, why not. But other people should not suffer for all the
>>> XEN hacks we keep dragging along.
>>
>> Which hacks?  Serious question.  Is this just for Xen PV or is HVM
>> also affected?
>
> In the context of this series, XEN_LAZY_MMU.

FWIW in that particular case it's relatively easy to tell this is
specific to Xen PV (this is only used in mmu_pv.c and enlighten_pv.c).
Knowing what to test is certainly not obvious in general, though.

- Kevin

>
> Your question regarding PV/HVM emphasizes my point: how is a submitter
> supposed to know which XEN combinations to test (and how to test
> them), to not confidentially break something here.
>
> We really need guidance+help from the XEN folks here.

