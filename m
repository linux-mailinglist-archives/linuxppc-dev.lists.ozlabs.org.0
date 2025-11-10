Return-Path: <linuxppc-dev+bounces-13997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B01D4C45F75
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:37:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mMl5JJVz2xqZ;
	Mon, 10 Nov 2025 21:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762771075;
	cv=none; b=CWsZVZaSuZzn72LAjA2IIMwOJVg6yLA/j3/REW6snFJdwKjH4hnZibD6CQUOuRrEc0uDpNK2tlTM6x96+2pGSQ3yasK8/qN/SKk/J0HEWQbziP1adcHVPlIF+gSV7Y3jRgg6Umjcy1m1TIzh1NQL01/w1ebrIG6PCEvOkQlSCvPVJQW7/cy5XZcrLIQItQYH+W5nWWlJ9NSTeMropFXqYtUrcEHnGleF35i1MA/GgUFzrf88BNT0OUl/h6p0kC+GpXb919g/TjOcH5aaRvlwX0HvUSZRTXt5CBd+JwfUCFPJ5rxG6371V905mR0PqvqHBc/UrjvbwicRMlzzWUY14Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762771075; c=relaxed/relaxed;
	bh=wwdS1VB3vgYSOM1P254K506c5LfSj/vi1RAI9w6ktio=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kIFyndLB80Sghf62qHxtwyFBBC+NKQAqCmIZcel6P+rsJDnkUApkWwHON5kbQjC0xxWJwYI4XVsisKCZLRdGtQo1lYkPVndDh+62VeuH4/Oq4cviPBniaZcLDSlebNVKBYW/nXjybS4kv9VYa/715afQFyVb7KqI+Fvhd4UhNLFjsG7Rz/Fp6MrQul4Q904GrlumMO0od7I6KO1uQtmCzRRR0BpWWCbEkAHZCKmLF2lghKLluf9Y48P+sWxpTIroQlzvjP2DTO0jVJcRNnOvC87ik0euZb+EVDlcuZws/D121htMBhWsLIOJrMH+gad1OmB7Web1VSGCwBbY1O6d8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mMk604Sz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:37:53 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEEFE497;
	Mon, 10 Nov 2025 02:37:12 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E4913F66E;
	Mon, 10 Nov 2025 02:37:12 -0800 (PST)
Message-ID: <b21fb5b9-2e7f-4cbc-ae62-015b1317a9bd@arm.com>
Date: Mon, 10 Nov 2025 11:36:52 +0100
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
Subject: Re: [PATCH v4 02/12] x86/xen: simplify flush_lazy_mmu()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-3-kevin.brodsky@arm.com>
 <b165098a-8164-4664-aaaf-1e8c4391d797@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <b165098a-8164-4664-aaaf-1e8c4391d797@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/11/2025 12:31, Ryan Roberts wrote:
> On 29/10/2025 10:08, Kevin Brodsky wrote:
>> arch_flush_lazy_mmu_mode() is called when outstanding batched
>> pgtable operations must be completed immediately. There should
>> however be no need to leave and re-enter lazy MMU completely. The
>> only part of that sequence that we really need is xen_mc_flush();
>> call it directly.
>>
>> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> This looks functionally equivalent to me, so:
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>
> But I don't think this tidy up is strictly necessary for your series to work?
> (perhaps I'll change my mind on that as I go through it).

I initially thought it might be, but in the end I think you're right -
it should still work fine without this patch.

Still, I'd rather avoid unnecessary calls to arch_enter() and
arch_leave() as it makes it harder to reason about what is called where.
Namely, keeping them here means that a nested call to
lazy_mmu_mode_disable() would cause arch_leave() then arch_enter() to be
called - rather unexpected.

The only calls to arch_enter() and arch_leave() that are left after this
series are the ones in <linux/pgtable.h> and the Xen context-switching
logic (the one case where calling arch hooks directly is justified, see
discussion on v3 [1]).

- Kevin

[1]
https://lore.kernel.org/all/390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com/

