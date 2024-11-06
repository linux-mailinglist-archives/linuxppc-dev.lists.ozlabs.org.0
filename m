Return-Path: <linuxppc-dev+bounces-2919-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7068D9BF10E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 16:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk7jV00nJz2xpx;
	Thu,  7 Nov 2024 02:02:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730905357;
	cv=none; b=cfi3Qqbs2y/4WEIrixSjSGN2flClKypmQzktKAIPwWnrWtEzuqjRTSImZz+XbjPJEDFmeJH04Io3zI5SCdguVH34teF8n8uK+SE8GKoV5q7j59PMp1oEcy4DJDAcgtfrhTA4n1TUk494MNYwEkXC3Tw2mHiwGiryc8/hd9SB6ejib3Jojo9/4/jKMRWEEQHaTo9EBT7QlZ4lere+4RQfSLE3tnaHuPREk1Q19RoZ/bQOXLaNw0tlezC7CiIi5Lcvohah0R4R3hCVVJHIzxWbXU/3iyQ2aFHrkph4VmGBslo6v5//aMosfVOBjnQNAkNTzCq5ti7rgbo6hbjrseVTNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730905357; c=relaxed/relaxed;
	bh=8d3CCVpUmgnVviB09dkZrgYB/F9ggmDhhNFE9v+2aN0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ohvdIC+CN7WnTHl4oUPP0oE/BoHkSt53pqpQHIVrNiz+naKPKomK8KLWMhdDjuk1AJMP9JnsBRhn0iGFe1Ln/cE9zQQ3Q/Fj8EBZoKZqULBZEVYwCbo0sC+fjOp3PA5rthh3L5j3z0gFdBFAENyoStYaCHmJxyzbM34gBBaAEAmLCmuuGgrfUDNbWS+RLkuMx9cEFOrEcgv9/YJK9Z837A6NXCjIX9MmV+Uxodgb5qnU6XeHd5heJkVOcL1QDDzUSEOXff4Et/51Ul3ev19ZZwevvtCaqjyeeJnv/SrPtZIBbEmVYUNx50IEFOeLaYDrZO+pHNGyW/fK8H/Sjkwi7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=m17k=sb=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=m17k=sb=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk7jS2HBcz2xBf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 02:02:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91CCEA43E8A;
	Wed,  6 Nov 2024 15:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 338F0C4CECC;
	Wed,  6 Nov 2024 15:02:31 +0000 (UTC)
Date: Wed, 6 Nov 2024 10:02:34 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Michael Ellerman
 <mpe@ellerman.id.au>, Naveen N Rao <naveen@kernel.org>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: linux-next: build failure after merge of the ftrace tree
Message-ID: <20241106100234.189029a5@gandalf.local.home>
In-Reply-To: <20241106140414.760b502c@canb.auug.org.au>
References: <20241106140414.760b502c@canb.auug.org.au>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 6 Nov 2024 14:04:14 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> After merging the ftrace tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/ftrace.h:23,
>                  from include/linux/kvm_host.h:32,
>                  from arch/powerpc/include/asm/kvm_ppc.h:19,
>                  from arch/powerpc/include/asm/dbell.h:17,
>                  from arch/powerpc/kernel/asm-offsets.c:36:
> arch/powerpc/include/asm/ftrace.h: In function 'arch_ftrace_set_direct_caller':
> arch/powerpc/include/asm/ftrace.h:141:38: error: invalid use of undefined type 'struct ftrace_regs'
>   141 |         struct pt_regs *regs = &fregs->regs;
>       |                                      ^~
> 
> Caused by commit
> 
>   7888af4166d4 ("ftrace: Make ftrace_regs abstract from direct use")
> 
> interacting with commit
> 
>   a52f6043a223 ("powerpc/ftrace: Add support for DYNAMIC_FTRACE_WITH_DIRECT_CALLS")
> 
> from the powerpc tree.
> 
> I have applied the following merge fix patch for today.
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 6 Nov 2024 13:33:53 +1100
> Subject: [PATCH] fix up for "ftrace: Make ftrace_regs abstract from direct use"
> 
> from the ftrace tree interacting with "powerpc/ftrace: Add support for
> DYNAMIC_FTRACE_WITH_DIRECT_CALLS" from the powerpc tree
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  arch/powerpc/include/asm/ftrace.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
> index bb2c90997618..db481b336bca 100644
> --- a/arch/powerpc/include/asm/ftrace.h
> +++ b/arch/powerpc/include/asm/ftrace.h
> @@ -138,7 +138,7 @@ unsigned long ftrace_call_adjust(unsigned long addr);
>   */
>  static inline void arch_ftrace_set_direct_caller(struct ftrace_regs *fregs, unsigned long addr)
>  {
> -	struct pt_regs *regs = &fregs->regs;
> +	struct pt_regs *regs = &arch_ftrace_regs(fregs)->regs;
>  

This fix looks fine to me. How should we handle this when we send our pull
requests to Linus? I may forgot about this issue, and it also matters who's
tree goes first.

-- Steve


>  	regs->orig_gpr3 = addr;
>  }


