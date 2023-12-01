Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D52BC800812
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 11:18:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mKl4ghrw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShTXg2Np3z3dH8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 21:18:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mKl4ghrw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShTWs5GTLz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 21:17:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701425849;
	bh=YDM8Y22Uw3soCEiLjFGP0Xjxg56+a/qHQ3QYMLfaxoE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mKl4ghrwdTD6YFAkhXpZeZdIY2tCvyKxhBS6fo49iNZ4/yKioR44Z+o5TfeX1/Dsv
	 usslLBDHOt6xZVpfmF8cmIAlKMQUO4V++8Ss0t57au0Vw1PQ2Zq/EBt2weHaAPjqgy
	 xUSirzcFpSWd7CisXNd+/ZoNtcn1VWPAsh/fYE6pjvdpTRDQKe5b0Ev7gCcp3v6FB1
	 BopG7o9YpZRvFKlriWcDZO8S+qd2Dft8vxs8rm4eHm21ZL14vEKt+qcW/NBRYJF2gd
	 G28DH3F1jjhsYIylMA+kTlNn6AjtePeS5lnvLzwLGNICWyYxgyLQfNFXvfU/AlnJKX
	 GknLhUEvHBVsQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ShTWs2kLFz4wx5;
	Fri,  1 Dec 2023 21:17:29 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kunwu Chan <chentao@kylinos.cn>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH v2] powerpc/mm: Fix null-pointer dereference in
 pgtable_cache_add
In-Reply-To: <20231130090953.2322490-1-chentao@kylinos.cn>
References: <20231130090953.2322490-1-chentao@kylinos.cn>
Date: Fri, 01 Dec 2023 21:17:28 +1100
Message-ID: <87cyvq1b2f.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>, kunwu.chan@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kunwu Chan <chentao@kylinos.cn> writes:
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
> v2: Use "panic" instead of "return"
> ---
>  arch/powerpc/mm/init-common.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
> index 119ef491f797..9788950b33f5 100644
> --- a/arch/powerpc/mm/init-common.c
> +++ b/arch/powerpc/mm/init-common.c
> @@ -139,6 +139,8 @@ void pgtable_cache_add(unsigned int shift)
>  
>  	align = max_t(unsigned long, align, minalign);
>  	name = kasprintf(GFP_KERNEL, "pgtable-2^%d", shift);
> +	if (!name)
> +		panic("Failed to allocate memory for order %d", shift);
>  	new = kmem_cache_create(name, table_size, align, 0, ctor(shift));
>  	if (!new)
>  		panic("Could not allocate pgtable cache for order %d", shift);

It would be nice to avoid two calls to panic. Can you reorganise the
logic so that there's only one? Initialising new to NULL might help.

cheers
