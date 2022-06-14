Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5E454AEAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 12:46:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMlTn3Q7tz3cMr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 20:46:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KJBgz7Bt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMlTB46skz3bk5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 20:45:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=KJBgz7Bt;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LMlT5550Dz4xYC;
	Tue, 14 Jun 2022 20:45:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655203529;
	bh=RBj66p9m4fPiE+NiL5b1xNhjr+ADnO+uqrgDmOY6ZfU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KJBgz7Bti+zcSg0e6LuxnE3Y5fRvZA76Y4/AtP0VgEmK7oAUFmGkI6+3GGZPGNy9f
	 YPxzzLCr5nBrazEUeqTH2NDUL2+blZa+/+pis7e4Ai9fFUnn663h3hTCMlqt0+JWka
	 1Ti6vNKngXZVyDw+ZPoC+aXcs4UnmEuHXI5SvDcr+DgHINxJpi83CKXyLp8Ztvt+lW
	 TgtIhkmNKOc3pSTdt8ah4pBRRV5caZb1ROCRuR1fbdCfY7EamMhY11TXyyFmG5FpJR
	 fsuwA0f3mlWzMjBQjhgtwZMxaV6h8QfXv0st6Q6sK5+pap3mPTLIOvZlj3vWsofwX/
	 h59qHks79R3fw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Wang Wenhu <wenhu.wang@hotmail.com>, gregkh@linuxfoundation.org,
 christophe.leroy@csgroup.eu
Subject: Re: [PATCH 1/2] powerpc:mm: export symbol ioremap_coherent
In-Reply-To: <SG2PR01MB2951EBFD4C4EB2A2519FF4199FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB2951EBFD4C4EB2A2519FF4199FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
Date: Tue, 14 Jun 2022 20:45:25 +1000
Message-ID: <8735g7cym2.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wang Wenhu <wenhu.wang@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wang Wenhu <wenhu.wang@hotmail.com> writes:
> The function ioremap_coherent may be called by modules such as
> fsl_85xx_cache_sram. So export it for access in other modules.

ioremap_coherent() is powerpc specific, and only has one other caller,
I'd like to remove it.

Does ioremap_cache() work for you?

cheers

> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
> index 4f12504fb405..08a00dacef0b 100644
> --- a/arch/powerpc/mm/ioremap.c
> +++ b/arch/powerpc/mm/ioremap.c
> @@ -40,6 +40,7 @@ void __iomem *ioremap_coherent(phys_addr_t addr, unsigned long size)
>  		return iowa_ioremap(addr, size, prot, caller);
>  	return __ioremap_caller(addr, size, prot, caller);
>  }
> +EXPORT_SYMBOL(ioremap_coherent);
>  
>  void __iomem *ioremap_prot(phys_addr_t addr, unsigned long size, unsigned long flags)
>  {
> -- 
> 2.25.1
