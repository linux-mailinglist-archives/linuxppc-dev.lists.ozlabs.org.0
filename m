Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF864625D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 23:41:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J30gw5Wy0z3bnC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 09:41:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.170;
 helo=mail-qk1-f170.google.com; envelope-from=dennisszhou@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J30gW4zh9z2yNr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 09:40:54 +1100 (AEDT)
Received: by mail-qk1-f170.google.com with SMTP id m186so24688354qkb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:40:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ekA4u6Z9nCmHdBZKORfIprxaVMeKH7fMH695d5zkFLg=;
 b=v6UWjZ1bIl1rLoq7NFO8LK0ZINgkVrUbUgIjPN0oxITgpz4zqrBgpBhQ8XULYMy6MH
 LJqJ/3fi0SY7A5Ukt0Tlt2jH52JhaNg02M5OGJLgR1PL+NjhB9933azYBEw0DvwB1t/z
 AJn2Wl19e1ilXY3A1GuPYa0Eo657YHPcA7/TxuSz5Uw8XXtGMA14iteUCLeqigVIvJcS
 fVNBZ2QDLdMOe3cIroDjvLnnOFqq/teyH6L7w4Ai/biqrefQtLzkmA5drERPjHJMSSQw
 s3DzMklKHp1oVhrEuxjml+vsr6FER4PtCp7fD3FGHcaXRkgoP/r3cy50l22bKuRjdkIU
 6yQA==
X-Gm-Message-State: AOAM531SZjHL/2vM+etD8o4UW1Bp4BIsAQmk2Tv4J0yOh9qMVk7+v6Jq
 QbqO//AiVlZ1k9gp6p6xp4w=
X-Google-Smtp-Source: ABdhPJwmKbZcoPWHtUNoIjacMkbITf0KHrEvuwYVEhLNZvYYZyzPSs9iKyzQ7RdEnAvMW0e9dLJ8iw==
X-Received: by 2002:a05:620a:2905:: with SMTP id
 m5mr34251434qkp.598.1638225651856; 
 Mon, 29 Nov 2021 14:40:51 -0800 (PST)
Received: from fedora (pool-173-68-57-129.nycmny.fios.verizon.net.
 [173.68.57.129])
 by smtp.gmail.com with ESMTPSA id y18sm10061968qtx.19.2021.11.29.14.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:40:51 -0800 (PST)
Date: Mon, 29 Nov 2021 17:40:49 -0500
From: Dennis Zhou <dennis@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH RFC 2/4] mm: percpu: Add pcpu_fc_cpu_to_node_fn_t typedef
Message-ID: <YaVW8ZNQMUnnoWEB@fedora>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <20211121093557.139034-3-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211121093557.139034-3-wangkefeng.wang@huawei.com>
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
Cc: linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, cl@linux.com, will@kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 21, 2021 at 05:35:55PM +0800, Kefeng Wang wrote:
> Add pcpu_fc_cpu_to_node_fn_t and pass it into pcpu_fc_alloc_fn_t,
> pcpu first chunk allocation will call it to alloc memblock on the
> corresponding node by it.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/mips/mm/init.c            | 12 +++++++++---
>  arch/powerpc/kernel/setup_64.c | 14 +++++++++++---
>  arch/sparc/kernel/smp_64.c     |  8 +++++---
>  arch/x86/kernel/setup_percpu.c | 18 +++++++++++++-----
>  drivers/base/arch_numa.c       |  8 +++++---
>  include/linux/percpu.h         |  7 +++++--
>  mm/percpu.c                    | 14 +++++++++-----
>  7 files changed, 57 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index 325e1552cbea..ebbf6923532c 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -519,12 +519,17 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
>  	return node_distance(cpu_to_node(from), cpu_to_node(to));
>  }
>  
> -static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size,
> -				       size_t align)
> +static int __init pcpu_cpu_to_node(int cpu)
> +{
> +	return cpu_to_node(cpu);
> +}
> +
> +static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
> +				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
>  	return memblock_alloc_try_nid(size, align, __pa(MAX_DMA_ADDRESS),
>  				      MEMBLOCK_ALLOC_ACCESSIBLE,
> -				      cpu_to_node(cpu));
> +				      cpu_to_nd_fun(cpu));
>  }
>  
>  static void __init pcpu_fc_free(void *ptr, size_t size)
> @@ -545,6 +550,7 @@ void __init setup_per_cpu_areas(void)
>  	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
>  				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
>  				    pcpu_cpu_distance,
> +				    pcpu_cpu_to_node,
>  				    pcpu_fc_alloc, pcpu_fc_free);
>  	if (rc < 0)
>  		panic("Failed to initialize percpu areas.");
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 6052f5d5ded3..9a5609c821df 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -771,6 +771,12 @@ void __init emergency_stack_init(void)
>  }
>  
>  #ifdef CONFIG_SMP
> +
> +static __init int pcpu_cpu_to_node(int cpu)
> +{
> +	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
> +}
> +
>  /**
>   * pcpu_alloc_bootmem - NUMA friendly alloc_bootmem wrapper for percpu
>   * @cpu: cpu to allocate for
> @@ -784,12 +790,12 @@ void __init emergency_stack_init(void)
>   * RETURNS:
>   * Pointer to the allocated area on success, NULL on failure.
>   */
> -static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size,
> -					size_t align)
> +static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size, size_t align,
> +					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
>  	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
>  #ifdef CONFIG_NUMA
> -	int node = early_cpu_to_node(cpu);
> +	int node = cpu_to_nd_fun(cpu);

