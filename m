Return-Path: <linuxppc-dev+bounces-12939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36771BE1EF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 09:33:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnKRy6l6Xz30Vl;
	Thu, 16 Oct 2025 18:33:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760599982;
	cv=none; b=K3+Eo+ImqBdAyVNsKLrOImUIyLo62OkEZ4FAAjSS/GAf5su6gao1frUAYz5yCTPi51dXzBB7cvJ1IkRbOsyCqMxwE3M0uGVyO51S6yR1mwwOKBufLg2A9KxzPmDxiYEfyHiu/T/GbHX/28pLdWc0kMd8eG32Ld7L9AaDbM30mh/74ETB0q53SHHn0siVC/5aBMIQxjjubJz1c+3+gW+EuNyHlKSOZlK6FChLZXe/RZkimyfptywpqPYoaaXbL5CrOyGUAKuac4503xmT8tBRQ33tLeG4EJ276ItmWttnwpEUtyl9ZJOqwNeHOUeIWvAQNNrdx9pDwLTiH7Gvduxuew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760599982; c=relaxed/relaxed;
	bh=SK6RxrxNXxRFLxyAYlYq9aaMejSm4vU8SsNeGUxqVQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cj0ve0h5pKwKiYX+6R3DuVI1N89Yby9FmyYXbwvRwHKZT60MMPXAhUYgkwdadXHbfX2GHQMNR69cZ9G9s0TW4lFZyTZLUwVK/pdye8NN8HKP8k+osG2ItCgLvI66ah3iY4yyVpMGHubL5HT1IIp/EP7zeFrSoRtsdjSDGYGMowqTE5x4JC/IX1irG1R23CEkI3o1RPW1cqfimCbidP1K5xD38uoaNSif3NcgU69HfGwI3n65ulwNBsA9cLZAJkmT9ai5mHP79lYdulVS/csC/jkw78jwcQt9pLTF6WD9erZVTT+ZapKu0PiyFHmZhoJnEm1SGgLOL/GqizSkvLHT6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnKRy03PYz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 18:33:00 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B64F21688;
	Thu, 16 Oct 2025 00:32:20 -0700 (PDT)
Received: from [10.57.65.134] (unknown [10.57.65.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F1683F6A8;
	Thu, 16 Oct 2025 00:32:20 -0700 (PDT)
Message-ID: <54f183bb-33ce-4b9c-91a9-827a6ed198d6@arm.com>
Date: Thu, 16 Oct 2025 09:32:13 +0200
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
Subject: Re: [PATCH v3 02/13] x86/xen: simplify flush_lazy_mmu()
To: Dave Hansen <dave.hansen@intel.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
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
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-3-kevin.brodsky@arm.com>
 <35d9cf4f-135e-4786-a4e3-fd3a4a18b800@intel.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <35d9cf4f-135e-4786-a4e3-fd3a4a18b800@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 15/10/2025 18:52, Dave Hansen wrote:
> On 10/15/25 01:27, Kevin Brodsky wrote:
>> While at it, we can also avoid preempt_disable() if we are not
>> in lazy MMU mode - xen_get_lazy_mode() should tolerate preemption.
> ...
>>  static void xen_flush_lazy_mmu(void)
>>  {
>> -	preempt_disable();
>> -
>>  	if (xen_get_lazy_mode() == XEN_LAZY_MMU) {
>> -		arch_leave_lazy_mmu_mode();
>> -		arch_enter_lazy_mmu_mode();
>> +		preempt_disable();
>> +		xen_mc_flush();
>> +		preempt_enable();
>>  	}
> But xen_get_lazy_mode() does:
>
> 	this_cpu_read(xen_lazy_mode);
>
> Couldn't preemption end up doing the 'xen_lazy_mode' read and the
> xen_mc_flush() on different CPUs?
>
> That seems like a problem. Is there a reason it's safe?

You're right, I was thinking in terms of task, but xen_mc_flush() does
operate on the current CPU (and it's called when context-switching).
Will restore the original order in v4.

- Kevin


