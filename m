Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 947032329BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 03:57:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHD7K19HlzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 11:57:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AYqM5GDS; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=AYqM5GDS; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHD4J3VlYzDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 11:54:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596074077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRu2DjMF0v0Jv3loZnZu2suQTSJCldR+3yWZSkhX+qw=;
 b=AYqM5GDSmYWUCfea408qdF9cDGhPVi2H5jWj8QxQcbnMO8FJqf8XIcgP0v41uQTx4zaftM
 kzZ/c9ZBLzIUIpUHlxF7QVuSDXg3gMxyrLOjkS+rpH4KhAqJrxEKeQ2S0oQwp4Aup5QsVi
 xcsQmMJ7sEgbJDFjnD9LfajSSZE3cEM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596074077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RRu2DjMF0v0Jv3loZnZu2suQTSJCldR+3yWZSkhX+qw=;
 b=AYqM5GDSmYWUCfea408qdF9cDGhPVi2H5jWj8QxQcbnMO8FJqf8XIcgP0v41uQTx4zaftM
 kzZ/c9ZBLzIUIpUHlxF7QVuSDXg3gMxyrLOjkS+rpH4KhAqJrxEKeQ2S0oQwp4Aup5QsVi
 xcsQmMJ7sEgbJDFjnD9LfajSSZE3cEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-MKISxg0TPU6a-4FvLzbZhQ-1; Wed, 29 Jul 2020 21:54:32 -0400
X-MC-Unique: MKISxg0TPU6a-4FvLzbZhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6832D1005510;
 Thu, 30 Jul 2020 01:54:27 +0000 (UTC)
Received: from localhost (ovpn-12-125.pek2.redhat.com [10.72.12.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56EE9619B5;
 Thu, 30 Jul 2020 01:54:26 +0000 (UTC)
Date: Thu, 30 Jul 2020 09:54:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 10/15] memblock: make memblock_debug and related
 functionality private
Message-ID: <20200730015424.GJ14854@MiWiFi-R3L-srv>
References: <20200728051153.1590-1-rppt@kernel.org>
 <20200728051153.1590-11-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200728051153.1590-11-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Mike Rapoport <rppt@linux.ibm.com>, clang-built-linux@googlegroups.com,
 Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 07/28/20 at 08:11am, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The only user of memblock_dbg() outside memblock was s390 setup code and it
> is converted to use pr_debug() instead.
> This allows to stop exposing memblock_debug and memblock_dbg() to the rest
> of the kernel.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/s390/kernel/setup.c |  4 ++--
>  include/linux/memblock.h | 12 +-----------
>  mm/memblock.c            | 13 +++++++++++--
>  3 files changed, 14 insertions(+), 15 deletions(-)

Nice clean up.

Reviewed-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
> index 07aa15ba43b3..8b284cf6e199 100644
> --- a/arch/s390/kernel/setup.c
> +++ b/arch/s390/kernel/setup.c
> @@ -776,8 +776,8 @@ static void __init memblock_add_mem_detect_info(void)
>  	unsigned long start, end;
>  	int i;
>  
> -	memblock_dbg("physmem info source: %s (%hhd)\n",
> -		     get_mem_info_source(), mem_detect.info_source);
> +	pr_debug("physmem info source: %s (%hhd)\n",
> +		 get_mem_info_source(), mem_detect.info_source);
>  	/* keep memblock lists close to the kernel */
>  	memblock_set_bottom_up(true);
>  	for_each_mem_detect_block(i, &start, &end) {
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 220b5f0dad42..e6a23b3db696 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -90,7 +90,6 @@ struct memblock {
>  };
>  
>  extern struct memblock memblock;
> -extern int memblock_debug;
>  
>  #ifndef CONFIG_ARCH_KEEP_MEMBLOCK
>  #define __init_memblock __meminit
> @@ -102,9 +101,6 @@ void memblock_discard(void);
>  static inline void memblock_discard(void) {}
>  #endif
>  
> -#define memblock_dbg(fmt, ...) \
> -	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> -
>  phys_addr_t memblock_find_in_range(phys_addr_t start, phys_addr_t end,
>  				   phys_addr_t size, phys_addr_t align);
>  void memblock_allow_resize(void);
> @@ -456,13 +452,7 @@ bool memblock_is_region_memory(phys_addr_t base, phys_addr_t size);
>  bool memblock_is_reserved(phys_addr_t addr);
>  bool memblock_is_region_reserved(phys_addr_t base, phys_addr_t size);
>  
> -extern void __memblock_dump_all(void);
> -
> -static inline void memblock_dump_all(void)
> -{
> -	if (memblock_debug)
> -		__memblock_dump_all();
> -}
> +void memblock_dump_all(void);
>  
>  /**
>   * memblock_set_current_limit - Set the current allocation limit to allow
> diff --git a/mm/memblock.c b/mm/memblock.c
> index a5b9b3df81fc..824938849f6d 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -134,7 +134,10 @@ struct memblock memblock __initdata_memblock = {
>  	     i < memblock_type->cnt;					\
>  	     i++, rgn = &memblock_type->regions[i])
>  
> -int memblock_debug __initdata_memblock;
> +#define memblock_dbg(fmt, ...) \
> +	if (memblock_debug) printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
> +
> +static int memblock_debug __initdata_memblock;
>  static bool system_has_some_mirror __initdata_memblock = false;
>  static int memblock_can_resize __initdata_memblock;
>  static int memblock_memory_in_slab __initdata_memblock = 0;
> @@ -1919,7 +1922,7 @@ static void __init_memblock memblock_dump(struct memblock_type *type)
>  	}
>  }
>  
> -void __init_memblock __memblock_dump_all(void)
> +static void __init_memblock __memblock_dump_all(void)
>  {
>  	pr_info("MEMBLOCK configuration:\n");
>  	pr_info(" memory size = %pa reserved size = %pa\n",
> @@ -1933,6 +1936,12 @@ void __init_memblock __memblock_dump_all(void)
>  #endif
>  }
>  
> +void __init_memblock memblock_dump_all(void)
> +{
> +	if (memblock_debug)
> +		__memblock_dump_all();
> +}
> +
>  void __init memblock_allow_resize(void)
>  {
>  	memblock_can_resize = 1;
> -- 
> 2.26.2
> 
> 

