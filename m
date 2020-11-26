Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB22C4DB9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 04:18:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ChNHx1ZthzDr7Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 14:18:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChNGJ5BBGzDr4r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 14:16:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LRJN31j8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4ChNGJ2vkRz9sSs;
 Thu, 26 Nov 2020 14:16:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606360616;
 bh=OvywidC2JU4DFXtMYgNBVBYBIK5Phig7Ow+Iydm5SlM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LRJN31j8UShdJvJMxUlMrJLBmzsJmoir+IT/fjbgenAyDc8LnvPQadaE/AHhVG/xx
 E9TCIKziSk+/UazzWCPjAfBLPjConSOVGBTWCQSE7qVV/QJJKhlr3db/de8cHDHrEa
 gFV8W6x6nRt68GUvR3xH82chYHJr0eUjz3xBJjfOafUqDLJx5BiJ09Jr9KnG+Fi2Zx
 z5JccytfK2tSxwADzTSCvcZdc9AJLmTg2ATpYVndMsJvWLM0BzvvQ4m32f8oM0GT9V
 crCcPJ7KOiLD082qsDi5pNUEwJcsexG45Yn70j+UJ7zli7Oe3TwkO8EQy/ryes3fye
 vJSoy98LeOWyg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 07/22] powerpc/book3s64/kuap: Rename MMU_FTR_RADIX_KUAP
 to MMU_FTR_KUAP
In-Reply-To: <20201125051634.509286-8-aneesh.kumar@linux.ibm.com>
References: <20201125051634.509286-1-aneesh.kumar@linux.ibm.com>
 <20201125051634.509286-8-aneesh.kumar@linux.ibm.com>
Date: Thu, 26 Nov 2020 14:16:55 +1100
Message-ID: <875z5szu1k.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
> index 255a1837e9f7..f5c7a17c198a 100644
> --- a/arch/powerpc/include/asm/mmu.h
> +++ b/arch/powerpc/include/asm/mmu.h
> @@ -28,6 +28,11 @@
>   * Individual features below.
>   */
>  
> +/*
> + * Supports KUAP (key 0 controlling userspace addresses) on radix
> + */

That comment needs updating.

I think this feature now means we have either key 0 controlling uaccess
on radix OR we're using the AMR to manually implement KUAP.

> +#define MMU_FTR_KUAP			ASM_CONST(0x00000200)

I agree with Christophe that this name is now too generic.

With that name one would expect it to be enabled on the 32-bit CPUs that
implement KUAP.

Maybe MMU_FTR_BOOK3S_KUAP ?


If in future the other MMUs want an MMU feature for KUAP then we could
rename it to MMU_FTR_KUAP, but we'd need to be careful with ifdefs to
make sure it guards the right things.

cheers
