Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 433BB23C460
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:22:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLz492tzGzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 14:22:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-1.mimecast.com; envelope-from=bhe@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RhB7tJrW; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RhB7tJrW; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLz206zJ6zDqPF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 14:20:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596601237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twertatwzUrM7ldiTnLyq8dIY3NouOKQbE23vgZibYc=;
 b=RhB7tJrWsV46yFoehAYmxLRKZCWlHdsxIYJKxQV1BjXImPnPGbcPU6V368xtzPpT8l+y2N
 KOIzb3ETxq+JUYWFHDfnWn7ZFyX7kyfYNAjP/tGJCSGm5VxuDZQnRtGjoaDq+EoKLy2dTo
 aEXBlqjVykf8BUIRQmUAnBKVDoaGdv8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596601237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=twertatwzUrM7ldiTnLyq8dIY3NouOKQbE23vgZibYc=;
 b=RhB7tJrWsV46yFoehAYmxLRKZCWlHdsxIYJKxQV1BjXImPnPGbcPU6V368xtzPpT8l+y2N
 KOIzb3ETxq+JUYWFHDfnWn7ZFyX7kyfYNAjP/tGJCSGm5VxuDZQnRtGjoaDq+EoKLy2dTo
 aEXBlqjVykf8BUIRQmUAnBKVDoaGdv8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-pdUQtGUaN4iDPq52ne80Vw-1; Wed, 05 Aug 2020 00:20:34 -0400
X-MC-Unique: pdUQtGUaN4iDPq52ne80Vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B26651009600;
 Wed,  5 Aug 2020 04:20:29 +0000 (UTC)
Received: from localhost (ovpn-12-71.pek2.redhat.com [10.72.12.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C71071765;
 Wed,  5 Aug 2020 04:20:27 +0000 (UTC)
Date: Wed, 5 Aug 2020 12:20:24 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 13/17] x86/setup: simplify initrd relocation and
 reservation
Message-ID: <20200805042024.GT10792@MiWiFi-R3L-srv>
References: <20200802163601.8189-1-rppt@kernel.org>
 <20200802163601.8189-14-rppt@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802163601.8189-14-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Simek <monstr@monstr.eu>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/02/20 at 07:35pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Currently, initrd image is reserved very early during setup and then it
> might be relocated and re-reserved after the initial physical memory
> mapping is created. The "late" reservation of memblock verifies that mapped
> memory size exceeds the size of initrd, the checks whether the relocation
                                          ~ then?
> required and, if yes, relocates inirtd to a new memory allocated from
> memblock and frees the old location.
> 
> The check for memory size is excessive as memblock allocation will anyway
> fail if there is not enough memory. Besides, there is no point to allocate
> memory from memblock using memblock_find_in_range() + memblock_reserve()
> when there exists memblock_phys_alloc_range() with required functionality.
> 
> Remove the redundant check and simplify memblock allocation.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/x86/kernel/setup.c | 16 +++-------------
>  1 file changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index a3767e74c758..d8de4053c5e8 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -262,16 +262,12 @@ static void __init relocate_initrd(void)
>  	u64 area_size     = PAGE_ALIGN(ramdisk_size);
>  
>  	/* We need to move the initrd down into directly mapped mem */
> -	relocated_ramdisk = memblock_find_in_range(0, PFN_PHYS(max_pfn_mapped),
> -						   area_size, PAGE_SIZE);
> -
> +	relocated_ramdisk = memblock_phys_alloc_range(area_size, PAGE_SIZE, 0,
> +						      PFN_PHYS(max_pfn_mapped));
>  	if (!relocated_ramdisk)
>  		panic("Cannot find place for new RAMDISK of size %lld\n",
>  		      ramdisk_size);
>  
> -	/* Note: this includes all the mem currently occupied by
> -	   the initrd, we rely on that fact to keep the data intact. */
> -	memblock_reserve(relocated_ramdisk, area_size);
>  	initrd_start = relocated_ramdisk + PAGE_OFFSET;
>  	initrd_end   = initrd_start + ramdisk_size;
>  	printk(KERN_INFO "Allocated new RAMDISK: [mem %#010llx-%#010llx]\n",
> @@ -298,13 +294,13 @@ static void __init early_reserve_initrd(void)
>  
>  	memblock_reserve(ramdisk_image, ramdisk_end - ramdisk_image);
>  }
> +
>  static void __init reserve_initrd(void)
>  {
>  	/* Assume only end is not page aligned */
>  	u64 ramdisk_image = get_ramdisk_image();
>  	u64 ramdisk_size  = get_ramdisk_size();
>  	u64 ramdisk_end   = PAGE_ALIGN(ramdisk_image + ramdisk_size);
> -	u64 mapped_size;
>  
>  	if (!boot_params.hdr.type_of_loader ||
>  	    !ramdisk_image || !ramdisk_size)
> @@ -312,12 +308,6 @@ static void __init reserve_initrd(void)
>  
>  	initrd_start = 0;
>  
> -	mapped_size = memblock_mem_size(max_pfn_mapped);
> -	if (ramdisk_size >= (mapped_size>>1))
> -		panic("initrd too large to handle, "
> -		       "disabling initrd (%lld needed, %lld available)\n",
> -		       ramdisk_size, mapped_size>>1);

Reviewed-by: Baoquan He <bhe@redhat.com>

> -
>  	printk(KERN_INFO "RAMDISK: [mem %#010llx-%#010llx]\n", ramdisk_image,
>  			ramdisk_end - 1);
>  
> -- 
> 2.26.2
> 

