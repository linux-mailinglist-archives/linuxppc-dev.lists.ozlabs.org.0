Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A8D2C4048
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:37:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0l91SBVzDqmY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:37:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzt03X4dzDqdm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:58:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsn1ZjRz9sSf; Wed, 25 Nov 2020 22:57:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
In-Reply-To: <20201111145322.15793-1-david@redhat.com>
References: <20201111145322.15793-1-david@redhat.com>
Subject: Re: [PATCH v2 0/8] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
Message-Id: <160630540587.2174375.206172001074703389.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:46 +1100 (AEDT)
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
Cc: Michal Hocko <mhocko@suse.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Nov 2020 15:53:14 +0100, David Hildenbrand wrote:
> Based on latest linux/master
> 
> powernv/memtrace is the only in-kernel user that rips out random memory
> it never added (doesn't own) in order to allocate memory without a
> linear mapping. Let's stop abusing memory hot(un)plug infrastructure for
> that - use alloc_contig_pages() for allocating memory and remove the
> linear mapping manually.
> 
> [...]

Applied to powerpc/next.

[1/8] powerpc/powernv/memtrace: Don't leak kernel memory to user space
      https://git.kernel.org/powerpc/c/c74cf7a3d59a21b290fe0468f5b470d0b8ee37df
[2/8] powerpc/powernv/memtrace: Fix crashing the kernel when enabling concurrently
      https://git.kernel.org/powerpc/c/d6718941a2767fb383e105d257d2105fe4f15f0e
[3/8] powerpc/mm: factor out creating/removing linear mapping
      https://git.kernel.org/powerpc/c/4abb1e5b63ac3281275315fc6b0cde0b9c2e2e42
[4/8] powerpc/mm: protect linear mapping modifications by a mutex
      https://git.kernel.org/powerpc/c/e5b2af044f31bf18defa557a8cd11c23caefa34c
[5/8] powerpc/mm: print warning in arch_remove_linear_mapping()
      https://git.kernel.org/powerpc/c/1f73ad3e8d755dbec52fcec98618a7ce4de12af2
[6/8] powerpc/book3s64/hash: Drop WARN_ON in hash__remove_section_mapping()
      https://git.kernel.org/powerpc/c/d8bd9a121c2f2bc8b36da930dc91b69fd2a705e2
[7/8] powerpc/mm: remove linear mapping if __add_pages() fails in arch_add_memory()
      https://git.kernel.org/powerpc/c/ca2c36cae9d48b180ea51259e35ab3d95d327df2
[8/8] powernv/memtrace: don't abuse memory hot(un)plug infrastructure for memory allocations
      https://git.kernel.org/powerpc/c/0bd4b96d99108b7ea9bac0573957483be7781d70

cheers
