Return-Path: <linuxppc-dev+bounces-2278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0BD99E565
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 13:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSWlJ4yKVz3blk;
	Tue, 15 Oct 2024 22:17:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728991020;
	cv=none; b=FiavDK/HIuvnxUGHzHgANMxpsN12nmtWGMvI5US/vF2h2z2t6ZhLkN47p7p0oy7Ke5A6yhWwl9XM7m0+dFZkCNv3sLa0eTgB1jol6Q0ez0fGQLXrQgvUvTxJd3ZfYpYMskb6leTRW8lDZgn9+WYEZDHc9z9GukUl7XazqfLP6nQ9wvDVtM+X1KhI6yo/qWxL0CcmHyY+HdMNMVGcssuB3Kqi0qUdsPWttFom1pt/pIHQDnZg0TUex9MOY03YZFBoJRtZJQZNWeFkfiJMpqfH9bsg+6Q/H5pmizyjF7EUgd/KcHSlF6lcpsisMw9JhE3V6qpGdqAfiDNxRNr/gFjO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728991020; c=relaxed/relaxed;
	bh=8j6OJfMYqR7tjKbcEXMmw0tKdMhVUcFwJwG77YwleC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5DFRXfixZuP32UVjlMq0WypnvjTmJ1dIfZvFM32FUdBejaTlZLf1p2JxKhHg7eqrmFnCl8o2NI11OBV02+ay0pjOGZE8dvoIrwPPCwsrtdzTJUc5FZWf704Js5YubxJ0kZSsnc7qPHqr/JZNt16tdDgtFf98XoPKJ9J12UFHqZps7E1ZETVob3KcEm8E5njPWEWJS8weksApyJMCRdDoOEkDZHRFELNoeMhZ719Z4iQYX1uziCairgZ46O3ZWBBfcwSJsCiLTPIUblvOuezi0D1QoeWDfJdKr+aBHaoGXd1kQoTabsF6V0R8YWiD+/1nzA1iy6sVAGK06epR31WQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSWlG56b6z3bkf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 22:16:56 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB00E1007;
	Tue, 15 Oct 2024 04:16:53 -0700 (PDT)
Received: from [10.57.86.207] (unknown [10.57.86.207])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 613183F51B;
	Tue, 15 Oct 2024 04:16:14 -0700 (PDT)
Message-ID: <c04323d5-6dcd-4391-81bb-94ee580ae98f@arm.com>
Date: Tue, 15 Oct 2024 12:16:12 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 01/57] mm: Add macros ahead of supporting boot-time
 page size selection
Content-Language: en-GB
To: Pingfan Liu <piliu@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Chris Zankel <chris@zankel.net>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Marsden <greg.marsden@oracle.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Ivan Ivanov <ivan.ivanov@suse.com>, Johannes Berg
 <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonas Bonn <jonas@southpole.se>, Kalesh Singh <kaleshsingh@google.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <mbrugger@suse.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Miroslav Benes <mbenes@suse.cz>, Rich Felker <dalias@libc.org>,
 Richard Weinberger <richard@nod.at>, Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20241014105514.3206191-1-ryan.roberts@arm.com>
 <20241014105912.3207374-1-ryan.roberts@arm.com> <Zw0iegwMp5ZVGypy@fedora>
 <9b7e4f65-a171-4574-bd53-580e79527fbc@arm.com>
 <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <CAF+s44QbdPBN-8EcPiWiZgYgZY4v8RK-wA0VEaVXbfnc9_HQ9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 15/10/2024 04:04, Pingfan Liu wrote:
