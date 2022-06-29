Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8940756022C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jun 2022 16:14:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LY3P73DWwz3dq3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 00:14:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=roM/kd9A;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EsEYDWjc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=osalvador@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=roM/kd9A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=EsEYDWjc;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY3NT3P73z3byL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 00:13:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A3E781F99E;
	Wed, 29 Jun 2022 14:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1656512021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKldONLQsm5TpGIOEiwcoH9PdnFhtyV9FEeNbLVAR2w=;
	b=roM/kd9AboZkL15oeqkFweYxi72V9jNpte4Gf2Ewiv2xh/AGpMjdalgLFtZlHXHnU6t5dk
	HF7WVgLgDorkOrndFxZeW4+c7DCqcaXFu3BVgMOWBO+NISdxw/58mqHDI8mA94y5L95bp5
	2uSaPHcI3aPh0I2PcQjZ6o20ccD58eA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1656512021;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jKldONLQsm5TpGIOEiwcoH9PdnFhtyV9FEeNbLVAR2w=;
	b=EsEYDWjckY41r8L9CL3emd4z7xRjv/KgHx0nXDz3J/2z8McnaC/lAROhCdDeyKVdcurjcp
	Ors/d++164thC0BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 367BC133D1;
	Wed, 29 Jun 2022 14:13:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id E9mFChVevGIFBAAAMHmgww
	(envelope-from <osalvador@suse.de>); Wed, 29 Jun 2022 14:13:41 +0000
Date: Wed, 29 Jun 2022 16:13:39 +0200
From: Oscar Salvador <osalvador@suse.de>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/memhotplug: Add add_pages override for PPC
Message-ID: <Yrxd8+hNlbj5/Lbu@localhost.localdomain>
References: <20220629050925.31447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220629050925.31447-1-aneesh.kumar@linux.ibm.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 29, 2022 at 10:39:25AM +0530, Aneesh Kumar K.V wrote:
> With commit ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> the kernel now validate the addr against high_memory value. This results
> in the below BUG_ON with dax pfns.
> 
> [  635.798741][T26531] kernel BUG at mm/page_alloc.c:5521!
> 1:mon> e
> cpu 0x1: Vector: 700 (Program Check) at [c000000007287630]
>     pc: c00000000055ed48: free_pages.part.0+0x48/0x110
>     lr: c00000000053ca70: tlb_finish_mmu+0x80/0xd0
>     sp: c0000000072878d0
>    msr: 800000000282b033
>   current = 0xc00000000afabe00
>   paca    = 0xc00000037ffff300   irqmask: 0x03   irq_happened: 0x05
>     pid   = 26531, comm = 50-landscape-sy
> kernel BUG at :5521!
> Linux version 5.19.0-rc3-14659-g4ec05be7c2e1 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #625 SMP Thu Jun 23 00:35:43 CDT 2022
> 1:mon> t
> [link register   ] c00000000053ca70 tlb_finish_mmu+0x80/0xd0
> [c0000000072878d0] c00000000053ca54 tlb_finish_mmu+0x64/0xd0 (unreliable)
> [c000000007287900] c000000000539424 exit_mmap+0xe4/0x2a0
> [c0000000072879e0] c00000000019fc1c mmput+0xcc/0x210
> [c000000007287a20] c000000000629230 begin_new_exec+0x5e0/0xf40
> [c000000007287ae0] c00000000070b3cc load_elf_binary+0x3ac/0x1e00
> [c000000007287c10] c000000000627af0 bprm_execve+0x3b0/0xaf0
> [c000000007287cd0] c000000000628414 do_execveat_common.isra.0+0x1e4/0x310
> [c000000007287d80] c00000000062858c sys_execve+0x4c/0x60
> [c000000007287db0] c00000000002c1b0 system_call_exception+0x160/0x2c0
> [c000000007287e10] c00000000000c53c system_call_common+0xec/0x250
> 
> The fix is to make sure we update high_memory on memory hotplug.
> This is similar to what x86 does in commit 3072e413e305 ("mm/memory_hotplug: introduce add_pages")
> 
> Fixes: ffa0b64e3be5 ("powerpc: Fix virt_addr_valid() for 64-bit Book3E & 32-bit")
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

Reviewed-by: Oscar Salvador <osalvador@suse.de>

> ---
> Changes from v2:
> * drop WARN_ON_ONCE
> * check for error from __add_pages
> 
>  arch/powerpc/Kconfig  |  4 ++++
>  arch/powerpc/mm/mem.c | 33 ++++++++++++++++++++++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c2ce2e60c8f0..7aa12e88c580 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -358,6 +358,10 @@ config ARCH_SUSPEND_NONZERO_CPU
>  	def_bool y
>  	depends on PPC_POWERNV || PPC_PSERIES
>  
> +config ARCH_HAS_ADD_PAGES
> +	def_bool y
> +	depends on ARCH_ENABLE_MEMORY_HOTPLUG
> +
>  config PPC_DCR_NATIVE
>  	bool
>  
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 52b77684acda..a97128a48817 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -105,6 +105,37 @@ void __ref arch_remove_linear_mapping(u64 start, u64 size)
>  	vm_unmap_aliases();
>  }
>  
> +/*
> + * After memory hotplug the variables max_pfn, max_low_pfn and high_memory need
> + * updating.
> + */
> +static void update_end_of_memory_vars(u64 start, u64 size)
> +{
> +	unsigned long end_pfn = PFN_UP(start + size);
> +
> +	if (end_pfn > max_pfn) {
> +		max_pfn = end_pfn;
> +		max_low_pfn = end_pfn;
> +		high_memory = (void *)__va(max_pfn * PAGE_SIZE - 1) + 1;
> +	}
> +}
> +
> +int __ref add_pages(int nid, unsigned long start_pfn, unsigned long nr_pages,
> +		    struct mhp_params *params)
> +{
> +	int ret;
> +
> +	ret = __add_pages(nid, start_pfn, nr_pages, params);
> +	if (ret)
> +		return ret;
> +
> +	/* update max_pfn, max_low_pfn and high_memory */
> +	update_end_of_memory_vars(start_pfn << PAGE_SHIFT,
> +				  nr_pages << PAGE_SHIFT);
> +
> +	return ret;
> +}
> +
>  int __ref arch_add_memory(int nid, u64 start, u64 size,
>  			  struct mhp_params *params)
>  {
> @@ -115,7 +146,7 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>  	rc = arch_create_linear_mapping(nid, start, size, params);
>  	if (rc)
>  		return rc;
> -	rc = __add_pages(nid, start_pfn, nr_pages, params);
> +	rc = add_pages(nid, start_pfn, nr_pages, params);
>  	if (rc)
>  		arch_remove_linear_mapping(start, size);
>  	return rc;
> -- 
> 2.36.1
> 
> 

-- 
Oscar Salvador
SUSE Labs
