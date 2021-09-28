Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D4B41A41B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 02:20:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJKrz1q0cz2yn2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 10:20:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=WY0WSjfK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=150.107.74.76; helo=gandalf.ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WY0WSjfK; 
 dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJKrM0BdTz2xWf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 10:19:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HJKrJ5M3zz4xLs;
 Tue, 28 Sep 2021 10:19:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1632788368;
 bh=mIwKTL/6vQf6UwYRTbvOgxIEqEcbaxe7nzUDzD7ufKk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WY0WSjfKEYV81l5c4MWdMF3j3Y/k5/zK/IffwOYcBARS5Iupu3Connde/bNmIDjee
 MTscRq5RVYLAcr/uJOiXlIp5qEsHZSHFqpeNoy1cF5oO1kN38XiCMbvMLOxEaDT4oZ
 kPH8eGG38SPEZ8l8fLYVT7d4UcWTtvYVOJv1pXtUa/FEOQrSEP+NSDpo2JsoVkz9fm
 TyVoxuMM5nwXiFJnr7yOW2JGsNgGvrFbTtQVnxGyQ2hLTdb+y4EMLmGe2n78StUyB2
 gp91MY21/yF1KPXSFDUoPj4q5lVPlkkiqOzTZqPm/lepPlkkEvL9ts+9H9R6fhcDBX
 B6ILLbR+5x6kg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/40x: Map 32Mbytes of memory at startup
In-Reply-To: <e2b142ad4a44535d5aa81b0c00c5f05f312f9097.1632738876.git.christophe.leroy@csgroup.eu>
References: <e2b142ad4a44535d5aa81b0c00c5f05f312f9097.1632738876.git.christophe.leroy@csgroup.eu>
Date: Tue, 28 Sep 2021 10:19:28 +1000
Message-ID: <87mtnx1rhr.fsf@mpe.ellerman.id.au>
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
Cc: cp <carlojpisani@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> As reported by Carlo, 16Mbytes is not enough with modern kernels
> that tend to be a bit big, so map another 16M page at boot.

I guess we're not expecting systems with less than 32MB, so making it
unconditional is OK?

cheers

> diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
> index 7d72ee5ab387..5fce4680d2d3 100644
> --- a/arch/powerpc/kernel/head_40x.S
> +++ b/arch/powerpc/kernel/head_40x.S
> @@ -650,7 +650,7 @@ start_here:
>  	b	.		/* prevent prefetch past rfi */
>  
>  /* Set up the initial MMU state so we can do the first level of
> - * kernel initialization.  This maps the first 16 MBytes of memory 1:1
> + * kernel initialization.  This maps the first 32 MBytes of memory 1:1
>   * virtual to physical and more importantly sets the cache mode.
>   */
>  initial_mmu:
> @@ -687,6 +687,12 @@ initial_mmu:
>  	tlbwe	r4,r0,TLB_DATA		/* Load the data portion of the entry */
>  	tlbwe	r3,r0,TLB_TAG		/* Load the tag portion of the entry */
>  
> +	li	r0,62			/* TLB slot 62 */
> +	addis	r4,r4,SZ_16M
> +	addis	r3,r3,SZ_16M
> +	tlbwe	r4,r0,TLB_DATA		/* Load the data portion of the entry */
> +	tlbwe	r3,r0,TLB_TAG		/* Load the tag portion of the entry */
> +
>  	isync
>  
>  	/* Establish the exception vector base
> -- 
> 2.31.1
