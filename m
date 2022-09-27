Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4895EC69D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:38:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMgM4xGJz3fYv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:38:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MOtxzu3Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMbz4ZmGz3f7y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:35:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MOtxzu3Q;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4McMby15FRz4x3w;
	Wed, 28 Sep 2022 00:35:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664289327;
	bh=UWxzGMQ9wLrUZe/HWPNAFfpFCGdiaXy8kMeH+LApu/c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MOtxzu3QNT9wNQFnE2dLYzyNrc+qt2UT7wT3HSspcZg29VNc/5GMr315CeNUXxBlQ
	 Lu2vGDxYToXvbHP/8E+bCJv+hYnDHhfic4uyK7nBvlziKQiceNTGsel7/sOcRs/ejJ
	 WaZWTtxw8DXRESZyDEHToeo8fQ8YEXG+iGHiqOVaYtx/7eJFAwykeAm4V9uNJ9TEgA
	 VV9OpL4qMyhyBCwOeip5NEkQ/QcwSdi6iArsH01EEybM2SCf24MzmpKPU91UKcliS1
	 PNqRZEtVMMw/P352iSbN8OHZ4DgYQcTa8aHYrohOtQHIHqmbA7ifkslU/kpzIibnA+
	 FSwQPgn5YX71A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: cgel.zte@gmail.com, benh@kernel.crashing.org
Subject: Re: [PATCH] powerpc/fsl_msi: fix return error value in error
 handing path
In-Reply-To: <20220425024149.3437751-1-lv.ruyi@zte.com.cn>
References: <20220425024149.3437751-1-lv.ruyi@zte.com.cn>
Date: Wed, 28 Sep 2022 00:35:25 +1000
Message-ID: <87edvwzxzm.fsf@mpe.ellerman.id.au>
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
Cc: maz@kernel.org, lv.ruyi@zte.com.cn, linux-kernel@vger.kernel.org, jgg@ziepe.ca, paulus@samba.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cgel.zte@gmail.com writes:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> This function fsl_msi_setup_hwirq() seems to return zero on success and
> non-zero on failure, but it returns zero in error handing path.

I agree it seems wrong, but I can't be sure the current code is wrong,
so unless you're able to test this on actual hardware (or qemu), I'll
drop this patch.

cheers

> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>  arch/powerpc/sysdev/fsl_msi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
> index b3475ae9f236..10f974cfa2f3 100644
> --- a/arch/powerpc/sysdev/fsl_msi.c
> +++ b/arch/powerpc/sysdev/fsl_msi.c
> @@ -353,7 +353,7 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_device *dev,
>  	if (!virt_msir) {
>  		dev_err(&dev->dev, "%s: Cannot translate IRQ index %d\n",
>  			__func__, irq_index);
> -		return 0;
> +		return -EINVAL;
>  	}
>  
>  	cascade_data = kzalloc(sizeof(struct fsl_msi_cascade_data), GFP_KERNEL);
> -- 
> 2.25.1
