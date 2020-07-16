Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 003A4221F7B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 11:14:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6pVk556mzDqyv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 19:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6pSP3rm5zDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 19:12:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=RTZbaMPF; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4B6pSN5296z9sSt; Thu, 16 Jul 2020 19:12:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1594890772; bh=JeI8v2lLOzWwduE+5cSU76pNmQxFjMg77GPeGybRqHk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTZbaMPFL0TPpJfiHejGfdYRHvlga0aS4vZNXrPbMuwZdsmoKvb6b0dSgPoWnNbRn
 ChfPK8y9gaspYvb/FvXX9OSOqKRzVN/T1S3KgxeO+8qpJp0UE5AcvM4p4oTQL3cy5p
 WMNrskZhplqFVyet1GF5MzBJvqqNXLqNjtF9ENpfcQZR3p3vyYGqsWit4nKSBv/9Aw
 tBuQWyBQXbKOMxxHSPtCcTFeu3r8OL3dqtmP6rQSz+QD6ao6Pl0f9uCC/hgwtyY+sb
 72TyY/oRNMCFRCxil/bBfQVhS8nPrxrb8J1BDilqmExbEL13Vc1bXs30bUrpcOKRwN
 UuwV+n07ETsIQ==
Date: Thu, 16 Jul 2020 11:30:30 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] pseries: Fix 64 bit logical memory block panic
Message-ID: <20200716013030.GA4076912@thinks.paulus.ozlabs.org>
References: <20200715000820.1255764-1-anton@ozlabs.org>
 <87d04x3q6m.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d04x3q6m.fsf@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 06:12:25PM +0530, Aneesh Kumar K.V wrote:
> Anton Blanchard <anton@ozlabs.org> writes:
> 
> > Booting with a 4GB LMB size causes us to panic:
> >
> >   qemu-system-ppc64: OS terminated: OS panic:
> >       Memory block size not suitable: 0x0
> >
> > Fix pseries_memory_block_size() to handle 64 bit LMBs.
> >
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Anton Blanchard <anton@ozlabs.org>
> > ---
> >  arch/powerpc/platforms/pseries/hotplug-memory.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > index 5ace2f9a277e..6574ac33e887 100644
> > --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> > +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> > @@ -27,7 +27,7 @@ static bool rtas_hp_event;
> >  unsigned long pseries_memory_block_size(void)
> >  {
> >  	struct device_node *np;
> > -	unsigned int memblock_size = MIN_MEMORY_BLOCK_SIZE;
> > +	uint64_t memblock_size = MIN_MEMORY_BLOCK_SIZE;
> >  	struct resource r;
> >  
> >  	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
> 
> We need similar changes at more places?
> 
> modified   arch/powerpc/include/asm/book3s/64/mmu.h
> @@ -85,7 +85,7 @@ extern unsigned int mmu_base_pid;
>  /*
>   * memory block size used with radix translation.
>   */
> -extern unsigned int __ro_after_init radix_mem_block_size;
> +extern unsigned long __ro_after_init radix_mem_block_size;
>  
>  #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
>  #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
> modified   arch/powerpc/include/asm/drmem.h
> @@ -21,7 +21,7 @@ struct drmem_lmb {
>  struct drmem_lmb_info {
>  	struct drmem_lmb        *lmbs;
>  	int                     n_lmbs;
> -	u32                     lmb_size;
> +	u64                     lmb_size;
>  };
>  
>  extern struct drmem_lmb_info *drmem_info;
> modified   arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -34,7 +34,7 @@
>  
>  unsigned int mmu_pid_bits;
>  unsigned int mmu_base_pid;
> -unsigned int radix_mem_block_size __ro_after_init;
> +unsigned long radix_mem_block_size __ro_after_init;

These changes look fine.

>  static __ref void *early_alloc_pgtable(unsigned long size, int nid,
>  			unsigned long region_start, unsigned long region_end)
> modified   arch/powerpc/mm/drmem.c
> @@ -268,14 +268,15 @@ static void __init __walk_drmem_v2_lmbs(const __be32 *prop, const __be32 *usm,
>  void __init walk_drmem_lmbs_early(unsigned long node,
>  			void (*func)(struct drmem_lmb *, const __be32 **))
>  {
> +	const __be64 *lmb_prop;
>  	const __be32 *prop, *usm;
>  	int len;
>  
> -	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
> -	if (!prop || len < dt_root_size_cells * sizeof(__be32))
> +	lmb_prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
> +	if (!lmb_prop || len < sizeof(__be64))
>  		return;
>  
> -	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
> +	drmem_info->lmb_size = be64_to_cpup(lmb_prop);

This particular change shouldn't be necessary.  We already have
dt_mem_next_cell() returning u64, and it knows how to combine two
cells to give a u64 (for dt_root_size_cells == 2).

>  	usm = of_get_flat_dt_prop(node, "linux,drconf-usable-memory", &len);
>  
> @@ -296,19 +297,19 @@ void __init walk_drmem_lmbs_early(unsigned long node,
>  
>  static int __init init_drmem_lmb_size(struct device_node *dn)
>  {
> -	const __be32 *prop;
> +	const __be64 *prop;
>  	int len;
>  
>  	if (drmem_info->lmb_size)
>  		return 0;
>  
>  	prop = of_get_property(dn, "ibm,lmb-size", &len);
> -	if (!prop || len < dt_root_size_cells * sizeof(__be32)) {
> +	if (!prop || len < sizeof(__be64)) {
>  		pr_info("Could not determine LMB size\n");
>  		return -1;
>  	}
>  
> -	drmem_info->lmb_size = dt_mem_next_cell(dt_root_size_cells, &prop);
> +	drmem_info->lmb_size = be64_to_cpup(prop);

Same comment here.

Paul.
