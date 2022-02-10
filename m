Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A234B0A94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 11:31:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JvY2065sKz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 21:31:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TCawh+Ud;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvY1M2sJnz3bP1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 21:30:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TCawh+Ud; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JvY1J0XpGz4xdh;
 Thu, 10 Feb 2022 21:30:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644489045;
 bh=/j80aUQlKa/S6QbooAK3y3Gg9NwGU+PKEkWBN3ktOAM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TCawh+Udct1RMjVH8ZU19XAOaHAEWi8UE1gSqYxtxWKCdRgozgSyMUWR+VA7h+4A3
 Y2Gyi5C40KuLmrAQqF/6A+MsFAN+YhOqhEfvn2Y+2ycFiYtPbcbTshYBObJyP8KJpD
 tNOxEYpjJyuyllbretPziOS745L4qVaZMOpvP4gCycccURrg7tABnvGHCU0WMDfdnc
 pPjeHrx9ubrYDqQVG9HhvZVJg0KptHYyoMC5QExkKEF4mRtdrzhg24JzeaTF3mQcwc
 2uscyDi9MUqhI1cZoTyihNTNMY8RpFcVwAawyAl3q5b1LQ+bP6NK6OGjQFoPNiLAgA
 c4imi8H1U2f+A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andrew
 Morton <akpm@linux-foundation.org>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 08/12] asm-generic: Refactor
 dereference_[kernel]_function_descriptor()
In-Reply-To: <93a2006a5d90292baf69cb1c34af5785da53efde.1634457599.git.christophe.leroy@csgroup.eu>
References: <cover.1634457599.git.christophe.leroy@csgroup.eu>
 <93a2006a5d90292baf69cb1c34af5785da53efde.1634457599.git.christophe.leroy@csgroup.eu>
Date: Thu, 10 Feb 2022 21:30:43 +1100
Message-ID: <8735kr814c.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> diff --git a/kernel/extable.c b/kernel/extable.c
> index b0ea5eb0c3b4..1ef13789bea9 100644
> --- a/kernel/extable.c
> +++ b/kernel/extable.c
> @@ -159,12 +160,32 @@ int kernel_text_address(unsigned long addr)
>  }
>  
>  /*
> - * On some architectures (PPC64, IA64) function pointers
> + * On some architectures (PPC64, IA64, PARISC) function pointers
>   * are actually only tokens to some data that then holds the
>   * real function address. As a result, to find if a function
>   * pointer is part of the kernel text, we need to do some
>   * special dereferencing first.
>   */
> +#ifdef CONFIG_HAVE_FUNCTION_DESCRIPTORS
> +void *dereference_function_descriptor(void *ptr)
> +{
> +	func_desc_t *desc = ptr;
> +	void *p;
> +
> +	if (!get_kernel_nofault(p, (void *)&desc->addr))
> +		ptr = p;
> +	return ptr;
> +}

This needs an EXPORT_SYMBOL_GPL(), otherwise the build breaks after
patch 10 with CONFIG_LKDTM=m.

cheers
