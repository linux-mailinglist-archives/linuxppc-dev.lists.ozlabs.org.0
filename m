Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0627FECD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 11:29:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4y/Gau+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgsrD1fN0z3d9Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 21:29:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s4y/Gau+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgsqK1tS1z3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 21:28:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19FB861548;
	Thu, 30 Nov 2023 10:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449ACC433C8;
	Thu, 30 Nov 2023 10:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701340118;
	bh=1EQgnDNT+TQMvA0AnZejEMWOumg6NAALSYOq9V/eeik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s4y/Gau+9pxse5eu51a44OuL3c/k/XN8KllCB8FyC5o0NuGp0zJeEdBBAEUjEVtvi
	 9BfpjKbsz2hVL2vd6t9Hah6Qsb1FU8gd55bId2IwN7JIuy0Gkgs1SHjb8mJB4+8NHm
	 qW4Ms6ih3LIjATWJyR9UeuvRGH5dBx98s0qSiHa09ks/5IWHmisyyIgeAwBR8K3TwM
	 LOf0uwoOabEGznntlzY+RsfAjANZPtzDH5tkzfAntIHnZ+bKGmc6wN47UYEAa6ddqZ
	 fp+MtZfpl0H0JB2HaZU/1y50u9wyDCGZnJbMzB73J5EPrcNO2ibZD86RhTUvh1u7lA
	 l2EP4dz/sa4Jg==
Date: Thu, 30 Nov 2023 15:55:21 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/code-patching: Add generic memory patching
Message-ID: <fwqfsxpnjoa5fjsvizu6nud4joa3btnzthrb6e5h4w6eplcfxu@oezlh56opyah>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
 <20231016050147.115686-2-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016050147.115686-2-bgray@linux.ibm.com>
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

On Mon, Oct 16, 2023 at 04:01:45PM +1100, Benjamin Gray wrote:
> patch_instruction() is designed for patching instructions in otherwise
> readonly memory. Other consumers also sometimes need to patch readonly
> memory, so have abused patch_instruction() for arbitrary data patches.
> 
> This is a problem on ppc64 as patch_instruction() decides on the patch
> width using the 'instruction' opcode to see if it's a prefixed
> instruction. Data that triggers this can lead to larger writes, possibly
> crossing a page boundary and failing the write altogether.
> 
> Introduce patch_uint(), and patch_ulong(), with aliases patch_u32(), and
> patch_u64() (on ppc64) designed for aligned data patches. The patch
> size is now determined by the called function, and is passed as an
> additional parameter to generic internals.
> 
> While the instruction flushing is not required for data patches, the
> use cases for data patching (mainly module loading and static calls)
> are less performance sensitive than for instruction patching
> (ftrace activation).

That's debatable. While it is nice to be able to activate function 
tracing quickly, it is not necessarily a hot path. On the flip side, I 
do have a use case for data patching for ftrace activation :)

> So the instruction flushing remains unconditional
> in this patch.
> 
> ppc32 does not support prefixed instructions, so is unaffected by the
> original issue. Care is taken in not exposing the size parameter in the
> public (non-static) interface, so the compiler can const-propagate it
> away.
> 
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> 
> ---
> 
> v2: * Deduplicate patch_32() definition
>     * Use u32 for val32
>     * Remove noinline
> ---
>  arch/powerpc/include/asm/code-patching.h | 33 ++++++++++++
>  arch/powerpc/lib/code-patching.c         | 66 ++++++++++++++++++------
>  2 files changed, 83 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
> index 3f881548fb61..7c6056bb1706 100644
> --- a/arch/powerpc/include/asm/code-patching.h
> +++ b/arch/powerpc/include/asm/code-patching.h
> @@ -75,6 +75,39 @@ int patch_branch(u32 *addr, unsigned long target, int flags);
>  int patch_instruction(u32 *addr, ppc_inst_t instr);
>  int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
>  
> +/*
> + * patch_uint() and patch_ulong() should only be called on addresses where the
> + * patch does not cross a cacheline, otherwise it may not be flushed properly
> + * and mixes of new and stale data may be observed. It cannot cross a page
> + * boundary, as only the target page is mapped as writable.

Should we enforce alignment requirements, especially for patch_ulong() 
on 64-bit powerpc? I am not sure if there are use cases for unaligned 
64-bit writes. That should also ensure that the write doesn't cross a 
cacheline.

> + *
> + * patch_instruction() and other instruction patchers automatically satisfy this
> + * requirement due to instruction alignment requirements.
> + */
> +
> +#ifdef CONFIG_PPC64
> +
> +int patch_uint(void *addr, unsigned int val);
> +int patch_ulong(void *addr, unsigned long val);
> +
> +#define patch_u64 patch_ulong
> +
> +#else
> +
> +static inline int patch_uint(u32 *addr, unsigned int val)

Is there a reason to use u32 * here?

> +{
> +	return patch_instruction(addr, ppc_inst(val));
> +}
> +
> +static inline int patch_ulong(void *addr, unsigned long val)
> +{
> +	return patch_instruction(addr, ppc_inst(val));
> +}
> +
> +#endif
> +
> +#define patch_u32 patch_uint
> +
>  static inline unsigned long patch_site_addr(s32 *site)
>  {
>  	return (unsigned long)site + *site;
> diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
> index b00112d7ad46..60289332412f 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -20,15 +20,14 @@
>  #include <asm/code-patching.h>
>  #include <asm/inst.h>
>  
> -static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
> +static int __patch_memory(void *exec_addr, unsigned long val, void *patch_addr,
> +			  bool is_dword)
>  {
> -	if (!ppc_inst_prefixed(instr)) {
> -		u32 val = ppc_inst_val(instr);
> +	if (!IS_ENABLED(CONFIG_PPC64) || likely(!is_dword)) {
> +		u32 val32 = val;

Would be good to add a comment indicating the need for this for BE.

- Naveen

