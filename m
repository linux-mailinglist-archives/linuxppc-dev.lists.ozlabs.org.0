Return-Path: <linuxppc-dev+bounces-13872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22DC3A43B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 11:30:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JP75RTSz3btg;
	Thu,  6 Nov 2025 21:30:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762425035;
	cv=none; b=RzREIgSRMdxAeAgJiz5MciFW5Bb+0HE6y1eI+yOT84bje7FZdSsyG9Iio0B7TfjSihLKiW39vGyhCGNzq2qSsylwPWRA7A+pKp268CF4Z+jbSHE+GppybuhU6y5uiao0yw2OmexcFFVge/XxRl9AbN2yPm+TfNMSFgWLr5fpbvCjmk8lmu8YjG6bJjookYrBKbmDXkX0GU355uD/OKgqFW/MyyMVUjHEGDq0RRWb2LDbcLM1Z/c4Q6Y2cFEize/kqSml9ZycfcHSdQlG2h7tGR+rM8dGZhtkqclq+1WkTTt3pzHDs8jFDR4nPfueCx7EOcgrykDxsPuT2iHHzbiCiA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762425035; c=relaxed/relaxed;
	bh=kXPFrNUNPhhkMe5rhwtRP1Qi03luuYdSthxJanNeerc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S64lpULFAXpCKQLPIYwaeoqMqcSwZ0Fp2wEsjM2vrJaK308e3j6KD3V/ZGSyl+SkBd6OjouEJNN4oy3LvOLhHiALwRu/MOfql+WehztM43lFv8/P4J4jDriOG446Q7zIO/+coyteTxGssSoVfVoeJh2H5Y0WAKF8HlmyMFBX0Dt4FoHIFd5P9gJyTlhLLDBFzwtz9ESdfQNQhPA69OBlAhGP7hOPUz7uf7iFHOnTlkxoHEisdRrqNBIpJnopwob+iQpebTPOO4QybsWVPjwijOxkywSUYmHjLDzH91vwILv3FqvUiQXGJ0HjLIHKHMLy9kIczO+O8PlKpB9hZ/Iykw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2JP6544Yz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 21:30:32 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B85731596;
	Thu,  6 Nov 2025 02:29:52 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB9A53F66E;
	Thu,  6 Nov 2025 02:29:53 -0800 (PST)
Message-ID: <b3e4a92f-5b51-4eee-bfb8-c454add0f0d2@arm.com>
Date: Thu, 6 Nov 2025 10:29:50 +0000
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
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <87qzud42n1.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/11/2025 02:46, Ritesh Harjani (IBM) wrote:
> Kevin Brodsky <kevin.brodsky@arm.com> writes:
>
>> From: Alexander Gordeev <agordeev@linux.ibm.com>
>>
>> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
>> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
>> Therefore, the batch re-activation code is never called, so remove it.
>>
>> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
>> ---
>>  arch/powerpc/include/asm/thread_info.h |  2 --
>>  arch/powerpc/kernel/process.c          | 25 -------------------------
>>  2 files changed, 27 deletions(-)
>>
> Since the commit referenced in above disables the preemption in
> arch_enter_lazy_mmu(), so the expectation is that we will never be
> context switched while in lazy_mmu, hence the code changes in
> switch_to() around __flush_tlb_pending() should ideally never be called.

Correct, that's the idea.

> With this analysis - the patch looks good to me. I will give this entire
> patch series a try on Power HW with Hash mmu too (which uses lazy mmu and
> let you know the results of that)!

That'd be very appreciated, thanks a lot!

> For this patch please feel free to add:
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>
>
> CC: Venkat who also runs CI on linux Power HW for upstream testing :)

Ack, will Cc you both in the next version.

- Kevin