^ typo - cpu_to_nd_fn().

>  	void *ptr;
>  
>  	if (!node_online(node) || !NODE_DATA(node)) {
> @@ -891,6 +897,7 @@ void __init setup_per_cpu_areas(void)
>  
>  	if (pcpu_chosen_fc != PCPU_FC_PAGE) {
>  		rc = pcpu_embed_first_chunk(0, dyn_size, atom_size, pcpu_cpu_distance,
> +					    pcpu_cpu_to_node,
>  					    pcpu_alloc_bootmem, pcpu_free_bootmem);
>  		if (rc)
>  			pr_warn("PERCPU: %s allocator failed (%d), "
> @@ -900,6 +907,7 @@ void __init setup_per_cpu_areas(void)
>  
>  	if (rc < 0)
>  		rc = pcpu_page_first_chunk(0, pcpu_alloc_bootmem, pcpu_free_bootmem,
> +					   pcpu_cpu_to_node,
>  					   pcpu_populate_pte);
>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
> diff --git a/arch/sparc/kernel/smp_64.c b/arch/sparc/kernel/smp_64.c
> index b98a7bbe6728..026aa3ccbc30 100644
> --- a/arch/sparc/kernel/smp_64.c
> +++ b/arch/sparc/kernel/smp_64.c
> @@ -1539,12 +1539,12 @@ void smp_send_stop(void)
>   * RETURNS:
>   * Pointer to the allocated area on success, NULL on failure.
>   */
> -static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size,
> -					size_t align)
> +static void * __init pcpu_alloc_bootmem(unsigned int cpu, size_t size, size_t align,
> +					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
>  	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
>  #ifdef CONFIG_NUMA
> -	int node = cpu_to_node(cpu);
> +	int node = cpu_to_nd_fn(cpu);
>  	void *ptr;
>  
>  	if (!node_online(node) || !NODE_DATA(node)) {
> @@ -1641,6 +1641,7 @@ void __init setup_per_cpu_areas(void)
>  		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
>  					    PERCPU_DYNAMIC_RESERVE, 4 << 20,
>  					    pcpu_cpu_distance,
> +					    cpu_to_node,
>  					    pcpu_alloc_bootmem,
>  					    pcpu_free_bootmem);
>  		if (rc)
> @@ -1652,6 +1653,7 @@ void __init setup_per_cpu_areas(void)
>  		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
>  					   pcpu_alloc_bootmem,
>  					   pcpu_free_bootmem,
> +					   cpu_to_node,
>  					   pcpu_populate_pte);
>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
> diff --git a/arch/x86/kernel/setup_percpu.c b/arch/x86/kernel/setup_percpu.c
> index 7b65275544b2..bba4fa174a16 100644
> --- a/arch/x86/kernel/setup_percpu.c
> +++ b/arch/x86/kernel/setup_percpu.c
> @@ -97,12 +97,12 @@ static bool __init pcpu_need_numa(void)
>   * RETURNS:
>   * Pointer to the allocated area on success, NULL on failure.
>   */
> -static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size,
> -					unsigned long align)
> +static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size, unsigned long align,
> +					pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
>  	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
>  #ifdef CONFIG_NUMA
> -	int node = early_cpu_to_node(cpu);
> +	int node = cpu_to_nd_fn(cpu);
>  	void *ptr;
>  
>  	if (!node_online(node) || !NODE_DATA(node)) {
> @@ -128,9 +128,10 @@ static void * __init pcpu_alloc_bootmem(unsigned int cpu, unsigned long size,
>  /*
>   * Helpers for first chunk memory allocation
>   */
> -static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align)
> +static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
> +				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
> -	return pcpu_alloc_bootmem(cpu, size, align);
> +	return pcpu_alloc_bootmem(cpu, size, align, cpu_to_nd_fn);
>  }
>  
>  static void __init pcpu_fc_free(void *ptr, size_t size)
> @@ -150,6 +151,11 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
>  #endif
>  }
>  
> +static int __init pcpu_cpu_to_node(int cpu)
> +{
> +	return IS_ENABLED(CONFIG_NUMA) ? early_cpu_to_node(cpu) : NUMA_NO_NODE;
> +}
> +
>  static void __init pcpup_populate_pte(unsigned long addr)
>  {
>  	populate_extra_pte(addr);
> @@ -205,6 +211,7 @@ void __init setup_per_cpu_areas(void)
>  		rc = pcpu_embed_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
>  					    dyn_size, atom_size,
>  					    pcpu_cpu_distance,
> +					    pcpu_cpu_to_node,
>  					    pcpu_fc_alloc, pcpu_fc_free);
>  		if (rc < 0)
>  			pr_warn("%s allocator failed (%d), falling back to page size\n",
> @@ -213,6 +220,7 @@ void __init setup_per_cpu_areas(void)
>  	if (rc < 0)
>  		rc = pcpu_page_first_chunk(PERCPU_FIRST_CHUNK_RESERVE,
>  					   pcpu_fc_alloc, pcpu_fc_free,
> +					   pcpu_cpu_to_node,
>  					   pcpup_populate_pte);
>  	if (rc < 0)
>  		panic("cannot initialize percpu area (err=%d)", rc);
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index bc1876915457..273543d9ff85 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -155,10 +155,10 @@ static int __init pcpu_cpu_distance(unsigned int from, unsigned int to)
>  	return node_distance(early_cpu_to_node(from), early_cpu_to_node(to));
>  }
>  
> -static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size,
> -				       size_t align)
> +static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
> +				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
> -	int nid = early_cpu_to_node(cpu);
> +	int nid = cpu_to_nd_fn(cpu);
>  
>  	return  memblock_alloc_try_nid(size, align,
>  			__pa(MAX_DMA_ADDRESS), MEMBLOCK_ALLOC_ACCESSIBLE, nid);
> @@ -229,6 +229,7 @@ void __init setup_per_cpu_areas(void)
>  		rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
>  					    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE,
>  					    pcpu_cpu_distance,
> +					    early_cpu_to_node,
>  					    pcpu_fc_alloc, pcpu_fc_free);
>  #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
>  		if (rc < 0)
> @@ -242,6 +243,7 @@ void __init setup_per_cpu_areas(void)
>  		rc = pcpu_page_first_chunk(PERCPU_MODULE_RESERVE,
>  					   pcpu_fc_alloc,
>  					   pcpu_fc_free,
> +					   early_cpu_to_node,
>  					   pcpu_populate_pte);
>  #endif
>  	if (rc < 0)
> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
> index ae4004e7957e..41bb54715b0c 100644
> --- a/include/linux/percpu.h
> +++ b/include/linux/percpu.h
> @@ -94,8 +94,9 @@ extern const char * const pcpu_fc_names[PCPU_FC_NR];
>  
>  extern enum pcpu_fc pcpu_chosen_fc;
>  
> -typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size,
> -				     size_t align);
> +typedef int (pcpu_fc_cpu_to_node_fn_t)(int cpu);
> +typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size, size_t align,
> +				     pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
>  typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
>  typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
>  typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);
> @@ -111,6 +112,7 @@ extern void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
>  extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  				size_t atom_size,
>  				pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
> +				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
>  				pcpu_fc_alloc_fn_t alloc_fn,
>  				pcpu_fc_free_fn_t free_fn);
>  #endif
> @@ -119,6 +121,7 @@ extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  extern int __init pcpu_page_first_chunk(size_t reserved_size,
>  				pcpu_fc_alloc_fn_t alloc_fn,
>  				pcpu_fc_free_fn_t free_fn,
> +				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
>  				pcpu_fc_populate_pte_fn_t populate_pte_fn);
>  #endif

