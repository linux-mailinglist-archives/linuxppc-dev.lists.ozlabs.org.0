Return-Path: <linuxppc-dev+bounces-9525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 326EAAE0018
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 10:42:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNDd56Ycbz2yPd;
	Thu, 19 Jun 2025 18:42:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750322553;
	cv=none; b=fYHrQmy5IQMIE/rrk+3a7fsnCa/bvNpWRwN7IlobvxwyuS3EkqrqWvnW0YC45SqH4mgKll5Gn1cKhkJpSZeXZrUnACKuWuvEWGz2c886XyQ7gYEcuxeISSfvRZne4v+0PHMihRKmOQHFTJBgjinUJANhmNt4LAuH5+DEZIgPUEEPZNl8u8LITZc9pJMvUgxL/dYNmZGqB0wbMrhRhBjzEN/YXhpyZ9nxUKI68dYNpk8lSOC6b1X125ERDLZ3E9RZvGss+roWUpMZkMoPdp67cIFfIoS1mkdmJy7dKWVzt6YBH/2NwG7DGjp5jE8skkGCUHBoQRqKnux8Weep6Q558A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750322553; c=relaxed/relaxed;
	bh=kWumWeDPcZU7fhri+6IT3usAKUMUHf511Di79l7CmcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxfx+O9rDpR77GCdErTqdSKvDYi1pCXuqlXmdpjkxDStq7b7C8rEBHWCks9eeHSX6k+qusEm2Ckttxh6DCrJb+/k5EBM2vJAMJc+aXC6ZPL7aBDQ2PW6lAhVHw6t3NIjrvH8ZRHGP7d65qDpS0h4pPzKQvahNr0VrRihR5X+6KWRDJT9BTsdd0Ogp6DfJyoxm5pTzN9jh/8euqMOj4VBlg4bdOQsl3bU1P68yTil6nSRSdb/j161oyJm92+KnCWVISdktEZt2w8hVTg9zpb4CSBIq41MOgIKBflzCmJC2FTp4KGgcjF39SdWabM0HopVhmUamHiRDF9zEOeWq6ujSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SErdEUma; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SErdEUma;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNDd518kBz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 18:42:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65EE85C64CA;
	Thu, 19 Jun 2025 08:40:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04FBBC4CEEA;
	Thu, 19 Jun 2025 08:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750322549;
	bh=3VFuG2FOQta3qfo/tXfeyceWpM2CtNcoqXoxG/UtwWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SErdEUmaRiXUtAdabhdTNYYV8q5kEViKHeMvbdP07i8SdJqnyGDweje7/hf5ob2r1
	 Y7GakfurOZd/kO55Uuejfbjb1S87B2AsLMEOZS16N3PqMiLkRzq0uK6SYLU7qgvTU/
	 SVw+UbeIJFOnBUY3xSh5j8mzLsb/i9WbBp9W6Nyzn5AswOiCpHExDyjKEa4xghVxhq
	 qVMVSR8Ah8c9+Gp0UD1wpCI2KA3aEvgMXWU2aB9vqWItkHQLyOH3Ng4vCX7N4MSO38
	 GNkOCm/RoBAbDnsH25JuklGSA+93rTqS16MvDDHIq0NGhvg1unBUyT6Up6WtuKaRQA
	 0XljRO/7NmUxw==
Date: Thu, 19 Jun 2025 10:42:14 +0200
From: Christian Brauner <brauner@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S . Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H . Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Barry Song <baohua@kernel.org>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Hugh Dickins <hughd@google.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Dan Williams <dan.j.williams@intel.com>, 
	Matthew Wilcox <willy@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] mm: change vm_get_page_prot() to accept vm_flags_t
 argument
Message-ID: <20250619-unwiederholbar-addition-6875c99fe08d@brauner>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <a12769720a2743f235643b158c4f4f0a9911daf0.1750274467.git.lorenzo.stoakes@oracle.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a12769720a2743f235643b158c4f4f0a9911daf0.1750274467.git.lorenzo.stoakes@oracle.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 08:42:52PM +0100, Lorenzo Stoakes wrote:
> We abstract the type of the VMA flags to vm_flags_t, however in may places
> it is simply assumed this is unsigned long, which is simply incorrect.
> 
> At the moment this is simply an incongruity, however in future we plan to
> change this type and therefore this change is a critical requirement for
> doing so.
> 
> Overall, this patch does not introduce any functional change.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  arch/arm64/mm/mmap.c                       | 2 +-
>  arch/powerpc/include/asm/book3s/64/pkeys.h | 3 ++-
>  arch/sparc/mm/init_64.c                    | 2 +-
>  arch/x86/mm/pgprot.c                       | 2 +-
>  include/linux/mm.h                         | 4 ++--
>  include/linux/pgtable.h                    | 2 +-
>  tools/testing/vma/vma_internal.h           | 2 +-
>  7 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index c86c348857c4..08ee177432c2 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -81,7 +81,7 @@ static int __init adjust_protection_map(void)
>  }
>  arch_initcall(adjust_protection_map);
>  
> -pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
>  {
>  	ptdesc_t prot;
>  
> diff --git a/arch/powerpc/include/asm/book3s/64/pkeys.h b/arch/powerpc/include/asm/book3s/64/pkeys.h
> index 5b178139f3c0..6f2075636591 100644
> --- a/arch/powerpc/include/asm/book3s/64/pkeys.h
> +++ b/arch/powerpc/include/asm/book3s/64/pkeys.h
> @@ -4,8 +4,9 @@
>  #define _ASM_POWERPC_BOOK3S_64_PKEYS_H
>  
>  #include <asm/book3s/64/hash-pkey.h>
> +#include <linux/mm_types.h>
>  
> -static inline u64 vmflag_to_pte_pkey_bits(u64 vm_flags)
> +static inline u64 vmflag_to_pte_pkey_bits(vm_flags_t vm_flags)

If you change vm_flags_t to u64 you probably want to compile with some
of these integer truncation options when you're doing the conversion.
Because otherwise you risk silently truncating the upper 32bits when
assigning to a 32bit variable. We've had had a patch series that almost
introduced a very subtle bug when it tried to add the first flag outside
the 32bit range in the lookup code a while ago. That series never made
it but it just popped back into my head when I read your series.

Acked-by: Christian Brauner <brauner@kernel.org>

