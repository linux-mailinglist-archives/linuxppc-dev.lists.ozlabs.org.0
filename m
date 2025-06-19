Return-Path: <linuxppc-dev+bounces-9518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A32ADFD2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 07:48:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bN8lx4ND0z2xRs;
	Thu, 19 Jun 2025 15:48:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750312093;
	cv=none; b=Bb7Ekm7R4Hn6HQZE/ev75ikHGFFIfIdbOv4QAhtFlA4dyIGnM2zKj9UJk/ickZdXJRxZoVzAlKQJtSfy6oo+Z4YIFtLGew0T5HeDWarIpkZHKwVu9aiCgBAyHbqLCjgAJs6AbVX033FqewL1C1i5jrdeXETVI0oGRGFZgfIL+yE1yddiEvz2BXH/1r3++GTeDt85qYVRPlckKyB+tkuFB6RD9tl0uT815vP96K00klIAX7GUMOLulUEsg7f/c8MbjpBBlDeTYxLyshuump+XBkMJMpHBqutF0oKJy97JcldgBTYUMCbhXynaEwURS6jcPMfXYQl240tMjO+p4ivQ3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750312093; c=relaxed/relaxed;
	bh=wiINCdMehZMum17SdacCo/Mcez/8aysjKMpzrYn8xpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZBOZH7EnqIqYGVgOWKSwjUfF790GwMcSvAExnLsU1kU0sJLFrul+zc5JqvoJYhoyZwDmIJkrza/8ntWbQCd4usiJfO5htMWzk6r3hEFuDaFYByaRxnP/2Jovr42NmLwcv2rFlYyjBSVqGWBjNL0qhkF0Pk3+HBGAqpPAdgTYO/Dj/+CqdnUlbYfHZkgu/nNmAKL9LB2dpbK69qYo3aflrY5GStLMyDm/a6GNw4cBwsFL2D6t6LFDrrJ+TF1kzhbgutR8yM0Lr3sj3w7DA+Zs7/+ycmWJvNwgDmAp7Fdw5h36GDVjC33xM2SSxH0+PHMTI+UNBkDYI0YjBTtZmUH+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IjXP7rVJ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IjXP7rVJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bN8lw2SWGz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 15:48:12 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 438AC5C18B4;
	Thu, 19 Jun 2025 05:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCB9C4CEEA;
	Thu, 19 Jun 2025 05:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750312088;
	bh=naO5r0xMIhdjbn0oOa+SVmj9KjDZ5worxHK7bSVntUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjXP7rVJ7AZnRuppJyLrpp5E8Fh+t+2oljLVnWBBBSn/d1vR0eGIWRYGA9tuTPZxk
	 1WjJMU7H0LqXwDq8R0BlorxkYnEHHHlDMoVIzC4TN0b7sC1cULh3G+MWJHwVH7xkz9
	 tCPMfdyKM5V0i4bvNc7Nmlusq60gK1you1vNrbR0OMNiLtHUI3nfQN0juBAxkHM6/o
	 ts+aKMfmoW7KUXQXeNQG3kObJpnfs/6SAEy+ZvEIdSUbOESxfPgslyESbzwTawbWW0
	 0p+BbIlpITQh6XRqByB/6dGMmYRgJ3In9Qc8ufkd7ZoKCLwjJIVuYBHy37Sjo6Og4z
	 FW+uh64HrHsSA==
