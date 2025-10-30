Return-Path: <linuxppc-dev+bounces-13551-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 922DDC1F8BD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 11:29:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy0jJ20N1z30V1;
	Thu, 30 Oct 2025 21:29:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761820180;
	cv=none; b=iydIVZZyggTnOx8NdDL+gtSf1m5z8i5j+27tozTQAOsREg78RyY95DyioBBptkxQUcnr/Bbq7oMe8dOWXdmwzVlLtvsUJDIuDjUpNDbgIp5vJ0uNeHd0gKj73tFHJn6Ksv/08QYNQ7aj1AoNaA0z7cwXWZSC4d5R5HOcSJStFS11MsxeQOao0CswUqpM1I2SSkEbhlw0TjRmsiKjdmrg5qN7cOO1YYTIged9kw5wROl4CgnqLyBjhNObKOInSRuRhyIVaqaeP4btDNgwxuQKV/F63bP9ow9qwtBhl393rADRsRwM4oxkolkgY9fxAnuh1A1WpoyVNeWNSRJ5Z3MRCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761820180; c=relaxed/relaxed;
	bh=WGsanynM+bveV70EQ4nqT1sLG5kUc3lKFttAynF/olU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2c4zpa1j8R94nzBijAHAzUL01Z+sTfpzX8Jlmoyv/f6KS8cH6zI+/MjzFm6Odij1eBjlWG6tBgcM2Hb8sDIssmuVQuF+/c7nKOW9oHx4619g06LRtrXX8sCQf3QJM/NXy3H76Ih3MqTXA2xMMpLt8Kdl+GnrG32ZQo2BnrvqhPUmh0DOz0pLSrUexAf5ExoNLxtFenlkKVUyuepXuyFldcEZAP9UQHm+HcFp3EuYC+hxB47O2ZaWuLyIq6i0cat3QzZdPMrATCF+iqWhV5AhXF8pSRm+4H42eZqpXVU386KhIIlNs659ytx28MvTGhpYIzK+JmGNn4qNscsw5Hzeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy0jH1Vpsz2xxS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 21:29:37 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E08BE1EDB;
	Thu, 30 Oct 2025 03:28:56 -0700 (PDT)
Received: from [10.57.69.77] (unknown [10.57.69.77])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8D363F66E;
	Thu, 30 Oct 2025 03:28:56 -0700 (PDT)
Message-ID: <d0767b70-5686-4f6e-8ca4-10b3f3ff3991@arm.com>
Date: Thu, 30 Oct 2025 11:28:53 +0100
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
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>
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
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <ef0cd4bc-1a37-4755-8957-d8a7e5c4564e-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <ef0cd4bc-1a37-4755-8957-d8a7e5c4564e-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29/10/2025 17:41, Alexander Gordeev wrote:
> On Wed, Oct 29, 2025 at 10:09:04AM +0000, Kevin Brodsky wrote:
>
> Hi Kevin,
>
>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +static inline bool in_lazy_mmu_mode(void)
>> +{
>> +	return current->lazy_mmu_state.active;
> Whether (nesting_level > 0) is more correct check?
> Otherwise, it returns false while in paused mode.

That's exactly the intention. Lazy MMU is disabled while paused. The
users of that helper want to know if lazy MMU is currently enabled (to
decide whether to batch updates for instance); whether this is because
we are paused or not in any lazy_mmu section (nesting_level == 0) makes
no difference.

> May be check both nesting_level and active and also introduce
> in_lazy_mmu_paused_mode() right away to avoid any confusion?

Can you think of any situation where a caller would specifically want to
know that lazy MMU is paused?

- Kevin

