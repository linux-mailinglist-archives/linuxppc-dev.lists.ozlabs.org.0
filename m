Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2501016B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 06:56:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47HFSC32kvzDqLx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Nov 2019 16:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47HFP60ZPPzDqBr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 16:53:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="h7/kk6Zt"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47HFP53LRMzB3vv;
 Tue, 19 Nov 2019 16:53:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1574142809;
 bh=jb7dTqxFpJxsRgcQPIuEXZVSto0BIWmREranK2PFIr0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=h7/kk6ZtFkQRQlA/Ck8jL74zTQ3dP7YYzbWBluWN1D0Vc6khCLw6hNIb3fxTzOppr
 b0s726Vz/6B3Uc8qvoJLQJEpX0/qLY8v2XaG+TlH3mHSI9j8DtyUxvtgveq3KjfdGA
 D692bfxUswq69bu33cti14yfMyw7OSFlzw5uuIO7d6M2BPQ3pvEch/3iWWsTkkwZ1s
 s4XvgCDKSXFdzBZj7ub2HcAQorooC6S5PoueO+7b3qEbUohTko2T5qLgg7+U5/nhOu
 yl5Y09UN70Y+P0pQpdJ8lDVUcEEe0TdxjcbifQcZ1ipZqjI3CzTgO0BO0FB3gkawVC
 PeEu3/tSPr6QQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Chen Wandun <chenwandun@huawei.com>, tyreld@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mahesh@linux.vnet.ibm.com, paulus@samba.org
Subject: Re: [PATCH] powerpc/pseries: remove variable 'status' set but not used
In-Reply-To: <1573873650-62511-1-git-send-email-chenwandun@huawei.com>
References: <1573873650-62511-1-git-send-email-chenwandun@huawei.com>
Date: Tue, 19 Nov 2019 16:53:26 +1100
Message-ID: <87blt8csyx.fsf@mpe.ellerman.id.au>
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
Cc: chenwandun@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Chen Wandun <chenwandun@huawei.com> writes:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> arch/powerpc/platforms/pseries/ras.c: In function ras_epow_interrupt:
> arch/powerpc/platforms/pseries/ras.c:319:6: warning: variable status set but not used [-Wunused-but-set-variable]

Thanks for the patch.

But it almost certainly is wrong to not check the status.

It's calling firmware and just assuming that the call succeeded. It then
goes on to use the result that should have been written by firmware, but
is now potentially random junk.

So I'd much rather a patch to change it to check the status. 

> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index 1d7f973..4a61d0f 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -316,12 +316,11 @@ static irqreturn_t ras_hotplug_interrupt(int irq, void *dev_id)
>  /* Handle environmental and power warning (EPOW) interrupts. */
>  static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>  {
> -	int status;
>  	int state;
>  	int critical;
>  
> -	status = rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
> -				      &state);
> +	rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
> +			     &state);

This is calling a helper which already does some translation of the
return value, any value < 0 indicates an error.

> @@ -330,12 +329,12 @@ static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
>  
>  	spin_lock(&ras_log_buf_lock);
>  
> -	status = rtas_call(ras_check_exception_token, 6, 1, NULL,
> -			   RTAS_VECTOR_EXTERNAL_INTERRUPT,
> -			   virq_to_hw(irq),
> -			   RTAS_EPOW_WARNING,
> -			   critical, __pa(&ras_log_buf),
> -				rtas_get_error_log_max());
> +	rtas_call(ras_check_exception_token, 6, 1, NULL,
> +		  RTAS_VECTOR_EXTERNAL_INTERRUPT,
> +		  virq_to_hw(irq),
> +		  RTAS_EPOW_WARNING,
> +		  critical, __pa(&ras_log_buf),
> +		  rtas_get_error_log_max());

This is directly calling firmware.

As documented in LoPAPR, a negative status indicates an error, 0
indicates a new error log was found (ie. the function should continue),
or 1 there was no error log (ie. nothing to do).

cheers

>  	log_error(ras_log_buf, ERR_TYPE_RTAS_LOG, 0);
>  
> -- 
> 2.7.4
