Return-Path: <linuxppc-dev+bounces-7148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D969A655B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 16:31:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGf8M1r1cz2yqh;
	Tue, 18 Mar 2025 02:31:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742225491;
	cv=none; b=a9JmJNq/6sWn/PyrKsB3GdBahl6OwcRz0PAKmKmgGtU71+CVgDX7T6NFVS7KOCASpMVq5XpF+AqKX4VjRyZYvTvHIsVaqpfThc7QVNi0rTeJV8FhVo1beX/3I+Lygg+uK+o/QoEOxaHR6mzGR1Y/O0dwW6I9Kj9Luieaj6ze4MntkkpHJJug2sDFa5k5cCqTolkGJl3sXAsruIe33DAeZeKsWkzYEmh/fposlKH8UlHxKZJc26KpgljltQqP1fYcuWfeI8HQtq8Sh7JT9ZZg+qfMJfo9c5gu27HppeY//fjbxqbgBBSD6tZLsd/ioOiTX5J4SSW4rT7JiqO8MW+zyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742225491; c=relaxed/relaxed;
	bh=E28zglszNSgNs5nxBqGH9ihoTQywx6FCChBvwXjU3Lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lq51jknEjTUywHtaIv1SU8jQV7bs6qj99G3zi2oUGR5XWMn7+S/PzgGqnenqkiQ9HEqCFWef3hX5cbZFNbWWEFWSlZJGKmJAaXs/S+1IUjwAflumAX5Honb/JY0Qcto3875eKliif/2xNXx34zRVVylc8CkTOUoDvPR2+He7mA5IcjPrOhzN+lsBfXQzpyGDYWOn6d0yplPHAsU5j4ByAiaDOXHdZGtXzqOC9OCfGMzQgGQsA70BSWMbb6vMbs/KwcCvxbFa/wVjkjV7So1D77GHLEIrCST574TncCoOt6l9WRp7Mhl5QHvDpnA2tycPKNEAAIcpLhHbvH93VNTEdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGf8L0mSsz2yqc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 02:31:27 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3164013D5;
	Mon, 17 Mar 2025 08:31:03 -0700 (PDT)
Received: from [10.57.84.137] (unknown [10.57.84.137])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 421503F694;
	Mon, 17 Mar 2025 08:30:49 -0700 (PDT)
Message-ID: <70349335-84ee-4bca-a3d6-d7cf3c05b92b@arm.com>
Date: Mon, 17 Mar 2025 15:30:47 +0000
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
Content-Language: en-GB
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250317141700.3701581-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 17/03/2025 14:16, Kevin Brodsky wrote:
> The complications in those special pgtable allocators beg the question:
> does it really make sense to treat efi_mm and init_mm differently in
> e.g. apply_to_pte_range()? Maybe what we really need is a way to tell if
> an mm corresponds to user memory or not, and never use split locks for
> non-user mm's. Feedback and suggestions welcome!

The difference in treatment is whether or not the ptl is taken, right? So the
real question is when calling apply_to_pte_range() for efi_mm, is there already
a higher level serialization mechanism that prevents racy accesses? For init_mm,
I think this is handled implicitly because there is no way for user space to
cause apply_to_pte_range() for an arbitrary piece of kernel memory. Although I
can't even see where apply_to_page_range() is called for efi_mm.

FWIW, contpte.c has mm_is_user() which is used by arm64.

Thanks,
Ryan

