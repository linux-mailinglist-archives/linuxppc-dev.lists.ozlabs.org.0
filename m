Return-Path: <linuxppc-dev+bounces-9688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5486AE750A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 04:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRmg667m6z306l;
	Wed, 25 Jun 2025 12:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750820194;
	cv=none; b=YTnbg4eCSEIDKAJmuq8mnkYKRvGftthxD0HH8iyVckcB9+FG4r6VxZuPbOmioK0YzG0PUp+1DZwkW6C1TSIDdGRBkk15FDpVuwKwmFk4q/4O5KLrcIrKZFho64IsHv1xne3JLfw4tde26ExCYXQ9KMOkb/rDNGlRJdFCUO8NMWa3HgpFWdwG2j6+5+8bE3hIH7kq4DhbxEmysU81MlK6vlZLYPRykTe33F/3CZqOsvOL5ta+MKugx/HNljd6+dyLKFTh4ncPuEuzERyFTj7aY0wWv8ZrwACNrh6tTYOP+kti298TLfJ/+8aEelq52uEm829MAomSwhG0V6j7BG7+rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750820194; c=relaxed/relaxed;
	bh=U4nww4WL9T32a7ZYJHYVCUEcWr1E4iYoP8eQnSaP0s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EN2N+0N/DueQbPpn3z/Y+1sxFsN37zYFmk9r942Sf1J94zE8nX5hKS/TKRuo2ZCF1fzfA3jrijEcJE/zfdauYqOFsrqH/5KQgZr8Xul8tj6p57C1HbPJsHApr9rca6IjEtRrRhIKh2qnkLs2JvsvUkU+JfOLljHw5Dm6pLrLh5LrF8EjqWN86MHmZGjmnV71WsubTwM8cxE7jRApZ9Panq8kMTLVn+rfFuplBX1g5Z/4kjoQz+k10xD2/DzAwCwmXs9PMolTjditRzml+pYcDZ8RoBM+MY9MwggBLNJLTVN7KzUHcC6noWKS1tFNWpQg18YYD3aUOArpmDYOLgLxZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRmg453g0z2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 12:56:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 487D6113E;
	Tue, 24 Jun 2025 19:55:40 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F6A63F58B;
	Tue, 24 Jun 2025 19:55:38 -0700 (PDT)
Message-ID: <46432a2e-1a9d-44f7-aa09-689d6e2a022a@arm.com>
Date: Wed, 25 Jun 2025 08:25:35 +0530
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
Subject: Re: [PATCH 0/3] use vm_flags_t consistently
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Jarkko Sakkinen <jarkko@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Dan Williams <dan.j.williams@intel.com>,
 Matthew Wilcox <willy@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19/06/25 1:12 AM, Lorenzo Stoakes wrote:
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

Hello Lorenzo,

Just wondering which tree-branch this series applies ? Tried all the usual
ones but could not apply the series cleanly.

v6.16-rc3
next-20250624
mm-stable
mm-unstable

b4 am cover.1750274467.git.lorenzo.stoakes@oracle.com
git am ./20250618_lorenzo_stoakes_use_vm_flags_t_consistently.mbx

- Anshuman

