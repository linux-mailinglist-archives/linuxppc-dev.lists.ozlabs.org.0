Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B612C4021
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:29:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0ZD1wtJzDqP5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:29:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzsr0kQszDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:57:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsk2GfRz9sVY; Wed, 25 Nov 2020 22:57:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>
In-Reply-To: <20201029162718.29910-1-david@redhat.com>
References: <20201029162718.29910-1-david@redhat.com>
Subject: Re: [PATCH v1 0/4] powernv/memtrace: don't abuse memory hot(un)plug
 infrastructure for memory allocations
Message-Id: <160630540200.2174375.9298673276341715348.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:45 +1100 (AEDT)
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
 Wei Yang <richard.weiyang@linux.alibaba.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Oct 2020 17:27:14 +0100, David Hildenbrand wrote:
> powernv/memtrace is the only in-kernel user that rips out random memory
> it never added (doesn't own) in order to allocate memory without a
> linear mapping. Let's stop abusing memory hot(un)plug infrastructure for
> that - use alloc_contig_pages() for allocating memory and remove the
> linear mapping manually.
> 
> The original idea was discussed in:
>  https://lkml.kernel.org/r/48340e96-7e6b-736f-9e23-d3111b915b6e@redhat.com
> 
> [...]

Applied to powerpc/next.

[1/4] powerpc/mm: factor out creating/removing linear mapping
      https://git.kernel.org/powerpc/c/4abb1e5b63ac3281275315fc6b0cde0b9c2e2e42
[2/4] powerpc/mm: print warning in arch_remove_linear_mapping()
      https://git.kernel.org/powerpc/c/1f73ad3e8d755dbec52fcec98618a7ce4de12af2
[3/4] powerpc/mm: remove linear mapping if __add_pages() fails in arch_add_memory()
      https://git.kernel.org/powerpc/c/ca2c36cae9d48b180ea51259e35ab3d95d327df2
[4/4] powernv/memtrace: don't abuse memory hot(un)plug infrastructure for memory allocations
      https://git.kernel.org/powerpc/c/0bd4b96d99108b7ea9bac0573957483be7781d70

cheers
