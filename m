Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 545AD8AE137
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 11:43:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e1qpEy+J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNxyQ74lqz3dRP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Apr 2024 19:43:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e1qpEy+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNxxk4Vrnz3dHw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Apr 2024 19:43:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C1ADCE0F20;
	Tue, 23 Apr 2024 09:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 286DCC2BD11;
	Tue, 23 Apr 2024 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713865382;
	bh=JomD2aOIsnSBb4Qp/oACFdxLfptkS+JPqCT2po23mPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1qpEy+JtP8lFPhzAoloalHtZtujpjse4kTiFU9lANljMbb9+Y8dBDMw8TgaXC1kS
	 qLl+vruEiLpGBmm+Pfrag4XHE6op23Qarn9YUtlACv7kWwnwNHQBUrA5+XkARbUke7
	 Ne/pFOfmae3zUp+C6FbTpUn9AB4JvukCSBi5igGeFoWK0ZKoKTTLzxfWm1i6BVZXdZ
	 nvonCMUm4XaxNQ30Cq9VI9YxTJijJlIk1JYtBYb/3HOJqiIZM4psjgSc/QpV66k0fs
	 jhGe1ZsDhiY6Eg7PoQUcZKtsJzYx7Ny3ylTsmn/vdho2qmjapRYxeTFnJV4rMoW3PW
	 AWdrDd11lZ+jQ==
Date: Tue, 23 Apr 2024 15:09:41 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v3 3/5] powerpc/64: Convert patch_instruction() to
 patch_u32()
Message-ID: <xjnc3usfjrn3pqitpvvs4fkackuzcrnguqmqm2otocnhtrxmux@cd4d7bsyoweq>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
 <20240325055302.876434-4-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325055302.876434-4-bgray@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 04:53:00PM +1100, Benjamin Gray wrote:
> This use of patch_instruction() is working on 32 bit data, and can fail
> if the data looks like a prefixed instruction and the extra write
> crosses a page boundary. Use patch_u32() to fix the write size.
> 
> Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO modules")
> Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> 
> ---
> 
> v2: * Added the fixes tag, it seems appropriate even if the subject does
>       mention a more robust solution being required.
> 
> patch_u64() should be more efficient, but judging from the bug report
> it doesn't seem like the data is doubleword aligned.

Asking again, is that still the case? It looks like at least the first 
fix below can be converted to patch_u64().

- Naveen

> ---
>  arch/powerpc/kernel/module_64.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
> index 7112adc597a8..e9bab599d0c2 100644
> --- a/arch/powerpc/kernel/module_64.c
> +++ b/arch/powerpc/kernel/module_64.c
> @@ -651,12 +651,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
>  	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
>  	desc = func_desc(addr);
>  	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
> -		if (patch_instruction(((u32 *)&entry->funcdata) + i,
> -				      ppc_inst(((u32 *)(&desc))[i])))
> +		if (patch_u32(((u32 *)&entry->funcdata) + i, ((u32 *)&desc)[i]))
>  			return 0;
>  	}
>  
> -	if (patch_instruction(&entry->magic, ppc_inst(STUB_MAGIC)))
> +	if (patch_u32(&entry->magic, STUB_MAGIC))
>  		return 0;
>  
>  	return 1;
> -- 
> 2.44.0
> 
