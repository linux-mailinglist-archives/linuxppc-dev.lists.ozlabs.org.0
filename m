Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 334861A0EF0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:12:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xTrL03wTzDr6B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 00:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.67; helo=mail-wr1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xTXg6bpMzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 23:58:59 +1000 (AEST)
Received: by mail-wr1-f67.google.com with SMTP id a25so4064807wrd.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 06:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7oMqieg8pNA5U1Gqo/zdJwJNHWJR141xdDvdPejtqTI=;
 b=a6Cn2CDj5E4VDtYtJWJ7HMkVzCOl26rE8Lsv5XsWm2rKn9LejWZuF4RyJTLjbRf3W+
 4/PvSMDkn9AbNtYMoFXqcxAKb1f15XRLwuEIwV8ZDoGCKHQACJCnEs3LvuYevdF2LVZz
 eDE9jk4AMX8Nj/CmItDWvvqbewP3hR0vA90lTrq9RpyGFoZPZcS/Nl1nSvp/NFjeaykC
 ROGcm5oVnxt3qAubAgeLdY2e2N6UcgzoHaYIFL6Qs9TE5cXJyTNjPijBdpqhOArKWOxK
 l+UBLK767GEOMkWej3gdwWjuBKd8l4rWkz68aUp4ou1UP8ArpdVFPLGiGH66t2So35Ci
 BLtQ==
X-Gm-Message-State: AGi0PuYf2SCtxH/+6NBdjrdYZD4vHzDKXBZTrEg+cl8LQRFrF260sqaN
 U8AGnlaJm9dqBPtQ9To/cj8=
X-Google-Smtp-Source: APiQypIdi/9iwz570aPHnT8xTis1j6JkFOGqdxShbVn1+GBG3wNO5p8MwoE4Mp2kP0hFvEiBaR1e7w==
X-Received: by 2002:adf:bbc5:: with SMTP id z5mr2992228wrg.168.1586267935643; 
 Tue, 07 Apr 2020 06:58:55 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id v186sm2357359wme.24.2020.04.07.06.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 06:58:54 -0700 (PDT)
Date: Tue, 7 Apr 2020 15:58:53 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
Message-ID: <20200407135853.GQ18914@dhcp22.suse.cz>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407135416.24093-2-david@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 07-04-20 15:54:15, David Hildenbrand wrote:
> In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
> blocks as removable"), the user space interface to compute whether a memory
> block can be offlined (exposed via
> /sys/devices/system/memory/memoryX/removable) has effectively been
> deprecated. We want to remove the leftovers of the kernel implementation.
> 
> When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
> we'll start by:
> 1. Testing if it contains any holes, and reject if so
> 2. Testing if pages belong to different zones, and reject if so
> 3. Isolating the page range, checking if it contains any unmovable pages
> 
> Using is_mem_section_removable() before trying to offline is not only racy,
> it can easily result in false positives/negatives. Let's stop manually
> checking is_mem_section_removable(), and let device_offline() handle it
> completely instead. We can remove the racy is_mem_section_removable()
> implementation next.
> 
> We now take more locks (e.g., memory hotplug lock when offlining and the
> zone lock when isolating), but maybe we should optimize that
> implementation instead if this ever becomes a real problem (after all,
> memory unplug is already an expensive operation). We started using
> is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
> Implement memory hotplug remove in the kernel"), with the initial
> hotremove support of lmbs.

I am not familiar with this code but it makes sense to make it sync with
the global behavior.

> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  .../platforms/pseries/hotplug-memory.c        | 26 +++----------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index b2cde1732301..5ace2f9a277e 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -337,39 +337,19 @@ static int pseries_remove_mem_node(struct device_node *np)
>  
>  static bool lmb_is_removable(struct drmem_lmb *lmb)
>  {
> -	int i, scns_per_block;
> -	bool rc = true;
> -	unsigned long pfn, block_sz;
> -	u64 phys_addr;
> -
>  	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
>  		return false;
>  
> -	block_sz = memory_block_size_bytes();
> -	scns_per_block = block_sz / MIN_MEMORY_BLOCK_SIZE;
> -	phys_addr = lmb->base_addr;
> -
>  #ifdef CONFIG_FA_DUMP
>  	/*
>  	 * Don't hot-remove memory that falls in fadump boot memory area
>  	 * and memory that is reserved for capturing old kernel memory.
>  	 */
> -	if (is_fadump_memory_area(phys_addr, block_sz))
> +	if (is_fadump_memory_area(lmb->base_addr, memory_block_size_bytes()))
>  		return false;
>  #endif
> -
> -	for (i = 0; i < scns_per_block; i++) {
> -		pfn = PFN_DOWN(phys_addr);
> -		if (!pfn_in_present_section(pfn)) {
> -			phys_addr += MIN_MEMORY_BLOCK_SIZE;
> -			continue;
> -		}
> -
> -		rc = rc && is_mem_section_removable(pfn, PAGES_PER_SECTION);
> -		phys_addr += MIN_MEMORY_BLOCK_SIZE;
> -	}
> -
> -	return rc;
> +	/* device_offline() will determine if we can actually remove this lmb */
> +	return true;
>  }
>  
>  static int dlpar_add_lmb(struct drmem_lmb *);
> -- 
> 2.25.1

-- 
Michal Hocko
SUSE Labs
