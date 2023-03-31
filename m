Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 169306D13FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 02:26:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pnh0m00tTz3fST
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 11:26:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Aip2zx3i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pngzw4bl6z3cL8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 11:25:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Aip2zx3i;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pngzq3jNBz4xDp;
	Fri, 31 Mar 2023 11:25:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680222328;
	bh=IryaxfhF/Yu8DUfVEv0KgipT5BAJ/9tMkYoQyyLxF6U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Aip2zx3iDhkXq6NqWtDY+HltrHSZmUQdB11c7c89fIKPWRqWQEEIynfhnHz2ck8WF
	 359JBYgI6ZIuPaDDZzhCkh7wJ/pIROeoX8ARyX8ysA8shyHZT5JvHhR8ZXsdOXkZQk
	 RAlLZEGGG+9UFv8KXtYlNhK7Mp57mcBh5oEgSDoOSRfAk3IAYAZf03TmugBzRYtKMo
	 iaa2uwM28h9fOlmZVefWFxBTvctMLQZyJOd3u+i17AqhWccL3FLz50PwttPqAIvZir
	 TBxWE+z37fD3HlA+yls6PaDUEPY9DaUVLmBsw1adqwDg3DnWcLYmmhKL0OQ2MRi1xK
	 BMOnDuxrmRRGA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v8 0/7] Support page table check
In-Reply-To: <3D9F951A-5132-4EE8-8A28-A23F74306C8C@linux.ibm.com>
References: <20230215231153.2147454-1-rmclure@linux.ibm.com>
 <3D9F951A-5132-4EE8-8A28-A23F74306C8C@linux.ibm.com>
Date: Fri, 31 Mar 2023 11:25:22 +1100
Message-ID: <87r0t5bwct.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rohan McLure <rmclure@linux.ibm.com> writes:
> Anyone got time to review this one?

I was planning to pick it up, but it's going to conflict badly with the
set_ptes() series:

  https://lore.kernel.org/all/20230315051444.3229621-1-willy@infradead.org/

I thought that series was likely to go in soon, but I see it's still not
in linux-next.

Hopefully there'll be a v5 of that series soon and we can try and work
out the conflicts. I might need to create a topic branch, or have this
series go via -mm.

cheers


>> On 16 Feb 2023, at 10:11 am, Rohan McLure <rmclure@linux.ibm.com> wrote:
>> 
>> Support the page table check sanitiser on all PowerPC platforms. This
>> sanitiser works by serialising assignments, reassignments and clears of
>> page table entries at each level in order to ensure that anonymous
>> mappings have at most one writable consumer, and likewise that
>> file-backed mappings are not simultaneously also anonymous mappings.
>> 
>> In order to support this infrastructure, a number of stubs must be
>> defined for all powerpc platforms. Additionally, seperate set_pte_at
>> and set_pte, to allow for internal, uninstrumented mappings.
>> 
>> v8:
>> * Fix linux/page_table_check.h include in asm/pgtable.h breaking
>>   32-bit.
>> 
>> v7:
>> * Remove use of extern in set_pte prototypes
>> * Clean up pmdp_collapse_flush macro
>> * Replace set_pte_at with static inline function
>> * Fix commit message for patch 7
>> Link: https://lore.kernel.org/linuxppc-dev/20230215020155.1969194-1-rmclure@linux.ibm.com/
>> 
>> v6:
>> * Support huge pages and p{m,u}d accounting.
>> * Remove instrumentation from set_pte from kernel internal pages.
>> * 64s: Implement pmdp_collapse_flush in terms of __pmdp_collapse_flush
>>   as access to the mm_struct * is required.
>> Link: https://lore.kernel.org/linuxppc-dev/20230214015939.1853438-1-rmclure@linux.ibm.com/
>> 
>> v5:
>> Link: https://lore.kernel.org/linuxppc-dev/20221118002146.25979-1-rmclure@linux.ibm.com/
>> 
>> Rohan McLure (7):
>>  powerpc: mm: Separate set_pte, set_pte_at for internal, external use
>>  powerpc/64s: mm: Introduce __pmdp_collapse_flush with mm_struct
>>    argument
>>  powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
>>  powerpc: mm: Implement p{m,u,4}d_leaf on all platforms
>>  powerpc: mm: Add common pud_pfn stub for all platforms
>>  powerpc: mm: Add p{te,md,ud}_user_accessible_page helpers
>>  powerpc: mm: Support page table check
>> 
>> arch/powerpc/Kconfig                         |  1 +
>> arch/powerpc/include/asm/book3s/32/pgtable.h | 17 +++-
>> arch/powerpc/include/asm/book3s/64/pgtable.h | 85 +++++++++++++-------
>> arch/powerpc/include/asm/book3s/pgtable.h    |  3 +-
>> arch/powerpc/include/asm/nohash/32/pgtable.h | 12 ++-
>> arch/powerpc/include/asm/nohash/64/pgtable.h | 24 +++++-
>> arch/powerpc/include/asm/nohash/pgtable.h    |  9 ++-
>> arch/powerpc/include/asm/pgtable.h           | 60 +++++++++-----
>> arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +--
>> arch/powerpc/mm/book3s64/hash_pgtable.c      |  2 +-
>> arch/powerpc/mm/book3s64/pgtable.c           | 16 ++--
>> arch/powerpc/mm/book3s64/radix_pgtable.c     | 24 +++---
>> arch/powerpc/mm/nohash/book3e_pgtable.c      |  2 +-
>> arch/powerpc/mm/pgtable.c                    |  9 +--
>> arch/powerpc/mm/pgtable_32.c                 |  2 +-
>> arch/powerpc/mm/pgtable_64.c                 |  6 +-
>> arch/powerpc/xmon/xmon.c                     |  6 +-
>> 17 files changed, 197 insertions(+), 93 deletions(-)
>> 
>> -- 
>> 2.37.2
>> 
