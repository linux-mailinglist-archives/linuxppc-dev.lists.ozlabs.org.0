Return-Path: <linuxppc-dev+bounces-9693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 925B5AE76C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 08:09:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRrxK59K6z306l;
	Wed, 25 Jun 2025 16:09:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750831749;
	cv=none; b=TCCnKU3UYSsVYKEdJdgyiCVpq/gjrZG6A5dnpu0DeNiDJjhuCJZxLm/Nhqp5H8dm3PM+NeP8WbaRWIhG6QViMvGHfAGzB439ue03GxXkKh83DMQiXZjEI8XKGAdaeTYND8dm3ol61iL8p6Rypxko5dUYg00R2Seo+kRSABfZ5bivpSCwo/9oLqrS6vTzuzPMdGD5sewHoCVvW1k1/PcnDJFVRQ+x5igJT29bMhGwTC7cFp5IH4UWJ7m78HAN7DbxwTV/iVfVmTXQMlJfvWz+pWmOwYVaL6IdQTCNrJ0NNzj4p5V5D2qCk3kqr5CTHcYVZMWovz0kJN6KQMDG83Fn8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750831749; c=relaxed/relaxed;
	bh=rs5qv26zbhZgpGvpN9RH2fv1bA62+llFCmQW4ABeOto=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERK5q9p/WKYVYKJxZBM3mkdi0Z7HsqUAYI0bqs9iG2i7XZDubJO4f2Z+GwdPKyFedU5oxbs+bq4SjKPpOqOMF9KvgM4fQfmmao6F8bLP8mwnPHru0sRrRCqeDTS7GnGqugjQbTG8ZcW2O4CBH7V/M2zW9wk0JHLTzdEf0PzNzTN+LlB2tr5V9m6Iauxt8P8Ysl5OcRq4nyDrP24UU1GfZrVf/Kkzahy7S6YB+Q6GIsY/kxSrN2bKH64zCFQf6S6u/mIOEuklLmlGEvuXxJhKsDDGBHOq56Xl77feXwMT4hINug1JOMJUjEw/Ld6sKvOVEnhep9zUBuF9V3EYqviGQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRrxJ6FDwz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 16:09:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B278106F;
	Tue, 24 Jun 2025 23:08:19 -0700 (PDT)
