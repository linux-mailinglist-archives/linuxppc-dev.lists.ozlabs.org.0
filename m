Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB9219F00
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 13:21:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Yf43ktFzDrCW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 21:21:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2YcD3NSkzDq9C
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 21:19:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o7Zn13YV; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B2YcB2P66z9s1x;
 Thu,  9 Jul 2020 21:19:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594293596;
 bh=dGEXXZrjz1Z84JNnKjB7T7gvF97Fo/wCVLXC7PO2vWs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o7Zn13YVTmdArBSvThw2v1J6IuZ1hE7jCtYMdh+DV7rALdtKJLjfVx6/uKpndSluA
 pAJvJ8/EWrpJT/Emx5EA4eQXTitJpvQ4ZI/NFlfjvHOrtzsR1IZY/xTLg3T2H6i2+Q
 M1iOD1CYug1qLcaL5ROrabf8tsgP4oRGtWJ9Trg9Y9oF6qHHwAlTddM5nJoc6R/ofs
 wRQT+VZ4UHFilJ1ggIn+SkhNDzsxu984P3EYCdd6WwShYItX9/H+t9gXn64MS9uiXR
 3fo8FwP5YRI/OrFEexPAlkCcKEBYsWfAvXqL0rrwd/RBVoqtOWPGy5eGn1wfU+n0lJ
 SEcquMooGUoBg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH 1/2] powerpc/vas: Report proper error for address
 translation failure
In-Reply-To: <f8af60fd4167c9c04ee5ab47147b9e95bcb3b9ff.camel@linux.ibm.com>
References: <f8af60fd4167c9c04ee5ab47147b9e95bcb3b9ff.camel@linux.ibm.com>
Date: Thu, 09 Jul 2020 21:22:10 +1000
Message-ID: <87y2ntue59.fsf@mpe.ellerman.id.au>
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
Cc: tulioqm@br.ibm.com, abali@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
 rzinsly@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> DMA controller uses CC=5 internally for translation fault handling. So
> OS should be using CC=250 and should report this error to the user space
> when NX encounters address translation failure on the request buffer.

That doesn't really explain *why* the OS must use CC=250.

Is it documented somewhere that 5 is for hardware use, and 250 is for
software?

> This patch defines CSB_CC_ADDRESS_TRANSLATION(250) and updates
> CSB.CC with this proper error code for user space.

We still have:

#define CSB_CC_TRANSLATION	(5)

And it's very unclear where one or the other should be used.

Can one or the other get a name that makes the distinction clear.

cheers


> diff --git a/Documentation/powerpc/vas-api.rst b/Documentation/powerpc/vas-api.rst
> index 1217c2f..78627cc 100644
> --- a/Documentation/powerpc/vas-api.rst
> +++ b/Documentation/powerpc/vas-api.rst
> @@ -213,7 +213,7 @@ request buffers are not in memory. The operating system handles the fault by
>  updating CSB with the following data:
>  
>  	csb.flags = CSB_V;
> -	csb.cc = CSB_CC_TRANSLATION;
> +	csb.cc = CSB_CC_ADDRESS_TRANSLATION;
>  	csb.ce = CSB_CE_TERMINATION;
>  	csb.address = fault_address;
>  
> diff --git a/arch/powerpc/include/asm/icswx.h b/arch/powerpc/include/asm/icswx.h
> index 965b1f3..b1c9a57 100644
> --- a/arch/powerpc/include/asm/icswx.h
> +++ b/arch/powerpc/include/asm/icswx.h
> @@ -77,6 +77,8 @@ struct coprocessor_completion_block {
>  #define CSB_CC_CHAIN		(37)
>  #define CSB_CC_SEQUENCE		(38)
>  #define CSB_CC_HW		(39)
> +/* User space address traslation failure */
> +#define	CSB_CC_ADDRESS_TRANSLATION	(250)
>  
>  #define CSB_SIZE		(0x10)
>  #define CSB_ALIGN		CSB_SIZE
> diff --git a/arch/powerpc/platforms/powernv/vas-fault.c b/arch/powerpc/platforms/powernv/vas-fault.c
> index 266a6ca..33e89d4 100644
> --- a/arch/powerpc/platforms/powernv/vas-fault.c
> +++ b/arch/powerpc/platforms/powernv/vas-fault.c
> @@ -79,7 +79,7 @@ static void update_csb(struct vas_window *window,
>  	csb_addr = (void __user *)be64_to_cpu(crb->csb_addr);
>  
>  	memset(&csb, 0, sizeof(csb));
> -	csb.cc = CSB_CC_TRANSLATION;
> +	csb.cc = CSB_CC_ADDRESS_TRANSLATION;
>  	csb.ce = CSB_CE_TERMINATION;
>  	csb.cs = 0;
>  	csb.count = 0;
> -- 
> 1.8.3.1
