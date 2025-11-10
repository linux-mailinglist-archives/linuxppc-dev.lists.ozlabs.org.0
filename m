Return-Path: <linuxppc-dev+bounces-13998-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B232C45F87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:38:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mNH0GDBz2ynC;
	Mon, 10 Nov 2025 21:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762771102;
	cv=none; b=fzy0V3rLVG/QPi74bLweZ5nKDldjg/B5j1R9OBSiUIKwFQFALNwVTQgvuCP85E829uPD1JEc7HGWOWRinTF6WRgJOQNbZr+PYqNiDmJ+A3YAmOQPfBjkJkwYVYL/opFDmh9W03j+EmLemHCX7ifCk89VpC3oK/aHnzM4zN8eYqkL/3qsbqI+8pSjLup6J2CfkqSnVCFmg19QltziuBB+ti/hUYD/AzgtGZvk2QkDpgyuS2Te3fCzNix4DOVxi62JlR55dIKqGNMN37EnZk19qak9nGQ38GhnnwhFbKJMh7oD2T1UqTSYuy1J9BCE0vvMNFMIXWGTvJftBiyZ7Xvj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762771102; c=relaxed/relaxed;
	bh=hPCgPoE70BetgCqXoAumCGOuKiFkJIVELItuY0uabRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z6EmggGDnX+it7/FmvHqEzyYQiJePvYt+copeTMTa5Ecgu/RYuo21F4srqnwjdwtqka16skMcjjG0PHdUkFu/FpLWr7+z3SZ7/z27L1HT8Ruj2n52LS+BALXnK47pqsXFWAkdOiC9DLTLC5ppvPhc0Kwm+mgKw9g3lExQiZRMBL9UISeAl3Cif23A88dsssuoOCdq1dFI6eL4b6Z4/SOOl2qKR8UKqhJP1BmNH8hDlkKaCIdyG8KC5d7K2u9M5yj0+0KVgtEWRVhnqhEp48ZS6mXqMSJhDAsX2K6DKLSfnXv7BYHPdk8y2qD/86l/yw0c/ZmA0cJhO0iao3aaB6OMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mNG2xVlz2xql
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:38:22 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4A3CFEC;
	Mon, 10 Nov 2025 02:37:43 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EB953F66E;
	Mon, 10 Nov 2025 02:37:43 -0800 (PST)
Message-ID: <0d00dd6e-9e39-4ac6-8ea4-9407e75947eb@arm.com>
Date: Mon, 10 Nov 2025 11:37:41 +0100
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
Subject: Re: [PATCH v4 05/12] mm: introduce CONFIG_ARCH_HAS_LAZY_MMU_MODE
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
 <20251029100909.3381140-6-kevin.brodsky@arm.com>
 <6a9c846f-22b6-4d5f-81dc-6cdcd4905952@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <6a9c846f-22b6-4d5f-81dc-6cdcd4905952@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 07/11/2025 13:56, Ryan Roberts wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 6663ffd23f25..e6bf5c7311b5 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -122,6 +122,7 @@ config ARM64
>>  	select ARCH_WANTS_NO_INSTR
>>  	select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
>>  	select ARCH_HAS_UBSAN
>> +	select ARCH_HAS_LAZY_MMU_MODE
> nit: This list is mostly in alphabetical order. Further up the list there are a
> lot of ARCH_HAS_* entries. Perhaps move it to the correct position in that lot?
> Then ARCH_HAS_UBSAN stays out of order on its own.

That's fair, it does look like it's mostly in order apart from
ARCH_HAS_UBSAN. Will move it further up.

- Kevin

