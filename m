Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9590D9DE1C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:32:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HfFF0XgKzDqMd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:32:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hf8f4RFLzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 16:28:50 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D72E8B0B6;
 Tue, 27 Aug 2019 06:28:45 +0000 (UTC)
Date: Tue, 27 Aug 2019 08:28:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH] powerpc: Perform a bounds check in arch_add_memory
Message-ID: <20190827062844.GQ7538@dhcp22.suse.cz>
References: <20190827052047.31547-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827052047.31547-1-alastair@au1.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Hildenbrand <david@redhat.com>, alastair@d-silva.org,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 27-08-19 15:20:46, Alastair D'Silva wrote:
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> It is possible for firmware to allocate memory ranges outside
> the range of physical memory that we support (MAX_PHYSMEM_BITS).

Doesn't that count as a FW bug? Do you have any evidence of that in the
field? Just wondering...

> This patch adds a bounds check to ensure that any hotplugged
> memory is addressable.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---
>  arch/powerpc/mm/mem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 9191a66b3bc5..de18fb73de30 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -111,6 +111,9 @@ int __ref arch_add_memory(int nid, u64 start, u64 size,
>  	unsigned long nr_pages = size >> PAGE_SHIFT;
>  	int rc;
>  
> +	if ((start + size - 1) >> MAX_PHYSMEM_BITS)
> +		return -EINVAL;
> +
>  	resize_hpt_for_hotplug(memblock_phys_mem_size());
>  
>  	start = (unsigned long)__va(start);
> -- 
> 2.21.0

-- 
Michal Hocko
SUSE Labs