Be consistent here. In pcpu_setup_first_chunk() you add the
cpu_to_node() before alloc()/free() and then in pcpu_embed_first_chunk()
you add it after. I'd prefer to add it before as to keep the
cpu_distance()/cpu_to_node() grouping.

>  
> diff --git a/mm/percpu.c b/mm/percpu.c
> index f5b2c2ea5a54..3f6cf1ff0be2 100644
> --- a/mm/percpu.c
> +++ b/mm/percpu.c
> @@ -3001,6 +3001,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
>   * @dyn_size: minimum free size for dynamic allocation in bytes
>   * @atom_size: allocation atom size
>   * @cpu_distance_fn: callback to determine distance between cpus, optional
> + * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
>   * @alloc_fn: function to allocate percpu page
>   * @free_fn: function to free percpu page
>   *
> @@ -3030,6 +3031,7 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
>  int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  				  size_t atom_size,
>  				  pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
> +				  pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
>  				  pcpu_fc_alloc_fn_t alloc_fn,
>  				  pcpu_fc_free_fn_t free_fn)
>  {
> @@ -3066,7 +3068,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  		BUG_ON(cpu == NR_CPUS);
>  
>  		/* allocate space for the whole group */
> -		ptr = alloc_fn(cpu, gi->nr_units * ai->unit_size, atom_size);
> +		ptr = alloc_fn(cpu, gi->nr_units * ai->unit_size, atom_size, cpu_to_nd_fn);
>  		if (!ptr) {
>  			rc = -ENOMEM;
>  			goto out_free_areas;
> @@ -3145,6 +3147,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>   * @reserved_size: the size of reserved percpu area in bytes
>   * @alloc_fn: function to allocate percpu page, always called with PAGE_SIZE
>   * @free_fn: function to free percpu page, always called with PAGE_SIZE
> + * @cpu_to_nd_fn: callback to convert cpu to it's node, optional
>   * @populate_pte_fn: function to populate pte
>   *
>   * This is a helper to ease setting up page-remapped first percpu
> @@ -3159,6 +3162,7 @@ int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>  int __init pcpu_page_first_chunk(size_t reserved_size,
>  				 pcpu_fc_alloc_fn_t alloc_fn,
>  				 pcpu_fc_free_fn_t free_fn,
> +				 pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
>  				 pcpu_fc_populate_pte_fn_t populate_pte_fn)
>  {
>  	static struct vm_struct vm;
> @@ -3201,7 +3205,7 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
>  		for (i = 0; i < unit_pages; i++) {
>  			void *ptr;
>  
> -			ptr = alloc_fn(cpu, PAGE_SIZE, PAGE_SIZE);
> +			ptr = alloc_fn(cpu, PAGE_SIZE, PAGE_SIZE, cpu_to_nd_fn);
>  			if (!ptr) {
>  				pr_warn("failed to allocate %s page for cpu%u\n",
>  						psize_str, cpu);
> @@ -3278,8 +3282,8 @@ int __init pcpu_page_first_chunk(size_t reserved_size,
>  unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
>  EXPORT_SYMBOL(__per_cpu_offset);
>  
> -static void * __init pcpu_dfl_fc_alloc(unsigned int cpu, size_t size,
> -				       size_t align)
> +static void * __init pcpu_dfl_fc_alloc(unsigned int cpu, size_t size, size_t align,
> +				       pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>  {
>  	return  memblock_alloc_from(size, align, __pa(MAX_DMA_ADDRESS));
>  }
> @@ -3300,7 +3304,7 @@ void __init setup_per_cpu_areas(void)
>  	 * what the legacy allocator did.
>  	 */
>  	rc = pcpu_embed_first_chunk(PERCPU_MODULE_RESERVE,
> -				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE, NULL,
> +				    PERCPU_DYNAMIC_RESERVE, PAGE_SIZE, NULL, NULL,
>  				    pcpu_dfl_fc_alloc, pcpu_dfl_fc_free);
>  	if (rc < 0)
>  		panic("Failed to initialize percpu areas.");
> -- 
> 2.26.2
> 

Thanks,
Dennis
