Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B13657A1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 15:08:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45kxDy4jpszDql6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2019 23:08:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45kx0k2sl9zDqgx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2019 22:57:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 45kx0k0CQxz9sNg; Thu, 11 Jul 2019 22:57:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45kx0j4tt8z9sNT;
 Thu, 11 Jul 2019 22:57:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v4 4/8] KVM: PPC: Ultravisor: Use UV_WRITE_PATE ucall to
 register a PATE
In-Reply-To: <20190628200825.31049-5-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-5-cclaudio@linux.ibm.com>
Date: Thu, 11 Jul 2019 22:57:24 +1000
Message-ID: <87ims8g24r.fsf@concordia.ellerman.id.au>
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
Cc: Ryan Grimm <grimm@linux.vnet.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> From: Michael Anderson <andmike@linux.ibm.com>
>
> When running under an ultravisor, the ultravisor controls the real
> partition table and has it in secure memory where the hypervisor can't
> access it, and therefore we (the HV) have to do a ucall whenever we want
> to update an entry.
>
> The HV still keeps a copy of its view of the partition table in normal
> memory so that the nest MMU can access it.
>
> Both partition tables will have PATE entries for HV and normal virtual

Can you expand novel acronyms on their first usage please, ie. PATE.

> machines.
>
> Suggested-by: Ryan Grimm <grimm@linux.vnet.ibm.com>

"Suggested" implies this is optional, but it's not :)

I'm not sure exactly what Ryan's input was, but feel free to make up a
better tag :)

> Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [ Write the pate in HV's table before doing that in UV's ]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ultravisor-api.h |  5 +++-
>  arch/powerpc/include/asm/ultravisor.h     | 14 ++++++++++
>  arch/powerpc/mm/book3s64/hash_utils.c     |  3 +-
>  arch/powerpc/mm/book3s64/pgtable.c        | 34 +++++++++++++++++++++--
>  arch/powerpc/mm/book3s64/radix_pgtable.c  |  9 ++++--
>  5 files changed, 57 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ultravisor-api.h b/arch/powerpc/include/asm/ultravisor-api.h
> index 49e766adabc7..141940771add 100644
> --- a/arch/powerpc/include/asm/ultravisor-api.h
> +++ b/arch/powerpc/include/asm/ultravisor-api.h
> @@ -15,6 +15,9 @@
>  #define U_SUCCESS		H_SUCCESS
>  #define U_FUNCTION		H_FUNCTION
>  #define U_PARAMETER		H_PARAMETER
> +#define U_PERMISSION		H_PERMISSION
>  
> -#endif /* _ASM_POWERPC_ULTRAVISOR_API_H */

What happened there? Just a diff artifact?

> +/* opcodes */
> +#define UV_WRITE_PATE			0xF104
>  
> +#endif /* _ASM_POWERPC_ULTRAVISOR_API_H */
> diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
> index a78a2dacfd0b..996c1efd6c6d 100644
> --- a/arch/powerpc/include/asm/ultravisor.h
> +++ b/arch/powerpc/include/asm/ultravisor.h
> @@ -12,6 +12,8 @@
>  
>  #if !defined(__ASSEMBLY__)
>  
> +#include <linux/types.h>
> +
>  /* Internal functions */
>  extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>  					 int depth, void *data);
> @@ -28,8 +30,20 @@ extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
>   */
>  #if defined(CONFIG_PPC_POWERNV)
>  long ucall(unsigned long opcode, unsigned long *retbuf, ...);
> +#else
> +static long ucall(unsigned long opcode, unsigned long *retbuf, ...)
          ^
          inline

> +{
> +	return U_NOT_AVAILABLE;
> +}
>  #endif

That should have been in the previous patch.

> +static inline int uv_register_pate(u64 lpid, u64 dw0, u64 dw1)
> +{
> +	unsigned long retbuf[UCALL_BUFSIZE];
> +
> +	return ucall(UV_WRITE_PATE, retbuf, lpid, dw0, dw1);

You probably want a ucall_norets().

> +}
> +
>  #endif /* !__ASSEMBLY__ */
>  
>  #endif	/* _ASM_POWERPC_ULTRAVISOR_H */
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 1ff451892d7f..220a4e133240 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1080,9 +1080,10 @@ void hash__early_init_mmu_secondary(void)
>  
>  		if (!cpu_has_feature(CPU_FTR_ARCH_300))
>  			mtspr(SPRN_SDR1, _SDR1);
> -		else
> +		else if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>  			mtspr(SPRN_PTCR,
>  			      __pa(partition_tb) | (PATB_SIZE_SHIFT - 12));

