Return-Path: <linuxppc-dev+bounces-11863-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0957B4854D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 09:33:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKzFh4fF5z2xdg;
	Mon,  8 Sep 2025 17:33:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757316792;
	cv=none; b=WqDjrn5p4PmDk3t1S7QE/VDkKqx5IsYnG4xz4RAwuJJVd4v9KPc+05qZIONgKJFymyu9v8+VZ7+ZrguodSOXwS9haZsuWOHSl3jEda/1rpLSK0iUrPzeUxkf8OM80XIGO36wm31/keUNSNbPgPEWdM8NK6Qfyj+FmL62qeRaBf/cYs7TDn7KkTwJyI3nRsVxpQgZPeki1t9a2POMpf23h7QgzTzqtcRNPZXdZjCaElNvk/RTAir61jwjn0u0OvDP/xrbnwzGWWVGOi6pUxacqD/00nLlcE6QwLJc+uByLFWgC0bP6NmsIPm6AO91XjzVuRL0odvq5R48uPBSUarzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757316792; c=relaxed/relaxed;
	bh=5MXJVs4sRjIzs/FqbYFU50YGWM5NgmUAUp6zmg3Kby4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PyRe41yR6Gf+Uh6AHMkS4y+lboUpfy4Do4RHeVulgoXYSDa0b38qp5KQb6HRtzUe6HK+dxIKI2LxUMWpwyzOeRl65/v1TIEh49Q2Gq5YGN7psNIrsTWk+mS4rfixfLJDxWa8Q5W+NeTbEu1mG1xZeSQQbTwd7A2cWsKYaUz2tQvLIY379Byr0mRgEmaFD6wg+RpE+Tvc+6lTGsUy9toBmZCcg5uKUAd9yDJIi6MZmSEkWL9aR4osMX0u2VbxxuC4jrpnn8EqPdinRfWZHuqu8OpBBUcuUutUvfn4HL8KT+ETqU0C5cB+sGtMOj8H3qb5KV5fnEIGUYDPNiEVRwFlBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cKzFh026yz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 17:33:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88AA2169C;
	Mon,  8 Sep 2025 00:32:32 -0700 (PDT)
Received: from [10.57.58.69] (unknown [10.57.58.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFA563F63F;
	Mon,  8 Sep 2025 00:32:34 -0700 (PDT)
Message-ID: <1f822d8b-eb46-4998-b1c1-9996d70e1958@arm.com>
Date: Mon, 8 Sep 2025 09:32:32 +0200
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
Subject: Re: [PATCH 5/7] powerpc/mm: support nested lazy_mmu sections
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-6-kevin.brodsky@arm.com>
 <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <074ff6ab-5868-4fde-b5bb-9e17632ad817-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/09/2025 17:52, Alexander Gordeev wrote:
> On Thu, Sep 04, 2025 at 01:57:34PM +0100, Kevin Brodsky wrote:
> ...
>>  static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>  {
>>  	struct ppc64_tlb_batch *batch;
>> +	int lazy_mmu_nested;
>>  
>>  	if (radix_enabled())
>>  		return LAZY_MMU_DEFAULT;
>> @@ -39,9 +40,14 @@ static inline lazy_mmu_state_t arch_enter_lazy_mmu_mode(void)
>>  	 */
>>  	preempt_disable();
>>  	batch = this_cpu_ptr(&ppc64_tlb_batch);
>> -	batch->active = 1;
>> +	lazy_mmu_nested = batch->active;
>>  
>> -	return LAZY_MMU_DEFAULT;
>> +	if (!lazy_mmu_nested) {
> Why not just?
>
> 	if (!batch->active) {

Very fair question! I think the extra variable made sense in an earlier
version of that patch, but now it's used only once and doesn't really
improve readability either. Will remove it in v2, also in patch 6
(basically the same code). Thanks!

- Kevin

