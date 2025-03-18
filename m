Return-Path: <linuxppc-dev+bounces-7177-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB0A67392
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 13:15:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH9lF5pW3z2yrh;
	Tue, 18 Mar 2025 23:15:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742300105;
	cv=none; b=kc/UzgSYCptuhVtb0EofEDjLsqaxz9r2vEvl9XQw2hgXZp8sWtXICv5PQkTbNsz6/DC5LDbQzJlx8ydNp+f1dDOz+7pg25F7CqqmEaUasLphHZJpeRagm8W43W4KpyQ5JIfm91gWRopqTdq/mz4u+el9Mz+EcLKeoAIayh8w3Oe6UQDd3WD0PcSVghZT/6Av6WUgv1/8S3Fb81eFcO3LVbz5WM/mxh/uSwUuJi02O3bY4se5oEsM/Cdk5DVVdi1PFm4BT6ggyoEhAdC/qyEPg4aQeXKSjI2AyUHrMGMp+871gN4mc0p5jy1c+swRcDwh3BDU4O9puyRPfDFcXarBXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742300105; c=relaxed/relaxed;
	bh=64IIiCxSmb90ZQ6fmueb4xJ3WQaFIC2OATzJjR0a98k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eorIabn2gjxjzqJBPgIx+JimPKIj9le32+pZq5oqNe9IA8kagCd0pIq91FGWHF8jSrkZDid9035VTIYqBq43kJzELJbu7wR1wLyguhyRmjIqbJDJKThc8fZWUkckhipZ4XIIF/IB1tXTxNsZ+SIf3lDDLJ3tNnCJnF5M0qzZ8eFJGpEDI62cQZKUnTHoK6NSqLMHrsNDqJ17Bld879vlPcaMr2d7/H4dm8jlD70Tlj5GJdTK/1il+RmmV6cyOBG4IvuCMzOb3Nf4nSy25v6xjq5jUVhDGyXCA81dZDFvAOfmwDZj/5Ih7lAbdbW3jENIzw5hALqxfdRP3znC/4z6eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=kevin.brodsky@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH9lD50B6z2yrc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 23:15:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E278013D5;
	Tue, 18 Mar 2025 05:14:38 -0700 (PDT)
Received: from [10.57.85.104] (unknown [10.57.85.104])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7AF4D3F673;
	Tue, 18 Mar 2025 05:14:22 -0700 (PDT)
Message-ID: <e79f9aa9-ce1b-4d42-8a61-aebaae1744fc@arm.com>
Date: Tue, 18 Mar 2025 13:14:18 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Always call constructor for kernel page tables
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Will Deacon <will@kernel.org>,
 Yang Shi <yang@os.amperecomputing.com>, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20250317141700.3701581-1-kevin.brodsky@arm.com>
 <70349335-84ee-4bca-a3d6-d7cf3c05b92b@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <70349335-84ee-4bca-a3d6-d7cf3c05b92b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/03/2025 16:30, Ryan Roberts wrote:
> On 17/03/2025 14:16, Kevin Brodsky wrote:
>> The complications in those special pgtable allocators beg the question:
>> does it really make sense to treat efi_mm and init_mm differently in
>> e.g. apply_to_pte_range()? Maybe what we really need is a way to tell if
>> an mm corresponds to user memory or not, and never use split locks for
>> non-user mm's. Feedback and suggestions welcome!
> The difference in treatment is whether or not the ptl is taken, right? So the
> real question is when calling apply_to_pte_range() for efi_mm, is there already
> a higher level serialization mechanism that prevents racy accesses? For init_mm,
> I think this is handled implicitly because there is no way for user space to
> cause apply_to_pte_range() for an arbitrary piece of kernel memory. Although I
> can't even see where apply_to_page_range() is called for efi_mm.

The commit I mentioned above, 61444cde9170 ("ARM: 8591/1: mm: use fully
constructed struct pages for EFI pgd allocations"), shows that
apply_to_page_range() is called from efi_set_mapping_permissions(), and
this indeed hasn't changed. It is itself called from efi_virtmap_init().
I would expect that no locking at all is necessary here, since the
mapping has just been created and surely isn't used yet. Now the
question is where exactly init_mm is special-cased in this manner. I can
see that walk_page_range() does something similar, there may be more
cases. And the other question is whether those functions are ever used
on special mm's, aside from efi_set_mapping_permissions().
> FWIW, contpte.c has mm_is_user() which is used by arm64.

Interesting! But not pretty, that's basically checking that the mm is
not &init_mm or &efi_mm... which wouldn't work for a generic
implementation. It feels like adding some attribute to mm_struct
wouldn't hurt. It looks like we've run out of MMF_* flags though :/

- Kevin

