Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9630637F013
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 01:44:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgWbn431hz308p
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 09:44:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=I/GHXG8k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=I/GHXG8k; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgWbM1Yz2z2yR7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 09:44:14 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 807BC61404;
 Wed, 12 May 2021 23:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620863052;
 bh=Gtv9VLnumJVO5mDyJZiQa+w9qSyKKnczhWxlw7tq1e4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=I/GHXG8ky/cMUeJKmkz2aZc7+628hG4EIu4aOh60HvU0FbeXr7y+ky6YqJIRHVt27
 22VW3Eb/wV1pXuvpxLwxgSHk3pdDK8i/o6+G9RHt6hECYTlJeSjFwyXS/fvsqDil7N
 9mT8emk0szvUrVR7tsXq/pkiuLCq9p/WVCCxaQzrhELdg4bpMhi5ir89UvBOg1APTD
 kF6Nrw3O/W3jOnUyhp+5A4OiGZQonvnmfO34OOQtA05mjLX1tQf1Z5PHfrLlpZK4Bj
 saHgsA5qpMG+G7MNcuVKrqTdUIaY0huYeNHjf97YK4pa9InIFYAf5eEruwFODnyIYd
 nzoL3AV5IbggQ==
Date: Thu, 13 May 2021 08:44:09 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] powerpc/kprobes: Replace ppc_optinsn by common optinsn
Message-Id: <20210513084409.0172212de7f567605da9a336@kernel.org>
In-Reply-To: <46998c941d0a5664daaeb92998391aace015eddf.1620829724.git.christophe.leroy@csgroup.eu>
References: <472c597cc8cc8f74f037acf971f7799fb381a647.1620829724.git.christophe.leroy@csgroup.eu>
 <46998c941d0a5664daaeb92998391aace015eddf.1620829724.git.christophe.leroy@csgroup.eu>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, anil.s.keshavamurthy@intel.com,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 mhiramat@kernel.org, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 12 May 2021 14:29:27 +0000 (UTC)
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Commit 51c9c0843993 ("powerpc/kprobes: Implement Optprobes")
> implemented a powerpc specific version of optinsn in order
> to workaround the 32Mb limitation for direct branches.
> 
> Instead of implementing a dedicated powerpc version, use the
> common optinsn and override the allocation and freeing functions.
> 
> This also indirectly remove the CLANG warning about
> is_kprobe_ppc_optinsn_slot() not being use, and the powerpc will
> now benefit from commit 5b485629ba0d ("kprobes, extable: Identify
> kprobes trampolines as kernel text area")
> 

This looks good to me.

Acked-by: Masami Hiramatsu <mhiramat@kernel.org>

> Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/optprobes.c | 23 +++++------------------
>  1 file changed, 5 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
> index cdf87086fa33..a370190cd02a 100644
> --- a/arch/powerpc/kernel/optprobes.c
> +++ b/arch/powerpc/kernel/optprobes.c
> @@ -31,11 +31,9 @@
>  #define TMPL_END_IDX		\
>  	(optprobe_template_end - optprobe_template_entry)
>  
> -DEFINE_INSN_CACHE_OPS(ppc_optinsn);
> -
>  static bool insn_page_in_use;
>  
> -static void *__ppc_alloc_insn_page(void)
> +void *alloc_optinsn_page(void)
>  {
>  	if (insn_page_in_use)
>  		return NULL;
> @@ -43,20 +41,11 @@ static void *__ppc_alloc_insn_page(void)
>  	return &optinsn_slot;
>  }
>  
> -static void __ppc_free_insn_page(void *page __maybe_unused)
> +void free_optinsn_page(void *page)
>  {
>  	insn_page_in_use = false;
>  }
>  
> -struct kprobe_insn_cache kprobe_ppc_optinsn_slots = {
> -	.mutex = __MUTEX_INITIALIZER(kprobe_ppc_optinsn_slots.mutex),
> -	.pages = LIST_HEAD_INIT(kprobe_ppc_optinsn_slots.pages),
> -	/* insn_size initialized later */
> -	.alloc = __ppc_alloc_insn_page,
> -	.free = __ppc_free_insn_page,
> -	.nr_garbage = 0,
> -};
> -
>  /*
>   * Check if we can optimize this probe. Returns NIP post-emulation if this can
>   * be optimized and 0 otherwise.
> @@ -136,7 +125,7 @@ NOKPROBE_SYMBOL(optimized_callback);
>  void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
>  {
>  	if (op->optinsn.insn) {
> -		free_ppc_optinsn_slot(op->optinsn.insn, 1);
> +		free_optinsn_slot(op->optinsn.insn, 1);
>  		op->optinsn.insn = NULL;
>  	}
>  }
> @@ -203,14 +192,12 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
>  	unsigned long nip, size;
>  	int rc, i;
>  
> -	kprobe_ppc_optinsn_slots.insn_size = MAX_OPTINSN_SIZE;
> -
>  	nip = can_optimize(p);
>  	if (!nip)
>  		return -EILSEQ;
>  
>  	/* Allocate instruction slot for detour buffer */
> -	buff = get_ppc_optinsn_slot();
> +	buff = get_optinsn_slot();
>  	if (!buff)
>  		return -ENOMEM;
>  
> @@ -297,7 +284,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
>  	return 0;
>  
>  error:
> -	free_ppc_optinsn_slot(buff, 0);
> +	free_optinsn_slot(buff, 0);
>  	return -ERANGE;
>  
>  }
> -- 
> 2.25.0
> 


-- 
Masami Hiramatsu <mhiramat@kernel.org>
