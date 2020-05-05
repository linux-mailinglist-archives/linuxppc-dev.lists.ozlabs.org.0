Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2201C4C3A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 04:41:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GPB736JlzDqZT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 12:41:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GP8R2Lg4zDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 12:40:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49GP8Q4pVpz9sRf;
 Tue,  5 May 2020 12:40:06 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 20/28] powerpc: Make test_translate_branch()
 independent of instruction length
Date: Tue, 05 May 2020 12:40:06 +1000
Message-ID: <2254967.rLgCsJFhqv@townsend>
In-Reply-To: <20200501034220.8982-21-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-21-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I guess this could change if there were prefixed branch instructions, but there 
aren't so:

Reviewed-by: Alistair Popple <alistair@popple.id.au>

On Friday, 1 May 2020 1:42:12 PM AEST Jordan Niethe wrote:
> test_translate_branch() uses two pointers to instructions within a
> buffer, p and q, to test patch_branch(). The pointer arithmetic done on
> them assumes a size of 4. This will not work if the instruction length
> changes. Instead do the arithmetic relative to the void * to the buffer.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> ---
>  arch/powerpc/lib/code-patching.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/lib/code-patching.c
> b/arch/powerpc/lib/code-patching.c index 110f710500c8..5b2f66d06b1e 100644
> --- a/arch/powerpc/lib/code-patching.c
> +++ b/arch/powerpc/lib/code-patching.c
> @@ -569,7 +569,7 @@ static void __init test_branch_bform(void)
>  static void __init test_translate_branch(void)
>  {
>  	unsigned long addr;
> -	struct ppc_inst *p, *q;
> +	void *p, *q;
>  	struct ppc_inst instr;
>  	void *buf;
> 
> @@ -583,7 +583,7 @@ static void __init test_translate_branch(void)
>  	addr = (unsigned long)p;
>  	patch_branch(p, addr, 0);
>  	check(instr_is_branch_to_addr(p, addr));
> -	q = p + 1;
> +	q = p + 4;
>  	translate_branch(&instr, q, p);
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(q, addr));
> @@ -639,7 +639,7 @@ static void __init test_translate_branch(void)
>  	create_cond_branch(&instr, p, addr, 0);
>  	patch_instruction(p, instr);
>  	check(instr_is_branch_to_addr(p, addr));
> -	q = p + 1;
> +	q = buf + 4;
>  	translate_branch(&instr, q, p);
>  	patch_instruction(q, instr);
>  	check(instr_is_branch_to_addr(q, addr));




