Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2E570804
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 19:58:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sq9R6xHwzDqJt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2019 03:58:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45spyd70dqzDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:49:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45spyd4gVbz8tXb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 03:49:29 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45spyd3NkJz9s8m; Tue, 23 Jul 2019 03:49:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45spyc0yy4z9sBZ
 for <linuxppc-dev@ozlabs.org>; Tue, 23 Jul 2019 03:49:27 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 73DB7ACD8;
 Mon, 22 Jul 2019 17:49:23 +0000 (UTC)
Date: Mon, 22 Jul 2019 19:49:23 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc: avoid adjusting memory_limit for capture
 kernel memory reservation
Message-ID: <20190722194923.4be2a1be@naga.suse.cz>
In-Reply-To: <156166327993.13320.10788410344711883330.stgit@hbathini.in.ibm.com>
References: <156166326909.13320.3330203549978146193.stgit@hbathini.in.ibm.com>
 <156166327993.13320.10788410344711883330.stgit@hbathini.in.ibm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Ananth N Mavinakayanahalli <ananth@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jun 2019 00:51:19 +0530
Hari Bathini <hbathini@linux.ibm.com> wrote:

> Currently, if memory_limit is specified and it overlaps with memory to
> be reserved for capture kernel, memory_limit is adjusted to accommodate
> capture kernel. With memory reservation for capture kernel moved later
> (after enforcing memory limit), this adjustment no longer holds water.
> So, avoid adjusting memory_limit and error out instead.

Can you split out the memory limit adjustment out of memory reservation
so it can still be adjusted?

Thanks

Michal
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump.c        |   16 ----------------
>  arch/powerpc/kernel/machine_kexec.c |   22 +++++++++++-----------
>  2 files changed, 11 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 4eab972..a784695 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -476,22 +476,6 @@ int __init fadump_reserve_mem(void)
>  #endif
>  	}
>  
> -	/*
> -	 * Calculate the memory boundary.
> -	 * If memory_limit is less than actual memory boundary then reserve
> -	 * the memory for fadump beyond the memory_limit and adjust the
> -	 * memory_limit accordingly, so that the running kernel can run with
> -	 * specified memory_limit.
> -	 */
> -	if (memory_limit && memory_limit < memblock_end_of_DRAM()) {
> -		size = get_fadump_area_size();
> -		if ((memory_limit + size) < memblock_end_of_DRAM())
> -			memory_limit += size;
> -		else
> -			memory_limit = memblock_end_of_DRAM();
> -		printk(KERN_INFO "Adjusted memory_limit for firmware-assisted"
> -				" dump, now %#016llx\n", memory_limit);
> -	}
>  	if (memory_limit)
>  		memory_boundary = memory_limit;
>  	else
> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
> index c4ed328..fc5533b 100644
> --- a/arch/powerpc/kernel/machine_kexec.c
> +++ b/arch/powerpc/kernel/machine_kexec.c
> @@ -125,10 +125,8 @@ void __init reserve_crashkernel(void)
>  		crashk_res.end = crash_base + crash_size - 1;
>  	}
>  
> -	if (crashk_res.end == crashk_res.start) {
> -		crashk_res.start = crashk_res.end = 0;
> -		return;
> -	}
> +	if (crashk_res.end == crashk_res.start)
> +		goto error_out;
>  
>  	/* We might have got these values via the command line or the
>  	 * device tree, either way sanitise them now. */
> @@ -170,15 +168,13 @@ void __init reserve_crashkernel(void)
>  	if (overlaps_crashkernel(__pa(_stext), _end - _stext)) {
>  		printk(KERN_WARNING
>  			"Crash kernel can not overlap current kernel\n");
> -		crashk_res.start = crashk_res.end = 0;
> -		return;
> +		goto error_out;
>  	}
>  
>  	/* Crash kernel trumps memory limit */
>  	if (memory_limit && memory_limit <= crashk_res.end) {
> -		memory_limit = crashk_res.end + 1;
> -		printk("Adjusted memory limit for crashkernel, now 0x%llx\n",
> -		       memory_limit);
> +		pr_err("Crash kernel size can't exceed memory_limit\n");
> +		goto error_out;
>  	}
>  
>  	printk(KERN_INFO "Reserving %ldMB of memory at %ldMB "
> @@ -190,9 +186,13 @@ void __init reserve_crashkernel(void)
>  	if (!memblock_is_region_memory(crashk_res.start, crash_size) ||
>  	    memblock_reserve(crashk_res.start, crash_size)) {
>  		pr_err("Failed to reserve memory for crashkernel!\n");
> -		crashk_res.start = crashk_res.end = 0;
> -		return;
> +		goto error_out;
>  	}
> +
> +	return;
> +error_out:
> +	crashk_res.start = crashk_res.end = 0;
> +	return;
>  }
>  
>  int overlaps_crashkernel(unsigned long start, unsigned long size)
> 

