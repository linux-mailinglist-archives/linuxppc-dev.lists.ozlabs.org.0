Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E306289C7F2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Apr 2024 17:16:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CYWjBrT3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VCt3l4ddnz3dWh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 01:16:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CYWjBrT3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VCt2y1TJ8z3cFN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 01:16:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ank4NMo0tMOsvsZKPxmhfr9ZiRm9h5CIvfJM5C8UMkw=; b=CYWjBrT3mgKQB/fI+Fy50FMMxh
	mrprDMPN3zNdYEN9H0lA/4wcDoClx7stMGrhAjQS4hkORYa2qup79ex7sfDdhLyNwXkHBdBw7QSbw
	Xzw5ytjmTtEB8EBdwF3M3LGP+g+5hhvma65zNyMc4NrkkbJG6RIXLaNmFiAU6VX5nZr9FnmLxKU8r
	dfoRmGwIMYYPvY2Bj7G65PoKWUBrSAYplWKos63LC9A7f7VImotpwdxI+Dq2hchC0VyFIGAB56A00
	p5fNaUp8rRhOAAmtSzqx+fOUdcNInov2dGPaMTJN6MLL4uN5+ZoMCDVVQvcu+U7M3insqoLzmwn/4
	80WrkbQA==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtqj2-0000000Fzyh-41mP;
	Mon, 08 Apr 2024 15:16:01 +0000
Message-ID: <e2ca307d-1d8a-49e9-b374-73ec50965464@infradead.org>
Date: Mon, 8 Apr 2024 08:15:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/3 v2] powerpc: Fix kernel-doc comments in
 fsl_gtm.c
To: Yang Li <yang.lee@linux.alibaba.com>, arnd@arndb.de, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org,
 naveen.n.rao@linux.ibm.com
References: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240408053109.96360-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/7/24 10:31 PM, Yang Li wrote:
> Fix some function names in kernel-doc comments.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  arch/powerpc/sysdev/fsl_gtm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/sysdev/fsl_gtm.c b/arch/powerpc/sysdev/fsl_gtm.c
> index 39186ad6b3c3..3dabc9621810 100644
> --- a/arch/powerpc/sysdev/fsl_gtm.c
> +++ b/arch/powerpc/sysdev/fsl_gtm.c
> @@ -77,7 +77,7 @@ struct gtm {
>  static LIST_HEAD(gtms);
>  
>  /**
> - * gtm_get_timer - request GTM timer to use it with the rest of GTM API
> + * gtm_get_timer16 - request GTM timer to use it with the rest of GTM API
>   * Context:	non-IRQ
>   *
>   * This function reserves GTM timer for later use. It returns gtm_timer
> @@ -110,7 +110,7 @@ struct gtm_timer *gtm_get_timer16(void)
>  EXPORT_SYMBOL(gtm_get_timer16);
>  
>  /**
> - * gtm_get_specific_timer - request specific GTM timer
> + * gtm_get_specific_timer16 - request specific GTM timer
>   * @gtm:	specific GTM, pass here GTM's device_node->data
>   * @timer:	specific timer number, Timer1 is 0.
>   * Context:	non-IRQ
> @@ -260,7 +260,7 @@ int gtm_set_timer16(struct gtm_timer *tmr, unsigned long usec, bool reload)
>  EXPORT_SYMBOL(gtm_set_timer16);
>  
>  /**
> - * gtm_set_exact_utimer16 - (re)set 16 bits timer
> + * gtm_set_exact_timer16 - (re)set 16 bits timer
>   * @tmr:	pointer to the gtm_timer structure obtained from gtm_get_timer
>   * @usec:	timer interval in microseconds
>   * @reload:	if set, the timer will reset upon expiry rather than

-- 
#Randy