Needs a comment for the else case.

>  	}
>  	/* Initialize SLB */
>  	slb_initialize();
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index ad3dd977c22d..224c5c7c2e3d 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -16,6 +16,8 @@
>  #include <asm/tlb.h>
>  #include <asm/trace.h>
>  #include <asm/powernv.h>
> +#include <asm/firmware.h>
> +#include <asm/ultravisor.h>
>  
>  #include <mm/mmu_decl.h>
>  #include <trace/events/thp.h>
> @@ -206,12 +208,25 @@ void __init mmu_partition_table_init(void)
>  	 * 64 K size.
>  	 */
>  	ptcr = __pa(partition_tb) | (PATB_SIZE_SHIFT - 12);
> -	mtspr(SPRN_PTCR, ptcr);
> +	/*
> +	 * If ultravisor is available, it is responsible for creating and
> +	 * managing partition table
> +	 */

But we just created the partition table?!

This comment and the one below would probably make more sense if they
were merged and appeared further up, where we allocate the partition
table.
      
> +	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
> +		mtspr(SPRN_PTCR, ptcr);
> +
> +	/*
> +	 * Since nestMMU cannot access secure memory. Create
> +	 * and manage our own partition table. This table

But we just said the UV was responsible for it :)

> +	 * contains entries for nonsecure and hypervisor
> +	 * partition.
> +	 */
>  	powernv_set_nmmu_ptcr(ptcr);
>  }
>  
> -void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
> -				   unsigned long dw1)
> +static void __mmu_partition_table_set_entry(unsigned int lpid,
> +					    unsigned long dw0,
> +					    unsigned long dw1)
>  {
>  	unsigned long old = be64_to_cpu(partition_tb[lpid].patb0);
>  
> @@ -238,6 +253,19 @@ void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
>  	/* do we need fixup here ?*/
>  	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
>  }
> +
> +void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
> +				  unsigned long dw1)
> +{
> +	__mmu_partition_table_set_entry(lpid, dw0, dw1);
> +
> +	if (firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
> +		uv_register_pate(lpid, dw0, dw1);
> +		pr_info("PATE registered by ultravisor: dw0 = 0x%lx, dw1 = 0x%lx\n",
> +			dw0, dw1);
> +	}
> +}

I agree with Alexey that this patch and the next should be merged and
the result cleaned up a bit.

> +

No extra blank please.

>  EXPORT_SYMBOL_GPL(mmu_partition_table_set_entry);

>  
>  static pmd_t *get_pmd_from_cache(struct mm_struct *mm)
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
> index 8904aa1243d8..da6a6b76a040 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -656,8 +656,10 @@ void radix__early_init_mmu_secondary(void)
>  		lpcr = mfspr(SPRN_LPCR);
>  		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
>  
> -		mtspr(SPRN_PTCR,
> -		      __pa(partition_tb) | (PATB_SIZE_SHIFT - 12));
> +		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
> +			mtspr(SPRN_PTCR, __pa(partition_tb) |
> +			      (PATB_SIZE_SHIFT - 12));
> +
>  		radix_init_amor();
>  	}
>  
> @@ -673,7 +675,8 @@ void radix__mmu_cleanup_all(void)
>  	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
>  		lpcr = mfspr(SPRN_LPCR);
>  		mtspr(SPRN_LPCR, lpcr & ~LPCR_UPRT);
> -		mtspr(SPRN_PTCR, 0);
> +		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
> +			mtspr(SPRN_PTCR, 0);
>  		powernv_set_nmmu_ptcr(0);
>  		radix__flush_tlb_all();
>  	}

There's four of these case where we skip touching the PTCR, which is
right on the borderline of warranting an accessor. I guess we can do it
as a cleanup later.

cheers
