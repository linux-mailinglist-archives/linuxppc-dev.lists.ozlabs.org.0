Return-Path: <linuxppc-dev+bounces-11921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D790AB4A6E4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Sep 2025 11:11:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdNX5bPHz3bqP;
	Tue,  9 Sep 2025 19:11:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757409084;
	cv=none; b=Sxuf/AS9M61Y2qah/GiLYmaPgsNrpxIIz++6B/nZk4FHcKwxTdt9rzh2N6HCzrBxqdsdQAyV6968eKlmeebnf2QCoTJ+Pp8oBK/O6XVBdHJmhcXpga6Qasb3/dTXKHx8jJDmXBnhzLvjRvug68z61ugmhT7Ra3hqoJIe63LbC+OoVgy2SkmapK8/IKoiXE6aOOK8zz7It4Ji9GhDtc1q+IrIWlRH1zQy8NXod21/RwYnYRM6qjFRO5TV3q0TptakI1j4fGfMyXX3gQp+AHnmzgVbiPr2PALPw5yL+mNo5SOm9wmcPyLCc/QCdEqOIpskG1382seBkXN5sqgYeBRjGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757409084; c=relaxed/relaxed;
	bh=St/jo3/IjoT+/tBd36JJNTe9cJMOpLH/Kfc1GffKIvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmZRPy+z4pAXMx3sLHBaVT4SQJYJ3tYH7lo+vW8zzRYNbUUqB7APGkLGj+I7ENT6qxs1a1pVZeqM3u7Kz7vKaL6ENOoPZYAT7oBMwbT8R8JJ5VDKaCLA7x21P8+G82kqbB6qqTRQjC0J2uMitdt/rDru1HbEwO5ThT4I0w+VI1EReOdCPybaPhbOGBrpsHgCY4+o7aYqVq9JmKjiANtt4D4DCwQNgcW5pMo3zcpHbWyI1cPFCtZu1ypim2V1hYv20fKSF4xo+OxXqCjWQlsBclbSW6lEU6JJ7owfgsPrrH1jFf9b8+ViCxe9uo4uRvz0xHtYKXm4+kKfR20DM2l0Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLdNX06q5z3bgh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Sep 2025 19:11:23 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A03615A1;
	Tue,  9 Sep 2025 02:10:44 -0700 (PDT)
Received: from [10.57.60.124] (unknown [10.57.60.124])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 358583F63F;
	Tue,  9 Sep 2025 02:10:37 -0700 (PDT)
Message-ID: <652720ae-131e-4de0-bc65-e5c1bdc46186@arm.com>
Date: Tue, 9 Sep 2025 11:10:34 +0200
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
Subject: Re: [PATCH v2 0/7] Nesting support for lazy MMU mode
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
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
 <Liam.Howlett@oracle.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <c07b8a65-7cef-4ddd-bd94-d2e275edc2a8@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <c07b8a65-7cef-4ddd-bd94-d2e275edc2a8@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 08/09/2025 18:56, Lorenzo Stoakes wrote:
> On Mon, Sep 08, 2025 at 08:39:24AM +0100, Kevin Brodsky wrote:
>> When the lazy MMU mode was introduced eons ago, it wasn't made clear
>> whether such a sequence was legal:
>>
>> 	arch_enter_lazy_mmu_mode()
>> 	...
>> 		arch_enter_lazy_mmu_mode()
>> 		...
>> 		arch_leave_lazy_mmu_mode()
>> 	...
>> 	arch_leave_lazy_mmu_mode()
>>
>> It seems fair to say that nested calls to
>> arch_{enter,leave}_lazy_mmu_mode() were not expected, and most
>> architectures never explicitly supported it.
>
> This is compiling with CONFIG_USERFAULTFD at all commits and series is
> compiling with allmodconfig plus all mm selftests are passing so from my
> side this looks good, thanks for addressing issues and rebasing! :)

Great thank you for that extensive testing, very appreciated! Shall I
add your Reviewed-by to the whole series?

- Kevin

