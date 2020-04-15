Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F31A927B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 07:29:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4929rx2d7MzDr2P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 15:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 628 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Apr 2020 15:27:33 AEST
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4929ps5xbvzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 15:27:33 +1000 (AEST)
Received: from MTA-06-3.privateemail.com (mta-06.privateemail.com
 [68.65.122.16])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id A2CC5807EF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 01:17:02 -0400 (EDT)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 0DD256003F;
 Wed, 15 Apr 2020 01:16:55 -0400 (EDT)
Received: from APP-05 (unknown [10.20.147.155])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id DFD0F6003D;
 Wed, 15 Apr 2020 05:16:54 +0000 (UTC)
Date: Wed, 15 Apr 2020 00:16:54 -0500 (CDT)
From: Christopher M Riedl <cmr@informatik.wtf>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <581069710.188209.1586927814880@privateemail.com>
In-Reply-To: <c88b13ede49744d81fdab32e037a7ae10f0b241f.1585233657.git.christophe.leroy@c-s.fr>
References: <c88b13ede49744d81fdab32e037a7ae10f0b241f.1585233657.git.christophe.leroy@c-s.fr>
Subject: Re: [RFC PATCH] powerpc/lib: Fixing use a temporary mm for code
 patching
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.2-Rev24
X-Originating-Client: open-xchange-appsuite
X-Virus-Scanned: ClamAV using ClamSMTP
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
Reply-To: Christopher M Riedl <cmr@informatik.wtf>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On March 26, 2020 9:42 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
>  
> This patch fixes the RFC series identified below.
> It fixes three points:
> - Failure with CONFIG_PPC_KUAP
> - Failure to write do to lack of DIRTY bit set on the 8xx
> - Inadequaly complex WARN post verification
> 
> However, it has an impact on the CPU load. Here is the time
> needed on an 8xx to run the ftrace selftests without and
> with this series:
> - Without CONFIG_STRICT_KERNEL_RWX		==> 38 seconds
> - With CONFIG_STRICT_KERNEL_RWX			==> 40 seconds
> - With CONFIG_STRICT_KERNEL_RWX + this series	==> 43 seconds
> 
> Link: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=166003
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/lib/code-patching.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index f156132e8975..4ccff427592e 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -97,6 +97,7 @@ static int map_patch(const void *addr, struct patch_mapping *patch_mapping)
>  	}
>  
>  	pte = mk_pte(page, pgprot);
> +	pte = pte_mkdirty(pte);
>  	set_pte_at(patching_mm, patching_addr, ptep, pte);
>  
>  	init_temp_mm(&patch_mapping->temp_mm, patching_mm);
> @@ -168,7 +169,9 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>  			(offset_in_page((unsigned long)addr) /
>  				sizeof(unsigned int));
>  
> +	allow_write_to_user(patch_addr, sizeof(instr));
>  	__patch_instruction(addr, instr, patch_addr);
> +	prevent_write_to_user(patch_addr, sizeof(instr));
> 

On radix we can map the page with PAGE_KERNEL protection which ends up
setting EAA[0] in the radix PTE. This means the KUAP (AMR) protection is
ignored (ISA v3.0b Fig. 35) since we are accessing the page from MSR[PR]=0.

Can we employ a similar approach on the 8xx? I would prefer *not* to wrap
the __patch_instruction() with the allow_/prevent_write_to_user() KUAP things
because this is a temporary kernel mapping which really isn't userspace in
the usual sense.
 
>  	err = unmap_patch(&patch_mapping);
>  	if (err)
> @@ -179,7 +182,7 @@ static int do_patch_instruction(unsigned int *addr, unsigned int instr)
>  	 * think we just wrote.
>  	 * XXX: BUG_ON() instead?
>  	 */
> -	WARN_ON(memcmp(addr, &instr, sizeof(instr)));
> +	WARN_ON(*addr != instr);
>  
>  out:
>  	local_irq_restore(flags);
> -- 
> 2.25.0