Received: from [10.164.146.16] (J09HK2D2RT.blr.arm.com [10.164.146.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 448623F63F;
	Tue, 24 Jun 2025 23:08:18 -0700 (PDT)
Message-ID: <52e6b931-3371-4adc-a680-add7413ab71c@arm.com>
Date: Wed, 25 Jun 2025 11:38:15 +0530
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
Subject: Re: [PATCH 3/3] mm: update architecture and driver code to use
 vm_flags_t
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
 <b6eb1894abc5555ece80bb08af5c022ef780c8bc.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <b6eb1894abc5555ece80bb08af5c022ef780c8bc.1750274467.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 19/06/25 1:12 AM, Lorenzo Stoakes wrote:
> In future we intend to change the vm_flags_t type, so it isn't correct for
> architecture and driver code to assume it is unsigned long. Correct this
> assumption across the board.
> 
> Overall, this patch does not introduce any functional change.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  arch/arm/mm/fault.c                |  2 +-
>  arch/arm64/include/asm/mman.h      | 10 +++++-----
>  arch/arm64/mm/fault.c              |  2 +-
>  arch/arm64/mm/mmu.c                |  2 +-
>  arch/powerpc/include/asm/mman.h    |  2 +-
>  arch/powerpc/include/asm/pkeys.h   |  4 ++--
>  arch/powerpc/kvm/book3s_hv_uvmem.c |  2 +-
>  arch/sparc/include/asm/mman.h      |  4 ++--
>  arch/x86/kernel/cpu/sgx/encl.c     |  8 ++++----
>  arch/x86/kernel/cpu/sgx/encl.h     |  2 +-
>  tools/testing/vma/vma_internal.h   |  2 +-
>  11 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index ab01b51de559..46169fe42c61 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -268,7 +268,7 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  	int sig, code;
>  	vm_fault_t fault;
>  	unsigned int flags = FAULT_FLAG_DEFAULT;
> -	unsigned long vm_flags = VM_ACCESS_FLAGS;
> +	vm_flags_t vm_flags = VM_ACCESS_FLAGS;
>  
>  	if (kprobe_page_fault(regs, fsr))
>  		return 0;
> diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
> index 21df8bbd2668..8770c7ee759f 100644
> --- a/arch/arm64/include/asm/mman.h
> +++ b/arch/arm64/include/asm/mman.h
> @@ -11,10 +11,10 @@
>  #include <linux/shmem_fs.h>
>  #include <linux/types.h>
>  
> -static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> +static inline vm_flags_t arch_calc_vm_prot_bits(unsigned long prot,
>  	unsigned long pkey)
>  {
> -	unsigned long ret = 0;
> +	vm_flags_t ret = 0;
>  
>  	if (system_supports_bti() && (prot & PROT_BTI))
>  		ret |= VM_ARM64_BTI;
> @@ -34,8 +34,8 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
>  }
>  #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
>  
> -static inline unsigned long arch_calc_vm_flag_bits(struct file *file,
> -						   unsigned long flags)
> +static inline vm_flags_t arch_calc_vm_flag_bits(struct file *file,
> +						unsigned long flags)
>  {
>  	/*
>  	 * Only allow MTE on anonymous mappings as these are guaranteed to be
> @@ -68,7 +68,7 @@ static inline bool arch_validate_prot(unsigned long prot,
>  }
>  #define arch_validate_prot(prot, addr) arch_validate_prot(prot, addr)
>  
> -static inline bool arch_validate_flags(unsigned long vm_flags)
> +static inline bool arch_validate_flags(vm_flags_t vm_flags)
>  {
>  	if (system_supports_mte()) {
>  		/*
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ec0a337891dd..24be3e632f79 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -549,7 +549,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
>  	const struct fault_info *inf;
>  	struct mm_struct *mm = current->mm;
>  	vm_fault_t fault;
> -	unsigned long vm_flags;
> +	vm_flags_t vm_flags;
>  	unsigned int mm_flags = FAULT_FLAG_DEFAULT;
>  	unsigned long addr = untagged_addr(far);
>  	struct vm_area_struct *vma;
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8fcf59ba39db..248d96349fd0 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -720,7 +720,7 @@ void mark_rodata_ro(void)
>  
>  static void __init declare_vma(struct vm_struct *vma,
>  			       void *va_start, void *va_end,
> -			       unsigned long vm_flags)
> +			       vm_flags_t vm_flags)
>  {
>  	phys_addr_t pa_start = __pa_symbol(va_start);
>  	unsigned long size = va_end - va_start;
> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
> index 42a51a993d94..912f78a956a1 100644
> --- a/arch/powerpc/include/asm/mman.h
> +++ b/arch/powerpc/include/asm/mman.h
> @@ -14,7 +14,7 @@
>  #include <asm/cpu_has_feature.h>
>  #include <asm/firmware.h>
>  
> -static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
> +static inline vm_flags_t arch_calc_vm_prot_bits(unsigned long prot,
>  		unsigned long pkey)
>  {
>  #ifdef CONFIG_PPC_MEM_KEYS
> diff --git a/arch/powerpc/include/asm/pkeys.h b/arch/powerpc/include/asm/pkeys.h
> index 59a2c7dbc78f..28e752138996 100644
> --- a/arch/powerpc/include/asm/pkeys.h
> +++ b/arch/powerpc/include/asm/pkeys.h
> @@ -30,9 +30,9 @@ extern u32 reserved_allocation_mask; /* bits set for reserved keys */
>  #endif
>  
>  
> -static inline u64 pkey_to_vmflag_bits(u16 pkey)
> +static inline vm_flags_t pkey_to_vmflag_bits(u16 pkey)
>  {
> -	return (((u64)pkey << VM_PKEY_SHIFT) & ARCH_VM_PKEY_FLAGS);
> +	return (((vm_flags_t)pkey << VM_PKEY_SHIFT) & ARCH_VM_PKEY_FLAGS);
>  }
>  
>  static inline int vma_pkey(struct vm_area_struct *vma)
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 3a6592a31a10..03f8c34fa0a2 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -393,7 +393,7 @@ static int kvmppc_memslot_page_merge(struct kvm *kvm,
>  {
>  	unsigned long gfn = memslot->base_gfn;
>  	unsigned long end, start = gfn_to_hva(kvm, gfn);
> -	unsigned long vm_flags;
> +	vm_flags_t vm_flags;
>  	int ret = 0;
>  	struct vm_area_struct *vma;
>  	int merge_flag = (merge) ? MADV_MERGEABLE : MADV_UNMERGEABLE;
> diff --git a/arch/sparc/include/asm/mman.h b/arch/sparc/include/asm/mman.h
> index af9c10c83dc5..3e4bac33be81 100644
> --- a/arch/sparc/include/asm/mman.h
> +++ b/arch/sparc/include/asm/mman.h
> @@ -28,7 +28,7 @@ static inline void ipi_set_tstate_mcde(void *arg)
>  }
>  
>  #define arch_calc_vm_prot_bits(prot, pkey) sparc_calc_vm_prot_bits(prot)
> -static inline unsigned long sparc_calc_vm_prot_bits(unsigned long prot)
> +static inline vm_flags_t sparc_calc_vm_prot_bits(unsigned long prot)
>  {
>  	if (adi_capable() && (prot & PROT_ADI)) {
>  		struct pt_regs *regs;
> @@ -58,7 +58,7 @@ static inline int sparc_validate_prot(unsigned long prot, unsigned long addr)
>  /* arch_validate_flags() - Ensure combination of flags is valid for a
>   *	VMA.
>   */
> -static inline bool arch_validate_flags(unsigned long vm_flags)
> +static inline bool arch_validate_flags(vm_flags_t vm_flags)
>  {
>  	/* If ADI is being enabled on this VMA, check for ADI
>  	 * capability on the platform and ensure VMA is suitable
> diff --git a/arch/x86/kernel/cpu/sgx/encl.c b/arch/x86/kernel/cpu/sgx/encl.c
> index 279148e72459..308dbbae6c6e 100644
> --- a/arch/x86/kernel/cpu/sgx/encl.c
> +++ b/arch/x86/kernel/cpu/sgx/encl.c
> @@ -279,7 +279,7 @@ static struct sgx_encl_page *__sgx_encl_load_page(struct sgx_encl *encl,
>  
>  static struct sgx_encl_page *sgx_encl_load_page_in_vma(struct sgx_encl *encl,
>  						       unsigned long addr,
> -						       unsigned long vm_flags)
> +						       vm_flags_t vm_flags)
>  {
>  	unsigned long vm_prot_bits = vm_flags & VM_ACCESS_FLAGS;
>  	struct sgx_encl_page *entry;
> @@ -520,9 +520,9 @@ static void sgx_vma_open(struct vm_area_struct *vma)
>   * Return: 0 on success, -EACCES otherwise
>   */
>  int sgx_encl_may_map(struct sgx_encl *encl, unsigned long start,
> -		     unsigned long end, unsigned long vm_flags)
> +		     unsigned long end, vm_flags_t vm_flags)
>  {
> -	unsigned long vm_prot_bits = vm_flags & VM_ACCESS_FLAGS;
> +	vm_flags_t vm_prot_bits = vm_flags & VM_ACCESS_FLAGS;
>  	struct sgx_encl_page *page;
>  	unsigned long count = 0;
>  	int ret = 0;
> @@ -605,7 +605,7 @@ static int sgx_encl_debug_write(struct sgx_encl *encl, struct sgx_encl_page *pag
>   */
>  static struct sgx_encl_page *sgx_encl_reserve_page(struct sgx_encl *encl,
>  						   unsigned long addr,
> -						   unsigned long vm_flags)
> +						   vm_flags_t vm_flags)
>  {
>  	struct sgx_encl_page *entry;
>  
> diff --git a/arch/x86/kernel/cpu/sgx/encl.h b/arch/x86/kernel/cpu/sgx/encl.h
> index f94ff14c9486..8ff47f6652b9 100644
> --- a/arch/x86/kernel/cpu/sgx/encl.h
> +++ b/arch/x86/kernel/cpu/sgx/encl.h
> @@ -101,7 +101,7 @@ static inline int sgx_encl_find(struct mm_struct *mm, unsigned long addr,
>  }
>  
>  int sgx_encl_may_map(struct sgx_encl *encl, unsigned long start,
> -		     unsigned long end, unsigned long vm_flags);
> +		     unsigned long end, vm_flags_t vm_flags);
>  
>  bool current_is_ksgxd(void);
>  void sgx_encl_release(struct kref *ref);
> diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
> index 7919d7141537..b9eb8c889f96 100644
> --- a/tools/testing/vma/vma_internal.h
> +++ b/tools/testing/vma/vma_internal.h
> @@ -1220,7 +1220,7 @@ static inline void vma_set_page_prot(struct vm_area_struct *vma)
>  	WRITE_ONCE(vma->vm_page_prot, vm_page_prot);
>  }
>  
> -static inline bool arch_validate_flags(unsigned long)
> +static inline bool arch_validate_flags(vm_flags_t)
>  {
>  	return true;
>  }

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>


