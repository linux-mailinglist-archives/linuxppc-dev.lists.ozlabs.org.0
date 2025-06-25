Return-Path: <linuxppc-dev+bounces-9691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC001AE7686
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 07:56:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRrf83PD0z306l;
	Wed, 25 Jun 2025 15:56:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750830960;
	cv=none; b=SbExmJBW2GAhXJggYgiK3Hr7hD1zqPu2WiDgB0re8S2EAKwLhWnZG7QcC1hftAiV/JsmI8xrV7cO7ETel6ugna/NoYAGKLYExbYcCsUhLrcFvYEjY/kPGpBCSYTgn4d3S8SXwVHMS8+cxZq44k1fUinWytv9kB8l6QHdG+aBj5lvL0pJGlMBuoNXcd/2JYty5YaFCgpzjPzWovzzZgm1QBJlhtx5dQw+WcoYYoAaWL4uK6pyaCSC3Ot7hVs/egdA469Z4vrtjZdR03uFuH1kJf1XKQTE7gCiQneytJiqDQQcX6CuEhGfOqBuFZL4Vm/VDAV0snKJRhJgdU+CIDuTTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750830960; c=relaxed/relaxed;
	bh=PA3fGW6ukN+Hp5G4+kZyCeSvOHsAjH6ajGYjs57FIzU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ysk3qalU7q6gvd4CkCidovwlDT9LKlDUqxOA5avSUEZWTgtYy6jzllWnVFPTV21vhadDnMERQcsmYf50+tFJfa9lB85jWaxjTPvP+7gY05gvwcPoq1vPU1R0aoRlDSL6ZWMQY6HRmFsYneN7pzr43sKEhbOzo89SyAMTUshv+ZOOr7I6ZOtY4YassF8tZxJr4K/FQWpJWOQIG79RRauktHl3Devo8Yoy6gO2SXP69zy9xjjBTGPk066raZxa+6T7H9uhIeErL+PUbTcwaM2/nUOxifiSs/CjgS3i6+20g7X6ry1lLZjCu0eIkys3w/ZyrYPMsP3LUevwc5D5e5KV+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRrf71sRkz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 15:55:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 486791063;
	Tue, 24 Jun 2025 22:55:06 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2270F3F63F;
	Tue, 24 Jun 2025 22:55:04 -0700 (PDT)
Message-ID: <1a87887f-7c50-4412-91db-a5b4cf90e6db@arm.com>
Date: Wed, 25 Jun 2025 11:25:01 +0530
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
Subject: Re: [PATCH 1/3] mm: change vm_get_page_prot() to accept vm_flags_t
 argument
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
 <a12769720a2743f235643b158c4f4f0a9911daf0.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <a12769720a2743f235643b158c4f4f0a9911daf0.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 19/06/25 1:12 AM, Lorenzo Stoakes wrote:
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
>  {
>  	if (!mmu_has_feature(MMU_FTR_PKEY))
>  		return 0x0UL;
> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
> index 25ae4c897aae..7ed58bf3aaca 100644
> --- a/arch/sparc/mm/init_64.c
> +++ b/arch/sparc/mm/init_64.c
> @@ -3201,7 +3201,7 @@ void copy_highpage(struct page *to, struct page *from)
>  }
>  EXPORT_SYMBOL(copy_highpage);
>  
> -pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
>  {
>  	unsigned long prot = pgprot_val(protection_map[vm_flags &
>  					(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> diff --git a/arch/x86/mm/pgprot.c b/arch/x86/mm/pgprot.c
> index c84bd9540b16..dc1afd5c839d 100644
> --- a/arch/x86/mm/pgprot.c
> +++ b/arch/x86/mm/pgprot.c
> @@ -32,7 +32,7 @@ void add_encrypt_protection_map(void)
>  		protection_map[i] = pgprot_encrypted(protection_map[i]);
>  }
>  
> -pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
>  {
>  	unsigned long val = pgprot_val(protection_map[vm_flags &
>  				      (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 98a606908307..7a7cd2e1b2af 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3487,10 +3487,10 @@ static inline bool range_in_vma(struct vm_area_struct *vma,
>  }
>  
>  #ifdef CONFIG_MMU
> -pgprot_t vm_get_page_prot(unsigned long vm_flags);
> +pgprot_t vm_get_page_prot(vm_flags_t vm_flags);
>  void vma_set_page_prot(struct vm_area_struct *vma);
>  #else
> -static inline pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +static inline pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
>  {
>  	return __pgprot(0);
>  }
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 1d4439499503..cf1515c163e2 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2001,7 +2001,7 @@ typedef unsigned int pgtbl_mod_mask;
>   *								x: (yes) yes
>   */
>  #define DECLARE_VM_GET_PAGE_PROT					\
> -pgprot_t vm_get_page_prot(unsigned long vm_flags)			\
> +pgprot_t vm_get_page_prot(vm_flags_t vm_flags)				\
>  {									\
>  		return protection_map[vm_flags &			\
>  			(VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)];	\
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index d7fea56e3bb3..4e3a2f1ac09e 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -581,7 +581,7 @@ static inline pgprot_t pgprot_modify(pgprot_t oldprot, pgprot_t newprot)
>  	return __pgprot(pgprot_val(oldprot) | pgprot_val(newprot));
>  }
>  
> -static inline pgprot_t vm_get_page_prot(unsigned long vm_flags)
> +static inline pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
>  {
>  	return __pgprot(vm_flags);
>  }

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

