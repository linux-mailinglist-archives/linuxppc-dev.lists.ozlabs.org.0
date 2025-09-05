Return-Path: <linuxppc-dev+bounces-11789-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF66B457A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 14:23:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJFqy4LpPz3c1C;
	Fri,  5 Sep 2025 22:23:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757075006;
	cv=none; b=lf0Phm0GCO65p9+tbp3vHpHpAv54akl5VC08u+gSHtDK82qAQcha05KqCV/5y0H4UnDxwi6T+bblhz8yicjFHyDOqrEiUnQY3hd2kqpHzA8kuq89AavPI6p0FiMvpLElF5LG9xl6MvPi82tVvxeyabQClrP2e5bvLGkht5zNkoSVDviAw37c53ROlmnrHfqyaQJy9NsqySQBHZ687HgT9WZb6vVf+86YiwLtDUPX4sP2go7uDOJZqGX7o8ALzQzH6+tWpiJDO8iM6KsIULhkNr8XOkyWTLhFlO0X+kOP+obgA2Of+1XBAYBP0uqG+DxebUAjjMY0RlKg+4e0/jS+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757075006; c=relaxed/relaxed;
	bh=ywmDAG7PE2fj1+B2GkU5RbYTyU3sAGy8lTlonC3Qgos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlPJjVCbecMaeyh3sMXubZbUyXMVMw/8uM4oZVa2ax7Kr/xEzYJa1PJOarRhUGKoxAKQ6JqkHaMth34BqpcISRrKGBsJTpTxuY25KOfkpZqoWewG+V4k0EZb85ilA4JMl8S+b3ZqyXFClGcVW7I4a/WobH+yy+NDHngakR2MTvcUcVjjSKD+5gcnaW4N2oRAli0b05uA0JUstp/Q/iK8cJRjFstDnYrjF/cYjzGBgMT8jqSwNElQ4ycqddauV51V8IgD4Y+Bf+nROp44o3B/ko8IPoyT29odK52HE/txpKXntjgtK1Aqb4lP2nt2FI4mH1hoSzcS6E/GU+Gzeb03QA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJFqx6vWNz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 22:23:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2012D153B;
	Fri,  5 Sep 2025 05:22:46 -0700 (PDT)
Received: from [10.57.60.42] (unknown [10.57.60.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7BF93F63F;
	Fri,  5 Sep 2025 05:22:48 -0700 (PDT)
Message-ID: <a18f9cbd-490d-4270-8707-4ed6d730cfcd@arm.com>
Date: Fri, 5 Sep 2025 14:22:46 +0200
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
Subject: Re: [PATCH 2/7] mm: introduce local state for lazy_mmu sections
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
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-3-kevin.brodsky@arm.com>
 <22131943-3f92-4f5a-be28-7b668c07a25c@lucifer.local>
 <75db1f58-98b3-463c-af4f-2ce9878cba9f@arm.com>
 <2aed0b3b-1a70-4c89-9177-8de4fabb2237@lucifer.local>
 <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <e6072568-1b98-4a7f-8d30-65417a440bb7@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 05/09/2025 13:37, Lorenzo Stoakes wrote:
> On Fri, Sep 05, 2025 at 12:21:40PM +0100, Lorenzo Stoakes wrote:
>> You should really base on mm-new.
>>
>> You need to account for everything that is potentially going to go
>> upstream. mm-stable is generally not actually populated all too well until
>> shortly before merge window anyway.
> Just to note that mm-unstable is also fine. Despite its name, it's substantially
> more stable than mm-new, which can even break the build and appears to have no
> checks performed on it at all.

Thanks for the overview - I had a general idea about those branches but
I wasn't sure what the standard practice was. I'll rebase on mm-unstable
to start with.

- Kevin

