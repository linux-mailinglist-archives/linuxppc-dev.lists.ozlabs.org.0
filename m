Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B11140BF99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 08:24:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8VY36mQKz303x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 16:24:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J32fU4DM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J32fU4DM; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8VXQ5qD4z2xtg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 16:23:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631687007;
 bh=OX7xdhXw/LWS+De8xHfJMHgXWTkdXqPckzGpuA4qs94=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=J32fU4DM+haP8inBOJO9ih1/rd27GQR5D6yNMUYCOF36iYFoPOiUNXIauZQV7ZTq0
 LmHJIQMsGh2uc1qwUSaOjHtJAgInyGlLdbNmJ26A6alj8ep0XJvVOuSBExGtnDcKC6
 EyZA7LSrlouE6pxSTHlEA1TBEePxzHFfIPxXY4oXo/sJquXoYpChcTsNPoR92/LFDI
 KjSKRhCU+JyMZL5CffwEkHE+o0dwYoP53Hdwl5qK0+PDYX2TKSkEzCsAe009iJWAku
 KVTIctSoo5isdkg84mMJnOjhvKjTg3kS19gbcRuV+bKtBfzmreGMXloRR1lQv0vnQB
 oiqrPw/WcK2qA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8VXH63QRz9sQt;
 Wed, 15 Sep 2021 16:23:27 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/powernv/flash: Check OPAL flash calls exist
 before using
In-Reply-To: <20210914101630.30613-1-hegdevasant@linux.vnet.ibm.com>
References: <20210914101630.30613-1-hegdevasant@linux.vnet.ibm.com>
Date: Wed, 15 Sep 2021 16:23:24 +1000
Message-ID: <87ilz2jr1f.fsf@mpe.ellerman.id.au>
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
> Currently only FSP based powernv systems supports firmware update
> interfaces. Hence check that the token OPAL_FLASH_VALIDATE exists
> before initalising the flash driver.
>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-flash.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
> index 7e7d38b17420..05490fc22fae 100644
> --- a/arch/powerpc/platforms/powernv/opal-flash.c
> +++ b/arch/powerpc/platforms/powernv/opal-flash.c
> @@ -520,6 +520,10 @@ void __init opal_flash_update_init(void)
>  {
>  	int ret;
>  
> +	/* Firmware update is not supported by firmware */
> +	if (!opal_check_token(OPAL_FLASH_VALIDATE))
> +		return;
> +

That will mean the following files no longer appear on BMC systems:

  /sys/firmware/opal/image
  /sys/firmware/opal/validate_flash
  /sys/firmware/opal/manage_flash
  /sys/firmware/opal/update_flash

Presumably those files don't actually work correctly, but are we sure
their mere existence isn't used by anything at all?

We've had trouble in the past where removing sysfs files breaks tools
unexpectedly, see smt_snooze_delay.

cheers