Date: Thu, 19 Jun 2025 08:47:46 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] use vm_flags_t consistently
Message-ID: <aFOkguMF3QJpr4VA@kernel.org>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 08:42:51PM +0100, Lorenzo Stoakes wrote:
> The VMA flags field vma->vm_flags is of type vm_flags_t. Right now this is
> exactly equivalent to unsigned long, but it should not be assumed to be.
> 
> Much code that references vma->vm_flags already correctly uses vm_flags_t,
> but a fairly large chunk of code simply uses unsigned long and assumes that
> the two are equivalent.
> 
> This series corrects that and has us use vm_flags_t consistently.
> 
> This series is motivated by the desire to, in a future series, adjust
> vm_flags_t to be a u64 regardless of whether the kernel is 32-bit or 64-bit
> in order to deal with the VMA flag exhaustion issue and avoid all the
> various problems that arise from it (being unable to use certain features
> in 32-bit, being unable to add new flags except for 64-bit, etc.)
> 
> This is therefore a critical first step towards that goal. At any rate,
> using the correct type is of value regardless.
> 
> We additionally take the opportunity to refer to VMA flags as vm_flags
> where possible to make clear what we're referring to.
> 
> Overall, this series does not introduce any functional change.
> 
> Lorenzo Stoakes (3):
>   mm: change vm_get_page_prot() to accept vm_flags_t argument
>   mm: update core kernel code to use vm_flags_t consistently
>   mm: update architecture and driver code to use vm_flags_t

For the series

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
 
>  arch/arm/mm/fault.c                        |   2 +-
>  arch/arm64/include/asm/mman.h              |  10 +-
>  arch/arm64/mm/fault.c                      |   2 +-
>  arch/arm64/mm/mmap.c                       |   2 +-
>  arch/arm64/mm/mmu.c                        |   2 +-
>  arch/powerpc/include/asm/book3s/64/pkeys.h |   3 +-
>  arch/powerpc/include/asm/mman.h            |   2 +-
>  arch/powerpc/include/asm/pkeys.h           |   4 +-
>  arch/powerpc/kvm/book3s_hv_uvmem.c         |   2 +-
>  arch/sparc/include/asm/mman.h              |   4 +-
>  arch/sparc/mm/init_64.c                    |   2 +-
>  arch/x86/kernel/cpu/sgx/encl.c             |   8 +-
>  arch/x86/kernel/cpu/sgx/encl.h             |   2 +-
>  arch/x86/mm/pgprot.c                       |   2 +-
>  fs/exec.c                                  |   2 +-
>  fs/userfaultfd.c                           |   2 +-
>  include/linux/coredump.h                   |   2 +-
>  include/linux/huge_mm.h                    |  12 +-
>  include/linux/khugepaged.h                 |   4 +-
>  include/linux/ksm.h                        |   4 +-
>  include/linux/memfd.h                      |   4 +-
>  include/linux/mm.h                         |  10 +-
>  include/linux/mm_types.h                   |   2 +-
>  include/linux/mman.h                       |   4 +-
>  include/linux/pgtable.h                    |   2 +-
>  include/linux/rmap.h                       |   4 +-
>  include/linux/userfaultfd_k.h              |   4 +-
>  include/trace/events/fs_dax.h              |   6 +-
>  mm/debug.c                                 |   2 +-
>  mm/execmem.c                               |   8 +-
>  mm/filemap.c                               |   2 +-
>  mm/gup.c                                   |   2 +-
>  mm/huge_memory.c                           |   2 +-
>  mm/hugetlb.c                               |   4 +-
>  mm/internal.h                              |   4 +-
>  mm/khugepaged.c                            |   4 +-
>  mm/ksm.c                                   |   2 +-
>  mm/madvise.c                               |   4 +-
>  mm/mapping_dirty_helpers.c                 |   2 +-
>  mm/memfd.c                                 |   8 +-
>  mm/memory.c                                |   4 +-
>  mm/mmap.c                                  |  16 +-
>  mm/mprotect.c                              |   8 +-
>  mm/mremap.c                                |   2 +-
>  mm/nommu.c                                 |  12 +-
>  mm/rmap.c                                  |   4 +-
>  mm/shmem.c                                 |   6 +-
>  mm/userfaultfd.c                           |  14 +-
>  mm/vma.c                                   |  78 +++---
>  mm/vma.h                                   |  16 +-
>  mm/vmscan.c                                |   4 +-
>  tools/testing/vma/vma.c                    | 266 ++++++++++-----------
>  tools/testing/vma/vma_internal.h           |  12 +-
>  53 files changed, 298 insertions(+), 297 deletions(-)
> 
> --
> 2.49.0

-- 
Sincerely yours,
Mike.

