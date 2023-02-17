Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D5C69A378
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 02:36:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHvXm4sW5z3f3B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 12:36:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jJrlPrrq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHvWs09HNz3bm9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 12:35:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jJrlPrrq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PHvWp0pQsz4x82;
	Fri, 17 Feb 2023 12:35:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676597719;
	bh=Mr5UOSzMz1dF6Hwpyx5WmT4Yp7+jw+UVJVzxUI67Y90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jJrlPrrqLIOcOrprv8svriZs0WsrN10uCdmke9m9QoWSY5OBgJKjBOzWqkwIO9e5n
	 0eYLjw5+WSDG6eQNtn8y3M4O0Rpj82s6Vitc/sIZLoOaLQPepDlzH0kO69krn+uQVQ
	 pF5QDgKdxvAB80hclDX96o2HRMN05YDMqniwaYg7jcOS0C4bZ/qXdiDO9DDfzDNrTy
	 rneoIYMZ+6f8cx+W1cEWGeGOh473fjPp4RMP9QjsIjLIbV4IgykjuX/whrVk2Wclpb
	 xdPIS37QfOPGZdrF93VNzXsJ8/uZnIeJYA6EhW48sM7JqvBmE5j0I/c2MySSH5jV3z
	 3iVh70GdxU/Jg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Josh Poimboeuf <jpoimboe@kernel.org>, Stephen Rothwell
 <sfr@canb.auug.org.au>, Sathvika Vasireddy <sv@linux.ibm.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: linux-next: build warning after merge of the powerpc tree
In-Reply-To: <20230216180607.w666rnbtm5fumziq@treble>
References: <20230216144031.45b1fc12@canb.auug.org.au>
 <20230216180607.w666rnbtm5fumziq@treble>
Date: Fri, 17 Feb 2023 12:35:17 +1100
Message-ID: <87k00hysyy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Peter Zijlstra <peterz@infradead.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Josh Poimboeuf <jpoimboe@kernel.org> writes:
> On Thu, Feb 16, 2023 at 02:40:31PM +1100, Stephen Rothwell wrote:
>> Hi all,
>> 
>> After merging the powerpc tree, today's linux-next build (powerpc
>> pseries_le_defconfig) produced this warning:
>> 
>> arch/powerpc/kernel/head_64.o: warning: objtool: .text+0x6128: unannotated intra-function call
>> 
>> I have no idea what caused this.
>
> Adding Sathvika and Christophe.
>
> The short term fix would be something like the below, but...
>
> If powerpc objtool is only doing mcount, does it even make sense to run
> objtool on asm files?  If so, there are probably a lot more cleanups
> needed for the asm code.

I would like to enable more of the objtool checks eventually, although I
don't have a timeline for that. But I'd prefer to keep checking the asm
code seeing as we've already enabled that.

> So I'm thinking either we should cleanup all the powerpc asm code with
> annotations like below, or we should try to make objtool mcount-mode
> ignore asm files.

I think we have most of the code annotated already, this is a new
warning because that code is newly refactored by a commit I applied.

I'll have to fix my build scripts to error out on objtool warnings.

cheers


> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
> index 3a7266fa8a18..1febb56ebaeb 100644
> --- a/arch/powerpc/kernel/head_64.S
> +++ b/arch/powerpc/kernel/head_64.S
> @@ -472,7 +472,7 @@ SYM_FUNC_START_LOCAL(__mmu_off)
>  	b	.	/* prevent speculative execution */
>  SYM_FUNC_END(__mmu_off)
>  
> -start_initialization_book3s:
> +SYM_FUNC_START_LOCAL(start_initialization_book3s)
>  	mflr	r25
>  
>  	/* Setup some critical 970 SPRs before switching MMU off */
> @@ -494,6 +494,7 @@ start_initialization_book3s:
>  
>  	mtlr	r25
>  	blr
> +SYM_FUNC_END(start_initialization_book3s)
>  #endif
>  
>  /*
