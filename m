Return-Path: <linuxppc-dev+bounces-7673-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FDBA8AA1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 23:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zcchm1mGTz3bl6;
	Wed, 16 Apr 2025 07:28:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744737469;
	cv=none; b=ApFUtN50ZusLmZgL07Y+rMl6OxJaEFXmipg/bKESMXE7H9pAeHFpHrg7Tyk8ZBIm9yqldUGLkRH/vEiEifKLw+4LAPrhectvFgAl2nAoTlOwy4LvXXxVpfCw+sG66p2PyuW3vUfOkjvq8DbU3cUqTAkBU4T/4kOGGMqDaKK15Pz37mxESqAcXAOcnYfJUhgMAZQB1KdKsgmir75j2Knz/UuxmbUDzm04bXBI8MgC2rBU4NOyzgvp0i/YrFxStlmVCb9kpV3dRmm57nCCKisw0ndBd17s33oxT6il26weFhdgGf0+gsdn4nol44u94xQTclYjHcx16RCFJi3qgZXVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744737469; c=relaxed/relaxed;
	bh=OlbC+gGsedKsWiYVjB0QYl928YSZP6eIRB7xhX10ooY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWh6AJXvMOfHAzFGyzhGedi0rc02tNfCe5+BQC+sdJyzcr1+R8sX/CvxctE1Xk9lmJmw9Vd+NIl0ayjSnVF5aCOcVcny834i0dxp1f121JPMYG1+Tx2E0vso81hlJVwetfc2zsdwfEPOvMq4NAViGKK5COEHgj/o8B+FAG2sYDseLvciEHwEX0gP+N3ABGo56QqD1r7bp1vOQ8LODf2F8qrLJvF2/VBqZNuD61mCvUibjEkus5bEERvMPadXJszL68ZkpviGKHx/zpEZD33KDXaWFMEnTZLNLcDnEqr55/oyuqhdNBiPWQYfrKQnRsGlAegkUAvLRIsLebPw3tfF1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=qn8lLfmO; dkim-atps=neutral; spf=pass (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org) smtp.mailfrom=rosenzweig.io
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rosenzweig.io header.i=@rosenzweig.io header.a=rsa-sha256 header.s=key1 header.b=qn8lLfmO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rosenzweig.io (client-ip=91.218.175.182; helo=out-182.mta0.migadu.com; envelope-from=alyssa@rosenzweig.io; receiver=lists.ozlabs.org)
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcW7d0Mb4z2y34
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 03:17:48 +1000 (AEST)
Date: Tue, 15 Apr 2025 13:11:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744737071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OlbC+gGsedKsWiYVjB0QYl928YSZP6eIRB7xhX10ooY=;
	b=qn8lLfmOPA7UysVojoh0ZBXNQwgh4LGjjIaUhyWv9CJXRLvzsQWvTkJqxUZlKSPYfV9aMR
	X3L01sNDyguc/1kxeqojPT7rWxmMRe8erNDB9NLvpyMVJ3PiVvq8C2AfrpD2WagnrXAIOK
	eL6qf3/bDPVGncEVhbZdD8egszCaJyx6PiCp6k/R8rCCldUYBX9iIgdM1MQ2YOh0tMB+JY
	5OnLRhFz5CINve5TWHFfHHyyU3F25J9MJDHxrqgmUdGs4CfhPhPmZC9NU9RivSY2NSfORQ
	qUSYyCLKqqgjFw8z2nb3YU02YYCY6a9PjZAbO2CfoMZEbhwiXKOkz3vAQtbcgQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Hector Martin <marcan@marcan.st>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] i2c: pasemi: Sort includes alphabetically
Message-ID: <Z_6TK0WKxIK6_9-n@blossom>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250415-pasemi-fixes-v2-2-c543bf53151a@svenpeter.dev>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Tue , Apr 15, 2025 at 03:36:56PM +0000, Sven Peter via B4 Relay a écrit :
> From: Sven Peter <sven@svenpeter.dev>
> 
> No functional changes.
> 
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/i2c/busses/i2c-pasemi-core.c | 10 +++++-----
>  drivers/i2c/busses/i2c-pasemi-pci.c  | 10 +++++-----
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pasemi-core.c b/drivers/i2c/busses/i2c-pasemi-core.c
> index 71cc8cfc7c5cbf3924269f6217712d42008c03ff..df1b0087dcacb0a3b94196368137d5e20b0e6d7e 100644
> --- a/drivers/i2c/busses/i2c-pasemi-core.c
> +++ b/drivers/i2c/busses/i2c-pasemi-core.c
> @@ -6,15 +6,15 @@
>   */
>  
>  #include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/kernel.h>
> -#include <linux/stddef.h>
>  #include <linux/sched.h>
> -#include <linux/i2c.h>
> -#include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
> +#include <linux/stddef.h>
>  
>  #include "i2c-pasemi-core.h"
>  
> diff --git a/drivers/i2c/busses/i2c-pasemi-pci.c b/drivers/i2c/busses/i2c-pasemi-pci.c
> index 77f90c7436eda2df16afd7f1cac79355fb005bfd..b9ccb54ec77e22bb1b77848c858e2e0cc51db7e3 100644
> --- a/drivers/i2c/busses/i2c-pasemi-pci.c
> +++ b/drivers/i2c/busses/i2c-pasemi-pci.c
> @@ -5,15 +5,15 @@
>   * SMBus host driver for PA Semi PWRficient
>   */
>  
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> -#include <linux/kernel.h>
> -#include <linux/stddef.h>
>  #include <linux/sched.h>
> -#include <linux/i2c.h>
> -#include <linux/delay.h>
>  #include <linux/slab.h>
> -#include <linux/io.h>
> +#include <linux/stddef.h>
>  
>  #include "i2c-pasemi-core.h"
>  
> 
> -- 
> 2.34.1
> 
> 

