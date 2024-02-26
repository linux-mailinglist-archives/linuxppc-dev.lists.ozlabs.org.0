Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFC78671E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:50:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rd4/QsRv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjy7L2X4Xz3vd8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Rd4/QsRv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tjy6Y4Gjfz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:49:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708944565;
	bh=Cn2xDNXWkCC0F1GWz1ZczujdAI4K+h1xeT2o4u1IWRk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Rd4/QsRvWBtrdProZoplXO/fbUiLEUJKHTsbbyYxAegHsyDyVD7+xOv4qwSpsqTEb
	 1LeCy3bDWRmPoLx/BSPpeeLFYwxmPrxo2+tgzNffX6BqObbGWscmyG6hS5U/n9g+8c
	 RRvUElATM4M5/UY+ue1FbbBWOLE+tsez1dHqcacQQPHgcdrHvw2TgJPBFfeSvUYBkl
	 XWVh/JS8VtyI1h8Tx4Su9uCJ5gLXoiYgCDxNUzdXMWCFJE9oiIMMVJZEU3y71/tOzM
	 atNcg08onRU/BEuP3mp3DUpFaODQ6jTacU6m4Ydwpn61Z019BmQUE7xUdyW5VNwubY
	 Fgt/1Z+fOMbDg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tjy6Y2gCnz4wcQ;
	Mon, 26 Feb 2024 21:49:24 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kunwu Chan <chentao@kylinos.cn>, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
Subject: Re: [PATCH] powerpc/mm: Code cleanup for __hash_page_thp
In-Reply-To: <20240125092624.537564-1-chentao@kylinos.cn>
References: <20240125092624.537564-1-chentao@kylinos.cn>
Date: Mon, 26 Feb 2024 21:49:23 +1100
Message-ID: <87h6hva4b0.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kunwu Chan <chentao@kylinos.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kunwu Chan <chentao@kylinos.cn> writes:
> This part was commented from commit 6d492ecc6489
> ("powerpc/THP: Add code to handle HPTE faults for hugepages")
> in about 11 years before.
>
> If there are no plans to enable this part code in the future,
> we can remove this dead code.

I agree the code can go. But I'd like it to be replaced with a comment
explaining what the dead code was trying to say.

cheers

> diff --git a/arch/powerpc/mm/book3s64/hash_hugepage.c b/arch/powerpc/mm/book3s64/hash_hugepage.c
> index c0fabe6c5a12..127a3a2c174b 100644
> --- a/arch/powerpc/mm/book3s64/hash_hugepage.c
> +++ b/arch/powerpc/mm/book3s64/hash_hugepage.c
> @@ -59,16 +59,6 @@ int __hash_page_thp(unsigned long ea, unsigned long access, unsigned long vsid,
>  
>  	rflags = htab_convert_pte_flags(new_pmd, flags);
>  
> -#if 0
> -	if (!cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
> -
> -		/*
> -		 * No CPU has hugepages but lacks no execute, so we
> -		 * don't need to worry about that case
> -		 */
> -		rflags = hash_page_do_lazy_icache(rflags, __pte(old_pte), trap);
> -	}
> -#endif
>  	/*
>  	 * Find the slot index details for this ea, using base page size.
>  	 */
> -- 
> 2.39.2