> On Mon, Oct 14, 2024 at 10:07 PM Ryan Roberts <ryan.roberts@arm.com> wrote:
>>
>> On 14/10/2024 14:54, Pingfan Liu wrote:
>>> Hello Ryan,
>>>
>>> On Mon, Oct 14, 2024 at 11:58:08AM +0100, Ryan Roberts wrote:
>>>> arm64 can support multiple base page sizes. Instead of selecting a page
>>>> size at compile time, as is done today, we will make it possible to
>>>> select the desired page size on the command line.
>>>>
>>>> In this case PAGE_SHIFT and it's derivatives, PAGE_SIZE and PAGE_MASK
>>>> (as well as a number of other macros related to or derived from
>>>> PAGE_SHIFT, but I'm not worrying about those yet), are no longer
>>>> compile-time constants. So the code base needs to cope with that.
>>>>
>>>> As a first step, introduce MIN and MAX variants of these macros, which
>>>> express the range of possible page sizes. These are always compile-time
>>>> constants and can be used in many places where PAGE_[SHIFT|SIZE|MASK]
>>>> were previously used where a compile-time constant is required.
>>>> (Subsequent patches will do that conversion work). When the arch/build
>>>> doesn't support boot-time page size selection, the MIN and MAX variants
>>>> are equal and everything resolves as it did previously.
>>>>
>>>
>>> MIN and MAX appear to construct a boundary, but it may be not enough.
>>> Please see the following comment inline.
>>>
>>>> Additionally, introduce DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() which wrap
>>>> global variable defintions so that for boot-time page size selection
>>>> builds, the variable being wrapped is initialized at boot-time, instead
>>>> of compile-time. This is done by defining a function to do the
>>>> assignment, which has the "constructor" attribute. Constructor is
>>>> preferred over initcall, because when compiling a module, the module is
>>>> limited to a single initcall but constructors are unlimited. For
>>>> built-in code, constructors are now called earlier to guarrantee that
>>>> the variables are initialized by the time they are used. Any arch that
>>>> wants to enable boot-time page size selection will need to select
>>>> CONFIG_CONSTRUCTORS.
>>>>
>>>> These new macros need to be available anywhere PAGE_SHIFT and friends
>>>> are available. Those are defined via asm/page.h (although some arches
>>>> have a sub-include that defines them). Unfortunately there is no
>>>> reliable asm-generic header we can easily piggy-back on, so let's define
>>>> a new one, pgtable-geometry.h, which we include near where each arch
>>>> defines PAGE_SHIFT. Ugh.
>>>>
>>>> -------
>>>>
>>>> Most of the problems that need to be solved over the next few patches
>>>> fall into these broad categories, which are all solved with the help of
>>>> these new macros:
>>>>
>>>> 1. Assignment of values derived from PAGE_SIZE in global variables
>>>>
>>>>   For boot-time page size builds, we must defer the initialization of
>>>>   these variables until boot-time, when the page size is known. See
>>>>   DEFINE_GLOBAL_PAGE_SIZE_VAR[_CONST]() as described above.
>>>>
>>>> 2. Define static storage in units related to PAGE_SIZE
>>>>
>>>>   This static storage will be defined according to PAGE_SIZE_MAX.
>>>>
>>>> 3. Define size of struct so that it is related to PAGE_SIZE
>>>>
>>>>   The struct often contains an array that is sized to fill the page. In
>>>>   this case, use a flexible array with dynamic allocation. In other
>>>>   cases, the struct fits exactly over a page, which is a header (e.g.
>>>>   swap file header). In this case, remove the padding, and manually
>>>>   determine the struct pointer within the page.
>>>>
>>>
>>> About two years ago, I tried to do similar thing in your series, but ran
>>> into problem at this point, or maybe not exactly as the point you list
>>> here. I consider this as the most challenged part.
>>>
>>> The scenario is
>>> struct X {
>>>       a[size_a];
>>>       b[size_b];
>>>       c;
>>> };
>>>
>>> Where size_a = f(PAGE_SHIFT), size_b=g(PAGE_SHIFT). One of f() and g()
>>> is proportional to PAGE_SHIFT, the other is inversely proportional.
>>>
>>> How can you fix the reference of X.a and X.b?
>>
>> If you need to allocate static memory, then in this scenario, assuming f() is
>> proportional and g() is inversely-proportional, then I guess you need
>> size_a=f(PAGE_SIZE_MAX) and size_b=g(PAGE_SIZE_MIN). Or if you can allocate the
> 
> My point is that such stuff can not be handled by scripts
> automatically and needs manual intervention.

Yes agreed. I spent some time thinking about how much of this could be automated
(i.e. with Cochinelle or otherwise), but concluded that it's very difficult. As
a result, all of the patches in this series are manually created.

> 
>> memory dynamically, then make a and b pointers to dynamically allocated buffers.
>>
> 
> This seems a better way out.
> 
>> Is there a specific place in the source where this pattern is used today? It
>> might be easier to discuss in the context of the code if so.
>>
> 
> No such code at hand. Just throw out the potential issue and be
> curious about it which frustrates me.
> I hope people can reach an agreement on it and turn this useful series
> into reality.

Yes, hope so!

> 
> Thanks,
> 
> Pingfan
> 


