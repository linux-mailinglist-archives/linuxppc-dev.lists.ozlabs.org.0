Return-Path: <linuxppc-dev+bounces-14009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37F7C46D59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 14:19:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4qxj54Ccz2xqZ;
	Tue, 11 Nov 2025 00:19:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762780745;
	cv=none; b=AtAnNS31scZ0234URAqXsDrF2UquSi4F/aORYbUgq3SqvLWv3UByPAMnCuV0itjtQzMi1wzKQzVQWqblfRuDiRQXwg2+PIhAiviALvrEzgoDHyUa1U0KNBj+aGVTvAAh/IsI4Bj+tuUwggww5KxEdspoRE84AOzVwflUvN4p8mLtsrVUynawyGh3pB5dmnPZDGxnV4dVcdlrO5WGd7nNMWuBqnCqyW85/M/+P4XOyRGdPOvx1l4JtO9fIcU08qE68DedQZdkZYUzBzmBgJd56ElmS0xO2ZBJA4mD0OTcC04dkNI3UJAK7fo6OJuw0YlDv3LynQD+dWSRvOWHB1ECjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762780745; c=relaxed/relaxed;
	bh=e61PmBuBpKPW0kEFbYkXrje4f08ptI1Bgty+XwFb8EM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XOCydyY5xM1MnVsW2m3vED6OvAZpmu8Nb6q5U1vjTu5QHJWpoXNNnhWUZ+2V2vY5iMI+mvSTBK8I8bEiMDdxFs9xoXXvwDJidO1yLQv3tEc/hc/5sxK0YSfLh73Js8wpYlwl2P9E6e5Q3ji6J2SqNLGC2xwdBTe63KYkoFL32oWLMaBQpnfpZvXlZm/1WNqlnvFFGzEGY6cQ9k6h9Kef3W3DVUBGsXylGI25AzET7TzTSlmR9ahQoXDWljLhsGqOAbzQWVXXKcluZxccXDmcixFE7OA0ikyIVamYrXLFA0/6S4i6I8ngN9rjeP+GVy/scLCfi/d34eQ3mJ170iXz0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4qxh564gz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Nov 2025 00:19:02 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E7B25497;
	Mon, 10 Nov 2025 05:18:22 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D493F3F63F;
	Mon, 10 Nov 2025 05:18:22 -0800 (PST)
Message-ID: <d0ce35ad-bfcd-496b-996d-17e59a1d5a73@arm.com>
Date: Mon, 10 Nov 2025 14:18:20 +0100
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
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB
 flush
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-2-kevin.brodsky@arm.com>
 <87qzud42n1.ritesh.list@gmail.com>
 <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
 <87cy5t4b0a.ritesh.list@gmail.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87cy5t4b0a.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08/11/2025 00:35, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> [...]
>>
>>> With this analysis - the patch looks good to me. I will give this entire
>>> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
>>> let you know the results of that)!
>> That'd be very appreciated, thanks a lot!
>>
> I did give this patch series a run on Power10 with Hash MMU. I ran the
> following stress-ng tests and didn't observe any issues (kernel warnings) so far.
>
> stress-ng --all 0 -t 60s --perf -v --verify \
> --tlb-shootdown 0 \
> --fault 0 \
> --userfaultfd 0 \
> --fork 0 \
> --exec 0 \
> --memfd 0 \
> --numa 0 \
> --pkey 0 \
> --remap 0 \
> --vm 0 \
> --rmap 0 \
> -x swap,pagemove
> (Note not all options shown here will work with --verify)

That's great, many thanks!

> Let me know what else I can run for validation?
> Do you know of any specific tests for validation of lazy mmu feature?

I don't think there is - lazy MMU is not supposed to have any observable
effect, all we can do is exercise the paths that use it and check that
nothing explodes.

That said it wouldn't hurt to run the mm kselftests:

    make -C tools/testing/selftests/ TARGETS=mm

Thanks!

- Kevin

