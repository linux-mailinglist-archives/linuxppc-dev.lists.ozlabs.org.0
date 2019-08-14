Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 963A08D244
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 13:35:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467nYv2HxdzDqn5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 21:34:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467nWw3mhdzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 21:33:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 467nWv5gt6z9sNC; Wed, 14 Aug 2019 21:33:15 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 467nWv37MQz9sN1;
 Wed, 14 Aug 2019 21:33:15 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v5 4/7] powerpc/mm: Use UV_WRITE_PATE ucall to register a
 PATE
In-Reply-To: <20190808040555.2371-5-cclaudio@linux.ibm.com>
References: <20190808040555.2371-1-cclaudio@linux.ibm.com>
 <20190808040555.2371-5-cclaudio@linux.ibm.com>
Date: Wed, 14 Aug 2019 21:33:12 +1000
Message-ID: <871rxo7zif.fsf@concordia.ellerman.id.au>
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
 Guerney Hunt <gdhh@linux.ibm.com>, Thiago Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Claudio,

Claudio Carvalho <cclaudio@linux.ibm.com> writes:
> From: Michael Anderson <andmike@linux.ibm.com>
>
> In ultravisor enabled systems, the ultravisor creates and maintains the
> partition table in secure memory where the hypervisor cannot access, and
                                   ^
                                   which?

> therefore, the hypervisor have to do the UV_WRITE_PATE ucall whenever it
                            ^          ^
                            has        a
> wants to set a partition table entry (PATE).
>
> This patch adds the UV_WRITE_PATE ucall and uses it to set a PATE if
> ultravisor is enabled. Additionally, this also also keeps a copy of the
> partition table because the nestMMU does not have access to secure
> memory. Such copy has entries for nonsecure and hypervisor partition.

I'm having trouble parsing the last sentence there.

Or at least it doesn't seem to match the code, or I don't understand
either the code or the comment. More below.

> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
> index 85bc81abd286..033731f5dbaa 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -213,34 +223,50 @@ void __init mmu_partition_table_init(void)
>  	powernv_set_nmmu_ptcr(ptcr);
>  }
>  
> -void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
> -				   unsigned long dw1)
> +/*
> + * Global flush of TLBs and partition table caches for this lpid. The type of
> + * flush (hash or radix) depends on what the previous use of this partition ID
> + * was, not the new use.
> + */
> +static void flush_partition(unsigned int lpid, unsigned long old_patb0)

A nicer API would be for the 2nd param to be a "bool radix", and have
the caller worry about the fact that it comes from (patb0 & PATB_HR).

>  {
> -	unsigned long old = be64_to_cpu(partition_tb[lpid].patb0);
> -
> -	partition_tb[lpid].patb0 = cpu_to_be64(dw0);
> -	partition_tb[lpid].patb1 = cpu_to_be64(dw1);
> -
> -	/*
> -	 * Global flush of TLBs and partition table caches for this lpid.
> -	 * The type of flush (hash or radix) depends on what the previous
> -	 * use of this partition ID was, not the new use.
> -	 */
>  	asm volatile("ptesync" : : : "memory");
> -	if (old & PATB_HR) {
> -		asm volatile(PPC_TLBIE_5(%0,%1,2,0,1) : :
> +	if (old_patb0 & PATB_HR) {
> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 1) : :
>  			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
> -		asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 1, 1) : :

That looks like an unrelated whitespace change.

>  			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>  		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 1);
>  	} else {
> -		asm volatile(PPC_TLBIE_5(%0,%1,2,0,0) : :
> +		asm volatile(PPC_TLBIE_5(%0, %1, 2, 0, 0) : :

Ditto.

>  			     "r" (TLBIEL_INVAL_SET_LPID), "r" (lpid));
>  		trace_tlbie(lpid, 0, TLBIEL_INVAL_SET_LPID, lpid, 2, 0, 0);
>  	}
>  	/* do we need fixup here ?*/
>  	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
>  }
> +
> +void mmu_partition_table_set_entry(unsigned int lpid, unsigned long dw0,
> +				  unsigned long dw1)
> +{
> +	unsigned long old = be64_to_cpu(partition_tb[lpid].patb0);
> +
> +	partition_tb[lpid].patb0 = cpu_to_be64(dw0);
> +	partition_tb[lpid].patb1 = cpu_to_be64(dw1);

ie. here we always update the copy of the partition table, regardless of
whether we're running under an ultravisor or not. So the copy is a
complete copy isn't it?

> +	/*
> +	 * In ultravisor enabled systems, the ultravisor maintains the partition
> +	 * table in secure memory where we don't have access, therefore, we have
> +	 * to do a ucall to set an entry.
> +	 */
> +	if (firmware_has_feature(FW_FEATURE_ULTRAVISOR)) {
> +		uv_register_pate(lpid, dw0, dw1);
> +		pr_info("PATE registered by ultravisor: dw0 = 0x%lx, dw1 = 0x%lx\n",
> +			dw0, dw1);
> +	} else {
> +		flush_partition(lpid, old);
> +	}

What is different is whether we flush or not.

And don't we still need to do the flush for the nestMMU? I assume we're
saying the ultravisor will broadcast a flush for us, which will also
handle the nestMMU case?

cheers
